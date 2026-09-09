Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA9D55C1D2
	for <linux-doc@vger.kernel.org>; Wed,  9 Sep 2026 15:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968583; cv=none; b=njTgksN20P7CaPgVBnhyWQDq+efnoiCldhzjQP8v6rXQJ/wZy6DxmAZUZerMa1XfByScVyPUnwNyke7Qfa6mIGUHhrNIbnP24atAvxNbT7ik3F+fqBoIhh9yKtK1xWOC49dwUZOx7PAU1GD8b51bw9eAtyQxymfmR3jp9ncxNm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968583; c=relaxed/simple;
	bh=tlXMq73KJhLbqOa3sBQb6U+eAptv38yQqOaGm+TCraA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c7WC9oa/k1fUQiQsoz/NYehg4vzxUcm0LtHNiQ2L+7u9bjY5nS3TxJNT10d9n5T0/AqQElhY4ROH/o8+53XcMm1joIPUC9OxEJAzeggvM6fKqV/peFROcDTc6+7AEP/Wo/9GE4Mht1N9Yoo6XZneIwpNGnVt1Y2llMV3ly9cPm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=VKsQrkgs; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VKsQrkgs"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae52so1932219a12.0
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 08:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788968578; x=1789573378; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7MDRo1IEz0/ztB5k2AgA6IiU/moC5VF/pQ54TqLA70=;
        b=VKsQrkgsOW5kdV0BXuUfH0/K2VCTcwXY/gKRNCboA0zr++Zd/6jihvWRGiOY9hBtoI
         BgAYTRh71viuAdYEg9b/9Dqm1YMWJyBL/Xl3gN2TktJqbHlz2QIA5o2MwZVrjhfdHcjj
         ySo5TK8Gbs1TakFwxxadEhG9b8JPsW+Za0ETo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968578; x=1789573378;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B7MDRo1IEz0/ztB5k2AgA6IiU/moC5VF/pQ54TqLA70=;
        b=VjVdZOvHQzyVc9QBMtOjY7QRoaVh1TqM7QjM1tOxmLUR3cjLxpkq6CrqtEHeuYSPMg
         UbzUZPvnUGVm9UeK9pEpV13pk3o9qmyyhB2kfQhtbkfNPHHmb6LcZSwUEbJByrJEfp05
         YPRGxxhIj8kn6TzA8erZzNKALIeHlw1QOaLAVAA0hQ2zgVQN1vZ01zIbB80F50xlSZ3h
         U5itVaZtBbrwAUf5WYgInXjegAeBQp3KCPN1fNaesiSdZu3llJElF9xl154R4W/0IOfY
         p6Vi6yrPAILXY0gSqZ9Ktzuq2JTBacswl3ez+rGGlK7q2UG4ocG+zmz1084+wD95jecB
         mPjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWmDavcwIXslgHnSuqFxxlGEPQLXbltLRoKqOODpJWlTDWmYhrgxK/R7s0RUb3zLzEhyvJIrq4r4k=@vger.kernel.org
X-Gm-Message-State: AFuF++lirLpH1ad+D1QSORgsKg8StmRtZHIksy7xe+TtySZRAjFeXkG/
	IyyX14JqePSMYNho86JBFehV8an+VeZofyMjBE80IF4zj0jBOXCP6A7rrbYuJYm2ZOr9U8Lh5eW
	QP0XdmVRDPGxj
