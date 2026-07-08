Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764683AA504
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 00:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783472317; cv=pass; b=XNLMpFj1UuTo7hmLDGpARev4/eftRpriPTjOiXzknX5b4XMPzpwvMg2hXOKIddYNR4MtpODwRnURmqcetct2vb7TDehqhBkSL4+kK7okoYm5ZsQemxkVEv2Wk3NHSfANbxLOp5wTKvfdwvRqoZbmM6CtiBgQqYC5xPl6U+7aPFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783472317; c=relaxed/simple;
	bh=+hIl/HQXBYWcuegkAYkELIz7U+ycmd+AvKPaRLhmKXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sPQ7FsJbaMM7HU4VkzOxWb7lH/CpGITnJod1P0Rzuohbj/RFYN9sQDocju3FvjmpKADShEBC2urn/5W78XDhs0kUe1IuNEmcwM0SXQbS9BJGAzvhBRyCrZSd+Upl3OqitNcdi9aLHEXvZv1YEz5fEnbTIn9u0S4gVBr92DVepNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ch/7+41M; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ch/7+41M"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aebd77cbb4so99373e87.2
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 17:58:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783472315; cv=none;
        d=google.com; s=arc-20260327;
        b=auWoWi05JZDqahEAdWAuk4YZWzhg7mb6/mPHqdQJSiiM+qFyX/auhnsblgnwmjum6h
         TPbXi0bGTGz9VWtOCinfW8JSY6zVrcozQtiJ+veEpUb0nGEK7GNUEmpos15bLl966jqh
         235MQGCRuS5jQfWOlGkWT77CiNazdOWPUXOB+b55mSarvj0jY3dzAuTnTcWLrbBeJq2N
         mjxwFnNoDwW1pkUv6tefDbO5t7umxPjQx6hrVTvT2e88s6FnazRAsDWjvzo1jNisNY/r
         hAdUmJ6O9ggXJsCI4IL1Bqvjxr1DbPyLqIimH6vLV3Uln69dNo1zTTWHeG0s0eIW0jj2
         l4Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4ilqlfxB1qMrIlQQgTnVlWL8ZHvza4jm7iDlYLXPmfM=;
        fh=jsRksNhLz+YjHaYBW1BfMPEyd+16rIctGr4OIary+5M=;
        b=VFR6VdOZFZrcaizExFrq4dKF3KMlgww/Uy5eX7XGyHrGbiKbUUnMQyEvICl80t+OGS
         NdpiXByPsbIjscEr0zndZnplsmBb/GKBfa1OmA4ZlN4aliFtiYMs93W2I9IKXHGwld6n
         BSQN2+gMGjyQUBu34FKm/95tUMXNm7JyTpLv0WWVZ7teUi3JLmhk6PW/D57mg2/GUSG9
         cpPoaJyrkZnIBgC3zUg8TNjyuYAxIZMiR3YsjplzOzpUOyHKQFl8h+gXZ/WpzkGAb/sy
         K+BKsZtF2c25szKRl/uDyd+ZtzuFkOE3eQaA4BJNcnVn0q9fwzaL3zeigjZynOUN5ma3
         eJdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783472315; x=1784077115; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ilqlfxB1qMrIlQQgTnVlWL8ZHvza4jm7iDlYLXPmfM=;
        b=Ch/7+41M2iAVnpKEKXC5QC5Pt+3FZo/NXelkrRbibj611CTAlunU6Wd2cGvWKk1uop
         tQUsezRnKWDRsZ7j5Se/kZXDpykmF6p9nIhpdTP1UW1GDpYji09cRSqICnAtXEDYa56h
         gSRS20eGdjGm397LSb9jrQTfMvWtpC1n19Unhnq9YwWsbyoNObryhQtKX5hy9aSp6xcs
         Z/GG2LKlSKsZ58dxkpWFoWZj/rPCdprsv2OX8x69SOKE6JdLa/8DSuCdCbNfgJanvOue
         aX2CBWdioRRcQKEPShsTtq3C0cJer/PAas5vX06CEd9DPGBvP+fLA4ExUjU6soXNQe1S
         2sgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783472315; x=1784077115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4ilqlfxB1qMrIlQQgTnVlWL8ZHvza4jm7iDlYLXPmfM=;
        b=DVs2OaQPDyB76Eeyx/B0CzcJZAM1MB9VORdFiaC5AaEazrLTLBhBKqL8j20J9zGChQ
         jyLidPM4Hh5uzvWCrsR9RtInpD4P+8t1aVxeoL8Kmhh6TIGwFAo2bRj0O8gRjfh1+Qyy
         mI2rDpZJylzWBrO4I30bpKNYgrwbEA4p5nDiKuSeoPUBi25rTVOhro1OXWHzth+PJG/S
         Ybaa/ccJF8kC5BKG6Rxi2XBG0ATB52ZXumsNxMkmG6I9T6lU7bluBCu1R79yCgmQ2rw0
         tTfbDvnPE3AVsdSndQY2W7kdLnbzO/PWsD8ToSCguPzr7ma0GHd59u2ooiC5KjWgk+Jw
         HKnQ==
