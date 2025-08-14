Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3929E1E7C34
	for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 14:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755183505; cv=none; b=cPxCKq2wesVbKPnowTT/MtAICC7NdA9fap1RqMVxrvu7P/LZEhfQPBgSQfzE76+FF8U8rLlqhuopLGSPm99Nr1s3gj/FEQJUR22NQWCVjmu4mGQ9Byd/ug8LAA2iH8p3WspmwslSFoYidItSIk6lnzdDdwHLkZy2Nx7YrP89MoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755183505; c=relaxed/simple;
	bh=MU3gYDGK17uqY3N6k7XJpgqHs7YiCVPOQMg82gPF2no=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CFaRhtoxDyn7MhcObzUlKcdVm7B1WrHpwr3VgOMFCoocm4co2PqA34dc4z1zFnAA+GVGF4I83jEyeEVvIAriwVTSD2NZXpwoHmqUOeCfVUSpEKikbbC6/HNy+fy6hQF3zZoj7N2BhfCb4URwY+S31ysYIcujFi6j/MYLYsSHD/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=FsQcS5Qb; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="FsQcS5Qb"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4b109a95f09so7338751cf.1
        for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 07:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1755183503; x=1755788303; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0sgUd9YdBOZy0kVdBoXU78NUeqQMRVWLT5DC2WvX4NE=;
        b=FsQcS5Qbo/1jLYAnxFQZ+qc1uAZjN5JiK3pDaliLv+x51YmAJkeLWfMbkEXP3JpbD4
         YvtN37O7qJIp7KrBSBGVlhefE4jp1yXkpyNK3shMVVpsFtgB2f1Et7qxIv9orFu5N+uY
         X3h2PrwVx26bZmuCuQIMoy6ZSJR2kXyLIxm8wOYNotAFCQXtJ7S+ArJ6KZyAu1Mv55aV
         rl3b6FCbmO4T1/+OgvcmDo3NOLsFOsUZWrEZwwFjQEAmcok1vy8IaL+1xFN7eobJ/7RO
         yRsHK1CSHRqocl070dM0b9lpEYsY6LloPKfg4RfOV41YcseqpC9Gq2ZhL7Beojijx4iN
         jcUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755183503; x=1755788303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0sgUd9YdBOZy0kVdBoXU78NUeqQMRVWLT5DC2WvX4NE=;
        b=DGq4kMuFpZo2BsPIFMOr/K8P/g0TQw62KuK1bgW/HpfFlJYXHxQ0LKrcSXCaey64a6
         XFBIFzlV7Wow1lMI+qkbJep3Dot0ZfNrR1bnOx4BdrLrJ+gJ69b4jjX9pxWrqaiY2/ft
         1zTpKeXxVK8tTiVvftCqtK3pZa+jKfnGH8lu9Tq6ICAj9s2COZkawl9b3XL2cpIuTrzF
         hnQcXnDweHksZc8JKH65kOFaEytyTbw+2auj/8EZsk88dnAQzNzlY+ntp56xhqgmU2e5
         2y9zzi7yH2FAvx52mm4KMcUVBZrs1HNri7bQ30HgmNFIbYwNpnFm4RDLJVJ1uNllcAw0
         5OEg==
X-Forwarded-Encrypted: i=1; AJvYcCUmogz57U4o77LchQBZmysgYX4ShTV6+y/LKtR7fP6R83X12heoxbUTqihpCloW9lUj3KnEkH3kdvw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyserSifqFo99YOW/AObTUBl4RjgZVc7X6fkbxrmC7oBXVAx+I/
	V1OXsjZ2cZXd/TUa6irKupvLg7OavUgckaW5JyH+/6l+D+tIyHG+LB/c6naY2fubx5GE+4E8M2b
	WqGvpaCKUjIN+acog/7C19pzvnG6l5trTQpXqu3Sqsg==
X-Gm-Gg: ASbGnctMxsjstD/b+3eScHeEWqXBGOF40Eh/hyJYLShmVbXr+TuGIrCBpoSHUYafu+g
	dvqOTMGK/oymssnkx6L8sReCM4XN3yg1wFF/xkFQCirxW/FkRD+ifzq7C0w6XNsr70XJumtsZct
	5NDJwjJbaowJOpMJoKDgyVtatXHZaZknDqW3fNyKuCobC0ae5cef82TRy6YXB1jDQf74glIW1dz
	ko9
X-Google-Smtp-Source: AGHT+IFHaAxoYBbg9LXBtGJVpwf11YGEdCLkE88L9yAIytLzKSm9bsg1ZUT6QEZSsty4xseoM6W0eewH0Y9mwveJD34=
X-Received: by 2002:ac8:7fd6:0:b0:4b0:695d:9ad0 with SMTP id
 d75a77b69052e-4b10a915ec4mr58260861cf.3.1755183502991; Thu, 14 Aug 2025
 07:58:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250807014442.3829950-1-pasha.tatashin@soleen.com>
 <20250807014442.3829950-2-pasha.tatashin@soleen.com> <20250814131153.GA802098@nvidia.com>
In-Reply-To: <20250814131153.GA802098@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 14 Aug 2025 14:57:45 +0000
X-Gm-Features: Ac12FXzhuAauSUYd9gdMUr4m-BLBsxxrJtaDxuhGuUwdJZFXccXBv2CW6TsGSmI
Message-ID: <CA+CK2bBWEFUU728aQ++7Yp5qXApsHzOTjy=nLMyd7WE27RfQbg@mail.gmail.com>
Subject: Re: [PATCH v3 01/30] kho: init new_physxa->phys_bits to fix lockdep
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, rppt@kernel.org, dmatlack@google.com, 
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, akpm@linux-foundation.org, 
	tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, 
	mark.rutland@arm.com, jannh@google.com, vincent.guittot@linaro.org, 
	hannes@cmpxchg.org, dan.j.williams@intel.com, david@redhat.com, 
	joel.granados@kernel.org, rostedt@goodmis.org, anna.schumaker@oracle.com, 
	song@kernel.org, zhangguopeng@kylinos.cn, linux@weissschuh.net, 
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
	leonro@nvidia.com, witu@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 1:11=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Thu, Aug 07, 2025 at 01:44:07AM +0000, Pasha Tatashin wrote:
> > -     physxa =3D xa_load_or_alloc(&track->orders, order, sizeof(*physxa=
));
> > -     if (IS_ERR(physxa))
> > -             return PTR_ERR(physxa);
>
> It is probably better to introduce a function pointer argument to this
> xa_load_or_alloc() to do the alloc and init operation than to open
> code the thing.

Agreed, but this should be a separate clean-up, this particular patch
is a hotfix that should land soon (it was separated from this this
series). Once it lands, we are going to do this clean-up.

Pasha
