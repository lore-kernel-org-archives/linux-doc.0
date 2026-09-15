Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956C74A204A
	for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 11:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789471809; cv=none; b=ksxkkq8CBUTALLAO4RiFysIguz7/8+UMwZ0UPIiu76c0xC5vmxhPMvcDryeLpkb+0gJoGvoiYAVdVVmtamtZKgFrefDoCCIUCHzBav1JSXvZuw7e+utlDDTYabmN0G6WBfWzIbTlPTPnuG/HjTYVbZiRGF9HZncRQocm9Ukwkm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789471809; c=relaxed/simple;
	bh=APKTuDGLjMsk92bnnkXJ0rRlkzi8IPJqTj2KURSVBU4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n94HIPuo4ghCTADM/sHpcZ7hkd5+kZ4gHet0ZHSXUUjGMkjvOYp7T/EkcviLmLH/a2xnYhx7+HfNQsVegGZrlbbehet6g53o/Z5GS9KVUzsCXVZY+fT9JTuDZsZYRgCkDz4UqHTFZWQ6DdfvMrSCu8vEvP/e623+33BcGlSScNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QfmW0HZG; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QfmW0HZG"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-495437bb891so5802145e9.1
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 04:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789471803; x=1790076603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dGOErKOPioTgO3v0/s/JdPfHHqPEsYrQAaTIvwRdmxw=;
        b=QfmW0HZGIofUmjnkWGL2TIVkFUxUuxZhOFjQCkuHPy/WVprMzaImb5IXvjMXS/wCGL
         uT++ASkA8Nzq8SsnOaIO0UueO+47EwRvo5F5Q2iv3015O88zbQeDLcIPKzLSIcrifmLG
         RVNd4ny1+Cy+QmrUym6h9ZUTtl8MXydeYJyp4q1FqUlyFJQXlfCStv7fqRBhRq+m6drU
         2MOKbXWfrGw4Cn3wFCJXObY+cq2LnTd2bB/lN0FlToSkrHYz2p1ue1fBhw1OzHr5z4oA
         4tpDK1zE80uk+drClpQQOLiuwshUO/kVmbzbC0pFA/whcZ8lOZHZwDWrcDKDnhhs+UpU
         /o/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789471803; x=1790076603;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dGOErKOPioTgO3v0/s/JdPfHHqPEsYrQAaTIvwRdmxw=;
        b=PEdMJOuXVenFLj5VQE3SitRwszTS55Yj+UyFeL3ss8S1U/CCUTiHWyR182RyoB6Uzb
         Qgw9O+uBj6JldvQuBhK/TZuK6DOMEeup98cL9KduvDxle+W2xL0GjZ3++86tfwFTJCpG
         1IjYcCGqnZIJPkXTExqCUj7+d+tHYVbZnuvQVMLMHbnMGRyXXMOVtHOlemkviHkeRjiR
         HDhD0zsF8KcKiCEIsoabDu9Qf2OqxpRi6J9AAhGS4D/kZhqXYoA0O1mgb02su2zk07Ui
         4TEGf/Z+Q1eozn/tSd6g2J+8kK4VSkk2xtCScl2ukYlMPc2LOzdZyx/46k0mn7dozELl
         67jA==
X-Forwarded-Encrypted: i=1; AKwUvByKo6DCWWLOHzruZCaN/kmcMkNhHLYS4pEi44lBa3cUskZYOB0JERwnFPx6aEmRC55NO4BWNJ3oWEw=@vger.kernel.org
X-Gm-Message-State: AFuF++lFrlXzWL9zGIlyIhiqEgeTVtCnhAp0iAs0kdlmNEJwRXMAPcPC
	w3akoQcsOt8KCEjVuaEX07FkkTUL4nq3CevWLwKoBY2/0cXeQhAppUrd
X-Gm-Gg: AYBFou2peXCM+lRisc1HtS7cpUWotkfTshU59YnEd4oBoBn0sQqJzPjkH18r0Z+X9H1
	fDQlcZuIHhaaI/B9Mi9jxcJqIXnh7dEdQWS1vo4uh45C6tKfeBef0ev1Zry7l5sTLsh9RRQsru+
	yTv5JWRe+fTDKo4aEOOCwXK3Ixe+rC59T5OhjiHDigUMKaWYPIudJK0R5gyqr4FWz/DEdQqVK7c
	3s2BWk9+ppeuGDPKtz8O1JiDjLSuJ9hev0+iE/mW2uiRL+T1QEhGJKw4R0Q1faPmbOKNsY5Zpa5
	qPeCpTr//lCnENumsCQu56koj48fpW4QLF6uDMnyG5D5PhCwkqKmrqNTgi83j5NpFsJaYXAca8J
	fsTcYuzO+dDZDI3uXEvxXaeUwWfHEu93bkVp7i0fxsRoNteXnV9DoZzQprmrZQVV8zn/ocBLnVF
	BKhIKjiUK0jdEJ2PpHeBzCDjHbCBqyYTmM/LFo3N74y/SV2AIrHTQSMrNA28rNAdItD8YQ2KlJg
	P9mR40VvooOOgmz4EYNwv0TILCRuf2k3fhr
X-Received: by 2002:a05:600c:33a1:b0:49d:28b1:260d with SMTP id 5b1f17b1804b1-49e7d74ce16mr30558965e9.12.1789471802734;
        Tue, 15 Sep 2026 04:30:02 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32d3c7sm31448164f8f.10.2026.09.15.04.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:30:02 -0700 (PDT)
Date: Tue, 15 Sep 2026 12:29:59 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
 <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, Alexey
 Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir
 Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Jonathan Corbet
 <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, Jens Axboe
 <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 17/21] objtool: decode instructions and resolve
 branch targets in parallel
Message-ID: <20260915122959.2348bf90@pumpkin>
In-Reply-To: <aqkR9Xqu-0Tem1zm@gremlin>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
	<20260914-build-speedup-v2-17-39817ec5db23@kernel.org>
	<202609141112.F8983EE9C@keescook>
	<aqkR9Xqu-0Tem1zm@gremlin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Sep 2026 11:09:25 +0100
"Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:

> > > +static unsigned int decode_threads(unsigned long text_size)
> > > +{
> > > +	const long nr_cpus = sysconf(_SC_NPROCESSORS_ONLN);
> > > +
> > > +	if (text_size < DECODE_THREADED_MIN_TEXT || nr_cpus < 2)
> > > +		return 1;

The text_size check ought to be before the sysconf() call.

> > > +
> > > +	return min_t(unsigned int, nr_cpus, DECODE_MAX_THREADS);

Why min_t() -  you might as well make nr_cpus 'unsigned int'.

> > > +}  
> >
> > No, anything using _SC_NPROCESSORS_ONLN internally is wrong, whether its
> > pigz or objtool.  
> 
> Why? We shouldn't cap a 4 CPU box to 4 CPUs?

You almost certainly don't want to use more...
(Unless they end up waiting for disk)

> 
> The idea is that the empirically obtained 16 core limit should naturally be
> capped to the number of CPUs.

The 'empirical' limit is very likely to be system dependant.
There might also be situations where you don't want the build to run as fast
as possible because the system is performing other workloads.
(Not to mention if you have had to add tracing to find a bug.)

> 
> I guess in a world where make hands jobs off this could be dropped, though,
> if the complexity there seems worthwhile.

You need to pull tokens out of the make pipe :-)

David

