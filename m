Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2265F4ADD97
	for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 17:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781716329; cv=pass; b=Hvx+11jh68QksJYeXETJbA9d8Q3ibsqvvxOKnvAyCVF6LzvfuqshBZpKIaBp50toL4v70EhE14JVcdiu8rmQrZY2yQ6iZN7G65DEho4sMoLjjzon8cae0NS8XwKatGQtkxNwiwRGDxJdCerlixbWHeMadkQ8NN6vhc14o66T0Ec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781716329; c=relaxed/simple;
	bh=hBgVYCVjdYfk0aVRhelrtdNC3fQCPGI1gI+8jkOtitE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n2Uss0lVZvgg5Ay6pTW9BgwxTNFZpeG31JNjELuzRh+c8QV5CG/2mbgLygXcAFNcQtniB325fos4kR42R8CES9qZ/zAhPyhaQfvztHGv0VP2IEiNzvbJI5RBQFZQZ82GH10gLWtB4h80v4aeM4Vu4IZU6N9nwVoo+c4lcvgYO+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TctmaP0+; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TctmaP0+"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-46066e640easo39257f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 10:12:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781716325; cv=none;
        d=google.com; s=arc-20240605;
        b=lIRmZP0neV4EYZBDjlM/zoN+onkCiY+K4j4FuTrVEwSsikWgUrqutZNyeAyuvIsRUW
         ptkW2R2CUsn8g3EFWSOwHO5rd49zKgcIbzIfdNxn49KSbHH34iYWceuQ2GvALww0d2xt
         0YoVN9SECvkUMXKWiYFeDOvdyAQbtUeYfOXAHLsZi1JblEeiD209QnwowiDOAdfjLL7F
         rVR8Xco9grcTBbW3pitMqA/0dM7VYOigclyrPEmhvWxA5lfQuJxk4hWf+rWutuuh3ZkZ
         jRkr026mOpLy3FtZzzFHkT8qWtF/5hSizX0DJC/Kl12T5vuBXHcVexuNNv//9B5rOM0j
         bYrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hBgVYCVjdYfk0aVRhelrtdNC3fQCPGI1gI+8jkOtitE=;
        fh=1CH5KX75D6DKZAsFUoMwVfX3Wf9uIrFkJR+sG9wH0Gg=;
        b=ke+xrf3D7AgxShTb9YHVjAtREm9RDLmYgrSBrc3vnwn3fB1AtXDWLlDQcqMbEj9QAk
         6iLzgrO6hSPJCV2a5mXSBg6UCEALICJPt45Vhc2lxzrOdf0VcomT1XIbZl7sbdE0mClK
         rUg2LoxorZ7uplfdIE6hHIKZGSHwjYlrd8etlYd2n/4UvRXjl69sO209h0zsNVXSYAkD
         NOgqO3ElqDbRxx8icKeNN+kroysrpr6255yXNMUtRoYi9K5+kfG+rGGp/t8mnZvMcvKL
         55GAVZHod+qKLIS5YetXRWpzzlDcFQLaWu0750vZnz6pDCzV5gSZ68VvFzB4+b6wpKLT
         MZhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781716325; x=1782321125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBgVYCVjdYfk0aVRhelrtdNC3fQCPGI1gI+8jkOtitE=;
        b=TctmaP0+SsJf0Xp1fUQjka3BEJIPQAylgzC5xdczSKk++iaF2Pvk4mvoWljYyp7kGJ
         SduW5KQTXoxel89k+PAoDHIo9pqhTWSqlqf26I7dpu8Zjt3Wxy0dbmwhCh2gZPLOd+Vv
         HDrFJ7wUHGsKBEhm1LinXztnnfUZLqIYi5632wJ0NH3QWt4oXpmFl04oSIc2Fu67OJCO
         ibrjdebAcxpAE1uypDAzB36b8auhJQufdBcVOakDidu0PJA4hrLEN/A7cUGcPwqite8m
         Bh2TiglzJyLHpPNaaewdND8jV57CrVt9g+5miL0VI1ZbCiSplNnljsjc1MBsOMO1WNsB
         D2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781716325; x=1782321125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hBgVYCVjdYfk0aVRhelrtdNC3fQCPGI1gI+8jkOtitE=;
        b=YxV/UucJuOqXDAXioIUk2lfQuvCMJYCH5FRYbYQ8ZQni3DrWUW/+16a2LJXxSa5756
         4Kck5MRl2m2rF3uDD4Qae9L8jEYxoZyUUNoYjdxgYJCSor2P29MVdyo9OY45olQP7q16
         D7u3+aO0ujHKeQDkUyV9b6fsg5K/ZPTi+Zd5ocPGmrA3CUTYoTe91cY9gbCRTNXp1Cm7
         ZYp6HWEoeQYPUyh5d3hZujMqViwladmyf8ttHVcbeeQkoSOcexeF++8P/A9LvteTbA7R
         6UQYt47eu4xjlUhSrX+RZnJ8d4ak7M0U/O0FNSsIYqVDgsH7qkBAdse9leFPKDHdQ3AY
         rNQw==
X-Forwarded-Encrypted: i=1; AFNElJ8mQlYFRNbXplIQU5D8c2Rwwod/m+i5SOL9xxnfuIxDdd1Z1Ywddg5M1/qTIqcwizJrfAtRn54gbi0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF1onUkt/EG5yIhrhHnYycy025ckvCzuGZKfD9z0EBeSq3O+kc
	SmZrKhs87Wj9rE2h2pMGx/VnL9i6dhsjjotJ8aDrdi2Q+orses6LfAhwJzjuiJ6pnYfMBZmW0RS
	iMFacL1aWpOdCNOxIXmDsXreRQh1L7m8=
