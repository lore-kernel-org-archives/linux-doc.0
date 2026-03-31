Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A7832FA2A
	for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 23:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775001539; cv=none; b=MdCot/BZXkM6SRcTjRg/OUyGV1sY/dc7tL8dyIa4UTjHzHQSI0F52E34Wn8Bv1tcy90GQEDbGGtcAOaONF8l3dv90I0PlXJsDS0R4P9rwTrnC7b8UGjTzEg0lH9BFJ9UXJ373gd7kGrpM9sR2CtfU/3bCLr0i0qEjRJZQzlZFhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775001539; c=relaxed/simple;
	bh=hi1MFskNb8DMYSQRnhoouww2qda97qGJwbTEd7MQFUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K855hSWtsiCjPqkPLIvjncmHrvbvZQ9FqLKFF6u7PAg13t0VFW7ZFfFZLYP6ZShS9dbHA0doXhrJBfnlaJZITsQg/9ujjyHzWwigC1GlIb9Dk59e3s77crvLxyLZEg+9Yc2cw0WFH0L8a/N/SH8fjUIaMkROeSBKEqDg1If84k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DdYuBRtR; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DdYuBRtR"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b9841aecf72so762609666b.2
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 16:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1775001536; x=1775606336; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ap740lhReTUh/Tx7odelrkvzzjajL/UYRtgEhV3gotU=;
        b=DdYuBRtRzyOaZm4gYwCmOUFNNpfenuVDAnWNV2PI7I0gO/jNDqVg9IfyXnnQ34Mv8D
         LEVbOG1oBeshYRdyJ9LfYDgBeq+znmKUKgYRMeVr863aN6OAvnapw328Mvmk3RuGjWVh
         Dg+xBx81jX8eEOOnKTgSqhoRtgS4Py2sEALuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775001536; x=1775606336;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ap740lhReTUh/Tx7odelrkvzzjajL/UYRtgEhV3gotU=;
        b=lIXeaCW0osktXCBDsKbQ0oXKzmESs46gwtz29tuSRrsG6ZzTVzzWtB7dSBlHtL8VPW
         AAMaoEjLjvfTDYi/+OampDumwZ9oQbzzC3RCoJVtncMcRu5oq45IDSzjfIRFnwa9hS9n
         az+jjx4ByIiWzElMsW0qZ+KwBhGaqmaXjVphOcpnzDZ8iCW6+UBgdG5/lYUeYl42G6YK
         Jyz0m7ZrB9h4NmWB0WUucvpuELjjtnFdIZvsJjppEn0miiaXfgktmruQWcvWL+Zlgfiz
         cVgcoUebzBvxFfWoqVhWLy7ZWB9MwtfciC416oti7W/lzEjE+d7ZDh18Zik6yg0nj72G
         bz0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzmNiWBSkFUYBiPu06VFMTMTj2oxSYXPYWTUj3FsJi6WF5/Tr3hWjFJNkUNWZajU3aAGsQmGjk4T0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXiMVmg8fx/oBq2ueW/8wgIHSA/nIt5Leof49xhSh6mNkImSWf
	Sa185ia6DjzHrnm6HDlCkquzkesahS7/7W91wzOv6UkZAQnhJgE9fd0VroUaRv9bT/sJaaSYknH
	Ld6CeF5ACgQ==
X-Gm-Gg: ATEYQzw2tZLIorDO8ci4JyiTg7tKknHWTro9W5bz1qf1KNo584x48ejkXe+vN/ghTSY
	5Qd1mz1N9Vhbjvy83Ib6FAAu2pT4ZE61EdFc0ySzXE7RFIhXdSYQCaqN97qYNTb3zwbeBkvgmw5
	o5Ehj6bhUutnZTy1Cm6mm/TdSRsakQQ6QQpce3eAPOj/cVkK4Un2kICxKURNG8403FX2fC1P4vR
	YrC9VoJkiDmffc7ku8fJPGcJyae6qZnV7KatY0q6e/yTH6Dy+4E4yk5EigoyBzcuvcsjlowiCZG
	HbAQt/4xmaIcFXHoTS96qUs7OEuxxzsl+H5KEfqw8XjvTx9Vtl3nv9lO4IPWQdPMpbYuINyzLsq
	0yt7Nys17JnEe3qXi01JZhC6kln5gthHYleTQeenGj9w/ltzyMWqxGBtKRqLS0pMhDO87O1jVCV
	EQiQUZQoB0gmXETrpLW2E4sAAfhtgP49zBsqcPt6RQ51m91V8xTmfizr/g/1Q3y37jHKL8/NI9g
	SRYk6GgI5k=
