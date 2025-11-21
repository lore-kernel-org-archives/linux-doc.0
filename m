Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858AD36D501
	for <linux-doc@vger.kernel.org>; Fri, 21 Nov 2025 20:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763757330; cv=none; b=f/MjpEjFlLOqS/HYwjAgwVfad0vP+C9zI3RsFbGprMR+Oio4WkwKYwVMO6EG7NSqubX+sl0ut9bMv87+qLSstfza8/+56QI0bXxH0f+EhXqC8na2cn7ZyWcTjA2LPHXGBb4y2nYsWKQUjeV6zs25g8zHLF4ookWjp4uU0NlIurU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763757330; c=relaxed/simple;
	bh=U/5ladtYidflML6s4OrAqI221yvscW24HxOAkdlAfmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mtc4teoWRGK4E4md1pkrFJi/fLeB1MN/IIZR9lXsCBkRcHmSlBuQx16XD9iZi/kHSRDE8P2NcE5ShXet1oNqi3ZG1DWh3eoPWkPJl3d3P2KXOUAipQSGDmHYtxXV/sQ3Bs1UwPbrcE4qstnqrZO7RR2wRSfgbGzBvDfabnAGO6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XSIOwzCU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fOzOJyte; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XSIOwzCU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fOzOJyte"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763757327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xpP3f6s7o7DkpvWhu11EBIJYJfR1yRr60txd+kK3L6o=;
	b=XSIOwzCUCEwkSmYaSDJi6LOpWnwHXKzqCDx3DXlDyocHSCjlu7KunbwUNNJEUB0mJWsiWf
	ozCYd/ZVZZ2gyr5dSqM7Qs7BMxYU4+BmjMXXww0CZm0eMD2Y5jejgOFz7Uy18yF3GerVWU
	gAd5xvmsCLGbGxKLMDqJSApxr7UCnyA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-Nd1fHb64Mq69XFtAtzXT9A-1; Fri, 21 Nov 2025 15:35:24 -0500
X-MC-Unique: Nd1fHb64Mq69XFtAtzXT9A-1
X-Mimecast-MFC-AGG-ID: Nd1fHb64Mq69XFtAtzXT9A_1763757323
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b73586b1195so35975366b.3
        for <linux-doc@vger.kernel.org>; Fri, 21 Nov 2025 12:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763757322; x=1764362122; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpP3f6s7o7DkpvWhu11EBIJYJfR1yRr60txd+kK3L6o=;
        b=fOzOJyteUpKDylMeSh1AEAZs7z/yGpuM2+qFEEytL5Qes1PZPMEeJcEw3eyK3ZccVo
         5+VWQrSHRnGm7BjIgw4zf/AUd0iRwFZaadCzbljpoCPAe6GbjMTRH6pLHxGmD8LAJgM6
         bqpmzpftYHHN+AYV10/mbQVEJD1SgSGfgNPsR/TZqtp7NLyWOd2D4ogk9W3ndEdSoEAP
         6vwrjpJEuYcXtg7RElTWw9wje1xBxDd8pEcQa7kkM+ZldYa5+yuG/2ioEjEszezA8LhW
         5yuPsiaRKc/pAfVR0DkNCwu266j55/es5CwksGfDMnzmUx/OCRQnVcVFVTKMkNKVS9UD
         Ux2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763757322; x=1764362122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xpP3f6s7o7DkpvWhu11EBIJYJfR1yRr60txd+kK3L6o=;
        b=BQ8uQzKax32duoadwj1lG1P1zz0Nf2TwCDyTouX/TUq/5I+lgYv7fOX0SRn69RkP3L
         Dcv8YxxXpel0A4a1HaQYhCMLpYHYRBGCsXSEhMHdjVzhqbRS/h5okVOOQLlpopxgfP8u
         KkTlLCbpTij0bDDbtV2QxtiSy7Hjqaeg9KciLcjcxKthn/gy6Pyw/j5bZrZE4p8adsOF
         fEt2i9bVafCaNzEW/16eemnX2iffMlcvaB0kdhZSzITA41yEqFlHSf/IR/TiabpVgsoA
         ePLcTWuDg7xpRDElqxTdgGgBg0M8x4XpF7Z3kCCaK1Tc2qT/qqOQoU94VAwIWXC+ilRe
         8tmg==
