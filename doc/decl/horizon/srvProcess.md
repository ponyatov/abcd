# srvProcess

- root component:
	- loads configuration from [[config.json]]
	- creates and manages [[decl/horizon/srvService|srvService]] instances for each service defined

```decl
use srvService

const BUS_NAMES_LIST = ['sysBus', 'logBus', 'mdbBus', 'dataBus'];

class ClassProcessSrv: srvService.ClassBaseService_S {
	busList
	node
	SourcesState = {}
	ServicesState = {}

	// @param busList список шин, созданных в проекте
	init busList node {
		super process_name BUS_NAMES_LIST busList node
		self.Init
	}
	
	Init {
		for bus in BUS_NAMES_LIST {
			self.CreateBus bus }
		config = load ./app/config.json
		for sysservice in config.Primary {
			servName = sysservice.Name
			ServicesState[servName] = sysservice
			let ServicesState[servName].Service = match servName
			| 'process' ->  self
			| _ -> sysservice.Module (busList, node) sysservice.Options
		}
		self.EmitEvents_process_init0
		timeout PROCESS_DB_TIMEOUT {
            let arrSources   = use app/Sources
            let arrServices  = use app/Services
            let arrTemplates = use app/Templates
            let arrChannels  = use app/Channels
            
            this.Fill arrServices arrSources arrTemplates arrChannels
			
		}
	}
	
	// Запускает событие init-stage0
	EmitEvents_process_init0 {
		const msg {
            com: 'providermdb-init-stage0-set',
            dest: 'providermdb',
            demandRes: true,
            resCom: 'providermdb-init-stage0-get',
            arg: [],
            value: []
		}
		self ! 'mdbBus', msg.com, msg
	}
	
	// Запускает событие init-stage1
	EmitEvents_all_init_stage1 {
		const msg {
            dest: 'all',
            com: 'all-init-stage1-set',
            arg: { SourcesState, ServicesState }
        }
        self ! 'sysBus', msg.com, msg
	}
}
```
- [[decl/horizon/srvService|srvService]]
- [[providermdb]]

## события

@ mdbBus
	- init-stage0
- @ sysBus
	- init-stage1 
	- all-connect
	- all_disconnect
	- test_connect

## Fill

[[decl/core/lambda]]

```decl
class ClassProcessSrv {
	// Заполняет служебные контейнеры
	// по полученным из БД массивам источников и служб
	Fill _dbServices, _dbSources, _dbTemplates, _dbChannels {
		config = (load ./app/config.json).Auxilary

		// Обновляем основные службы
		for service in _dbServices {
			match service.Importance, service.Protocol
			| primary, _ ->
				service.Service = ServicesState[service.Name].Service
					?? fail 'Primary service {service.Name} is not initialized'
					
			| auxilary, sys ->
				service.Service = config[service.Name] (busList, node)
					?? fail 'Failed to start auxilary service {service.Name}'
				
		}
		
		// Заполняем источники
		for source in _dbSources {
			const protocol = source.Protocol.lower
			for service in _dbServices when service.Protocol == protocol {
				_GBusList[service.PrimaryBus] ?= CreateBus service.PrimaryBus
				service.Service = config[service.Name] (busList, node)
				_ServicesState[service.Name] = service
				if service.Importance == exploitary & !_ServicesState[service.AdvancedOptions.host] {
					let hostService = _dbServices
						.first { host | host.Name == service.AdvancedOptions.host }
					_GBusList[hostService.PrimaryBus] ?= CreateBus hostService.PrimaryBus
				}
			}
		}
		
		// Создаём каналы
		for channel in _dbChannels {}
		
		// Ждём, тогда создадутся службы
		timer PROCESS_BUS_TIMEOUT {
		}
	}
}
```