X-Received: by 2002:a17:907:a70b:b0:b98:13b6:38a1 with SMTP id a640c23a62f3a-b9c13aead54mr81113066b.28.1775001535614;
        Tue, 31 Mar 2026 16:58:55 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1e3acasm467206066b.46.2026.03.31.16.58.55
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 16:58:55 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b9841aecf72so762608566b.2
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 16:58:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8NOT9EF1zm4GBIpHFSWK4r8SattWy0Lk43mROhlhn69kMz1lSJaQ0+Wp8pBOpWAJ1Z5tQtEkj8oE=@vger.kernel.org
X-Received: by 2002:a05:6402:13cd:b0:66b:810f:1c4d with SMTP id
 4fb4d7f45d1cf-66db09f03d1mr893296a12.18.1775001037895; Tue, 31 Mar 2026
 16:50:37 -0700 (PDT)
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
 <CAFhGd8rE+ggYghcwUphSRc2ftQMaX7LbKKPwQZzsw43bg9VVmA@mail.gmail.com>
In-Reply-To: <CAFhGd8rE+ggYghcwUphSRc2ftQMaX7LbKKPwQZzsw43bg9VVmA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2026 16:50:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj4j9-=VMdVJZQjn=FEDWpE5JkHtr3CwErQdXVGFfGkXQ@mail.gmail.com>
X-Gm-Features: AQROBzCocASEQv-3sgFpeT7hRsHg1wWGTjTvooh3XWVShxy7lX1Q_VH65yuwsXg
Message-ID: <CAHk-=wj4j9-=VMdVJZQjn=FEDWpE5JkHtr3CwErQdXVGFfGkXQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] types: Add standard __ob_trap and __ob_wrap scalar types
To: Justin Stitt <justinstitt@google.com>
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

On Tue, 31 Mar 2026 at 14:50, Justin Stitt <justinstitt@google.com> wrote:
>
> How do we feel about type-defined labels? We can specify sane default
> handlers where we define the types:
>
>         typedef int __attribute__((overflow_behavior(trap, __handle_me)));
>
> ... and define specialized handlers later on

That sounds like an interesting interface, but I think it ends up
being kind of odd, because normally the type definition would be in
some global scope, while the 'handler' would be a local label name.

I think that in some situations - and certainly other projects - it
would make a lot of sense to have the trap handler be a global
function in that situation (ie "abort"), but with that being
explicitly *not* what the kernel would want, it seems a bit odd to
specify the name of a label that then is used in a totally different
context.

So in your example:

> int func()
> {
>         ...
>         u8 __attribute__((overflow_behavior(trap, __BOOOOM))) product = 5;
>         ...
>         product = a * b; // if store is truncated, goto __overflow
>         ...
>         return product;
>
> __BOOOOM:
>         pr_info("%u\n", product); // shows "5"
>         return -1;
> }

The above makes total sense, but imagine instead the code being
something more like this:

Some header file does this:

  typedef unsigned int __attribute__((overflow_behavior(trap,
__BOOOOM))) u32_overflow_t;

  struct some_random_struct {
        u32_overflow_t usage_count;
        ...
  };

The implementation for looking up those structs then looks something like this:

  struct some_random_struct *get_entry(int hashval)
  {
        struct some_random_struct *n;
        spin_lock(&hashlock);
        n = find_entry(hashval);
        if (n)
                n->usage_count++;
        spin_unlock(&hashlock);
        return n;

  __BOOOOM:
        WARN_ON_ONCE("Entry 'n' overflowed\n", n->name);
        spin_unlock(&hashlock);
        return NULL;
   }

does that still make sense?

Now, I'm not *opposed* to this kind of interface - we'd presumably
just use something like "overflow" for the label name anyway - and it
allows people to use whatever label names make sense for a project so
it's clearly a nice feature.

It just feels a bit odd. But maybe it makes perfect sense at a
compiler level as a "it's just declaring the token to be used for the
exception label".

                Linus
