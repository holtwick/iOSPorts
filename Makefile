#
#  iOS Ports Library
#  Copyright (C) 2010 Bindle Binaries
#  All rights reserved.
#
#  @BINDLE_BINARIES_BSD_LICENSE_START@
#
#  Redistribution and use in source and binary forms, with or without
#  modification, are permitted provided that the following conditions are
#  met:
#
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of Bindle Binaries nor the
#       names of its contributors may be used to endorse or promote products
#       derived from this software without specific prior written permission.
#
#  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
#  IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
#  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
#  PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL BINDLE BINARIES BE LIABLE FOR
#  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
#  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
#  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
#  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
#  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
#  OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
#  SUCH DAMAGE.
#
#  @BINDLE_BINARIES_BSD_LICENSE_END@
#

SOURCES		= \
		  ports/database/openldap/pkgdata_openldap.c \
		  ports/devel/pcre/pkgdata_pcre.c \
		  ports/security/cyrus-sasl/pkgdata_cyrus-sasl.c \
		  ports/security/openssl/pkgdata_openssl.c \
		  src/pkgdata_iosports.c

PROGS		= build-aux/iOSPortsInfo src/test-pkginfo

CFLAGS		= -W -Wall -Werror -Iinclude

all: $(SOURCES)

prog: $(PROGS)

$(SOURCES): build-aux/iOSPortsInfo
	make -C "`dirname ${@}`" license

build-aux/iOSPortsInfo: src/iOSPortsInfo.c
	$(CC) $(CFLAGS) -o ${@} src/iOSPortsInfo.c

src/test-pkginfo: src/test-pkginfo.c $(SOURCES)
		$(CC) $(CFLAGS) -o ${@} src/test-pkginfo.c $(SOURCES)

clean:
	rm -Rf $(PROGS) $(SOURCES)
	rm -Rf a.out *.o src/*.o


