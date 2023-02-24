## Cluster ECS escrito em Terraform

  - No código acima você encontra um Cluster ECS com os seguintes componentes:
      
      - 4 Services
      - 4 Tasks definitios
      - 4 Repositories ECR
      - 1 Security Group
      - 2 Subnets 
      
  - Você deve ter notado que o cluster não possui uma VPC certo? Isso mesmo! Nesse código utilizei uma VPC ja existente na AWS e apenas fiz o referenciamento sobre ela.
    
      - No seu caso, você pode implementar uma VPC no código acima.
      - Ou se for como o caso acima, apenas fazer o referenciamento a uma VPC já existente.
    
  - O arquivo keys.tfvars é para o apontamento das suas chaves AWS.
  
  - Já o arquivo variables.tf é necessário pois lá está salvo o valor das variáveis que são referenciadas no restante do código
  
  - Importante! Não se esqueca de "tagear" os seus recursos, para não ficar perdido quando eles estiverem na AWS.
    
  - Espero que ajude! (;
