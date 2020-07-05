#FROM node:14
#RUN apt update && apt install -y autoconf automake libtool make gcc musl-dev nasm
#RUN npm install @gridsome/cli
FROM node:14-alpine                                                                            
                                                                                                  
RUN apk --no-cache add \
    shadow \                                                                   
    g++ \
    gcc \                                                                                         
    musl-dev \                                                                                    
    autoconf \                                                                                    
    automake \                                                                                    
    make \                                                                                        
    libtool \                                                                                     
    nasm \                                                                                        
    tiff \                                                                                        
    jpeg \                                                                                        
    zlib \                                                                                        
    zlib-dev \                                                                                    
    file \                                                                                        
    pkgconf \                                                                                     
    python3 \
    python3-dev \
    && yarn install
