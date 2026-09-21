Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3400949B44C
	for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2026 13:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789997226; cv=none; b=LjHG+GWHSB0azV0+xUD5xynVWLRSb4V3+0LC1QOmjHzTYX+Xdbs+RSWCNPioQlhVKEiBxW7iLCRFRqSerxTcDWAS0E82iReyOoxph5w3Lm65vg1RjewtkU4sae5iPm8m9Syl8aMWjUxQxoZfvOYUP4OyMBTrx60YLGL/eu9jauo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789997226; c=relaxed/simple;
	bh=z07gEgxiByRAIN7tX4z36O0fQ/gSBOoeA4kS8wrRVQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TJlG62sjiO+qTxthBMIjSeJs6fDi1ghOv0Wuir1QWVaU5sc3gClzXsnJ0CM6ifFptE+KQZuap0hw8AM8JM60u5L3vVYprRYE3h+fpRre+OKZMYacju69X86+xL/A4GAbur83UaykZKVOFV5MrBboLvgjfM3yKBUnIC1yCoH3G1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=NOr93cKi; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="NOr93cKi"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530301ff353so39613991cf.2
        for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2026 06:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789997224; x=1790602024; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g8OWcp+USTfkb42p4HBmWgHmBefi0T5/3MfSmR1kOTo=;
        b=NOr93cKiRmbB4w06lXOAd7uJFr9XaO8kfo4qQh0wM+cX5B8NDdq7Do36ejnNhbAcnF
         ghG2DgVIH92PTVnXK6go0kfGILlhawSPuKjfRDIC3p0Pd08qe9YaTUWW5TLEWTALwiHR
         az9uMAm5hs4UF7GM7OdhbpoBY76Y/YXj3DGsMJD8GkEXFSlf5FhsiJ32OplUe7ER8H1q
         JWTJOcXmBgd7JxLHHtFAbDGDO+ZJ3TCyAymUrr0F/yo6cY0YMGrCZyMatwJYj3zt9Kjd
         ejrpamPB7LZQpl3+GFTOzIr9IuNDqaJazsr/uc/C7I+/CxcWj9oBTXW6PsJ/3jjts3xO
         9lug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789997224; x=1790602024;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g8OWcp+USTfkb42p4HBmWgHmBefi0T5/3MfSmR1kOTo=;
        b=xuFxZMVmfKIF3vS2mJ1oeFySd/POzB5k2jHoo53grIEXGwxuGL5R+qiojLaFGFXzkr
         ZYcEla5bbMFneeWPltzfRHAVUEf1MZpwtbar1kPh8Rf+SxmqFYLl0cYkYM41qXEQHRAo
         5vEjH72MKC4hUjyAz8cHmxFWnrVaR3Hiua36Hiyy6G2cMgIZslqpg9WP2l/66DI6uzbK
         szKguO/yo7bmZDtX4T4tIoulMQ9zP1Ef/5NdXiTSBbeqOcd6sSanPcrNMRPZT3N/u1fM
         47vwsczzTczoSLn6FPrTaIQ/K57+M31a5KyaiqAlc/4LebixkYEWDwluEssfB8VChphH
         5xOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzF2Va83x3QYapPcA/sZrgHmV3f64fviO+qGdeYbI9genbenwTO7zeLsp9JeG88dlkGsKevWHoQVEU=@vger.kernel.org
X-Gm-Message-State: AFuF++lISiNhlIwTtUIgAUrfvJqeM7Q4FYwPmx//oAbCa6511i3kB4ZT
	lk6QuvxG3Fx2VjI4hkiztqm/hrTIP2R2fZGS7Yx/o5p7l0umxGxAFD81x8jacKZEih8=
X-Gm-Gg: AYBFou2X42g0XWKweL0WfMsOB85xdJ5bv4r1UAYMlP39nIU3gU8DgonWM9ve4kPc0pa
	ALcxSIemd/glTxO+UU0halYOEwiMIPuGLnAkUEBJyHaAywdbl4Dv/zkckxw9u+0rQXeWh9ocCy0
	CM13z0iYHevmUlE9hNttNPQpLd5cF9C7OzcFuJUNpAUOHiVyfUVEq89HrTvN7xIGcO5g+hqnUAA
	FM/L3eblZg+dBNqhzzd5eHA3ozfRflX1978T1tUuVou2EWPYegdEtJtTY8Ah+DMSSi4/L9JOxgH
	c5H7HkhWhLKFhBk0wKGvlYLVhspehLpxra6YnMnpyRMeNXZE4shAjmT2J6SPGe+JHSGyzcIWOsX
	8w7L/RZmP+b/1e/GDNxRHdopH8jhaSMVD7UKUhQdmjDcCRuPq0IuCDAj8w7Evl13WQEQrr2ghyr
	8z7k1QrqH2IrC+T+ADNseMGLGpMVHdywB0PEG1YsM6T8MdsIZpRtjUpiInSgoOLKvU0ueWicDGX
	dRvYk1G03izCyMie+djHkUkk0y3MacY84Y5BPwUiC09HfcTLwrxgt0=
