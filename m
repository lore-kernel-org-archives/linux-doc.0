Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B694E2EA151
	for <linux-doc@vger.kernel.org>; Thu, 30 Oct 2025 21:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761858804; cv=none; b=o5VXmZ4WdTaE0Sl9v8EUsjrmjVvTt7ixGJNZjJp9YC4pvwT3YBivjuB+pmks672dHyYt2VVLxLq8zTV186wOZj8iHjFIqyFBBpwprl/5vpD502p2wQTs8U6mc36VmMXSZworyhGUE2glI02ZBrh9nprtgupBmX8EXW3zusrFAQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761858804; c=relaxed/simple;
	bh=Ds10LqyCnxdrh0ZjTOtUC48GJJV0wJwcpwKLPS3durE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IrDbl+CA+MP8mmuQKjRL8bvIsWvzauyd2LNt7X8fa/I/yI0qxPbUMPSH7ExGVqLgI5CMk1IGT5Gw4UpoOGRQhy861HNxSAPSTxPL+clFP/kofaSsI0r+v9s0PDKccHN5zQbaXutlMBLxZ+S7Wa7+AYEl5Isg1iIbHdrb4EmXTxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zh4CdJL9; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zh4CdJL9"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4710022571cso17389565e9.3
        for <linux-doc@vger.kernel.org>; Thu, 30 Oct 2025 14:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761858801; x=1762463601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mTFjyfM924ecEs5Bh5eIoT2AnXmgRLbADTYF0WurRYE=;
        b=Zh4CdJL9Ye4tgOk2PdxNL4xixD0FkiLDlyZWIud5Hia8Zs2K6t2cuCJrS6pPLz1NPt
         6i2LYEcnuOFXWX7xG2PgAhB9WUCChNRAK0Pq44uF+wXfWyFj2DLG6m+SWwOllx1pXDeZ
         hb61cTMaqZffAFwcQjZPG4GEhC/NAx+yyKDlgmvCZndxsJ41LsBp+JPuHO6/6S0G8GUR
         d0FPpP2CKwk7L8m9kEoq9n+oF6IIlcisCYDMbPaCxzehDfjmm9ijl7kOgVUekYjpZUTd
         JZiVs6mwnGbr7MOQru1cX5FpfOIHNxo0FQjh9HOma1Oomvc8kSs7qR6/zSZpxtRxpwEM
         FopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761858801; x=1762463601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mTFjyfM924ecEs5Bh5eIoT2AnXmgRLbADTYF0WurRYE=;
        b=YQNlzvO2fPDyb9sQbZ+KUv98TeQ8n1UyIYEwAAZcW6EfzhAqXjaHkP96hGx55WpcPY
         aeJB/ZI7Tw3k1bcOPu07+70sMTWCfyt3m9rH2Jx4SXuEE+wRTPNjRiXfKyCkd6uu9+jj
         Qv+3eo1udH5Bo++wW5omPzTFUkunteXj2eyglR01sbmkj5vKFROB/6ivcYJcg3dWTB6R
         RIb7Fk0mvDdHqoVZDMrPBLdUO/lyh1fv0HdjV5Z0igQmVgm1xfCb1GQKDVH87WHPL2Fg
         6H7/jc8gO1njE9C8Gn+/ogzcUDTDPsfSqmGbOl2byS/IBoh9zZOLoxlIMBFcDC7HCcy3
         5VMQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4q/0HY5tb1lbbkkgVQbnU2+IdnEn/S8pdeHRfXio8/xt5+IpWFV/3e4nlDHspcBZKeRJHUMQLdZw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5ZIS5qzqZFwTgK3cZGw2xQI9SM0vs8oB89KyasYei7laeq+hs
	SVjaOB2uuOy8B2KglTQAmbxeGCLWQUKn5PuVnSUPxzYyREvQ8A++xQM8
