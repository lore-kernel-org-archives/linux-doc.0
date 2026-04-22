Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8604C3D3337
	for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 12:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776860247; cv=none; b=knkDtXmQLF3Y5LApdeyJQ14XnrkbmtGtO98cXf7DUfCDeStSGtMJj4EpWYVjVTuIyMw0B3qtSvLqYK1chew/7Q+f40NRXhhm5EBh7eC1hmu7NXthRkj79cDtiSXPQCbpLePK2xnpfLW4HD/AnbJVoGthfSW+h3okSVUNwD4Rz9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776860247; c=relaxed/simple;
	bh=8liP4h/sSukob9NZJj2ZmMwY7hrnXfLoNL5qGOQZ7wg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OSvYqBr7oGobOWK8kmpNo5IAbI+qOR4kWQN0N8vxmH4s4tWnW9krIs67eVZjV7ja3yzm7kR32J5pXV2MUNUTi1qpJNnEbjue89UwSLFVbZ8/w0Zvgcafb4gChZNaHOhRR1/ro5OnDE2wpDk9jPP1dozrLka9hfo/5IaZM+5S6e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56faf1cfe04so1409728e0c.3
        for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 05:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776860244; x=1777465044;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9Gk7NlGx3Pa+KYEqbz8NqB+qEb7KkfrgOz9kzX/j7o=;
        b=ZnDlsKf85FzYHeG5lawc3z4oVvg86eHtHV+XhLWp75rhUTltW0sFko5+vngEm5qyRk
         wBnU7WkgDuaa4tDiKRYcFTilhHCoVj2v4YT8GncrsbN/h1B0oltMQ+UBEPy1dgOd1tf4
         c3S0yY1W+zTL1ce3ObgBOsSURpJn/mJBGK0dK7bVz+SNGcktkjQzTqSd8fUqLDS+XUL4
         5+ePDou9FTK0b0vWklFHq19k/lLYrPMv3baAl/rl3OC2HEfXgj2xvxw5bUNLOAe76kkQ
         SY48lX58wAFbuiOXwBsz8QCYusX3lYdACWwKxE9ZLVX+186cInZt26Sjy3db+6buJ1Km
         LNww==
X-Forwarded-Encrypted: i=1; AFNElJ+rmWhd35QkitqeFsnM0rjA6/V06sha/hwzPr1C0MadXhsAGI6nzNs/e4bfna3p9iVQYC/DuaAkX3s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzKqoKHVyaz4SrXrr+WyMFmIN4NNxPVhT60NSelgnCBHR0e6Vp
	RuP7B7LM3wFnzghxhm8D/ADC1StaP+ubraDIaCs4ojb8qBLSwPPnINRzflNBPaEXJFc=
X-Gm-Gg: AeBDiet5sUX98WtpV7lLz3VgeduKLEaPxt7WGeYDkgCeP05Eag230XkYET8+kZvCau7
	jdYaxs0xl7mpAzvMjspbQIBH64mzlroE2gYaTS8JST4P0zT388Ht04opfGyiBjJUbpLEI/edOfV
	m07iP8ZvN1U3aHEGY4vnLgvPLeTR4LN0BFlpuXMTw5yc9IT8QjTrA2VHmQWeaobnZ17+o8X1BDP
	AqXsqxxVI5j7M4sq2lXVlU5MMfsX4KPbLL4f+Civa4JNWIKiIjR8lW89tTKoCmNihzY94iomBaI
	qZKmFILGb4wkuD5dngW9qlOb9Ym9bRAGHnr4NVjuaCJQjb1p2fMiXaLewaajugy28S8iE4W8gh5
	sDHOE9DQ1Z5o3ZeRyTdG8Tn1JEHxkfbCv7Py9kXyAFea36nZT/xLmf91Rw3eMCruanS3bAK+QmI
	n4qP6n2hhjyPXK4clNTyeFDjGwJipQRJ6y8+CjCSbiL3o7L1TIRcMHflvB/yF98x9FBy2o7brI6
	bk=
X-Received: by 2002:a05:6122:e191:b0:56d:b639:5c0d with SMTP id 71dfb90a1353d-56fa5a4666emr9728664e0c.13.1776860244419;
        Wed, 22 Apr 2026 05:17:24 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa92f2207sm9441447e0c.10.2026.04.22.05.17.19
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 05:17:20 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5673804da95so1648855e0c.0
        for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 05:17:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8/jlCFJNEC1jS4Im7B8Ru4CAiEolIPq3pTtBwaC6DTggbQ495kZLlBcmS37ZzAkkyvxgTIPiHm+HI=@vger.kernel.org
X-Received: by 2002:a05:6122:a5c8:20b0:56d:a755:ec64 with SMTP id
 71dfb90a1353d-56fa5996d1dmr6692406e0c.11.1776860239548; Wed, 22 Apr 2026
 05:17:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421-v7-0-0-net-next-driver-removal-v1-v1-0-69517c689d1f@lunn.ch>
 <20260421-v7-0-0-net-next-driver-removal-v1-v1-11-69517c689d1f@lunn.ch>
 <CAMuHMdWz=ucmKxHXmzKj=oTn6yMVxPnkNxtG6X2C3ts_ZCg4Cw@mail.gmail.com> <c6696785-6f1f-4747-996a-d86a60a23d0b@lunn.ch>
In-Reply-To: <c6696785-6f1f-4747-996a-d86a60a23d0b@lunn.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 14:17:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVwFcgDBSSKWnPvk=PYHrMpLggD1Kai5Lwgzw-B1bjSug@mail.gmail.com>
X-Gm-Features: AQROBzCGeOoH8mPu3oeUJXSUmUlNNIiPpoOzPEq6pycWYICdTP5qPjzGmvFicgo
Message-ID: <CAMuHMdVwFcgDBSSKWnPvk=PYHrMpLggD1Kai5Lwgzw-B1bjSug@mail.gmail.com>
Subject: Re: [PATCH net 11/18] drivers: net: cirrus: cs89x0: Remove this driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

On Wed, 22 Apr 2026 at 14:13, Andrew Lunn <andrew@lunn.ch> wrote:
> > > -config CS89x0_PLATFORM
> > > -       tristate "CS89x0 platform driver support"
> > > -       depends on ARM || (COMPILE_TEST && !PPC)
> > > -       select CS89x0
> > > -       help
> > > -         Say Y to compile the cs89x0 platform driver. This makes this driver
> > > -         suitable for use on certain evaluation boards such as the iMX21ADS.
> > > -
> > > -         To compile this driver as a module, choose M here. The module
> > > -         will be called cs89x0.
> >
> > This is the more modern DT-based part...
>
> No dependency on OF?

I guess no one bothered to add it, as it presumably builds fine without.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