X-Gm-Gg: AYBFou0WBUgGCt+BcoDQDD2nRVatrcEYgIw6nE9uveVm+q/rI8IPNKlnN7d3/hzmDze
	ojV7OFmrcZW3emHsBFa/j5cyjxoMiQtHzaZhPKiBnNsfp4VXfYxO7AkSgIiQKAthQikI1EuYtcU
	+XmkW7AKZ3POV7ZgaHfTxG3QKPG5Tk/N6pylUUKPHLkC0ILXZjHF3BO16mK/fw4L9v7kHnr2sgw
	aTOXlKlk9veRhCT9Dy35RsaLWjPb1dVC/rkbGN29+e/I8nOPF4rIO8G9tRuuN0Y/fmRjVv+t8IX
	1m6+5XEYc+aBsREOGcaiQxoxhZ/kJEWYSBzk/jRBxv0bxKxl3ZXOtztp769xWfFK5k3QphbORT8
	a3tuedr58EQvHdfL4gYZFGCMWYcHdD9d4logqGI7U6029HCYp/hc9dEWYIAJxlu7io+7TDLkS+q
	31HGUKsw1UDWiR9eZ5eV8m/IcBU6TFa/qCFQ+F/S/EVQdpHFAxKGoqTgBL2tjNa6ACRhWsfTKMD
	Fv58LcJhhLDo8aPywiwr6gUtp1S5w==
X-Received: by 2002:a05:6402:3047:20b0:6a9:a281:ca8a with SMTP id 4fb4d7f45d1cf-6a9a281cf67mr482428a12.20.1788968578501;
        Wed, 09 Sep 2026 08:42:58 -0700 (PDT)
Received: from mail-ed2-x10.google.com (mail-ed2-x10.google.com. [2a00:1450:4864:33::10])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68c3b2esm7463828a12.11.2026.09.09.08.42.58
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:42:58 -0700 (PDT)
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a996c8adf3so1260037a12.1
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 08:42:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBygp3LInbvplqYJaXyAjQJSiVApeCMmBiBA1fm77CcqjEZ9Be/7m2idN0D6M9C7piLrEo9ypWZkB9M=@vger.kernel.org
X-Received: by 2002:a05:6402:3817:b0:6a6:58e:f84b with SMTP id
 4fb4d7f45d1cf-6a98dfd77b1mr5256449a12.9.1788968246832; Wed, 09 Sep 2026
 08:37:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Sep 2026 08:37:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wieaheq8rXSps3xRZpNNMQMEj9BH5gU+Dh4q_ZgokO51Q@mail.gmail.com>
X-Gm-Features: AcwNN1XKEJS_S8eITIntw19v_mcHyut1QfPlZfjowWaI1qZq5Mivgkqwhzm7f_s
Message-ID: <CAHk-=wieaheq8rXSps3xRZpNNMQMEj9BH5gU+Dh4q_ZgokO51Q@mail.gmail.com>
Subject: Re: [PATCH 00/23] kbuild: significantly speed up kernel builds
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Sept 2026 at 13:55, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> A typical kernel build consists of a frustratingly large amount of time

.. you're preaching to the choir.

>                 == allmodconfig FULL build ==
>
>                         before    after     delta
>                       ----------------------------------
> Threadripper, gcc       345.3s   275.2s    -70.1s (-20%)

Well, that's certainly very encouraging. We should do this. I sent out
some emails as just reactions to individual patches, but I have no
numbers to back any of those emails up, and I never actually applied
this series to my tree - they were all based on reading the patches
themselves.

That said:

> An LLM was used to first determine where the bottlenecks were then to
> figure out how to improve them.
>
> It generated a lot of code, much of it hideous.

This made me scared to look at the patches originally, and I held off
in fear that the patches would be horrible and this build time
improvement would be hugely controversial garbage code.

But:

> I extensively audited and rewrote a lot of it, and heavily edited commit
> messages, the cover letter and comments.

None of the patches look at all horrible to me. You clearly excised
the hideous parts. All of my reactions were of the type "this could
probably be taken _further_" rather than me throwing my hands up in
disgust.

So the Rust parallelism thing clearly isn't ready based on feedback
from that quarter, but the rest looked safe and innocuous. I'm all for
merging this, although it should obviously go in through the right
channels. Mostly the kbuild tree, although some of it clearly would be
other cases - the objtool change in particular is fairly substantial
and needsobjtool people to approve. It didn't look all that
contentious, but still..

Anyway, I'd love for this all to go in. Build times are a pet peeve of mine.

              Linus
