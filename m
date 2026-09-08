Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7E155C1DE
	for <linux-doc@vger.kernel.org>; Tue,  8 Sep 2026 18:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788892220; cv=none; b=WX/JrfR1isBw48DAtexNRZ8aH7yB9l5v8FFTs6Th/7JrOldvVHzhVUCERyX3bOEWffe/aMa0ievMCQP90541QLxjZrQBcvvBD04m6suXKAN+1+ii2WjSaXbPH5h/GIRIKF+Vapfg7N17h3/pOEcj3k1z0jucJN/CBW3KqVom3R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788892220; c=relaxed/simple;
	bh=9Ljl5aeAKEUYZxDTI1oTdQw1xJ/TGeLSpSVQNjAyIRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=adnwtf1EXMz3BW4OPML+KH+G2mRAUFUmJNnIugFa+XkTUHgvy44l+0U1jJf1EZjnZuQOm2zuLhlwGAE2dSh5dnL7TmgdZXhDP2V1scd3gV4vqMiHRWDTixI83Vt3nuqsuiP99W2kb1lvPDYFHKoG7DvmUFxAOFDP2il/gKymNqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=hif4G5/I; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="hif4G5/I"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-90ce08834feso70431806d6.0
        for <linux-doc@vger.kernel.org>; Tue, 08 Sep 2026 11:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1788892217; x=1789497017; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Ljl5aeAKEUYZxDTI1oTdQw1xJ/TGeLSpSVQNjAyIRE=;
        b=hif4G5/I42vFMX4VmjzMxFiACbq3P2SGGUN9W5ZswvpamVLTgP6Kxz0xeYnr2ISaJb
         0tpv5IL6leq9vRHHBDro/v7mkWNyWz1AG76wg4tow67mgZncPR6eHiWirDczYlGwhgru
         LrVIFg+g1UE6liZbeGESuy14nVA+S1VxTZmFbUqkzZ9i8tAkcWxyZnftXuKq16mzPpo/
         mQ/ZPqmxj3Xq+5swwTLL2fk6EWbbi6SDueCVhcW9oNPKvphkm7ZDSddP348JsPcBSCwi
         Y3N1GhN09E44/BsZ0i2zoK8PkhlKGoZfpAr81NQHQlM1TpbHiYp+Uba1SkuOvgx7fKNd
         uBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788892217; x=1789497017;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Ljl5aeAKEUYZxDTI1oTdQw1xJ/TGeLSpSVQNjAyIRE=;
        b=iIAApKPxpi3gkh/9qLWleLBNDHg3mUYF0KPTmUbgJLUSy2Kx/o3u1wa5XbL5K8eNQ+
         Eo8qT1HJ+7azAYShgiwegbIgMcaNIO8c4ja4cm5C0fU5VY0vdoWAvXiBSRl6kSnSq/Tg
         G+ODCMUMdUam5ibMKGSsc7IyQN8wuoiCY2pWf/mLCW8/Xl7Bx+Rvrx3qUUpPiw2rIsjG
         J75VKne3a/3WfMGiW4iFg9JtpUSmcRMcuDrqfAHtnUtF1Wzt52GNObRDX2mrl0ZlD5CR
         BRYBZa+fLtxqrl+d7LZHmwhJ2NwxDAsvcxCYnLQ/VtXrWZkscPfh6Am61XUMJJ/ep/q8
         QaRw==
X-Forwarded-Encrypted: i=1; AKwUvByF5XA+D6CbQqsbSO8ZSKK89UcfohIhyde2nuyIUynrqvB7wU+7LRnvB+3PpTWkxmhq6KMIzl0WyCo=@vger.kernel.org
X-Gm-Message-State: AFuF++nT0OwnLjcTuBGM7VWKs7HmQTgLd3mi2xHEbpc3r+/x53PFhC1r
	JCgqvvimEMVRL3d8gP7ZxTWl08krJeVE5T9TAodD49Ah3qpVs54pZNkZfjQNMtOZvXI=
X-Gm-Gg: AYBFou2Zq4OEiyC/Zspf+IB9Bnh9kvJ9EdERYWt234E57cuV90CWAvJGxRWaVH8pfb7
	3Owwd0ARyFuqPbbOMOGUJ2YW4qk1Pwsx5IcJOaS2G1me8vnGX5lC3j1k1GOwmv7+Z4iEznxJEj5
	pE4f+BP8oL2QOQ5LVdB9u8wnLToZeFHyVz7JYcX4i4Nqw7mX/wbCoMfunP5yy4N4cNGkrcB5hjp
	4kPjcqxJUnyMyJ4WkTGk4b14m2BxqYvYHEm00veltSNl7F44wAH6u1NnZXoncnAJakM3cNFL2Gi
	QtuwzmbSMGMAmYTGPdMl2d4iBjmxKEvuyLjHn30JEDGEY/5FVh5Zxu+ELhR/SW7P19snxX/eR1V
	MsEzfj8WI19eCe1Gba4FjaXvGmUBCWlFWhOY6OQbuBwvcAvNKTB3I2zju553G4xM613QwFM+ENj
	vaPTgdcCiHja482JvDG4qQ4BYK4hU/bIIKtwqRkhFI3thKZmbN/S/GLuBP3pY=
X-Received: by 2002:a05:620a:a38a:b0:939:f89:3688 with SMTP id af79cd13be357-9398048b90emr2615843685a.42.1788892216424;
        Tue, 08 Sep 2026 11:30:16 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939b8fbc1dbsm312983185a.11.2026.09.08.11.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:30:15 -0700 (PDT)
Date: Tue, 8 Sep 2026 14:30:11 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Kairui Song <ryncsn@gmail.com>
Cc: Nhat Pham <nphamcs@gmail.com>, Chris Li <chrisl@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Yosry Ahmed <yosry@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
	YoungJun Park <youngjun.park@lge.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren =?utf-8?B?QmFnaGRhc2FyeWFu77+8?= <surenb@google.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Rik van Riel <riel@surriel.com>, Gregory Price <gourry@gourry.net>,
	Wenchao Hao <haowenchao22@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Tejun Heo <tj@kernel.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Meta kernel team <kernel-team@meta.com>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-doc@vger.kernel.org,
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joshua Hahn <joshua.hahnjy@gmail.com>
Subject: Re: Path forward for Virtualized Swap?
Message-ID: <aqBT_35E-eSoN_zj@cmpxchg.org>
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <CAMgjq7AHRzBsbmGOx0s=TQFBwcn=DEU1naR443sO6x+pJd6hAg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMgjq7AHRzBsbmGOx0s=TQFBwcn=DEU1naR443sO6x+pJd6hAg@mail.gmail.com>

On Mon, Sep 07, 2026 at 01:51:31PM +0800, Kairui Song wrote:
> Where I've ended up is that unbounded growth is a real concern. On a
> host with no memcg limit (root cgroup, and most desktop and embedded
> setups), an unlimited pool means usage can keep growing, with no
> admin visible ceiling at all. I'm not attached to xswap's percent of RAM
> knob specifically, but I do think some kind of bound makes sense.

Swap space is just process virtual address space, no?

Swap entries already have one or more page table entries pointing to
them, which in turn are managed by trees of vm_area_structs. That
means rlimits apply, overcommit protection applies, and OOM killer
attribution works as well (oom_badness()).

Shmem has its own defaults and limit interface on address space.

I'm not quite seeing how the swap space needs an additional limit. How
could users break things in unique new ways without it?

It would be good to spell out that vector before discussing numbers :)
