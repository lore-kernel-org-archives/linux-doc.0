Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DDF19DF62
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 00:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780963335; cv=pass; b=fnZvNN+ZhWtxgbZ4sfkRrtvpmpxWrOp7e+T/H7EpFsibCoHcnhs22Bv7NlYlvCTPQRjPXExvVX1+2g1UimYFWhyY5OVmpPUdgYqasa2HnzM1XZn8kKmDGHlnN0GigAAozl3hP+1MnnOjf7XyeaUAug49fLl1Dwr1BdCPySPWgf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780963335; c=relaxed/simple;
	bh=NqpPJNP/KpBfIOBbvIlGj2PJTmNLspZI+svQCTT3p7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W+NdwHaNTpmbR8atcnI/an3tdmq0uA4NDDKeJi9yCucdjH8g2oYulccKnSFIXQHjK+9Pp/CidATb1Z/Su1FxDKcrURnPLCdYXbvoim9qj48SdAi3zQr1m5efcA3tGifi0q7Xg12PpDq2q0Jqhdcp1fm4beQOAuGGodPFJ+66+0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GHf91dd0; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GHf91dd0"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2bf2d865383so379355ad.1
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 17:02:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780963333; cv=none;
        d=google.com; s=arc-20240605;
        b=NdMufx+Fwxwu8ZKxvD/kP6GDmW1pN8LSpGblwP7Wl2k2OjbgKADEtBhIJXyHKdMhQL
         r5WlasYznvp8bsAH764DgGT3kIuLuKOkwTshitPAwoXESmHbfY6myVLeyQNHOupueAgS
         A5RNMA+UN9viCC1zrGqw8gGsrIF765IhbOySJHOmVTHQD99/BspEtbkIrBpPRV5y+7O+
         ztlaFZ/NCh6SKeF1D+dcYqzVBWni666KckgQ0NRlbyzm9T7kmiG5C+NfYrwsmNeCrauX
         CWToPmYNXNNvPvGarJNJaHQql8RZPCLOmGbW9dWkfKtuOlKI4YHYvD6q/wCFFCaTpPrl
         4fYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P6jO2zMiYZmPq/b4X5RcKjPTxPt+Kc/3uxUKCr70yH0=;
        fh=w9fddEvAeTxlcXwmngiiPU7CGtXW4tgZDIFoS/BeNtE=;
        b=iWTvE623NY1ESAP/ZKDur9lulpQjvZo7w+WScQaJlZNtfwq58og3Nea9LTJRXKI0Ev
         MSEM8fmxsbOZ+ByImmipYKLRivroDLGp5IrMoFhhDvOsy0xSKB12hzuEK3Ycp/RZTW7t
         YKIALtRGz+6+fNpQ9X/DxdtzyWPjlAqDmYmDmx9i1bFFWA7+9qAjOBbvmhgYLU/DOLo/
         Es5nYekBemcbjYVXGWDu0poQK/K02GOV2v3wOWkXDzYMiWIYMrQ6c7NpNfozi6FFE3kx
         WMscNck4vxy9USGqlBsYOmwoXz/jH/rOVVGiBj7PdwkfAhJDiCPQbDhaStE5t/lZZrIM
         U3gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780963333; x=1781568133; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6jO2zMiYZmPq/b4X5RcKjPTxPt+Kc/3uxUKCr70yH0=;
        b=GHf91dd0NdL4pOYSRfn7x6+7cWuANjEYrPeB6pQQg5/9Bkzx1bqgxbl7RCI4wBk/bw
         rYgxODajD78abtadAZWjk0YVC1wCtg5VLh8IoEfQ/pNJrNWqcsA2SGsqfGV73Y9NSvx+
         ksayw3gel+FYgpSj5lsKmc+Ib1emhNWh0QZHdGHTgw/p6wVfqCFxUqW4oXizsIrvyjcK
         iN0mhasbNhTzGxXetIBzYXtPiIPBEKb0mvcBb9198c2wjZbPluV78r528u5h6vnvVQOu
         cEA4ex7/IsKVRgw9+u+2PiKCEogSvfxJ1xX1V9ay9CJTeKmbDS6sOHUXG6LqwE0kzCw8
         C45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780963333; x=1781568133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P6jO2zMiYZmPq/b4X5RcKjPTxPt+Kc/3uxUKCr70yH0=;
        b=DKZO5zTjb6gWZFG0f0rfRwPywMzFzHU5bwM/fWAtZc4Nd2g4COJbmNBTx7QpWU0TcF
         /11Ad8rDOEOSg/yG28keVzy/8dmjTup2mMacvwrF1lTwtV6NGg2exdY/NJAYjvldbWRV
         lPaCCAVlv2J7dr99syFH7bBSkvdL07OSr122j7jbl5uhkAeUuAY410Ge9bc+fzy79WrL
         FnN4W9gtAF7hAK5DCAvOTgP1xqybFSnedIj1wWbk1GMwBahfEaZgmMYUxEAwNrgzahTB
         xkda4x6Y30xBQymxsEtTnZmx9ft85WvkwjjCbRXPUV59FlPsX1GBhcAq5+H24m4TeuaJ
         9A4g==
