Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089E71D319B
	for <linux-doc@vger.kernel.org>; Wed, 23 Oct 2024 17:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729704312; cv=none; b=OY8sjGvdWDYmCbffMnrG5wSo+bBeOBopffBa/zEtwc9jG+PcF2LaWz3VlIr1GbopXfRw1cl55A43/Xj5RhU6MsFRNjOX7qhRcM29wF2LTDOkt3b0B66KMUldOC84aI4Yilaza2PO/ndsOnQCnMLn4lbTVdbK2Dtw9Hpoh5cv7oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729704312; c=relaxed/simple;
	bh=6gR1I1LvwAMsteYigGWYyjEEUkOdE5Bt/RXXDASsatk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dPowe+Rd3icikc2tYnekUzfYoz+2gMS9H1XmaQz1DecQ5+1b/YQhYQELBbqydhF63DabyiudsyN2BU0YPUpBdUoPqP7Z2zKiKtkfSOn2d/QaVJQHBdsLjX0TlOOwXuNGEWM9eM2BTC9UjRqFTji83ooh72Q7TqfNT6SzUjYvpFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=D9qdrumr; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="D9qdrumr"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5ebc5b4190eso1762578eaf.3
        for <linux-doc@vger.kernel.org>; Wed, 23 Oct 2024 10:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1729704310; x=1730309110; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zM/akXkdjXuT6ZqXjE8A6PnOFDaDeCP+im+ym1kT218=;
        b=D9qdrumrjypGHIRkdXDAXGf3hyOB/NC3DGA2k/EOwBc0rFWulKjfT9LMfU/9rMDhHG
         lC0u8VZOCxN+gJZqjW9zMNEPihtwAhYDUffnRlxN5y7bsJA0ObZPzkwVO+yafbqlA/z2
         pfBkfDG87lPajf0FztIqLYvvc9nGtVgDnVclScUC/TdbmTj2dLhQa9g07us/Z9ZNgDzU
         O3xe/WVz4EAC1SCWWOMTIL/gPMjY9Us1ubmdFPh2pFFU25wfmUS8fj507t6dE18lVCbr
         e1XBOB5utt2MNVXu7q85kC6kjVYr4VGAzLi2JvcNn5YEfwwj08W6has66P1On5phN5PV
         h5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729704310; x=1730309110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zM/akXkdjXuT6ZqXjE8A6PnOFDaDeCP+im+ym1kT218=;
        b=BdtcvpaKgzEiK+0Rj80eWXDrd0MoXBy47atDFWbXB86gTLaerw6V54BhQf1OML5qdw
         PAWC6USNmfYUG4glbNocj1DQ5DkJEprXOM4pIAuJNpaXl8SGJnKAwyNdW5u1J21sLA+e
         x7cN0bS3ZxYH03wHj60DkgWYzAC76YqQFre0KiMOVRRezFkLp+TP4CLIwFtxBsm00TbO
         ScOOuzZkbKC+n/lUaC696Ogiw8RvaHj/JYjdxQ8YXYpTVvXA5ofVlbyTRpA6RgtJx5TD
         29Sn7hhxCOISedmAT2kGmE8GtYCQo/qHs9xW5ONK77xHWCYF/kkP0ag7h0sT//dvwmIr
         bxOA==
X-Forwarded-Encrypted: i=1; AJvYcCVKBN50guc20D2PXHWcx5LyF0hoRKmAxLtswoMHubzzdZZhvpTNeQoRYFiINX5h6/E1uP56qTjO5R4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKWhUIn//6cGDotfMOYAgJtsg2qFrcHxNZVirHwLrKl6XQyGLZ
	r+Dr3JeA8f6PDXJW4Ns6ZM4b0aNt2fH1JwzrrC8tdydbGBhlvYvG0TansezPsOjbokHqw0firBm
	IbY1s1PfWzzHLY58/IyT8edSV+6rxvitsUy5+Hg==
X-Google-Smtp-Source: AGHT+IHOKeQDqmSvBrYDnsglKy26BaaQQbUE678ST1VqdV3bPBQaK7JOsMSHrB6pAmfeSP2FMHTadEDapACxrqo90YQ=
X-Received: by 2002:a05:6358:7301:b0:1b5:a38c:11d1 with SMTP id
 e5c5f4694b2df-1c3d81b1c55mr235501155d.26.1729704309824; Wed, 23 Oct 2024
 10:25:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023170759.999909-1-surenb@google.com> <20241023170759.999909-2-surenb@google.com>
In-Reply-To: <20241023170759.999909-2-surenb@google.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 23 Oct 2024 13:24:31 -0400
Message-ID: <CA+CK2bDgfmwwNReGeCj18aYT-DUabYXugDdBAwQ3d02cCT7S+g@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] maple_tree: add mas_for_each_rev() helper
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, corbet@lwn.net, 
	arnd@arndb.de, mcgrof@kernel.org, rppt@kernel.org, paulmck@kernel.org, 
	thuth@redhat.com, tglx@linutronix.de, bp@alien8.de, 
	xiongwei.song@windriver.com, ardb@kernel.org, david@redhat.com, 
	vbabka@suse.cz, mhocko@suse.com, hannes@cmpxchg.org, roman.gushchin@linux.dev, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	souravpanda@google.com, keescook@chromium.org, dennis@kernel.org, 
	jhubbard@nvidia.com, urezki@gmail.com, hch@infradead.org, petr.pavlu@suse.com, 
	samitolvanen@google.com, da.gomez@samsung.com, yuzhao@google.com, 
	vvvvvv@google.com, rostedt@goodmis.org, iamjoonsoo.kim@lge.com, 
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	maple-tree@lists.infradead.org, linux-modules@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 1:08=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> Add mas_for_each_rev() function to iterate maple tree nodes in reverse
> order.
>
> Suggested-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Reviewed-by: Liam R. Howlett <Liam.Howlett@Oracle.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

> ---
>  include/linux/maple_tree.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
> index 61c236850ca8..cbbcd18d4186 100644
> --- a/include/linux/maple_tree.h
> +++ b/include/linux/maple_tree.h
> @@ -592,6 +592,20 @@ static __always_inline void mas_reset(struct ma_stat=
e *mas)
>  #define mas_for_each(__mas, __entry, __max) \
>         while (((__entry) =3D mas_find((__mas), (__max))) !=3D NULL)
>
> +/**
> + * mas_for_each_rev() - Iterate over a range of the maple tree in revers=
e order.
> + * @__mas: Maple Tree operation state (maple_state)
> + * @__entry: Entry retrieved from the tree
> + * @__min: minimum index to retrieve from the tree
> + *
> + * When returned, mas->index and mas->last will hold the entire range fo=
r the
> + * entry.
> + *
> + * Note: may return the zero entry.
> + */
> +#define mas_for_each_rev(__mas, __entry, __min) \
> +       while (((__entry) =3D mas_find_rev((__mas), (__min))) !=3D NULL)
> +
>  #ifdef CONFIG_DEBUG_MAPLE_TREE
>  enum mt_dump_format {
>         mt_dump_dec,
> --
> 2.47.0.105.g07ac214952-goog
>
