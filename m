Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BC13E6391
	for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 20:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774990738; cv=none; b=aVP+lnVWzQiaoZ3nEjEKDr+YZHjz1BxU2nbQeHDbcietKSFQgoLt8fIkRM6uNocxWEKb0MZRRO4mA9A+uoqhcvNY//CtpGDwwhwaD1LiUjT/XObhKonvAtLpsokgVH/ZwSn+y007whPPfmlf5gM1kMfgsG6kf5/LL52wQKXWgoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774990738; c=relaxed/simple;
	bh=JdtX1HxX10vKkEIJTgN8UNt8Jx8wkMFYsFGA9S+Pp3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bcIIw9ec4adehziKaM0qy6pvmZJTAxEDm754efqvjgzwe7U0Fp5jXI8Ij2wkDH+rh9RcOn0yW2ekS7ONKoNJUDxY6Y9wwcXjwc8ltNH+sVKLnXNB9OGOILWTbRryDrPnm/MdxJ6qel2/lFODReagTRtj32dIOeKAIaZj+QzO+rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=JPHA9xih; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JPHA9xih"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-66a851e62c6so6414786a12.1
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 13:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774990735; x=1775595535; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dPaiD4OsZpalA+NXE9JYeLKvQIkP47+Rdll9Ghzi+s0=;
        b=JPHA9xih9iMNe3xHHeJOjNgBAXSu7rlK0sFPkOtlDr60cs2NxrA8oiJLsqiAS3C1D6
         a6zM5et4dlMh18uKfKp8cdFNxHLiCmxStOgaG4kvft8eBytgAdiOJgfsMlVuBO7TLPhR
         lUfUdmYIV0X3tl27afGzCiHm/1gloprN+U+jU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774990735; x=1775595535;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPaiD4OsZpalA+NXE9JYeLKvQIkP47+Rdll9Ghzi+s0=;
        b=HH5vAWBDbF5cMeZJJVQkX0bCqWMIca0+1A01QFxpd2Spi3/1jurHkX7tjm0dESl8kB
         Nobx4SvzxaR1qjQ8F3ZdDxf/3SHvVgFS1qVkGVAJDP9UX6eJQraeh1Bb/zda24PVv9oH
         8HKxTg6PWce0vz3IrK07N91f1B/1AJmZsx/gV46NFE4/3l56te0oWfe4BrUzY0ny3pBO
         v9VzoJYPv8/RQQpnfkgpnQ1ChY97y+jqRs27fikshn4xtNly719kkc8E/oWLm2b3Aiom
         N3Pm9bscKgzNJHMh0vsLRz/i+X5l3U0iYU0JZ80BqAWGzq17Ek8CT4TW9q677l0sBxZX
         tNIg==
X-Forwarded-Encrypted: i=1; AJvYcCU2Q8rmDy7VmcGUoAJmjcfx8XAvILAW1+EeWPSAm1tXRmdEEbek7yeLP7jQuBX9oOg2wuvU2/XDXe4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrYu4+uhLr0EnrpeeDBuKoCuYzKH5UGhLbzn6E4IIfSJOGgvCh
	1xeHPu5bn279JnleDZKMhNxoR13EhgyPZ4FhTenU3xAnBcVuUiLfG0Z71z7EfVuEm/rsZKGHdGs
	fbeDWEuOjeA==
X-Gm-Gg: ATEYQzxL6BfSiUfeemstV/gOdfapN/vLwaumV7207UJoMmejKhd/3SSxDrSoZxk/xpj
	QD4Txtgck0zoweBeBqoWT2fEFjWsB0dPA7iiQhp7CcgxWj2F+qqyei4j50HbTg9X4PulOIZy64L
	wyZZucX4qavDhYV5IZhArqNb+shPqwCNc+QnuKDC+lOlVN08Tlb/9ngrCm84bBBQPjzMuBPaGgl
	8V8t2jWbRHf8Nb1DoVzNuv5sYvoPZwlGV5c99gjcj5lLICA4j8cnthFM/JC44koYMH4OVhNLqeb
	HDFAVBydOtlcNMSoU1CkgKdZnIUFEV6WOPvwUWUjuSxBO7PMIMwFqBf1BYoKLy4KyIou/We3oHX
	CRlvXVQjXEo4uVY8vpL6ObcmBdMx18QcavDj7ZHVfWryLfWWkG1eJtCB4xdQh1RPHjg8e11rd6V
	CyQ0J49KM4DBsN7S3BH+WWr3q6yRShopqxZSh0CeDqlgCNjoGqi7Arc+9zVr1KSLfR7XerM64W
X-Received: by 2002:a17:906:3750:b0:b98:528b:845b with SMTP id a640c23a62f3a-b9c13ca906bmr57797766b.52.1774990735064;
        Tue, 31 Mar 2026 13:58:55 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c0219ed95sm77564366b.29.2026.03.31.13.58.53
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 13:58:54 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b9825ba7e8dso845768166b.3
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 13:58:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVLq4l7UOmJ/2Fc+ia34s2IutqlDghutjkmdVKVHF/p0d+8XnqDKhhqVjOlbNoqXYlw+7FzBrF1Ah4=@vger.kernel.org
X-Received: by 2002:a17:907:84d1:b0:b9b:1b9f:8397 with SMTP id
 a640c23a62f3a-b9c13b0a2a8mr62577666b.31.1774990733647; Tue, 31 Mar 2026
 13:58:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
 <202603311253.95C54588E@keescook> <CAHk-=wjSOGaausLeTD13yAqso7qM09EnkDFiN7wF15kH0VWmZQ@mail.gmail.com>
 <202603311321.4EE9FEA@keescook>
In-Reply-To: <202603311321.4EE9FEA@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2026 13:58:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj9pWsgsbrLDOk7ipKnHbz3JvuqsmQ3DhGg-OKgKS9DUA@mail.gmail.com>
X-Gm-Features: AQROBzDlSIWhA3UXAi4kJQxb1nvYqS4u6S5fbtJpBgdW6doJTV11HfE6t_3dlps
Message-ID: <CAHk-=wj9pWsgsbrLDOk7ipKnHbz3JvuqsmQ3DhGg-OKgKS9DUA@mail.gmail.com>
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

On Tue, 31 Mar 2026 at 13:31, Kees Cook <kees@kernel.org> wrote:
>
> (Isn't this just an implicit "try"?)

Yes. And I think that's ok.

I think try/catch is broken for a few reasons, but the fact that catch
and try are tied together so closely is the main one. You can't "try"
inside a scope without having the "catch" inside the same scope.

So then the solution is to just move the try to the outermost layer,
and I think that's pretty much what everybody does.

But at that point, why not just move it *all* the way out, and make it
implicit and invisible?

Which is kind of exactly what your suggestion is all about, and that's
why I like it so much.

It *literally* fixes try/catch. It makes the only really valid usage
model just work better.

(There are other reasons I dislike try/catch too, the whole
"exceptions across function boundaries" being another one that your
model avoids).

                Linus
