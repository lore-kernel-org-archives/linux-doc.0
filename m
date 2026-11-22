Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795374696;
	b=siCjRw5stcAO/sQ+mkBbcYYQf6s/k7Ke8H4Vr8v4eh0lGRSN3YjQflIN+4IvedxBlDR7
	 HsDy8PUP9aDmENYLxzJmXy0TRpmi+Q43D4U2963/b95ETXRLSewEWjiPCSESYUcSKGQoa
	 IwOAvG32l25mIJCtryhNuYTabENEZZHXG+cCnaF+5Mb8AjmFirso6JOb8+PDBfW9XgzoR
	 0NxyB/9ahJN0hrQAVJdTVwEOloDrbbRvYGJ6Li5MKxf8eSs8nVhdEKM/w/GB+VqFXVO8+
	 PkZjGcmSI+3MrYgvWc6y6U4u96WKG7Gw5Gn70aD0R7aVQGoKc44ROhrkoEwc11ACkpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=oGsMa7wmHQHTRJX2QekmD3Y6Ja6uGmq6iEm7evLlQd4=;
	b=Bf5CYR3ibQGtcmsAnuwXHMkK79aeEiYzwVxrYY5v9GaMOnvYyvVpeBdm9saRB2dKLXcD
	 VXx+cLuZFFRy0NHoHP/pQEY74pET7+32a0D4oBrrvQLqcwDauADGectgbqWD7D+YA7TAP
	 iwGy3MQaLFQav7u/TwJ7umGprLotsbByu5KRujm6DtxdHlNKHivV420d+wsmZ5dk5RWXs
	 tpJH/JGPBcS6oqV4CjgZ/8ApAQvjA/OdfZWIrQGEysfUsfq66zaiOaZGRSa6vNuw+SJQj
	 cONPhFUZqyXv4EwyOiCQknXPE1vhOG/VsnEJuPtHxWq+D+7hJoHl3d8TabiuA92hZhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=TPI3MTe1;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC740606A330
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 19:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC740606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=TPI3MTe1
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-94961d90b79so306566785a.3
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 11:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795374695; x=1795979495; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oGsMa7wmHQHTRJX2QekmD3Y6Ja6uGmq6iEm7evLlQd4=;
        b=TPI3MTe1RlG4SmZzzoCpRdy2QVmmqnbO/w6aR5KNMokJV/Ej+uAFQG7yAYqk56hfkq
         LZC9wKLhxk3NMVRMaR1VvWVuCxA6GsIEcwsr6le7u6bdoCGonrAZjK3eTkxOT3nRTyMs
         kLr2KYSGk0Kdl3U1jn7zVe/GjwSTB8XynoaJu+1hSecxlfaiVnqBhg9qfE6UcOdBFpU7
         K6+K542N8Cf/GVSasbtS0zq1zF4T0u1FTMwtPGg2hgdtwvyFLiHHyHTH+dkRxgJO3IEQ
         VpIReU6i3uKk4uALa/TFB/P/g7vgcldffZQ51PdHza/mx09Vr+vtrjEp2lxRt4rjm1dE
         cSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795374695; x=1795979495;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oGsMa7wmHQHTRJX2QekmD3Y6Ja6uGmq6iEm7evLlQd4=;
        b=g7BFRPIRiSJWivofJ0zwf1Vx6iEHU4mSmddMLfqfIogmSsEx3n5Wf6lGSmAKjFA9yg
         epfBURXosQ/vdyyuBfllOBE4SCWUk1L+FrtbulC1m8P7XM7eaGkFhKdT3fpRvV+/ABEJ
         rYjdYphroOy0SC23qgErv2NY5Ja9Oy7XDYcE3DPf34gNWFzFj+jB1wJu9vCoPvuDKCQr
         xK9putRjhK7wzU3pYVXO0U/QY+L7TsgJDapwuT9D6smgATrYdAYsqmXJAA3AbazR78Jb
         TnzJoIRqZblL5gw/xTqSf21j8dN91MDiYqp0jw+MhgVXBsAoFgUrqpGUAgPNBbso0pfh
         O/YQ==
