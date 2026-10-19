Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792447154;
	b=KOBprTMvLfwkabHXC9kl1WyBycULC+bdcCb8CVY8o+ai/bp2rgVUelfFNrdYXlUw6beI
	 JuJU2m05ZQDWLW1bl9EPDiCpuhOP+9Gzi1MHKpj49pTpIzN3SxxLBmpf8+xAjkedqx1os
	 0Rs0+4rJmY7GkHNp3zpndP0To0RDj/ICHE/fDHngkt13I5xk7YBTm/FAMhGcQ/g/cuW2k
	 EEKcStCiVLg1BldBf4qMVXA194ocMG6+iNStoE5IwxhCOUyGIiESlyKxTSEG72TO+R9YF
	 LP3dQsQZ39TcxjGHe6a5G5+dGm3nW/zD7vrp73+JxTxrnWIByUH3VXc4LL1EgbulgtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792447154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=jctDokCQpU+5f4McBmCcNrit0g75bLIuZ0vnR/79ocM=;
	b=N2e8Z7FaHTeB5Tv19Z8zDKRP2hV90J1BuHo1cMT06ejbHswpsC0bHz1gzKGPIxtQsqzU
	 kfz5D6X+LSvxDnOHn+rOGbBfLQoO/pKcM5jxCiYHSOSXOKWmXXvWDgFlDbY47G33730U8
	 EiQok06QFISaQF2I94rX7iZc4I136DQF2xm2HVZxhGXU2qGsyqD28z7B+/xB2Djp566uP
	 V1Ws8cWcYkaFJoSXwX9cWdDPuwN+9M7UCH+ECG7lskf+LEalQpFFy6ktgvHztIK11lgu8
	 7M4izJYjxZomjYAskg66X5QvdIyeMjxAkk7Rd6XYfrmZUMbBCUX0m61rNwBau1aPuzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=tuJUcM+r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE993606A31D
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 21:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE993606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=tuJUcM+r
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so5589304eec.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 14:59:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792447153; cv=none;
        d=google.com; s=arc-20260327;
        b=gGEQrtF6u+/oVQXTQNP3sC/rQnEj4Yl8sSbsndAZN8le+ZzfyXVXyv9n25N9mILEZ1
         rCS9gvC5RLhqtwgs8Z29oM9431FtnSv/AL9uLYKkNWXkgONJAGfhH5U6MaNCn2RUFlBl
         pV81lFUVY6hW/uXs6YB47D3mKgdSeJ3AouB2eRvGNiZmlnI5NbQk40WNHwdkNQ6qb6hD
         Hvg+IIWPVf+TOkcnWJexGi4cTNKbK5NJMmhrQKgDSw4i9SuIzwJS7rd5RIiAUY63YlrO
         7YLFdzvsK8DEHPr5hR8rBfmYtZWqmPqM5+MHj6Q605/jN59SMfzmL++01oCnUmsw4ec9
         6WfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jctDokCQpU+5f4McBmCcNrit0g75bLIuZ0vnR/79ocM=;
        fh=vQLIgRo8xHfSOvcWkJ4e5doad5Beb9Zv7X6zmcEsVOM=;
        b=Mi/aRfTunJ2F02Z0uPSIxYAwnwCJnoMKYrrklzk29mw49vk4E51iVtNcF3pGvOdoe5
         G5mjkX7IC4JijMWdHGhWMLA4TlD+lNBTA4+y43jdmmtLbSzJObZaLUPx+8nEBDbQ49kt
         UYWJV2DUEw5+3kw3wWHIE6B19Jz42vYcrKQ5teNafRfMG84oWnThdQaGotdJyn3uPYic
         +lJMnXwfISSSmxRDhCEFOt6u1SLvHH2bCgGO7YYxjLPskMAWmCBfZMPz4AWYyWgXH8iz
         LYSSGEYcCVKoNvoeMBo4FYGO+abf01qPZZt9nyeHSDbNyP9UGNiV6CcJH2xWmZcbqjcr
         qz1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792447153; x=1793051953; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jctDokCQpU+5f4McBmCcNrit0g75bLIuZ0vnR/79ocM=;
        b=tuJUcM+rzbY1T3hPy151XGwtTm9pe5er0cE5XFCuBgpHlWmauyO44hNPXyaOBU2k5A
         mmnJCszVpsv0Pq9bmMtXp97kD/V8Cp+eTXquX1wdjYCLd+spKFDiaRse4g6thtSfryQ1
         1dWDYpOJeSVm9jBtwKEOpeJxe2u9AETKpgzKcf5Pgu0AjuDvAUSl2GUhJ72CVGdWQTzW
         5/omJaVlPyPmaUUn3+CHecWeNSW0adLhpRVsOlg1CaWGFUs1q2rqEaOvNodzMDrJHuBD
         SyKst/DGammFWm5vbEb+djqB1R3xDPZ4GXpLWq6wyrPlCKvc++5OmGrDG/dV9HqrNCEY
         9yGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792447153; x=1793051953;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jctDokCQpU+5f4McBmCcNrit0g75bLIuZ0vnR/79ocM=;
        b=IaodkZfwJrbJidPzOLSdDVmoe1SwoCRFc/dfjUX2m+mQa4WwkPuB9k1MrVPrwXJ2ZC
         UV/92ukUmcWYCj4FWZJo/KZGs2hauPHEO6t6kxnZ1A8ETjEsvTP//+8e/jcuf72xmN0S
         fs3MLw142ND027VqVcIrzDPN4MRznAO5HEgZ7KGckj8/U7gM+oNrA//e9Hh6tfQTkBGO
         VgzhNpKE1Aoda+YCr8sWGb9yr/WDrgNJ9KCRavGEeDq9fD2UdZndu4owL8bqi4NA8icA
         Cqpcvok4WRPEpeTXmcV9htriX3EDfvX/k2xg6HjgFeMfuiCiQ33jyFsk6b3jetEWJHFV
         HsgA==
