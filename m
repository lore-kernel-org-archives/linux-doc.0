Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A92E37998C
	for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 19:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778528991; cv=pass; b=VCh3VdBuAuyZbPF4MkWt2Si+Ia9ifoRNwn73UbaLqYyQdqGxlpsmXOtkHGRZHJ0hRElko0UJmJOsZNm8V7rh7d29Ui55y4jn3miDhJ6Ii3x+XxVe2WkkM0zKZk3gO9uKi6k48obqNJPcl3DnfFlB5FkrR70lpoZVC2fXCfKIxqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778528991; c=relaxed/simple;
	bh=sLtCkaQgWPkzthxnv5qVsmODrG8dD2rCKuHgHNedMWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kkGQvu8d26Xh6uPejBI8wTeciF1W/nGR3YK0bD82N51YODt9P6/HgCkLLnmDnbrkmKw7itU687N7rlp7K0glnmiXd3VynxO2fbJa5nJFEMuqZxZ9W2OtxSVsqQq0DZ4nTPY52PPphorqAfKI1RmdStjqrMuGxIPbWLeYNX6I27s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FIoCoOjr; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FIoCoOjr"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488d2079582so50833635e9.2
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 12:49:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778528989; cv=none;
        d=google.com; s=arc-20240605;
        b=lzPLy/mI1YpcqTEquVV0JGYjPHEUG7+CLp4viawsFTQ49Rorw9t0BeynSrZANCPR46
         lH3NhfvxXnOY2tkTsv4lPgQLUS3SvWoSwaNq75bNC3guZlj77kZ/DJGww/4jeKB81g2T
         di2Bdsv2dYxShct5CWqFNPtPHp0jVgXOC+tEKT6NcCZH4Hk31ciNfBzMdaDYObBZpsBz
         D2xFipZBXaHd68cJdtXTrl4k0IHlHb9r1TaS72PFByXSQRAqgrDMdJvyUmKxnpZib9Qm
         VezrHbYEuW5dejoj8HLzgH6lgBakwaF4Xs/SaYdu6a/wcQ1VjgEn738TaB5vdOamhmg4
         bryw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sLtCkaQgWPkzthxnv5qVsmODrG8dD2rCKuHgHNedMWA=;
        fh=BLwD0xy0Rz6rqXrNQqHcburMuhFUhg4vzwo6alCk34g=;
        b=k/3DmUy+0ka27lhGaClN+BV6+d5EOMff7kPgLKN5joLQxdsHzQ0I6zxU/mXYX+hbql
         4eQgEDhyp2H6aSpBJbZjHHjsCHNaIlkeGdXwT4BegsQiEfu3Pv3lLYv5wKKaoT1Fy7ik
         Ru426ayczB3sTc+cH5F91M7gErhVB72gxfgIyQKSpmqC3QDunurFH5ukF68EKS78S47D
         rKibA5Zot/Ee8ddjm9CIWGlkmU6btTLYgldCY8TjQmfKczFbB/WMr6fIcu00fThY5LG+
         NQAOxDAjedvKiFSHK2JPN0gFROLyXRzDmTxLHTqrLWneXki8f2Tfd1UlAKbXQJdgKjcI
         skBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778528989; x=1779133789; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sLtCkaQgWPkzthxnv5qVsmODrG8dD2rCKuHgHNedMWA=;
        b=FIoCoOjr8Et2NPOK9rRdh1tWUQPmTeIkK1J+12uMnv6VO8S1vcjpHVNAo6pWtWGCIX
         FkrMrzLLYOorTMg1TQO65AOg2D2vfr0GBynwgqqjU31kqieQHjEobqHI1v/mFW0Vgmjn
         ocYxZXBbOpbUgAs5+mFWBlVkjLVRZfxb0JsEVLB3ycIgYN57bgURZMp+CvOwSPhyUXNN
         jCOwHhy6BjNvlbTH2SNYBThPrBaiuBaY/lasoZSYXzdlSA86eUBL17LGxo9crPNzhKAe
         6HzPSHRCmAAHDrr33dOAgb3kPYTuCaGqcE9KdKhqWUDmu3uXRqs9c4RQP9bsUVBEkNGv
         fzdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778528989; x=1779133789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sLtCkaQgWPkzthxnv5qVsmODrG8dD2rCKuHgHNedMWA=;
        b=Borq4I4IEjRLnkRzfTfyNpBY0d8gpDZHXCCeJyKqQORmCerLtTrSIaS0E8dRZuFBQl
         QCZyaoiBqXKJ4Sfno5RdPev6HEKp6J48OQkDoAutdbm6fpyy22upw2hh5HZdrK99UEmv
         iNPSb5TpsZHh67kZJI1rb5Ks9XzaN5AVF5aao5eejiaiz3Wiqvd1Rvia+yBplRtimFYw
         eCN69on1IoyaAKubXU4VEsl49JXX1bP4l+gKr+zzMUw2GqAJCO9Bjm57rQvToSCHjPNR
         XFF056PItcDmDi00iObcjipuhXYD6bZi9Fq9fOblrocJnR+hlIUoE8WRTTJ1DdK4fgm3
         46PQ==