X-Received: by 2002:a05:6214:4517:b0:910:6d8f:a2b0 with SMTP id 6a1803df08f44-913fc94a599mr6047846d6.31.1789997223808;
        Mon, 21 Sep 2026 06:27:03 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260962cddsm70137456d6.3.2026.09.21.06.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 06:27:03 -0700 (PDT)
Date: Mon, 21 Sep 2026 09:27:01 -0400
From: Gregory Price <gourry@gourry.net>
To: Kairui Song <ryncsn@gmail.com>
Cc: Chris Li <chrisl@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Baoquan He <baoquan.he@linux.dev>, Nhat Pham <nphamcs@gmail.com>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Yosry Ahmed <yosry@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Barry Song <baohua@kernel.org>, YoungJun Park <youngjun.park@lge.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren =?utf-8?B?QmFnaGRhc2FyeWFu77+8?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Rik van Riel <riel@surriel.com>, 
	Wenchao Hao <haowenchao22@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Tejun Heo <tj@kernel.org>, Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>
Subject: Re: Path forward for Virtualized Swap?
Message-ID: <arEotFqE7ZZoxMHd@gourry-fedora-PF4VCD3F>
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <aqJXx2vtbKaRLt3x@fedora>
 <aqLi6cIjD2wJwk0B@cmpxchg.org>
 <CACePvbUG1ApMzMdEzf-63rpjgGVNsRk21pT72OQGJpM=OtRUew@mail.gmail.com>
 <aq6cVXPLUUwJA7-2@gourry-fedora-PF4VCD3F>
 <CACePvbVaPDnva8X-Xmz84r7j5HjTuih-w5phpw7cerK2uPnK6w@mail.gmail.com>
 <CAMgjq7CJBHkoZmg9oKNgGA8czL0djyBTCAkPz8ETm-tX=Qci4g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMgjq7CJBHkoZmg9oKNgGA8czL0djyBTCAkPz8ETm-tX=Qci4g@mail.gmail.com>

On Mon, Sep 21, 2026 at 12:01:18PM +0200, Kairui Song wrote:
> > First of all, the traditional swap counter has a very well-defined
> > meaning. It is the size of the memory that, when accessed, requires a
> > page fault. A page fault adds significant latency to memory access
> 
> Yeah I agree on this. Swap just about makes resources not directly
> accessible by the CPU act as RAM, whether that is storage on disk,
> compressed memory, or a network resource, all accessed through a page
> fault. I hope we won't make this fuzzy in the future by introducing
> too many magics.

Hm.  The counters are already fuzzy - the accounting is already doing
two different jobs.

Suppose we want to allow 24GB of logically swapped memory, backed by up
to 8GB of compressed RAM at a 3:1 ratio, but permit only 4GB of physical
swap.

Today we have:
  memory.swap.max  = ?     /* logical memory requiring a fault */
  memory.zswap.max = 8 GB  /* RAM consumed by compressed data */

If memory.swap.max is 4 GB, zswap stops after 4 GB of logical pages,
despite consuming only 1.33GB of RAM.

If memory.swap.max is 24 GB, zswap may reach 8GB of memory consumption,
but the cgroup may also consume up to 24GB of physical swap instead of
the desired 4GB limit.

memory.swap.max is simply overloaded - there is no way for us to express
both limits.

Could we preserve the existing swap semantics and add a physical swap
counter instead?

  memory.swap.max  = 24GB  /* logical swapped memory */
  memory.zswap.max =  8GB  /* compressed RAM limit */
  memory.pswap.max =  4GB  /* physical storage limit */

These limits would be independent and compose naturally.

For a zswap-only workload where we care about RAM consumption but cannot
predict the compression ratio:

  memory.swap.max  = max
  memory.zswap.max = 8GB
  memory.pswap.max = 0

For a workload that performs poorly after more than 7GB of its logical
memory requires swap faults:

  memory.swap.max  = 7GB   /* workload-specific latency/SLO limit */
  memory.zswap.max = 8GB   /* uniform compressed-RAM allowance */
  memory.pswap.max = 0     /* zswap only */

In short:

  memory.swap   = logical swap       - workload/SLO limit
  memory.pswap  = physical swap      - storage limit
  memory.zswap  = compressed memory  - RAM limit

This would preserve the existing memory.swap semantics while allowing
both backing resources to be constrained independently.

~Gregory
