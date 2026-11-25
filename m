Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643749;
	b=nH3+GzcoXYVD5QKI2EEYMDCxQYky4UAi21hsX051horQ9731AONtTibrVzSztyaW/YJJ
	 qTPlZwR4tjsQmY07NFl6RKlgw7705aJjMn6IK1AFW35r8+gyEo0SSN4c7Ypv6D3qQwERJ
	 bf3LUZflUjzClJ1PmDsrbfidUm8ud0RirXqKAvB5fLtP2rKd0Dh8EZb/Ja8INkKID/kC1
	 Ua3b82uLChl+Tu1JbvwvR0I9tnEG5Qbkn8ZIqNJMrLCdlRjb9WkOgOHhoUwOUhESrBlbl
	 H7PvJ13MFKh9oZ6MopsEE6FFbHOk2K63XEmyHHbUHtUzxD5Ah/0P2bUblDQTNNRuGow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=r/GY1L0M/Jj/tnpXLztwrdoGc8kg+51R6Plf4ICZ1dQ=;
	b=vczjTsp1WTNzJijB6aKHB6sQBtc65fP/XL4qIFZn7fpxTuxMaYW1J8K6yR10GVQ+Mtp5
	 PlsYQFgsBpusQNDctxXf6qQjrK1FdbI3ypsCg2frF75gf5Rz/SQAZi+6WQ54+cKMKQ/BW
	 n9vpY2UXrJ8r5aJ7iroxEEHzKeFIfZkj6e+e3x72znfp/ctwI0Drny9bnV36i1XINQvT3
	 zxp8kmGUfKghZGQD6EvaRCi8u8Txf/SKTonkUSBaHmzKHeECPoVfyPCKe3o2SYlaVv2d3
	 WtfbFofoZz5YaaqLVzX9BWPY/MOTvv6NIRwViFQu1V8DK4vNuMjtMJCGAHHC2dJwy7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="R9/rbOd1";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A53606A321
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 21:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94A53606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R9/rbOd1
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so4887097f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 13:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795643748; x=1796248548; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/GY1L0M/Jj/tnpXLztwrdoGc8kg+51R6Plf4ICZ1dQ=;
        b=R9/rbOd1mzzJwriho6oqu3CgC7K1wSlhXe9zeuBxmFvrEDJLsbJoEnk8sCgoc6cYsC
         5EALMtdGI5m13pWRUFyc9uNG9bQEXiDQGldI/blAVQj5EuXkESLqrcf7obe0PPkPb6lc
         jrR7ca1lWajN38Yu8/44Puy170gP+ANH29Qvz49gu8S/jVkfvocflfkB4V/Jd5CVvaBI
         rfK4//0M452A+GFovixi5kSLnULRU1gFXDdt2Zm0ATaGwbNuf26MuQ4VIg+AfgJ3b8H8
         YlhboLSrWvXvSrSKb1xIUjsVCol3049mQf32029TwiC9KjNK9iegXnvepXPp6kEHvk42
         HPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795643748; x=1796248548;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r/GY1L0M/Jj/tnpXLztwrdoGc8kg+51R6Plf4ICZ1dQ=;
        b=l0+xYzrq1M2HnEOfQs947Vx4E4pzt69Cj+Am3YCKBhLu7lFn3Qmr0TGKVADoyEOltq
         zywbOXqptvLsNvctXW2SebDkO/Q3C2Qefq0mkUVDDspxQmlh3YbphOpxCaShlB91U3QA
         hZaZvjyWbhTmzj9ks28xUFIQCq2jmWzxAvjxHfYev8DpGXCR2GxDb4K6pi9bTxY0WC5i
         oJcVSbO4Csskkfa6n9sR29J1novoNDs2aryM2zMyMub/QroZB3o+zODyCylHIai1sacV
         orSV+rB7bs7yPEgICyscIFPeIGwv9p74ogZM0C0bxFB1OUEv+ZGKhEeuwebaXkHxG5ue
         4xSQ==
X-Forwarded-Encrypted: i=1; AL+hErFaWsYKIjoxrZAMv8Ke3LgIKzWeNiaC14Sek9enwxgWvZaGcvuImnbrN7mx62+us9pOLhv9cJVlXBc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ejGqcuP8MpaAGBNrCQeI903ahlaX6k+yyANQynBmAYx2BTX/j
	axBliL/kn+GoJAPmMviaqb1oHUBRtTVrT+mW5AuwpS3wNy6PTbIYJcqY
