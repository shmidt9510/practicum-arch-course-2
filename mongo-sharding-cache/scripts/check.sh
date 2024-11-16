echo "Count in router"
docker compose exec -T mongos_router mongosh --port "27020" <<EOF
use somedb;
db.helloDoc.countDocuments();
EOF

echo "First shard primary count"
docker compose exec -T shard1-a mongosh --port "27018"<<EOF
use somedb;
db.helloDoc.countDocuments();
EOF

echo "First shard secondary count"
docker compose exec -T shard1-b mongosh --port "27028"<<EOF
use somedb;
db.helloDoc.countDocuments();
EOF

echo "Second shard primary count"
docker compose exec -T shard2-a mongosh --port "27019"<<EOF
use somedb;
db.helloDoc.countDocuments();
EOF

echo "Second shard secondary count"
docker compose exec -T shard2-b mongosh --port "27029"<<EOF
use somedb;
db.helloDoc.countDocuments();
EOF