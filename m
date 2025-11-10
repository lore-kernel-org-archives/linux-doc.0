Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE58304BDE
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 15:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762789464; cv=none; b=GvYvBydsBtgmTtCbaJttaDOuao9E/frqnIYUHTC2lLUc1A/fLvORgyXZxdfnxNqmeFZjaLFuE6wgyNW6iAoV9H/wwZg/V/keY3A3wLi2g/LWSasGkfLOh0gKYthaMbzOBXIahJvYaDseMuR7ChekDIPwB+BweWr6UNmxSKZbvn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762789464; c=relaxed/simple;
	bh=0/OiCETMmzcumsvoWoUgjV7cQZEVGoR3fXx3J8u0qVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I2wrm1jyLq1hRsdrR2SBBGhQyUsQqqiy4rvTTPyA4C+I0Dw35SpqGAPKmip3olIPEMhOvJ2ZumKf1NBVeNJpjFzgBRVnbhstPaPYAd/jsMTfUVy2qEBt/ghyv+BmdvWA+HHxp2g5ry2KGiS7DUQgWDYU0GViMO7T8j8N+g+UzaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=dzvOjL21; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="dzvOjL21"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6419aaced59so1470696a12.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 07:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1762789461; x=1763394261; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KQAadWs2BEV1pVXExDFNf/QXLwU7Gs3Db0cLPnWAqzw=;
        b=dzvOjL21KjvkYZZzR6Ed+fpTiS0NvhBWEAiCCEQBV19oX3UrQouoka3tyVBpTo2UWs
         j4PVvJ2pL4ZrTlNNHUDdVANtzS7C0YiDtCMYtFnYw/pyxn35SX9EwsR3r5NFtC1pqczs
         PfomZmit+5jlMicEO2krFsQEgEsMZznnqrt7AdW062KR3Wf/NJR/LoXOHLXXcJofeQ8w
         P/mI86v2d6dSxyNcHa7tmNUU9ErJLfuhu6SpeaUNPhOq1V1iuMB9XnDS0OlHfX5ljxM5
         w50mfpkDbsD/GI0E+6Q1b7bB14spFnuBLpTe0ZV8evQnSc8hpXd9fph6sJ0No4vC/Pti
         NLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762789461; x=1763394261;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQAadWs2BEV1pVXExDFNf/QXLwU7Gs3Db0cLPnWAqzw=;
        b=Q8FBYc9x5phheo667K/W5RvCGWjUVSP9e2cia+IuBlBx9BrLUIGkHwnlFEk5jvl2Jt
         J7x6b4dCLYWMGgzFsim3/YS7EnRbSP/nEmdlqh8q+NCJGE3nSHSQLd8ZyQGEEShYph3X
         T9OkEVkhS8ZVwRVe/MLsLmyUrZ5/uzsXKFP61/RlXHZBUf4JqXgIoIwZZC7KG5/ps/bM
         ndoT6Ce7uBvEa+82j1Rx7nRU30W5932DzpBsLnC0T9evxHcr///gcvGdj5kMq60UqRqO
         kMsaSpH3wqZMmAWVtNrKTJx/SFjB0O9Hnw/YHS0wl2s9lhq31BCwmU8YwXCmgrwsmUcD
         PglQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCK/yRIljNDz0oE1k18XSvJxWqC28ewqXNDHE3b9HNlXSt2mWPecahIJ4ezUvH7D+GhMsuZvLhk7U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf1qSHlDKkgbMAbFIzxFb5INcif9BqIlWpqwQlD2T9yhWFb22V
	u+eEIuXLWeeFdINTS9z7wxmUP+aSoezH4+s0fWUFg5JUjaTyyWIfN53S6WarfCQEicU4VVTbNR1
	rqKBKRJRrfQvghA6pWe4AdhbbV6iiSsNR3oPmN4hNeA==
X-Gm-Gg: ASbGnctl+hYV3FCJyhyKAibs3faz71dWSH+4J+A0k6g6ZDo3U6T8gADCgN8CFxQp4FJ
	zCLANy8UORnA0ABxzmMTFB6BxXWUi2qwokIdcV1op7OOjVfBUCPMNhJybOG1oVkItJbnQMLnHth
	+aG0FFAEYt3S18uvBSWFy+PzSdJEO0E6JPRSRw9LO9H9ZV1plKU8MJvz6ajJ+fWVadJiWFn3MeX
	AaeGhW8jSm86piUUwVhJ6Y/vVfBBMC+IYm0aJw5VU1Mr/10omYcEG0UcQ==
X-Google-Smtp-Source: AGHT+IHgzYBqOch+pmqIr6aFKeN8KU2lBlaA5VrUfecgkUX1bwRao0L5zlIWi8QFdGiWaxEVfTfghHwHllS6y/yRZSI=
X-Received: by 2002:a05:6402:5245:b0:641:270:2c5b with SMTP id
 4fb4d7f45d1cf-6415dc082f2mr6735966a12.4.1762789460667; Mon, 10 Nov 2025
 07:44:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107210526.257742-1-pasha.tatashin@soleen.com>
 <20251107210526.257742-3-pasha.tatashin@soleen.com> <aRHiCxoJnEGmj17q@kernel.org>
In-Reply-To: <aRHiCxoJnEGmj17q@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 10 Nov 2025 10:43:43 -0500
X-Gm-Features: AWmQ_bn3hTY0dfz8jKC-NQyPogDeCUM0IUVj5R8f5Xi9W9zl_j-5I3l31CcFnck
Message-ID: <CA+CK2bCHhbBtSJCx38gxjfR6DM1PjcfsOTD-Pqzqyez1_hXJ7Q@mail.gmail.com>
Subject: Re: [PATCH v5 02/22] liveupdate: luo_core: integrate with KHO
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
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn, 
	linux@weissschuh.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, gregkh@linuxfoundation.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org, 
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net, 
	brauner@kernel.org, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	saeedm@nvidia.com, ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com, hughd@google.com, skhawaja@google.com, 
	chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> kho_finalize() should be really called from kernel_kexec().
>
> We avoided it because of the concern that memory allocations that late in
> reboot could be an issue. But I looked at hibernate() and it does
> allocations on reboot->hibernate path, so adding kho_finalize() as the
> first step of kernel_kexec() seems fine.

This isn't a regular reboot; it's a live update. The
liveupdate_reboot() is designed to be reversible and allows us to
return an error, undoing the freeze() operations via unfreeze() in
case of failure.

This is why this call is placed first in reboot(), before any
irreversible reboot notifiers or shutdown callbacks are performed. If
an allocation problem occurs in KHO, the error is simply reported back
to userspace, and the live update update is safely aborted.

> And if we prioritize stateless memory tracking in KHO, it won't be a
> concern at all.

We are prioritizing stateless KHO work ;-) +Jason Miu
Once KHO is stateless, the kho_finalize() is going to be removed.

>
> > +     if (err) {
> > +             pr_err("kho_finalize failed %d\n", err);
> > +             /*
> > +              * kho_finalize() may return libfdt errors, to aboid passing to
> > +              * userspace unknown errors, change this to EAGAIN.
> > +              */
> > +             err = -EAGAIN;
> > +     }
> > +
> > +     return err;
> >  }
> >
> >  /**
>
> --
> Sincerely yours,
> Mike.
