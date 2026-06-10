Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6784222565
	for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 01:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781053463; cv=pass; b=TnF8NNkBh5e9tmyThRrbX12tbmdcZJ9QOPKuPSdm4geaqMqyKWDL+QIXQG5sFeNoeNM3o/yzbY6fVbywfq2vRfJq2/egHIvP+AdKE1FF8LOj111zobhpR2EWq6kAL2i6ixiHlmJubIMnbJBBpfDsVe0//JysYqBpITj4JOWAQv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781053463; c=relaxed/simple;
	bh=4xThc03OT9rMdWbMfPKFLAzGxUKH3WR437iRvfZQFfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AtRPfLTf6ugQ4W+zePhIC1q56pVgw+ttSoapEw6ozEAqck4bqHZoxNDozPGtHYHhP6tyhNEPbPHqJs4wJYxbFm7hKrxfvmsbIyEuNKMbHyMrnGrNGIBWC/prQiyxa/pi4GZPEoj5JlUfuMFdinzxdcZvVVm2LlaGG2DXcSUlK0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=szrsohON; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="szrsohON"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bf1cdcfd6deso756124766b.3
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 18:04:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781053460; cv=none;
        d=google.com; s=arc-20240605;
        b=GWoF0R+uxXSWxTVu5GEM/mwpUeFjdbSVuIgHy5XoScT4ZZqe/f3BaIqgiM4XVjrRuk
         Ff08FQi4iIqLF8n/Bizq397PhJDrFlPpORzBZR0i6yta4KhuJnBj7EsRr6gwcCGgcOKx
         jpRBOfrSgskk+lBFZVpg/zNslO7xMgwW2j6+J+OojHiBIu1Qf6VPjWkkC2Px571+4Kjk
         HxhmZqQngjvVtExuKMNfMrl8fPNfLKxJad5MTB8Efbf0uBr1ra776BxVA0dS0kMsbemY
         A1JZ2jGtBbU83cRQIqhfxIO3369+Habq6TzL5xgym+2YwQV/khBPhqj/pw4N/Y8RH6PE
         0aGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4xThc03OT9rMdWbMfPKFLAzGxUKH3WR437iRvfZQFfI=;
        fh=WBfNmDYDhCQcxzBl81cisNuhrVG/twsS/noI3ZiCroQ=;
        b=ddsfoKJkR/E2T/bSIbl4QUcrpXS2rw5EufsAcEHrITGCZ9gNnQiLdTvvtP/qnXOgSg
         KbltaBcVYqS16fm0SOwk4ynT2QzJfm+M9KF3kWBLPrR3n4RZBp8kerh/cOfl5JDlGUFG
         qjKf4EXiDbo2uXZs6Qz8UX9FbxZmFVrlrfrdKKD307VAdXar/boIPFaGIn4FIIoT1uLY
         iRQOPxkH7YXQhylAOQxwGivzBxlke0lJ+QK47qejlNdizaHmCqrGil0pSYTLHAxr+CAd
         Xz3uMLyHVzfbpT3e+Q1BaVGgmwYCK6naH0UY0CK1xTggfK7zQDmX9D0uS/hAWniXyJZ/
         K4/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781053460; x=1781658260; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4xThc03OT9rMdWbMfPKFLAzGxUKH3WR437iRvfZQFfI=;
        b=szrsohONf6pdslu5N1fob5foXrbAIlXZipZMpbYPqHYYRINTIMuf8GSjjHa1hoh/iI
         cRxiuHEbD0QoWzlJDL9qzAiK4Ls3hEAMyNFwlZqFaFVk77StjRhXNXET/g/GANggXO7l
         gmogQRDnQb2PhkPWrTal77Lclev/C3GQzoybVP9B3JmTPQIedxzAbde/vpDruOvMM6rJ
         hMBzAh3O/wMUXaJOO17YUsOCHXzuucvJ5kQSH61f+1Yy31C7hvJ0Y74dqIpqsPPn7qsh
         BeaeUYTYo+jaVwLlxF+rL7dpUIYEfzulgARhnHOb518GfvzgqqZk/5CpRAkLpvT7S2YO
         9ZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781053460; x=1781658260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4xThc03OT9rMdWbMfPKFLAzGxUKH3WR437iRvfZQFfI=;
        b=oojvIUWJF80ctJSOW8RhXKnn6D55BewVHLGrWwm+2hmm9YOG4PL4gI5njwzn/E9dAw
         dGq+g/DMWlt4bGJDqklWYdtybJ5n1STCrpPej0uHVxnUUuBUxAmjfLFhIlsXgaUC1aSh
         EXJUQ0VLe9wunVesBCrrPka5RgAUEqaiemDWYt/sq7dy6Q5lqppgpOnMn34KfmC/mr0m
         tts/tfkW43B6djYrQuUgk0JEALKclew+Z30GwP0D8faa9AxSnCSCTbTCjvKQ46EEUrBz
         8/uTebpDA6rbqZtdsODN6/4nF63qdZAz4/PreBNmwZm3t39fZStTtC1YmyWDVmnK8GY9
         Cd3Q==
