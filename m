Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDF83F9F42
	for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 18:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774980601; cv=none; b=ij3shnOCMr0SWikr2whQ8lhfgb6lv5OObf0siU704seWT+SIamLCTMG1qrXn1HeO9cdGhfythtaqOCCYQcoPzWmQDJ8sILOESYYBDFUQ5cNH1UGNL3DwR02jdXXVEnSl+VoNXpamBFWF4mKf/Y88avUKZzhtCEHmPbNE5kJ2VUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774980601; c=relaxed/simple;
	bh=yYwYSvStBtvkzXPBpl2nWuw/hu56cAHxTk2a5c8/rgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AKYTIsnAYH/UutVC94BN4dN1JwqgXVMnb311wKOB3i3wD8lRvcZvLoEfCxjP2WPhrFlpYTcHUsQ2n+YJ8ngDDmQBMOilmDqA6YLl28lv7wkZtbUg7uQSMUzLVsbgPIXnechOvUGqIThdyMS5nAhYg8NCQKCiNuaGsUlQZnqIvFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DkYtFsBJ; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DkYtFsBJ"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-66c304dbfd2so246632a12.0
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 11:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774980597; x=1775585397; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TkZ5G8hekNnh++59TEnIGYyFMs6NypLCJp05Fo+wpQo=;
        b=DkYtFsBJTj+i3cYOZkNHNLhn1rNOsJ4SvHmshVCR5kfUJ8mIYFYq8ghHCwPM5ZmJ0x
         4m5EhKFooDd+diEOl55FTrhSafJLEhaFUJS+spIX8blQ2fZkdymmEwmWpwlY68jGGSqL
         HLG//+yomtzyaUt9GT2Vgld8JhLRAVbzeuDRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774980597; x=1775585397;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TkZ5G8hekNnh++59TEnIGYyFMs6NypLCJp05Fo+wpQo=;
        b=YqfhtckJaG/bGOn+jlZ72lgN5cDjw2aO0oSbKwCzlacZ9IJp4eXV8IMnfuUKBC/lL4
         hYpUiK7aD09/qgbwnT9VCr70dvkLOCHIY2IwhKf+zL8ee94PQyFvGrbAaQgb9LmSTBXO
         EM62Yn/pd2fRgBdQeacTmRR1Q1SDpO0isD7r4H8N63ggofIWKX3t1Dzi0REEmbXq798Z
         Co60hp0CwF5ZeUPHeHZFgbi+NkLtdkd8k8cbP20JjHYvlo8TnpPtwTMTZQklTNdZVMvp
         KwdyUAhD6pVNOS74hFqcQ5GbNhLEdGsbJxD+7gMGweMYWq2CHFm1C0XPqaEilt6weWo8
         dKgw==
X-Forwarded-Encrypted: i=1; AJvYcCVeCQxKxHH1z6TSuw3hIXvI1DNkKadsrPZVrqChwuEpNZMP3GF1bYA6AAg56Lq052tJC3/UTiHO9Fc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhlz3kLcQ+7a7wjcIevzGQhrNzIen0UF1xTqi0CvFmke2IbECH
	/270w08CN6AtNoBoDNNQIsKvf4E+DiIcD52eXWfJkjt5FGJ2NbEvz//ANexRHFxxqelJp6nfQpm
	GMq/hbuLYoQ==
X-Gm-Gg: ATEYQzzLFG+8TMpHaIBj9R2ZF0F2l5l2ldMqHFP/GkoNStTrDEC6isSxuv+B2syMbbV
	wJM2bMMplfYPNiYhU6gIuocth+6dKgA/KKM6kJsWQKIamjRRQMF+cRVY9unL+RhtHV0MBWRg++R
	opfers5xDWpkNgp6q0rCanpG0eA/guNZ6S5nGjVPgUOJ3MSw3el2CpJSyZZvCb3U2kAg8EneQo1
	FduNPdKfaXK0S7VQIfu0619bRMyL/txkMmVKEdYdMHfgMZ4yvjXxbjDIHqY4GCMPw6DQjfVt8wx
	0D99ZkYQJasiIA8j2oScqyGRpVxaynzgz5H7+8sSWtDNkeRBsYtluc6v3/M4jgbcTXcx7dqaqq0
	zi9XrHqsHF7loSgGbSGsQBj+y9q7isdpGan80CcoHDwz2sEFG4r7tIULXzlOUszuJmQC+9rVBSx
	1L3tQc39ph0fTHBUcCarj4TwNjC+UIhWOatEFNXax9GW4krtMekp5fVMUU5FTDSPlv7NV1aLCR
X-Received: by 2002:a05:6402:5355:10b0:66b:bc47:8ce3 with SMTP id 4fb4d7f45d1cf-66c3371ac52mr2013309a12.8.1774980597138;
        Tue, 31 Mar 2026 11:09:57 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b75ba970esm3819196a12.19.2026.03.31.11.09.56
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 11:09:57 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-66bd4e0560fso217754a12.0
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 11:09:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3e07XocGKb+ZvtKknPTgBmyglq+C0PXaxUWOIrsBYPDS6abqLrm24M++3bkbnVCY1UaBS0ZLb1qM=@vger.kernel.org
X-Received: by 2002:a17:907:984:b0:b9b:9e51:ec9a with SMTP id
 a640c23a62f3a-b9be8355c7bmr264682966b.7.1774980139544; Tue, 31 Mar 2026
 11:02:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com> <CANiq72kL3rTKyDNYmD7wXiKCVJSfa1bnp2L8NShXU7OPmWjJ4w@mail.gmail.com>
In-Reply-To: <CANiq72kL3rTKyDNYmD7wXiKCVJSfa1bnp2L8NShXU7OPmWjJ4w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2026 11:02:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=whjwHjmB0_2yXsOjDa7Mi_yFSx3AMd3vGk5r70WocvZZg@mail.gmail.com>
X-Gm-Features: AQROBzAduh7vXF0_QXfzo1P8tgp-mw59vEL4E4A0ltej3_oceWZyw3iWH8NeT84
Message-ID: <CAHk-=whjwHjmB0_2yXsOjDa7Mi_yFSx3AMd3vGk5r70WocvZZg@mail.gmail.com>
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

On Tue, 31 Mar 2026 at 10:48, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> In the Rust side, even if those "explicit" types like the
> `wrapping_u32` you suggest exist, we generally use the methods on the
> normal integers instead, e.g.

In that case the types in question should always be very much opaque,
and not usable as-is by existing compilers that don't have attributes.

My feeling is that that will discourage use enormously for when people
want to just say "yes, I know this wraps, and it's ok".

That said, for the *trapping* types, I do think that we likely need an
opaque type, because I really feel like using

   trapping_u32 x;
   ...
   x++;

is a complete and utter mis-design. It makes the "x++' have random behavior that

 (a) cannot be recovered from (maybe we're holding random locks)

 (b) is completely invisible in the context of the code, because the
type may be somewhere very different

and I think both of those are fundamental design mistakes.

And no, "dead machine" is *still* not an acceptable form of "that's
not random behavior".

So I think wrapping and trapping are fundamentally very different. The
words may look the same. The semantics may often be discussed
together. But one is explicitly marking something as "overflow is safe
and expected", and that's the actual real SAFE case.

The other is saying "overflow needs special handling". And the key
here is that we need to have some way to *state* what said special
handling is, and we need to do it at the point where that special
handling is needed. Not some generic exception handler that has to
figure things out from some unknown context.

Very very different things, and they need very very different
interfaces and very very different infrastructure.

Anything that says "these are two faces of the same coin and are just
different attributes on the type" is simply broken by design.

                 Linus
