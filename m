Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355258;
	b=tXu1bq6J5os4YepxcvGyOSeEu84xYxhckYrg6XR1otxGuqxMDV46xUcHU10rd+PsGk17
	 qUoP8DoemznxbDwwMUgl7N1sCFpVzF3+Sf/d3t4E6SM/WWxRYu3FN96lK5Gf5uzHhwcRK
	 MuyRGQZv2qVOcJrbsyIvsd7K9lt2yCqCFrn571hXkP9B5iDhqTua2nwBadpaaycTSuu9p
	 xDwNX1NNoTA3J8+SShhsjW61AnM2KX0uKHaJb6dLiYDZ/AxK94jyzPpKH6IUk3lVvojf+
	 nqDYKxcUPYeBHwVr7nKhW8RTc809PKm4mtP8OdkN/R5KvF7pJh+xXj5PyN1cYTnTI1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=bYaErAxQk82jgbOAPhvOLDjqMW7sA/6+9+NevIx4alw=;
	b=K+SNxP4Mx48HGLdUvsNZCXUAxtQ9KnWphgmdRW9Ivb+mp1n7h2qjobbwL7qdfZdfzwp6
	 XkCwVX6buPVj+FclNocIfZ9xkpDxXWBS2IlXYXE/4qIUn5L80NTJOplKlew/PNHFmYFJD
	 0vZU/NYcKDwI7EtBH1CVRUKLpHJPSfjgrfWOuK78CLA5qDIkN8oH2YBT/5Hyd/BZIGaSW
	 Ry+t/L3yUh2gQ9qOmBarUmydsm0RHAgP8ygpcYplYzHiXnjK7q4oV/lvqpzc2Fn78FRni
	 uOB45Y4h5JEpBNKH2CZMBClXLj2hjpY/szQK1ngqnImoYg5Z+bWg2tg8spwgXHLYIHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t9TAbB+g;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC2F606A326
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 00:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FC2F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t9TAbB+g
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36f758312e0so1267572eec.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 16:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794355257; x=1794960057; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bYaErAxQk82jgbOAPhvOLDjqMW7sA/6+9+NevIx4alw=;
        b=t9TAbB+gGdTcVq3NKRacPVt0N7MjkADs80KixPKvho+VsCVkoONwqkO/yJ/R8u5s2t
         sU9qfXBu+fZ2f+ktLbaRcQP1JUWWcVt1Fdbqa/eQbcIiLEtxXQoKQ3sLAmrxeQykyCN2
         49gyjEHNylCKfRyIbQk8A7tQfltVuGM4+o9KlANYaQOAdjVDaBEFIYSTSPPuHrHa5vH4
         1ntDDzByXQNjxkoHCJ8Zg+FfDpNx5BdDMLoBbqgU2bUForQ7XgCLF8X3ErsGHfHghBfW
         TrPH66Wi7muVvYkZOho47s0CKpbAoxIu5IjK2FIpcRJF2KmPFdk+AT0W3KF20V5scofS
         +4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794355257; x=1794960057;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bYaErAxQk82jgbOAPhvOLDjqMW7sA/6+9+NevIx4alw=;
        b=SM5u9QcEj2oH9JoFuNZUEp/K3ylocDjtLEytbFtQaPUpx09i4g9HURN+VPeEh/iPD3
         sEFEa94kT4I4HaNGlyN7eBZRmYRbW29wZUZ+QJfYu3F6fFR8sB7u24GtJDUdazLGvc5z
         SoWhQe1aSYKiGRWKyph8GikrOdZB32MjLiwH66I8rkw3QB41HJjykKxKpFSFVui47p5z
         ExnAkDjrchBr41i1W9MM/Ow3oLWzAhHk1lFJr0EnEnhgYDeV/YughVoCjdWDjLQuyfP+
         aMlADdhdoX/DqVogqtqKyB20tYky8b9OpVJ3M9NgMLgNU++R/SZx/EWWdWPinDouz2yn
         abpA==
X-Forwarded-Encrypted: i=1; AL+hErGBbDGT7DMakq1+N7leSSg0arsgG+jAZF8QrfBEGkMcxHwHeyi+vUKlPw9urqqdAm/HU43zA/ovVPo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dcGbSy/RRE/Jv8FZ1k8OjA14jQQHdjbBSunW/fjj5kFMXcXjt
	FkIiWstL2kLXkpWXipE+w/ZuM46z4HuywMAVgr9gnxe4X7F/s5MXKQPH