X-Forwarded-Encrypted: i=1; AHgh+RoKolYTjrZVBKHSzY511plvrElFsrZATEqklp4FptZO/zyS2VVECPCbfPcFp9FtL/PXINqINwQ9O5g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7aB9+Lm+MGdmZP3Jycnzyp1R8RheZysDzJ2LS1A4i6Fa0vNqa
	qe3vpPuWVo00XEgTa6CX2ehml3V6a//iHP0pu7SisoxqJqdFMWdDKs34jr2SqM+LnWYle2Mejgs
	ojTG6gjYrs9ZIZ87XbT9RtR1J1EL1kJQ=
X-Gm-Gg: AfdE7ckkbrDX6IAjM7yJQQ+B18f+JZg0rRZWPFo2RrOcr0BUOx/17nk3DCVoRtQEsNY
	6oxSh0KAWCFPSRFU8msvYdMG7T+j0QfSjvxjn8jmh52w7Lk3CQU/lVEIfSPCFVI9kc7AtdKcW7z
	IPYLhEUURfbsDbFdV6y+lDT5zFlIGT14RxStIb8bTGETSSQ2zXaoym4dt+TkAFq0LM4Om+wdUwd
	RnPKl/6tChYV6LTVh8yshDXMe9olSCjsZIQ/i+54tWWGWwqlLznVcYr7Jvql7lQViVxTVau13ia
	xBvQPIg8ZeR+rhOPQ5oyVy/IhA==
X-Received: by 2002:a05:6512:3e06:b0:5ae:b36c:81c7 with SMTP id
 2adb3069b0e04-5b01145e9a8mr71155e87.35.1783472314305; Tue, 07 Jul 2026
 17:58:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-ch-swap-series-plus-folio-lru-cleanup-v8-0-e816812698a8@gmail.com>
 <20260708-ch-swap-series-plus-folio-lru-cleanup-v8-1-e816812698a8@gmail.com> <ak0sOv4UN1ug9-cN@casper.infradead.org>
In-Reply-To: <ak0sOv4UN1ug9-cN@casper.infradead.org>
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Wed, 8 Jul 2026 08:58:23 +0800
X-Gm-Features: AVVi8Cc5Zmf35Lf-bssS054JLk4GyeUvRR4EIUvxF7JfQqBByqntSP6BB9Yr0BQ
Message-ID: <CAJxJ_jg3JtTFFcVPp0iYf+hF+k63d_spiMumLyovA_w5UuUQyg@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] mm/swap: colocate page-cluster sysctl with swap readahead
To: Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Baoquan He <baoquan.he@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 12:41=E2=80=AFAM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Wed, Jul 08, 2026 at 12:11:27AM +0800, Jianyue Wu wrote:
> > +++ b/mm/swap.h
> > @@ -336,6 +334,7 @@ static inline unsigned int folio_swap_flags(struct =
folio *folio)
> >
> >  #else /* CONFIG_SWAP */
> >  struct swap_iocb;
> > +
> >  static inline struct swap_cluster_info *swap_cluster_lock(
> >       struct swap_info_struct *si, pgoff_t offset, bool irq)
> >  {
>
> This change is not related; please drop it.
>
> > @@ -985,6 +990,38 @@ struct folio *swapin_readahead(swp_entry_t entry, =
gfp_t gfp_mask,
> >       return folio;
> >  }
> >
> > +static const struct ctl_table swap_readahead_sysctl_table[] =3D {
> > +     {
> > +             .procname       =3D "page-cluster",
> > +             .data           =3D &page_cluster,
> > +             .maxlen         =3D sizeof(int),
> > +             .mode           =3D 0644,
> > +             .proc_handler   =3D proc_dointvec_minmax,
> > +             .extra1         =3D SYSCTL_ZERO,
> > +             .extra2         =3D (void *)&page_cluster_max,
> > +     }
> > +};
> > +
> > +/**
> > + * swap_readahead_setup - defaults and sysctl for swap cache readahead=
 clustering
> > + */
>
> This comment:
>  - Does not need to be kernel-doc formatted as it is static
>  - Only contains information that is obvious (at least to me).
> I would drop it entirely.
>

Hello Matthew,

Ah, yes, sorry for that, both make sense. Thanks, I'll drop the
unrelated blank line and remove the redundant comment in
the next version.

Best regards,
Jianyue
