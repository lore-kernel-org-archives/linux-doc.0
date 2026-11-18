Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015260;
	b=BwAgiXnDH8hENkMvdrDgbIfw1GD8K032YkLbTjw4XdYliIGoatnvRUk+XiSOMtkfClgS
	 hVyQTmkYVGNw2OVHv7RVH61RCEHJv4y8KidyAkRDyZ2OwmHLDiFj/VfjbPmcG+OO9e5za
	 C/bgwz0nNwetnNM/2Xxq+hOCfN9vc6R9NZE5EmwSk71Hz9lsid5uXI74l+bYISro5SgNl
	 NMgXl5A3aEJjY+tOZsXtxSfU4GmYz3AiJkdfJRAN+oUmxBFPItpq71dX056utck7kBVOT
	 9w78IIq6aCWUrRtzuHC3JDpvm3s5xzcQtri+8znHxOkNc3e1gQyRTrxYQKMzhXmhZ9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015260;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=2f1/3qPELFtVfaXBFluo86ffYBKVD1HppO+tx/i4yJA=;
	b=5EOMmKeyaftWcNez2thSZElYJmuukiuhfdnfpnKPeb+ewgweTJ/jvQzUBi5cwYj3XgmB
	 /mGEy0PU1CsxfUyiq4dTUlkpyOhEU4dXOuFhxOCE6bL0okGQ9qQTDUi1Pb0aeMOmRvHwZ
	 igtCyiR7PNwyjJ8hXOyFuZe+/XmB35kWDrFeGfGswQzKyiujQBQbCLFvg1NMNZzxb9RFy
	 qUoOpjJi/KTWqOeBcF4AKdgiKDrayqWzDQ9atKdYSxCnl6YmciJJl4szrgfv2Nqnh15Eq
	 sbsBHvoI54nQONrYGaXUCaWwDGuUNrCqslfmlpvVCCQaCVVsTBEsgE5yogWsKF6Lllg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=RcYjlh9r;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFB960A2606
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 15:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDFB960A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=RcYjlh9r
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-55d2d380f6aso11815781cf.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 07:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795015259; x=1795620059; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2f1/3qPELFtVfaXBFluo86ffYBKVD1HppO+tx/i4yJA=;
        b=RcYjlh9r4IRGrafd+j2HLcUekeO369jG4cJ8dDVzoBY8gvpxzJeyqK3ozNZlwuaNe+
         dX9eTN+iN1SLvDXv6ZqfqHOE77V1vdoVQpS9x5MRrqE0S7mvRfL6sw/ErTChduS84etH
         nS7jQ1GGdAXlIAaPdld5HxgPrnOoIx1uTeL6PFILkkDVhQvjQ1L/cdSpt//oQ3Sg56BU
         7DACo0lblGCgiebYjG3dsltULlbJRKP6YYtH3AIXL4Ytr8g/kCuFnCukKTYSpuqs6WLs
         H7LrxeAzRj7uQcJe5AdxVin1iIq0eKGTVLMXmX4R0D0sv+hVEZxbt0IeTxFEciavpACF
         rBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015259; x=1795620059;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2f1/3qPELFtVfaXBFluo86ffYBKVD1HppO+tx/i4yJA=;
        b=10ogV4rcoRduS0g2HnS/tRzPME26IokD/D35T+X3GCCIggotjWAj+TY0ZnuYRKh2ez
         kPnVnUun85LDtvgM8JC9DcpKxPfGDO054rR/5X39J4gQk0KpyuS3e+8XqXDaRljBnDs3
         1xD83Okl6pn9kefMgNrGNWp24wlmqdN6KWmegGK6rTctVNXIXootraMaA4nadAdt2Z0z
         mpZ0r3rV+E96kHJPjuxC9+tooPrmxveM4EO1ITkDsqI+uA1kFMglxry8D94VrUenWJsb
         btp7nKHKOfkv9Vj95ekXsyGnxfZPlZYbFuRZe9xpbRt1BSH7TBE2XZB1RZkTbpruHohU
         ReCQ==
