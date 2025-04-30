Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D427625B1E9
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 20:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746046347; cv=none; b=gLFh36+jkGHDc6UTpWs+YA7W9U+ToHk1clcQAmPrtcOqqQKv047UCTo59lmn7h+I9kzRMQUni4Yj5XgUFgVeNgAhKO/7umS1wwuSaZY21lM1464VHOfIgvPuW+YRm9yPTjrWGd38yq+X2oSwoVTlQffPW9dlsnrCfiFd0mdahlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746046347; c=relaxed/simple;
	bh=wvJwBMeNEG6L7qXV18iRAqNdKebQ0TFLRjuHZzWsT1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QgFkWn1CZZNKGLp6qgiD6ysJ99eS0RotXPLziflKFX549mJq03hrrHoCSG9g5/Czaa24zcOXie+rLYE+tr3r5SGdVTZw4eri5R45/jDFp/MilJBfA1dA5FG4/GeYNQm0VMkDITxJ597OEsJJWflDPx4bP7uGfLxn8y0nmoA/E4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aBv5s+cw; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aBv5s+cw"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso515a12.1
        for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 13:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746046343; x=1746651143; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23hiVYsmBQF9yQXvvKwFVuWz0LAimBGXKxbs767cKCA=;
        b=aBv5s+cw/XctSCZu6pwYFKwdU6d7P6yf6nVNz5g5QczjdtX69wvQHtF9mqbzFcyJtS
         sAJionMGrxXuGiZYhgLgqHF5dG8ueogcAz7LNbtLItJwLLUXAiwXpNEn0ZzL+rQqDgmm
         5ozMMKfuCGFxMeQxXOiLEEfdk/UvutTognVUiajVNO4khkskmuAN25svgnj/Zak6RXfx
         zOAHOJKdauZuDpUiS6XMaRux5HYUJ4xSsPJ58RzqNKJvonCadBg+xVXIimF51ptBqFYJ
         I+Xswz6xgLbfUZWHjBHBwcvwGaozX/Ncvw91qgm/4kY6PcwPlQiG6TmQJhZDk3A2Yq9U
         VOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746046343; x=1746651143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23hiVYsmBQF9yQXvvKwFVuWz0LAimBGXKxbs767cKCA=;
        b=cjkKmaufqIRemRYs3cRr9mdx0hcU/FF2gh5NGW3Xkz7hjdxA1N3PdWOUYlZ6atBO3+
         l8JvgpPefWEualSDee4AMpnzLrG2vwwNwpjporJhiq/MCRGgKJd2/WTnGsPln2Eu7T5x
         Cr4DbDD2VnAbCwOECxCFcBPtuaj9alyGt72Oita39b82ifsZtF0L/8ac5eTZ2hZjIUgx
         Xp7DrJF2k8Hv5oMJF9bZtG9SNkL5ojdisV6ycsYHpPYdDgow5poua5ZF6+QBCgUZ276O
         Zyjyq7dn8XBQZeGt6t6z9tU0+VElWUEl8kRd6OkBGetPO6M+7QUTTnqX9Z2nSQg4OrUL
         IuTg==
X-Forwarded-Encrypted: i=1; AJvYcCVS0KEKbly23y60VxJOCc9EMFX727R7YLeJYQOblre+OD5MueseS1QkjtS7d9S1KBcBFD8mcTO7+64=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE1G4+OdEPUB32LVp3XqLCFH54A9N+OzFW6GNHPw5FOGRjfoa5
	FTxYLY5T01CM2Uc3yXIcGEW5YMlPVsyqdxmIlsSL79aYHRLA7Z0iLC2z1YAX4tDIMackpn+hltE
	DBYtr3bRv/B6Tu9z9nGAvzC/OSiZXMPDTWIoW
X-Gm-Gg: ASbGncsoOMHCEqd1j4orQWA5yWC0fwx2EFsx3t+rJ/+WxbestX/dW3YuRtoWvdzFUGG
	d5zt8YOVQ/jNSIYrlbIwPE20AzS8aY41yefHvcitvmH62zTqrlcCnm2MZguonbNrIPsS0In88PP
	xzqGY01AVA/LXiazTMtSn9EBXO8E2hXc62AXE4MEZWdo5MSvmS4Uc=