X-Gm-Gg: AYBFou1qONK0kHI5UJ95HvyzuOFmU94+hbEg3ERXYV9SFDbM3Bw7vAa6meK6+QyXV2y
	abGO1saVrzPPSEdmBs/lwXtiaxvPtx/StAvxsp9S//jbMWJWaKXqSGpQC/K4cWoMSr6q5+04Jv+
	n7GY8t6HxZ802DzNWM2JzD68nAfteRobsmFKZM7jmjkreH7AF8nApZ/bJ+GIFCtYIpzz/NxeM+E
	lRJ/B0i/aHn5CpXjYHRvx5gFy5p4QkFrdw0XNHNj0Az2CD7uhmA/5Ojm9cqCa4/u6rg4TzSXwRZ
	3g0iLpmY3opWc8v4EZCrP3aE+W7+skm3CPCjtJ/6o9NRYmFeiaM1SEMGNT/F7aQdGrvK4ymDFpc
	dJstHIRW04Z3Ku5MCgxGxdcp3dZ8DsNMITPmexP/7MLCmdSvI5PEl9zaI+2vBDTXEWRpbHOYMxr
	qLtR+vh1/HQUJs2YTKfqssnePNtxbWnyar+TdPH8DT1/4Pkl45xo5gx7r75j+r9ynGrd7I5PGnG
	CbAkD5U2T0HbvVOA2BND5Pzv/BUoqp+Dp/Yt63Atd5BYIewqBbsRFAfDWMTkFFk9FhUGgm0uVMT
	xtHBkfMQi2i97kB8u8WAf87G
X-Received: by 2002:a05:7301:90b:b0:375:4366:a90c with SMTP id 5a478bee46e88-3768730e517mr1138142eec.41.1794355256884;
        Tue, 10 Nov 2026 16:00:56 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:71::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c7c50sm19090263eec.29.2026.11.10.16.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:00:55 -0800 (PST)
Date: Tue, 10 Nov 2026 16:00:51 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Tianyi Gao <tianyi@cloudflare.com>
Cc: bpf@vger.kernel.org, netdev@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Jakub Kicinski <kuba@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Vladimir Vdovin <deliran@verdict.gg>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Donald Hunter <donald.hunter@gmail.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Tushar Vyavahare <tushar.vyavahare@intel.com>, Jason Xing <kerneljasonxing@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Madalin Bucur <madalin.bucur@nxp.com>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Chris J Arges <carges@cloudflare.com>, 
	Jakub Sitnicki <jakub@cloudflare.com>, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	intel-wired-lan@lists.osuosl.org, llvm@lists.linux.dev, kernel-team@cloudflare.com
Subject: Re: [PATCH bpf-next 00/15] xdp: add SKB core extensions to keep RX
 metadata until skb creation
Message-ID: <avOvI8xrHI0dwyHj@devvm16445.scu0.facebook.com>
References: <cover.1794281983.git.tianyi@cloudflare.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1794281983.git.tianyi@cloudflare.com>

On 11/10, Tianyi Gao wrote:
> An skb gets its RX hash, VLAN tag and checksum status from the RX
> descriptor, which describes the packet before the XDP program ran.
> 
> Without this series:
> 
> - On XDP_PASS, the values are stale. After the program strips a UDP
>   tunnel header, the stack applies the outer CHECKSUM_UNNECESSARY to the
>   inner packet [1]. If the outer UDP checksum is 0, a packet with a bad
>   inner checksum reaches the socket.
> - On XDP_REDIRECT, the values are lost. The skb that cpumap or veth
>   builds from the xdp_frame has no RX hash and no VLAN tag, and its
>   checksum status is CHECKSUM_NONE.
> 
> In one use case, an XDP program redirects packets into a veth device.
> The checksum status is lost, so GRO verifies every checksum in software.
> With one TCP flow, this costs 34% of the receiving CPU.
> 
> Another use case [2] is load balancing IPsec tunnel traffic with cpumap.
> Without the RX hash, GRO on cpumap puts all flows into the same bucket.
> In a cpumap test with 16 TCP flows and no IPsec, the throughput is
> 17.6 Gbit/s instead of 23.4.
> 
> This series introduces SKB core extensions for XDP. It reserves an skb
> core extension area in the headroom, right after the space for struct
> xdp_frame. An XDP program stores RX metadata in the area with kfuncs,
> and the kernel sets the skb fields from it. This design was initially
> proposed in [3].

Awhile ago we discussed the alternative of adding setters for xdp metadata.
Then the veth (or whoever turns xdp frame into an skb) can apply whatever
metadata it needs (and there is some magic behind the scenes that takes
it into account when creating an skb). That keeps the layout and most
of the code outside of kernel. Have we considered that here?