X-Forwarded-Encrypted: i=1; AJvYcCUVXiP+rprTY3j++r65n0DQNPnWsGAEXC4D/1g3ZSPAPLVyuc6y9Mz76Jaux0kIJAh4YWRAQgX+fr8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc6X/A5gkcO8wGNeuJVbJaXP88o2wHv6LFVkIhwytn2G1MpOOb
	c++vHblzu5CMDAMUfP1yp5X646kvUDQvkYo9f1moj9vdPDU0Ov7w6nDzBgtLVMCVpDHGwZTlV0J
	5gCda0wYaKjw3+MN7jPoGwpqIU1nES1bMzBhCdbjN+3PCEXru9WL9D2DSwzmk7QDxd4oj50lo/F
	HSrMtRkP/hLOtHRleLqk8LAavOvqesFJ3UWlmmjtePOt30
X-Gm-Gg: ASbGncveS8dPfL/uuGGD1baqRLrGzXyGPL/tAv94IkT2f8qaxr0D4/1OyVWBITbrlBA
	3AVinlY8yd64gWam9wbECub7FUXzUrfEPLjv97Wf3fF8BLs+b3HH0TL3UUJ9L3NnDtJ/njQ1yzc
	PRgMyX40iERPhYl9tK/ZXlTx5DhbqDC58cYgezcZgW3Lu0ZRf9cismnn10S0aQOd1nIQ==
X-Received: by 2002:a17:907:a0d:b0:b70:be0b:6ba8 with SMTP id a640c23a62f3a-b76719d9598mr357318466b.61.1763757322497;
        Fri, 21 Nov 2025 12:35:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH5MoiqHr6rhZgG9KdrrZBJ768U2Y/5SFSstIe4omCdXUnoddVoCfAm4oVtNeszH2S4MZnX+cBp5U4IMWzXLVE=
X-Received: by 2002:a17:907:a0d:b0:b70:be0b:6ba8 with SMTP id
 a640c23a62f3a-b76719d9598mr357316566b.61.1763757322113; Fri, 21 Nov 2025
 12:35:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
 <20250925-eager-delectable-frog-fcbb5d@penduick> <aNVPqHldkVzbyvix@redhat.com>
 <20250930-brawny-pastel-wildcat-4ba8d8@houat> <aRfH35-jhM-qOrbb@redhat.com> <mbbwnxoik3qhy6gcwglfdch2v2gdhz3uqoaeu3xujnec6uwnoy@lqexuvwyjyny>
In-Reply-To: <mbbwnxoik3qhy6gcwglfdch2v2gdhz3uqoaeu3xujnec6uwnoy@lqexuvwyjyny>
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 21 Nov 2025 15:35:10 -0500
X-Gm-Features: AWmQ_blS5eHoTaB7NGOUKTkyFQvIfdmnCSJ2VTwhtLeyExoNDVIvf6A57OZSbO8
Message-ID: <CABx5tq+iOpwLDy0VaQt4k9mLyAb8SF3WGHPFh+rwvT9=J4ZnKg@mail.gmail.com>
Subject: Re: [PATCH RFC v4 00/12] clk: add support for v1 / v2 clock rate
 negotiation and kunit tests
To: Maxime Ripard <mripard@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 11:09=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
> > I'm giving a talk at Linux Plumbers in Tokyo next month:
> >
> >     Fixing Clock Tree Propagation in the Common Clk Framework
> >     https://lpc.events/event/19/contributions/2152/
> >
> > Stephen will be there as well, and hopefully we can reach consensus
> > about an acceptable approach to fix this.
>
> Yeah, discussing it at plumbers would probably be a good idea, and maybe
> try to record / transcribe the meeting so we can have the minutes too
> somewhere?

The talk will be recorded, plus I'm sure there will be discussion
after my talk. I'll post a summary to this thread with the next steps
after Plumbers.

Brian

