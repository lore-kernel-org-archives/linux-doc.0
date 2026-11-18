Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015080;
	b=lc6QbLV2KPucTOIHbBJvOUpPVV+IZcaG+5UNbQh/K86P+hwqc9NKmkDcJaCkEn3HAFBY
	 5tGtFifS4Dtnwi6kTvq9ZX+6c6zyXeIQvkKgzQ+ZplD5G13l4lN2XOuPCJf2cw95z9nyY
	 Nmg5f+B/cWc+D2DgDaLa35xhx7/VmpN2kSAWCKALUyxgOrCxgnVXlHPOx8V1D5hxljHR+
	 r5KbDT8U9u/oP8g8J6dlmCI18uYSiEki+dZb2SJFW5l+HZbb/jlkSBvpcR8MybwkEKxVu
	 losT1Xf5pM0aDYs08PAZ1jm/q9kc42Ym+HhtxeR+syU7RpGiyUiaqEs+HT5xHqA1sDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=NayqA+2VU8BL3bQ4QlYOm2bPtjimdoFBif/UfurJ/Ic=;
	b=Cr8NIdZ/VDSM9NEaxKNvpASUnkQWOzHralWxh6XDQETUI+t9VZ5oePZgFNh3gm8fcstJ
	 PGtyk14xmp+pq+QcfAm+Kgq3pNqTmMLtKccn2tsdWme9dgKByyJZP/6nso5/ALvM1QWYP
	 bQJyKgvUstlQSIpgSLqXwySWEK3RMOICc/e3mnJa6JC/BbuAWUGJvnQ8Oi4s+zpgxZOsh
	 dY5GAo2VZBTA0G9Hjzt09lY6LT34SH7RlIyyN5FVjm4LfFXt0voLSODJ+BtFloCi22M+D
	 MkfVaEIfZ4j8mu5E92Cp6xG5xVbHIw4aQpcWegIHhKWrK6woGW5REd8N4g+aVLSRFMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=e4KQUABj;
	arc=none smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF3C606A32C
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 15:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AF3C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=e4KQUABj
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91eb3fea2a9so9480006d6.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 07:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795015079; x=1795619879; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NayqA+2VU8BL3bQ4QlYOm2bPtjimdoFBif/UfurJ/Ic=;
        b=e4KQUABj7gEeUxSS/9AWkxdW17UGKfzuGQLoVBznmZ3Gt2tw44MXP7MS7fuK4a6Xch
         0yyAXWnxxjkzZiP8jzIwtt8wLQB5Qssy9Gb6kZK/rHIv3jESaumWf1ihxu4gqfy3WHhI
         oFqLxTx/jKx8gn2+JTWAhEQk7YXH4RcTH2yez5MsQAFrIf799A5J/GHOpS52hUYhDizF
         brNl3q2lSv7Y6eahBplN+1C7QJXZuPwNsoam+lFO8Uv4TSMXFVNwxTf74WshGCQjFYLx
         AQVaoBNexrSRe/cQbkOsywEWMHGfpBC1GgvoSO70//W1ftEDbFrlxKA7Po9FCE5MnZw0
         zQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015079; x=1795619879;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NayqA+2VU8BL3bQ4QlYOm2bPtjimdoFBif/UfurJ/Ic=;
        b=0bnc0/NGw9NqkHL6VXNDw4ePhQzIXkTkm4w1iubP/e+D41XT3MORfS5De4VNzyFVSD
         E7WFKNTuT6LYKq55jWiGxVUbNcjtRvnZt9f8u4rb+3ktvIBdBu9b598H7yjl7bLa731I
         2rbWBahMxTqRJmzUVDPSVtjaiLOKOMPpwb24Ti2njV62JcoHwwes+FPB1GTmYnaWAtwC
         01jfqQ4Mqx0kFLp/Kznp6XptygCqXZlZ5HY5rYhrtsyQ7t655brrzPEL4+Pe1bfADGnZ
         rMUIFXw9Or1IJiTsu1KRgsrwDkR0la9VOo37s33bgppmOYMytLGoUTDo1O4y+iJKk9B4
         QGEw==
X-Forwarded-Encrypted: i=1; AL+hErEx9HgxmeW93mtuQ/A2bw9PljSQ/o+6d1xBa9CAEc3tkmvLlPcFg8H3ezVjXv6iv4KQbqWMiY+b8BU=@vger.kernel.org
X-Gm-Message-State: APuU4Z85fRQdLfORU5bUofUTWIK4Luh3NAO9z/lY95cSupUW3yFKVSrl
	I/GTIW62lwng3pSwsgnF0YoukaWSw3+eQXd4trDmObhL6LSwUKQCuLbvhDkPbe0wY0g=
