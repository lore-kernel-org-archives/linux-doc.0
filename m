Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A7132B13E
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 20:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781038073; cv=pass; b=IeC68jEd0RUjKo6oDktfqXB8txpCEe7DxVejeX3hh28syLqE2jEUWvfBgmL8Bs74XfK4PHfUv9TgvFxdeHOHCRFOnJp9myy1ubgMWtlhzzWqNjFoP9wLpWJ4xm+lQxNJI+8heTmdcSdK/AaADK9/mCEO+BH6SSP/FHQUko8NeaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781038073; c=relaxed/simple;
	bh=f7UUnPHBGyPpXeRtuM0UWFedRmkx78UfZwf6lLGhB5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eaNGVrsMTG9f/+ahv90MvBFkZrAX3ZJlFuGiNGQgnELAdv6onNL6vOJJWLFtAo0AT/GPLXrlbp7WKtZVE0JxzOdgbGTsx8pYaZkK187J8wv8QpFWfVQiQV/6Oa+95otF/geVHbONf//ZuMtsoyAYZmofJh7WrgNUgRZhyUF/We0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RiZpSOon; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RiZpSOon"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c0b1a48855so4905ad.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 13:47:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781038071; cv=none;
        d=google.com; s=arc-20240605;
        b=iU7R3P2IG/LLJu3cU/MknzSYjougAcMJIDQa+50cUwCk8tH8lwZnPkvU2BM+cb7SXk
         Wo/eed4mtPIoFOA47bjlOMre7OQF8qSZsHIzJaLqll7DMNIcjdIitw3xjRPLkGGqIvA4
         cbUcoD3VttG8sT/9EWFnqdZAdUxp5zqCYJ7EIngNcXIX/V54xc0+KIxhgUYrX5bf+EhN
         RmPrj+Y8/V92KYekxu2qJVGm4YR3MEfGwdL7/DkH2dKOSuRyW/wnUx8j7XZggHVoilzb
         vmj0TtF+aGw/G/306l1L8pG/2Ab5thaEjkeInyPAvYYw1d64A0WcUFzczXk8Kx/J+z3B
         dlZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DLifDYktAjdhZiUiPVsyyYLPRgElVQdMpzKrVQLAsNc=;
        fh=MhgskksGDmxpJi7Az+aK+utG5E94S+UsLFaUpIdHEZ8=;
        b=VjH7ZsIbuA5z/y+cBuvwYo40d9h4HKj9RQQjO3R81q7xTGzxyEoLUBaSOgNf4Ia/Rw
         mqRR8M6z1JQZr0bxf8psFXPT1IGkmKmX+PHA2Pr9cecP/VTTryfKeyqORx8qO157gP5l
         fql1+HgWYwvhTwozSEqY7av+mZKcyFKkSrkuL9G6RSl1ytK7isKRQRVBqkW8WNANmKdU
         Zk5fUiPCPVmMt2dPaJ7u8PYiTVm0kg1LBoqUr1nZsoHTzoeMH4LNlqyFMUUpTNW2rKRg
         9iq6lmgj6Aw1UZRoOKyUlGydiTiAK72TiS7j3evJupdiO3ku7qDc7G2YDIci3OUIS9hG
         BhJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781038071; x=1781642871; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DLifDYktAjdhZiUiPVsyyYLPRgElVQdMpzKrVQLAsNc=;
        b=RiZpSOonrAYO7QBMKZ+8nPZqa0q8vp9Jnh9qgZSzos3IAZXEVgJ1hObJgMGVWN6f7I
         vHej1aSNP4VarL5gqtH2Dt5g/Qi32ugD2G/Jp6PR5vVt5G0/CAr91cbzOloRNtQtZnMW
         p9UJRa6aqY04ecBwvWaVf8IEE2byCX4zcKhS+PY4L1Rm5rubifWDuTL8/HBoehgbB1np
         Mm92DlEGw1ukptio5wdEJoEO31pRSEfER9Lsvo8qf/ZNRFgIyHGMPgyui2wDmkeXTNBg
         gwfb2b07UqLneIYWaLP4lQZlLIKmuABhIEtRK0PHtWmQa4LVXw71kDAS+52i9Rq3pJI0
         KH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781038071; x=1781642871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DLifDYktAjdhZiUiPVsyyYLPRgElVQdMpzKrVQLAsNc=;
        b=HrAvmvM1QcByI+hat4kga3Jon6QRIdWyfSNuU2l9Q526UWMO6EfUgtNm6pifRcZDLz
         XyzJ3KNLbm7pKD/gKXR2gSkBmfwaxkIsE7XdgNJxmKFn7rHPoJ6EwXsfK2pTet0YE0+b
         IQGCg6C/y358Rr+fe2EYUzE+eKu8wWyCnwW8Sd/UmOqjgwi9mLsbsGxKxUALBIQfNU1i
         igCzdsKM/A+4fjSZFRaeCxUFxpoBtIYqM114pS/yIVLLsS/YHHIF2zXL0iRKERPghTpZ
         8fkLlG6h0o7Ics+vU4+mWNDCV/oNKlUieap+M+3ZF4h/CEhPkWek/25SxEMg4ivtV9s4
         F4Qg==
