Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705312;
	b=ZIYGBXJcJm6hQZ2vdryXLK7eNVLdpzTXeHi4IfQSSnGCmxcCeREuSyg1D8iNdfXlYE2f
	 b6GJXYg+uJMsLJYi7ebwE165XhYijVxJi8NoUAkYEyUqXi6K8/d+J+YEIUgTLzCb7a2X/
	 DD9fiF66QM6Iq+PsWoa2WnSlQl2+fwDwkd7qiyRo3BDijg1RnL8Hvm7geUsqjmLLMA3SW
	 M4RPF3KaS+pMS6Muh9oWHQ5u461dZzD+kl6z0RqY5zmlxZJSB42A2IxpV/wbx7wjs69vC
	 cRG/G9Y65383cwz20WvuddVm1UKyfsVWBC5A8Caf/ULh4OxWehByXx1ym/yNk/3GZjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CnA3zlb6+Q4MfV6Y5oL8cXYKHj+wdTkqxg32r451qEk=;
	b=rpuu4/XAS966B2aKYSm/m5ISLW4/SU07JF+aH3soIp6jDMDC1dQCGI1LxWurZObKQsLn
	 7ASCqpIgJfCen2yj5JI5aKZuU19eRVrIqTsloJt49b8pdYv3KurBiUUL3aZfnhB2GiUuk
	 AhpbMa16UpEP7pIZfi82jZoWXqHKP4upzKG2T1/GNRU9l5euoupJ+xAsRiUBlMj7ofix4
	 whGDJCvIWqsNcw8cvD53YsiMSjKVR9UYIZap/RssZYg+vLKQWBSlNjkz99+BskTuZgZQK
	 3TiX/5I8bL6Js3J2bmjGgDHrs98t6lWa2MQjbXn/0Os/L4/4LHbvHP7cLpCzsrj2B8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="b3sZ+/K3";
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2EB606A68C
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 15:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF2EB606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b3sZ+/K3
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f02f04a426so57690285ad.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 07:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795705311; x=1796310111; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CnA3zlb6+Q4MfV6Y5oL8cXYKHj+wdTkqxg32r451qEk=;
        b=b3sZ+/K3mFnawrjvx85flgmuT1zHOx3Wa6bQmig/FPG7IvWZnnPujUtt04UcCQm+tp
         YcbNqvBn72KW+GtFsj9T/6MBlkXuLF0S7bpw0gc6Bb8hhVQq2yHUIgIC2as1r1XxCewg
         55bEJ76AQOJHJlwW6zc2MZpJjZk4qgrzvXJmecel7U+zkoAjp/Fkh706tNW5xMLtzs5U
         Nz7YrwTQY15c4kchCoSiAdI7/oOsOEQHeRqHVF6CqoQntJEAghHEakYfz5f0vcztnUAD
         izPsxD9LCqUra0KUfUdOD/ui2YcGE6idNSNRt+CnZCHSV7AODbvljIuCrRBWKTVf0xNc
         X40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705311; x=1796310111;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CnA3zlb6+Q4MfV6Y5oL8cXYKHj+wdTkqxg32r451qEk=;
        b=WXzlcy4X42yxb74TRWd+/7HpeOnkCY9gGMYEA5Ynh7+Ntr3xRxNNHQ5eguyaAYJAqB
         ehAyVhyMFZ+FJTrysZNfKRFevImSwi0gPM1EouJNhCnEZkxPYuJLwArL4Y8Jqnyqdn6D
         Bkm/uzRApxFxFgv4ASMK2oiSwQFYNylLU1O8yXsjWEw5jxe8ZiRKDF8wIs7ovgz0eHrc
         qPTFg+JR0KssZzgjGM8c8TGa5ZecTXR2eWzohniYT/zu2Bat3CjVlkTYSKP09DjIFvjc
         Q/1pZ8kvK2b8O+MMa+7v+6Ee++kLDvjRe0D+Rdz1d/mwmVi4WRFFH2G+QGV1CcKkKk4y
         5YwA==
X-Forwarded-Encrypted: i=1; AL+hErH7u0sKO3iURdDXFdGxzXfjGfHjYDKbfKRJ19Ffkt4+/OwM9xZTcwUNcdka0ky7CmXhoJM4cmi6uR8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wl1MjSjOxopTDL5SGHVntiwdMJepwzKSy1T+8ZZk6hqtfdhZr
	m+43jXEuHjgoBc0X8/1tUDpCivmC8OMx32aK2oWRhdIb1vhOcUe05tJQ
