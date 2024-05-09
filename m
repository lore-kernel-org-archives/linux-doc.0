Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE0316F825
	for <linux-doc@vger.kernel.org>; Thu,  9 May 2024 16:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715270672; cv=none; b=fL5uUeWz9hJIilcFNye99sMHEEVWORSMbJuqiRVQCNEVSOFAlr21u3+IKwgj9KbaKCEvDHCg0HyItVTl3jlbRyGg27zdKtAeHWT7PcRF8WrdoR2jVQFD+sMkcylqnGyAJ6L9ffB7mnALLoAaKWc5vmzYekmTdG1/1tEee9n4z7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715270672; c=relaxed/simple;
	bh=09dtqkElR8CWN4Xls9gaO+gGObr726NWHn2HraPSkmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xgfh4jgBhCA/CmJ2wAoYvUlbEFRnMsmyhhd0Uz3AHQ1eVMXfs3zr8QjjRko9uxtqI+P1wvo87r5CT/lq4DQwNfEiZifaQHAURSIGQtJPqw50a08vgfKaAucGCYRdtbCfrxcmndkeQg7eN0+/vUYHBAkVe3KTzj5w/U1rxgq32Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hMMc+evC; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hMMc+evC"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dbed0710c74so957919276.1
        for <linux-doc@vger.kernel.org>; Thu, 09 May 2024 09:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715270669; x=1715875469; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/TfYXnrBowEMKiVifOwG1dX9WBqAZR03Udw27fNsvY=;
        b=hMMc+evCdkRQGAln0paUUuhSWpt2k5zN2l4D/Eg7+5eVu6WoHEMH9MKzfk4CPTK5o4
         3LhUy+7kA6W1hMX1cd0bl+ikhCWrFqinYGcXKucBfhYJPzUdXuKjowkzT1NGCg2FJZ4q
         PDCmiWsoUP7wWpI6hN1U5ttqh75Pgb8ttz66A/tNCv2lJx1UZdLtftjIQffbMFyI5GMD
         jWbSB0YJsXCXTT6IIBrlxFGuaJurfc09kOqZ6MbFPwOHpdWGE91z4e/fDxyliUy/FZw6
         B01m+ovX0od3SweJiP7BbyVZRI+nC9FA7a461tqiQdgr5Uw6VvL3LqXXEaOBr9EU6hoA
         RdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715270669; x=1715875469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b/TfYXnrBowEMKiVifOwG1dX9WBqAZR03Udw27fNsvY=;
        b=aBi6fWTwz3U59KYIWEEpuXLm2vWjyUhw7il5Qe5XifUFSEX5Kmb3fBtVnrz32tdm1i
         MHz9BHxUglqo0zL4tok4tT6Xe06+/7EWz6uw5hp78dugntHwHDTZEPQY5pQXd7COoaUN
         TbzHUuOgP+OIbqgh4ZxdF8Rd6bbvGlgAHSWph7xFOG2d4monfamwyhSuG+SoFdA+Jgj0
         NrhYwqqDJUP2No2SvqVF+mbOWzZJxIOCv9x5HzEKEB53g72yOh8Iw0jGKoWRq++zagSJ
         xvzGQ2xbhXLvmxEYIqoqdmwrbmsC7blnkJr4P2srjO7PEaCxqtbOQKhZHpZk/+rFFVTN
         NgVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRLTTvFry27Nd0jpxaEIjBzktVQG8rZSf8V4j2zJ9jK3U84mnG3dGgpYX5J3vEZSrx2YFuXJSrKHOhWIWbbC9ks/nuU1j1T9jU
X-Gm-Message-State: AOJu0YzPavJPEujn9rU9Jh48H6jrNXlexlrOOkVtT5mHPiUnffiG+sT2
	+zgsYE4mdGDPLd+n/ey4M5Dl+gGlRh1bIdCkfxT5dbZUTJ4zPOdjniN78vpb2EM+wXhiCf2fnUR
	2TeIC3O5s/9rbsjNkGMraEcKPUkPBeMjQeV5m
X-Google-Smtp-Source: AGHT+IH9Z8bT7vf19i8TduWEkrW+zquAQIYVPUng72/mPvbqjAvD5MmpjaiDGG7Q+WNynMqz+3FRy582s/3I8TmADKc=
X-Received: by 2002:a25:d34b:0:b0:de4:5cea:87d4 with SMTP id
 3f1490d57ef6-debb9d8d574mr6812666276.16.1715270669053; Thu, 09 May 2024
 09:04:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507013502.3095744-1-tjmercier@google.com>
 <20240507013502.3095744-2-tjmercier@google.com> <20240509081403.28c424d5@meshulam.tesarici.cz>
In-Reply-To: <20240509081403.28c424d5@meshulam.tesarici.cz>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 9 May 2024 09:04:16 -0700
Message-ID: <CABdmKX229OjjzQ9BYC96QtwKdVyqdYEkLaBi1GN4oDNMD5SDpQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] doc: swiotlb: Document SWIOTLB areas parameter
To: =?UTF-8?B?UGV0ciBUZXNhxZnDrWs=?= <petr@tesarici.cz>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Tianyu Lan <Tianyu.Lan@microsoft.com>, 
	mhklinux@outlook.com, robin.murphy@arm.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 8, 2024 at 11:14=E2=80=AFPM Petr Tesa=C5=99=C3=ADk <petr@tesari=
ci.cz> wrote:
>
> On Tue,  7 May 2024 01:34:59 +0000
> "T.J. Mercier" <tjmercier@google.com> wrote:
>
> > Commit 20347fca71a3 ("swiotlb: split up the global swiotlb lock") added
> > the ability to specify the number of SWIOTLB areas, but boot-options.rs=
t
> > was not updated as part of that commit.
> >
> > Reported-by: Michael Kelley <mhklinux@outlook.com>
> > Fixes: 20347fca71a3 ("swiotlb: split up the global swiotlb lock")
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > ---
> >  Documentation/arch/x86/x86_64/boot-options.rst | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/arch/x86/x86_64/boot-options.rst b/Documenta=
tion/arch/x86/x86_64/boot-options.rst
> > index a37139d1752f..18161657b301 100644
> > --- a/Documentation/arch/x86/x86_64/boot-options.rst
> > +++ b/Documentation/arch/x86/x86_64/boot-options.rst
> > @@ -287,9 +287,11 @@ iommu options only relevant to the AMD GART hardwa=
re IOMMU:
> >  iommu options only relevant to the software bounce buffering (SWIOTLB)=
 IOMMU
> >  implementation:
> >
> > -    swiotlb=3D<slots>[,force,noforce]
> > +    swiotlb=3D<slots>[,<areas>,force,noforce]
>
> This is not quite how this parameter is parsed. All the following
> specifications are valid:
>
> - swiotlb=3D512        // only slots
> - swiotlb=3D,4         // only areas
> - swiotlb=3D512,4      // slots and areas
> - swiotlb=3Dforce      // default size
> - swiotlb=3D512,force  // default areas
> - swiotlb=3D512,4,force // explicitly specify everything
>
> I believe the syntax should be somethig like:
>
>   swiotlb=3D{ | [<slots>][,<areas>],}{ force | noforce }
>
> Petr T
>
What does the leading | mean in front of slots?  How about brackets
around force/noforce since they're also optional and mutually
exclusive? The Rebooting section uses double brackets instead of
braces for groupings like that. Only weird thing here is the
force/noforce comma being potentially unneeded, but that's getting
pretty picky and I think the intent is clear.

swiotlb=3D[<slots>][,<areas>][, [force] | [noforce] ]