X-Forwarded-Encrypted: i=1; AL+hErEXHWiWT2ZZ1B2TZo4lAuExPXkzLcCe+st8wBKtlgrzBXWcUCdnYr/9tM+97MJugkcSfhGg/PujcXc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+nafaYoABt4a4f9CvZtguWt91/j7b3zoxy/nxhcJ2ky4WQvyo
	mB2blmhCJU/PjFb6RvNEzs7/Fs9YRpv9F0rANAxcQ2yvOLHDPl+NdvnMzhxRsuAbumQ=
X-Gm-Gg: AZFdTZdcpXIgVpsmsw6CQ5rIHTf/3gSNCw/7hLg8NnGU9CU3asE3u9x3pbeY/YdORua
	UMyX5CC7Lz0K1o/qKLhJ9KPOMTCBU5nnt2zlsCYDpvuChBWXPmI5pm60c9rt2QtAnbfFU7U32kh
	YsH5UigmK3Vlh0sFb8arY91bK092u8VulvZiYVg5ySCV8tQ/qzuq+eVeujNUlvIQ3qjtK0rHpT4
	N0+9Rx6LRnmSEp2z3FJhQ6tryUKjxv2yUCVSALgTcRQTo2UaUxI/ntLMgUXO3oqOqNeLrqZ7h+w
	YCTqFVnpwwF3Qonk7eO0F6ZdjsPV19OwehfSrT0P5FL82GvPhlLOvdhjlR3ApyAjLTU9cfHppJj
	hhTYZn8NmoemC2COXDzvXjaBu2edlIYJgwFML8d0l47ssn+4rJjvhcKPmE/NpAxUgPuyOYZY4xE
	0v98PyRarNvhcFPaTKo6TDbWgphCKgU28kphae/t5vcZu/o+NOYoLgjKHspTLWOOgMLaSPGr2NO
	2Wv31icgQbBZnfYvqW+J8WlGySkALYXMw/JArSvXA/ZlUAqkbO7rtLyxFwG1M5lWWIsrHZA3sHa
	Mt3d5pv/AK4YvmUBLlM8DWXsKKDFNsfITyGo9Rp/ZpK+/HHJY4zh8jkw1nK9apwArkTsL0hxyhm
	iunAz2lY=
X-Received: by 2002:a05:620a:4727:b0:949:326f:bd2b with SMTP id af79cd13be357-949ba9aa37amr1639379885a.43.1795374694656;
        Sun, 22 Nov 2026 11:11:34 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb38c903sm651828485a.19.2026.11.22.11.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:11:34 -0800 (PST)
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
In-Reply-To: <awMdeK8O-5mffg2m@yury>
References: <20261120-private_nodes_v6-v1-0-74f5f9a115c2@gourry.net>
 <awMdeK8O-5mffg2m@yury>
Date: Sun, 22 Nov 2026 14:11:31 -0500
Message-Id: <179537469194.412063.13456998694958645706.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-22 11:51 -0500, Yury Norov wrote:
> On Fri, Nov 20, 2026 at 01:08:51PM -0500, Gregory Price via B4 Relay wrote:
> > This is v6 of the Private NUMA node series. The series falls into four
> > parts, each building on the one before:
> > 
> >    1-18  mm: introduce N_MEMORY_COMMON
> 
> I walked through this part, mostly. It looks like you can substantially
> decrease the patch count if you keep N_MEMORY meaning unchanged, and
> add another type, like N_MEMORY_NOALLOC.
> 

I don't see how this would reduce the patch count substatially, you
still need to convert existing N_MEMORY users and need to differentiate
between general purpose memory nodes and private memory nodes.

And N_MEMORY_NOALLOC is not a good name.

-- 
~Gregory

