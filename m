Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F39A31282C
	for <linux-doc@vger.kernel.org>; Fri, 10 Apr 2026 17:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775843307; cv=pass; b=CUTIzNHD1TNaIppmKbur5ITm7qDg+9H+76nVTFd7kqbWTEW23E0lmRzzMweFOivGPkeWjnMDuVeaqOo3XFXWDd8auVqk623Y4uckfmGAIcDOLCwVpN1QBFE8DilmZFkk7bvEQn6f0eOlY1Oh7Zn0ZyJoO67YxPzCYATGu8NG6Co=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775843307; c=relaxed/simple;
	bh=fP8aWal1X6Qsox11Ia6GNPWsn7HNwxIrcnSxBo1eXxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q8isbOW5ZrmtzwwBaTPkAKBMxWMnh6v0iG876rZP86TzerGpVZOjnYw1e+w4vkjCt/juYin94jsHgYTrupWgBD9uFc4QQ6Nf0Wjc8fXoVGHlWQN9M5afCkCHZhPKJkIUi5k1E8WT8Dq3JU2Rs4WOFGUL28SracqmU/SGNRspQCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gSQDBema; arc=pass smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gSQDBema"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-950bcf4df06so668825241.2
        for <linux-doc@vger.kernel.org>; Fri, 10 Apr 2026 10:48:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775843305; cv=none;
        d=google.com; s=arc-20240605;
        b=SK5oxRasLlCnudHT4Mn91i8XbrGfBPNsxqvAaDyNGKY9ogI9lJ3dZqGYPR/LXzuPWy
         uE8BZNSBDIMRhzHSzECJZOZd4EWxxAYJ9Cc+ITnrdu8uoYdqvhbtU0hiZwoEoSLzfiuP
         oENVL5ahZf6qsqvedr/Z2aGtLPHHKAHnNuDkrIXjKF2TuM1KQ+pgJlo3QHTQ2rcSc+e8
         QPz2v+/ijhotb/VPGry5HrjFyAKNc3lMqREOZspWkkOY4OY9/d8cpERBIr8ISamctYbq
         PQp+5MxQPq3Xy9MYe+caNR8rwvrRwN994LT+9iRIxG5ym/aHPIjZzExFe43WIbHlCC2K
         r9Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/l4nSTrukrhbCr2YaIjwfXniIaAMtCTR7SdWmyWxQV4=;
        fh=KLU9MWNf6KWLNzauPAbH2QueHTCbyeN7EW7NBcuYGN4=;
        b=LRjVfL4GmLOxzx0QNzyumcEzpx4WzGHbp+883l4GxzgcKnSjN7x5KHrV0IinrLpxZg
         BzquWHAZ/Vq7t3y92PEdG3HGQ8sMTg9tEL/LPnQWtlUx0YmBCCJhJqDV3lOzNNUwQm0n
         9yZeM+Tq5lfNmMZXklNFycrCSYdKuZgkSR+sFyuAsZEYjaiC0sw2EeXve1kibIFiM8wU
         j5aQg0z1tyssegWcpuE7s8h7EFaGUTCzXLLdlqTuOq1RVV4oDQVlzCOHzdTI972sNe4s
         33JZldPBRtdF5ryM0xGnJXO62jE491qgvQPlFW/stRNpYtiHHo01x7rqHL4Qz0JNvQrv
         n46Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775843305; x=1776448105; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/l4nSTrukrhbCr2YaIjwfXniIaAMtCTR7SdWmyWxQV4=;
        b=gSQDBemaBCVuUAhLqAdtcC033WLVaTqXhhUHappsfe6OonnsPA7yp1uQmMHmVhBe2a
         2nt9DT+5/sSX7WwBAHuo9ICl0EstSMIMgeUPgX89Tk6yHm92trgWiK9dXxDj8N+818Wx
         5utmoj6/EC9kT0wzhmWOoVLGwSBQ8O+lkf9Fc1wqV7YY/LFfOBlvjfYblbiQdmkrKQeT
         br5P3wdF2Km3utxoh9CSpR7tXWe0AOEQ4yUnIy7rQafxKmIhJFFzXfgYZqYFxX44FySP
         ocQJbflhiS/n7FgV9vknSUAmp//xB1neCvPwFKx/e6t/APYZgGBLvtJ+jw6hP2nxn8h+
         Za/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775843305; x=1776448105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/l4nSTrukrhbCr2YaIjwfXniIaAMtCTR7SdWmyWxQV4=;
        b=Q4o+G6bTZ5CRFz1fRt1almkztA9Bo3VTAhppL1X0zVxiilaUV/0YUjxBTnHbq/NQNf
         Qqd0vtG1pSSRJ3QsFjsGtyUP+INgPojFQKHvgAVczozUo7tK5YzDyeljTcRgTqJRCyxM
         UMojuewA7uSSHX+7lLgCmIhfxz6pwW6Qn6yeQibPIySRPS7FEroPEqYG5mNn5U/lDHVG
         fSYs+ibfQJVXOMg/pHl0vDPMI5kEDzJQ9Q0FUPFD5khCnZTglD3q1RXjVfWRp/f7c0bS
         PlYPKLX5/g2INTFRQg2sCgIM/w+in98ufxBQKq4a8K2Uw7hSN3Hc6CxLqV22HqRJZnrm
         GT/w==
