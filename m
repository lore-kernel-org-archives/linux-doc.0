Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDEA3403EE
	for <linux-doc@vger.kernel.org>; Sun, 20 Sep 2026 01:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789869195; cv=none; b=Rx40hUGnGqYofkRRCj/BLUOD8NxI1LX4X5AK4KKeaCqhrDeOu/GG6Rhxa7gQJOG0gC8qu6RiRrg7hxlkmUghnz+Vc+c2JTflCg6SoGsQ/1VgsUw2K+J/GHmkakJSPc7eXz8H1cd3JzdsQMVALSWw07bvo6jPQRIJsKS5tiMjYX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789869195; c=relaxed/simple;
	bh=CNs2E+qGO/+zrUl6drj1OWrYKFws96jmgTMzhakpZVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cXgR6sUmFDi2of+BmvOB9M8nXK7ucanZlbe43+LydHXK9LdfUW1Fx8tXc3OMmTDT4hPI7yWBPADKDAy0bmFu/lVx/jx9+Qt4jXzGZUuH3W/kU0XGnSPbWKFQByisqZJj3USCuGpX3Wurtb40u4fScplzbAscq+ZYqXygOMUfITk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=t+brCQIh; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="t+brCQIh"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfbd3208so19402116d6.2
        for <linux-doc@vger.kernel.org>; Sat, 19 Sep 2026 18:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789869193; x=1790473993; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3IyWi76YFd5k6sT6Wel/JshxFvWpuBbjBUhku/DcG8Y=;
        b=t+brCQIhIf9oq2CfCLZb1EBKwtMgyN5Bq8cx90tuIXlNI4bBv7WMP1zwHQLMo+S5pm
         1aVFrqPYQXnRchsLGBrw6B3vsQqQN1ynKuEu7MBuxw8fqk9bGJiOFZznWZE6BC0ms+XT
         oedfr7MaAOJFWXOlmrPTqXFVXbgFhXXzgDA4nYhJseR8NvPB5qKWaX3DrgbpLGD/5XLO
         GUyLJsb1pZ4xfFn7zsl/qln9eaD+d1x9hCD8+2iwA1X4LMx0dVQZoAsM4MywaRfWvCBj
         sUfdnxS0dpe8LiegjaNF/Amr1bJMEyjK5KP0ANEPtO0AyZc8bBEr2RMuNcD91gs4tqY7
         ATWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789869193; x=1790473993;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3IyWi76YFd5k6sT6Wel/JshxFvWpuBbjBUhku/DcG8Y=;
        b=p43eoee5qe3I8gbzYatx2cD1HLIBUu2iQ+qO2EkUnqRlJCDGvgMAOdENdPCCrgIzir
         99Vo7Xv95+PLZvCx/YkGRc+9vgv+lN1rGSz/PpCNFN+tu0cIsx/l99zUW3XKZTkg6nVQ
         XrNCJMwks8F58lmTSRDbuhq8APMvMKbXLa/s8fhT7qtgQrwqtNGv+m50GoDvJ0+dtBUH
         QSqw6MuoAEJGKfwJkWMLUVUB9eV9oTE+CoP8UldEQfuJpkytdvyOyOitb+VG0s/yLA/9
         V5yNuJgEYwVHM8Up4qVblt/jjCgaRbp7qg57/G9APmLuT0/GS4gOkKefw4XXE1EyWl0c
         O7gg==
X-Forwarded-Encrypted: i=1; AKwUvBzL0iL+056m++mso0wFSwcfpZiDxMk+vRytAl9BNOv4MgSkPBLYWeAa6PjXqwCr0eXcUqufYfIjGwA=@vger.kernel.org
X-Gm-Message-State: AFuF++nLYcZGHPCC+NbsMNdszbt/t5uAjha69Qz9VmtbMJZzWgRjI0m1
	/G7zyffFaxrYDCvPHjR5IAQc+RNJrDSowAb72ZkSxO4XdfTbmouFqDn38qgpVZAISnk=
