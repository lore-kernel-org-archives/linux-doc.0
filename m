Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6D0332913
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 16:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780417204; cv=pass; b=IMpWU9Z+oFt0rZVh19a7yFx2zIPY6Sn8mamKV6DA92tPrsH+drP8PoPOaxyct3+5cOP7iELxvopssxd7YLUhukj4wHdtzvpOxt4CS9QLGpDe+Fy3Ty8Cr/rVbLS4FdbOe47nCX7c6Bl3EskWK0HgClHSbgkLt0jPfVjFSQXpiEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780417204; c=relaxed/simple;
	bh=ydH4/QV/1+IbTAhdeYNLwa8ygu64uWvWhoVur27Jo/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PfchiQnvfiJlKdJASw4wVIr7r8WTWZHviX5XOsI1poROm37ogsKo7N1aX1vWSLjFmvKFdzOowDLL4w9h3ffvy+ASJWmGvBRIQ2iBxtuLFEYLnUwLBOtO2RB757b3yutC7ROA3x4hKylC/pBF6aXLtxJFGhoOkShximH36TREgfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=c/VE6Dfq; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="c/VE6Dfq"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-660390a8999so6360153d50.3
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 09:20:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780417202; cv=none;
        d=google.com; s=arc-20240605;
        b=RHUu+z/+0hVY/1hss8G+uifGHhcH/u6S2gqBmt1AnRSBNHGDtHdBmnAVaviJiYrg2K
         bAApDCk2c2wTwNDZoutzJDJNn0v0iNs63Iz0s7C8eh+CyY/tAFBFVkO1Y3EoYoeLSNC5
         3H9cQWPNOpVFU0oqZv8GTNXDqB7MQev54H0jwBU5E4Klzck+CKQ8HNZk/rHA0PseCdvS
         uV2bsMICIWs9+alnc4fskiy9M/YP2boGtiqPfs6NlxG2loJ2Ja7Db3nVDh7d/rduezIV
         5MYtQ0KaoYXPMUyuwxRZCVXat7+aJuzUv1cPFcxc0ZObUISAaM9nF014JkjOlZ6h2EDa
         9+QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qYFMKnZkfNnmRXGo0xQ4eN2VdP8xCoBWS52ZR4ARnJo=;
        fh=Pv/U/GnAlSJSnqrm9WONkPE0/OLlr+7WsQW8W1n8RiY=;
        b=IpTSA+gFjkEjbnYjzHgjoQ5rzVOQjyobxfTtj42p1e/fgo/Nj5uZ7BseLxsGFsKBJ8
         pljlUdITR5nFTeBBFR6RCLGGoEi9oo+wJMfZPgcawkELxRqtlGu2hAy8zE/BAozZSy9p
         /AyG7NyGoBL2i3xjMD7Bwg9UBaulUI/rwPjm1Zzm6pCBVRk0Mr/4l+Wun13QGqQaWSHw
         REzRGsN4kh27rgmyNSMN6vP0mLGnGa48UIEJ3KfMPxox5cAAojGTAaXiBMb87oKlf34c
         zNck5fX7WtRzzEfIL0e0UmjDPJrkLk4ZIaV+x6Tt7lSuR4draF9oxYw/0hVEbqC3xBqw
         KQ7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1780417202; x=1781022002; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYFMKnZkfNnmRXGo0xQ4eN2VdP8xCoBWS52ZR4ARnJo=;
        b=c/VE6DfqYn4w+HWhelXW5cH3cKDMBvmmPkVsAt1mRpbe/kx0fpJhdpax/nVFBksa/q
         kWQOQ3TaZTqarShkrrTJKHivLOSIJRlP5ChFQxVgYC5hqdi3Kwy6ThI+1cQiLvakbV5r
         EN2CKw4yqeAbNirJuDwnGr7HREmnRWw1TVqQR6cWIWIwpsKjofo4YQYGqkv4kX6L0rF1
         3FeGiu6Xyw+dqrRgyICL5NayCKUBiSvyHv3Mf2Vtla8HNIKYLEAD6fI0S3XIcPnRNC6e
         U9PgeKeKvgpuY8awo8S5+XjMCS2FR7ESbtR2gvFFaxrelzBcqVhqbvmX5lzxFG3CThxE
         SolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780417202; x=1781022002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qYFMKnZkfNnmRXGo0xQ4eN2VdP8xCoBWS52ZR4ARnJo=;
        b=gE10LqQ1vk2wnE1Po3hBftP1zK0lt/Y893NKjIiihRQJ0Up3lBbq6mt/VJJCBaopcc
         jlRR9Qt5rokijkQYZ7/JxxWxFpYv+V0tKlR+KAoF4NOzju56h/d/E230Rc0o4ONq8uOE
         EVQcUcGsoRzgml8geRnerf1bym3vjf4WGhaoDGskzdW0k9GYuHPugiyaTc7Iv9ok9wew
         +ve8pGfjHIB5MxX5iXYgVujMI2n+xTW4q8GzTlWFCFQ4U024CeZvE5kb4ZDkGdf420SI
         7PdGODWkRWaHPtUBsyhh4wgWTZGPDXEahYVP0SeQQdD9Ze22cyKovjHp8G5ex+lQ7Ngi
         LYQw==
