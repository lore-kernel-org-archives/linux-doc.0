Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8040E49E12A
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 17:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789148024; cv=none; b=WGHp+qyO1K0yWJXM1eCaKrlyRKLA0PWtzaC9e+Q5KwlWWc1rK5Zqp5N30KZS55ZyGky2XjMtSU48R1ifFT8QZ/9x/0Qbk7bqmpqoM9GXwWkcIxNNkFya5p4uPWGSsbw35QDg9HhSQmr2UTnCbXD07O563t4KIqDcPq2Jzv3NRmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789148024; c=relaxed/simple;
	bh=76bsxwDnANEo0kLB2mrhhQlwm4C2VGFZMyLQwWFFfs0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aej6tijNv9ApF+GryAM9QOKcJ0ErlkO/CAArxe5bbAVfGKst5uPYynxUVg+Ht87TESq55Br8GorTYBcxARIte1xUSpd8/bvu8jv+53U/UclNVsy8wzV6TQqh6fZrlGfI2SDSxdKOS8FugFvExVTqji89kBSU/526kw9LZWBMndU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7X+6rKd; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7X+6rKd"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so782045e9.3
        for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 10:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789148015; x=1789752815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oHkfE3imp4BQyC9rRB22q5PBnbDLbNtc6L6K0uF99Ik=;
        b=l7X+6rKdv+a+2H9VVk/5tjdV/dmauzOsd9F3pLAjg5HKAH/FbYRyfRju89HHYQmlIh
         arCHlImki9lN/iEttOdBDIpQE8dtpaRgOVCCIK1cLrxshaTAa7jOqOlJEufOQp/MlGyG
         In0ltJN4FX5H1F2ZrleEquQHblmeAJdU6xem8UnmqQ0bw0QYX7FyJUUiHyP3WgtXyic2
         /vrwR89RC3zM6P6WHF8EACv8yCNoehuRQUKnlo/Ng89fDphZ/psxu0e9yHI5Bx/h7kq7
         TA3IaIXaWvcxdNrlRriEDLfuMfm0JtB7Tp+EwvmrIfdvCHlboxOTSfqLmfwyPZoBcDcE
         ElWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789148015; x=1789752815;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oHkfE3imp4BQyC9rRB22q5PBnbDLbNtc6L6K0uF99Ik=;
        b=iUfkGMPJ/LuaPX0x4eMaTqbL3mbaq+DnvHl6dCEeBWJzsIZhTRv568ucLVWLtH1POB
         4hJmmMOl89fK1aeAbx0qp5lVQmiIKKsyN3C8bUqzwEc3OfGLrb3vLVZW40iXHA1EwTyi
         sZuLdyb4cjLLOr9scbjwAvmb1aowwfMplbkpYcavEIzeYNNZ1DaeEyWfzBIVyR5hrm/4
         i6yZWe5c3+rKCPjrfAfm5CqIuxnZVZhpp+rwcnbhSj9adc6Cf0Blfo+suMGwlA2yJ6td
         5L/rmqgIbc8OJOePmTOq3OOKxai+lmmUEg4WqZQwjbZkf4vwluLa/Fxrf87FrbypvWaR
         +K7w==
X-Forwarded-Encrypted: i=1; AKwUvBwa7ho5e2YyC677UQYP8dJfOOGT4sH/tb5s42bamrZDTLcsva7lxBzbZCfH8Ih/bT1/ce3Sx+C5H1g=@vger.kernel.org
X-Gm-Message-State: AFuF++lZvzppzsMbe0jy0C1ONL8MqGuUa3qD69MRWTIPhYRg6qVXginp
	f2q1lIhfa6IqgHU4H/WHJ/1OA6xuoHTw11uTV0kuD1wqavX6GZgolUjn
X-Gm-Gg: AYBFou2WAs1o31+d6Oh+pIFM5Ww3Y2tIpzzk5RWTKhvNuiCHQrCq+9hkzdsgVRe48Kc
	1DSLuNwVTBE0aFxM2NTZ9ecl6mx1yYiPBieevbdBZAhxvrI0nGWYLiqUFlwbPDuoRJd2GJZA7q1
	ypBZ4JJ0DwM3FkbsmX+S8DWU6GLKY8FXQsUp+GIQWqkUXXipo7EqYj9Ouj+ZSUaJE/av5KJaBpF
	KC1NBEz7r7ufo2VsNvF3lwwhVJ8UJuZYRfppAbFC5nVrxrmECmp1bT40FLEpj3EDwEnxs0T/YIL
	8pVwL/NNjsBbzpMnaIGMfBV0EEUMx5ifuwWuqqbAssBxkBOASnvWCdDauYbdFN61r5TyQHuDl9i
	sGWpcaorF9r0u70z9dMAhVo51tqsJ5PUpPLxZjukvVxzEacFSWqZW+SyMiX0Q7gCRVub39i8utv
	H9Gw6WvVN37sm3BOX+KLfyBIaq5+xgi/nfsGicQCasBaGEix5tMLNFcod6RrFrDgM6B2bkGvCDW
	so31bstUFbwlq4Fr0/vWsv25lXk8q+059ny
X-Received: by 2002:a05:600c:4e0c:b0:49c:ed94:cdd8 with SMTP id 5b1f17b1804b1-49e6198734emr158528945e9.6.1789148015226;
        Fri, 11 Sep 2026 10:33:35 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm80821885e9.2.2026.09.11.10.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 10:33:34 -0700 (PDT)
Date: Fri, 11 Sep 2026 18:33:33 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nicolas Schier <n.schier@fritz.com>
Cc: Nathan Chancellor <nathan@kernel.org>, "Lorenzo Stoakes (ARM)"
 <ljs@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
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
 <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 12/23] kbuild: avoid re-running compiler and linker
 probes
Message-ID: <20260911183333.1df0f2e2@pumpkin>
In-Reply-To: <20260910-translucent-sweet-sidewinder-7acacb@l-nschier-aarch64>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
	<20260908-build-speedup-v1-12-5dc1ac01672d@kernel.org>
	<178901395292.3971858.13236774094648272066.b4-review@b4>
	<20260910-translucent-sweet-sidewinder-7acacb@l-nschier-aarch64>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Sep 2026 17:42:35 +0200
Nicolas Schier <n.schier@fritz.com> wrote:

...
> Yes, skimming through the patch, I thought about that, too.  Moving more 
> cc option checks to Kconfig will make building out-of-tree kmods with a 
> different compiler more dangerous.  Maybe we will have to make the 
> warning in Makefile's prepare (external kmods) target a bit louder.

One problem is that distributions have a nasty habit of shipping kernels
that are compiled with a different compiler version to they actually
ship as a compiler.
In some cases the versions are clearly the same - but the version
strings differ.

David