X-Forwarded-Encrypted: i=1; AKwUvBwI96kG49zUsuR3i0s8B4iiu4TbePDs4vUOpd4Do6SN53DBEHads/zlIRUHwHLI5NJLqobzVESnuTs=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6i7fIY8rmXNmnVL53ez5zEtc+YyrG+XEMSzx/m1DVVhbaH2YE
	Ovhs8Hcwfbv9+vG/oB3Zvy6nw7EKtn4yjt+F0rfx0dnQoHZFOiV/LyCpHoorWgpMr/58SQMiP1O
	HE7vJXPQrslrt6d8N7B7SqadkoJHEDARja9x04hKU
X-Gm-Gg: AYBFou0GhgDKJNwOsaIfVt1oSQxrmxTycW2ohY+5vJ3tlkHUfywgmwtrcx8HHpfTPSN
	gCfvFt3Y/SmSZBnmYVnJttcvtGmg21fmQr3e9qp0boyiIH2WmD6rZmtSaEQ0dwXpIAN45626951
	gMZ6a/+bJsHQ/5Y2J6KJgzGZEGjSSaIDhPQ0uP0XS6e8bwagLKkjsWSYJ/laG+/9Pv0ARjckB5m
	/6FD3nRz5jqyXMbCOoG7NvDWTf3KW8XYNZmfKlvXpM3e7Y6i+uTG28fuHuNdIn5Y6e3Hrhl/OX8
	PRnehU/WcuFQ1Y+ATDHIPSdKM2cNZ2uQ1Touhp6vnWrXviDXV0II02axEB6XcibFS/8/U1ygHrm
	r7JFDUjrmD5Q=
X-Received: by 2002:a05:701b:2207:b0:136:c443:80e5 with SMTP id
 a92af1059eb24-1876658f6c4mr9237879c88.6.1792447152061; Mon, 19 Oct 2026
 14:59:12 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015145714.3327543-1-elver@google.com> <DM8X51YCN6AA.1HV7J3R3PIYY9@garyguo.net>
In-Reply-To: <DM8X51YCN6AA.1HV7J3R3PIYY9@garyguo.net>
From: Marco Elver <elver@google.com>
Date: Mon, 19 Oct 2026 23:58:26 +0200
X-Gm-Features: AclHuK_qWUQb64XA37ScTQq_ZMKUMtenjdgDmPfnErmCHixLBqORRUjuSE_XZSQ
Message-ID: <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
To: Gary Guo <gary@garyguo.net>
Cc: Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Lorenzo Stoakes <ljs@kernel.org>, Yury Norov <ynorov@nvidia.com>, David Gow <david@davidgow.net>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alvin Sun <alvin.sun@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Petr Mladek <pmladek@suse.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Oct 2026 at 17:27, Gary Guo <gary@garyguo.net> wrote:
>
> On Thu Oct 15, 2026 at 3:56 PM BST, Marco Elver wrote:
> > Rust supports ThreadSanitizer instrumentation via LLVM, which is what
> > KCSAN relies on; however, Rust code is not currently instrumented.
> >
> > Pass -Zsanitizer=thread and the same TSan backend options used for C
> > code to rustc. Wire up KCSAN_SANITIZE in scripts/Makefile.lib for parity
> > with C (though rustc currently rejects linking crates with mismatched
> > instrumentation).
> >
> > rustc only accepts -Zsanitizer=thread for targets that declare support
> > for it. Of the targets used by the kernel, this is only possible for the
> > generated x86_64 target specification, so restrict instrumentation of
> > Rust code to x86_64 for now via HAVE_KCSAN_RUSTC. On other architectures
> > Rust code remains uninstrumented as before.
> >
> > All TSan options used are supported by the LLVM versions of the minimum
> > supported rustc, so no rustc-option checks are needed (they would also
> > fail, because x86_64-unknown-none used for option checks does not
> > support -Zsanitizer=thread).
> >
> > Unlike Clang and GCC, an equivalent to -fno-optimize-sibling-calls is
> > omitted for Rust because rustc provides no corresponding option. While
> > disabling tail-call optimizations helps preserve complete stacks traces
> > in reports, it is optional and not required for KCSAN to function.
> >
> > With this enabled we can detect data races in kernel Rust code and
> > between Rust and C code.
> >
> > Acked-by: Miguel Ojeda <ojeda@kernel.org>
> > Acked-by: Boqun Feng <boqun@kernel.org>
> > Signed-off-by: Marco Elver <elver@google.com>
>
> Acked-by: Gary Guo <gary@garyguo.net>

Thanks!

Which tree should this go through? The Rust tree? Probably too late
for this cycle.
