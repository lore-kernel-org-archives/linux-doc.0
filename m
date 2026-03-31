Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9449543DA49
	for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 20:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774987902; cv=none; b=SfztgeuT1ZrTb5TRSZeSIryz1EJhcqSLZeaIDKBgEkZtehWCFt466XWGaIydiuGre55XLSCvdoEFUnjsKF7qZkIjl1ZZA+Fu2TnSpqzu2MDRrBK8A59AA5scLls7I8FwUQBC2O6h/S+Azhv7bfv6iy8V2sArAHydt9OV+U0LODU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774987902; c=relaxed/simple;
	bh=Y/YFED/0OtgPfgeV4gPZ7asbBZssxn6FNaeq1L4CVTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i+DhDCVlhhYM3Yjqb1+mI2qwcdhFg4ynNDYa2Xh/Pd0pwuSqtvW4vQPcqtKFHkqZ/Z1AG+h8UhovGifEbIy4/W8duhKQfZTUfXxXBi5EJXDIWFenEJdR2igVr5PUKoTAedD+J7gt8/yJ8Hsuxs8TouCyzr+/ZX7zPXNw2WaIU/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Cl50b/2N; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Cl50b/2N"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b9358bc9c50so832542766b.1
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 13:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774987900; x=1775592700; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VcN9sER3VoMAwC3I5Sh98SVftLUl9If6/CrHtfP+ol0=;
        b=Cl50b/2N2ZbbbjHchHGe5WFhGcqUj1YtV5acYi12T3HRJJOI0LV42sSNbAxBYCMhUA
         iQCXfSYx4AVhib93DvME+g52qhVM5RnP9bouZZDXZRix7O0pR3tLnOSqOQ6qkuz9kESA
         Kyj++BD97045OD9NGBsI4cyBod8IQl8iE1x9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774987900; x=1775592700;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VcN9sER3VoMAwC3I5Sh98SVftLUl9If6/CrHtfP+ol0=;
        b=S/XGdcdHRpIxFVHvyFXrD7o2+HImwb7x1dw3cauRDJw4zvwyzH3dj8olr6TBDQv4Eg
         Iv29vfQY14qO8AzEje0DW+N8LqYk7lWQbqNCkqATTvoMBAv27eixtntZwG8JpisTrXtE
         PS+EEmNKZZpOrrEJDBww4jWfOsDvs/+/P4O+XY8QGwIAoTbTVsSJlIw+1YyJMdZ2D9I3
         AwwhbXkpbz0AhwY/LtM6pX5vQ+UftITfikVFYuzpEpaNC7Zs/NMxAec7kg3Su5rSndXc
         QnX5Fcg0Ef9LrMAEKn86R5zsnXSR4/nUhudo6lKNaIC3JTxJy7oGyCOH7+RangxvgdDy
         khGw==
X-Forwarded-Encrypted: i=1; AJvYcCUK8GGNEvWMyKT9JdIDg619DtfylOQ6XcnbP+kCJuqwoRUMaA8BFx6nPP/m2JtREPu6XfGkpqAbp0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlFPl4khvuiyyuYaAMqRiJ7PmAqnJ/2Y0aHaclp6GRD9byHV8L
	FzPSezroPwX1s8ocB659CbQK0roxHrGaFm/lU4I4x5ip9V0qNul1jey7PY5uZoOLjHMh24fPady
	Z2TnWn0KHgg==
X-Gm-Gg: ATEYQzzqLd+t3NLrxnJ2GRwKx8ijnYgy+eQihvsC3Y6J5021tCTC52l2yKvDMMN+fbM
	Ky13hsa8ffUg2fo1lwWsdYG4RTwmU/+zRtVgOsOUuSHzmUt5OJjcdzDyjum8f1r7/krWl8XSTqd
	ceSXGw5BFzGsZreNXdhnG9G+YaOYEbQSimDgWEUvwPcYFP7aHce+PFJ2mCBfUkg2P08wKuxTzK0
	x6dP0P87kf7f20nI8J9XAiZbLc8MMtfByrvoKrsiJ0zp5sxPu4DsSiiD+S7vOCQUKvjCLrYlIuF
	ZrZ4yV7L/69yfvJAm/6wklMtpL0RBBDokUIvEeu7X4IjQhwPNnH/3DN+lovtJenQ4UBcBCMfoxI
	2OTVJDPcPLT9xUJpSbjJb/WhTMhhyN7i6jAYhzAAtro6Uk3fVBX8/AU3ZYGGuesO5nLQNPN4BOH
	sevbPzJxcmApx7aT68qstmAM9em+yPHjerR3mJMw6U+Oaxi79LEV1VqQN8b/+nSEcuqwUFNJyI
X-Received: by 2002:a17:906:5ac7:b0:b9c:116e:eea1 with SMTP id a640c23a62f3a-b9c13b63f2amr52951866b.36.1774987899811;
        Tue, 31 Mar 2026 13:11:39 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c091331e0sm63110466b.8.2026.03.31.13.11.38
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 13:11:38 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-66bd4f7b2d3so3147133a12.3
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 13:11:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVm7JRu0q/UHjPQJd2yh0B7ezZJyK+dVrhakWvHAy/0Txpz9w1wshPs2Ek/9kDmFqXQ4nLopBYqkhE=@vger.kernel.org
X-Received: by 2002:a05:6402:210f:b0:66b:a9bf:41 with SMTP id
 4fb4d7f45d1cf-66db9efda06mr583269a12.27.1774987898160; Tue, 31 Mar 2026
 13:11:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com> <202603311253.95C54588E@keescook>
In-Reply-To: <202603311253.95C54588E@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2026 13:11:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjSOGaausLeTD13yAqso7qM09EnkDFiN7wF15kH0VWmZQ@mail.gmail.com>
X-Gm-Features: AQROBzCgLuTpLW2yBmTolIYlFODjWyPAxSyS-qNDPcZnOIgx-hYNdl2uT2sLn6M
Message-ID: <CAHk-=wjSOGaausLeTD13yAqso7qM09EnkDFiN7wF15kH0VWmZQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] types: Add standard __ob_trap and __ob_wrap scalar types
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Mark Rutland <mark.rutland@arm.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, Finn Thain <fthain@linux-m68k.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	llvm@lists.linux.dev, Marco Elver <elver@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Nicolas Schier <nsc@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 31 Mar 2026 at 13:03, Kees Cook <kees@kernel.org> wrote:
>
> Mark Rutland had strong reservations about function-level annotations,
> but I wonder if the combination of new type _and_ function-level
> annotation could get us something near what would be palatable:

Yes, if we had some way to specify the label, that actually looks
really nice to me.

So with _this_ kind of interface, all my reservations about it go away.

And as long as the compiler actually requires that label to exist when
trapping arithmetic is done, I don't think people will use it without
having fixups.

> Or we could make the label a global part of the language itself so it
> wouldn't need to be a function annotation, but rather a _required_
> element of any function that uses a trapping type?

Yes, I'd be ok with that too, because I think in practice you
typically only ever have one, and I guess you could use local labels -
or multiple functions - if you really needed to have different
targets.

We have a few years of experience with "unsafe_get_user()" and
friends, and a few hundred places that use it, and while it's common
to have several cases in one function, I can't think of a single case
where we actually had more than one error target.

I tried a quick grep, and nothing jumped out at me.

(And a lot of them use "Efault" or "efault" as the target name, so it
probably would have been fine with a default name)

            Linus
