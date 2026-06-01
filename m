Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE052306742
	for <linux-doc@vger.kernel.org>; Mon,  1 Jun 2026 16:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780330952; cv=pass; b=B6zonfCGhTQplXvs98HLhdyE/mGYmR/yVrMWV2iAsm3ky0BAglqVbdp1cAcQI2EsJ56m8bo0vSglJzjh+k97UMpPC4R4vehNyGkIm/Zko5g01C93uAw4rSGeDA6n2J8OJm+O4TL6oBpc0AWGQRciY5tET+c/26K5ATww4aVekCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780330952; c=relaxed/simple;
	bh=1CJ/NuXAzZ5JX1S4E7zNfocykkD792/QQHjbajG/YH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jj3NOH4hBVPQSk24vIkCXZW8izY+Pw8jbsI8czC3VsO+8dg0RYNzAO8hIy6opwehL1MhYWyM4+rp/lPWNkp4r5gr5v1iCB2FcQqRG30SP23R0EoaEAPCo2lv3LJPvGRFUfHWzNdu1aUuBlwUcDMmUgNcJA+Y2kBiWdJRjzCJVmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=ZZc4dK9u; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="ZZc4dK9u"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-660390a8999so4845308d50.3
        for <linux-doc@vger.kernel.org>; Mon, 01 Jun 2026 09:22:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780330950; cv=none;
        d=google.com; s=arc-20240605;
        b=a1FVZfTLA6pGkZTBbAN61mUQRP1NB64j0GXd9w9Pvsp/EUiLAEniPZJZC9hEYL0i9L
         r1z1hkp02CPAySXnXMAJnQFtSeMyvFM5biYXFRd/Mg4YV84QqNj/ZOuzSxxdD4S1SIEZ
         ZOqN2pMIN7VV+kOOKpz9oKQVhw3XF8D5DBy+amDUjH5r6cDwqFLwkqZ8CMdMCdugI7X9
         3/n8rIjxEmrOUhoRdTUy+5PhOoHRFNUyctGa943rfcKxTd6H+0GeK0ZVjC6k2X0GWah5
         f+qqgHiZEc7W8vN73lMecbXK/lsbOd+ykMvQQq8vjFX6bBSaJ58EwL4p++bLI2c0osHh
         HuMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A1Wsv67Vk9GRUFlRdxu2VA3iBYDzYBLeu5jipj2Jvzw=;
        fh=Dv1Qixj0lbs5Y5T+iHs6scLlmpz8BKzhcHjN0vkl76U=;
        b=Q5OW1MDrfhPcDRClumsbltQ+2OLYAJNW9hm0F6LFmkgcS1WVD8zoY+A02me6VxM24/
         nwto54GrTxP0xUIoyYg1bT2u8AXM/f9roD6OKGBrKIRCDyyJxLVN3SpIxxYv9Lt7pwNe
         1E1Hbd3PFH8YAh+f5//pSIA6x674YQfmxKch/nedaUAXua1gaE/OZ89N3+5r43owkN3c
         1lWslbSxnkrb2RqTs8QXRBIfTHpiNYwfyLxPBy9L+jKRyHc4KponoC0QFObOxQfbecz5
         yjeqI2QeYgEhjtHWEWl2WTM3QmP3QCrW0c+d7Y5uW6E6etRo5N1h/8TZcWozQDL2mGoF
         9o4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1780330950; x=1780935750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A1Wsv67Vk9GRUFlRdxu2VA3iBYDzYBLeu5jipj2Jvzw=;
        b=ZZc4dK9u05zgurvFAOaOLR3nhhDSbBr+S0195BgZYoqbIqIlom8Nx2pPajSShMRWJy
         QdzjY6nQLIXKwZhJCSe2tmhnJVCpn+3Bb8vRAIJg8hyLQmfNUg4PJ2b8qs0YkgOLtVXv
         eZPL5bYGUUFcAPc5espEdg9PPKDaHdiA3e4gjDOvfEhEPLClW9TfGMYlFawOpYL2YzFm
         30xDKK9jFOBAOdSGq/49sOl4GLJKaKqlcBIeFqYIuI4ha0ZfZ8fKfbxzOsV36f8seF/y
         jdyArgOGWI0KueUMJu1rnZunngQBfCNjtYM31rfBwdEHd8GppRPbWi+ugrf8E2MGt9rv
         fA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780330950; x=1780935750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A1Wsv67Vk9GRUFlRdxu2VA3iBYDzYBLeu5jipj2Jvzw=;
        b=JBkLTubJaIcjdmj6+6JcW8yesUF23FFdNnsHWkyAWk8XhbfarvpApYmwwwq++o8XoK
         HyxDNTJBNMxidEAOq55cCfBLso5LrapBkZZaK2TJC5Cp5NJYQTQqOlrDs3z9LNMxM7Uv
         ZkHAdUVHs9meull15NcRIX1OKJ23fKxIp1DlDcJS0nzeBz8BJ4QcWAwO0uHTVc5HHxD9
         ySxTa4lVG/TBV0eL5xiEY60TmSexroTosZhB95G/Z7ADBxzd8KUs6GxR5Ao0OUqlQWFd
         /+WaRbNjsxAcRHNKOtjLotCT9s48HHqxas4OaYZ8h9Xnq54wE/hOtjaewFpUmrsFz3KQ
         p5Tw==
