Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CAC3168FB
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 22:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763503676; cv=none; b=sKXFzseWVhhSCXtMbpqfFHmOPOkLsy1XgyVot0fpqgJmcQknndi7DrcTKGL5WaQJ3ilOTFgFz3PkgPGSVxgqshlrH2p3fCjf4QuOmsx4o6Mo7h6yG7CWhLLQdlCx7FWJzvAU0CH4umMafyWMW3JHKKqzlGNFRRHKuHu0+QrTpfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763503676; c=relaxed/simple;
	bh=AgyH+nOFFLOOLPQj19SMqqrRCiMHwP0eevW9Zl1x2hs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=exxX6EikYLyK54KgKrG6SwujXgakfsa4Z+K/pxh+a8VYF5w1aKlaQ459T2wfoO3gPqjs3SFGt91N6x0OyOnSEBY4DLZzrW5KUJ1wVjFg9PrsOMg7AsZiVWuUYH2Kh3IMZmgZpp92IUS1E95AQ4DQKAZMupzx82Q3qTtb2rqQ8Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=EmLe9qpj; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="EmLe9qpj"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-640c1fda178so868281a12.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 14:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763503673; x=1764108473; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AgyH+nOFFLOOLPQj19SMqqrRCiMHwP0eevW9Zl1x2hs=;
        b=EmLe9qpjaCR6ceFXW9jDbuScNd4gCxIe3H+c9tGUAcikTWQnjgVmjbeme9yb7hFCOb
         4u2PZLi5EMQ7zkRHpf4Hzhnw7nGFlTY/NlVIPejardOZ4qYAt5x4IJRMDc5Efok+KEkf
         wcxjLvdItmraEQp1iV1Ajn47IBnLOTDZ6WBlwehEeqbAcWuFYoc6Dr8XJ1goZSeRFpFC
         QLKWHnRPU6661yvHUPBu2WqD5aZOoI842ct/k2Nk1BAMDs1WuzdOwV5BJCZyrjfwN48H
         jXEy7+daHCAwZe1L+J9DdBdkDmXWmgWjGwN1MMHbyMNxFXM8JEedIvahbDxnoNSWQHp3
         Ug+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763503673; x=1764108473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AgyH+nOFFLOOLPQj19SMqqrRCiMHwP0eevW9Zl1x2hs=;
        b=unpBTzgko579aultGjUytzCjinQK1YimI/H6Z/CvauhVUdSu2YeiTSGddxER6ENPUl
         ztiMrBLI36sj9ySDOnNLILReYrsXYwsJJrRZBULm1eYyHX0/DZWcbhaZjpswE4TQWADS
         38/7eBdFygjAZRKGmaEv2yZGW2lLrz3QXlofMtP6D/ps2V1auPK5ja/SvOwfvbNP7pt2
         FgR8U3F/THv4TK46VC5x30q83WDa2VGc3MOYL7WIwHSG/5mexfvF9fmSg3kxYhkgTsXf
         gJvF+0DUN7w9t+8HQIC628G5PmGDiFiVi7o62sz1GhM3zsPuwwywz/A467SJvVAqeTKs
         X8Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUQP0doNfMzVO65E6Bol1hGaPDxZtf5V9Ks0M7vnV1vJ538ZXxK0gAJeQ6VsfKRZDiVGuaFqBclOgU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxei5LE7ArquIaJTYNWGxWSqUAKb1ufA0iZQTcsj07G0a2FqJr0
	czFr7wmMdkRiP3dPmDC9x+aZUbxi5cXrkk5pw9dYBFu3v2Doqi/SGnLAGqm4mUilWDtRmbAO9H4
	IGpEfyjJXpfNInpAdDlGFMnzWxSnxbVTeI0YvjYg0fg==
X-Gm-Gg: ASbGncvvcoHOQ/RhYVaZbuOX3j+84r0iAunFO8/Yy6WD7VoNw9VvnZDvW7K7cE3B8Sr
	8JVG4k6wIGkLsQeXg98JouxjaeGUU5p4104k7Yf3I+AgqYkn9woQnSL0459lH2YpH9WeZz0okwz
	ttNTMhCoI+adjE/+AH89AP8os9a+OxOqsqFadb2B/QH8gXy6w9G7Ev+c9PN0YexsBniaclx3zyr
	klMCnfvDzHNXRBajHIZ0BGsaG+F/bDXOuhMLYvXx8IqLchXIgBqCRfzP5kIjQAX1+ZW/VHS8jRo
	smg=
