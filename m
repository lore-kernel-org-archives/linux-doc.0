Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706AC18F2DB
	for <linux-doc@vger.kernel.org>; Mon, 25 Nov 2024 14:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732545035; cv=none; b=hbpC6IEU72y8jgCLlRAc3NniwiBziMV5fn0kM02GdClXRk2k0s7UvHW4t1xB5buXnQknstatTH0jehTf2ovaL6R6oJqn2EMEN2W22qHPQ7wxP0jvW/8didAf9vVlPmDS3snbKy9ikKZhX3VH5OeAdmHaMgGAungkmWqfmQRYYQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732545035; c=relaxed/simple;
	bh=dmYeT7WagzkwY7FoSyZv+LRd3sqPOyrA/5puocpIySw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VQk6B/E2BNnt+jb50GM82rtjpK1WlayIIgVu/xZBnH+P1i8eKEMaNuUBiLoCNZsjXlonH/kXRGG+ZwZWYZc6BN0dr/4nTQE5JXchhHAbMhe+fX2beh8sBRQvRjEppkT23r4JR3lGqReboGhvPPMPweKvFnC6EdVhhES7yI9uomo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ol6YLCIK; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ol6YLCIK"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5cfc18d5259so10569a12.1
        for <linux-doc@vger.kernel.org>; Mon, 25 Nov 2024 06:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732545032; x=1733149832; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dmYeT7WagzkwY7FoSyZv+LRd3sqPOyrA/5puocpIySw=;
        b=ol6YLCIKEEREbo9liHfVf0ccFFuoJ+G4UTKvlW3s9ax0W7rwxAs2rv2opqra1OSVog
         Fc0qrajL8RHU4TQuhO6jEYmDdTOJtLBoBKK+39xt242YNTjQ7bsxGc0I7wXEcuTduEbq
         JMhf4/aH0nYR3ocDy/S4dV5OEmU4Jva2zw+Mnbz/arU1i5NtVzqnasAJUl9A67n/Jjsf
         QO8tye20IEmNUdsU0kQVvt7n5w3ALnNzFHJXbQogQL9kUDa092qka5SBIzE96jD+YY5J
         Rg6mzTn3W2bShGXlWojcaQM9uX3nHQrJ8ffWmOA6Y1khk3Htvqh9F+4I+s2b4s/60y7O
         F2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732545032; x=1733149832;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dmYeT7WagzkwY7FoSyZv+LRd3sqPOyrA/5puocpIySw=;
        b=Gmf1tid9OftYIKN1BejLbBH1dQneHEO/Ezcf0fyz1CeCDoJ0KHGBEmG1A8rVbzC3/h
         hdKVadUsuZIOMNBlRJe5qVOjNSTs/0xvAfpCbCASIokKSjXjGz3X2OIobfFko+SyWEbX
         taVQwLh7b2ML6PJ86gEgoebo9AFuS7I8s/FjEbVjcFnuvEUJ0d4h0kgUDAUIP4HyzHSU
         VWkUKeGny1V3e9JACrDyfjk2IsZu/9iHd2CPsZR9GjXTEk24A5/eyPz0WUP3l/xdU0ib
         LQCZvOXYiPPXmZvIv05QW9dskYdfZPV17YfhcWWdQNyjX5C9G0x32gaamE/mRNjT+NDP
         mF4g==
X-Forwarded-Encrypted: i=1; AJvYcCXMc/vuIj7coSFCiHD2RspIMF1dZNK1znORUyDbC7pj2uEWnAeUwWeF0SUMmi7bKqfdsdqqpiU2YYw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyUFTxLG8RDvGjYTZaSgkue3VLe4JeoqWe5e8niPYyZjrnOPr7
	sbEb0u5eocS0T5XINO0voa7Xh4I5nsC8yPTUcZT+3FqnO1A2b4eCVKpY0wczlFdglI6taYyRmhY
	YDHkDBekA2KHVeiN7EkfFFKDwLJZbCuB/eGpy
X-Gm-Gg: ASbGncsE6lGGaQdurk2aXUaoyz3+lNbcwFNn1b3Br3BVYD/muVnHvtVgU7VKZZ3BPB2
	x7tflQzIRzgigO2gplxiTLHeJ6NkCL/apmNT6AVRE0IACCHJ7r4j7cG7bguHF90L1
X-Google-Smtp-Source: AGHT+IFWKEzbGpUOrfyOjGRqTC5/oGFC/C8dANhbCDJLguS07R1QYiU2nCXA2rPbI2+60Dcss+8N/xSO3iPMdyVL4co=
X-Received: by 2002:a05:6402:d48:b0:5d0:28dc:b2cd with SMTP id
 4fb4d7f45d1cf-5d037fffe79mr164939a12.1.1732545031685; Mon, 25 Nov 2024
 06:30:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241123-extended-modversions-v10-0-0fa754ffdee3@google.com>
 <20241123-extended-modversions-v10-1-0fa754ffdee3@google.com> <87mshntv10.fsf@mpe.ellerman.id.au>
In-Reply-To: <87mshntv10.fsf@mpe.ellerman.id.au>
From: Matthew Maurer <mmaurer@google.com>
Date: Mon, 25 Nov 2024 06:30:20 -0800
Message-ID: <CAGSQo02PiWgAVR2x38JxQgCQr5UVHyn+S7+TQ9oto-hTSh32tQ@mail.gmail.com>
Subject: Re: [PATCH v10 1/5] modules: Support extended MODVERSIONS info
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Jonathan Corbet <corbet@lwn.net>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> I already acked version 8, which AFAICS is identical to this version
> (for this patch at least).
>
> Not sure if you dropped my ack on purpose, but here have another one :)
>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
>
> cheers

It was not removed intentionally, thanks for the re-ack :)
