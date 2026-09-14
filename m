Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B1641BA98
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 22:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789425392; cv=none; b=MnPrebKJ6gxRO6y4uwYyDSEHcsMZff1sylgwMByXAcXgIE7YlwZoYmrqUOtutGaDpEBwtwUJYeMS8bURQ3+rBgYkDZKR83O8SedloOwKYL36CcribuP80LH+CRFbKUlp40V8dxOeEGNTq0SHxRHjoAGSoTSUyKJhjoLYMowCqQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789425392; c=relaxed/simple;
	bh=3pbB/cdA2n+mw9ojxn7xAJ0JjyYJsv3yomOKFEBUOog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SAkQ4liwDMhwIGXonBxmBPMSjtt0lDtoUinMTVYhSkAaMGZMJ/CW5hFJwYMgKnRcsaRRDZAuDiHDtoaVJpX848HKeR9orZbQHPYa0PKO3wjVBr3EFl5R93Mey+jHfKPCYrSa36Y+lJCRN40AGUQmBHD/XgZo2VTRkvR2i3CJDn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=UQZ2hBUP; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UQZ2hBUP"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f705536so619865966b.1
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 15:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789425388; x=1790030188; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=doHeCbdvroV7mGBSmqv1XRXXxfYTXe+sNzLZzLwqdyM=;
        b=UQZ2hBUPQF4gMpffRluEXGD3ClTnCUwk4aNUgryRly7o/EKwOpM8s1noow0hJKIkhG
         2rq1z5xUUqC2rDU6P8kJ2Ks+cOhk97iG0RTfFBFBLlAXEdJ3kBFrg2VOQI7R0aCyuASw
         xh3kpEuQI6YXh2RKKSFycS9rOLJdaW1BLjLZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789425388; x=1790030188;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=doHeCbdvroV7mGBSmqv1XRXXxfYTXe+sNzLZzLwqdyM=;
        b=c0HTrJGle8gdiXNYTLBvOyH5mHiOD86KsA/PsqfT5voVsSEktC21xN3JxtO8SOlNuX
         a3zQQ30pcRj7CXcd1zEOSXY9EXqFMSNSzMlRa3bPB6A+UKyO0czA+eoJ7jFQkESJaj0k
         MDIXyO3pSGSZXls/4Wm8czK8xdndKqC5p4AxGU0aTBBvDA+Qkn0IB3hczkedir7zz3h3
         RVmVw6Vo0Im635LcchtKtXNy3lOngr5YGpYiBJGP5nmVPdbu8qYgqd8vWp8OwkFUfBH+
         UDD4/UkOAV8N/2hly6kb0vwF2scCNMxrtiJ3ncuUSU00KcgXJ69IRTLr++53EzqqfCeu
         UvFA==
X-Forwarded-Encrypted: i=1; AKwUvBw26CcJhiimLDNaNOSfqRedKiVkoY8jZnuXd+PpSwe7fOc1lblkaq/wBS5f3T0cG6FFUyVCnREoVf0=@vger.kernel.org
X-Gm-Message-State: AFuF++nHxc5GMrAm54ZoDSybFQQAVMNr9Cv6VG/IlAjzuJxVj+ZyfvWX
	fYdAqQX9xJNnvp9iBOo0PWVPoMg9Z9HkoWFjlHKvEt9FVpHFYahTbVEdhk5QwMXf35LnTVzmZUN
	TnTiS4+5Qcw==
X-Gm-Gg: AYBFou1ceeqw03c3/dLdTHLkYR631A7FdfT+gI9/G3vlEoQ1GvPpD15/4A0PjZ8CmAq
	PcsuV0mAUa1LTB9UnwUJdydzdSKyETlt+CUEl8JK9qYK17zCcwar//vEJnKtB7I6mpLg63VBaDK
	QwPYwmBczVNtWGk9W5N+U1U1N5CQq7zR4iwfUqQ06tLPjuHjC2Y4tLD+gkkMRgi0sMXb4ShKIyy
	hyMphJXt+/6E14bZg9mcTgHLojfdvHksoNK3lUH+got6ONK9bxAoN7xGNqRHpaskLwTxQuyyfhx
	Rs6g2gnvKXM4k0EraCGNHdvnMgJJDEtxm9ko98mSKgxJ0bU8OY3OLhCPl4opSKdHlZm6R+3blgT
	jj6PeFv4tCDfkXgD+Iu+Qkgforvr/j7PFck2A5NveOCi2LUAlkFXXjlAiaKSI3DPQGcgmKmpuoF
	kN7ftDTkwi2bKAUEq2EWrMByZ/g2NkE5amXmcnBKF87/nR8QOdBMhCONeF6Cc8WvhQGNcMmSm6V
	ng+UrqEcMnWF4DHaaAed9IX0lAdTwvAmvk7qPLHyVoloSVnLQ==
X-Received: by 2002:a17:907:c13:b0:c26:1648:a06c with SMTP id a640c23a62f3a-c29b8770a38mr318515766b.39.1789425388281;
        Mon, 14 Sep 2026 15:36:28 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966122101sm492963466b.54.2026.09.14.15.36.28
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 15:36:28 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294496989aso460071766b.3
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 15:36:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwGpyiQfd0Jj1zT4zK5M7bWRN9JwRXviaTptrLZ1s6nAlMPu34aG1SDAyVwwEuP2jwLmNGLV5RvNkA=@vger.kernel.org
X-Received: by 2002:a17:907:97c9:b0:c29:4415:2ebb with SMTP id
 a640c23a62f3a-c29b860109bmr315536666b.8.1789425035842; Mon, 14 Sep 2026
 15:30:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-15-39817ec5db23@kernel.org> <aqhLhVMkNzf_4oJw@jpoimboe>
 <CAHk-=wiB9MX7vBDQ+WHTUVfSYubLhR-PbABewscqTsxRhg-LbQ@mail.gmail.com> <aqhmhmgrnN3Mw8yG@jpoimboe>
In-Reply-To: <aqhmhmgrnN3Mw8yG@jpoimboe>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Sep 2026 15:30:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj3BKkCYtmfs5sORF_+Oumv2Gc8D+YxkMp9W2-mvLS=Ug@mail.gmail.com>
X-Gm-Features: AcwNN1UnWAKTndckmaJ94decAtfrWRGA6P58dk0oXtHcS9ajgGc6O7ZKSXjYJOY
Message-ID: <CAHk-=wj3BKkCYtmfs5sORF_+Oumv2Gc8D+YxkMp9W2-mvLS=Ug@mail.gmail.com>
Subject: Re: [PATCH v2 15/21] objtool: cache relocations, do less work
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sept 2026 at 15:23, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> There might be more efficient ways to structure the considerable amount
> of data, like replacing "struct instruction" with "struct basic_block"
> or so, but it's hard to know whether that would be a net positive.

Yeah, I was thinking that you'd only hash instructions as you find
them if they are obvious "I need this instruction", and then try to
hash them *again* if they are branch targets (and just have a "already
hashed" flag).

That way random number instructions would not be on the hash - unless
they become branch targets.

And you wouldn't ever really have to track any complicated decisions
(like that whole "basic block" thing - I agree that it's painful,
because the shape of a basic block will change over time as you find
branch targets).

But not a big deal. More an idle thought brought on by that other
patch that changed the hash table size, and this discussion that was
talking about the hashing - or not hashing - of sections.

So more of a "if it is easy and straightforward" kind of thing.

             Linus
