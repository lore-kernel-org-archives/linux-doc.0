Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C2B2DE6ED
	for <linux-doc@vger.kernel.org>; Thu,  3 Jul 2025 04:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751518413; cv=none; b=qwtgkFQupnAo6QarbYMzTbczhxk2lWEgqdD2iOWh24X8UWS5dEn2oTJXEdv2i+Ci5Bq+3LnUwVdVlCCsYyDd3vxu6tw7tDpyNOg1vgDrbRVGXmdkL1GRnD8PAH1huCxOKO1GNjScPGfrrOaozfw4BroSqSTvsNtz3x06D6MIgQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751518413; c=relaxed/simple;
	bh=JzM7wANfHKn6i4YrpP4oOrQnJtQsh6/nB+S6KiV0SVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b6Sb4OkfHbTGb1VIHD4GWD8kcfFXuFTF8Fj3dPDk5FnjHeagdfN+unYmb8QznjnMlwjKlvtg4IW1m3cVGPDAmA+MHTfU8G+zSCf8N4Iibw3PjxRbjss1JtMOTPqKs8nKMcaQZlKPPINIbxS3l8g3jFkf9OvqStLiaYiGI+pYNXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=H8d2hAfW; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="H8d2hAfW"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553d52cb80dso530604e87.1
        for <linux-doc@vger.kernel.org>; Wed, 02 Jul 2025 21:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751518410; x=1752123210; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZmF/L2p456HUIg3Za546hwp7qXIBOPPq9FbhG7GL4TQ=;
        b=H8d2hAfWnkKs18AtMsHCqBVo/gpLEuDwnR+IOHjXeni1aPmvbV8KPKFaMC4GQnRJCD
         p4uYKxXicNt78jjtaktMc1+jQtpa+pyFmicWjhFa6x81R3bkyHIT4tsfYDsBCKpNJXfQ
         c3+xOybzE8fOqtftcrkJ0RZEiZuqT0BxZq9AjCd1yAoW8XPOHBzcgEszQy5A+P3/ezg8
         wSf6mu5VdkKQNGWDjP/uub9GlPFI9Z0MB+lx7IEdBuyt5oGeC3ILkz6ginFQME/Tc56I
         yFnExGyTp3cFzE8OW6zL5UrmFjiZG9qmhrmxCbjWWBwSz/pKYI/t/L36MH6AwiYUk2i6
         y1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751518410; x=1752123210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmF/L2p456HUIg3Za546hwp7qXIBOPPq9FbhG7GL4TQ=;
        b=R34tLoVPFVKnMbD2awUTAm8Tess9NlIebfMfHAP7qqRjXhSrpuxkkS3Jg7EpNFLCBT
         QNWzVKxOIRQ0AEFAmaHpwNuBXZxaZxQq3LdtLnVFnGFa9njEzHt/73lPDwcERbO/6p6m
         eT5Z65RMAmC+/sjpqXiZZRec3/nYrcRxilGAMdXdWOdpCeCfwJxO6upi2HSM4CiTGZUl
         kwfAWdC7Ill3/g/myTpEcSuCpsMNFkKFI5ecL39VTeGw4K/vu52M5bZ/zGDfJfKymUv1
         D4fSnk89PjPeZvaK1orHlmvaV73F9SogN8oHJBRHxIvwHrFBuJ+8l4+A+6VAieA4bm7F
         KSMw==
X-Forwarded-Encrypted: i=1; AJvYcCV56El+mSEHRPjYp+EzdyJyX90vJCPLtypn8CxfyogFVVCkfmGuHh76u5oUK4MDMyKC+Y7sXJOMDYk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKMkKuqY8I/GDU7ZzWp93hy1HGtzp5HqIAtMsUl6X0zXR25glL
	jLJQ7kni6ihQkEkB9YWDlycxl2lJqrSplmy60Y8N1NpgY/z60Mr/5mvvFmfXvmVuuD4KgtgK+9p
	Pq/ywnRqhv6nOnXPDMYtp8YxWMezZYXOL40Y3yBQqkw==
X-Gm-Gg: ASbGncvSmWlq6rrzJonCFoSIr5AFVYUAbM57dWlq1ByKPXquCtpQxnkqCZJscudRpmq
	JaHOjsVhgu4mTPzEhN6lXw6tmtMY8kb+WM1g1eiycFoPx8h1lp5x5TfKQ2bNC7jpL/SQ0doV80n
	nyv6xq+hdlvOXWASkTCUhj1ETTnoIIUxM6oo3hIJrL7w==
X-Google-Smtp-Source: AGHT+IH/FAKIrHEJXlazC1GS3IsFDF3FjC0xwLD+IqePmVprhBzw8tGnbUmbJUSRqi3/nuuao8O1tFo5dI9mh6VSnHw=
X-Received: by 2002:a05:6512:6d3:b0:553:a294:3f8 with SMTP id
 2adb3069b0e04-55630a338dbmr347344e87.14.1751518409988; Wed, 02 Jul 2025
 21:53:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702122434.1514328-1-apatel@ventanamicro.com> <871pqyl6fy.ffs@tglx>
In-Reply-To: <871pqyl6fy.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 3 Jul 2025 10:23:18 +0530
X-Gm-Features: Ac12FXyimyMGUONnu70iMw5omrnfnHHY2WEGOczm3HdWl9rgEIRzg39H08J6TOA
Message-ID: <CAK9=C2VvbwDuJh-Xi865d7ipjBO781hF+yQL7pPEef4wbkijBA@mail.gmail.com>
Subject: Re: [PATCH v3] irqchip/riscv-imsic: Add kernel parameter to disable IPIs
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 1:18=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de>=
 wrote:
>
> On Wed, Jul 02 2025 at 17:54, Anup Patel wrote:
> >  #include <linux/cpu.h>
> >  #include <linux/export.h>
>
>             ^^^ Neither in tip/irq/drivers nor in Linus tree ...
>
> patching file drivers/irqchip/irq-riscv-imsic-early.c
> Hunk #1 FAILED at 9.

I accidentally based this patch upon my MPXY RPMI patches.
Let me re-base this on Linux-6.16-rc4 in the next revision.

>
> >  #include <linux/interrupt.h>
> > +#include <linux/init.h>
> >  #include <linux/io.h>
> >  #include <linux/irq.h>
> >  #include <linux/irqchip.h>
> > @@ -22,6 +23,14 @@
> >  #include "irq-riscv-imsic-state.h"
> >
> >  static int imsic_parent_irq;
> > +bool imsic_noipi;
>
> __ro_after_init? No?

Yes, this should be __ro_after_init.
I will update in the next revision.

Regards,
Anup
