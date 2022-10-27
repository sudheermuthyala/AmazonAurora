## RDS VS Aurora PostgreSQL

Topics
- Storage & Read Replicas
- High avaliability & DR (disaster recovery)
- Backup

Highlevel COnparison

# RDS PostgreSQL vs Aurora PostgreSQl
- Both are Managed Databases
    - PostgreSQL is Same As the Community Edition
    - Aurora is Bult on the Top Of the community Edition 
    - Major archeticture chainges Applyed to The storage layer  

# Storage 
RDS PostgreSQL 
- RDS PostgreSQL Uses Amazon Elastic Block Storage (EBS)
- All Data as well as logs are managed on the EBS Volume are attached to the instance 
- inherently an EBS volume is Locallised to a single-AZ and cannot be shared to multiple ec2-instances 

Aurora PostgreSQL
- Aurora storage on other Hand Purpose Bult Distibuted Storage inherently replicated 3-AZ
- Aurora Stprage is fundamentale Different than the Block Storage use that RDS PostgreSQL 
- The Aurora Storage is DataBase aware that is it understand the PostgreSQL,Database,Blocks And Pages And is tuned for io optimization for postgreSQL Databases 

# Storage (RDS PostgreSQL)
| No       | RDS PostgreSQL | Aurora PostgreSQL | 
| :------- | :--------- | :---------------- | 
| 1        | RDS postgreSQL grow upto Max Size 64TiB | Aurora postgreSQL  grow upto Max Size 128TiB |
| 2        | The sotorage RDS Scales UP Automatically 5GIB or 10% of size | Aurora postgreSQL Scales up Chunks of 10 GIB |
| 3        | IOPS* 1,000 - 80,000 | Aurora postgreSQL  There is IOPS* NO Upper limit |
| 4        | RDS postgreSQL grow upto Max Size 64TiB | Aurora postgreSQL  grow upto Max Size 128TiB |

# Replication 
RDS PostgreSQL
- When a red Replica is Added to RDS and that covers RDS sets up asynchronous postgreSQL Streaming Replication Between the primary and Rader Instances
- Max of 5 READ replica can be set up for an RDS Postgres Data base Instance

Aurora PostgreSQL
- On the other hand replicas in the Aurora Database cluster Share the Storage volume in other words Aurora does not Depend on the postgreSQL Streaming Replication All of the replication occurst the storage tiar henc extreamly eficentand it does not put any lode on compute resources or datebase Ec2 instances
- Aurora Supports 15 read Replica

# Read Replication comparsion 

| No       | RDS PostgreSQL | Aurora PostgreSQL | 
| :------- | :---------     | :---------------- | 
| 1        | RDS uses Streaming Replication | Aurora shared storage Tier Between the primary and read Replicas |
| 2        | Replication lag in case of RDS in orde of sec in worst case it can be 30sec also  | Where as the lag in case of Aurora Lag < 100 ms  |
| 3        | RDS supports 5 Read Replicas | Aurora supports 15 Read Replicas |
| 4        | RDS supports cross reagion replicas | where in case of Aurora or replicasneed to be in same regionas as they shared the storage volume spred acrose the AZ with in the region |

# Disaster recovery cross reagion replication 
- **RDS:-** RDS postGres Supports Cross Region Read replicas
- **Aurora:-** with Aurora Database there is no support for cross reagion Replication but it supports it by way of Global Aurora Database

## RDS FailOver
- For High Availability RDS postgres may be set up in multy AZ mode and RDS Database set up one standby instance and one primary instance acrose 2AZ's is refer to the multy az's instances Deployment
- In case of Failover of Primary instances RDS automaticaly failover stand by instance this failover is can be planed failover
- In such a setup, the standby instance cannot be used for raids.
- If there are more than one standby instances in the multy AZ setup  then the setup is refered to be as the multi-agency cluster deployment
- in case of failure of primary instance or due to a request for manual failover partiers promotes one of these standby instances to become the primary instance in the setup 
- in this setup standby instance can be used as read replicas

Failover 

| No       | RDS PostgreSQL | Aurora PostgreSQL | 
| :------- | :---------     | :---------------- | 
| 1        | RDS supports failover by way of Muty AZ instance or cluster setepup | Where as Read Replicas in case of aurora are a taraget for a failover |
| 2        | Failover takes 60-120 sec  | In the case of aurora where it takes roughle 30sec  |
| 3        | RDS uses synchronous replication between the primary the stand by instances  | In case of Aurora the volume storage is shared by all the instances  |
| 4        | RDS supports cross reagion replicas | where in case of Aurora or replicasneed to be in same regionas as they shared the storage volume spred acrose the AZ with in the region |

Backups
| No       | RDS PostgreSQL | Aurora PostgreSQL | 
| :------- | :---------     | :---------------- | 
| 1        | RDS take a daily backup During Backup window The Backup window is controled by user | Aurora PostgreSQL carrys a continuous incremental Backup  |
| 2        | where RDS Backups there is a  slight performance impact  | Where as in Aurora there is NO impact on Performance  |
| 3        | If RDS setupis multy az Then the Backup is Taken from The Stand by instance  | In Aurora postgres backups are carryed out at storage tier |


Comparision Between RDS Vs Aurora PostgreSQL

| No       | RDS PostgreSQL | Aurora PostgreSQL | 
| :------- | :---------     | :---------------- | 
| Storage  | 64 TIB/IOPS 80K | 128 TIB/IOPS NO limit |
| Replicas | 5 Readers  | 15 Readers  |
| High Availability | RDS supports Multy-AZ deployments and in case of failure of primary instance RDS postgres Database failes over to the stand by instance   | In cace of Aurora The read replicas are target for fail over |
| Disaster Recovery  | RDS postgress setup with cross reagion replicas  |Where as Aurora cross reasion setup is  not suppoted But Global DB Option May be Used for Disaster Recovery| 
| Backup  | RDS Postgres Take A Daily Back up During the Backup window | Where as Aurora Postgres carreys out continuous/Incremental Backup |

