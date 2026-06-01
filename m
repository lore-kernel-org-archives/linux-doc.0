Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC96A32938D
	for <linux-doc@vger.kernel.org>; Mon,  1 Jun 2026 17:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780333715; cv=pass; b=UeISzYBHcwGbePfOVGlx1Utib/9gBFReZc+1A2hN/nKpzdD/ZsjrsA1MmUIs/f5WVL47Jl4VCEivLPrB4gukJOeBzJL3VT9pcILQzL2vfzzkW+HPP98JEh/mJX9E629h12oUgvdcHVOvjbk9WHoMY3snarfQQt7LcRPLLHuDZq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780333715; c=relaxed/simple;
	bh=Fwo9lRnl+caU8n+bkKsCokOR7tEa4er/MbruZS778hU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZBtQh4Ks5/LsG/dldClKXobofHiQw3a+kY6y2ji+L2plboeL2Sn80wZ+1gN7OYxrmINHBw2AyvteD36TD8fJHHda5FAXbVdppfDcli/G1mVsw6r1eRueHWoP+T+6XXYIZ87QbH+rsK1hHtXqz6kLdddxDCEQdZUkBGb160FkSK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7UGfAhq; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7UGfAhq"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45ef29c5561so1760117f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 01 Jun 2026 10:08:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780333712; cv=none;
        d=google.com; s=arc-20240605;
        b=ICL2n70WgBWZqaQMzYwDg5f6N7SyA5rbXsQEZcCfcSOLa6fgnYzQtJc+VCoGkSakoJ
         NAtIZ5ozV6Zbe6MEdp4BgX4diH+2ziBSqSSMmmINTzRF3YMS2U1cjnfXYkSTgis07A5s
         FxZvNc8kmRAxcdm+xPCEWy8eAeML8Ve3n5lbnJXM9ZIow1x5FL+8d940ResHCuCHrDWi
         oPvngDH4SKKSI4F8OtDeMbXBjGqKNLTqFSDpqFiECnBXJhev6baBjVswUiP6p1UfQrjd
         Snac0m8f0ZHakRxRF8yoSiAln/rITL5zKghfSar9pJAsE+MaC4ACkn2CiTycP+Cm2m1y
         CjfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fwo9lRnl+caU8n+bkKsCokOR7tEa4er/MbruZS778hU=;
        fh=CmTlZ3kfC+7m7s9fI9weq1g38GCJDqXUFl6lwuZoV6g=;
        b=OZyA/h3W0vpVrE1oAgiIUAUhmNwGbsd5RlzLwoSRVoCTd0tNzjZcw38u6mYuwZm7G3
         IWQHvtkUeg4h/7TCXTOwKHR+reuXW8Z76eFu/5lK+ncFQS06GjEXJUmeekyjCmiTAtfu
         xhrV7845u1ktWBdc8N99ze5/m80wUxuuA9qGe6gbg8x9NmxVItTmU2M2TSVW2ToabrIR
         pBh9aWkED0Qy+RCf7czJbFq9tfS+rsEvz2Z2D6aNuuYJNiQ0+lkmvm72089p5DF5MTCn
         6khj9NoIG6/UIskjNy26CaEtQk03DX7G8blJErQ/glT/2Mn4i1SeX241jdoI0NBWeHM7
         Jaxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780333712; x=1780938512; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fwo9lRnl+caU8n+bkKsCokOR7tEa4er/MbruZS778hU=;
        b=k7UGfAhq0iqhq/RKGRfi4ukFlPfV7EWWiODDDeRBrWdGgYbqPyhvBy5Hwj/IfjTTDx
         l4CTISTX1QHCrCUt0PuH31LrvstZwlAl9/skCPSEIFPaYoOZpY6YBBQ0BSSG4eZy+kSe
         HIDXCMxyfRFTPXgNPr8+WKg7SzHBkyO15LF1fytdCLlvIhdRbw/R8RPX58ekl3MkNakO
         0Gsu6meStTt5LSJcm6d13oGHAfTGiU4pELQ6FUgbltf2QXPoeaZiDNqP4fSdSA71hfTB
         IQ6NeedL/Ghv9yDYP7P96nUOhkALAhvbCC22PWR7wAFQ8zHOsJmu/NVOq8bfcIqiABqy
         DNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780333712; x=1780938512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fwo9lRnl+caU8n+bkKsCokOR7tEa4er/MbruZS778hU=;
        b=mxdNXqet82AKUiL0TZs32JmMG663DrwE4Qx6OTGo65k/gL7wWarl8BsVMjvZxjnE/J
         m/WKmsZLdv2pztVnsI1Eu4K+WSMvfRO70KlOgWB5zfwQpsZpzGKgenFNKK5sTCJP2Bxb
         eMJ3i93CnQVIGIT5w4hN0HYiZPc1qcgeNZRdXPBjyS1vfA0Z9JGerVBZLEmqG9qDw6WV
         6fK6hDaEXfxOQV3f4aMLRJYGm0AVkfKfILhFST9Da72jic3JDgb4BurymkIK6nMIEF9R
         s10W4aGKRCSZftL+PxNuYJw7/AhLArGtx9DTofnuEryxrwGLATaiYk6nfNVrt0sA1xZx
         x3iw==
