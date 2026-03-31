Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7453806B2
	for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 18:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774981955; cv=none; b=hKqv4Ss5on6Z0kecJQbrAttWdawTo763zKK1X4PQQx7RancoRirdqKDr1b77T503uBcsO04A0XdunCQ13eHQp93heYA1iNFd08LxoaOorS9glBxSpOglrtLnKih0Z4q9/zDY5zvbVkSQT/Ewkm120wOAO6MTVXg0m7Vl3PDVTt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774981955; c=relaxed/simple;
	bh=ox6OjjUW3Qe6xBaqwUnJk6bmk2llYCPNtvoc4SxKSSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fp9nZJ2xYLPhtLuqei/d7EXmhfVyo9gUnmD+pEdyOu6la3aTm8/0j2+ELqPdu5ZP/qfcqCpczyKgGuoqbxWZBnt7RnqlQUyQJ4vsLrAzXz/Lu9YSuXeH4hY449+nyiYzjUkl9v+2CHRGZYDjSO4w9X/2dJg84b0ixaqlak5ydhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QNI3NuAo; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QNI3NuAo"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a2a8abac7dso4586760e87.3
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 11:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774981951; x=1775586751; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ag9HU1BRKwZOnlae6UtSCfLk/g8PIJV9tSPEI30VDdc=;
        b=QNI3NuAoGdjluVb/oIJOKjJmuFw6JF+PL7V0NHl0XEB+ho0PuUEYDtdddJ+s0/Cg76
         VaAyW7tvu+GeWusBoNnolxSyYGUnQxAXtj+dEblymHSFYMtU7Y5dixpT1IouPB89SMtM
         rMKLDV9DG56I6heKU0yEEWOg0Dh9FdSdeKqj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774981951; x=1775586751;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ag9HU1BRKwZOnlae6UtSCfLk/g8PIJV9tSPEI30VDdc=;
        b=rr4Iea8axd0N9jpwKYN35byLLjHTewx3hfxa1GK6K9FRfFspSg4+BSg1WPM3MisxcA
         Mb8iAW1d0VCyaDusktXHi6mnB75UrUX0LvnV2Ag0IOZ9VPmzgkW+Hz5lk/ZwUMtggolp
         HsH8YhpUD4Lxpoi9Zd35PIHdoZ3Zpu9E0JgQjK9E5N/Ev3NMQYVvuuevVuSUeEV2gqYH
         21vechk0X+ECzRJSsbNd2Q3Kt9g+ZqZzD8MU3ZKxcEjnRul7jSVCALSxmoU+XquofxNK
         ie0ANmbx+uIQqEbdq7D0ClwfQfBDhD4yZoVuWW0KFRjjghmEHTk+9h72K2hjCZVb5Gof
         kSmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNH/KsHyczvPRDvvZCpGQnq8UtaHZXSl1qH89qkmWL0l+cHwgarh1a5XlauXGrV5aQcHjRm63rGLw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHWiQST3X9bYzhEZEt54hm8Tmsim/QfIOeddBYIgXu0Ex49x7G
	IzUQBIaBnZv/i9y6hhWbRzvA7irong6qbz1c2fj/uFtwPfVvvuOhfiTo4UYylJ2oH35BXVOLSLO
	z+Ktd6YoK1Q==
X-Gm-Gg: ATEYQzyu0NW2O4W7RhURrIpehuw5vGdx6zse1RIpZUJZ58L+IXVqJTGhxZiMhP9zUYV
	twNBxH7byO02FVPLtGLqnAvH2msEdddBXHECIEivbDJClTyNNXrxSZjqJBR1of+A+NEdcN6CZQG
	0LQiIMYdOgYPj8EBkVq4T/YBM77AJ/6a94Pl0jqK6agaeFJDdqfYF9GVBgMZ6XQAku5P3OOR8dT
	ghuTDpBNKFVEA7dGUm1nJafx8qEi+T4wTjVCT9nLPmx2Ezdbds7jIoszkIReLLvXoVXhCTen4Lp
	YVIF2NTDm1QF+XGhuYAvjtWobLCOOPG5EcXKERtGsCTW7s6ncfzCJU3JZP0UXk2Mqar+UssfxLr
	e+6tsgO96olGL4eTYd9e97EKwvajL3/mjgexi97RHBHcGVk5x/jLHEshF6tDzBTRdIiYaAvBzAg
	/VXMUzCcigVoBnFhsUj1K3S0ndQvTfPL5juKZiJNoTC924wRMkqoYFvZ3ZIrfLFI5rAKN7qa/yC
	Ec1