X-Gm-Gg: AZFdTZcF4IQGVIIB98gT4HpNuqW7sJuREC6mD0gbko8pJtujyiAnERyjFBe+osBuSF9
	oTWLZGcaq4Zsuy41OwQ78BDrqfYBw9ZRsVszrXapTfE5UdCZoih8qT89WeuZyu022llV1W8NmTi
	oybKDzzT/oBXPGeHfXYLoUNxsOa0LmLCeXrdk7h7Oc63L/N4dqp8kIjfZJ8GkEx557I42cGIRGB
	0mDpAc35RtXUcg6s1vMJFr/YGl0FcV/D6fLn8QWLKPpoPZSZOvOWmIOuTp+Xhc+cvP/hlinKxF2
	Vy/Ye1VEGMK2OsWirovai2zxjCsaXojuAeQy8zFfIWv+8ZFBrXV9auXjtuXnay1v0Lf8SOcn4Js
	A+baaRQE6EaDteWXxgYoxV4+OS6rqJXvblr1kOcxQiGKkCU7zbfthL7fRrU/r5wKA7aq3HL9lxR
	UOdatlJaubX76VSm0AwepZQzejcbqcR1CApKOAAksQ4LQFmin0tauHT3zNJhvVSjkjVKjE/W+L7
	BxPmavDiVy/NEdsi0N1b1PlHbrNHoM9189VK1oqVmbdX4aZPCyvNemMp7bgQ6cAX10ILZibPd8S
	PDMbogiyXZpn9p/kJMxlViv1OUALBw53A649BcV41PFK
X-Received: by 2002:a17:902:ec8a:b0:2ef:e25e:e13c with SMTP id d9443c01a7336-2f03efb015amr233195175ad.5.1795705310670;
        Thu, 26 Nov 2026 07:01:50 -0800 (PST)
Received: from localhost.localdomain ([240e:b8f:1df9:a600:c693:b19f:ada0:748])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f15663fsm103299005ad.76.2026.11.26.07.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:01:50 -0800 (PST)
Date: Thu, 26 Nov 2026 23:01:33 +0800
From: Vernon Yang <vernon2gm@gmail.com>
To: Kairui Song <ryncsn@gmail.com>
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
Message-ID: <c37b9336-95ac-4787-8a7c-73f6ee9d17c2@gmail.com>
References: <20261124-mglru-fg-v6-0-8ffea39934a6@tencent.com>
 <20261124-mglru-fg-v6-10-8ffea39934a6@tencent.com>
 <6c3d32a9-3004-4a17-b854-7088e69f164a@gmail.com>
 <awfb-vGF62XvcX_F@KASONG-MC4>
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
In-Reply-To: <awfb-vGF62XvcX_F@KASONG-MC4>

On Thu, Nov 26, 2026 at 03:16:32PM +0800, Kairui Song wrote:
> On Wed, Nov 25, 2026 at 09:47:18PM +0800, Vernon Yang wrote:
> > On Tue, Nov 24, 2026 at 02:53:02AM +0800, Kairui Song via B4 Relay wrote:
> > > +/**
> > > + * folio_inc_lru_refs_fast - Bump folio refs count without promotion.
> > > + * @folio: the folio
> > > + *
> > > + * Raise refs from 0 to LRU_REFS_REFERENCED and leave hotter folios
> > > + * untouched. For a folio off the gen lists with MGLRU off, a plain
> > > + * PG_referenced set.
> > > + */
> > > +static __always_inline void folio_inc_lru_refs_fast(struct folio *folio)
> > > +{
> > > +	unsigned long new_flags, old_flags = READ_ONCE(*folio_flags(folio, 0));
> > > +	unsigned int refs;
> > > +
> > > +	do {
> > > +		refs = lru_get_refs_flags(old_flags);
> > > +		if (lru_get_gen_flags(old_flags) < 0 && !lru_gen_enabled()) {
> > > +			/* For CLRU, just do folio_set_referenced() */
> > > +			if (refs & LRU_REFS_REFERENCED)
> > > +				break;
> > > +			refs |= LRU_REFS_REFERENCED;
> > > +		} else {
> > > +			if (refs)
> > > +				break;
> > > +			refs = LRU_REFS_REFERENCED;
> > > +		}
> > > +		new_flags = old_flags;
> > > +		lru_set_refs_flags(&new_flags, refs);
> > > +	} while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flags));
> > > +}
> >
> > The implementation code of this function looks a bit convoluted.
> > Would it be better to simplify it into the following code?
> >
> > 	do {
> > 		bool clru = !lru_gen_enabled() && lru_get_gen_flags(old_flags) < 0;
> >
> > 		refs = lru_get_refs_flags(old_flags);
> > 		if (clru ? (refs & LRU_REFS_REFERENCED) : refs)
> > 			break;
> > 		new_flags = old_flags;
> > 		lru_set_refs_flags(&new_flags, refs | LRU_REFS_REFERENCED);
> > 	} while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flags));
>
> Hello Vernon,
>
> That's very good suggestion!
>
> Only one thing here is that
> `!lru_gen_enabled() && lru_get_gen_flags(old_flags) < 0` doesn't mean
> it's classical LRU, maybe it's just isolated. How about bool on_gen?
> Or bool has_gen?
>

Thank you for your explanation!

For has_gen, looks to me good.

For on_gen, it could be misunderstood as "whether MGLRU is enabled".
So I prefer has_gen personally.

--
Cheers,
Vernon
