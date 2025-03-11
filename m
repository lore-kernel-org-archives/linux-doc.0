Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486001E104E
	for <linux-doc@vger.kernel.org>; Tue, 11 Mar 2025 06:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741673995; cv=none; b=emQansZChf9qebRywG/SnZCAwCwxnRqqvqJ7+ZhNax1M/tAkFwLWZwCclB7sHgFcPoKM6sRVYgsbm6mzYc5UKvjeRgO7ltbMBnROg0z4CuFecE6moBpxrQlRw85MJgOBoy9kPVSLWpDA4JPckfODZmkwObXqr4G6R8srxgdWa94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741673995; c=relaxed/simple;
	bh=ZP4EaVCBU43ETX1tsWfetopJ677SR8acZVhOJLrcrw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XWZh5loYjQPxUju5NmAYBM3zaCLyEaBZycwsYoD/sOjkXJeXkiEqk5r+M914t1aQ8P16EoCuZBU6czij2k12BeONEMPEJMQXIJVRlzO5PmbtFiT/w+b/ooqybjrKZq4235P8G8upAgl9rmsh2hz6EKMAHJPF/ZJYCBLInRYOLDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=r0pVdBqS; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="r0pVdBqS"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2254e0b4b79so2243855ad.2
        for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 23:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741673992; x=1742278792; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EbcW5/eDAGhdpWi7HyX3jjOdHbLTgrUim/DP0OQGuWo=;
        b=r0pVdBqSlYlaLTahjdTPd8TF3QsBOiOSOqTWeNjGAMKFcI3nXQfondYE+kch38jYSL
         5YwEt4prOcOBGftjrZ1F72y8/J6hrFawCMkGNOP7+u7cJYnWCiXuiIRC2SESSFSS8CHA
         FpBomgMo+qnJRoTHuw9co+mDt0+ce85cp3ZT6HRywW3SPQ4o/xiUA36SkNWtxvrAuT1w
         WQGmmF9NVuhUaZJNg8ARmVSDem38gWxRzgcUhPrBP2GNGfHzkT7cU3GnW9wdecY583rN
         TaB0euWxhno9HQIRt0XJG3o75zVFGnVvvndOBG4FGmbz/S++SRb1q0Bsu7843OPZgFzX
         zPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741673992; x=1742278792;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EbcW5/eDAGhdpWi7HyX3jjOdHbLTgrUim/DP0OQGuWo=;
        b=NjRntviOazTslEcdg3GleMvPKyOw+EGD0XER6Ag0Af1HxGt4YP2DKXKAgJykP09jpH
         Lsrskm7aPmph91OEvcFFw6Ze9ISkYgZwG6ka5u9WwXwGCYRQVwHqzQ0IRYPXcM9/zz8O
         YECXvHweJkrlUlcXK2Vtb3eKT8Bx+1Qx1/Pv40GvHMlAsmcTYNyGUOrlhSz/Kv3IVJ19
         MqAy8VHm9K+9eKBzuLA288Q1tKluZCi5lsbntE5h1jrz7spLA7d4apzMCIvXUnfiRp6V
         jZwRCLRM1tlToDVDJbWPY1wDn2UYHIrdbVC3jtEb7zvtGvSM2Y23fqpjZ0OiuSCiSR00
         1CeA==
X-Forwarded-Encrypted: i=1; AJvYcCWookYCEJW8pyo+9/qQlLE4GUCiq53/K/Pf05WhkVrvC93h48xtmwImjkZpFNaZDurM5vRBqvMee1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL+SHlbVWWczj1UHJRkbbUSsx/MPR9bkw/d3yalrF1mfAMFJtU
	xitDjJfF8Ft2rIMDu8uiWYBHdgxlSfxGUCXcQYyFJElPyceEYvPLUt091V+T93s=
X-Gm-Gg: ASbGncvPfsiDtx31qm4jAPAsvWVMFwVrw1a2JZl37zmKM6K4u7ie0uqu8hSWxiaNFJK
	45nJHQv+A+rlTq2CKMtiX8mnhf//KzgkqFRJ6jTwbI9EvT79LggNMfaQ4Y9CCD/tdtynwCRvvhF
	h7P2sGsMyQdUD5Ti6A1s9q9Rnhf5cWbcRe69hnyvjwboTOC24hvwgRW0nIMWTh3XCC6n0abLY+Z
	/auf3j/eu5Fg3pP0sDxNqGXRQlcNPgXpT4CFtQDnHZNb58ceQh4tCJhgm31ZjSnWeCs0522/m62
	IGQPNIHslzs/0M0PlzxR+4OzsVACLGTURgnWYkL2R5OR0AHROo2bRr279w==
X-Google-Smtp-Source: AGHT+IEO1Addst46ofGtxfDAcyJAfRa7cWyZNqzRhdZXtyiIrODFKfx6qBjS5jqvhrfaOM+pKspNkg==
X-Received: by 2002:a17:902:e802:b0:223:26da:4b6f with SMTP id d9443c01a7336-22428895abfmr268969215ad.14.1741673992501;
        Mon, 10 Mar 2025 23:19:52 -0700 (PDT)