X-Forwarded-Encrypted: i=1; AFNElJ+NM+LPOkz9S3kyhcCAbMSzA3CGQtTD0s17MwVmZ34as1adgMBDUiyRfyKQt4pfwYyN2stS4SFiw3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzTfFPYBOJYcNTDYVGPnpgxWuBhAAihMZ+bPyRnre/wDYXhGuc
	gxEFuIxEPl3h37bWKpOVcLWYwiU9cCSc7aoJxjzWPZZspbZ84P2eboW8QCAwi4iVMLkMzc625QC
	bZB4+VNfmvJd7tyQKfsYsRuDsjOS07ns73yfYDskFYw==
X-Gm-Gg: Acq92OGiXR0617g88JgQbQVPJTkNhj+UiHqiQYvbpOx2ldaCFap2BSVAQbgjtPweX0H
	mTJEdMPZXl4IhsWJQ5qyVRPZhpvZu4cNwly9eu7OYvq1dxLCD8CDc7V//F3+HKE6FkeEEsDNYQG
	BP5RuBpPJp4REAo8AWjHuBoHC8OX//HIcAB0pHtUH75vMJZK1Pb0KLU3Bv1GsBSxbhB3sDEMOe6
	EGrJAiAKjqYV+XNGnYXH2TkhJk86Hy4ROQzgEtC1tHLjBbKUKsFT89+0KHuGkq32eDe5VdPof6S
	c6xUwOxTG/bu4CTtmTZuZJ3wigy/XaHjU1n/lDY=
X-Received: by 2002:a05:600c:811a:b0:483:7903:c3b1 with SMTP id
 5b1f17b1804b1-48e51f35d0emr397154915e9.20.1778528988744; Mon, 11 May 2026
 12:49:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511105149.75584-1-jiahao.kernel@gmail.com> <20260511105149.75584-3-jiahao.kernel@gmail.com>
In-Reply-To: <20260511105149.75584-3-jiahao.kernel@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 11 May 2026 12:49:37 -0700
X-Gm-Features: AVHnY4I9GBoH8u6REGeCnHXPx0lUVTypdoFFrsJzoLRc-jRCyv8oiTQYgsYV84I
Message-ID: <CAKEwX=PLFRkfUvZyaYfwBv0QJ-8KAktvZvGA02Hod04H-RsS-Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] mm/zswap: Implement proactive writeback
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, yosry@kernel.org, mkoutny@suse.com, 
	chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 3:52=E2=80=AFAM Hao Jia <jiahao.kernel@gmail.com> w=
rote:
>
> From: Hao Jia <jiahao1@lixiang.com>
>
> Zswap currently writes back pages to backing swap devices reactively,
> triggered either by memory pressure via the shrinker or by the pool
> reaching its size limit. This reactive approach offers no precise
> control over when writeback happens, which can disturb latency-sensitive
> workloads, and it cannot direct writeback at a specific memory cgroup.
> However, there are scenarios where users might want to proactively
> write back cold pages from zswap to the backing swap device, for
> example, to free up memory for other applications or to prepare for
> upcoming memory-intensive workloads.
>
> Therefore, implement a proactive writeback mechanism for zswap by
> adding a new cgroup interface file memory.zswap.proactive_writeback
> within the memory controller.


We already have memory.reclaim, no? Would that not work to create
headroom generally for your use case? Is there a reason why we are
treating zswap memory as special here?