X-Received: by 2002:a05:6512:3b12:b0:5a2:9605:d053 with SMTP id 2adb3069b0e04-5a2c1ee9b19mr185645e87.7.1774981951286;
        Tue, 31 Mar 2026 11:32:31 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13fd008sm2676773e87.19.2026.03.31.11.32.31
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 11:32:31 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38a2f196cbaso43733721fa.1
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 11:32:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXzx5CRug1yJa7iti7ogfUbwHpbtXujSABmIEL2HqCqFcJXdna5kSnp/88JMoWsBjDrmfc5XS32dqM=@vger.kernel.org
X-Received: by 2002:a17:907:8b8a:b0:b98:51d6:8843 with SMTP id
 a640c23a62f3a-b9c13b17382mr46677666b.28.1774981536085; Tue, 31 Mar 2026
 11:25:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
 <CANiq72kL3rTKyDNYmD7wXiKCVJSfa1bnp2L8NShXU7OPmWjJ4w@mail.gmail.com> <CAHk-=whjwHjmB0_2yXsOjDa7Mi_yFSx3AMd3vGk5r70WocvZZg@mail.gmail.com>
In-Reply-To: <CAHk-=whjwHjmB0_2yXsOjDa7Mi_yFSx3AMd3vGk5r70WocvZZg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2026 11:25:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgKB5f3MM40FGGUWUm_9eyESe2PAqCa6uZ=YTi0CdPwDg@mail.gmail.com>
X-Gm-Features: AQROBzBMzOVzd6q58CfNv9Gmf6_GDcPc6oKe55iXDcY89snM0DHbCtfJXA4J_DE
Message-ID: <CAHk-=wgKB5f3MM40FGGUWUm_9eyESe2PAqCa6uZ=YTi0CdPwDg@mail.gmail.com>
Subject: Re: [PATCH 5/5] types: Add standard __ob_trap and __ob_wrap scalar types
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
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

On Tue, 31 Mar 2026 at 11:02, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> The other is saying "overflow needs special handling"

Btw, this is why I also completely despise the current overflow builtins.

Yes, they handle overflow. But they don't treat it as some *special*
thing. They are garbage that forces code that uses them to be garbage.

If you want to use the overflow builtins (or our wrappers aorund
them), you can't just do the math. You have to do crazy crap like

     int end;
     if (check_add_overflow(start, len, &end))
        ... handle overflow ...
     do_something(start, end);

which obviously no sane person will do, when they can just write

   do_something(start, start+len);

instead (particularly since usually that "start+len" is just a tiny
detail in the code anyway).

Notice how it breaks up the code logic, and also requires you to add
random intermediate variables etc. It's bad, it makes the code look
bad, and people don't use it as a result.

The reason people like exception handling is that you can make the
fixup be done elsewhere, and you *don't* have to deal with it at the
point where you just want to use the result and with silly
intermediate variables etc.

IOW, exception handling means that you can continue to use the normal
flow of code for the normal case, and you deal with errors separately.

That is good. Much better than the "check_sub_overflow()" kind of crazy thing.

So I very much understand why all modern languages do it - but at the
same time most exception handling is complete garbage, because almost
everybody ends up thinking that it should nest syntactically, which is
completely wrong.

Error handling does not nest: it exits. If you have two different
exceptional cases in the same expression or statement, they have no
inherent nesting, and the order isn't even someting you should care
about. But they can cause different error codes or different fixups,
and they need *separate* handling.

This is why the kernel user space exception handling ended up with a
"label" model the moment the compilers could deal with it (in fact, I
very much asked for that interface, and compilers finally gave it to
me after years).

It means that you can move the exception handling out of line, without
having to interrupt the actual normal code flow. And youc an do it
without the bogus nesting that makes no sense.

So I think overflow handling should do the same. Instead of the bad
"check_sub_overflow()" model we have now, we should have

     res = add_overflow(a,b,label);

and now you can use a trapping operation *without* having to break the
normal flow of code, ie you can do

      do_something(start, add_overflow(start, len, overflow))
      ...
  overflow:
      // Maybe needs to release locks, who knows
      return -EINVAL;

notice?

Wrapping does not need this kind of thing. Wrapping is literally a "I
know I don't need to care", while trapping is a "I know I need to
handle it".

It's just that handling the trapping should not need to be done right
where the operation is done.

And in C, that means "goto". And I actualyl will claim that "goto" is
superior to most crazy language models with some "try()" block that
nests.

Language designers have been corrupted by "things must nest". BS.

             Linus
