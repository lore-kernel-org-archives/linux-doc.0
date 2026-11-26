Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677406;
	b=v4vtFBm90Xm4UVpP7Op9+S4phy7ddkT6UdbZ8GR6nfXhvxrthW63zJ2nmMVYPkkC/vIT
	 2Hu2gmT7CtZUNB38SMro4BIaL2rTk8nkY/7/KTSHRIa+mlK4nWsvK6wDDKrXI0JofbAVr
	 DcVi7hyRQvTVE2wVgZWB/vVXITeFCa1dULtoM/4PDKz4HVn6HTu4tfChNMv+W2P761QGV
	 PBhZhLqS8dggh8NzlYRdyXKEOA0lm/4oxQ3G8nA8hjCLOUaw4947/phjc6h6j/PNqSWvP
	 dZCwjBq5A+zY2pMOIPF1semGU9G6Rq1euMOiRqZ6DUnVmF51YG2yATH6NcTTDnmanbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=tioXBSwm5pktLh4V7ZjeytUoL0urdjzGdHunvMaRHSk=;
	b=f0JogIIrC3lMtk7espHEZuHuCIUBZCaKeVGnw6p4xzBp04ugd0URjcu8ecjv8LGPvVE5
	 m6RpT3RPZC3K+ljmq2ANi/CKmMRz6+w4LoZVV4cP9cFvmuzRX1oQeQ9zdtfh4NVDvo+Bw
	 th38MIcnmWCDI6gL2grUNNfV8CW+McLi4rfmKLqmrlSSsLRyQXVl+EDrOIYQRb3iWWi5d
	 UCMHUwawpCDJ8aGO8nAIM/EIA50j2hUSc8fm/erUC8mUiP35wq32dAJveWRRnV25tpDKQ
	 0paQiZBQvGZhzEavTycR8XF3dWlerW9sZ4Q82Cg4Uii0EUVwv6gPgxlj7W4eSiCBG5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oi2Ks9b3;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FB6606A327
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 07:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70FB6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oi2Ks9b3
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso4533049a12.2
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 23:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795677406; x=1796282206; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tioXBSwm5pktLh4V7ZjeytUoL0urdjzGdHunvMaRHSk=;
        b=oi2Ks9b3T4wlAj8zr6C3H3evvBHdgAPn4MlpNxzpJ39yFK2wco5D5Uai+HoB7RXilR
         B3329OrtXQcD9E13YoAoDRSV/mttgXULxSRf2+6fjDqsKkCTjsblzC4if3F2kuGA8NEo
         PV/OsLxIZSKzXnkMd6kb8yPaXCnzs3h8qHdiygf+M//zgca57HRzZm167dBnFxISbboN
         Knoyv/cC3Jh+HZY4+YgDlwQD8W+5mEvdM6dNEjQ4gizfbmedld31pW8jxgE9uA9XGvuK
         YSYpG56oLnyIMaDJ6ok858+qzM/jCAA8aJ9r51VbkzJ+1i8jflqPEFbx3ReNdkFqnRjb
         2AGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677406; x=1796282206;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tioXBSwm5pktLh4V7ZjeytUoL0urdjzGdHunvMaRHSk=;
        b=J56GOWRa27HpthlXGK1Qgfn/kjKyKBFhVcVBFTMndzfEk37JgWsh4OgAWKt6kkcPmH
         WlqFaJyu6GAwMAKn/LaaWTmL8fduyDMX01k4oXV44I63bZN51aXq4c1s4piD/VDZxbDb
         fzMDPskAg+tzQQsUxSurHdGgY+l1K1ZDQ3eR5O2SiJgpDt6A/jHzCOtGlPngPAPSb0Xn
         Q6XskyL8xhsuoBko2+YWAu7gJu7gBRoPLxaY93cHDGZryfhR7H/2T86DdHofx5HSH8Db
         eY9ANIUmrrJdqWwQD98gpqji0Htbt8UorsOsTI6kM37lyRisVWps6lsmjbTXwM+XVK8b
         rUMw==
X-Forwarded-Encrypted: i=1; AL+hErGRZu62LqdqSqdJtPNGgJR0pUpy2n4ecZKmu63TAjK2Fnf9A8vq+pavNPTLm9QgIGmeA423kIpGmAM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+niKPDyxVaOiTMf0Xpsxzw58z3YKAacfhnRWOv/wpwKxnqex5q
	T5ue2G6iWuVda1cSMV9VzO1WD3XeH/H9dzvQoVAhEsQkDz5x4JEmF/wU
