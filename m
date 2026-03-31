Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DB73D3002
	for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 20:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774987739; cv=none; b=jey4ThOoJWQTUh8kFqg1+NiK06Y7i6KWP2WTSEv7Yf00NXo6TLIokUDOsiVj/CNlCYe9K1kLwhhRH/ajH6ljmUVsks4vTvBBPJctJbYTkgx7cWyuFmTHAD5sjLc4lea1ohIvNSE/Bvy1q2crgCnv8XQPdYtxxWTy6cnwI5oXAbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774987739; c=relaxed/simple;
	bh=d6r1zB/UdxoLPJPFYvR0HJRmpyXXRkjD3BCCWDdorSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g3WmrbAiUm3Yht2F5R1SaWEJzzyVd19hEj6YvhufQgz1GkXEPD8/vB9qnztHCqRQZSfGOzmrKMg6kEmZbszkx8BOpMERCWgQ3qxucR1xSabrAKs8sa5wTULNIj37oZxy5kl9Zth95SSUbgGs90JBRSmjmqdbzn5w/4rl/rCyvik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GYbetjsu; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GYbetjsu"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b936331786dso688908166b.3
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 13:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774987736; x=1775592536; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hv2mdBoBk4QdkqU81qWETh/yEJGWnlakuOpSzMhOmBw=;
        b=GYbetjsukD4BCJvKy+rmbXG2DGPFYFF4pkEc3UjNKiF2K0vr0GQqzBXWYvDunEyy3+
         Xcb0k3bgKEIxvhD/jLqbHsa/67R9iFhI7USMkUoyELfaIujPTP1E8IFWuEdGEdNRHbl8
         jIl+lUKmEul2LI33eVpd0Tr5mFg6172cSjbtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774987736; x=1775592536;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hv2mdBoBk4QdkqU81qWETh/yEJGWnlakuOpSzMhOmBw=;
        b=SCK5WHfjMAjKQCENSSg7OcgS5z0LRktU2YNEzBphKPHpE9VhwpOm+TUKyc8DiL044w
         98FoV3EP+XunYbhwLBjbxWb56KyMoIvWoqvpbVGkUljJM2Bg38KtSW5VEzrJsN7N9b5N
         9qHuSf9FP0DmDQFnDsZONckBl1k4jTCqIHDlrPfdUULEcBuC5Hb9RtNv2slWaspVVP86
         hkgbz0e07DZorv+XKirhhlkqr0vTVZdQRCw3eRlRogOqJMMzLp17Q5MsDG3obnN1cZp7
         Ommk7eed892GYZCP05MqWKHKJ8mLBgqRXTVucWUTHg5UVlLlo22DzQ3CtVPHXeBIKb8D
         URUg==
X-Forwarded-Encrypted: i=1; AJvYcCV0mFJPPk4MDiGgql4NttVnRq43FIVh+IBy8GSr2LHVCaKYLlW1q60vj3YDk7SGrw+8d0X+NUF93SM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw82L9GJA/uh5TBROZos59iS/mv+ONAbyU0DKVj53KiI0u09zof
	VeWT54OCitK3qQj3+sXYrloqSFSxiM2zthrN9BHfOBoI0rpYaEFUlfFD8YOQrp3cT9TcduM6XFv
	h/5IsXOJHjw==
X-Gm-Gg: ATEYQzxHbOeKRXnzvUFhTrHnT70XKtZlIbD6+Q1nmd39LVwM8NvF93J2DaT62mQtpqN
	332YwpW+h5oDqM7pRZPbojpJnxmVlzKWo97/fPAxSuTlsWnNglw8qJOn+dIGEfySz6AkIFMbJ5a
	PbAzvze0QLNDSE2ppCRjdrBx/b8iV1kX8eZiAq2uAw9UqDgD4t6qXeTrZXvlhHJgKR7tFLIyYyq
	zGWR+2Te28LLELDvC9qKDzK/HX+jo9RvMt7/+EhyREgPuPo1d6DCSbxYOGUZa3eoDwmFADSiN3o
	Gtqn7djGHTmWRdhYn8Qt1xSRaDN2rDFZxVX6PoRqn+Gs24Gz5kDlqIp24vO6iJdVG+IxcxsU0y7
	OHKVnaPp1/bT2Ra/7U0gg4CjUHECw7t31zCVXec3/NVFSlx/p0iVYBzZjnB2V9bhww+zvXe7hsp
	SppUdILR5uQLcZaGG9GuipljekaH3z7UK25qZGSPFucAWtAoHH3bAHIgGislhE0HBJPAN8frq1
