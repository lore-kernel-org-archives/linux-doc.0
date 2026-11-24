Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541094;
	b=Jn3u7YUsTCcvkW6MOKtNL9qztIwKUmvLcbymbvLdjObReVn3rtDe3Yl7+L5RrBnvbTGt
	 6MGLBjvMSVBMtD1ZZCVx1fG5GWdN/ETLUCv3FAld3dXqgeuybmtJORROx0WZt5xsIPgGm
	 aac2SgKMVIhmnFI9Z1wqp6plo3fBE4HnLO+rE0ljBDdMMffzjr5X0mCagt/WwAeqwd9uy
	 NkQooOnsj3HKYGu6F9AsizLQ9kZlSvazjFU16jCNp0c76/Se784UmrAeXUSI73agy31JM
	 0WGnu7ApSAy25ti5cqomyltFiW2t2m6uehz0zWlBZJLK4ruJIDnfSJ+Ljt66XJ26WLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ozTidCXqTzSwi9dcCKWD5fJGGI9rCJsLQ/Ov08gLSsk=;
	b=FK0ElCp80OctkAOjt3t1k/c6dXz6h0BMvCtmgYTwjq+tq0T0Zs6mbJfmFXX23Wpx7nKI
	 73d4Ql+xv9vWTtrFDcWmaPwI2hjyMgeSFgAvASu+5AiufiLQUVlfTIHj6PzoU9cVSLw93
	 lElfJVDWUdCl1brl85Xru9sQm5uA5IFPhVdgBgdveqAWyzhlAonFu3qtsEsOm4aw769xL
	 wZF9asu+gNv4oYN7oJi8HEnCZ3oe5a8CSOeidInf7q50D84a1aB04piAUyeNBxjFpbCzw
	 PKTNPWtU9CmP8/fZTR3AxhdZzTo93DDh6x2UoNUx4cp+QgjU/PM66b2uWEMCdI4U75A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UEsvIshR;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2478606A32E
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 17:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2478606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UEsvIshR
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f0a0d1a1e5so11644215ad.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 09:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795541093; x=1796145893; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ozTidCXqTzSwi9dcCKWD5fJGGI9rCJsLQ/Ov08gLSsk=;
        b=UEsvIshRIY9txsH2W7YuViBjWyb6RCmLJ1dlolrxjjdbyMWW9RSfAuE9mVkyY4ufZF
         8FqH0V9X71v8mD8MmM0dodRkQVkzFJayU5PbfS5SUlKcQbQNIhmha312AWigEQacHXvz
         tlnJ+cXXRtr3CeJHvWoUEP1wLuvCJhLY3xGgX5UGoXy34aaRiRbh2mM2C6hREOrMuzd+
         0HL60opQThWLEOzStOspPHJ508wq8IPVtyTge/TpJczhosNhj0+uO5zfRoaDcTTXL78F
         qGmrthQRxbkjyyqlkMbgk/kUdP/CkQc8Fsl1Uby5M2xrJzqUzzuCunvvAzUvLaQSbJbY
         SVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541093; x=1796145893;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ozTidCXqTzSwi9dcCKWD5fJGGI9rCJsLQ/Ov08gLSsk=;
        b=zLAubH7+s4w8nrsYrpSgCJ8UCy2kvHp85vQAB6dNQnh3EtpT3OPRkCYshe9bsPUntq
         6wrrNkWsN8lyeOYwfYnuHEpHCEIQQpyKNddWFtgJYEHsa1o8iu6MLmw2olcbTK3OLoCD
         GRG4hlDFwzAr50+Ghl68taPTc+vDG8sCO8geat/EcPO8nCt2B+RngUfzbGd/p086OJJX
         b6jb+EtJxTvZUs9XjxbCO1TwiQv0yAHbDpgiEEEVdZ+HQZevvTJiMGbyjBJcazgtlu5M
         gExlF9k7y+luOgkMpcYLNDi6Vk/MOtse+wDUPDyMPbfCHuM0HWs0C73DrmN/A/Tb8SQW
         m4tg==
X-Forwarded-Encrypted: i=1; AL+hErFMZqlwn2CKytf6LvcTLr4kYc7ViLwOR+SggEkU3ezeBj/4i5fovf89AyG8t7YyrXXGHDcTgnSkLY0=@vger.kernel.org
X-Gm-Message-State: APuU4Z92PSc1WtcURG0vCPd/543a63CG2HY+CVZLF+PM3FHiw7Lo0Vb/
	x4xHlj7r7i0WfwXJGDKsBDYODrEc/J0n6r7VkcICuZuBReXWzqxfn+TL
