Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E168F49
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 15:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767885046; cv=none; b=O2c9eSYSJBfv11qaqfCdfO70s+FueWn4q86UNC9pVaK14ySAmovJZVZ+qofzs5HxuzSiyCqGx99tO0LwGZfVTewUwHkRgO0rpEJg2gwzrYg4Cz+zYD6ix/1nOZrSupcuJ8Oz1g2BUy2Uz7EPBB2yrRsE6yk4X6pO49YKhxwSU0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767885046; c=relaxed/simple;
	bh=C64R9vkxaI9K5ONeC3tgaLirXTXcWSDMfLRS3TxDK8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eQwCX/O0/9rW/c2erISQiOqApb9eTf3q4RKEPhZerujbirQWEMbePkjTdSb6RXoKby9c9TZHW9GbC2NzU4zSMEQSDAW7rSnWvgdCb7McQSpkzDwtNjNlsgn1UWiZkfpQTNhPDSF4a31C/CAh9rxpDRu5jYefUSE67SvsoOBM0P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=IV37lyqx; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="IV37lyqx"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-646e2b3600fso2993338d50.1
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 07:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1767885044; x=1768489844; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QTkbey9LWC4b27P/G+EnN+lFuImbI+lYFoSxJEGXtiI=;
        b=IV37lyqxJep/5ajHTExa7SHZy3vjwyq5ntmGicmKUKgrvygjZPpOn2bfiTpIWobWhk
         IWs5pUbC+vQCl/WCppd2iPEavLxoStqCg1xP3I1GgBoXqPKor7JCgshPYAdU9lXAGTgA
         vePeN6LzMXucEhQSHr1yFtRPsGsOyh+v/LFWE36UZhiLzNicZ1kEoWIS6OJqBWdUuLJi
         b5n5wKdDmy6KfFs0me7P6uevmyaIc8qi1eGUTrl299YgHA7fjZdTwIueqmsYQ/1puMWR
         YMHg1IY6SlhUiHKl1Ie570K96HL/H3BWRDBs4R0tFjoVmdwoasS+Q0koJ/pwpZfQ+FBe
         tR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767885044; x=1768489844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QTkbey9LWC4b27P/G+EnN+lFuImbI+lYFoSxJEGXtiI=;
        b=e8S0diF2KKESFmkoarRhnouBbU9vd3HHzKQnckcApITcaUJMI/Lv+9+HYrXz6hE7Hy
         ZaR5zrHELsGVjC4bRr51jc6c7yEoF1M0HP0ME9r0PIXNpU9w0Kh3u8HeaDqOQF339NNJ
         I7s7mGiyhMHoHZ+Srs6yjNuUPOX83aRDmKjrK389rjrQYCvD4sF/b7Ocra1vtkFq6IKZ
         W81aSbo7JhppoEpkk1xGQl0QOvrrbkbgj6ioeIgtMrcmisPd/Lpgqij5WwOyFP2zwjfa
         ndEkPYeJcRbFo1nP3bDuAhYdSB1u8uc6+vNU+wODNAdEaueoe9aii6S6KwbFnEaKZyz0
         oIiA==
X-Forwarded-Encrypted: i=1; AJvYcCW4D3jyGkx7iwRyX3qI4WP1RPP1D/UpI/SBBD+aabIqtSdLv/8BnWHgjpLdqUdeYF5M884h2zF/YWY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuE09qjXNzDnEdAiYegtbjL/X7jiQdHg4AxhkEsKSiMaqmXL9j
	Qkz9Mq4rYwvSXlBvz2OSr4/b6FXGYkSjSI7RG8TuFmMgc52JqgnKyNKLWmA4xRXEtp/tiSZLSP8
	GPDRcEVJZB4LSVAHWvHLDRC/8iNcA90lLB/3p16qAiQ==
X-Gm-Gg: AY/fxX69CIVTQtpJ1rRQ3Vjv4/Xf6PjJ2puP7bwW9+BJjzQJGg59uMGw45WtzDeu+zH
	ZHNC4nwv8fO7m25XtuZ2JyxCvKm7wpXO8aKylXFFH+X6X3ASwhCsiZmV3BBgoEcThpvHuXJcnwQ
	A1TaD2DTHzevsrEvQT4ahR1VSwdaH4imuDKIaVXmtop0VR7jLn2SvMKPegcsMlFJSJU9T5c7A6c
	zEB0AsltW25YXkr4wnN7IAiazqcyhh39rHM0/QqK4iFn9/G0C3ISFxMga6FAVuHm036Cw==