X-Forwarded-Encrypted: i=1; AL+hErHQ/pksYW54PDQz3MLkPAQYqD+nPFAULywync4ORpa7ZrVPvYHhYZpDl+oGLe/vrezkKUx9rI9QGIo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QvmT/TpAUYb86f+vj2IUSRkA4RIFabw1DfPOwoXNX2vZrso68
	aV2L2YZP5F1bgkY8z72ZZFbEG4YMAtk++2Jngg29neML9SsjVIqZmOKl2DOovjkdkrM=
X-Gm-Gg: AYBFou2f3ZqcnOvnBDHQthSVFgoUYjXSHzliASZMwqSlatCNEYvyZrrcqsVb3uxUxdK
	PF3BpjsEkiCS4IUv8ILHuphklUJRl+gPu7xmg3aZbSpNtFNRnrlSaY3SKZG3zQIZxCkewNc/olb
	BUquX0xd1WwqBR1zXoSCevZ1iNHb3+oZg9/dMoKjzIEE/O4+QNkpTYlhE1DoWlIZNzR4OK6/HMs
	Oc1su3bW+9LSFaDztQaSa8bgYWC4rj018zAZVVr3tvLBrKXSWvs2V1gP2kbeRITuYiT2ajkI+kG
	Bnj1KHK1xZTN1pp5eIUNCK4ggBebPFFXB/HYfXZpXy3yr7eQLqcahyTPS9puoqdWaWx0tKB18Zp
	gQbALcE5MqsZtJek5OepSVB1f7i5ucUALd/XEkiX5V+qqzGE4kcK5+pSBmmpHnENocwh2eI8MmG
	Up7dXXQ+RCE7aRECiCBw8yttxgrdA7Uc/R6LwyAFAFtGlSFfraKDR+S78RdbMmM138AGDIq/VNQ
	WwUGouSbXxanne08jngva/8NKQG7nPB1k9EKetiIhzrZ6FlJU6d785CyKtVC1fH4HvQmF9CADDs
	/kWjoHuz52ygE/oPnuNqXSoUq1fLQmxml/8TCHi7BFzBQluYTJzAsGUc6hhQrcksdfoZy3ustaM
	b7f6GT98=
X-Received: by 2002:a05:622a:a0a:b0:55c:66f0:5bf0 with SMTP id d75a77b69052e-55d5a656766mr42047121cf.39.1795015258621;
        Wed, 18 Nov 2026 07:20:58 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921167f4725sm19632976d6.44.2026.11.18.07.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:20:58 -0800 (PST)
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
Subject: Re: [PATCH 02/22] mm: publish and clear node memory states via
 helpers
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
In-Reply-To: <av1ZBTpLpJC6DJqA@MWDK4CY14F>
References: <20261114070959.3490008-1-gourry@gourry.net>
 <20261114070959.3490008-3-gourry@gourry.net> <av1ZBTpLpJC6DJqA@MWDK4CY14F>
Date: Wed, 18 Nov 2026 10:20:56 -0500
Message-Id: <179501525661.1206716.17622543796948053737.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-18 15:53 +0800, Richard Cheng wrote:
> >  	/*
> > -	 * Check whether we are adding normal memory to the node for the first
> > -	 * time.
> > +	 * Publish this node's memory states, including any newly-normal zone.
> > +	 * Hotplug never adds highmem.
> >  	 */
> > -	if (!node_state(nid, N_NORMAL_MEMORY) && zone_idx(zone) <= ZONE_NORMAL)
> > -		node_set_state(nid, N_NORMAL_MEMORY);
> > +	node_set_memory_state(nid, false, zone_idx(zone) <= ZONE_NORMAL);
> > 
> 
> Um, so I am not sure how much cache pressure this will add, I assume it's small ?
> 
> Just want to point out that the old code only wrote these bits for a node's first
> memory. THis now does up to 3 set_bit() calls on node_states[] for every onlined block.
> The result is the same, but node_states[] is __read_mostly. A test-before-set in the helper
> would keep the old behavior, or if you would like to keep it, please address in commit message.
>

Hotplug isn't on a particular hot path, but I can test N_MEMORY before
setting any new state and just early-out.  That would keep the behavior.

-- 
~Gregory

