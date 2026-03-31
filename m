Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3653A44E02C
	for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 20:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774988656; cv=none; b=laLMq+samTFjwYE7Be7mLP79N2YZBRpcNPjnnZuNVK9Dv1v3WQOwCrp2tJBXj6WSHkURM8DeoQcaGIoKaOI7DHCQVMC8eowiC63nNJyjda+SwnUv3JID3l5LWPjDuWCwJw8EHIF7aGAqE3j5BZ0jxMW7lzr6cZWYo9IbveIaa1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774988656; c=relaxed/simple;
	bh=MXnPS0QnV07SSDgjwdHCBKIla0I+UMjxd6c/XOBUKPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UzGAVJqjgYcTLYgsO0PeY3Ns0DW8k3BEQ8pmxNUvEHRSAzFRBdm76ztywEuTByEg145qpJ67lmARMw4Kpd5aTP3AACglSBBggjxtb3KomFr3dWW2xGjSzk6vtyA/py8qot25bNi5O+lRrKQ6hokFlGNgFeHDlZM47IRq87neMlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=AViZgVh6; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="AViZgVh6"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9825ba7f9dso48862066b.0
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 13:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774988653; x=1775593453; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c2ktyrPBG7CFlGMbOR9QYSgdZ9nvYimpNIw5oGP8BII=;
        b=AViZgVh6ejbZrOYeJMbtGel+0Cnp38TxSs+dHTyih4VM7Ar1FSHK5yBXB6pdMetkZm
         o1HNW6j/xHlrXe4357V+Tevdu4PNO+khBHctK4txELMP0nCOpBYyz1u2TtFEGmBjHZvL
         eUGL0ziGp7OTKjfQjFTa+5ljRgTNvSmrfCZ7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774988653; x=1775593453;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2ktyrPBG7CFlGMbOR9QYSgdZ9nvYimpNIw5oGP8BII=;
        b=X/NeEFkFtP9E1QV6BmQAf7tJy3bOtMU5/GS6a2o4OujTG1baxS4yYaqpMZqMeyjbuA
         969zIIP8Xu9VW9CS8x2bzRmS1s1uaGZ1hoaRiKfrkIPdQu6EcR2DXwTXwP4ADaKamPpr
         2YiFB4mvWIRKJoAn/fAXv5diIrItG57eJUxeUUJhQhmKR3VzGO+kB5pZBi8gmM8vr9OX
         m+wYl5qPDN4n6k3L+30k2KBoTXssNEnHKGuhHlRDfst4seHfXwFaxl6w2bPMYEr5hi/V
         49thLxjP6cBEHvT/hXvv+uHzyFUgpoI4BZ9Moav2/b8DxdrkK1KJcX3fhoK0t6EA2AEy
         WcJA==
X-Forwarded-Encrypted: i=1; AJvYcCU+2UUoRYJ5B5S4USZ26bwmAd+Ok2iv+RTkjUTOcLgPboZNDPodwvfbh544Hykf7WTNKpxolN6KSvg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7uEAhiTliasEafNMbXkziZbAX/byqD25iDJJRmgieTiPj+JnR
	0QJwncGjAFr8jNXQBwlGqf1TWJGSaOpfniMytUIKSzRdcU/HGxMmmpZJzVxEuzfQvgfaUQXG1hI
	oXeijcGJgeg==
X-Gm-Gg: ATEYQzxHSnOrab2HhkwMjsv2YgdGFLLKAOl0Ontdi4qOMux8Aq1pzkhbiHZjWlnSHlX
	pnNpGanpm7/AonCG6bULc8M4mgpOe9ZPYaffjRoUFywl0ki6lfFd5zmzL+O4Y+EFaZwfaR/aTdQ
	EXri+uqEHAo+GfMbQJY/cdTlIyv7WgMK/gnoo+AYf+fFuU0F25+TUV7YLW7SBQAVmuVoQ3ZYt7H
	mKpScfxEa4bzc8isfuo6Y35uPhlNl5eUYoHcUGo7zHAYt6qfM/CVhIiLcuJz9VcCtGLo/v+D6se
	KHQ0+iCUkND8z7tgptlTqUeZkSebwNL0AyEl7v90pbPPrdEorZlkCtuQ9sxQEa3pkzYP/A+bbxV
	dnV4xvCQiGBCDPBCwN2HGwQFK1PjRZ4XsMPpL428G4jktjCVP72I9XRGFkyK6bEJvVZAAgVC/Uj
	mSzX2gXXY4Pro19xeGtBwBi2I8hyKApmD/rR9HOMD+hbJU8uyN6N1eMfPdgembCDZWjLKNwZ8g
X-Received: by 2002:a17:907:5ca:b0:b9c:1337:706a with SMTP id a640c23a62f3a-b9c157154demr40786766b.11.1774988653383;
        Tue, 31 Mar 2026 13:24:13 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9bf9ebc755sm92991466b.3.2026.03.31.13.24.13
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 13:24:13 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-66ba9898ae8so416382a12.1
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 13:24:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXMXTWpa74jMB5ZlkFRGMBQiLVVusvhveYw+MQEdUhT4c5IS9l1l0Drwo13xBO11+Y6CM6lRBjVqcM=@vger.kernel.org
X-Received: by 2002:a05:6402:4489:b0:667:f151:2efa with SMTP id
 4fb4d7f45d1cf-66c338618b1mr3066306a12.12.1774988323206; Tue, 31 Mar 2026
 13:18:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
 <202603311253.95C54588E@keescook> <CAHk-=wjSOGaausLeTD13yAqso7qM09EnkDFiN7wF15kH0VWmZQ@mail.gmail.com>
In-Reply-To: <CAHk-=wjSOGaausLeTD13yAqso7qM09EnkDFiN7wF15kH0VWmZQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2026 13:18:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjo0gB6jVdRKj310atcM9jmmyr3t3VDut=FW0S9+v467A@mail.gmail.com>
X-Gm-Features: AQROBzAUONdaqkEjwnLXeyVn7Wp-adEWlZELPlH8sCIkK0YvCJHIOwC67Ju1r6A
Message-ID: <CAHk-=wjo0gB6jVdRKj310atcM9jmmyr3t3VDut=FW0S9+v467A@mail.gmail.com>
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

On Tue, 31 Mar 2026 at 13:11, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> We have a few years of experience with "unsafe_get_user()" and
> friends, and a few hundred places that use it, and while it's common
> to have several cases in one function, I can't think of a single case
> where we actually had more than one error target.
>
> I tried a quick grep, and nothing jumped out at me.

And the *moment* I sent that reply, I went "Wait a minute", and looked
at strncpy_from_user().

So we do actually have at least one case of multiple exception labels:
the first one in that function handles the "potentially unaligned word
access causes page fault, fall back to byte-at-a-time" while the
second one is final and fatal and results in -EFAULT.

But that case could have been written with the byte-at-a-time case as
a separate inline function, so it would all have worked fine even
without explicitly named exception entries.

In some situations, the explicit names may be very useful just to
document things: in that case the 'byte_at_a_time" label does do that,
but I don't think it's a very big issue.

And it's likely even less of an issue for arithmetic overflows than it
is for user space accesses.

So yeah, with better compiler support, I think that whole trapping
behavior would be great.

               Linus
