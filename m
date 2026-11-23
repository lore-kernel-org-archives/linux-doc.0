Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442547;
	b=oUaK4II0qTnhc7NI7D3D45euGkV0cJ7tafS4sp8j9BDT/RbqFE1a6uhxJaCVkn0Z285a
	 eDkwermgwh/sGq6Y/kp2jf5I20nrairKphZsWFeSQ3au48M9RJ2aCKzDmLuw5onsu0jnL
	 /euF9MXH4VJv0zFEcL2XASspDerlY13f7GMD0aJHzFZbyE7e36MbfFagmadnTQryzlCjR
	 rgW1sOM73S8Ifn5KTtj8PjHY+wZeASuLp4LEPS5unnSuasPZ8kB+z0VGWoYGt6UcnfrwR
	 rLqS4rnmVn0Z9s7DARp9WphjhEirmniPPPC/tuM3BQbtA8rskyyO3kykEFskj9HvOJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=K3PKiWxJL5rA78k4RAfL19Ict6G9pZhcXRFYMUNqZcE=;
	b=X6zFj8fCMw8fYyVuyZal5f1RBjWhaYE3MRLpR3ZrQNB9AEjRoqYkSpwBNA4WwkNqNOGJ
	 g7m/mGjA1OF1vEhPV4bZKShS50EVpnNyO/kycOIe0hKvOgXST+0lORL+KKzAjedqehOtT
	 c6LK+mUPTIzYbihQ4TPtXhkQME0Q4gSyQlL7nwZ44xPuJpawZvTSH2tgRObmW1pWyBNXm
	 vqjm6Zq1C233ToLHml98a96UJ/7K1hGwhwIyLAvdgKbeNBDQ0Jut6//852QVNP+rNVeux
	 mDyvPwbne3sBGZLFStYTJ/wnOMGKGpkE4cS/5l61g5a7ZZkWtvoKFVK+T4S/anLuTpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=VljreHg9;
	arc=none smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDCF606A33B
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 14:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BDCF606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=VljreHg9
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67daffde88dso1852746d50.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 06:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795442545; x=1796047345; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K3PKiWxJL5rA78k4RAfL19Ict6G9pZhcXRFYMUNqZcE=;
        b=VljreHg9fqduoNCuhUvYdI6zY5hBHSeYwhiI7vf7summ4dEKYq9hFOCCfR6aYF0/2P
         L2riCG2gI435GeC7ZNsfR6fHTud24o8gBnAqDt7qJDsirWdVpATYePJDvcAuDTpix9n4
         LGwyZSTUtozFudCUJyvSw4q4iZ39AoKFu/CZ9iyFv+g5+PfiwXHcWW/55SiIwIHTxq95
         +D/FF6JCGPVqldEw7rHVuKYVNkvZaIANpP3McjVm/7nMaF69sLbbfoPbYTj1aNHccjUA
         BzZMskVSpQ48oEk7/U4zjyTsdufPf56rPR+BY3dYNsiQKYzFM3LIFVLAYoI1XW3G3WoN
         vQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442545; x=1796047345;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K3PKiWxJL5rA78k4RAfL19Ict6G9pZhcXRFYMUNqZcE=;
        b=UVLfcOKr88Gn3yWwUKia2kCeeTuh0YhByRUyi2TheS2wjkk5pB8/cGWQ4jjU99uzhv
         Ax6CnQjxl+zQzDv8xqIfjhxwSADvWFnZpfP+4+B/5k1+4tBcOQLES+bztxHIMNTURGaI
         IzwgIzJmCmo67RGHYuP0mF4Nx0iaG0uA3lVG8CpFaf9FdDA4T5Mos9GAS+yzNJn7BuF/
         ZL2aMbjvWedMx5u6R2j00IyZo1w5/H9td3a2Q4o0TtH0lFKZ8WdDIGRlLa6ruCM8Msh5
         QlxY3apsS3tKeK87VlEX96UEw9AUM1NUMy6aG+HOGidOyaArlPxb+pDJ7BJl8vRUBrRU
         J34A==
X-Forwarded-Encrypted: i=1; AL+hErFZGSEEMfb9P+mq58w5OK9SGE9XpJgDvuBirhRbk8JJFGZUUp4nuxcxlDwnrcJmGD2qrTqNsg+3DXQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Drhs3frLjfEcf+l83k4sy7PoN5R4Mf0SCs6yjU+rtASLFbwEM
	9BCu4tOR5qx6pgCqzqXGpoQj1wVF2y9Y/iGrMNSIC3DB3AKN72FtOlPhMKmdCOe0r7Y=
