Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201148;
	b=O9y/Pv9Nwm5lNsTya1SnLg7q5wgmj9kvY4R6duzZmd0pX+WA9Ciu1O9WV62fEvDGnP+G
	 ma8zZcZdlWPFJdAG/eDwnodFtx4r+XAEfRkLyeBTlHcCeGpy25gljfAlNHdNmpfgMAc1P
	 OyperCLSeiMJoVamZEweqpJ6DJl4cNR/HhFVyCum9N5ZwYcAuVu+Jf+WCUnKchK/uoQr9
	 r5KHPPbEKWZou2keHwHzUptRhdHwRyh9BLjvFy9IXYPEkyIzn7eYZmw9q6y0aq0S4Svzs
	 Tr2TqkyJai+fjMNFddx2Av6U+nw593HpLt/T4hz51kJbBuDazfKMgPEfnq95uq0hByQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=QpjWV7nVPK4jNL88HvKbtHJ/44FkOvQPFo/KHrxl1Aw=;
	b=N3BVHuBJgtaVlMjCRawAFJt7QhpZqE45F3km/SosA4F/DkWcI9bG9JIhMccQjnD+Zhb0
	 YJXmlolLUHWkeQVajREfkRQHzoaJ2wde6ohAVXGHcIg2gJA9Rvbxret7EsJuwiYb2Z44U
	 S6dR34JM66rmv5z7Zc4CCvtlYYrbJo3Kw9dBj0yyKFYqVriiqFQgfkswzdOl7Hd2QIbtB
	 eJunGS/PKTX+1KizSiym/yJqu1vOsN8HGKvRDCA2crXe6NPfN93M7NIUBhMluLdSQyMtm
	 9fDoNdYIjIS5+ooLbRTCX93n/1rdZa9eLaRlY+HH+t1uo8DO1Zt3TFB7pAc9PMV0ePA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Na8SXjJd;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E0E60A260F
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 18:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5E0E60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Na8SXjJd
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-53644b28706so19849451cf.3
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 10:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795201145; x=1795805945; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QpjWV7nVPK4jNL88HvKbtHJ/44FkOvQPFo/KHrxl1Aw=;
        b=Na8SXjJdGUVWDeqxqwuMR3Udnc3JNjfyk3MTxe3QTRK6WZ76d7I+8tS90Y0CdUuXZA
         ozFtgrB8we5s3tBqJqZcDv80Ku/wbh/GB4PCsBMGwkvpKkzwa34jt1f6hdT26CVXC5UP
         CqXkNaWn5gwOSbAvxEed0NE1PQJozJiRIR7CWvSazN38YSX1t5MjQC7PqbHfNae4SLU2
         cRYRjbxZdeSI2Yb8n7W13IJok9pj2aMDEqWhp8T3dZvqoUOiu0H8ebtzuoxe8RQRnyoe
         2tmTqqK0Yz+5RXyD+Ed2jDx8IyB6oTTNJ8Tf0OYn05H7iul3Rs9K0jNoFETg+lTdYUmT
         Z6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201146; x=1795805946;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QpjWV7nVPK4jNL88HvKbtHJ/44FkOvQPFo/KHrxl1Aw=;
        b=LYnLOXbsRQI9j4SjAlbwPz5WK2bthCIZZ56gt6RANpXpchQjkux7VlKVHerk/bo3NZ
         Ijutre29uPB0ax0nEDnODg0ZBmqB8HYJKFSuVGF9lgSwJe26h1I8s5UsYfK6lboPAaSO
         ymVaaXGCCLdbnFXKCEV7VTTXm0QkQMcMPZlevlLJc90Spriu9OZTErP4BzytDDNUV07i
         wO8SaOu4PS3yUvCCbMnIqWi99PVC2wnYylkgNpQcqe3lV9t+VKIz81TsO3ERG/9YnnYb
         RFlvl+QG4nVgAYxO+dNHjESCa0+kZXC2YMYhOsjeQmjN3KKTCUYVGaI4N7F70ghqG/GO
         4vSw==
