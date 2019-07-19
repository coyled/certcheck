module CertCheck
    class Check
        attr_reader :domain

        def initialize(params = {})
            @domain = params[:domain]
            @now = Time.now
        end

        def expiration_date
            begin
                Net::HTTP.start(domain, 443, :use_ssl => true) do |http|
                    return http.peer_cert.not_after
                end
            rescue SocketError, OpenSSL::SSL::SSLError => error
                puts "ERROR: " + error.to_s
            end
        end
    end
end