X-Forwarded-Encrypted: i=1; AFNElJ8rN41EMaWqIGRN8W/cRJOa775tPgs/ZGkN5NP989vPNDy7EGwEWeMmkRGu6Fvq6bsI7d4VXXhOKYo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUrVGdovvePJ4kfCGU30GcaUI/+X2V9WE3kyFfY2k4Whc/nrcl
	5fj8YWePLnx+cvXz1BwASKaK/mwkbkiEtvUEijcze0LtS9McBeiRPO7Xy7htiCrA3+huqa74Okz
	DDpY30dBfG4uRt5wrzqKeDfkHN2si7jB1qTz1PQqamg==
X-Gm-Gg: Acq92OF/D19knTPAvRe+7960Oj07knad+12HIzmcOF51hUpq2v3Jyk4uwGlkKCjla8y
	pF2Y60T9Ypugo34LkkK7IQkci8rYFd4199bj5HUYQllgZCb5LYSnqescrdU8usxm0AnaezMn+yH
	hx/5zlhUc0+KelTwzdVCHMDgTOPL5ox9CeTP6OgQagO5AxgnoMnVFzbP61vhaKJ0BR6Y6Z0swLL
	WwFpujq6YX8lsY7HXviKy2ISVGjzFJephgRBlBba4WWzVcMdrY397zx2HZNn9O3sHHh7VcABtDh
	kqfj/qiwBw8QhNpeAtfFdw2QjxTXPgVGdt+JK4EkgBNuD5R8lU8=
X-Received: by 2002:a05:690e:138b:b0:660:7b47:24cc with SMTP id
 956f58d0204a3-6607b474ddamr5466859d50.1.1780330949770; Mon, 01 Jun 2026
 09:22:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-v5_user_cfi_series-v23-0-b55691eacf4f@rivosinc.com>
 <20251112-v5_user_cfi_series-v23-6-b55691eacf4f@rivosinc.com>
 <87jyslndo4.fsf@igel.home> <CAKC1njS=AHu6uHrH4ae8VxcdEbhgiPXYCAoN3F_mnppBd3SwOA@mail.gmail.com>
 <875x44o9hj.fsf@igel.home>
In-Reply-To: <875x44o9hj.fsf@igel.home>
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 1 Jun 2026 09:22:17 -0700
X-Gm-Features: AVHnY4J6Ejb9kcuTR-Xh2mJuobUXOxxIDSAgxNY81YZ-jI0UDO1cEHEz8fOc8KU
Message-ID: <CAKC1njSn_rtCj8ii876PNQTk0nsCTfWsb4DzdymufHVthh1Rkg@mail.gmail.com>
Subject: Re: [PATCH v23 06/28] riscv/mm : ensure PROT_WRITE leads to VM_READ | VM_WRITE
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Deepak Gupta via B4 Relay <devnull+debug.rivosinc.com@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Jann Horn <jannh@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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

On Sat, May 30, 2026 at 2:47=E2=80=AFPM Andreas Schwab <schwab@linux-m68k.o=
rg> wrote:
>
> On Mai 30 2026, Deepak Gupta wrote:
>
> > I see two ways forward:
> >
> > - It can be done in generic way where incoming PROT_WRITE means
> >   PROT_READ | PROT_WRITE irrespective of RISC-V. Although others
> >   (x86, arm, etc) would have to weigh in.
> >
> > OR
> >
> > - mmap04 LTP test can be updated to expect either of "rw-p" or "-w-p"
> >   whenever only PROT_WRITE was specified.
>
> OR
>
> - Add a new PROT_ flag.

This was settled when x86 introduced shadow stack. Instead of having
new `PROT_`, it was agreed to create a new syscall for mapping shadow
stack memory (syscall: `map_shadow_stack`). Scenarios like `clone3` or
co-routines required manufacturing a shadow stack, thus necessitating a
new mechanism to create shadow stack style memory in demand. Instead
of having a new PROT_ flag,  a new syscall was created.

>
> --
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint =3D 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC=
1
> "And now for something completely different."
