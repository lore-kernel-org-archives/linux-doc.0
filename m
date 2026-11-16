Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845623;
	b=dQSqv1mXwYC6blpomVsBMkiaM2i4Dglb0VMqFgpyWmOPGM+ZdhF2nCIHfgXQ5hjJ4vqT
	 8gTqnGNdWRO3hXTcJvPCEySuqi9Uso5s4b5kV5PZez71B8j5TZ/3T9yYdCfJ5vDAfvpzx
	 v6SrLEiXibu8AAJA6sXsE44hYmReiQl4digfVvA7SX/5uuXh2OAJKMQ2tJREuaHPsK4h7
	 WeGXtCiaeAE73OonL9OYOKK/jLJRAXkUBe7INy8+cyT7dzzvCeRad9AlIum5k5H8jQyNQ
	 GjhGGdOg68PWANSuDs/KZ+TeWeA+Y9D8LEmG8kikPWREQMU8a7c4dRoq4/hQzD2/QHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=ZxHOUEDwJr8Ec59nGL6gXnjQrpofiX9HS0TRBVLwZm8=;
	b=DTWwV3kOtsyFoyGqBPB0EQUzJm+zSQaK6qG5BCQwAGWoU/3hRAQsEG+CrFKhIL0fMzGx
	 CbF/pqiidZpqQNVGVFElXlo2dFJ5uNmZOn0kp4fmZE5IsBsx1bQ18IKEO9PgIqYW857cG
	 guVZW5ybQBNylCQGhg//OOJzhzyLgY0xjc9zk9BI6cE3/cdgH32sbt1pyuvTIsa1l0szQ
	 uCZEzbgYNP5hQn/LSpZUFhZpCbUwT73WJbbG3MW/O2c+RDH0VZpYaW/zTTWsc+h1acxTD
	 Z38N6CjVVtm+4Q+qMY2iOHYtbYyy+rYqHPPi4FiQumvy6XsuJsKwQnk05vWea6cA7+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=DfyLCbzv;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC57606A322
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 16:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AC57606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=DfyLCbzv
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5364d86f7f0so17693711cf.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 08:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794845622; x=1795450422; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZxHOUEDwJr8Ec59nGL6gXnjQrpofiX9HS0TRBVLwZm8=;
        b=DfyLCbzv97E8Hk1ejG7+FaD+1xL/uA/0hg5ayQHlJWr1PsZHS44gSfOgCfQB9U6h/z
         s/Hwfhv3gnVCvz/8vnnEwN/2zHeJpSnfMR7nbcXpYlzMU2Cb4Bqc1TgDV4esmkwnC2pV
         vHdJ6HEDYotF3Q+8IVJKE3NTwEqOUrQsvnX0eKdbg8d3V5soKfpN6IGm4Ug2l3ymu6KJ
         xyq3AgTy4XM8UU3LZRR+L1pyLINbLgGk/R8gqRZFwtd+49oCRL0A+KeGkJR8PSh0Rzi6
         jtbP4Loc8pcq/4xL1hv34RP9MdS/4tbBgNMQ3gsThS7p3n64LXZ8ZJ7QryxGdNrHwCVJ
         wYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794845622; x=1795450422;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZxHOUEDwJr8Ec59nGL6gXnjQrpofiX9HS0TRBVLwZm8=;
        b=pzYMakcwFYH/sJWIdfPyECHIMKtr7epS6/9Qe1AVn8sahbdLzjnaZBxgO1mUnGATvH
         EbUwBeIfBRy5u9e1/NKWSY8DuxX4ozfXuofzaP9LCrAhGDRl6+Ktadmup6FSOl8ApTpP
         0A9lmXdPhMFr0LEl3FJ2PiCkAjeu/010sOV0qksIM2wi+Nfp6jnkS9D+nhIWypLAa+k8
         JYbH8xeBlsPIU04bSQbIyVA7T5TZb/4HDm1nNCiL1PznJPg2t7CHCyITUD7cCqfyAQRF
         0qLUHus7Gd0mzngZDedmvinIJiT81OhtiiP6dtCjUtpNuwBktt7JaKx9Isy+cdFK+lWK
         79aQ==
X-Forwarded-Encrypted: i=1; AL+hErGCR8w9/4Y0eedcfXnfO4j2yw8kbzRdDdWTkjK9VhJr4MBBNhytlAEjvrJAF4pI0nH/vF0BtwMXuyo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OpPMXpudxDJmZMve7wVwGSt+EmPWo1HxQk8fVkih+lMsO/wPv
	v9u5Y/h2aN36TFLZkjpVSBFEBoyyLKO0KXBbfoXE4CzIXyGTIiiienbkVvHNvLC3WSI=
