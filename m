Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A148309DDF
	for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 20:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781641483; cv=pass; b=Kra3G73QdDCGfWfcgnbQkVLe9PUlGnuPT5V1beYWaBEA+LW4bi+nWUcaQalfFTGJX+4BmItxk5SEpeZhbV6Wfy0vPUh0PA6FncdqKL/9rT05Bp18dk6M+PWWXB+6TQU1thN5L0AXMEIpZDy7OP0fDd8onSfdEFbzfz75tLLCPHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781641483; c=relaxed/simple;
	bh=BOzw3QtUmoBO3cAElRCyupjJm7YaXn8FH12Din3toF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J7zGj+5HEkCmDCV1baRXSGIaDwysfTXz2Zk27T9/ZT26xipOO960isIsZFBPoNnQVIY87SVK7rmSbVrGhkrbqhH9vM8PVPb9Y9FKc0GORvwpjNhzq78EufEJMtWepZxqWbic4y93JGV9haUkFIx9mJixrKyKeIeUf+ZGl4LAZ88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dmdyw1Sg; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dmdyw1Sg"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-461a5a39da1so849959f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 13:24:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781641480; cv=none;
        d=google.com; s=arc-20240605;
        b=UnSNWBDrVmC3jC0V4yqFPFh+1HADEiikN2V/Ac/HB2vpYkH9r0HtXmQeBPsIsSySWD
         uZG0ETtvY5Ec3KhZXcHRS0KJ3PBiS9MuB/MOTY+6JWyOiJajugWwV6Fb0q4K8lqRQjrc
         y8fVgrO4v0Pq0sQa8To/tA2lpBlnzjnc/rDy2s/nc8qrJoI7jKGWuqf9WPeZ+OP2W7ij
         sG5YPF963LFo7qR7n+0SDuP5/qyCPGO6KdEwFk6r5Y2U/Yr/XSUhi7FKigHGUhuk/eMi
         qExyEt2oHqiKw9MJ/6OEek7siiBgCqdvVK1/oh/keHeATsP8LaMuUWiAodgEnpVwzAET
         dNTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BOzw3QtUmoBO3cAElRCyupjJm7YaXn8FH12Din3toF0=;
        fh=qbeFzPBsE5I4PbTXpzixisJ2QHqtP3NDCssinJmV2Zk=;
        b=WUpUkoFTyTIZuAdh6ML3y40O7c7bEG5HitmKUEmSluVkXaHs2muiXQJ7yf5OiMfA03
         /UTS+gnUwNvSO5QuW545kx2wwsvTnVl69OjyrlAv3CT1mFuF2iD+K0qx5P7qNJBjLdNM
         gTs3b6gsfqItt3xkpl+FgiBBIpoIKDSNCh7bA5yWWgfr2qMZLoFduwZ0pw8KAIKpXmeG
         TphIQGfvDk5HFfmrSEhjznC47HbtvH2hCbz4kSqNbtK4sHhrhX6Ta8EV4d386wDrh255
         1CT0mSiJ/eHqRdW9Zdj/joNgqoNJLDGnx5a7KdD30sylJxFl6whHqOFNrMxBPXsLWYBT
         jfqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781641480; x=1782246280; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOzw3QtUmoBO3cAElRCyupjJm7YaXn8FH12Din3toF0=;
        b=Dmdyw1SgeDhHgigwLT2neDoz8uYpuhmEgWosnioJUDQRTNzcsd7puhZaXXul/3Zvfj
         7rdj31gyGAMiXyy0k8GF7U6dpDm0kqMVCVMDGgVzjT/I9izDfuE9TO00+MCekOqthITL
         rFM5hlomizEHUiAHPgL44rduBRW8vUcHPUmkGUBIuG3hc/qQN/UpqBbU25L/ChdTorUv
         bvxqrmFBGdikQGEmDQYrHjTosBlKOSLFzYpvjsB/GeLrjE8IP0mJlkr/o7hVTtJhpvN2
         LJ4AMlhyqExsBhPcWAZ27hOljeM94aKQyaBcnDqcEzufY3iJpucz6htltj/FOANwgim7
         e9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781641480; x=1782246280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BOzw3QtUmoBO3cAElRCyupjJm7YaXn8FH12Din3toF0=;
        b=qv3oFJslM1fqDKV+d6O6MnXLa+RgKTdKiUgxW+VhUSPRqq2nk9qttWaFNQX0Wm+S6Z
         3zjfT3t0DOfdWsO5pxKjtuwjm8T4TVkeN+VzLirPPHFjq36T2FM6ptf5Aw/7AETw/5+z
         Km+2drobobULYXYYM8UQbr7W9q/VaELTmWXUaSRR0MQBPsgkMjqXOn85Bu7GAhWEYAdb
         VFsI8RrXfEaaruJfRBP7QluCXtfhMBqqZmR3Tms64tYK2nwnGvXG1PpmNd8x8Uodifjf
         Dk05WlhhMTjPng7vbpttsbna9O36lAxPvpwL4x1Tk+MrXodl6UPT3dEhJw75z5C0wTtE
         HGBQ==