X-Gm-Gg: AZFdTZdC8Kl+LIjtwdYxVsf1lommU7WYiOCz1jKlqm1p1/ppUkIH1U8hWxJNP/s4fFH
	b7GLo0RbY/+j2GlT0aZxxn95/0fegK/MJ1vqSqxTfK3qgg6nofGSka0NCjU4tEX6M0RDESy5+Qv
	7zG+TaktRGUdYDZ7CemGkOw9Yt1DNHwN1UIIPOlEOjtgPUVwIV2VINgLxPamyI7zAvXl+a1Mc7e
	CpsW0dNO72mxdVor9lk8oA7WAqznHzqhdeko3U0pju6ClUeEtn3GJZPwoAELRQ3t3iq/k46Hkb3
	NHlIG4QJH2Kx1cb5Ov59LcLZjHaonMz1fRweK3lXP0XeNFz6IFhhAb+MXPQHmvmlcPbKDpuK4p3
	AQef4YE67JWjzRDZNRyTcM2BWV7DNLk38A/88j+mqqMn7/hUJEDUcQOgX/IgZnox6jPoZe2on9B
	t4wHDOv2Q9q7ZSVzYYYvDmYHO0ForeRzkqC8sslIfF5BF4QYlchfTCpGC8DQDd+aho2y2tqILTm
	e8DaD+o0M1vBJI048TrZuAAPfmCtQ0U8Q5w+0Qr5a6LO1waEx1WnoOG2haZzJulx0lM3/zmlupU
	QO/e9yf7ekmhrcz/W2XVzOoom3LCAThdXjkCjgaZxkrm0K6oSgO7grykX5FcZvRvK4vIIGIa/1E
	=
X-Received: by 2002:a05:6a20:9389:b0:3eb:9e7e:1ebe with SMTP id adf61e73a8af0-4014b65c9ffmr25687016637.21.1795677405734;
        Wed, 25 Nov 2026 23:16:45 -0800 (PST)
Received: from KASONG-MC4 ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c86d821637sm10523020b3a.0.2026.11.25.23.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:16:45 -0800 (PST)
Date: Thu, 26 Nov 2026 15:16:32 +0800
From: Kairui Song <ryncsn@gmail.com>
To: Vernon Yang <vernon2gm@gmail.com>
Cc: kasong@tencent.com, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Muchun Song <muchun.song@linux.dev>, Qi Zheng <qi.zheng@linux.dev>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, Gregory Price <gourry@gourry.net>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, 
	Hugh Dickins <hughd@google.com>, SJ Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, 
	Yu Zhao <yuzhao@google.com>, Zicheng Wang <wangzicheng@honor.com>, 
	Tal Zussman <tz2294@columbia.edu>, Xiang Liu <liuxiang.277@bytedance.com>, 
	Ehab Ababneh <ehab.ababneh@intel.com>, Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, 
	Lian Wang <lianux.mm@gmail.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Kunwu Chan <kunwu.chan@gmail.com>, Hui Zhu <hui.zhu@linux.dev>, 
	Maxim Muzafarov <maxmuzaf@gmail.com>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-doc@vger.kernel.org, Tianyi Chen <hi@tychen.cc>, 
	Ridong Chen <ridong.chen@linux.dev>
Subject: Re: [PATCH v6 10/18] mm/mglru, gup: mark folios referenced via a
 fast helper
Message-ID: <awfb-vGF62XvcX_F@KASONG-MC4>
References: <20261124-mglru-fg-v6-0-8ffea39934a6@tencent.com>
 <20261124-mglru-fg-v6-10-8ffea39934a6@tencent.com>
 <6c3d32a9-3004-4a17-b854-7088e69f164a@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c3d32a9-3004-4a17-b854-7088e69f164a@gmail.com>

On Wed, Nov 25, 2026 at 09:47:18PM +0800, Vernon Yang wrote:
> On Tue, Nov 24, 2026 at 02:53:02AM +0800, Kairui Song via B4 Relay wrote:
> > +/**
> > + * folio_inc_lru_refs_fast - Bump folio refs count without promotion.
> > + * @folio: the folio
> > + *
> > + * Raise refs from 0 to LRU_REFS_REFERENCED and leave hotter folios
> > + * untouched. For a folio off the gen lists with MGLRU off, a plain
> > + * PG_referenced set.
> > + */
> > +static __always_inline void folio_inc_lru_refs_fast(struct folio *folio)
> > +{
> > +	unsigned long new_flags, old_flags = READ_ONCE(*folio_flags(folio, 0));
> > +	unsigned int refs;
> > +
> > +	do {
> > +		refs = lru_get_refs_flags(old_flags);
> > +		if (lru_get_gen_flags(old_flags) < 0 && !lru_gen_enabled()) {
> > +			/* For CLRU, just do folio_set_referenced() */
> > +			if (refs & LRU_REFS_REFERENCED)
> > +				break;
> > +			refs |= LRU_REFS_REFERENCED;
> > +		} else {
> > +			if (refs)
> > +				break;
> > +			refs = LRU_REFS_REFERENCED;
> > +		}
> > +		new_flags = old_flags;
> > +		lru_set_refs_flags(&new_flags, refs);
> > +	} while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flags));
> > +}
> 
> The implementation code of this function looks a bit convoluted.
> Would it be better to simplify it into the following code?
> 
> 	do {
> 		bool clru = !lru_gen_enabled() && lru_get_gen_flags(old_flags) < 0;
> 
> 		refs = lru_get_refs_flags(old_flags);
> 		if (clru ? (refs & LRU_REFS_REFERENCED) : refs)
> 			break;
> 		new_flags = old_flags;
> 		lru_set_refs_flags(&new_flags, refs | LRU_REFS_REFERENCED);
> 	} while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flags));

Hello Vernon,

That's very good suggestion!

Only one thing here is that
`!lru_gen_enabled() && lru_get_gen_flags(old_flags) < 0` doesn't mean
it's classical LRU, maybe it's just isolated. How about bool on_gen?
Or bool has_gen?