Received: from [157.82.205.237] ([157.82.205.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a7f5dasm89029115ad.137.2025.03.10.23.19.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 23:19:52 -0700 (PDT)
Message-ID: <217fb3ef-336d-4141-b47e-3236f2c22ec3@daynix.com>
Date: Tue, 11 Mar 2025 15:19:47 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 5/6] selftest: tun: Add tests for virtio-net
 hashing
To: Jason Wang <jasowang@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Shuah Khan <shuah@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>,
 Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com,
 Lei Yang <leiyang@redhat.com>, Simon Horman <horms@kernel.org>
References: <20250307-rss-v9-0-df76624025eb@daynix.com>
 <20250307-rss-v9-5-df76624025eb@daynix.com>
 <CACGkMEuTwd4+DP1Cb+ZgJtxTiJj4N_NMPHiKusd8a4Tn3+B_3A@mail.gmail.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CACGkMEuTwd4+DP1Cb+ZgJtxTiJj4N_NMPHiKusd8a4Tn3+B_3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025/03/10 13:03, Jason Wang wrote:
> On Fri, Mar 7, 2025 at 7:02 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>
>> The added tests confirm tun can perform RSS and hash reporting, and
>> reject invalid configurations for them.
> 
> Let's be more verbose here. E.g what's the network topology used here.

The network topology doesn't matter because this only tests the rx of 
one device.

I can still add more details; it tests all supported hash types, and 
tests both the queue selection and reported hash values.

And this message is wrong in terms that it does not test validation of 
configuration so it also needs correction.

> 
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> Tested-by: Lei Yang <leiyang@redhat.com>
>> ---
>>   tools/testing/selftests/net/Makefile |   2 +-
>>   tools/testing/selftests/net/tun.c    | 584 ++++++++++++++++++++++++++++++++++-
>>   2 files changed, 576 insertions(+), 10 deletions(-)
>>
>> diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
>> index 73ee88d6b043004be23b444de667a1d99a6045de..9772f691a9a011d99212df32463cdb930cf0a1a0 100644
>> --- a/tools/testing/selftests/net/Makefile
>> +++ b/tools/testing/selftests/net/Makefile
>> @@ -123,6 +123,6 @@ $(OUTPUT)/reuseport_bpf_numa: LDLIBS += -lnuma
>>   $(OUTPUT)/tcp_mmap: LDLIBS += -lpthread -lcrypto
>>   $(OUTPUT)/tcp_inq: LDLIBS += -lpthread
>>   $(OUTPUT)/bind_bhash: LDLIBS += -lpthread
>> -$(OUTPUT)/io_uring_zerocopy_tx: CFLAGS += -I../../../include/
>> +$(OUTPUT)/io_uring_zerocopy_tx $(OUTPUT)/tun: CFLAGS += -I../../../include/
>>
>>   include bpf.mk
>> diff --git a/tools/testing/selftests/net/tun.c b/tools/testing/selftests/net/tun.c
>> index 463dd98f2b80b1bdcb398cee43c834e7dc5cf784..acadeea7194eaea9416a605b47f99f7a5f1f80cd 100644
>> --- a/tools/testing/selftests/net/tun.c
>> +++ b/tools/testing/selftests/net/tun.c
>> @@ -2,21 +2,38 @@
>>
>>   #define _GNU_SOURCE
>>
>> +#include <endian.h>
>>   #include <errno.h>
>>   #include <fcntl.h>
>> +#include <sched.h>
> 
> Is this needed?

Yes, it is for unshare().

> 
>> +#include <stddef.h>
>>   #include <stdio.h>
>>   #include <stdlib.h>
>>   #include <string.h>
>>   #include <unistd.h>
>> -#include <linux/if.h>
>> +#include <net/if.h>
>> +#include <netinet/ip.h>
>> +#include <sys/ioctl.h>
>> +#include <sys/socket.h>
>> +#include <linux/compiler.h>
>> +#include <linux/icmp.h>
>> +#include <linux/if_arp.h>
>>   #include <linux/if_tun.h>
>> +#include <linux/ipv6.h>
>>   #include <linux/netlink.h>
>>   #include <linux/rtnetlink.h>
>> -#include <sys/ioctl.h>
>> -#include <sys/socket.h>
>> +#include <linux/sockios.h>
>> +#include <linux/tcp.h>
>> +#include <linux/udp.h>
>> +#include <linux/virtio_net.h>
>>
>>   #include "../kselftest_harness.h"
>>
>> +#define TUN_HWADDR_SOURCE { 0x02, 0x00, 0x00, 0x00, 0x00, 0x00 }
>> +#define TUN_HWADDR_DEST { 0x02, 0x00, 0x00, 0x00, 0x00, 0x01 }
>> +#define TUN_IPADDR_SOURCE htonl((172 << 24) | (17 << 16) | 0)
>> +#define TUN_IPADDR_DEST htonl((172 << 24) | (17 << 16) | 1)
>> +
>>   static int tun_attach(int fd, char *dev)
>>   {
>>          struct ifreq ifr;
>> @@ -39,7 +56,7 @@ static int tun_detach(int fd, char *dev)
>>          return ioctl(fd, TUNSETQUEUE, (void *) &ifr);
>>   }
>>
>> -static int tun_alloc(char *dev)
>> +static int tun_alloc(char *dev, short flags)
>>   {
>>          struct ifreq ifr;
>>          int fd, err;
>> @@ -52,7 +69,8 @@ static int tun_alloc(char *dev)
>>
>>          memset(&ifr, 0, sizeof(ifr));
>>          strcpy(ifr.ifr_name, dev);
>> -       ifr.ifr_flags = IFF_TAP | IFF_NAPI | IFF_MULTI_QUEUE;
>> +       ifr.ifr_flags = flags | IFF_TAP | IFF_NAPI | IFF_NO_PI |
>> +                       IFF_MULTI_QUEUE;
>>
>>          err = ioctl(fd, TUNSETIFF, (void *) &ifr);
>>          if (err < 0) {
>> @@ -64,6 +82,40 @@ static int tun_alloc(char *dev)
>>          return fd;
>>   }
>>
>> +static bool tun_add_to_bridge(int local_fd, const char *name)
>> +{
> 
> I wonder if a packet socket is more convenient here.

I'll try it. Thanks for suggestion.

Regards,
Akihiko Odaki

> 
> Thanks
> 

