Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3412A181321
	for <linux-doc@vger.kernel.org>; Tue, 14 May 2024 20:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715717975; cv=none; b=iGhVcogtjIadD8ErXW1RcgJmOpWC/uG7yx8/4ODE6sBctEMGLsQMKiCHZzgsD/IJvthyD92raRWdHRqJUAAgXUQMzaqwTCSMtaqPfzfSPL1IQcxKz6rJvieiCmr7Y9IBk27V5S9bsXc+iBIz9sAidtwFfzTvEkrSj+m8NsKkQUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715717975; c=relaxed/simple;
	bh=VaHu7rKqUD82QxgHYz6hkdvHYjYa2IRHOTNhh/K5VCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YsyVeSmkOMpWGw33l9Ozc7dWZLC516x8M6S+sMYu4uJ7DpxHCuK3pieI74+RTSHSfJWbB3QTRIzu+EFx4iaGYjg0eL83GxI3HjcbVIpn9vNo02fLeX73tatp4PCIgVXS4VcBkAPhASeri8yOek2RWcnqs0nctGAVzECb7v1lWP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0a1zuzJn; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0a1zuzJn"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-61df903aa05so68681957b3.3
        for <linux-doc@vger.kernel.org>; Tue, 14 May 2024 13:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715717973; x=1716322773; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hb7xfSX/VQFjXuNhYy1AT8FiF40Meq6UrJ0Q9OaWSI=;
        b=0a1zuzJnVTED5zaBjn+vneejEbKjifynYTHZTlnVvJKgSHH0FmJ1Bkn3TIS+l5/1Fr
         7NbcjAvEqVEWRplugA6jaRTfJGfPU91IqxQ5ua1BqzAlAnXHIcZeQbwh36eH+HrY/GST
         kZoW1w7PDM6ndbkwbCdg+S4B9E6WtIyn53TkzQSHwaMIMYnXC80MnnzqZhcWHH9emoyo
         tE/Y2rNZCaH7VE/zEmxSMNyxI7x+qvLgApVmmo/zHocyfjYSqqNyW6Xnzfkdzi34Kf5+
         tILMfTM8IjYU5bggzvkRUy7e6LTeKynROC0y2vUCYxU7CkBeXgiJsP2fo5ZBHNle3+Vf
         lA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715717973; x=1716322773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8hb7xfSX/VQFjXuNhYy1AT8FiF40Meq6UrJ0Q9OaWSI=;
        b=sSBg42d0KkkkgGIJtYrGsyTmNNA0UBx8TkZL9QRIuo8PIs/CGsNcbpXICYBumoFotx
         xPAIisXS/mYRNQgr63+s58LQjYzhBDgMvNwJVNTQEAyePW8O/pe9q+9FpELiHgK8WDC3
         lr9jngVNAIB+XMd4JlnUvTZEk1pBnYPE8qELoVphXv8lRXJadLoVumnQM1p619hxDGdw
         n077iUK6/B2KKPQw1DKu8cUnequMYDMEGRffGXeJPHKY6g5Cj6u8c8GY8lXxm3sdN46a
         Sgm0Lit2uXTfzdqjmrxsc3p2kLwwKlScuHCQgscpRNEf8TySUd6UaF/Qb+C1IxHmQvmL
         egCw==
X-Forwarded-Encrypted: i=1; AJvYcCWQRCqCu1C7DYvLIqwXWtgzGaiNX9UTK3J805saMMPEO78luw5aZki8CiEmS3kxxXcZbm3wz5fmyBHhYcnGOG/2Hubib1vpppts
X-Gm-Message-State: AOJu0Yy1chSovZvjyXrA/RxdyyKl9SWftKTUBVhFdfJLMFI0xy49EDtL
	uPeHy6fG1TfFN/pBPnJOhQv/iMiJTzWRVyVoTv5Sxxbyyd/QmvXh7q4gBHnXn1YaRKgdk+n9len
	Oja7EsF9XMGYXOuEeK6hESOy1jdiX4gc0NLeK
X-Google-Smtp-Source: AGHT+IF0OFILt+I7s+gtnueoup30JC7tJkxqSmt1mTfiiTyFdrB2xvE1WcfGDmSBB02xHb0OOmS8gf0eZcoIH22ncJ8=
X-Received: by 2002:a05:690c:386:b0:614:74ba:f91c with SMTP id
 00721157ae682-622aff93dfamr216111377b3.19.1715717972903; Tue, 14 May 2024
 13:19:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240514163128.3662251-1-surenb@google.com> <202405140957.92089A615@keescook>
In-Reply-To: <202405140957.92089A615@keescook>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 14 May 2024 13:19:19 -0700
Message-ID: <CAJuCfpGjRtL4nrOp2fLVM2=Yfg2WH4DXjkTK-y_1q4uwAxFDHg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] lib: add version into /proc/allocinfo output
To: Kees Cook <keescook@chromium.org>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, 
	pasha.tatashin@soleen.com, vbabka@suse.cz, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2024 at 9:58=E2=80=AFAM Kees Cook <keescook@chromium.org> w=
rote:
>
> On Tue, May 14, 2024 at 09:31:28AM -0700, Suren Baghdasaryan wrote:
> > Add version string and a header at the beginning of /proc/allocinfo to
> > allow later format changes. Example output:
> >
> > > head /proc/allocinfo
> > allocinfo - version: 1.0
> > #     <size>  <calls> <tag info>
> >            0        0 init/main.c:1314 func:do_initcalls
> >            0        0 init/do_mounts.c:353 func:mount_nodev_root
> >            0        0 init/do_mounts.c:187 func:mount_root_generic
> >            0        0 init/do_mounts.c:158 func:do_mount_root
> >            0        0 init/initramfs.c:493 func:unpack_to_rootfs
> >            0        0 init/initramfs.c:492 func:unpack_to_rootfs
> >            0        0 init/initramfs.c:491 func:unpack_to_rootfs
> >          512        1 arch/x86/events/rapl.c:681 func:init_rapl_pmus
> >          128        1 arch/x86/events/rapl.c:571 func:rapl_cpu_online
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
>
> Ah yeah, good idea. (Do we have versioning like this anywhere else in
> our /proc files? It seems a nice thing to add...)

Yes, /proc/slabinfo has a similar header that includes a version number.

>
> Reviewed-by: Kees Cook <keescook@chromium.org>

Thanks!

>
> --
> Kees Cook
