Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017377;
	b=YP5FKMnKvSi43zJwtinNaP4t5cZmyk5nmkzfIgtA18gORkctshsab7+ipgK5vG4R7uBg
	 rhZYfWTfPirZAYTqIk02bd9p4IIGjQbVefD3VdKrtbhGDvdNtFSp0yUSpOav5ryH4bQiO
	 ahKUgH+sre4H9MtH893TSjpKJBUwj1UV4dP1Tn5Gvv7/y6vtpyRaemZMdZ/p70IluBGx0
	 QBAGJfL0jGQXXYsVgocVfTpq35mrtS/XCgcyv2cqxmbZpGy3DtJLSNjsVXq0fkbJbwApA
	 jjFk9QrRD5tpLsC2hUPittadBGOj5PyDrgr5IZSGYZU/ubcWL6/ZO5B3Wn9w2DAMzHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=3bQBfuPo4+GA4H58G8tofWZlnWMcm4hxNRzjXZBoZg0=;
	b=lgZIk7KHedZX7khbvH2S731m7wS/xltZZ28fsP9OaS7siD3KVxYX+asLUaTjYXTHZxZe
	 fHwOWREH8nazaNgl4OguV1TL1vN98daVS1ELxEnBBqtki3fjX9xPzIKTkj/byQI1ly5hK
	 +bUgOXxwvs0UXd3OjbrSclN1GHKouf1YR8N1xMVkJSy6WwOCvZR0/2jz1kctWDFzQIXu3
	 97HRzJr63uYw/yZdlFNj9enBwaBarLqspx1knoy+zXKaFLi046xoky8me0+kp2JKDQKVo
	 hzU8kxJ+Toucu9dxm3YlzMrS6cvNeZ8SDQzwhYC2HUgOJFWBM/O7KnyC7Txhh9SwTug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=gFIxxdDt;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D59606A334
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 15:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3D59606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=gFIxxdDt
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91ef011e338so5495456d6.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 07:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795017376; x=1795622176; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3bQBfuPo4+GA4H58G8tofWZlnWMcm4hxNRzjXZBoZg0=;
        b=gFIxxdDtcqDrBFkqgwEzkN+bVHfcVbrm/mKFYHBw/aX+aK3i6yXT3iOHNNcy/dVpjR
         beX1ypC799ntnSOEXoyuWI9KAiYigmUzM2ktWAUGq14UH6bdfs19Po3EeuhNmuPBICwQ
         4fygV7vNlH+8kA4gHVrwCXXCMRXtK3og0Bhew+zJDF8jtO9O5fvmBFacfYtyQB0ZICfH
         uto7MDRpcWiyf9+vJZQn3ZyabRKAjiAEnbjmVD+LqH03jEVrnsuMJqNm4PPeRi2PD0kM
         0m9hgfLivrz1Z3dH1OiBWSOIUeexNiv0u7ws6tg5Gw4PB2Xal1+xCiI4FGHOyO/4c+dY
         QURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795017376; x=1795622176;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3bQBfuPo4+GA4H58G8tofWZlnWMcm4hxNRzjXZBoZg0=;
        b=CWHkF6CCh26Uv0+2S9caEqd01o1MIgSEREnyYnuyKP1Kp/H4Fdxpkdg99FFXbV6CCU
         mFIbBpzAKsXTfi0lC6ZubAQNTBPMs5FZtkM84I0I0wf3o1KH4ZJyRw1OGvttDDUlaAGQ
         9r9RbTsozizPLKb868UpPdvkonkcyPRLAQ/sutzEFk2KumsiBi2DkJwVJOFGqFpxwQtY
         Ogis7lCG9wWgePNuXOckjZ+4t+aIJW6dXSTb18fyOEFQwBaBy/m4Iyk4SxLSqAz9N2iV
         CAI5xQk0zuuAfG+QbKv8NOGAIqHH6mrBqyHIqxAWX0RvxNI7gEDm4c0F5jWQK/UciW46
         TZaw==