X-Gm-Gg: AZFdTZdc7z+0EI7P659ngXHjsBlB4eRjEev7sKtwHHoeyzM46SIlHiIpvTEOQoPS3CM
	rQZ2WjVEi176o6qnqJvB9kKKSD27LXnLgTVVWU2KUbszchmI8I4XpOebhA1KkFhQHADiY5KTPwv
	zU84aIkbZCSRgsVj7K5VkhJ40nP95DuPpoQ88t177Dlj/X9oDUHVU1R6nONf35D5B9nuO0PS5fz
	i/b2TaZ5WGbw5XSpO+Tq0dPPdzoB0TxwH4qfp59L13GWrzpydieTthfphW4Tv9QuTdyuGlHVQTT
	km/JHn6Peumk6pSoQAQoxxHhiT/TqU22k1wnxFWf3nbtvqT+kwB40lgEpa0bq1qCTWIvC+DjLEL
	g5iTfJo/84pTCsPrjytumnoZXaYT2+CJpTEcdCOJIMcHWVCDQvNHcsl/qfjDIvrBx4FO3SY+/+R
	V04nWCNbDkQ7jmukMg4+vw4GIfpPk8ZJP8uitwZc8dgsx/qb16t0bAU8xXfxx9rRTUeQwB9gdNw
	g2vEDHB4SXPwpLcNnRp46utpPg4EvW3V11461ZVnxz2H0Hy27UHiApFRS9hfZmbjt4z3mG4TVnS
	IS6Z5L9sSbbl1WfIzF0reCIutmgfeNnRiDj+s4mvIFttMDc4vfyA15Q=
X-Received: by 2002:a05:600c:8b11:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4bb8881c630mr403408355e9.27.1795643747772;
        Wed, 25 Nov 2026 13:55:47 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm566394855e9.3.2026.11.25.13.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 13:55:46 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Simon Horman <horms@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Christian Marangi <ansuelsmth@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC net-next 0/7] net: cortina: CS7542 wired IPv4 hardware
 flowtable offload
In-Reply-To: <7252b836-e375-4550-90c9-b0e3ab7fbb6d@lunn.ch>
References: <20261125-almondplus-offload-rfc-v1-0-703175c6340c@gmail.com>
 <7252b836-e375-4550-90c9-b0e3ab7fbb6d@lunn.ch>
Date: Thu, 26 Nov 2026 00:55:27 +0300
Message-ID: <179564372798.5.10006827612276789857@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Andrew,

This is the first standalone offload RFC, v1. The prerequisite CPU-only
Ethernet series is v2; this RFC does not replace that series. I should
have made the relationship and architecture much clearer. The next
revision will carry an explicit v2 and a changelog.

There are two separate chips on Almond+:

  LAN1..4, WAN
       |
  QCA8337 external switch (existing qca8k DSA driver)
       | CPU port 0                 | CPU port 6
       | RGMII                     | RGMII
       v                           v
  CS7542 GMAC1 (eth1)          CS7542 GMAC0 (eth0)
       \                           /
        CS7542 network/forwarding engine and shared DMA
                         |
                        CPU

The proposed CS7542 Ethernet driver exposes two full Ethernet netdevs,
eth1 and eth0, despite sharing the DMA engine. Those are the conduits
for the external QCA8337. I am not modelling the CS7542 forwarding
engine itself as another DSA switch.

The CPU receive path is QCA8337 -> RGMII -> CS7542 DMA -> eth1/eth0 ->
DSA tagger -> lanN/wan. Transmit follows the reverse path. Ordinary L2
switching remains the existing QCA8337 driver's responsibility.

The accelerated routed IPv4 path in this RFC is QCA8337 -> GMAC1 ->
CS7542 FE lookup/NAT rewrite -> GMAC1 -> QCA8337 destination port. It
bypasses the CPU DMA path. The frontend accepts standard nftables
hardware flowtable requests through TC_SETUP_FT; it is not a new L2
switchdev implementation.

This explains the QCA changes in patch 5: its optional four-byte CPU
header adds an identifier before the normal QCA metadata. With the
identifier set to 0x8100, the CS7542 FE parser can locate the inner IPv4
header. It cannot do that with the ordinary two-byte QCA header. The
new tagger therefore describes the external switch's wire format, not
a DSA interface inside CS7542. Header length is global to QCA8337, so
both CPU ports must agree, although the present accelerated path uses
only CPU port 0/GMAC1. Management uses MDIO in this mode.

Your patch-2 comment is also correct: the unrelated blank-line changes
in include/net/dsa.h were my mistake. I have removed them locally;
only the two protocol-ID additions remain. No replacement series is
being sent while this discussion is ongoing.

Thanks,
Fil

