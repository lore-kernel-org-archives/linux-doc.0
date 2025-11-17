Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34C232E15A
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 19:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763406058; cv=none; b=KwpHBVcs8+8B5I4ciEskUNK51kCT+I1XnLxtSarRFizDbdtDrr3wYslx066iZ70TDlvwyBi7+5PW1xSZYEj3srhsfHwKNkJ5UqIs91DG+xnEKIrerfvEJINSkD564wsk51bvj6M1EUaOI0ysYHvx1cF/4P4wAIzgFVlhJpWL1UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763406058; c=relaxed/simple;
	bh=W/pP15q1CttsZvUfyX6F2C+iK5S6h3qctb/NEBwupaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=euV2EoWfq3Ofo33/L5tyNtbJnctv0tqMujc3NzEfvjJr2cJjlLgbq3hoTz1rd6ZZvlxbOrsmxliINivXKB5/kvC6DiYVUgdMPaxqEdd+PvH4AsMwMKj1zsluwouwrUOunKNl1kHm73n/iBCHLbobfnC10txwyC52qdAcLldwx8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=V4BdmbS2; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="V4BdmbS2"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64080ccf749so6380890a12.2
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 11:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763406053; x=1764010853; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HPFoc/+4ns3fO2ktzkE/+/lUeXaO04xK8Lezo7jSI84=;
        b=V4BdmbS2aYVd3zPMLXZ8nNGnKhBWGeLQk1Rmw45vzvGzqb8xoAOlOWeQLht45ONAkU
         oRlsa8N5dj8Dbap92l9JEemjKwZxJbBu9+MXeeWtPbkMhm1KxXwk7BXyfmjGl0Wm2kNg
         sBIFQ0J4SVi1SM0ASfD30Gqf0b6Nk+Vb6yJX5MZaZx5oay8nyuaorRTe94iA1YqaGqv7
         Br+pWhCp7cnFXqj5bs75RyT2Tl8iWRKESqjBkIb13AB25scneGG54OmEGl5G+y3L1q6E
         HZWahSHEdcC2pkD5fNyhhLXRT+k324xymdsFLV/+g6pZjADxD3ouZ6hXEY/svxUJLKVp
         AUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763406053; x=1764010853;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPFoc/+4ns3fO2ktzkE/+/lUeXaO04xK8Lezo7jSI84=;
        b=dp29Ptad169S6eskLY09pr9x741sBSSFm+HbwcE1g2eDbfQuloCcb31bPlzpUc61bA
         DkAGIw0Hhq4Zp5xXRaMrl8CnGkQHT9It7iQYOFDvo9K1q23O+okpZCN5wcV7ScjFZXX/
         z4LMCz4znIipITnJCMzobrC9cRRLZaTYqJ9eWx5Ob2IcfzH72vZ2cPiOoXaSfShrnwYr
         slCz2vUjRhTEU9P1bJEFh619QghU1M7YS8KAekrJMFlTUltP9kWpSCKhajltbXeqi81B
         11KeulAfWV6FawiLmw257hl/EeAWGPcTK4YJObRMJ2UqM7Kjhg8mxhfwnb1d5TVnBkko
         b5rA==
X-Forwarded-Encrypted: i=1; AJvYcCULkI24AcA5qeAv7wk6EdIGeHuppTf0XXdd4+k8BItKBULsGBjoksq5bMgR4xSHbRlqu1jGEiUEP58=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8BddtZjGJ+NAM+W+JJoOGNfzD9xvT1pbFQcoXw6Y1F0TtGIvV
	J1L27hfqqwMCJ7S6Sq1ufVE1hMOXclHghtkx/l3rTUcnr5WZMiJMfWGyupmbe9eAcC7y97uYRPP
	IAIkk/Cu+HDtPqWUWbxldMQK46AZudYKaScBBqFDvlA==
X-Gm-Gg: ASbGnctWQnWgRvChVq4wSDfmkhoh6gc/p+56QcS2nDdpTtVDa4XmEipvf3ESEnB/Dbg
	zAra5GM0Gk/0QJ5KY+0re48mJ3Peffg7FVkL1pz/76wgT/6uE2uW6ePxxc6elw//4jrTtEFL4hr
	WWhaD6Nc8r5tzFXIPxH2+Es16DKFDQWyPRTVkPfNEYFAOHMFppJo+Z4B/TGtyqeiHjzv0awntdt
	pSnHBbE8eDE1zr9aNnvPFaoTh+lrSLdMLLGfF1fAsU72ZpCqHSKEwiYXKv7XQjKKVe7
X-Google-Smtp-Source: AGHT+IFV4NJXr23fgmib+nZZop8ZpcGlfzValh3mFozDE5HCWs4UKMYvFXIv7w0dSviSfrbdSBGLz4YMmJN++K6QINE=
X-Received: by 2002:a05:6402:2812:b0:640:bb28:9a28 with SMTP id
 4fb4d7f45d1cf-64350e237b9mr14060340a12.15.1763406052900; Mon, 17 Nov 2025
 11:00:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115233409.768044-1-pasha.tatashin@soleen.com>
 <20251115233409.768044-21-pasha.tatashin@soleen.com> <aRsDb-4bXFQ9Zmtu@kernel.org>
In-Reply-To: <aRsDb-4bXFQ9Zmtu@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 17 Nov 2025 14:00:15 -0500
X-Gm-Features: AWmQ_bm3PVSUD_ScaaBFLOLZ3gtlTTKqmWWQ6wfPBc2TSiFgvBGhnxI_qyTqjOU
Message-ID: <CA+CK2bCfPeY558f499JHKN7aekDzsxQkZJ9Uz4e+saR0qtXyfg@mail.gmail.com>
Subject: Re: [PATCH v6 20/20] tests/liveupdate: Add in-kernel liveupdate test
To: Mike Rapoport <rppt@kernel.org>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, linux@weissschuh.net, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	rafael@kernel.org, dakr@kernel.org, bartosz.golaszewski@linaro.org, 
	cw00.choi@samsung.com, myungjoo.ham@samsung.com, yesanishhere@gmail.com, 
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com, 
	aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net, 
	brauner@kernel.org, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	saeedm@nvidia.com, ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com, hughd@google.com, skhawaja@google.com, 
	chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"

> >  #endif /* _LINUX_LIVEUPDATE_ABI_LUO_H */
> > diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
> > index df337c9c4f21..9a531096bdb5 100644
> > --- a/kernel/liveupdate/luo_file.c
> > +++ b/kernel/liveupdate/luo_file.c
> > @@ -834,6 +834,8 @@ int liveupdate_register_file_handler(struct liveupdate_file_handler *fh)
> >       INIT_LIST_HEAD(&fh->flb_list);
> >       list_add_tail(&fh->list, &luo_file_handler_list);
> >
> > +     liveupdate_test_register(fh);
> > +
>
> Why this cannot be called from the test?

Because test does not have access to all file_handlers that are being
registered with LUO.

Pasha