X-Forwarded-Encrypted: i=1; AFNElJ/LN69GQTNhuXZHHSe1e2Ql54Rtr3hx6F915OYB0iaWIeBttDKslbQ4YcIX2jCMlCP3Qf8PgDGVpB0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSUl3I86d0KYb3s3/3dcjOkfPj2r2fcgpA5T4/SQKssAm6Rq3A
	H20T0YefR8qJA7W32mKPac9sVReW6qFAyTlWk3jfXqpDktjqIbC6YNTkDBHC5SvnsNMlJj65Rjt
	/7Rn1pBnY82SZDsQ+0PoBxZIACZHkMvk=
X-Gm-Gg: Acq92OE18MfW5s1wJ36FSDnhG+TKIILYiLaUXvxRpZMKIPYst3ghUxxG0UIk1wy0AuB
	fr5xuEXFi/SCDCIbqddiuHEu7nCXa0mMbENhvc+rmARjy2rSHUpGXeDRrKqtSsH8dNa50GKmemE
	hL+CQXAwSth5yBr0kHd8OqwRE27D3U9Iw6UDtUij6G9qdLFdl3jWz8YmEe+0h3tGq5c1CucpPHE
	un4sbIkXuUHb8SGcbG5OvMCr0SMlUL//9cVnyKRBf0w01c67MSrGQTU43eUc/9oqzrQ3LnmMdVb
	Cwqfn4P3z9tGFKtiBA==
X-Received: by 2002:a17:907:180d:b0:bee:426:87ec with SMTP id
 a640c23a62f3a-bf373406e26mr1072354066b.23.1781053459895; Tue, 09 Jun 2026
 18:04:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260509094755.2838-3-w@1wt.eu> <20260609083305.2382925-1-safinaskar@gmail.com>
 <2026060955-zesty-cucumber-1a49@gregkh>
In-Reply-To: <2026060955-zesty-cucumber-1a49@gregkh>
From: Askar Safin <safinaskar@gmail.com>
Date: Wed, 10 Jun 2026 04:03:43 +0300
X-Gm-Features: AVVi8CesfF4bLT9_Snc2YXPWKoSW60IqNZaAXq7DWSN-_1Z-KtDb-T9FSYBGXYU
Message-ID: <CAPnZJGAKHu4rR8+W67KRQYVwRqi3x2Y+iWwhG7a2bY7oEawhfg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
To: Greg KH <gregkh@linuxfoundation.org>
Cc: w@1wt.eu, corbet@lwn.net, leon@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, security@kernel.org, skhan@linuxfoundation.org, 
	workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for answer!

On Tue, Jun 9, 2026 at 11:44=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
> > - If unprivileged user prevents privileged user from suspending
> > system, is this security bug?
>
> Physical access of suspending a machine feels like an odd threat model
> to be worried about :)

I think you didn't understand me here. I meant the following situation:
unprivileged user without physical access was somehow able
to prevent privileged user with physical access from suspending
or hibernating the system.

--=20
Askar Safin
