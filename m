Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A98B40D585
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 00:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782692469; cv=pass; b=s6R7IkinPrUa79wQf5y0wm/1Yb25ZgxN4Z5A2HqxKAGw7yDPFis2iIj7cNdTaAfVqmZTpquBEioCLF3gBxV4b32/haZZ6UdkPtm40pxo5sUnr5gVUXpFA+0bEqv/UY1kIqGv9aQW1PHJVZ1T1PjTujiLJWe+6cc/uyBOPSCxa8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782692469; c=relaxed/simple;
	bh=MAjsw9wN/y5bh3ZwZZoAige9waewsmeh9Wxi1wOO0sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R1HrjMdSQyDG2+Z+nsEUANbUYMT39g3HnUo41A4tNnJn1xpJoRhPs8q9RVStYpN+jXGaEhPAVBOlhf1uXlMDCfhTv6TpsE1rQn+IPlM0ShwWUwZlYsnBE44L5EM5/T+RcS/1p+Duv2WX6bRdRzGnnz2skusn5HmQa6Jr+pjCJXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rr/AgE0u; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rr/AgE0u"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aeab3465b9so1418413e87.3
        for <linux-doc@vger.kernel.org>; Sun, 28 Jun 2026 17:21:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782692466; cv=none;
        d=google.com; s=arc-20260327;
        b=kSuqEdE/CVIW3G/J8/BH38NFU5fyJKD2HAieOPoR1LIe748jPcxDxiNqqRBlRo7n95
         zo1Fmo1dVYl0QCZ6v7VupdxdAE9ipsGVamn2GnLLmgJbYqBgK31gf70NDepUqVRSIPCn
         wxFYh3UIi4R1pSburWDRrUY+E/KtZbVQhpbDUv6mKPZ8z7bfzsMpfqk4oG1HerkkPmVN
         sGkhwrfHtKskUso5GIvLqFbiMo3pstOR8PW7Li+NxJA2VHDy6uMs+b1J0zLznp+KNL6x
         fSoDSELeyeS9n7aKQ5YxlliwESfREksJ6mG256byQCrq0ihKnWK/A1PEl7b9de7NnJ27
         ydAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=neBR3VtamRz9x5zM02CGSvqqsQzuRKF0xxUw39lUWvM=;
        fh=ZCJu/NMMoBetEkiNBUoMvKVNOp6NfMNtLUjo840qpu4=;
        b=TMU6hJLNsd420FY9SXy7rUpvK1145Jxqr67ROKGyEUlrvOXj4B3kXZCYTxQwlzjRgn
         +/fjyGMLeKEGLuDA2DB8UrD/anMVpwNTIz31L//xTumpc7mOXnTgWdNKrFFdXEHc61pJ
         bKAURzqCC3TrOPAwlinZoCR2lBZL+ZUsBq5nB5cRDgL7TdONmt5TJ9AScmYA3EcT0bqi
         SpfBaLRM4SSIUeBSFDxDPuT5CeLopHj+kA8wx0owC24OH8rlGNhJPo/I0D0B7YpMx2kU
         TRi409mYP44aLKhLBMaME/cfRw4JIC1t32XZs256o7n+K7ReBWqOt5XJNZ59AwGOsccD
         38Rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782692466; x=1783297266; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=neBR3VtamRz9x5zM02CGSvqqsQzuRKF0xxUw39lUWvM=;
        b=rr/AgE0udp6V0HqoIZZkJCDmVnx4MJZPcwPQvuSMGy+VEMECXkoggJEDn8jtYcrB/R
         APV9u7+q+5ZbgH1u5jt/IeZmPqm1a1Sk/IZk9osRtH3z/GsUB4aQnBk3TroRR5Al/mSt
         1RlCo/7deYpdWgl86VUNDrnF6dyKL5ei0JD7l/0FbxpkLL3GGNhIeEEd+j46qNy/DLps
         7IiB1sP4M6uyeryXii8ITTXK29Dmilz7fQ79KbDUcp2qaZZ73i3cM38XJZFROTYGgVvv
         FvFrjtCfBhAW1NZGtaCDlbZ7jTxeEh7n4Eqy9WVcPM+jWbITsk6q1h5KCgLuigkDf3IS
         Ze1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782692466; x=1783297266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=neBR3VtamRz9x5zM02CGSvqqsQzuRKF0xxUw39lUWvM=;
        b=SaAvyWj7heMDx3h62L0A9qgkynBoXTRRE6ZkfGokbTdBRZuXJKR3G2rszMUACHYh2t
         OWnLHz3prggaC6mGxXejml9jsl5eCW2k5CbDQz6tSDpOkjRrydgTGm36DfNZQ8nnCxJd
         rQE+0RHix1Ffg6NTsBgdbxdD8VqmHRtwq8/iRbXqx2G6ZtqaN8si9tzC7JAeLf3pdH5F
         xejs+XqP1M3gH+AluNsjazws6CUdDTrngdlGeKvDv1vwh7WMnOtiW09ZJhrJDMatjFCF
         mYUh/B6lkaN8NFDXLsxf9IpYvB9lz9qrmf+Orc2aDKC+hMwOM5/AZl1Xse2hQEDp0fKH
         RU0w==