X-Gm-Gg: AZFdTZfN9JNo9BeOwDYRRTlbbZ8TSKzfwBfPchlBOCt/+6+lJjowS2LeLH0BWlXzd8I
	IfPLzocbPyKwEFBqvO6LtbDMswdekRZahC9ZUCodXv0Q/AaFpHDBoOYeyDdsJMB+uS4ykH4EBNA
	lTiy0q9v8pn16AURbpNZleH6mX2+enoGUpN8vuH2nVgHf94XRg5eVmqEUOYh1vTX1K2nuiyQBYI
	wR4KZkcBIHkmJgVEhB7KOvfMSL/t2ob7pp8R3OXaGQ8uIaEykz4Oq2W5yi/W+UO54fvBEhLcsp8
	HfLnRi0ic6NCWSdHmFgJHgB0rwPD3vvYU16LOrhA0hHEnVRp46Q7i0NPwDPwZVx+qa2UyBwUGGH
	UTKC+DhHX/O2Ci6Rok0ClQHoWYjPf2mvzIEyOUXV8ZyAnW+R0uJSGaHIuPfXduhypCir8fqroK2
	b0uCboa7NpMBmHzmWzcm49WruRRUtXrE8KHhM2IIS6RlzJ3UmFTr9BvUYysoZa5ZnjkdcYEZqxd
	StmMpsZkBYU85+PlPkoEx7MV7DjkHsTpa6RxVmy5rqGDVo0EDNC+lSIhzwUqAPJjsp9x5VCVzOV
	EDrfChzCKc8CypcXeNT5AdscNwL5cCgy+Wy65AJmsVEjGT3AZVGLfIGfTMi9D3/dAul27AA=
X-Received: by 2002:a17:902:f647:b0:2ef:e130:1505 with SMTP id d9443c01a7336-2f03f17d196mr143597245ad.10.1795541093208;
        Tue, 24 Nov 2026 09:24:53 -0800 (PST)
Received: from KASONG-MC4 ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f102fc4sm72406805ad.43.2026.11.24.09.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:24:52 -0800 (PST)
Date: Wed, 25 Nov 2026 01:24:38 +0800
From: Kairui Song <ryncsn@gmail.com>
To: Zi Yan <ziy@nvidia.com>
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
	Youngjun Park <youngjun.park@lge.com>, Gregory Price <gourry@gourry.net>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, 
	Hugh Dickins <hughd@google.com>, SJ Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, 
	Yu Zhao <yuzhao@google.com>, Vernon Yang <vernon2gm@gmail.com>, 
	Zicheng Wang <wangzicheng@honor.com>, Tal Zussman <tz2294@columbia.edu>, 
	Xiang Liu <liuxiang.277@bytedance.com>, Ehab Ababneh <ehab.ababneh@intel.com>, 
	Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, Lian Wang <lianux.mm@gmail.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Kunwu Chan <kunwu.chan@gmail.com>, Hui Zhu <hui.zhu@linux.dev>, 
	Maxim Muzafarov <maxmuzaf@gmail.com>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-doc@vger.kernel.org, Tianyi Chen <hi@tychen.cc>, 
	Ridong Chen <ridong.chen@linux.dev>
Subject: Re: [PATCH v6 15/18] mm/huge_memory: mark folio as accessed more
 accurately on split
Message-ID: <awXABa3dYhEN0YEt@KASONG-MC4>
References: <20261124-mglru-fg-v6-0-8ffea39934a6@tencent.com>
 <20261124-mglru-fg-v6-15-8ffea39934a6@tencent.com>
 <DN2V8E26C4EL.2TU52TEVLUFA@nvidia.com>
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
In-Reply-To: <DN2V8E26C4EL.2TU52TEVLUFA@nvidia.com>

On Mon, Nov 23, 2026 at 03:17:05PM +0800, Zi Yan wrote:
> On Mon Nov 23, 2026 at 1:53 PM EST, Kairui Song via B4 Relay wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > The behavior of updating the folio's access info isn't consistent for
> > huge mapping splitting or ordinary unmapping. The page table's young
> > flag has to be translated into folio's access info.
> >
> > Right now it only checks and sets the folio's referenced flag, which isn't
> > enough since folio flag updates on access have their own rules. Ordinary
> > unmapping (zapping) calls folio_mark_accessed(), and it also checks
> > if the VMA has recency to avoid false updates.
> 
> Can you elaborate on why vma_has_recency() should be used? "false updates"
> might be too vague.

Thanks for the careful review!

Right, maybe I shouldn't say these are "false updates" indeed. But it
makes sense to do so, will reword that paragraph.

The young PTE becomes folio hotness via the LRU refs to help improve
LRU accuracy: telling the LRU that the folio is accessed, so it should
be protected as it is more likely to be reused soon.

But vma_has_recency() is the app's hint that these accesses are not a
recency signal: MADV_RANDOM expects "page references in random order",
POSIX_FADV_NOREUSE sets FMODE_NOREUSE, and MADV_SEQUENTIAL expects
pages which "may be freed soon after they are accessed", which is the
opposite of what the refs mean. In all these cases, marking the folio
referenced from a PTE access hurts instead of helping.

zap_pte_range() and folio_referenced_one() already ignore the accessed
bit for such VMAs. The split path is the last place translating a young
PTE into folio hotness without it. So while converting to the more
useful folio_mark_accessed(), also add the missing recency check to
avoid wrong promotion.
