Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E9D3E95B8
	for <linux-doc@vger.kernel.org>; Wed,  4 Feb 2026 12:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770209720; cv=none; b=XjT5CoPqSY2/9bjPLGk0i+8ngsD1JeKnQSwCclFEqJaxqgTK9wG0pseUsbQG+Q874sF555+8wJ4V5TsUN2vPr64aOIXY1sd7mQ6OI2AAsh1ZwAWVco00xHvR8nMSbdUX4tco2o7//HCHsRhyv/dGenBKO87+CGmjxLa/4y3v678=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770209720; c=relaxed/simple;
	bh=ddwM9hUErPvTXnX/Iez0I4H7U8pk9eWGlH28znHiJ80=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Q7D07upja6vtT8Bayk+wBfRk5x+y4+2RQXt4hTEoDUAhUs55+Q6+BncxgKnmpZIr3IPnWphrr4jdLyf/AJ4k4LtrhbjAX43NvZnNutd3DYCHIKuDWoLeFIT6Zx2JcBfgGXS13dEf9F/d0LETj124ebIHMKio/d/akY1uPw0l+3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ocs7Cv1B; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ocs7Cv1B"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-4325cc15176so4754609f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Feb 2026 04:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770209719; x=1770814519; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D1+zqDYtEzNHH8qUq1QENLiYsBbkZqTWhXubUu0+QkU=;
        b=ocs7Cv1BnvNtimLBaDqy6Nigr5qftE/2Sw1FY4tQbYh28+j/Iq2Wsc6QoiSgFy9k8K
         rqW13uURgje/HvJliHoSlS4LJsnCHiKXulskQRTzmCDxR83NfLtE2+q+/2Bq/2LS2wUi
         cG/lREMynCP2ToS5c8s0+54LLo1ew2UJH8gOqKXE6ESyEAvGnG9kmDESTQBgDOB7tA2r
         +QEqHJX8IxarHMWWLsN6tqNj4S2yt34ehJkAQVUG0/VwnrP0uEwseSmeNY4F81OklDzb
         Ufl19Tv16umuSXSCGbNWBCxx3Kjjuh459B7IZ5JOTIPMBN0iAqIpnlwNnAax5B7TgHRa
         NlQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770209719; x=1770814519;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D1+zqDYtEzNHH8qUq1QENLiYsBbkZqTWhXubUu0+QkU=;
        b=J1iH4ocLkO/04AhMWqjvr6VSPMSTDg0aHwh52Dui3SIqs4ZX+sLiXpAO3eyyV6csrC
         togTwannP+ZUEzk0nHAlc0FyVtTuN1kEQbf8QtvWUlVI2WXov9VjhmktWf+lD4IeM30g
         /aVIr10FaJS9MTNLQZAqhqkH5DzbOh4iRvmOzNJfqibyyQqMnPGmKhHQ7rXuX/sAflAz
         ozQsIMayNQoMqrYbLnYBSbIan4LPqLMb4wGx+b5Y6cNtR921l6Tn8QPjD6qOKWjUHW6V
         FbK0eyvF6Ytj+8rFKem3ichA6AMCVEB31+9NDoafjfjZ1o0zNaGq30nKEgJGNQYbg4r/
         u2+A==
X-Forwarded-Encrypted: i=1; AJvYcCWSCXJHABGkpC8XklzH7vaip/dohMYsmeI88g2n4WTXYwiTAfXqnPHPpHIkaevle3oFM7nhaveoJds=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0E16pmge0JFlUiP90JQS0V+M/rc/MrO5D1Rco55ClgfsxJyVe
	V0a+0LBHcfGSfyN1w4HtqQVI8LmQlnenEbqFo4HDJCLm4f9BSG1D6KYmaAVHncTntpOb2//z2dF
	TTtdU+QoWPxhR3Ppb8Q==
X-Received: from wmxa18-n2.prod.google.com ([2002:a05:600d:6452:20b0:480:6c6f:8c06])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b88:b0:480:4a90:1b00 with SMTP id 5b1f17b1804b1-4830e96d623mr34918315e9.20.1770209718861;
 Wed, 04 Feb 2026 04:55:18 -0800 (PST)
Date: Wed, 4 Feb 2026 12:55:17 +0000
In-Reply-To: <DG66KRKI62WA.3GILMBH1UCYB@garyguo.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260204030507.8203-1-linkmauve@linkmauve.fr> <aYMiXcy33YEVkgYM@google.com>
 <DG66KRKI62WA.3GILMBH1UCYB@garyguo.net>
Message-ID: <aYNBtc2Jbtg9sLIE@google.com>
Subject: Re: [PATCH] rust: Add PowerPC support
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Link Mauve <linkmauve@linkmauve.fr>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev, officialTechflashYT@gmail.com, 
	Ash Logan <ash@heyquark.com>, Roberto Van Eeden <rw-r-r-0644@protonmail.com>, 
	"Jonathan =?utf-8?Q?Neusch=C3=A4fer?=" <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 04, 2026 at 12:36:38PM +0000, Gary Guo wrote:
> On Wed Feb 4, 2026 at 10:41 AM GMT, Alice Ryhl wrote:
> > On Wed, Feb 04, 2026 at 04:05:04AM +0100, Link Mauve wrote:
> >> For now only Big Endian 32-bit PowerPC is supported, as that is the on=
ly
> >> hardware I have.  This has been tested on the Nintendo Wii so far, but=
 I
> >> plan on also using it on the GameCube, Wii U and Apple G4.
> >
> > Super cool!
> >
> >> These changes aren=E2=80=99t the only ones required to get the kernel =
to compile
> >> and link on PowerPC, libcore will also have to be changed to not use
> >> integer division to format u64, u128 and core::time::Duration, otherwi=
se
> >> __udivdi3() and __umoddi3() will have to be added.  I have tested this
> >> change by replacing the three implementations with unimplemented!() an=
d
> >> it linked just fine.
> >
> > Uh oh this seems tricky. How is this not a problem on arm32 too?
> >
> > Perhaps we should just be providing __udivdi3() and __umoddi3() in
> > general?
>=20
> I think there is some concern that if this is provided, then C side that =
uses
> the divide operator instead of dividing function doesn't get linker error
> anymore.
>=20
> However, a proper way is to do this via the hooks that we already have in
> `compiler_builtins.rs`.
>=20
> This can either be replace these with panics or actual implementation, bu=
t for
> libcore.o only.

Is there any reason to not make it Rust-only but for all Rust code?
Making the / operator work seems like it would be a good idea.

Alice