X-Forwarded-Encrypted: i=1; AHgh+Rq9Ouh3wGHC0ifN+D06VokuX8Un8xPHtH3pU1M/EcaMvaxZqcQpRXgBebhqZKIGYpzySVtqEFdfgdI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxglHnVSPX41dW++uJxGMwGQ611tEtCDMFLay5+vMJdB44xLYoj
	BoQ/bv73RWO3d3vp8iTZl/tPO+Njx91lpD7K5M75EUHVXsNj9w7f0YPpwGOJc4/3l4LEKuZuJwz
	TAj5JiXkTgrwXNy9r+WrBxWp4d1v+Gfo=
X-Gm-Gg: AfdE7ckKU4/Ko3kXoLALRV0s6b1CoBrPBuQaH6gIvBaF9QqNJZSTIYlXP9uq+BETxjo
	e74g4IjhEK8/kqQwTMhBWT/k48nUCK56+x98eu4d8ozkS79INxHMJhYIey9rXaIx5euCNIkZchA
	lwwRiAgoMxJM5UFaisNn+lOdv6v0aF6oWKWIYEpG5ANBCGqOtTU6oeBvrME/W4M1vl+DiJv9Ca/
	mmQYAdTWzj+7b0gBlLfRrLgV99ODmSl/QkJPRz0dGvUWWDEDjaeUNQ96oj3cdjpwO7Wc875sNZY
	ZCr46qXy1l/gxla23+L2mE3+Pw==
X-Received: by 2002:a05:6512:6407:b0:5ae:9c54:8037 with SMTP id
 2adb3069b0e04-5aea1f48d55mr3968120e87.17.1782692466242; Sun, 28 Jun 2026
 17:21:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603-ch-swap-series-plus-folio-lru-cleanup-v4-0-ce0219e100d9@gmail.com>
 <20260628140322.c3ce1a7428d6c6d021069e7d@linux-foundation.org>
In-Reply-To: <20260628140322.c3ce1a7428d6c6d021069e7d@linux-foundation.org>
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Mon, 29 Jun 2026 08:20:49 +0800
X-Gm-Features: AVVi8Cd4GbRDyyHZTqC0TU_IFKD2RqlTPO7y-VMam-g57uC7NkQtHOh0OQDnYh4
Message-ID: <CAJxJ_jhp4i+hVtdrmGHffn6XyYaS8-uwbFNYS-MMEZbwq3CXjA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] mm: clean up folio LRU and swap declarations
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 5:03=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Wed, 03 Jun 2026 21:05:31 +0800 Jianyue Wu <wujianyue000@gmail.com> wr=
ote:
>
> > The previous version moved the folio LRU helpers out of mm/swap.c in
> > one step. Based on review feedback from Johannes, Baoquan and Barry,
> > split the cleanup into smaller steps:
> >
> >   - move the page-cluster sysctl next to swap readahead in mm/swap_stat=
e.c
> >   - rename mm/swap.c to mm/folio_lru.c after the swap-specific bits mov=
e out
> >   - move MM-internal reclaim declarations out of include/linux/swap.h
> >
> > After this series, swap cache and swap-in readahead stay in mm/swap_sta=
te.c,
> > folio LRU helpers live in mm/folio_lru.c, and MM-internal reclaim/worki=
ngset
> > declarations move from include/linux/swap.h to mm/internal.h (public LR=
U
> > helpers used outside mm/ remain in swap.h).
> >
> > The first patch handles the swap-specific page-cluster state before the
> > file rename, so the rename commit only carries folio LRU code. The last
> > patch keeps the LRU helpers used outside mm/ in include/linux/swap.h an=
d
> > moves the internal reclaim/workingset declarations to mm/internal.h.
> >
> > This series is based on Christoph Hellwig's swap_ops series, which
> > moves swap I/O dispatch behind swap_ops and leaves mm/swap.c with less
> > swap-specific state. That makes the folio LRU cleanup more natural to
> > split out on top.
>
> Patchset looks good and is well-reviewed (thanks, all).
>
> But it's a little old and Sashiko was unable to apply it and I'm seeing
> at least one (probably trivial) reject.
>
> So please can you refresh, retest, gather the ack/review tags and
> resend?
>
> Thanks.

Hello Andrew,

Thanks indeed, I'll do it and resend:)

Best regards,
Jianyue