X-Google-Smtp-Source: AGHT+IHtDqrk0qniYZc5AFwR5DqbAOIqGAY4cBt02gO8xxQprKgTQdf+fJMHgzuhx8eUZMd/TIJzeZERktIMHFkuZIY=
X-Received: by 2002:a05:6402:13cb:b0:640:ca0a:dc1c with SMTP id
 4fb4d7f45d1cf-64350e04b49mr16432565a12.7.1763503672627; Tue, 18 Nov 2025
 14:07:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aRoi-Pb8jnjaZp0X@kernel.org> <CA+CK2bBEs2nr0TmsaV18S-xJTULkobYgv0sU9=RCdReiS0CbPQ@mail.gmail.com>
 <aRuODFfqP-qsxa-j@kernel.org> <CA+CK2bAEdNE0Rs1i7GdHz8Q3DK9Npozm8sRL8Epa+o50NOMY7A@mail.gmail.com>
 <aRxWvsdv1dQz8oZ4@kernel.org> <20251118140300.GK10864@nvidia.com>
 <aRyLbB8yoQwUJ3dh@kernel.org> <CA+CK2bBFtG3LWmCtLs-5vfS8FYm_r24v=jJra9gOGPKKcs=55g@mail.gmail.com>
 <20251118153631.GB90703@nvidia.com> <CA+CK2bC6sZe1qYd4=KjqDY-eUb95RBPK-Us+-PZbvkrVsvS5Cw@mail.gmail.com>
 <20251118161526.GD90703@nvidia.com>
In-Reply-To: <20251118161526.GD90703@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 18 Nov 2025 17:07:15 -0500
X-Gm-Features: AWmQ_blpcRzsFKrW-N42BrQ1n1NLtjzkNBwejiuKy6hBEe6k9J5ADY-OfS4GodI
Message-ID: <CA+CK2bCguutAdsXETdDSEPCPT_=OQupgyTfGKQuxi924mOfhTQ@mail.gmail.com>
Subject: Re: [PATCH v6 02/20] liveupdate: luo_core: integrate with KHO
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Mike Rapoport <rppt@kernel.org>, pratyush@kernel.org, jasonmiu@google.com, 
	graf@amazon.com, dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
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
	saeedm@nvidia.com, ajayachandra@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com, hughd@google.com, skhawaja@google.com, 
	chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 11:15=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> w=
rote:
>
> On Tue, Nov 18, 2025 at 10:46:35AM -0500, Pasha Tatashin wrote:
> > > > This won't leak data, as /dev/liveupdate is completely disabled, so
> > > > nothing preserved in memory will be recoverable.
> > >
> > > This seems reasonable, but it is still dangerous.
> > >
> > > At the minimum the KHO startup either needs to succeed, panic, or fai=
l
> > > to online most of the memory (ie run from the safe region only)
> >
> > Allowing degrade booting using only scratch memory sounds like a very
> > good compromise. This allows the live-update boot to stay alive as a
> > sort of "crash kernel," particularly since kdump functionality is not
> > available here. However, it would require some work in KHO to enable
> > such a feature.
> >
> > > The above approach works better for things like VFIO or memfd where
> > > you can boot significantly safely. Not sure about iommu though, if
> > > iommu doesn't deserialize properly then it probably corrupts all
> > > memory too.
> >
> > Yes, DMA may corrupt memory if KHO is broken, *but* we are discussing
> > broken LUO recovering, the KHO preserved memory should still stay as
> > preserved but unretriable, so DMA activity should only happen to those
> > regions...
>
> If the iommu is not preserved then normal iommu boot will possibly set
> the translation the identiy and it will scribble over random memory.
>
> You can't rely on the translation being present and only reaching kho
> preserved memroy if the iommu can't restore itself.

In this case, we cannot even rely on having "safe" memory, i.e. this
scratch only boot to preserve dmesg/core etc, this is unfortunate. Is
there a way to avoid defaulting to identify mode when we are booting
into the "maintenance" mode?

Thanks,
Pasha

>
> Jason
