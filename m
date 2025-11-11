Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D952BE7AC
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 20:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762893618; cv=none; b=Nf7iChwdbkQ5pNLr+A4iuxYhe/NWjWrYz6Y0nhjMavO9SjpjGhfjOd5f8meOIQgbeMOkdyS2TTn0WaIeMy6T75OWXood5AY4arDQcQVBiUIM0oRH2y3wcK9aPThpAjgOk2xxmbV6tJOsogDLQrO9JFvtFUh9RnCc2mz8VXRBgZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762893618; c=relaxed/simple;
	bh=btQkr6RDk1NH/5MamMwUJDtwxh4vSiSBuYbejvufMhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WpEdh47TNC87ZDwHyAanXe9eULrmhEz4pmGJ6NelqSHRso2c2XDSaWxL0uJ+qiBbRX0MiqS+9PPfuo+LcDoJOvBxhd1tdgpS3TIAUgj8CdwfRq0yWsx59ayRTwmo1amGqOh6OqxUnwHi17BbNPAgbjcBr2cS++SQB2DsblX5UTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=KD5Lswt/; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="KD5Lswt/"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-640c1fda178so124193a12.1
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 12:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1762893615; x=1763498415; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FEWNC5DwWIOcHCGzzhjZ5KjnP7zvYaHcMNDin0urk5Y=;
        b=KD5Lswt/1taskpsK4UbBAHW1IBf8VVev9V7U45UKE64xy2AYPO3VgVc/SmD3/JAfnZ
         03z2LafjcCE210bfeqeSHQAcSvVAuWB47KCkcN9pz8ECtTurm5F1uQB7UKgnwFcJLljZ
         ZKcbyZ+QYVkwDBSoAcoeXg7wETYXdfyNz2k9/VJ2x3dM7s2xDHFfqJXQmsnHc6Bms7LH
         xXtW0yPdoQ+c2agBOnK3hMt9ytxudo82+A8pP/qd4z4doPgPCZcykWjfbPhzxhhBb+Pb
         7H4SLHPLRok3PVk9bv6iN99BW9U8Za5PPgCsDOYxgMlKyVKO84s1DVv+cB9illYj6yCG
         JlEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762893615; x=1763498415;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FEWNC5DwWIOcHCGzzhjZ5KjnP7zvYaHcMNDin0urk5Y=;
        b=eltJv2OreclvKmIut+pLSIa36ZOnNle1cKBKGY/bhVOn9m+lJ81V6XCGf96eYA6+4M
         xjTcw+ffV91PWvdrj90hxceuTm2td8avYCqDomsX6YT1GuTK9Zet27u1g0BbpcXNaSM+
         EF1hBtmU1ERWXsulcwg8kOQ6wzyYbIisUwByyM8RZDhVrsF6BcI0G/b4678VTOPXH3Mw
         7fRCiy2f8UMz/Iz63J4pBvdytkjqbRQ+DZM5uZi6AMEhejDyP1nyejOBgBbS9CdD/mJT
         dmsMzZ0p9+OpfUMn/ZT09W8zp/+Bj+zYynVxm6M98Xwsm96UWQhdhVYvQW7MN3Icsk17
         VULg==
X-Forwarded-Encrypted: i=1; AJvYcCXgbWrXrEHbb4XC7S/Tvs7y5nlfoppJn2Bi8AXgPVvTo9556B7HH3kOG9B3Krqpj+GcTHxqaSSG0uQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz31sjnAil9vO4e2pPZuB8ojomAaycppdkwkiee/b5iunA0wScy
	S+tHIKxrDcInutlG4UFQ/k3OebxsNt33YZsaY9mtjIAGLbWYKQrlviXdcAdyODflPEdoBIco46n
	xguAXdLuI8xCw3HfyuXf34R4sd5oBEqWB3zjK9ZPfKw==
X-Gm-Gg: ASbGncv+WRkjlKTI29jST6XpODXXICrRAB4jrWy57xN5kb/oEgwJWhc2LioNlhVHyqT
	ZRm9nqIHfvgzrWNURCfsw9tfJ02xhUrVneczLVBsmweTUzjSxYoAoj0F4SyqOmBvGwcXINfkv6N
	sUAkORpNFBVT5MWf9Wo1/8G9KqPiNTjrC/ewyvM5zlG7XSbl2y9TQunZGTucHSVs+vRQEjA7qzT
	4qlFUY1+oBIThTCrGQ2uM/wkgBwB+6bWGAyXpLitnryUgJlYMKn1FHCjdwOHdJWXVAo
X-Google-Smtp-Source: AGHT+IG2cjRv3TGWEc4gZfDUbaiY5wslxoai9FVdySiZOlZJ96VFj/VlY7pkuIOjpI5WMCQnGxd1eAfTceeYneOMjsI=
X-Received: by 2002:a05:6402:26c6:b0:639:d9f4:165e with SMTP id
 4fb4d7f45d1cf-6431a5755f0mr427744a12.29.1762893614411; Tue, 11 Nov 2025
 12:40:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107210526.257742-1-pasha.tatashin@soleen.com>
 <20251107210526.257742-3-pasha.tatashin@soleen.com> <aRObz4bQzRHH5hJb@kernel.org>
In-Reply-To: <aRObz4bQzRHH5hJb@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 11 Nov 2025 15:39:36 -0500
X-Gm-Features: AWmQ_blaVxPLNZ6NFksFWHSVRdEa0McmUdt4XuCrjKEh2bGQvzq2cMu3aSw5QAM
Message-ID: <CA+CK2bDnaLJS9GdO_7Anhwah2uQrYYk_RhQMSiRL-YB=8ZZZWQ@mail.gmail.com>
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

> >       kho_memory_init();
> >
> > +     /* Live Update should follow right after KHO is initialized */
> > +     liveupdate_init();
> > +
>
> Why do you think it should be immediately after kho_memory_init()?
> Any reason this can't be called from start_kernel() or even later as an
> early_initcall() or core_initall()?

Unfortunately, no, even here it is too late, and we might need to find
a way to move the kho_init/liveupdate_init earlier. We must be able to
preserve HugeTLB pages, and those are reserved earlier in boot.

Pasha
