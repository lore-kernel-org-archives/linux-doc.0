Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442719;
	b=hPlfLbhsLECsfxuuhtDFXTTIwIyCO755etLodsTz4B+3w8O9przLqJcobBgSJ5dBEaJf
	 UnrYGOcr8F3Rl89FVY7ms5O3zpxktBoM8Losgnpy5uKljV51oyWSqQbXJt+mGAnL9bqCu
	 TIAEJ+YTUhHQjXWEY3YM3wTLeTpf4+eRB9+kbqtVNIKucHXUA05CoIgkYUV7ThZZC5ABY
	 yBWSX+2lTQ38xKrbS3yOUu3iipTDtlTi+1C965Yhm8uyNHJoDFxWVM5nL16dppCmMMhN4
	 1BWe1peZknutsVsD2I0bY7Trsk4z6PaRHMNsLTnBph7jjozDFRfqn2VjJ4HOYXpD/HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=njozbmbCn9bcbYemCFYN4fFcerXn8LRoys/sYPRNDos=;
	b=FgrSDsFQ+u+0EpC98OY2YemO5MZGFcS/P+wL6R8b1aXo0pEDU+AxzQbEpKMBoidMz5JV
	 klgQMJ5de6zl/a94dlPacbzWKQLdhoo+E6R1ayUnPms0D0VlAyui+7jsJK4Tbvkb3wrGs
	 qFIS79QBL/n5uAPGmR7ce3D4TXTef1upiRouJMDaDjnNv4CSyZDirH7W5qhPX1uPYOZjI
	 PJUZUbdU0G3V3dHuczfheNcQZw0yo3Jhat32MTNcqyhOU456zIAJ4tdRBK8VOplMQ/U6D
	 KBD/KyXBWmQPCzKUZumo8mzsCKtYp+whuxq2RZ/BSrdkpZ7K5MjEbs7ADbdTh3H+ehg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=igq0rNBf;
	arc=none smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B11A606A330
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 14:05:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B11A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=igq0rNBf
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-679a2b5fe87so3115352d50.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 06:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795442717; x=1796047517; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=njozbmbCn9bcbYemCFYN4fFcerXn8LRoys/sYPRNDos=;
        b=igq0rNBfR5HbxAZkN3J9ZVhbsB1qEA961sp/d7IqeNGyTiy13BYtzWR9s/RamaGEgu
         kc4sU+btJ7XNLZ5KXBxvURVrVQTw+iIpKNkheMbVp3xGacR1R1kfOolkY9OvEfyDy2WU
         t8c3MRu8Ph/FVIkYBtPSoZ4kr+2q46nvdG4OkaZ8HKw2uHjsXYgGlmshpBuDHEEM6Ue2
         CnIWmzY9CuCkfe/LjkxDPgvTI37B5eL8NNhGF5PzhFOodXssf4pgSvAhXFcLZzhsXatI
         zvry3mYpF+760cfsuTrJwWemnN2NLrmMWr51jTqFRXg7TtEf6JJSY0VorkioDqKLVzoA
         4mWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442717; x=1796047517;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=njozbmbCn9bcbYemCFYN4fFcerXn8LRoys/sYPRNDos=;
        b=SK5hhkPJCWWCkJqK40Hv0MQOL09iA6EpBTSkD0CBj/QcHvAJI1tiauFlIJ8mqPKcl0
         ZQLr5GRNghrn+sVYmragiG+hZgIr9RJdto/SAdyYuwrlzRxy2ZlvylWvPRFM+kfFNnaz
         79N5OWL5dchJd6KKgFqObo38fu2+a0lKJHVZopNER3ZdX8vh22TgtxMDKc7MkIzpew1o
         louiV97wrU8IOBoHC7rY8BFlW8qCW+SUT/X34wl8vz5xH7a1UpSMnJsEvi4PBHDek3qh
         vQmXTgs3fsUieORQD2FM8GchvJs5HV8nwHyCMrHlYVO396DDMo3mQmyHRt2unuLeKS0t
         Mb2Q==
X-Forwarded-Encrypted: i=1; AL+hErFRd03ByfreU+DNXUHCDBCd2JC9hVaDQeB+EQKDvKdjrhJbmJ6PRpW/BubeGmDOrYkW4gC35MXJ5uE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lD7FDm61McU/8UGR6FsCMl25YMPIQDqgSG67p/mzlg7nzEYb/
	BfpVwr3dvPMR+os3CkFMT4oP4lZLO9to/zqn6O4ol++2RyWsgAhJlWyYKMBnIrrz8Ww=
