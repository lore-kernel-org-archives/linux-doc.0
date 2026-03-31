Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7663451071
	for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 21:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774993854; cv=pass; b=VaI9TL0vk9R1KyYvxre/0TFcgZ/Lp6hTuMEJxWEUYBDiiCXB8g5tG5LztlygIxKHppNAMb3uEaExbLKEnjxfg5evRhJ2FYNmQkWkslecP1y0U/MCLk0mrJY2ol5E4z4git0PjW9doHuKorCKueb/5PBF583zY4T4JiDWlFlGtYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774993854; c=relaxed/simple;
	bh=wV2XHf4d1mRiH6xWNqUuoF9pM1xd5tcDK3VA/1dQDZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EUJsg19P7u1nXqXxJKfxCHrdXB6v5BeC7qr4MecJ0n9a4fwpcXvPGs/Xo4sdK4CIeXcJgEX9mY0+1wXdgjcawS+Imci+hrtMQ8sWe9GtHXYKWZxcisPM1/GJzNvocsOG1z5ZRfs+KxDcw695n8yr/al18mMG1shnv+vnUHumTyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ULwZTnZw; arc=pass smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ULwZTnZw"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-60291b2cd89so1861291137.1
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 14:50:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774993852; cv=none;
        d=google.com; s=arc-20240605;
        b=bnyO56z6IQap3ibc+9eOtJVdG3K0w7s38wtINyEKnFZtvrxc3hT465j93ql3+cnIVt
         EM44qctsXIMFZSMEZFmZYYLYix+uCdXLa3r0w+fzsQktys3Pu0789TA5uTPzOfJnLhk6
         O9+SpHjCVHcGtgK3Ol3CyJRV0Ey+Sp3TzhldpX9fZB9T4mmsPOhtpRSbEcJS0pY8Ytyf
         C5olSWgvjrZxIhJyd5JwLvH7sUrZBmDcbeC9Q8vbp6LqzVWXLfSqni3mSkbE0MQ4W0RX
         ajFdCV0qr5BLtnv60RoOFRyVhZPKvT6AbxxHElsNICpwprwubBIIyDye51+1+hS8Wuu0
         0MQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fvGGAAIkJYXYlK2HRa+mui/7ZxP8IFY7+ERdHeXnYJQ=;
        fh=SEdkovomn5z6Tw4wGCT67i969reETOfRPSfBnIUuSIs=;
        b=PgSHFbSbEvooDtXDrKqzDBXfIVkexv6J7kQIucH7obDOgLqJKVvM6upw44fsF7dukb
         /abPcXLnaQvIMneF4CnSM1ciGGSkcNUpQHsesvune/ecCavZjaFxll8ZV/XHjPb8E6j6
         Juwifelm7DVQtxTpblNjxTTa1CLMjIKAxureB0Om3e2crHw/3Y24ZJhVwcxs+h5e9jAj
         bAXLaFr0eM/sma1sDqeEDQM26Ru8PBGNi7rs8LJe1UjqOcaZYhnWysclBGkOC3Hb4e0w
         79Qg3xuDAVbukoCfgMGA9P31D8azCYwhMZC5OD9kuhrtXvjtrdGx6vsT04RnMAxWTUCc
         /dmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774993852; x=1775598652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvGGAAIkJYXYlK2HRa+mui/7ZxP8IFY7+ERdHeXnYJQ=;
        b=ULwZTnZwYpEALX6nYfAZF+FT/TisjHVclbRPF18BSgBSej64+DQ91M+9Bw8kEootcv
         EKnB/kCkqPVag1udxVN1dXVt3PDmt4LlyctpUdpZ+bzfGwWhNXD+qpjSpHVGEx+udmZr
         kYVX5FPfL8GKwkLr9fkbk/kzF/HsXC4zkbqgGHIcxAACsr5r3Iqx7rWTGBG/8UjKtk2N
         9jTv0A6N8cCJSO0KuHhQq+Dg1fWk89vvnYBYn0Z61TOxGDqO7yLfnuHVTDg7/2zdzoLs
         cn6+piLytbtRb9XiHAUBz1RK14sB1/tWNHV+luKZRT7PuPzSG0jv0/dnYNDSef1+8aJD
         b+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774993852; x=1775598652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fvGGAAIkJYXYlK2HRa+mui/7ZxP8IFY7+ERdHeXnYJQ=;
        b=ISWv+lzMVOFDsU6YKyMw4q/XI5YdpUmafPJeNFIHzHk2hfsQ7RjY8r8bzaD/limY3f
         CSrP9PUuggzYwBruc7akz0RHZfz3m5AQsOYO2UtrrkXJDfDtrbGY6f8TQ4mRmLKclrKB
         SnCgvBld0jDF/6pg+Xz8Ti3Ip+5uUSiLwWpMo0aHhIMdGhdImPtSHvk5o453smOsG6iT
         tlsO/LEqiJvRE210A0gG2r3XGrXQEUf9s7sCW5PmiPpksDqFHkvH/bBUymbJAWr7YK9F
         qZCIgHHwe9bl9veTGTJNWN6ZuZA86gqhjLd150OHiP6o9ihuBI6zQNBxWcUMUEDZwvmP
         s1/A==