X-Gm-Gg: AYBFou0jCSI1cJr8Wi8NS1G7l2OKgfVE2MG1AQOYa9sYSV+4u7p2KXLT9zBwB077ctY
	8c1brbzKzq5MezLujrE7OdwLW3oj5dWO+N+SlZTO5+R1hU/iYYFoIWDzi+0gGlr59ho3C9ZbIde
	jv6++xeW06XxEFxMOKqgY6tEHeKr+nbfQ071/D6upxCDmln/KXdXUdvtt0sPJIhJp6eU7srS47n
	ieoZDn9zsdvTScN6h+1vmNcfjkdI0r7xF8f3PZ6/pF0fzUgdoVLM0BVwtkbzblMOo0szd5YblgH
	uXBcIOedt+hzBXVyJzPNDKO2RdUTw+FHRQ/gk6NCeN/pm0DZHoVrRIZYfioRE3TNNLbgrX7k/gH
	AJbQItbVdTnI43Jk2TxqgSfV7gcCn2FczCfb8jpQOdTYN8MCUQeILqUB62HJuBEVATImpSlqn1l
	DEWi/ooyynTrjp6zwo6eaydnsZLAA7ky/Y9yY15PaMRoDcCnP/IW6Ilbs5ptqDBqLCOHtnXviXo
	4zRHmqFxcrkIPnE6OGAwDuqlDPxhJ1NXdCaWaRCSYUq/Fs2zXHtHBWsSuHpIGhgdfZXNuWOHDwL
	tLv0SDW3WvJdVEdH1yX9JsBcxt2px5+eg9BMvz2TX3PV3LCG9L3w2Y4SQt5iyv0cmKX3hFhTBkg
	g0t6At5lZNox07vqKkJJvs88JcftH
X-Received: by 2002:a05:622a:4d98:b0:55c:e8b1:3349 with SMTP id d75a77b69052e-55ce8b169c1mr107785991cf.25.1794845622539;
        Mon, 16 Nov 2026 08:13:42 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c6025f5sm868661285a.5.2026.11.16.08.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:13:42 -0800 (PST)
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
Subject: Re: [PATCH 2/2] mm/mempolicy: limit shared policy ranges per inode
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
In-Reply-To: <76fc4555-b458-491b-ba2c-ec030879dafe@kernel.org>
References: <20261113-mempolicy_limit-v1-0-16688b2644dc@kernel.org>
 <20261113-mempolicy_limit-v1-2-16688b2644dc@kernel.org>
 <179467808112.482102.13365594235443107281.b4-reply@b4>
 <70740a32-92f5-4425-8676-68863f3e44c3@kernel.org>
 <179468794889.482102.14066028910704780583.b4-reply@b4>
 <76fc4555-b458-491b-ba2c-ec030879dafe@kernel.org>
Date: Mon, 16 Nov 2026 11:13:41 -0500
Message-Id: <179484562114.482102.7068121367282977254.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-15 17:40 +0100, David Hildenbrand (Arm) wrote:
> On 11/14/26 21:25, Gregory Price (Meta) wrote:
> > On 2026-11-14 21:16 +0100, David Hildenbrand (Arm) wrote:
> >> On 11/14/26 18:41, Gregory Price (Meta) wrote:
> >>>
> >>> Multi-task mappers were previously unlimited, but that seems like more
> >>> of a nasty unintended corner case - not a real feature.
> >>>
> >>> A single process is already limited on the number of vmas/policies based
> >>> on `max_map_count`, so it seems natural to just use max_map_count
> >>> directly, but I took a brief look at some distros and most seem to
> >>> ship a raised `max_map_count` (>1 million) by default).
> >>>
> >>> I tested that and even 1 million can cause a soft lockup.
> >>>
> >>> Not sure there's an easy solution here, we might have to rework the shm
> >>> policy locks.
> >>
> >> Do you know a single valid use case that's not solved by patch #1 and would
> >> trigger that many policies?
> >>
> >> Ai was not able to come up with anything for me.
> > 
> > Just want to make sure the bases are covered.
> > 
> 
> Yes, and I'd be very happy to learn about use cases.
> 
> Maybe we can let this stay in -next for a while before moving forward with this?
> 

Seems reasonable, although just kind of delaying the inevitable.

I suppose the mitigation for it causing issues is backporting an
increase to the default size.

Eh, if the concern here isn't a big deal, I'd just say ship it.

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

