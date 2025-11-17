Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF4B329E7B
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 14:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763389378; cv=none; b=uDoBrPSpipcjEDTmzZ/HAJpbRELfIis2cVD65kiEg20NB7n14VnbXWEdS7IyLsKRTuUj65TDpZ1sllfcaZb+J5J48wnJZEdsyC2CkxXMT/K3wyqFL8TLtNEYgNXCFksHVU5CMQvUz5JRoCtKRZ2Ui+J5vF5tn3C2/yKLw/OS9xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763389378; c=relaxed/simple;
	bh=22TOOVurP8lhLhn356x7LpVBygsP/35IqHE7AETo95o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dUmBpBewwDacPIRp4UWyGfOOrGb1KQqH14bnjdF6996luNU32Xu0X1bW9SKoEaRWAC8/k3zVmpNyKHjZL1UnSm5NbLtZ1YPWs1fN07G1pgeoeKN+vn2jEsIdBACoRHa/aWFRvpVlrQamqZu3KTZWS5iZF/VzgRq1djIwNSFcl6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=C9kWu26P; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="C9kWu26P"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64149f78c0dso6705544a12.3
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 06:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763389375; x=1763994175; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BpEF14JwpgPT7D39g8XJx/NDIOdD//cHw6pm3Wkjf4g=;
        b=C9kWu26Pw4/p9byuZRGnNjEcpQsPMG9O6ctXPEHslznFnD3rcfL/gDLhJ5CdXmpujP
         tIHZ/t4lFXRqOsnV1G/zh9rcOejGuDTOrrxdnTlxwa5+Ma53UcVSuEJxQtG751x7RPpu
         gR9s0t165tInkHJG1UAvag/DUSveNt00L3XFmdp/YBuklDjNJMRKm7Fi2vjfGfdlyXSE
         eGrqqlwKhD/vlJALxRupTTDCRfoDrICCV/TBRctn1dYwGvqWV30zxTqJ0zepoahpkY7L
         jYCg8H+DpWjQD5x+FZgiwBXE+70p3HZ2ANoC/zxnSLrR/sm8FYIlZtfuz7xtZUDQRVXi
         RKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763389375; x=1763994175;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpEF14JwpgPT7D39g8XJx/NDIOdD//cHw6pm3Wkjf4g=;
        b=ssdQxrzFpN0TPTNQlnoCUzPqeKSwVG/TgCzv+TQwH86vwM0vrsySdZgd6abannAOw/
         7HjhyRz1QDfp84qpEZVd22OWovaPOn7numhN8zN7TNslMVrfu2NRKL5tt9FnYFVu69kc
         /5wbd+Tmt1ujaS5c2lbQI/+dNMPiCr1rblR2IBy9Yw6v6MF4QooZ2cJy/F/EHi/YIZnr
         pB9zeYFaQJjMIomtATd0+1PgOcO5kRPcdZNJy4AMNn/5/nLmKGwqDPKxI4r0SBj26E+N
         3K0TVt2SocR4UPdQ4lmW2Subn5bX7G86cZsW5jZuVKPL/GAhtRDnV5Tc9xwf9/6iRdQb
         DhlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk/ZHWcXD4VnN0BaaMF3yvfRGhLz6OOGacgYis+JIkUsCObikA0Z78VNTOW7MriDmXKCeV4B3kurw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4er18+ZICkKKA+vP2kiFueXX1Mc9VtAZ5ELBe07sJEjfDAJyX
	wa7H7SjliFx3vXYcKOuQxkEu+hIyD2FGtXAHz0kugaYdXZv+8rSZ0E7LCvwOLZaJMHpkcLWlYbl
	KbIJ/z233sdQfbtlOw922+rOtqTJWwy7WIv1vlhcP2Q==
X-Gm-Gg: ASbGnctmNNpUjyvee5J+hRLHhmOL/P6cVbWdxNMhvtswVo24v+6CAMEBh0h+yhGTbGw
	dACc7v7xvRyuYhtKfmzT9BsJHls+Oc2JuytJ4X+TwSMmqYvYANrzxMi7PuNKpk43VOxv+itvDJt
	iewVM0M5HdqJwLRfpK1uEiFWcYmO/sQewbLfvaCLikXHhXvAQYKwnUuxG7aWxWhrC/vfdemIjFA
	ykV3OpwDWe83yRbmwDp85n9pWyRwjuA9jzMxhbUiX/V+m1Z7DWOWfxHx9jEVPKo7eXDW2mb6h1x
	1qs=
X-Google-Smtp-Source: AGHT+IHa9YOzj6FRhxpEiiz0OGiVTh00SkAyRkpmpsCgXO3neMf5Hwjy2VuUd0cgFfp3qUhUPORhyn0xLdhCHN4dWSA=
X-Received: by 2002:a05:6402:1ec8:b0:639:e30c:2498 with SMTP id
 4fb4d7f45d1cf-64350e23226mr11650950a12.13.1763389374738; Mon, 17 Nov 2025
 06:22:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115233409.768044-1-pasha.tatashin@soleen.com>
 <20251115233409.768044-6-pasha.tatashin@soleen.com> <aRoGw9gml3vozrbz@kernel.org>
In-Reply-To: <aRoGw9gml3vozrbz@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 17 Nov 2025 09:22:16 -0500
X-Gm-Features: AWmQ_bm48MLbx6lEP4m9w_8Roe08ADT3jnLNtB7LP5zXsIF-E2LtaeNOwAhNVDA
Message-ID: <CA+CK2bA-mA+qnqWKtZdkCpQ5WpWdcEhwU6BTtC_FgRRT=OVVFw@mail.gmail.com>
Subject: Re: [PATCH v6 05/20] liveupdate: luo_ioctl: add user interface
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

> > --- a/include/uapi/linux/liveupdate.h
> > +++ b/include/uapi/linux/liveupdate.h
> > @@ -44,6 +44,70 @@
> >  #define LIVEUPDATE_IOCTL_TYPE                0xBA
> >
> >  /* The maximum length of session name including null termination */
> > -#define LIVEUPDATE_SESSION_NAME_LENGTH 56
> > +#define LIVEUPDATE_SESSION_NAME_LENGTH 64

Ah, here I updated the session name length :-) I will move this change
to the proper patch.

> > +/**
> > + * struct liveupdate_ioctl_create_session - ioctl(LIVEUPDATE_IOCTL_CREATE_SESSION)
> > + * @size:    Input; sizeof(struct liveupdate_ioctl_create_session)
> > + * @fd:              Output; The new file descriptor for the created session.
> > + * @name:    Input; A null-terminated string for the session name, max
> > + *           length %LIVEUPDATE_SESSION_NAME_LENGTH including termination
> > + *           char.
>
> Nit:          ^ character

Done.

> > +     if (atomic_cmpxchg(&ldev->in_use, 0, 1))
> > +             return -EBUSY;
> > +
> > +     luo_session_deserialize();
>
> Why luo_session_deserialize() is tied to the first open of the chardev?

Because at this point, when `/dev/liveupdate` is opened we expect that
userspace has finished loading modules that might register
File-Handlers, and FLBs, with LUO, and therefore we can deserialize
the sessions and find all the rightful owners for FDs. After this
point, we also forbid registering new FHs and FLBs.

Pasha