X-Gm-Gg: AZFdTZe1IEILRT5tg9LkfWS5wTAVyhIYOxG8b+2e2yme7Vw15nn/SwlpkjNoDTqKOfe
	UlOPCLEEnIVA/MKKewGIPqxwvq75tNceXpCz/FCg10qe5JNWa/Xvj3gIcPijVzlsJnegArCsujS
	dzxa0gRLGqt36qee9HJBXFi4GCWcSj/4cOL/Qs6ZEVOXTUV+W3bFIMOG59ogl2HfbyFTwIC3Bha
	F/V9GTRru4lbq2inncWSFtHfR1Fa36KnC9pCLz+Mj/KJiY2iW59I8IBE+Hwt9DqzQCH1p1bcP+x
	++l3WuRI2i5gIeLSdr+m12W2cVeMkFDTZWBK7HEBuX74poM1jGWJoeA5YiriADqAPgjQ6dL4AhT
	FIVbAGTcOaBdRyoLngdlZxliSOy7Elupb5g2ENx6Q4qKGoWVLBDtd8WupnSiHNJcpPSRuddBaac
	yAEcMDnhcoO2GT18IFwQbzQ+oN5KG/rATWaCu+cT0t5Gndm/FWUDE7kHz60OiXhRxFu3iztufka
	508G6bzuV7Y9oWl266BFDubz08S5wmUlaDj4JQGpQdtNOF1FvGHaE1UkcIPd/ch3Hf67bM2+iBn
	lRtOfS8w66DyQNj6sKjhekggTIy62mf9cGQEnDpNuf4ctc5SS/1YdYx5qkbZFMyKnHrrEQll7ig
	gegcwH5R86Vs6JBYGaVGro1J4xRsW
X-Received: by 2002:a05:690e:4881:10b0:67c:efb:636c with SMTP id 956f58d0204a3-67df4425656mr2221811d50.51.1795442717363;
        Mon, 23 Nov 2026 06:05:17 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a08552sm106091806d6.34.2026.11.23.06.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:05:16 -0800 (PST)
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
Subject: Re: [PATCH 23/60] mm/damon: restrict DAMON-native folio operations
 to common memory
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
In-Reply-To: <awMcsTqyCgQ0dISw@yury>
References: <20261120-private_nodes_v6-v1-0-74f5f9a115c2@gourry.net>
 <20261120-private_nodes_v6-v1-23-74f5f9a115c2@gourry.net>
 <awMcsTqyCgQ0dISw@yury>
Date: Mon, 23 Nov 2026 09:05:14 -0500
Message-Id: <179544271490.412063.3555696768623975197.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-22 11:47 -0500, Yury Norov wrote:
> On Fri, Nov 20, 2026 at 01:09:14PM -0500, Gregory Price via B4 Relay wrote:
> > From: "Gregory Price (Meta)" <gourry@gourry.net>
> > 
> > DAMON acquires folios to age them, check their accesses, and apply LRU
> > operations and migration. Treat these as general-purpose MM services
> > and restrict them to N_MEMORY_COMMON.
> > 
> > Memory outside N_MEMORY_COMMON can still hold ordinary LRU folios, so
> > it would pass the checks that keep ZONE_DEVICE memory out of these
> > operations.
> > 
> > Treat these folios like ZONE_DEVICE memory.
> > 
> > DAMON cannot acquire such a folio, so it never ages one and virtual
> > address monitoring reports it as accessed, and DAMOS cannot isolate
> > one for migration.
> > 
> > Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> > ---
> >  mm/damon/ops-common.c | 5 +++--
> >  mm/damon/vaddr.c      | 2 +-
> >  2 files changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/mm/damon/ops-common.c b/mm/damon/ops-common.c
> > index 15cabc79613b..57201a0c5e3a 100644
> > --- a/mm/damon/ops-common.c
> > +++ b/mm/damon/ops-common.c
> > @@ -17,8 +17,9 @@
> >  
> >  static bool damon_folio_acceptable(struct folio *folio, bool monitor)
> >  {
> > -	return folio_test_lru(folio) ||
> > -		(monitor && folio_test_hugetlb(folio));
> > +	return folio_is_common_memory(folio) &&
> > +		(folio_test_lru(folio) ||
> > +		 (monitor && folio_test_hugetlb(folio)));
> 
> Can you minimize the diff? That would also improve on readability IMO:
> 
>         if (!folio_is_common_memory())
>                 return false;
> 
> 	return folio_test_lru(folio) ||
> 		(monitor && folio_test_hugetlb(folio));

that's reasonable, thanks!

-- 
~Gregory

