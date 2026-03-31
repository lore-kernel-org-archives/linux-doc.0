Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB8F37BE6D
	for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 18:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774982665; cv=none; b=PO6ndzQdGNoUCpkNnHrRxGQnyN+TBwIWhPWlLku3oTLX5KNYjS/YobTn3BHt7CP9KP5zB/7CfI4zrWiBdcQIxgJLRp8j0/WPMlIBBVVWyQjuafXyLejSW96j4WN2fZH8Z01NZ61ymPcHdilrEBP8fbkwXxPwm340+clB8MpkyF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774982665; c=relaxed/simple;
	bh=DwEKjICeDkCjJOVrt0+LZu6p2US33YhraP63lKerfiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G3KE4nhx0MLrXKDyPhGF/W3BL7l9T5H6zBs5rmIBibrdttAzzZzTnqsgKWEQfABLAJpSigR8vZswVfYpDkNBELKdp+A5/PeAo6THrNfUTidTIpm3544EIU1qzOLqEYBo+m2TaEE/w2zh+d6YhlMdhxaSaRL/N0SB92/l+6XfpbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=arTcnRIP; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="arTcnRIP"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59e4a04f059so6190570e87.2
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 11:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774982662; x=1775587462; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6Jwbq+7LR0mSJFQk5uCurdhkOuVoq3zAKj7b6at5J18=;
        b=arTcnRIPqKxWsQ8kNZuOPXmiqNRTqs0xMuTalvcbAn+xoNm0gG31UryfVdPz2I4hvK
         1yF5jKS0TCIduMVgKfDpMASRMM/TGmVmhyHqe3F0/8h5IvrqsJgGw2Kd7YeUhPbQuHkJ
         G20Ok27y+WG7yD3efAz6/mnIhcY4UvyrU/kHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774982662; x=1775587462;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Jwbq+7LR0mSJFQk5uCurdhkOuVoq3zAKj7b6at5J18=;
        b=Ps/Xq1ZGtj5xFhTgpEj/Nna3h1GVKCFA/ZubNtVuY47cz339kdLTlRYNZWCoMcZSi4
         o/lDzQ67qUYLolTcPFX/XTuSBrNaDIXOmqpKBbrLGap4kqURoPa7V1DMrxUiOjgK1zn+
         qnu4+7lAH/w753YLLxPd26TKYYMLO7xrl5EvWxFJhQVdh/lIKClArTJ3K6DnnCX2Zp7n
         VKiP1wmVte9vDeKh7xxHSDanqnvm7opzB9bdwRCRDgmpdWuEywvc4zbNqKicMA3nBTFt
         Qyvo7Twl/qFuOp0CBRNGd2IeADmaecWnDZq1/adevfFKbp6QLwsbSHKv7c1uLg+0xJl4
         B3FA==
X-Forwarded-Encrypted: i=1; AJvYcCUkQdibpNHGsxS65V68TkNIlsFhLfq2DXArLEV9e8YM8EeL5B9cdlMZYjHsd6gHZapRlGjch72cRsY=@vger.kernel.org
X-Gm-Message-State: AOJu0YygtykO45PsrgFG3Rz162brfBHbGMpVWuwWlvFOxR8SDDsm5slW
	HzkGbvTTxkBl5YA3RwE85EeA3S7xb37PcXHIJrJvPU0uFy+lVRRDg1+qaNtMYGAkr4uoQRIRYYa
	yg7cVa7tzbw==
X-Gm-Gg: ATEYQzzTGm3F4AN8bZH5/NYAo8SD43yUizu8keVKy+0VVZHdu4CcUGFiI+th4neHyfC
	L1gO/3vhe1EXD+v210Z1Hj05xYF9VqTqVEq2BrYoCi6kvo0yGutoDfV2ytONCcdJWGOZC2wG3Hf
	VFsPXnnRyQn1eGRtUy47JurKzsrhrczOjt9r59PSQdUPQU5+jIGFkeLil7YXa6Owu1u5bOBf5XG
	uvPjRaG+ADDuxhKtKSSpbPt1pqxokuQc9WqQEmzLdduEAYzpox0w1sMw7eW1C3IWAWgTFlAU7B3
	xGqXBUNgRuKnAo3GCazn2aQFW1QiBoTk6ehrhkrmcfUOuZLb+HNsNphWzrcAxsObH/Izi9YMxA5
	ullwVq4NRpxvBbqdV/YdZLDKaIdSg/QqAt9eTbzXeagxCBdbVfyI/23eD1ZTGCkfslhW2jdnBXw
	cOrW0e4/bLXcSSM5sokL6s/I2LW8Rf7YVF5nrCRmdYqkRCKFpJQ8yxjhsE7rgf8rKBXW5GDT2Lv
	UxC
X-Received: by 2002:a05:6512:33ca:b0:5a2:a540:7e40 with SMTP id 2adb3069b0e04-5a2c1ee1937mr218533e87.7.1774982661649;
        Tue, 31 Mar 2026 11:44:21 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c836d42e2sm23152791fa.5.2026.03.31.11.44.21
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 11:44:21 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38bd15d82bdso46278661fa.2
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 11:44:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4pu8ccmHvvXiiOfq3DgY6qF4PxK6HVHtncvx9qwyTowXXB74pfI1aisFqv38oNy4/LYd7s5gF3Fg=@vger.kernel.org
X-Received: by 2002:a17:907:c789:b0:b97:d126:c007 with SMTP id
 a640c23a62f3a-b9c13b2c4a6mr48468766b.30.1774982192841; Tue, 31 Mar 2026
 11:36:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
 <CANiq72kL3rTKyDNYmD7wXiKCVJSfa1bnp2L8NShXU7OPmWjJ4w@mail.gmail.com>
 <CAHk-=whjwHjmB0_2yXsOjDa7Mi_yFSx3AMd3vGk5r70WocvZZg@mail.gmail.com> <202603311117.454F578@keescook>
In-Reply-To: <202603311117.454F578@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2026 11:36:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wizJdr1qgJ9NKNjtbH=ugL3umA9JRW9ifrQaD+PpWCMuQ@mail.gmail.com>
X-Gm-Features: AQROBzBUflXPh777BM9crSo8MSIUJXluDEJ78_cVjfj9YSXDGlWfMakjxHiYmFw
Message-ID: <CAHk-=wizJdr1qgJ9NKNjtbH=ugL3umA9JRW9ifrQaD+PpWCMuQ@mail.gmail.com>
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

On Tue, 31 Mar 2026 at 11:32, Kees Cook <kees@kernel.org> wrote:
>
> If the code was written perfectly, then there's no problem.

My point is that BUG_ON() DOES NTO SOLVE THE PROBLEM.

> The point is to make a type that still works with C and all the associated
> APIs (e.g. format strings, native arithmetic, etc) without creating the
> mess that Jakub, Peter, and others (correctly) balked at around accessors
> for doing function based math.

Has anybody tried to suggest that "use a label" model?

Because I 100% agree that the current overflow handling is pure
garbage, and doesn't allow the code to be used in any kind of sane
code.

But I think that's solvable with the "branch out on error to be
handled elsewhere" model.

               Linus