X-Forwarded-Encrypted: i=1; AFNElJ+26NiiFdw2k9WkoiGcNHijOUoshZXAMm+ttOX88My8LG6weFH/M8lpw5QOkvE6zUgbSpVV6KthU1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBycJ/d5MAlwAsWwU36LepR8zFZR4L70rqv3FW6Jrw0ljfOJ/G
	1xmSIE0XBRU675DFB/1wBlx8JsWeHiTGSC8I5E+Q5OXKxALLto5QxKGV6oKiuIBQb6pVO69ohRK
	xBcxcNAa2OLzYFHYT4tR0zQFPSxcQeexltcMEaa/r
X-Gm-Gg: Acq92OH4ezdD0jI50xS35nX6XfU0GlBZrJ/8aQR3jmgqbIUBBu0OrJpp6jzMjsLf0Tv
	di4oBJJBhKWmWMBy5DonkcHXvptnfpVV8WINW/yc8zQWshV37s7Fe3UOjPcTy6e4x3H9EHSAbSm
	CC4Oz6kMap9HeV2gzh5SgQjZq9d+uIss+0vlJuHBXk34PP1S4Tb04BuQMAIk+mT09bgTzFsqd2/
	u3LT+5fgiJvzjgNVWCzRJiOf0qprNCmD1NfirLB0q+fCTPZ5Pz6AWtkEwODTsKfbxmRo9aX0dJI
	KTAWU+J0LfzemQKeuVmrfEZoec5BdtfUgbhagK1OYVZcxxaz
X-Received: by 2002:a17:902:f652:b0:2bf:1000:d3ac with SMTP id
 d9443c01a7336-2c1ebb60a69mr7515875ad.11.1780963332732; Mon, 08 Jun 2026
 17:02:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1780701922.git.abhishekbapat@google.com> <20260605170858.9ee9ca2181a041bb9a4c3098@linux-foundation.org>
In-Reply-To: <20260605170858.9ee9ca2181a041bb9a4c3098@linux-foundation.org>
From: Abhishek Bapat <abhishekbapat@google.com>
Date: Mon, 8 Jun 2026 17:02:01 -0700
X-Gm-Features: AVVi8CdAZnO7oMC5nuRHod0ve_zQgj1Rg5Mp6_fS9vI7HTlue0BbM9sWn_cAJH8
Message-ID: <CAL41Mv6pZOVacLdUGta7UnxmFryumBbN6=Po50KfzgLzMs2PQg@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] alloc_tag: introduce IOCTL-based filtering for MAP
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Hao Ge <hao.ge@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2026 at 5:09=E2=80=AFPM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Fri,  5 Jun 2026 23:36:45 +0000 Abhishek Bapat <abhishekbapat@google.c=
om> wrote:
>
> > Currently, memory allocation profiling data is primarily exposed throug=
h
> > /proc/allocinfo. While useful for manual inspection, this text-based
> > interface poses challenges for production monitoring and large-scale
> > analysis:
> >
> > 1. Userspace must parse large amounts of text to extract specific
> > fields.
> > 2. To find specific tags, userspace must read the entire dataset,
> > requiring many context switches and high data copying.
> > 3. The kernel currently aggregates per-CPU counters for every allocatio=
n
> > size, even those the user intends to filter out immediately.
> >
> > This series introduces a new IOCTL-based binary interface for allocinfo
> > that supports kernel-side filtering. By allowing the user to specify a
> > filter mask, we significantly reduce the work performed in-kernel and
> > the amount of data transferred to userspace.
>
> Thanks.  AI review found several things - you'll want to address at
> least the first few.
>
>         https://sashiko.dev/#/patchset/cover.1780701922.git.abhishekbapat=
@google.com

All, please note I missed attaching the reason for choosing the IOCTL
mechanism to this cover letter, but I will attach it to the v4
patchset cover letter along with other changes. Thanks!