X-Forwarded-Encrypted: i=1; AFNElJ/SFxRdi8lNTDAMJlKdTuN9e/0ii4NPBeH1pkUJnv3r7/sgeSChYIEfojp1XPLRqeZNlAwVOSYu1ig=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUHZPbXWWMyfpN57IVgUUA0mgCpboO/40XZEsVLx5NStixSvia
	ad/WZ+Kly5FEvQ3jdmskW9q5t6Sib/Z6to0SPPlyO0KO3u9k+6ovTC4ZNABUoaEKY+1GHKWWR1O
	NGtNv0U63lJIBwW1H9fuHTOI0ueKswlw=
X-Gm-Gg: Acq92OE5XwRY1QnC3/f21aTBo1prm6MseD/Yoo+lKj1rRXkRFmzP9phnIRmkAZL8yf+
	gRo/qvG2sI/V80wTKPLm4JOidSg3h72ZZe+3TItRKS3hyINtG2lLVveCbSFPTD8Y7bHRHfFzpC0
	4+8AgHFEdHqzejkzSwmOfoLkii5siRRhrVGhIQ1IvXrbKc5u2pgD8bhpcF5Yl39SYpvUvVCjrE/
	oOw3S0/tMkc2bzelA6CSz8GiRCsoxJarzoI39KRxglOw8H4baeZbRUfDrHEptQxKfBmCtiVlqu3
	U2Izu3WTVQrVVyluBHT4WFMN9NKMNpY6oYbb7ocQJITStAO22jRSjC8=
X-Received: by 2002:a5d:63c5:0:b0:460:67e0:563c with SMTP id
 ffacd0b85a97d-46238f9813dmr1112278f8f.38.1781641480296; Tue, 16 Jun 2026
 13:24:40 -0700 (PDT)
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
 <CAKEwX=N=Umi94wdKcLxEWOqUwhz6=Lj909pc1Pr_5ivVnZmdPQ@mail.gmail.com> <CAO9r8zMHGFG_jcVeDPgowaQ2RNntp3KankwzQdgrJb9PrWu8_w@mail.gmail.com>
In-Reply-To: <CAO9r8zMHGFG_jcVeDPgowaQ2RNntp3KankwzQdgrJb9PrWu8_w@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 16 Jun 2026 16:24:28 -0400
X-Gm-Features: AVVi8CdzFDN-vHGmMQaFueNywR5at5r2sQirZ_jaY4lUl8gv53voplk3KBJ-6kg
Message-ID: <CAKEwX=NyfxfXhHESTLyirAgdVA6QaYAcam792-vSZdmo0Pz+bA@mail.gmail.com>
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

On Tue, Jun 16, 2026 at 4:10=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Tue, Jun 16, 2026 at 1:09=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wro=
te:
> >
> > On Tue, Jun 16, 2026 at 3:54=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> =
wrote:
> > >
> > > On Tue, Jun 16, 2026 at 11:33=E2=80=AFAM Nhat Pham <nphamcs@gmail.com=
> wrote:
> > > >
> > > > TBH, without vswap, we should not allow setting zswap as its own ti=
er.
> > > > It's meaningless. Maybe makes it a no-op, and warn users what they'=
re
> > > > setting is gibberish?
> > >
> > > Why? vswap is transparent to the user. Why can't zswap be its own tie=
r?
> >
> > Without vswap, if you set zswap as its own tier, which phys swap
> > device should we allocate from for the backing slot? :)
>
> Today we just allocate a swap slot in a swapfile during reclaim,
> before swapout, and zswap will just writeback to that one. I assume
> the same will work with swap tiering, except that maybe the way that
> swap slot will respect the allowed swap tiers?

Yep! So if we set zswap as the only tier, then it wouldn't be able to
allocate a swap slot in swapfile right?

Or are you suggesting that if we set zswap as the only tier then we
can allocate from any swapfile (since we're not doing any IO anyway)?