X-Google-Smtp-Source: AGHT+IHwlV11mJiZRvrc0ba9gyUKkJLs3Ivv5ZO/Sp66Caj6iICdWSs+vjcbtX7JeT7w+lz4Sr6DicIt8PKx9jaUzQk=
X-Received: by 2002:a05:690e:b88:b0:644:6ad4:fdfd with SMTP id
 956f58d0204a3-64716c14086mr5723963d50.71.1767885043558; Thu, 08 Jan 2026
 07:10:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211-v5_user_cfi_series-v26-0-f0f419e81ac0@rivosinc.com>
 <e052745b-6bf0-c2a3-21b2-5ecd8b04ec70@kernel.org> <aTxf7IGlkGLgHgI2@debug.ba.rivosinc.com>
In-Reply-To: <aTxf7IGlkGLgHgI2@debug.ba.rivosinc.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 8 Jan 2026 07:10:32 -0800
X-Gm-Features: AQt7F2r-MFLse9aM2Y-9SmWOvFLm93MsLbBkGvYnQc0D6QLcC_Q6_utP6Kihh0s
Message-ID: <CAKC1njQ-hS+kUJ0C_v0oqZW1EZw2zAXMp-SnnA-ZXh_H-SoVdQ@mail.gmail.com>
Subject: Re: [PATCH v26 00/28] riscv control-flow integrity for usermode
To: Paul Walmsley <pjw@kernel.org>
Cc: x86@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
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
	richard.henderson@linaro.org, jim.shu@sifive.com, 
	Andy Chiu <andybnac@gmail.com>, kito.cheng@sifive.com, charlie@rivosinc.com, 
	atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
	alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
	rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
	Zong Li <zong.li@sifive.com>, Andreas Korb <andreas.korb@aisec.fraunhofer.de>, 
	Valentin Haudiquet <valentin.haudiquet@canonical.com>, Charles Mirabile <cmirabil@redhat.com>, 
	Jesse Huang <jesse.huang@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

I have a bugfix for a bug reported by Jesse Huang (thanks Jesse) in riscv
implementation of `map_shadow_stack`.

Should I send a new series or only the bugfix-patch for implementation
of `map_shadow_stack`

Let me know. Thanks.

-Deepak

-Deepak



On Fri, Dec 12, 2025 at 10:33=E2=80=AFAM Deepak Gupta <debug@rivosinc.com> =
wrote:
>
> On Fri, Dec 12, 2025 at 01:30:29AM -0700, Paul Walmsley wrote:
> >On Thu, 11 Dec 2025, Deepak Gupta via B4 Relay wrote:
> >
> >> v26: CONFIG_RISCV_USER_CFI depends on CONFIG_MMU (dependency of shadow=
 stack
> >> on MMU). Used b4 to pick tags, apparantly it messed up some tag picks.=
 Fixing it
> >
> >Deepak: I'm now (at least) the third person to tell you to stop resendin=
g
> >this entire series over and over again.
>
> To be very honest I also feel very bad doing and DOSing the lists. Sorry =
to you
> and everyone else.
>
> But I have been sitting on this patch series for last 3-4 merge windows w=
ith
> patches being exactly same/similar. So I have been a little more than des=
perate
> to get it in.
>
> I really haven't had any meaningful feedback on patch series except stall=
ing
> just before each merge window for reasons which really shouldn't stall it=
s
> merge. Sure that's the nature of open source development and it's maintai=
ner's
> call at the end of the day. And I am new to this. I'll improve.
>
> >
> >First, a modified version of the CFI v23 series was ALREADY SITTING IN
> >LINUX-NEXT.  So there's no reason you should be resending the entire
> >series, UNLESS your intention for me is to drop the entire existing seri=
es
> >and wait for another merge window.
> >
> >Second: when someone asks you questions about an individual patch, and y=
ou
> >want to answer those questions, it's NOT GOOD for you to resend the enti=
re
> >28 series as the response!  You are DDOSing a bunch of lists and E-mail
> >inboxes.  Just answer the question in a single E-mail.  If you want to
> >update a single patch, just send that one patch.
>
> Noted. I wasn't sure about it. I'll explicitly ask next time if you want =
me to
> send another one.
>
> >
> >If you don't start paying attention to these rules then people are going
> >to start ignoring you -- at best! -- and it's going to give the entire
> >community a bad reputation.
>
> Even before this, this patch series has been ignored largely. I don't kno=
w
> how to get attention. All I wanted was either feedback or get it in. And =
as I
> said I've been desparate to get it in. Also as I said, I'll improve.
>
> >
> >Please acknowledge that you understand this,
>
> ACKed.
>
> >
> >
> >- Paul