X-Gm-Gg: AYBFou1tdEM5WdAQnCPWuu+nV7ihTsCAn4Vv5jUfF4MZDHzg7+22UZZr/nvCi+qyCE5
	RKdAo4S/3sJ27fVduH+rCqZQh78PUu4aN3A/PXJ803g1wB1ptcdYPXFsSZYEDikiJRdMpjH8gv+
	IHBJkPkzrarq73gfUQWg3cdIWTq1GpdHFxfOwyJVTEni+gv9LwSrrnzbICMDu6Z1RX2O1sqpc92
	6CkBmuEcgMKd4OargK1/EtpEvXF3KLamSjIqnOPJQyEdYTAqSCUCEmL/SzApafaEmA95D6GEUXA
	JS5OTXfIuVhzpjZAhwPROwlwRxGiarPwUNkNyPHBYMstIeLg4fXyAQZMqhtZDuv6jla25mtGsFg
	PJ7ArwJrVqBFiKt4Ar1qJKJuVzHUUNXYx0FYDTeXAXuAnahc6aKm/kkrArBe1hU51/KTu3B0qu+
	9iu1Mcfy0MBlj5tAb1czHAv3jNaMpuSmbTCU+S2DSReojIrzAb1l8nQXFWtEzUcNWwWQhh4axq4
	bjuQ0Ba/1BwpzsLBLwNetygvahUq5GGunEdaSq2hjteG8mmSwsDeDU=
X-Received: by 2002:ad4:5948:0:b0:910:4da6:8354 with SMTP id 6a1803df08f44-9129c780d08mr44342896d6.17.1789869193050;
        Sat, 19 Sep 2026 18:53:13 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260a9a305sm32833856d6.37.2026.09.19.18.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 18:53:12 -0700 (PDT)
Date: Sat, 19 Sep 2026 21:53:10 -0400
From: Gregory Price <gourry@gourry.net>
To: Chris Li <chrisl@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, 
	Baoquan He <baoquan.he@linux.dev>, Nhat Pham <nphamcs@gmail.com>, Kairui Song <kasong@tencent.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Barry Song <baohua@kernel.org>, 
	YoungJun Park <youngjun.park@lge.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren =?utf-8?B?QmFnaGRhc2FyeWFu77+8?= <surenb@google.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Rik van Riel <riel@surriel.com>, Wenchao Hao <haowenchao22@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Kunwu Chan <kunwu.chan@linux.dev>, Meta kernel team <kernel-team@meta.com>, 
	Linux Memory Management List <linux-mm@kvack.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Kairui Song <ryncsn@gmail.com>, Joshua Hahn <joshua.hahnjy@gmail.com>
Subject: Re: Path forward for Virtualized Swap?
Message-ID: <aq8dja2-timYBwyB@gourry-fedora-PF4VCD3F>
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <aqJXx2vtbKaRLt3x@fedora>
 <aqLi6cIjD2wJwk0B@cmpxchg.org>
 <CACePvbUG1ApMzMdEzf-63rpjgGVNsRk21pT72OQGJpM=OtRUew@mail.gmail.com>
 <aq6cVXPLUUwJA7-2@gourry-fedora-PF4VCD3F>
 <CACePvbVaPDnva8X-Xmz84r7j5HjTuih-w5phpw7cerK2uPnK6w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACePvbVaPDnva8X-Xmz84r7j5HjTuih-w5phpw7cerK2uPnK6w@mail.gmail.com>

On Sat, Sep 19, 2026 at 09:02:28AM -1000, Chris Li wrote:
> On Sat, Sep 19, 2026 at 6:08 AM Gregory Price <gourry@gourry.net> wrote:
> >
> >                         Memory Post-Compression
> >  |[CD][CD][CD][CD][CD][CD][CD][CD]-------- free space ------------|
> >    ^----------------------------^
> >          Compression Space
> 
> Thanks for the explanation. So the compression space is just the
> actual data store backing the zswap/xswap/zram.

No.  That is not what I said.

I said 

   It's the *amount* of memory consumed by compressed data,
         including the metadata associated with it.

I do not know how to be clearer than this. It is an amount of memory.

It is not the memory itself or an abstraction to describe how much
memory, it is literally the active amount of consumption - a number.

> Maybe we need a separate counter to track actual memory usage,
> regardless of compression status.

the separate counter is... the existing memory and zswap counters.

> I want to add support for your usage case as well. Please clearly
> specify what user usage you want, what the expected outcome
> is, and why you want that.
> 

I want:

  1) zswap on machines with no swapfile

  2) without being asked "how big?" - there is no number I can give
     that stays correct, and

  3) the bound should be the memory limit that already exists,
     not a number guessed at boot that hotplug invalidates or
     guessed at swapon time that different workloads invalidate.

This requires decoupling swap *file* accounting from zswap accounting.

~Gregory
