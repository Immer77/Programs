import socket

def connect(server, port):
    # opens a connection to a vulnerable Server
    s = socket.socket (socket.AF_INET, socket.SOCK_STREAM)
    s.connect ((server, port))
    return s

def read_until(s, delim=b':'):
    buf = b''
    while not buf.endswith(delim):
        buf += s.recv(1)
    return buf

if __name__ == "__main__":
    PORT = 12345
    SERVER = '<THE HOSTNAME OR IP>'

    s = connect(SERVER, PORT)
    print(read_until(s))