X-Forwarded-Encrypted: i=1; AFNElJ8G3PyBQAM87/6TuZz4ej08MR219en0LGjE3+Wn2ycOL2roPFMhe4+86SYXVbR4OXVgDjOIRrlqD3s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXL6eDIO3pl9LtqwNznhfSpv07Ky0IEi0/1DBKCZMKOh8GgVsQ
	kv9o3inKyVi6X2iLbxbVm7veK6wIe1Poy4MmrN/rKtx2WYRIZrfEcvShKh0/GIWeKEvgyRnbXGo
	jNfGAeGjm1Tj9Rk6Gj6Lff42HKn5KspUv9t6x9xKA
X-Gm-Gg: Acq92OFUlo8+dIF5xnWB9/IgjhzorfSn0/LmGchNlqf7/MhPLc7cM70LcVLhuJyQFGo
	RLI9I0DYF0lu05+7tP34XMggyRJYzcMx/04ghcZmX86F57TQtjFNDeJaVIV5CaaLfNpvXH9YL1U
	nS1cNwh+LCBoEMXi9u8KFPLPUq7kg5na7NTCDNF9nA+b+aYVh7xUcgiyVX8Yqx6I7HksJ8wbr4z
	p48XMfyiIbxPWKa9TLIe0p3WQW3EUbkWseJdFLsSHEyyx9dnJze0BLaakykljSRi4lycUSfFZfv
	Obg9EpkB1WRc63BvFNM2dsD6VJbMFDFuaP7tWjtQ+xNjmSJW
X-Received: by 2002:a17:902:ebca:b0:2bf:139c:dcf3 with SMTP id
 d9443c01a7336-2c1ebfcecdamr7682605ad.19.1781038070721; Tue, 09 Jun 2026
 13:47:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1780701922.git.abhishekbapat@google.com>
 <20260605170858.9ee9ca2181a041bb9a4c3098@linux-foundation.org>
 <CAL41Mv6pZOVacLdUGta7UnxmFryumBbN6=Po50KfzgLzMs2PQg@mail.gmail.com> <CAJuCfpGr+K+fWK0zxVdMqGwKnr9Y26=Hn0HYFpnp-sUBcL8aKw@mail.gmail.com>
In-Reply-To: <CAJuCfpGr+K+fWK0zxVdMqGwKnr9Y26=Hn0HYFpnp-sUBcL8aKw@mail.gmail.com>
From: Abhishek Bapat <abhishekbapat@google.com>
Date: Tue, 9 Jun 2026 13:47:39 -0700
X-Gm-Features: AVVi8CdixkisYnFamT2wFz0ODVTO7BS7PkTvbXD_AzmUS71KZgjlBwqLVuaNZIU
Message-ID: <CAL41Mv6wwDVBuZRqGyOcu-4VJusKOsDTD-J4YLAdvWgDoZ7z7w@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] alloc_tag: introduce IOCTL-based filtering for MAP
To: Suren Baghdasaryan <surenb@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Hao Ge <hao.ge@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 5:29=E2=80=AFPM Suren Baghdasaryan <surenb@google.co=
m> wrote:
>
> On Mon, Jun 8, 2026 at 5:02=E2=80=AFPM Abhishek Bapat <abhishekbapat@goog=
le.com> wrote:
> >
> > On Fri, Jun 5, 2026 at 5:09=E2=80=AFPM Andrew Morton <akpm@linux-founda=
tion.org> wrote:
> > >
> > > On Fri,  5 Jun 2026 23:36:45 +0000 Abhishek Bapat <abhishekbapat@goog=
le.com> wrote:
> > >
> > > > Currently, memory allocation profiling data is primarily exposed th=
rough
> > > > /proc/allocinfo. While useful for manual inspection, this text-base=
d
> > > > interface poses challenges for production monitoring and large-scal=
e
> > > > analysis:
> > > >
> > > > 1. Userspace must parse large amounts of text to extract specific
> > > > fields.
> > > > 2. To find specific tags, userspace must read the entire dataset,
> > > > requiring many context switches and high data copying.
> > > > 3. The kernel currently aggregates per-CPU counters for every alloc=
ation
> > > > size, even those the user intends to filter out immediately.
> > > >
> > > > This series introduces a new IOCTL-based binary interface for alloc=
info
> > > > that supports kernel-side filtering. By allowing the user to specif=
y a
> > > > filter mask, we significantly reduce the work performed in-kernel a=
nd
> > > > the amount of data transferred to userspace.
> > >
> > > Thanks.  AI review found several things - you'll want to address at
> > > least the first few.
> > >
> > >         https://sashiko.dev/#/patchset/cover.1780701922.git.abhishekb=
apat@google.com
> >
> > All, please note I missed attaching the reason for choosing the IOCTL
> > mechanism to this cover letter, but I will attach it to the v4
> > patchset cover letter along with other changes. Thanks!
>
> Can you please add it here now so that we can review that?

I intend to add this to the end of the cover-letter passages, right
before the version change descriptions:

The ioctl() mechanism was chosen for allocinfo to address the per-CPU
counter aggregation performance bottleneck. A traditional read()
operation must report the total allocation count and sizes for every
code tag in the system. Doing so requires iterating across all CPUs to
sum their per-CPU counters for thousands of tags, which introduces
substantial runtime overhead.
The ioctl() interface allows userspace to push selective filtering
criteria directly into the kernel before the per-CPU counter
aggregation. The kernel aggregates per-CPU counters only for a small
subset of tags that match the filter. This results in significant
performance improvement.
 Beyond fast filtered retrieval, the ioctl() foundation allows
introducing a context capture mechanism in the future to capture the
context for specific allocations.