X-Gm-Gg: AZFdTZcEC9ne71OM4DgywMor+2qSehVk8OzXLPdbR8y5O8XyNU/xWnRLWrs5wgG/3d+
	3zxwJW6LzjybrT44Gxnlo7Njt8NdMWrftGIAlB0XbrWmuwVB/XuQ5q841lZgQs/CcI1oEfdTd/y
	qOWZv/fewfBGiRZ2u6OJ/2O1Glx9G6H+bVXLyHUVonzhkbDhMfpGyGO1mpuOAoxuQK3/HwYDaeK
	KUpIK37hcbOpnIZPM/pRifsr+6i1+nnh91bnxmdsPaAxGQLlq6H/IQmarGjW95r1TglJV7NsvMD
	t/NDTc6yhUcLocjabAhE6rha/zXuufaWAtwGtqkfBgeplUyKMkk8S2xT08HxsiLJ3fGs+tbsMzC
	ZukVsoMqnzdG9NabUSL9wV99PT3HGrdVLb8kF5Mrhaoc7kEstdW62DfwKuhvJBB/w9yYydwHjUa
	4jsYVW/YqxKb8LObOX7/EOfybDgVjoJWSFcu4B3ZHEtU+ZePtwntVqYRmyAh922HzB6VJWuVqA1
	xuLVdPucyrrhm5niG6mUuuAJI7deWq8Zp36OSnPOqI2BTv29rfnGiEHtv7dcPIxKgtAg7/YNph2
	j6bd7kG6GAXEEiWWg8OUUWlexP1hN918XgU2T/mwZDD+zTgMrwrLeKD+cozSZTB4qU97Gp3Oz6m
	yvpQy4ms=
X-Received: by 2002:a05:690e:1449:b0:67c:b95:6753 with SMTP id 956f58d0204a3-67df451a476mr4209002d50.146.1795442545280;
        Mon, 23 Nov 2026 06:02:25 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213515f467sm104854846d6.41.2026.11.23.06.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:02:24 -0800 (PST)
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
Subject: Re: [PATCH 18/60] mm/khugepaged: base the recommended
 min_free_kbytes on common memory
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Yury Norov <ynorov@nvidia.com>
Cc: gourry@gourry.net, Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 David Hildenbrand <david@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Oscar Salvador <osalvador@suse.de>, Johannes Weiner <hannes@cmpxchg.org>, 
 Suren Baghdasaryan <surenb@google.com>, 
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
 Rakie Kim <rakie.kim@sk.com>, Ying Huang <ying.huang@linux.alibaba.com>, 
 Matthew Brost <matthew.brost@intel.com>, Byungchul Park <byungchul@sk.com>, 
 Alistair Popple <apopple@nvidia.com>, SJ Park <sj@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>, Kees Cook <kees@kernel.org>, 
 Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Michal Hocko <mhocko@kernel.org>, David Rientjes <rientjes@google.com>, 
 Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, 
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
 Xu Xin <xu.xin@linux.dev>, Chengming Zhou <chengming.zhou@linux.dev>, 
 Lorenzo Stoakes <ljs@kernel.org>, Pedro Falcato <pfalcato@suse.de>, 
 Jann Horn <jannh@google.com>, Chris Li <chrisl@kernel.org>, 
 Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
 Youngjun Park <youngjun.park@lge.com>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
 Waiman Long <longman@redhat.com>, Ridong Chen <ridong.chen@linux.dev>, 
 Tejun Heo <tj@kernel.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Dan Williams <djbw@kernel.org>, Vishal Verma <vishal.l.verma@intel.com>, 
 Dave Jiang <dave.jiang@intel.com>, 
 Alison Schofield <alison.schofield@intel.com>, 
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org, 
 driver-core@lists.linux.dev, damon@lists.linux.dev, 
 linux-pm@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 cgroups@vger.kernel.org, nvdimm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org
In-Reply-To: <awMbTMt2M876rTy9@yury>
References: <20261120-private_nodes_v6-v1-0-74f5f9a115c2@gourry.net>
 <20261120-private_nodes_v6-v1-18-74f5f9a115c2@gourry.net>
 <awMbTMt2M876rTy9@yury>
Date: Mon, 23 Nov 2026 09:02:22 -0500
Message-Id: <179544254257.412063.6102711886866280853.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-22 11:41 -0500, Yury Norov wrote:
> On Fri, Nov 20, 2026 at 01:09:09PM -0500, Gregory Price via B4 Relay wrote:
> > From: "Gregory Price (Meta)" <gourry@gourry.net>
> > 
> > set_recommended_min_free_kbytes() reserves two pageblocks per populated
> > zone to help THP allocations avoid fragmentation. The reserve serves
> > ordinary allocations, which use only common memory, so count only the
> > zones on N_MEMORY_COMMON nodes.
> > 
> > Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> > ---
> >  mm/khugepaged.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index 2dc4245814df..a930d99f89da 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -3151,6 +3151,9 @@ void set_recommended_min_free_kbytes(void)
> >  	}
> >  
> >  	for_each_populated_zone(zone) {
> > +		if (!node_state(zone_to_nid(zone), N_MEMORY_COMMON))
> > +			continue;
> 
> This is the 2nd time you add this check. Maybe fold it into the
> for_each()? Assuming, you keep N_MEMORY meaning unchanged, that would
> look like:
> 
>  #define for_each_populated_zone_state(zone, state)            \
>          for (zone = (first_online_pgdat())->node_zones;       \
>               zone;                                            \
>               zone = next_zone(zone))                          \
>                  if (!populated_zone(zone) ||                  \
>                      !node_state(zone_to_nid(zone), state))    \
>                          ; /* do nothing */                    \
>                  else 
>  
>  #define for_each_populated_n_memory_zone(zone)                \
>             for_each_populated_zone_state(zone, N_MEMORY)
> 
> 

thats reasonable, thanks!

-- 
~Gregory