X-Forwarded-Encrypted: i=1; AFNElJ+7oj5PSreK5QUlBxMjr8G6JMeRbqBrDF9M9zMgiruMMFj2g0+RxM4gJy2TbaQ8oXrxR5dklb/Prtg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG42RDJh3WEO3hC/zIuvCW+c2w8gWY/VuqlhZmd+ktnALNUM+A
	VSROtagYJbGc/s9D6OsPmmtH3LAa/N3k+H7ySQvTkZ22MrYdEuBSQwbug1hSJtdpb+JihuMCnbS
	6lLA3jAdk3L7CFM5U6BD6fxCIVRomJH8vnAyv
X-Gm-Gg: Acq92OHdNr3iXgvCWYWC58xKPUMH3pJ597W9+KA5KPAVHbnPsCnVwUZ4cQJImT1FhTA
	aqcWZRkH2OLI0sXpMpK8zXIZrcRO5rWAgGte0TFgAYLRiImMnjDRmjhhmzUbwPWbOLMsWbIF6uu
	1s5qwRcwTs38+ROxIgcxquhah9x7j8vH6oQpuonUYoB9OWimMpFryBf5t/Pn9wfV3icH/5QulDO
	3qDDSz9qj5lC47z7n9Kmf5kP+LJeh6N1I7kQHt3FrvYmxj2Sonr6vFsQxuPSkwg8XzxVgrevXMK
	1zayas05BUZ3Afih/qeA9X6X1I8GDaYwsvaB6ASJh3Z/GC/NYw==
X-Received: by 2002:a05:6000:18c6:b0:460:1301:ded1 with SMTP id
 ffacd0b85a97d-460131122d6mr4841379f8f.6.1780333712087; Mon, 01 Jun 2026
 10:08:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526114601.67041-1-jiahao.kernel@gmail.com>
 <20260526114601.67041-2-jiahao.kernel@gmail.com> <aho7nepN5jZtKmef@google.com>
 <8c0e60e1-5713-69f0-a687-088c87e75764@gmail.com>
In-Reply-To: <8c0e60e1-5713-69f0-a687-088c87e75764@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 1 Jun 2026 10:08:20 -0700
X-Gm-Features: AVHnY4IPBYIavrsVjRZcklh2r0yiWvzcpUqLWkliFzeatE9D_yJwDY6lgq1MVZs
Message-ID: <CAKEwX=NoQNXOMDD0uTSOPWHQX-CMNU1dw=zEuFj=eLcS3fB-ow@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] mm/zswap: Make shrink_worker writeback cursor per-memcg
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: Yosry Ahmed <yosry@kernel.org>, akpm@linux-foundation.org, tj@kernel.org, 
	hannes@cmpxchg.org, shakeel.butt@linux.dev, mhocko@kernel.org, 
	mkoutny@suse.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 4:07=E2=80=AFAM Hao Jia <jiahao.kernel@gmail.com> wr=
ote:
>
>
>
> On 2026/5/30 09:24, Yosry Ahmed wrote:
> > On Tue, May 26, 2026 at 07:45:58PM +0800, Hao Jia wrote:
> >> From: Hao Jia <jiahao1@lixiang.com>
> >>
> >> The zswap background writeback worker shrink_worker() uses a global
> >> cursor zswap_next_shrink, protected by zswap_shrink_lock, to round-rob=
in
> >> across the online memcgs under root_mem_cgroup.
> >>
> >> Proactive writeback also wants a similar per-memcg cursor that is
> >> scoped to the specified memcg, so that repeated invocations against
> >> the same memcg make forward progress across its descendant memcgs
> >> instead of restarting from the first child memcg each time.
> >
> > Is this a problem in practice?
> >
> > Is the concern the overhead of scanning memcgs repeatedly, or lack of
> > fairness? I wonder if we should just do writeback in batches from all
> > memcgs, similar to how reclaim does it, then evaluate at the end if we
> > need to start over?
> >
>
> Not using a per-cgroup cursor will cause issues for "repeated
> small-budget calls" cases. For example, repeatedly triggering a 2MB
> writeback might result in only writing back pages from the first few
> child memcgs every time. In the worst-case scenario (where the writeback
> amount is less than WB_BATCH), it might only ever write back from the
> first child memcg.
>
> Similar to how memory reclaim uses mem_cgroup_iter() (via struct
> mem_cgroup_reclaim_iter) and the old shrink_worker() used
> zswap_next_shrink, we need a shared cursor here.

I think each proactive reclaim invocation just walk the entire subtree
for page reclaim right (see shrink_node_memcgs())? Would that be
acceptable for you?

I also wonder if we can at least make this structure dynamically
allocated... In a system, you only really invoke proactive reclaim
against a few target cgroups, no?