X-Google-Smtp-Source: AGHT+IE2B3xe/+DPD2M7lWdvwY8uHQG2L+pnPzy2O9bW24VKqvrt3dxQEMF9lvotWS4qoTaaP5jcihl9aeV++lrP6Is=
X-Received: by 2002:a50:d783:0:b0:5e0:eaa6:a2b0 with SMTP id
 4fb4d7f45d1cf-5f918c2b650mr1378a12.5.1746046342783; Wed, 30 Apr 2025 13:52:22
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428181218.85925-1-npache@redhat.com> <20250428181218.85925-8-npache@redhat.com>
In-Reply-To: <20250428181218.85925-8-npache@redhat.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 30 Apr 2025 22:51:46 +0200
X-Gm-Features: ATxdqUHTpwiuUHFPjjOCSAtuFNVfWyscjbmOvS8EHiScAhewMiIQNRRDtNrYr8E
Message-ID: <CAG48ez2oge4xs1pSz_T9L46g=wQnFyC63kQKsXwbHGRWAxQ+aw@mail.gmail.com>
Subject: Re: [PATCH v5 07/12] khugepaged: add mTHP support
To: Nico Pache <npache@redhat.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, corbet@lwn.net, rostedt@goodmis.org, 
	mhiramat@kernel.org, mathieu.desnoyers@efficios.com, david@redhat.com, 
	baohua@kernel.org, baolin.wang@linux.alibaba.com, ryan.roberts@arm.com, 
	willy@infradead.org, peterx@redhat.com, ziy@nvidia.com, 
	wangkefeng.wang@huawei.com, usamaarif642@gmail.com, sunnanyong@huawei.com, 
	vishal.moola@gmail.com, thomas.hellstrom@linux.intel.com, 
	yang@os.amperecomputing.com, kirill.shutemov@linux.intel.com, 
	aarcange@redhat.com, raquini@redhat.com, dev.jain@arm.com, 
	anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de, 
	will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, 
	jglisse@google.com, surenb@google.com, zokeefe@google.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 8:12=E2=80=AFPM Nico Pache <npache@redhat.com> wrot=
e:
> Introduce the ability for khugepaged to collapse to different mTHP sizes.
> While scanning PMD ranges for potential collapse candidates, keep track
> of pages in KHUGEPAGED_MIN_MTHP_ORDER chunks via a bitmap. Each bit
> represents a utilized region of order KHUGEPAGED_MIN_MTHP_ORDER ptes. If
> mTHPs are enabled we remove the restriction of max_ptes_none during the
> scan phase so we dont bailout early and miss potential mTHP candidates.
>
> After the scan is complete we will perform binary recursion on the
> bitmap to determine which mTHP size would be most efficient to collapse
> to. max_ptes_none will be scaled by the attempted collapse order to
> determine how full a THP must be to be eligible.
>
> If a mTHP collapse is attempted, but contains swapped out, or shared
> pages, we dont perform the collapse.
[...]
> @@ -1208,11 +1211,12 @@ static int collapse_huge_page(struct mm_struct *m=
m, unsigned long address,
>         vma_start_write(vma);
>         anon_vma_lock_write(vma->anon_vma);
>
> -       mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, address,
> -                               address + HPAGE_PMD_SIZE);
> +       mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, _address=
,
> +                               _address + (PAGE_SIZE << order));
>         mmu_notifier_invalidate_range_start(&range);
>
>         pmd_ptl =3D pmd_lock(mm, pmd); /* probably unnecessary */
> +
>         /*
>          * This removes any huge TLB entry from the CPU so we won't allow
>          * huge and small TLB entries for the same virtual address to

It's not visible in this diff, but we're about to do a
pmdp_collapse_flush() here. pmdp_collapse_flush() tears down the
entire page table, meaning it tears down 2MiB of address space; and it
assumes that the entire page table exclusively corresponds to the
current VMA.

I think you'll need to ensure that the pmdp_collapse_flush() only
happens for full-size THP, and that mTHP only tears down individual
PTEs in the relevant range. (That code might get a bit messy, since
the existing THP code tears down PTEs in a detached page table, while
mTHP would have to do it in a still-attached page table.)