X-Received: by 2002:a17:907:a686:b0:b97:f12a:3f8c with SMTP id a640c23a62f3a-b9c1393ff56mr74910266b.20.1774987735630;
        Tue, 31 Mar 2026 13:08:55 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b225327sm435524966b.58.2026.03.31.13.08.55
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 13:08:55 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-66bb7e098b1so2769642a12.3
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 13:08:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXkRL4dSAIWpgkaZHpum2Zl5Q9lAM3A3A0DGA1lQGay4h7/WySrCnUbv4h73H6K0zDLboo9AIvT8zk=@vger.kernel.org
X-Received: by 2002:a05:6402:540d:b0:663:9739:6265 with SMTP id
 4fb4d7f45d1cf-66db02afce5mr564572a12.9.1774987334624; Tue, 31 Mar 2026
 13:02:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
 <CANiq72kL3rTKyDNYmD7wXiKCVJSfa1bnp2L8NShXU7OPmWjJ4w@mail.gmail.com>
 <CAHk-=whjwHjmB0_2yXsOjDa7Mi_yFSx3AMd3vGk5r70WocvZZg@mail.gmail.com>
 <CAHk-=wgKB5f3MM40FGGUWUm_9eyESe2PAqCa6uZ=YTi0CdPwDg@mail.gmail.com> <202603311155.503B3DA5B@keescook>
In-Reply-To: <202603311155.503B3DA5B@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2026 13:01:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh6YWV3hHs8i0P=2A2CVjCY=SOaYeayEodXYa+CMqNO4g@mail.gmail.com>
X-Gm-Features: AQROBzDJ5SIQIXss3ygEg5-CA2RDbG130aEFCjGxmwQlRnW2FPPkeTaugvbjtMA
Message-ID: <CAHk-=wh6YWV3hHs8i0P=2A2CVjCY=SOaYeayEodXYa+CMqNO4g@mail.gmail.com>
Subject: Re: [PATCH 5/5] types: Add standard __ob_trap and __ob_wrap scalar types
To: Kees Cook <kees@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
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

On Tue, 31 Mar 2026 at 11:59, Kees Cook <kees@kernel.org> wrote:
>
> The syntax problem (as made clear by many other people, and even you
> here in the first half of this email) is that no one will use function
> based math primitives.

I don't think that's true.

It's just that they have to be made simple enough to use, and have a
good *reason* to use them without the end result becoming horrendous.

Ok, so I just spent fifteen minutes trying it out, trying to aim for a
really simple syntax.

Look at this contrieved example where there are two different overflow
things with two different exception handlers. I decided to add a
"default" label that is just called "overflow", so you can write code
like this:

        static int testme(int a, int b, int c, int d)
        {
                return addo(addmulo(a,b,c,addmul_overflow),d);
        overflow:
                return -1;
        addmul_overflow:
                return -2;
        }

which obviously isn't pretty, but it's still at least somewhat
readable. It does a "addmul" and an "add", both with overflow
handling, and returns the end result.

If the final add overflows (which doesn't have an explicit overflow
label name), it goes to the default "overflow:" label.

And if the addmul overflows, it goes to addmul_overflow. It's all kind
of obvous, and not syntactically all that onerous.

And it does work:

        #define TEST(x) printf(#x "=%d\n", x)

        #define MAX_INT 2147483647

        int main(int argc, char **argv)
        {
                TEST(testme(1,2,3,4));
                TEST(testme(MAX_INT,2,3,4));
                TEST(testme(1,2,3,MAX_INT));
                return 0;
        }

results in:

        $ gcc -O2 ov.c && ./a.out
        testme(1,2,3,4)=11
        testme(MAX_INT,2,3,4)=-2
        testme(1,2,3,MAX_INT)=-1

and in this case gcc actually did everything at compile-time, so code
generation is actually good too: the compiler will optimize this to
hell and back.

But even *without* constant arguments, the compiler can actually
generate good code too:

                .globl  testme
                .type   testme, @function
        testme:
        .LFB11:
                .cfi_startproc
                imull   %edx, %esi
                jo      .L6
                addl    %edi, %esi
                jo      .L6
                addl    %ecx, %esi
                jo      .L15
                movl    %esi, %eax
                ret
        .L6:
                movl    $-2, %eax
                ret
        .L15:
                movl    $-1, %eax
                ret

that really isn't bad.

So the code is legible, the code generation is fine, and it's pretty
flexible. And are the macros complicated? No. This is literally the
code that did all this:

        #define __default_exception(a,b,...) b
        #define default_exception(...)
__default_exception(,##__VA_ARGS__,overflow)
        #define overflow_op(op,a,b,c) __builtin_##op##_overflow(a,b,c)

        #define __overflow(op,a,b,...) ({                       \
                __typeof__(a) __res;                            \
                if (overflow_op(op,a,b,&__res))                 \
                        goto default_exception(__VA_ARGS__);    \
                __res; })

        #define addo(a,b,...) __overflow(add,a,b,##__VA_ARGS__)
        #define mulo(a,b,...) __overflow(mul,a,b,##__VA_ARGS__)
        #define addmulo(a,b,c,...) addo(a,mulo(b,c,##__VA_ARGS__),##__VA_ARGS__)

Now will people ENJOY using "addo()" and things like that? No. Clearly
it's still *easier* and even clearer to just write

        return a + b*c + d;

and yes, that is more legible.

But no, I really *really* don't want people to be able to just
randomly say "I'm just going to kill the kernel if this overflows".

                 Linus
