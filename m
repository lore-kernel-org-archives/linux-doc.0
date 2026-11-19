Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795065278;
	b=M8WbCd9vmCut0ax6fsZj92yLQ1grxSaQxFEpZjMa//QiQ0yDaufnKKCUBycEOwIHB4XB
	 g/PocDgfnp0Ia1Qy7sSxF5HxF/ZStaePbzUIky/+Q7YpKK2pkLaNHK82A/8WmNhK5DMKg
	 PX3LX2xg/l9NmR3hS7KlROB/fBttU8zJzg/F8wnvsFVK3IGYjKJCoTRZPrkh31M8Ov6O5
	 DVG8KjR4NmncKAY9x62jsKuZ2G4ReOlaitwp5bjCvOP6fbMaiGsnwxTP2IB9/hZ6v/G4j
	 ZtaMTIxC3Mtll3BcQZ9XMsI/QwFilUrrIt9L4GX5AIb05AYslan3lxn1yX17bC+3BcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795065278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=wyxiWuQSWhgvdEtewWdluvJTi3FrncODBevXsHd/xk4=;
	b=zsL9zDHNGyCNFBI3hGl70m8S2SrPkraL/nn1qni8BvknacS4U8F+A63QPP09Qq7LiDyV
	 gbmV31CXPTtyJN+tmQeI0yjqEZJQHJ5bZWe3eq5qjKLvKCPQHtUiVBgGcaNyBD+DFObcn
	 1lPxZYl52CBjrmUm/xE5d4kMh+ESV27NBVGnEPaKHrPtAD630XiskY8O/5qV/swGrG52t
	 9REfy0j1GsCNYHcZv3fmRm3TxV1QEJUOW1m/2kdfj/NlmftFLGzDqBA6KHxkI/+2A2vm3
	 pu9TgTt4foAda4BN7u5PxD1xaK3I/J6KHhIuFoexl0/FdboxeMnw6EQzHAv/HjAhJmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IrY/U+3s";
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAAA606A326
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 05:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DAAA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IrY/U+3s
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cddc597d062so1114695a12.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 21:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795065278; x=1795670078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wyxiWuQSWhgvdEtewWdluvJTi3FrncODBevXsHd/xk4=;
        b=IrY/U+3sMojwRsoCdIKNZ7+7w+rAuIZCaA8qG1HKoDyscOwi5hQSBJxg6rVJh5YU4r
         OOi070XGHRZzdtbWslSZmzWvGpIzchWBiBpCfm4eKx58ktKoA02lKmlzoBXML4ClVLu1
         c66BkNOjyg+0liDhrHMXjV3CMWM4ssuM5Z1psWUVA2SQQdNrf6QYi5Xymyhw5UbKjbHC
         5g+CZd+CX3vxmqOaCv55f+9xZMncjLwzvLY+08HnXSfFxHCeqv720GXklLBDMdW6wywH
         N88nHwaHtCa4KYZ4Pn7otDRQMvuHbx0LjfIXEKrcx8LNaiv/EbcNmJG0wg3dtXsVFWSo
         Guiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795065278; x=1795670078;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wyxiWuQSWhgvdEtewWdluvJTi3FrncODBevXsHd/xk4=;
        b=kOd68KKWbxtByoCMthiAvRLWJGS51ENQw1VSTIJR1CIMgTdJr27neIXZX04+Qr5AP/
         HYTLGnCHg5rPTdFo2M+FSrAkkBq02izQYvwPcMY4azomIRkytlk+4i30M/OWBk1OePBh
         WictqhKazix7EUUyhMPAIcxtzt/84IThUf3BaA4e1n5Af9znGIe8GBT1MqFqtZ4Y5ePG
         oKO2hc48pIlQMKCWTyEawSs8eqkYXA2h062aGnpNTKPs/9R3jAClyFvVHAgMpkT19qo3
         neNrtZ3Dq61xz+Z2Jt9S/PwxPGuF0CGLSPjvW2Ruo6coZTbL5d+GSjelA5Le1bIEF8x/
         XoBw==
X-Forwarded-Encrypted: i=1; AL+hErH7FxCUZnm/wG9xTBdOZ+ERsnA+rgfOOVf0Q29Yy+HabZIS5A/tD7uVOssbVcg8OEGyuH2p8wYvOG8=@vger.kernel.org
X-Gm-Message-State: APuU4Z88J2S/4uecLNq9iRcPurVEbyi6ckR7va7oYpwq3PgZHTiwbCSR
	7TQwHVv8MC2QNqcYLugOea9AZxeZCFrzElUVAq9ISR1X4Nua1gB+psXU
X-Gm-Gg: AZFdTZd+AUsGf5RjT0CG5ORFNXxCD/HS0+g1vKOHa4gN1XizmKovCvtH3ALtWPVwYkd
	Nb2OzmPMSrMhOyb4sqBC3R6XGQeRQ1X00MRUrQ+CXC6gZ3f+BWjK5zhgBnQvvx+THr6hjPOiJqx
	oZQmoj1yiReP3Ug4+Sv/OfGG7lC3oM6PjijKsX7lA798muo8nab93yeCy0blKWETIgLwFJ+jIEb
	KB3hSpu5we0zpdsfdnDCSFmwfqweL7pt6VSdycu+qYRjWlvx5hDhSlS12zuP5RiGbck+hV70QWs
	LiSNVVWcijSR5+V59YMJFrmdNCC3N2Q2c1VXdPGq5EtyVBJCZ7eqF0o12qjzE+VSCllghdxfGM2
	KChQJcs0bcNesFUqzoegUi5wxfDCyQ/nPH6Z4lgCJNb91Rn3VInFvqAAHj425+/3QbdbvTb8EwX
	Q3wD6LqSlI/xXnq0PvtbW+O0+zuYRbX2W4m119kSnV5ZqEGisIiVpGDBs4BS/Z5qYfP4vK8ZoVq
	OC2WKrQPcy0p0TV/vcA8qQsS4XmWnkGQh3gg2ZoE6N+IcOBhr13jKe0ewjMUl78P9BfLCWmR7T7
	JqLxYoctrbx7kEsMh1HSlfrz9GWXlrf/bRbn2xSVpIJR8wWJDEHbjktcXZzNaASf+84NkWM=