X-Forwarded-Encrypted: i=1; AFNElJ//1ILuE86ffHzh9uNC1Vj/fmYg9CT/01YXDK3Y3FX7gChqqx7xqod/0zeVXVE0f8PnvPOVHT3yElw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx5KDew4pg7OKA8b/zw341aT6hIFzYjoWnBvC1E+7tAKWjI4ib
	Ag2kf83EE4MMwIfqwnNwf7PSS8KjbdJi5r7AS8D5Z9kUAb2cQkS+NU6rfhEMtct/7+hXT/muLXa
	YMElRTx2JjKLREd16oq+S6fT1YjgG3pTaepTF4D3ryQ==
X-Gm-Gg: Acq92OFuYwVL152Xa9Uf/XrPnzuGpzI02g7WaEvd1mLTJdItFesopRM6lFJ0yX0exaD
	x5XY07eaIc0Mmfg0nRyBQR7AxbVCpkVeKlnXXGxE3pJl+FZDTziipauJKJhCaRW4LLCy5jxUAfO
	xj9wa/+NIh9OQZ/64npgOro8yHsioAzcochw0Uv30ciFWh8j88v94Gsctq736MIdjJtZ/W+WoLK
	r+KdSTxPsjHLIDGpFhIPQ6I/3YkFcn1kwnlPJIk3JC0RnTiOBSwIRK7H+rHiRS9s6XdSSooMAeb
	AzdcxJ5x0nxUpkTLDOXnMw9nB0Mqy3cQbQ==
X-Received: by 2002:a05:690e:23c7:b0:660:367d:539c with SMTP id
 956f58d0204a3-660d61a5f90mr366583d50.65.1780417201973; Tue, 02 Jun 2026
 09:20:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-v5_user_cfi_series-v23-0-b55691eacf4f@rivosinc.com>
 <20251112-v5_user_cfi_series-v23-6-b55691eacf4f@rivosinc.com>
 <87jyslndo4.fsf@igel.home> <CAKC1njS=AHu6uHrH4ae8VxcdEbhgiPXYCAoN3F_mnppBd3SwOA@mail.gmail.com>
 <875x44o9hj.fsf@igel.home> <CAKC1njSn_rtCj8ii876PNQTk0nsCTfWsb4DzdymufHVthh1Rkg@mail.gmail.com>
 <871peqgp9v.fsf@igel.home> <CAKC1njR+dTdvp+BmLGPtgd8dufiUwBtkQ9a-qinELT_Fmi13sQ@mail.gmail.com>
 <87wlwif04z.fsf@igel.home> <87tsrli6lt.fsf@email.froward.int.ebiederm.org>
In-Reply-To: <87tsrli6lt.fsf@email.froward.int.ebiederm.org>
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 2 Jun 2026 09:19:50 -0700
X-Gm-Features: AVHnY4LGzvAggFLA4mHNoi-t9ivcZhZK65HitG7Axu1HWjT50Q9msXqH7dSmtzU
Message-ID: <CAKC1njRapOxS6ibQdCuES1E3aAjsA+yGz4yZ1xJAZHU2vkAm_A@mail.gmail.com>
Subject: Re: [PATCH v23 06/28] riscv/mm : ensure PROT_WRITE leads to VM_READ | VM_WRITE
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Andreas Schwab <schwab@linux-m68k.org>, 
	Deepak Gupta via B4 Relay <devnull+debug.rivosinc.com@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com, 
	rust-for-linux@vger.kernel.org, Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 3:23=E2=80=AFAM Eric W. Biederman <ebiederm@xmission=
.com> wrote:
>
> Andreas Schwab <schwab@linux-m68k.org> writes:
>
> > On Jun 01 2026, Deepak Gupta wrote:
> >
> >> riscv uses `VM_SHADOW_STACK`. It's just very simple to use `protection=
_map`
> >> with just `VM_WRITE`. On RISC-V, `-W-` is a shadow stack mapping. It's=
 not same
> >> on x86 or arm64. So `protection_map[VM_WRITE]` simply picks shadow sta=
ck
> >> encoding. We just ensure that PROT_WRITE is converted to
> >> "VM_READ | VM_WRITE" at vma level.
> >
> > That does not explain _why_ you need to make that user visible change,
> > when others can get away without it.
>
> Especially since as I recall the decision was made was that the user
> visible protection bits would match the mmap call.  If there is some
> combination an architecture does not support that would simply not be
> reflected in hardware until some future version of the hardware gets
> around to supporting it.
>
> This is what happened with executable page permissions on x86 for
> example.  It used to be that it was not possible to deny execute
> permission on a readable page.  Later that proved sufficiently valuable
> that support for denying execute permission was added to the hardware.
>
> That all happened quite transparently to userspace, that wasn't trying
> to assuming PROT_READ implied PROT_EXEC.
>
> So I am at a complete loss why someone would choose to break userspace
> by confusing hardware limitations with what userspace asks for in mmap.

Initially my plan was to re-use (only) VM_WRITE as (alias to) VM_SHADOW_STA=
CK
on risc-v to match hardware Write-only PTE encoding and I didn't see
any opposition
to that initially. Until later when it was suggested to  use distinct
VM_SHADOW_STACK
encoding.
Although there wasn't any oppostion to this patch, seems like it made it in=
.

Now that I take a look at it, I think it can be made to work. Sorry about t=
hat.

Now that I have switched my affiliation to meta, I'll have to spend
some time to set
up risc-v dev environment.

I'll send a patch. Thanks.

>
> Eric
>
