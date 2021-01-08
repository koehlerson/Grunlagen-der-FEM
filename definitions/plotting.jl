using JSServe
user = ENV["USER"]
external_ip = "134.147.244.113/user/$user/proxy/"
const portdict = Dict("student01" =>10201,
                      "student02" => 10202,
                      "student03" => 10203,
                      "student04" => 10204,
                      "student05" => 10205,
                      "student06" => 10206,
                      "student07" => 10207,
                      "student08" => 10208,
                      "student09" => 10209,
                      "student10" => 10210,
                      "student11" => 10211,
                      "student12" => 10212,
                      "student13" => 10213,
                      "student14" => 10214,
                      "student15" => 10215,
                      "student16" => 10216,
                      "student17" => 10217,
                      "student18" => 10218,
                      "student19" => 10219,
                      "student20" => 10220,
                      "mkoehler" => 10221,
                      "amjalled" => 10222,)
port = portdict[user]
JSServe.JSSERVE_CONFIGURATION.listen_port[] = port
JSServe.JSSERVE_CONFIGURATION.external_url[] = "http://$(external_ip)$(port)/"
JSServe.JSSERVE_CONFIGURATION.content_delivery_url[] = JSServe.JSSERVE_CONFIGURATION.external_url[]
import WGLMakie

JSServe.Page()
