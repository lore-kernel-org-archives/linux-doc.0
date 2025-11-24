Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783B7259C80
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 03:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763954059; cv=none; b=CLZfgG1YjJw81t50cykOZm/5hXNaIfofh2yuCGvJRvV0eYr4mrMSUCdDRqkDZ211URnMxhXcyGcMykXphdp7b2pA3aiGtSjs3IKiU1Agge4MsEudxqV9Ll0Zi+rs9J/UbQ25DyuAoVkGnJwhwBTdKhVfCrY5l9Twz7WjnelqU3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763954059; c=relaxed/simple;
	bh=m7otrMWhBJM9ta+y1m0Kw4P0enGP7S7+XlIcKLt3qIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Skr+MBvtg1jY5UG8w/tFbhY10wkVwlxdXXK0TsWlWtgFvAGnYlQPuDSwkey9Tr1/xGBK54wXtkD0PoVATDhwq7GcZcErzhWZEOZ7H9HjR84sLqYdbBWZrcsmMiLUHygQYrqHxI2qxwwbIf+J2enaLMdCxiOwlUnkTCe86JZmkYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=R4zZTJYQ; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="R4zZTJYQ"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64166a57f3bso5777656a12.1
        for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 19:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763954056; x=1764558856; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxWYYzGvXb7lNtyybtYmnOldPsxEU1v86JbAWbqU92g=;
        b=R4zZTJYQ8Edmu3CjI8FZOt/tfdZatJjJcfAnV6s4bUjJ7ZvQ2Rhh8ANNQwYJ3gEhFW
         aKrU1gfMUEmN5dFsBaoNhUY755lzg+dfdtvUy2lzSsa5I3le9CcVjjWNZYiD8ltWAgke
         bBxvhn2XQY8NoS6KDwNBSmHkjfLKlXQawhVpmJ+cshiKRMt+t1RX3g5gVgsbex1YmWIT
         Tyn5wnvLUs83XXipjPoRo1I/+Tq95WlZV/B6j04eTpcQPONgVJJZzo2oEg1W4p5gDEmH
         vEM1vIVb4NhurLHBy/CRhdm3dOTdI/nYXzd0TrZl4OJRdMa8+W//S9b43wGhiec6HwLv
         EqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763954056; x=1764558856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZxWYYzGvXb7lNtyybtYmnOldPsxEU1v86JbAWbqU92g=;
        b=XSiCQ2pXA3o0gDR/AVfU1O305PzEOVHeF7DaSdryEWhV//ll+DlPqOXft80oR85/9H
         JHbF3SIonviom37+CTNuQpPWKrZ2997z5B1kjHvQ8Go9guoCCp35hA8B9/E695geDHkt
         7PpBIPZJGYcPjRcSXIAgx1ySzCZaB11L2QsVmwghCThaYnilSSmOaDaFmDizfAsYHYgv
         ZBoM+MZNclI1CFonFOKFtgPQp4WFONFFReKdj0KaPXcLcbPxkt5QMhyLwo8aotW7rioQ
         5BQtnbNGiggSKgWT0V4VyJfVNy4D9DUfItfm2fAEWSg7sMw0rVhDV2dzA8vAIh63pVp3
         OYzg==
X-Forwarded-Encrypted: i=1; AJvYcCXvz5m/jKtrdk7Trx1PoU61ihhZyIsxeisSpkWRjo6R9ByFzz5QW8aBPEwt5hvsnvdb+xVsW0bntMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1YpVUCfIjGyRwkuGiYlJa6yAcbDVFw1yFr59+61bmKyVXzlBg
	Sks/wR+kgxyEKJpwVScez6SnKzILTC0LU0lN4ndfnLVYF4Zi+T2Ah+3LSoKnikqvbYHCDjPp/im
	eemnqtbjofZnvY0w/TbsUmYgyq9ydQXMiAZXy4mCQ8Q==
X-Gm-Gg: ASbGncsr4sS7zIdX5TPgrOcKyyodXGtC+hTQ8R1cdvp7aQ3yOW7zcRPDqNsJcs6YKbc
	HSsKxYy1c2lLPqRJwNL2rgYTF5Y/GD0W3U18yNzR0FkrGMBoJ7n7W805Cy7MpOXh6a7A0E9LRx1
	z9elGaE12hv2Q9WlFPwNnYIHtauBNp1DQggzVMMYS8dELHUDwsTVsNhr3wjwC6paKSxS5/EbuUw
	PtUUbgoLqjRHMj7St3rr+wg+T6h0SeuLLS0Fj/fyo2WMDMdG+XBWQ7eIEP069zd+ByL
X-Google-Smtp-Source: AGHT+IH67JP1UaR3gpoqZ3MrgHkQzMQhpp66V9UPwtAjbwPOvJT5SkZilFWd08WjSbu3wTcfKGr6KSLWlhGvqm+wzqg=
X-Received: by 2002:a05:6402:40c5:b0:640:ebca:e66f with SMTP id
 4fb4d7f45d1cf-6455469272fmr8497105a12.34.1763954055610; Sun, 23 Nov 2025
 19:14:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122222351.1059049-1-pasha.tatashin@soleen.com>
 <20251122222351.1059049-15-pasha.tatashin@soleen.com> <aSMsqD5mB2mHHH9v@kernel.org>
In-Reply-To: <aSMsqD5mB2mHHH9v@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sun, 23 Nov 2025 22:13:39 -0500
X-Gm-Features: AWmQ_bn9jKi7Ktx8U1VC5NBm-L4AbZd5N5WS8ORgDcSjrzKv7tbGyIW2qlGBRlc
Message-ID: <CA+CK2bCrNC0uYdXbC+JK_bvk8BYFPSL=ZbTZ_T6LMHtoum+Z8Q@mail.gmail.com>
Subject: Re: [PATCH v7 14/22] mm: memfd_luo: allow preserving memfd
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

> > +unlock_folio:
> > +     folio_unlock(folio);
> > +     folio_put(folio);
> > +     i++;
>
> I'd add a counter and use it int the below for loop.

Done.

>
> > +put_folios:
> > +     /*
> > +      * Note: don't free the folios already added to the file. They will be
> > +      * freed when the file is freed. Free the ones not added yet here.
> > +      */
> > +     for (; i < nr_folios; i++) {
> > +             const struct memfd_luo_folio_ser *pfolio = &folios_ser[i];
> > +
> > +             folio = kho_restore_folio(pfolio->pfn);
> > +             if (folio)
> > +                     folio_put(folio);
> > +     }
> > +
> > +     return err;
> > +}
>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Thanks!

Pasha

>
> --
> Sincerely yours,
> Mike.