X-Forwarded-Encrypted: i=1; AJvYcCULInA0WOw+XipftmGmQxZcOZG1DVz19n9qw0ZAUV1M6gm0MffYxR1fIpcpOCcLUakicRYGWi3Xai8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwinDFvpz1sg2Nhv4X8UB5RrMDUxtinglBM5EGEf1ZunCWrxnX0
	zXXitOcmodz3wNg+gL/u3HNDMHCpWW14y+EC4WqMUKRWenPN4T0K29CJ5zyHeKPRMy3NeER7luz
	CUN0L5VtTmKSuHqAwobyLFMdQ2KQarPJB/E80uul/
X-Gm-Gg: AeBDievFjWC0Lr9hLuN6VcSxEnnZCKuQ5dinNuVqgqZ5fqdpf7iThjf6TRRUL5fDSnF
	o9aVfjCq7Y1Lw12ya8J3CVPCDo/fi+3DZpiHV38yBG9A4eK6pEWVEGorXZo6qQESTCFbNifroWW
	BvRJ1vImctJZytL/BZ1q0ZXu6Z7XLHHpOONe3HTKcbe1U2YQWGX1pqJKY4WvLdxypwU55NCx0Z0
	WH8zqNeHr/yYFfNMUvq33oFenp5cuNs0EthwGcEbupN05uz3JmyaWPm58bac8RuPxPkgwCtm/sN
	RmdZcJ4QU+kPoXPzxw==
X-Received: by 2002:a67:e7c1:0:b0:607:7991:f02e with SMTP id
 ada2fe7eead31-60a0125a157mr1913972137.26.1775843305006; Fri, 10 Apr 2026
 10:48:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
 <202603311253.95C54588E@keescook> <CAHk-=wjSOGaausLeTD13yAqso7qM09EnkDFiN7wF15kH0VWmZQ@mail.gmail.com>
 <202603311321.4EE9FEA@keescook> <20260401083137.GT3738786@noisy.programming.kicks-ass.net>
 <202604011328.D3821379@keescook> <20260402053840.GD3254421@noisy.programming.kicks-ass.net>
In-Reply-To: <20260402053840.GD3254421@noisy.programming.kicks-ass.net>
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 10 Apr 2026 10:48:13 -0700
X-Gm-Features: AQROBzBa6VKBq4ACJ1_R_EdvKeRsco9AeWVrSeipdWQAbkoYS53l26rCnLm5lXU
Message-ID: <CAFhGd8q_avLPfOsFkOd52eVJ7A50eKZ0HJo8ehqhG9P-s7P4-A@mail.gmail.com>
Subject: Re: [PATCH 5/5] types: Add standard __ob_trap and __ob_wrap scalar types
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
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
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 1, 2026 at 10:38=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Wed, Apr 01, 2026 at 01:52:26PM -0700, Kees Cook wrote:
>
> > (Though I would note that GCC does _not_ refuse the jump when there is =
a
> > cleanup; it only see the other two uninitialized values.)
>
> Yeah.. I know, but since we also build with clang, any such issue will
> get discovered.
>
> > So that makes it not totally broken, but it does make it a bit fragile.
>
> Right.
>
> > Another concern I have is dealing with older compilers and how to
> > "hide" the label and its code. e.g. if I remove the "goto" from above:
> >
> > ../drivers/misc/lkdtm/bugs.c:1060:1: warning: label 'weird' defined but=
 not used [-Wunused-label]
> >  1060 | weird:
> >       | ^~~~~
> >
> > Oddly, the unreachable code isn't a problem, so we could just wrap the
> > label is some macro like:
> >
> > #define force_label(x) if (0) goto x; x
> >
> > force_label(weird):
> >         pr_info("value: %lu\n", value);
> >         pr_info("outcome: %zu\n", outcome);
> >
>
> __maybe_unused also works on labels. Like:
>
> __overflow: __maybe_unused
>         dead-code-here;
>
>

Completing the loop: Here's the Clang RFC discussing obt label handler
design [1]

[1]: https://discourse.llvm.org/t/rfc-linux-kernel-discusses-overflowbehavi=
ortypes/90486

Jusin