X-Gm-Gg: AZFdTZcM6PQuaXoeOan34PIZjo/L9P90S+/9rcl8nBDTEeDZxv71Ozzhx6ahX0/90F8
	gJXkr/THv1ZxBKTBGo7QNmpuW8RFSAZx8NMXHUUVF5QwgMkh0NTG4uPbPGuk3/uD5IA2X2qVtPi
	ot9ZhlSxaojJOvFpaLwHcUlNU4HnnLG85j7A69aEZtyRV1iU2BAAaMgyyPLIuij3zN95ZYJ+dGL
	FkTpC339q6sOvHn4jVDjYx70yZpAd2q67QfBIFcnTRnv3O3j5yzmeg0xJzOKcLRYvrvYe1IFHX1
	Mo8o1uHIVJtL9mnYnKZYTigoAMREX58wA4/KyRS63NfrKdbNoykXMexKXjlsMJsLqxdPFTT1sQQ
	jRuyL+kXinKOozqsveK1qQRNe7BwvCb588YpTHGQ/ab9DhsnHgToXdp8tzaJX40wvprQRUXpCoj
	pr1Nd6Nm3hC9qvQLMTZjRTRS85Ge6Hf+HwxyczCBTcfITbC7UAOfuT46KldDI0+0UKwVQGTCM4Y
	kkHeubv082R4Kx1wl/BLiz1fXvv7YGpwKl9zfS1oGGU3xN8xaEg80LWzjQ0Fq55m2ClCJk+G/Ql
	XvPbyYALFsS09aWKlC1K9HSgWrg/RfaJ8eipG/P9lLX8o8cRefTX7/WXiNRmkzs0fsTIAcrgRTx
	F8D+FukzmpAeX4NBLlOun3NOBElTo
X-Received: by 2002:a05:6214:5d88:b0:91f:2222:b498 with SMTP id 6a1803df08f44-92114f8f66fmr40206726d6.27.1795015079071;
        Wed, 18 Nov 2026 07:17:59 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d35dabsm23793796d6.17.2026.11.18.07.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:17:58 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 01/22] mm: add node-state-filtered zone and node
 iterators
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Richard Cheng <icheng@nvidia.com>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 linux-doc@vger.kernel.org, driver-core@lists.linux.dev, 
 linux-serial@vger.kernel.org, linux-pm@vger.kernel.org, 
 damon@lists.linux.dev, linux-cxl@vger.kernel.org, akpm@linux-foundation.org, 
 david@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
 surenb@google.com, mhocko@suse.com, corbet@lwn.net, 
 skhan@linuxfoundation.org, rdunlap@infradead.org, 
 gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, 
 johan@kernel.org, jirislaby@kernel.org, kasong@tencent.com, 
 qi.zheng@linux.dev, shakeel.butt@linux.dev, baohua@kernel.org, 
 axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, 
 baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, yury.norov@gmail.com, 
 linux@rasmusvillemoes.dk, pavel@kernel.org, lenb@kernel.org, 
 hannes@cmpxchg.org, brendan.jackman@linux.dev, ziy@nvidia.com, 
 sj@kernel.org, muchun.song@linux.dev, osalvador@suse.de, 
 nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, 
 lance.yang@linux.dev, usama.arif@linux.dev, kas@kernel.org, 
 xu.xin@linux.dev, chengming.zhou@linux.dev, joshua.hahnjy@gmail.com, 
 rakie.kim@sk.com, ying.huang@linux.alibaba.com, matthew.brost@intel.com, 
 byungchul@sk.com, apopple@nvidia.com, rientjes@google.com
In-Reply-To: <av1hKrtcATVjCnCM@MWDK4CY14F>
References: <20261114070959.3490008-1-gourry@gourry.net>
 <20261114070959.3490008-2-gourry@gourry.net> <av1hKrtcATVjCnCM@MWDK4CY14F>
Date: Wed, 18 Nov 2026 10:17:57 -0500
Message-Id: <179501507729.1206716.6880334614636468959.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-18 16:29 +0800, Richard Cheng wrote:
> On Sat, Nov 14, 2026 at 02:09:38AM +0800, Gregory Price (Meta) wrote:
> > +/**
> > + * for_each_zone_node_state - iterate zones in intersect(nodemask, node_state(state))
> > + * @zone: The current zone in the iterator
> > + * @z: The current pointer within zonelist->_zonerefs being iterated
> > + * @zlist: The zonelist being iterated
> > + * @highidx: The zone index of the highest zone to return
> > + * @nodemask: Nodemask allowed by the allocator
> > + * @state: The node state the zone's node must be in
> > + *
> > + * The state filter is part of the iteration rather than a trailing if, so that
> > + * this expands to a single for statement: a macro ending in an unbraced if
> > + * silently steals a following else from the caller.
> > + */
> > +#define for_each_zone_node_state(zone, z, zlist, highidx, nodemask, state)	\
> > +	for (z = first_zones_zonelist_state(zlist, highidx, nodemask, state),	\
> > +		zone = zonelist_zone(z);					\
> > +		zone;								\
> > +		z = next_zones_zonelist_state(++z, highidx, nodemask, state),	\
> > +		zone = zonelist_zone(z))
> > +
> 
> A question on consistency. This one is a single for statement, with 2 new helper functions.
> for_each_populated_zone_state() in the same patch uses "if (!cond) ; else" form instead.
> 
> Both forms keep a caller's else correct. The only difference I can find is that the if/else
> form give a -Wdangling-else warning when the loop is the unbraced body of an if.
> 
> Is that the reason for the 2 helper function here? If the warning doesn't matter, this could
> use the same short form and drop the 2 functions. If it does matter, should
> for_each_populated_zone_state() be a single statement too ?
> 

Yeah I was getting that warning from various checks. I'd convinced
byself this was a false-positive, but it does look very funky indeed.

Let me look into this again, it's possible I can massage this better to
use the short form still.  It's also possible that I should just use a
different shape entirely than trying to use the existing pattern.

-- 
~Gregory