X-Gm-Gg: AfdE7cno3fQa2ZEPIBR/xAXjfz4ymBoAukUPK7VKe+QPACseMfyXLPtSfMXY6Jk7iiZ
	b8LQnNSIZ377AUgT14IIisgedr8D3zYqT3Gzy9XJlXMbK1nSUvlJNK82m/7RKWUlo39Dn5TO+BM
	peuF9/nEgi+CPmcPJuwZziflowrEMz26GZFEv3DnBbj9NOnSf6cFLOt8y6OGUvnOnMfh55UTtyr
	jICG1DsrAbtsk3/29Vn+HAObErh9CVcT8X32tB+2Hfx1TtgB3emfkI9VRwEuD7xqVfooWJatsJp
	0glrz1F+U4Te+eHBh0jfM1aB8KUAPWVcK8iW62R66Q==
X-Received: by 2002:a05:6000:238a:b0:45e:eaed:afd2 with SMTP id
 ffacd0b85a97d-46233069660mr8853144f8f.0.1781716325060; Wed, 17 Jun 2026
 10:12:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aictKA0XWMWbxFdN@linux.dev> <CAO9r8zPvCaCqvoUhPdAN5Oi_Sj0mK-t7DJhOOz3Xf1DT-Wrgcw@mail.gmail.com>
 <aieUQUBHI+E3uNPW@yjaykim-PowerEdge-T330> <airzE7jD9UtyR17J@google.com>
 <aisEWnb3pzmVC4dl@linux.dev> <aiu06fbV7rWqY0Bm@yjaykim-PowerEdge-T330>
 <aiw2p5ANjsQUCIHA@linux.dev> <ai5y923elCSZp41j@yjaykim-PowerEdge-T330>
 <CAO9r8zOVqbJEaBqTHw=r2bYw7Lm1tO0TU9QuG+eH1rfqcTAJJQ@mail.gmail.com>
 <ajCgzNIPLhjTRSXR@yjaykim-PowerEdge-T330> <ajC+FNpkVpI4pbBz@yjaykim-PowerEdge-T330>
 <CAO9r8zMimM8n54BL1viuX3pYzO=wzQU89LhCF1HW0bAv97ZQtg@mail.gmail.com>
 <CAKEwX=Nz9SWcEVQGQjHN8P8OANJY4BG0w+iQOzoNOWuteoVjAg@mail.gmail.com>
 <CAO9r8zOD7XaJ0Uo_LLLDTRKbeTOmAwmM3q8q6rUyH3oS-X3Csw@mail.gmail.com>
 <CAKEwX=N=Umi94wdKcLxEWOqUwhz6=Lj909pc1Pr_5ivVnZmdPQ@mail.gmail.com>
 <CAO9r8zMHGFG_jcVeDPgowaQ2RNntp3KankwzQdgrJb9PrWu8_w@mail.gmail.com>
 <CAKEwX=NyfxfXhHESTLyirAgdVA6QaYAcam792-vSZdmo0Pz+bA@mail.gmail.com> <CAO9r8zOg0OP1Ak1v7CRzSfQq0D8b4Dw+_T0Jui6YTM_KwQQNOA@mail.gmail.com>
In-Reply-To: <CAO9r8zOg0OP1Ak1v7CRzSfQq0D8b4Dw+_T0Jui6YTM_KwQQNOA@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 17 Jun 2026 13:11:51 -0400
X-Gm-Features: AVVi8Ce4F6qbwirh2XAnhjc2JRmFEEfVWsLJJms1CDA7q8x1ucZACpOoqMz3NrU
Message-ID: <CAKEwX=N_jcaGaPYsUvVi53+35mJhZe123a+6T2J-MsMQ+-cSGw@mail.gmail.com>
Subject: Re: [swap tier discussion] Re: [PATCH v3 2/4] mm/zswap: Implement
 proactive writeback
To: Yosry Ahmed <yosry@kernel.org>
Cc: YoungJun Park <youngjun.park@lge.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Hao Jia <jiahao.kernel@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, mhocko@kernel.org, 
	tj@kernel.org, mkoutny@suse.com, roman.gushchin@linux.dev, 
	akpm@linux-foundation.org, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>, chrisl@kernel.org, 
	kasong@tencent.com, baoquan.he@linux.dev, joshua.hahnjy@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 4:27=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Tue, Jun 16, 2026 at 1:24=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wro=
te:
>
> Ohh I thought you meant we shouldn't allow zswap to be a tier at all,
> not the *only* tier.
>
> > Or are you suggesting that if we set zswap as the only tier then we
> > can allocate from any swapfile (since we're not doing any IO anyway)?
>
> Hmm, technically having zswap as the only tier should be equivalent to
> disabling writeback, but you're right that if zswap is the only tier
> than the memcg is not allowed to use swap slots from any swapfile, so
> zswap cannot be used. Very good point :)

Yeah the coupling of swap/zswap makes reasoning about these kinds of
things so annoying. :)

If anything, with vswap, I'll stop having to explain to folks why they
have to provision on-disk swapfile when they only want to use
in-memory compressed swap, and that's a win in my book.

>
> In this case I think yes, we need vswap to be enabled to allow making
> zswap the only tier. That's one gap between zswap being the only tier
> and disabling zswap writeback, the former requires vswap while the
> latter doesn't.

Yup! Anyway, I think Youngjun sent out v8 - let's take a look.