X-Forwarded-Encrypted: i=1; AL+hErFDML9O/4BwtkX+GEQKINKOWo3++pak/ucAZoDjk0zw64p0pXMbwiQNCvUWL5d4puG1ComjalvDUN4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Po3pSgiO+RwOjJ6vOQuAZsa/5xjNY0XIx/ZvXhkrD2G9U1552
	FnI6CFO77OrBQwIbLVdh/HAwxmT0SwxLrjaswYY8OrDaooTOLySJuEO75p/7PXBjkvQ=
X-Gm-Gg: AZFdTZc1GIRwQFXsS7kbWRLmcFdIs/+82V+D+sYVeCJwCx36UjZJhFU8Gac7mjH92dg
	T+l0tTzrzNFJK/7px6Y9nTDq0lvUXlNrzIPpgyRRndHz3kDv2nHfebvOLngZJkHvu0f0OxLiw13
	uyqXopidVEL8Owz0H6UgQ+XDl+kxvHXk8tBesuHqDNSBXHg+cx4MK3jrd2pfwfmGHECTTrFH0on
	8TEchIRM4Opo5vk2urGvJxN7yvWY6gp4t0SN2/h7GeT35vcCHz/8enmhJJBV1q9xiwxYh/Upy7t
	dCyi9eG8ZYnjEMUlxE4rc94GmPlWdlzYL076kvD16vtEya7A9i2q9W5hz95x919e2+EriEPI5CE
	b2OB6Zpx2+jKPNP6c+8pwTQvSDWVb0i9FlKvOlCuqjeu0WAsHZYpbLX1Of2S+sAU+CjqSiPhtV2
	Pv3fhp+EsaATXE37z7RNQ232WINRMt2mYccXu5I0WJPLsintNuY9OeTyN9oMNLLAbTySfj5YBQY
	3yqdN/IUWs1UdiwDSDG6/HpxjQhxhLEJ+9kVf7aAu1/UhYy4BgG3Ih0R6dNuFy2Wh/dkvtK+QRU
	NPTgpN3S9qZCikCwjn3tl86hJdUXm8tlIf+NY0a1m/4HX8TRLslNh4aLRGi3F7+7k6HXUbnPetJ
	PrrtyaDghBLxf5I8TnSR35x8Gu4Bj
X-Received: by 2002:a05:6214:8013:b0:921:1890:b77f with SMTP id 6a1803df08f44-9211890b87emr29798426d6.47.1795017375668;
        Wed, 18 Nov 2026 07:56:15 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d28215sm24719106d6.16.2026.11.18.07.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:56:15 -0800 (PST)
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
Subject: Re: [PATCH 05/22] mm/mempolicy: keep interleave and tmpfs mount
 policies on common memory
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
In-Reply-To: <av3EGWuHX2JDdlrx@MWDK4CY14F>
References: <20261114070959.3490008-1-gourry@gourry.net>
 <20261114070959.3490008-6-gourry@gourry.net> <av3EGWuHX2JDdlrx@MWDK4CY14F>
Date: Wed, 18 Nov 2026 10:56:13 -0500
Message-Id: <179501737390.1206716.11014097946405277594.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-18 23:30 +0800, Richard Cheng wrote:
> On Sat, Nov 14, 2026 at 02:09:42AM +0800, Gregory Price (Meta) wrote:
> > -	for_each_online_node(nid) {
> > -		if (!node_state(nid, N_MEMORY))
> > -			continue;
> > -
> > +	for_each_node_state(nid, N_MEMORY_COMMON) {
> 
> Maybe I overlooked or somehow, but when do we have the assumption
> that common memory is definitely onlined ?
> 

For this particular case it's not particularly relevant.

This code only runs at init time, so it's either got memory or it
doesn't.  If the memory is present but offline, it still wants weights.

There isn't really a bug here, but the existing code could also just
check N_MEMORY and end up with the same result.  If the memory is
hotplugged later, it still gets weights accordingly.

-- 
~Gregory