X-Forwarded-Encrypted: i=1; AL+hErEAyfxiHWBaGHbWBXK3izIJXolY8whXcFo4au0ehjnTF3jF5kTKD1Y/LfMfMTwtcm6thaXG5m0bsYk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2mEAnmnBalA8KDTtMcdG1QGiuxpgCcaV/fuqyrHbQ0v52NPuH
	yFf9sVEmMgKAdoqipD52Ct3MM7ZQJTIMxEjU2dWiKccDyWU10i0g65w48P3BEeWaWCs=
X-Gm-Gg: AYBFou1vPuO8a5AFWGmZrhLnY+VVq4PNzAYdjd58oMhkxjLkSb0XazrF0pECIaVlKR0
	uZMxXu7YZN5RQ/9fWuVhDhf7eN67nWlYAU3xYsFDK3GfFvrK6qvD4tzhWgeiXozuJ9DS8eVnvhh
	HhSy3m99XAi9E3S07h1QyCvXwCKe8ZCRBy8rLpUQEG7ousNZG+Jc5o85NKL1/Bx3KvsW3eo6qJx
	kpi/G5wDzYSdhN8jkc0GZZkF9EW3cFfeMrXZmL9k5p96EAYAEqlC1BmZJ7Ogts5lodRbg/zVF7M
	R8F4mSqrJVzqsVlOUPi9322F+CsVJkTWgak/lx9iZKzglqaeQW2CZQPF8UUoupudXH45+YJeFi5
	DRQ1IlgDsgubbcsb2h3Kb5EQqf6XiCZ5HwrpmwLJ2fvo4gMrFQTfyM7U8ft1qaUUwPWXf9+8mZr
	C9qTa2cKxPOgxRHsDpxBDKdTGNHzEPnz1IeyKW3nQ5un0eaukYjJ3Gq8k6HCVOOLBNOe+NJusSO
	WOk4JrqRXKYBwBFxeGTRstmiUb4dX08gjE4MoKBTSdNbbYvfHBuvGwawCcFR6Khjcl4Cc/pzTag
	j2LzQotJfztalxnCduzduwjqQ3osSZKk14jttaVQBMsvzeK1cmzHnHmXntSxcGr/8ZvebPVuv/t
	Eznla7tk=
X-Received: by 2002:a05:622a:1a89:b0:55d:2c9a:3776 with SMTP id d75a77b69052e-55d76a811c8mr74428711cf.65.1795201145651;
        Fri, 20 Nov 2026 10:59:05 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7884d01csm30305771cf.21.2026.11.20.10.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:59:05 -0800 (PST)
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
Subject: Re: [PATCH 00/60] Private NUMA nodes
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: Yury Norov <yury.norov@gmail.com>, 
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
In-Reply-To: <20261120-private_nodes_v6-v1-0-74f5f9a115c2@gourry.net>
References: <20261120-private_nodes_v6-v1-0-74f5f9a115c2@gourry.net>
Date: Fri, 20 Nov 2026 13:59:03 -0500
Message-Id: <179520114342.412063.6068641130948664600.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-20 13:08 -0500, Gregory Price (Meta) wrote:
> This is v6 of the Private NUMA node series. The series falls into four
> parts, each building on the one before:
> 
>    1-18  mm: introduce N_MEMORY_COMMON
>   19-26  restrict folio-walking MM services to common memory
>   27-44  N_MEMORY_PRIVATE, kept out of cpusets, mempolicy, accounting
>          and the page allocator's ordinary paths
>   45-61  private node features, memory hotplug of private memory,
>          dax/kmem private mode, selftests and documentation
> 
> Patches 1-26 change no behavior on any system and can be reviewed and
> merged on their own. Without private nodes, every path in patches 27-61
> behaves as before.
> 
> The full stack is also available at:
> https://github.com/gourryinverse/linux/tree/scratch/gourry/managed_nodes/private_nodes_v6
>

Apologies - my b4 prep dropped a commit from the stack because I made
the mistake of filtering on author (myself) and it stripped out this
commit:

https://lore.kernel.org/linux-mm/20260923211041.3127588-4-gourry@gourry.net/

The commit is one the branch listed above, and should be otherwise
indepedent of the series (can be pulled in ahead of everything else).

Sorry for the noise / compilation error, won't happen again.

-- 
~Gregory

