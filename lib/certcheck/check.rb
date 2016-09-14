module CertCheck
    class Check
        attr_reader :domain

        def initialize(params = {})
            @domain = params[:domain]
        end

        def run(params = {})
            begin
                Net::HTTP.start(domain, 443, :use_ssl => true) do |http|
                    expiration = http.peer_cert.not_after
                    now = Time.now

                    expiration_days_away = ((expiration - now) / 86400).round(2)

                    return expiration_days_away
                end
            rescue SocketError, OpenSSL::SSL::SSLError => error
                puts "ERROR: " + error.to_s
            end
        end
    end
end