X-Forwarded-Encrypted: i=1; AJvYcCXXgHQ64dBf5PNEXF4McVFto8tz+Vq85JiAnNTs7hen9FeIv5x6nztA2vsI97SduwLf06wp2LRChG4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Tp8I0BvSpsSnHWzVj8LqpOqdGxAIZrLVaAs9lLIa7Uq4qvfw
	wEKKzvxm5hdLVW+5ApYizQS9cNPPU68uctmA5lcx1HycgBhIaFvosSLDyddYHukdsS7Sydft3xa
	1gxjxZOhw/gw9l5fZlAQPPhun54zuI1SewBN3iN3X
X-Gm-Gg: ATEYQzxW4JVTRJSS8YsWw2hjOjcGia05lwX5SWW4I06kwtYhCCGx5od5bDPksxneuk0
	IHPyX5flGie/PczlEkiWKA7q3Loe8ba+070ttxCbloW4WyiDejxrp1tsk7b7qXtR5ZD94j2HnNp
	QoWdxcmsb+rzGIPzthtQICtyTNDjc36cgIl9pvVHF1WN7puNZP1DRfc6QL4pZWYbiB221dDY3y0
	28S8Lxlda2qk5KEwmnfuypu5JITaVKhLcbTde1HfyXRiTrvRWzRIVG5QBrxvhGoEz11ExFe/GeN
	7h9vVoE=
X-Received: by 2002:a05:6102:2920:b0:5f5:40ab:2d65 with SMTP id
 ada2fe7eead31-60567fb080emr381935137.22.1774993851331; Tue, 31 Mar 2026
 14:50:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
 <202603311253.95C54588E@keescook> <CAHk-=wjSOGaausLeTD13yAqso7qM09EnkDFiN7wF15kH0VWmZQ@mail.gmail.com>
 <202603311321.4EE9FEA@keescook> <CAHk-=wj9pWsgsbrLDOk7ipKnHbz3JvuqsmQ3DhGg-OKgKS9DUA@mail.gmail.com>
In-Reply-To: <CAHk-=wj9pWsgsbrLDOk7ipKnHbz3JvuqsmQ3DhGg-OKgKS9DUA@mail.gmail.com>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 31 Mar 2026 14:50:39 -0700
X-Gm-Features: AQROBzCZD3X4CkUD9sEd-qirDA1mrMa-OH7YNrOM0p4tLkqwVMQeCLGoKwyIRLE
Message-ID: <CAFhGd8rE+ggYghcwUphSRc2ftQMaX7LbKKPwQZzsw43bg9VVmA@mail.gmail.com>
Subject: Re: [PATCH 5/5] types: Add standard __ob_trap and __ob_wrap scalar types
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
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

On Tue, Mar 31, 2026 at 2:05=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, 31 Mar 2026 at 13:31, Kees Cook <kees@kernel.org> wrote:
> >
> > (Isn't this just an implicit "try"?)
>
> Yes. And I think that's ok.
>
> I think try/catch is broken for a few reasons, but the fact that catch
> and try are tied together so closely is the main one. You can't "try"
> inside a scope without having the "catch" inside the same scope.
>
> So then the solution is to just move the try to the outermost layer,
> and I think that's pretty much what everybody does.
>
> But at that point, why not just move it *all* the way out, and make it
> implicit and invisible?

How do we feel about type-defined labels? We can specify sane default
handlers where we define the types:

        typedef int __attribute__((overflow_behavior(trap, __handle_me)));

... and define specialized handlers later on

int func()
{
        ...
        u8 __attribute__((overflow_behavior(trap, __BOOOOM))) product =3D 5=
;
        ...
        product =3D a * b; // if store is truncated, goto __overflow
        ...
        return product;

__BOOOOM:
        pr_info("%u\n", product); // shows "5"
        return -1;
}

We would then probably want a kernel shorthand to avoid long type definitio=
ns.

        #define __TRAP(handler) __attribute__((overflow_behavior(trap,
handler)))


At least this way the label is always defined somewhere in-source
rather than by a magic -fhandle-my-overflow-at=3D__overflow


>
> Which is kind of exactly what your suggestion is all about, and that's
> why I like it so much.
>
> It *literally* fixes try/catch. It makes the only really valid usage
> model just work better.
>
> (There are other reasons I dislike try/catch too, the whole
> "exceptions across function boundaries" being another one that your
> model avoids).
>
>                 Linus

Justin