X-Gm-Gg: ASbGncs6MOTDTum+UaGx9NqidTTNDBme1fYLVQadHDLHzDXIBEdX7SqgQVBr1QuU+3A
	hpyr51xYR5kDyAIcE/MONViwnVet0wHwBxOhjmtn+TrDPLu1TmqUL0u8N9AAqneulvs9HewNAk3
	AbSXeLe/QtEOgfGNbTApI9jnAAzrwnffYv16lg10Djteij1rcYumBt6wmcIpameSCCZszfIPWLI
	3PaCk4itmMmwBfkkOOwrghgPN19A0X5rWIiPJfB8CoBiLiSj5RJIQVbw2oIqOnGml3anevpJgqj
	owAgHh6Vbx14yiV4mPfn2OrOGcWCSP0doqJe+aGU8XJ23+HL56OTwqdFzg3mvhuNbjJ0Kk/eKzj
	EusiOWRtnxhk6F7H7Ky4WMAUgmF5FX9H+tWTtM50qXPt3nI44Azgc8UnGVMGuy5Ha2fqiQ7ueO2
	KQBKidrOZueUlS/v3m0jFWvC6/lHfoByvmNJSU6DpByWGpx2vrdvDED3yc6dRDUeI=
X-Google-Smtp-Source: AGHT+IGHccmEm3OTVvfv1cl8GaVw3qg7Fan/QOWhxWwvh6yuV+lD+Cr5FA7Q1nAV3Zqiw6cVkBYCFw==
X-Received: by 2002:a05:600c:630e:b0:471:11a3:a6a9 with SMTP id 5b1f17b1804b1-477308acfe4mr10073295e9.37.1761858800991;
        Thu, 30 Oct 2025 14:13:20 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d5773sm36299466f8f.27.2025.10.30.14.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 14:13:20 -0700 (PDT)
Date: Thu, 30 Oct 2025 21:13:18 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 "the arch/x86 maintainers" <x86@kernel.org>, Dave Hansen
 <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Jonathan Corbet
 <corbet@lwn.net>, Josh Poimboeuf <jpoimboe@kernel.org>, "Peter Zijlstra
 (Intel)" <peterz@infradead.org>, Ard Biesheuvel <ardb@kernel.org>, "Kirill
 A . Shutemov" <kas@kernel.org>, Xin Li <xin@zytor.com>, David Woodhouse
 <dwmw@amazon.co.uk>, Sean Christopherson <seanjc@google.com>, Rick P
 Edgecombe <rick.p.edgecombe@intel.com>, "Vegard Nossum"
 <vegard.nossum@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Randy Dunlap <rdunlap@infradead.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Kees Cook <kees@kernel.org>, Tony Luck
 <tony.luck@intel.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, <linux-doc@vger.kernel.org>, "Linux
 Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 <linux-efi@vger.kernel.org>
Subject: Re: [PATCH v11 9/9] x86/cpu: Enable LASS by default during CPU
 initialization
Message-ID: <20251030211318.74d90c3f@pumpkin>
In-Reply-To: <d1b5698e-94ab-45a2-a472-4488895d55bb@intel.com>
References: <20251029210310.1155449-1-sohil.mehta@intel.com>
	<20251029210310.1155449-10-sohil.mehta@intel.com>
	<789ADBB5-F7AC-4B08-B343-F23260FB8FBC@zytor.com>
	<13681100-ddc3-4ef0-bd13-744282324ff1@app.fastmail.com>
	<d1b5698e-94ab-45a2-a472-4488895d55bb@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 30 Oct 2025 09:44:02 -0700
Sohil Mehta <sohil.mehta@intel.com> wrote:

> On 10/30/2025 8:45 AM, Andy Lutomirski wrote:
> > On Thu, Oct 30, 2025, at 1:40 AM, H. Peter Anvin wrote: =20
> >> Legacy vsyscalls have been obsolete for how long now? =20
> >=20
> > A looooong time.
> >=20
> > I would suggest defaulting LASS to on and *maybe* decoding just enough =
to log, once per boot, that a legacy vsyscall may have been attempted. It=
=E2=80=99s too bad that #GP doesn=E2=80=99t report the faulting address.
> >  =20
>=20
> Unfortunately, CONFIG_X86_VSYSCALL_EMULATION defaults to y. Also, the
> default Vsyscall mode is XONLY. So even if vsyscalls are deprecated,
> there is a non-zero possibility someone would complain about it.

Presumably a command line parameter could be used to disable LASS
in order to enable vsyscall emulation?

That might let LASS be enabled by default.

	David
