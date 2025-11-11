Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670C535CBBB
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 21:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762894827; cv=none; b=uplOabSoSGvf4U1vAchtGOL6uPDMCH+GdVaWtN+46JlkxhA2tzVJN2b2UFkoRnsyJgwwaSnwyVq9/w12jv0RvDgMrw4Pl+f0ngXXSrnQvkPY92KV0r75CNMkJJ2vIUkwVUZ4nrtFrTeEcCJyG9Am3rHMbQdNqZ5uCBQwlAaUl2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762894827; c=relaxed/simple;
	bh=Fp+8AG6pBI0jJ/x1v+sgWdRn9Lp3GBtp4uOEuA09BJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r1EqhSaQtR6EIfiOb1S9ZMoJNOiviL3XiHhvrDFPT+d/kzkhz4Unwbgj831+m1ZAcKsd+ourTWXRQOo4TPJbLFXJUkxZL/OaCusSZPvT7CaBg1aMSeRE/YPJf1e3syQaWk78Mkjd8JFJsTwyqXd793jvQX0xF+hACpCnVn8C8FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=awfdXOPJ; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="awfdXOPJ"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-641977dc00fso152236a12.1
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 13:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1762894825; x=1763499625; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fp+8AG6pBI0jJ/x1v+sgWdRn9Lp3GBtp4uOEuA09BJA=;
        b=awfdXOPJLudXiU59sgZ/KAWFiTttCUDew6wPsWzJGbRX6aI0opyW6TbrEpeX0mDJaw
         kkxnZQzUoGuDtUafQowngoRnJrdoKOA0YBGoh0eJIwQ/RO4X5UUE9Df52tXka0swmX++
         9568gdp8kD6chvjgXunC4os2/bvF5/+CEZ473tvnDj+tmfglnytzw6EdOwodHQjOvUrM
         DhzqY6PScZRCVw4L4lDBTfzQZyuTnVOpOgC9Qm4Pii8HstZnVxSKBr30UP9X/DkUZoP7
         252iZD6C+OlZCWDzcI3uEMrS4f2sRa1bir0CLZJ1wGpJ/fEJc8jsuzCZ8BFgVklN3U4K
         4vQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762894825; x=1763499625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fp+8AG6pBI0jJ/x1v+sgWdRn9Lp3GBtp4uOEuA09BJA=;
        b=ZWYQtdV/tFThMKpAlM87RKtCy4BHSflsVtvlvf90/WwFGiegmVkTzzzrPrVKdyvuEe
         MeqQcAT2sGagwNi869o2RtKXEg5f2d5RhsACtCWzBvFSPjKCjlysOGiwoBv5gCwGV64L
         BgSfrJggLsQS+panpMw2V8CIhKFCiEYxI6aHA2onbkggrDiBLfir20uCkVbxK2Z1GVTk
         lZaaMSFCXSfHupUIaP9iUAm5oQxM8XpGdpDsYRqv6j1OJzf+Qu761cW0WlsK4eqCfjER
         wJr8xyvLvAdR77h71gw4mUqFHsVKDxq1aZ6HqnvIplfGKoI7dAYBNtVDuA1s2dgUUlY1
         FXTg==
X-Forwarded-Encrypted: i=1; AJvYcCXRgMC/VJY6u5vuqddh/C7lG2gPUDRgQPxLyrHkhYnZdt17Jqff4dfW/nX0cv5ne9dL5hm7p9GV/UA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrPhCpduUc+O0lrkdXx1vktEEY8XJkT3of5Yn29F+JM+km/Lu4
	JBJJV54rvAy3IK8dBNLdnyCmWw762dE6hqsX00jKtZYDNXPW9vDv83iW9LD2iSMYLg2WXEmWBUP
	g2rSvUTTeLrloK8KGArvx86UdsLDiQTeV72VPazgbQw==
X-Gm-Gg: ASbGncu2x9H24cxp+o1PUnGZeyVYa+gDNhAmaXkNuAETRwPTi5M+QBZaXKEplBGKgQl
	YoXy6nOk00yAWIjHacchvCgrNAR4qlQ9RXPfWPdVLzqClDS582uCVShcAlqBNE4019Rd3P+aSjg
	tw9ricqGB4QSWR7Yeui6J8vp6nw4LYFnAnx6npllD2aYrFYOZeV1TxZ/aDd7BslDXKiiZH2b5+i
	koxqOo4P593Pe23hp25Zbz0jpGrVTvyyXYVWwZxCkkEJWNUDMFuVXxzqAz5KvOvwNBF
X-Google-Smtp-Source: AGHT+IH+e0YsGvHk4dFv4/hkj2NgB2ttZSxI+gZm+9yj2ImFkWPrLek2DaIdjfDu/vAiHUMqP9wuFNVI+e9wnD3MABk=
X-Received: by 2002:a05:6402:51c7:b0:640:ceef:7e4d with SMTP id
 4fb4d7f45d1cf-6431a55d74emr573319a12.32.1762894824747; Tue, 11 Nov 2025
 13:00:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107210526.257742-1-pasha.tatashin@soleen.com>
 <20251107210526.257742-6-pasha.tatashin@soleen.com> <aRHe3syRvOrCYC9u@kernel.org>
 <CA+CK2bA=cQkibx4dSxJQTVxVxqkAsZPfFoPJip6rx8DqX62aEA@mail.gmail.com> <aROaJUjyyZqJ19Wo@kernel.org>
In-Reply-To: <aROaJUjyyZqJ19Wo@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 11 Nov 2025 15:59:47 -0500
X-Gm-Features: AWmQ_bnYdSMroRMjjVnLSAE6-uLxVnY6rxuibiqAyIlNle_pZdH3zG6_TS_O-10
Message-ID: <CA+CK2bAwfChKVNtHxVi3NWbE=LCLFacB_tD=ZamM-2UTNHOnzg@mail.gmail.com>
Subject: Re: [PATCH v5 05/22] liveupdate: kho: when live update add KHO image
 during kexec load
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

> I believe that when my concerns about "[PATCH v5 02/22] liveupdate:
> luo_core: integrate with KHO" [1] are resolved this patch won't be needed.
>
> [1] https://lore.kernel.org/all/aROZi043lxtegqWE@kernel.org/

Thank you, I replied to your comments in that patch. However, until
KHO becomes statless this change is needed. We *must* have KHO image
as part of kexec load if liveupdate=1.

>
> > Pasha
>
> --
> Sincerely yours,
> Mike.