X-Received: by 2002:a17:90b:4b86:b0:3ab:1b19:78f4 with SMTP id 98e67ed59e1d1-3b3d06a487emr5255430a91.6.1795065277522;
        Wed, 18 Nov 2026 21:14:37 -0800 (PST)
Received: from localhost.localdomain (vmi2317697.contaboserver.net. [85.239.239.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff628b4ddsm23497315ad.62.2026.11.18.21.14.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 21:14:37 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: Kairui Song <kasong@tencent.com>
Cc: wang =?utf-8?q?lian=EF=BC=88ByteDance=EF=BC=89?= <lianux.mm@gmail.com>,
	linux-mm@kvack.org,
	Johannes Weiner <hannes@cmpxchg.org>,
	Muchun Song <muchun.song@linux.dev>,
	Qi Zheng <qi.zheng@linux.dev>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Chris Li <chrisl@kernel.org>,
	Baoquan He <baoquan.he@linux.dev>,
	Nico Pache <nico.pache@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Youngjun Park <youngjun.park@lge.com>,
	Zi Yan <ziy@nvidia.com>,
	Gregory Price <gourry@gourry.net>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Lance Yang <lance.yang@linux.dev>,
	Hugh Dickins <hughd@google.com>,
	SJ Park <sj@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Yu Zhao <yuzhao@google.com>,
	Vernon Yang <vernon2gm@gmail.com>,
	Zicheng Wang <wangzicheng@honor.com>,
	Chen Ridong <chenridong@xiaomi.com>,
	Tal Zussman <tz2294@columbia.edu>,
	Kairui Song <ryncsn@gmail.com>,
	Xiang Liu <liuxiang.277@bytedance.com>,
	Ehab Ababneh <ehab.ababneh@intel.com>,
	Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Hui Zhu <hui.zhu@linux.dev>,
	linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	damon@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 00/17] mm/mglru: frequency guided promotion (MGLRU-FG) and flag cleanup
Date: Thu, 19 Nov 2026 13:13:33 +0800
Message-ID: <20261119051404.14533-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com>
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit

From: wang lian（ByteDance） <lianux.mm@gmail.com>

Hi Kairui,

On Thu, 19 Nov 2026 05:03:32 +0800 Kairui Song <kasong@tencent.com> wrote:

> I also retested the LevelDB benchmark from the cache_ext paper [4].
> Interestingly, mainline MGLRU already beats CLRU on this one after a
> recent change in lru_gen_folio_seq that bumps new folios with refs == 1
> to the second-oldest generation as discussed. That change accidentally
> gave random reads a higher hotness level while making sequential reads
> much colder as described before [13]. However it's unreliable and
> incorrect because it depends on LRU drain timing, and hurts some workloads
> as reported, or where the sequential part is actually hotter (any workload
> involving hotter large file and many small cold files will be affected)
> which is reproduced below.
> 
> This series improves it while covering ordinary workloads too and fixing
> more regressions:
> 
> LevelDB Scan / Get, Throughput Total:
> CLRU:         4708.3 ops/s
> MGLRU:        5026.9 ops/s (faster than CLRU, but hurts other workloads)
> MGLRU After:  5179.2 ops/s (even better in all cases, and no regression)
>

We did observe a LevelDB regression in our earlier tests on our
machine. The fixes and results discussed in your cover look promising,
and may address our case too. I haven't retested v5 locally yet, so I'll
rerun the workload on the current base to check whether the regression
is resolved. I'll also look more closely at the access patterns and how
MGLRU behaves with them.

The results on file-backed workloads have been especially encouraging.
Next, I'd like to discuss some anonymous-memory workloads and potential
fixes with you.

> Others
> ======
> 
> Additionally, PSI, smaps, and readahead should all benefit from better
> accuracy since this series unifies the flag usage between classical
> LRU and MGLRU.
> 
> Other tests such as MySQL are looking fine, with no regressions. There is
> also community test report [7].
> 
> Refault distance is not included yet, so MGLRU may respond more slowly to
> workingset shifts. That can be added later, as previously demonstrated
> [8], [9].
> 
> Extra note about future development: this series is actually highly
> compatible with ideas like workingset reporting [10]. The "gen climbing
> folio" design may appear to conflict with workingset reporting's idea,
> but it doesn't. The solution is simple and straightforward: once we can
> extend the generation number to a larger value (e.g. 64 or 128), the
> refs-driven promotion can stop at a lower gen (e.g. oldest_gen + 16),
> leaving the remaining newer generations as perfectly time-gap-separated
> bins. These older gens can be considered as expiring gen.
> 
> The tier count is not fixed either, we'll need to find a way to tune it
> if tiers go beyond 4 though, but that shouldn't be hard, not a blocker
> either.
> 
> More details are in the individual commit messages. LLM is used to help
> improve the comments and tests, all results are double checked.
>

Thank you for this outstanding work! We've seen some really exciting
gains in our tests, and we're very happy with the results. From our
earlier private conversations, I know how much time and effort you've
invested in this. You deserve all the praise for that dedication.

I'll continue reviewing and testing the series and work with you on
further improvements. I'll go through the patches one by one, and I'll
share the workload scenarios and requirements from our side as we go.

Thanks,
Lian
