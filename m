Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5836A26E718
	for <linux-doc@vger.kernel.org>; Sun, 25 Jan 2026 21:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.195
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769377301; cv=pass; b=sfMGoi7YNPq7lS2Cn8iDg9zzVsuj5U7Cl7IdXvEA6yqstJObsDTEemymT5R/XQwtzfwH4fKoRufLMblWsiScQFE72p5Kq1rlgUF1/JTYlr1tveOlKintbZ10jsqybtgVOhawqFyqN5L1bg7E5SSmuAvpgXFHfeR+MNLXCwOsjko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769377301; c=relaxed/simple;
	bh=CUJyJdkPJFr+qzK/2iHOhlqvG4D2dajcsiQFu5TyavI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ggKbaVcr1JtRz24ShP21NomU/FYneLHMQs9OcTNdEVyX8m5tfPOLnJTlRleSbaAY5R1R3nEWiExwSunkAnB9iPvjAixWgYt5EfpICBOa/h18H+X0ueKjmVO95o9IPyex9sxoXB+TN85l5m07V73/d7hfSyROiOKdBCCrMiy99kQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oz+GZocd; arc=pass smtp.client-ip=209.85.222.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oz+GZocd"
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-8c5320536bfso471413585a.1
        for <linux-doc@vger.kernel.org>; Sun, 25 Jan 2026 13:41:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769377299; cv=none;
        d=google.com; s=arc-20240605;
        b=HlLgaRdIl0OOVZneq9aI9YNSVzGx/IWiaGqpK6w5qVVWkAua317rVrW5/Sdlz2VHTq
         obtZA+KZkm8Zx/r8zhDJaUimDfHB/c4d6VxDNzBkdSMVmb4ePvk5r36Q9aH+jOtKQCFU
         6+44Z7H3j0Q3/vXFvWeYbxEQfs7816IOvh/YhBWP8vgwvc7zvHefo+25nlCmaLPx8Ccy
         tSOtWg6XbDdO2YGstPC9kdfhUWYItOlv3vyApFPykkE84dgtuaeDHIGdY7VPWiE7eciB
         St4PVqErAgum0cl9k03Ockeoboa7wN2DGrzA5C4hmG06uNnJr/mpaOl1CGA98/730sEW
         0Tkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GghexN9v9Tl4rIdwgV34PPZYEF7bLOxK+iXkN8X340s=;
        fh=/eGCmTjL8wUREQBwKY9GXbp7DI1Y4/eRIZgoDMScWMo=;
        b=Y28H2pGKwHO8RTsLpj286yxUU5zhS6XHl1/eAruBX+fFeQph5snVE6XWDqYBk73KFu
         emJp+pm0M+Q9WyYpwBiItAITDxa3vxw2dIIX25pNMymzHFOpz/iCplgyjPs69oRBz2b/
         FT8GRj6z303s9TVMg19WWF+jqRTl4Kb4YWK7lieCv+LtS3gmNUbc5U8r7XwK6ItJcfXJ
         1KezImma72GelT6R48uNGKhbuGP1DFzVA7XJORkBbPLpjzZUBmR3Ktno+yIunM82h+P2
         ApAqC94T+OI+LSItpEZxPUst1hFw0plHJd0b58MSIYk1HbJq3mY7uomB6qVAA6zBltxS
         XrpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769377299; x=1769982099; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GghexN9v9Tl4rIdwgV34PPZYEF7bLOxK+iXkN8X340s=;
        b=Oz+GZocdZ0Wkk/cWMts6zOjcPWNmBO5xBBM9MOAwkiL1mH2ctv6qa3qtIHxXnWvYGX
         lQ8OnZnlMGYjJWA90QJKpFuAT9rw0GsMa/WUTGhmu6yE1E7H5Slv20GaS8ZnQoWHupMD
         JQWUO/HXy06Zdxxm4VymK/bnQQsX3W31TIrldyq3srQz8pcdu9gej0eBM/oYu7O941U9
         Hpw+b0tUh1Ihin3b+KxVEx+kMfe0SDAiBHI5uoylKZc8kg/422lkrzxP+TI1CuawY5wc
         bAmf2xAGtxK868EgTSD8ppKj58OMWiWUHHYDJy+gbkNbS2lScgllC9xF9IVK792LJo2q
         6ZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769377299; x=1769982099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GghexN9v9Tl4rIdwgV34PPZYEF7bLOxK+iXkN8X340s=;
        b=XbsAlARtE1Z9iWH/U9TSDfnqZcCPTpAkZxFhqlhjX+RkTaS4UEhVE/SsSanP6y3J91
         6flr0Dlow4CK8vLQoJXrPzm1WcQSLY5fYMNF7HSlmR9x7Cl3UGedtafDX7qFo4fA9B79
         tV9aSbT5g037oknhyUeLDN2+Mjb2JoSnZqok37Cs7m1C+M2mEe4hlBgAM+ne2LBVs+dU
         vsKDZoQkLq/ud2X3SkVXSGKmszVCLc+x9zcX1g5xfUV0Zwa2YWwqQTsaZ4QKgRwzikOO
         Ibf8KlQoOE7zNOhXhdiS5RQz5+EWm6E7Tr/IHIddblQiSPt9vb4yPUAm1esKytk35KzU
         SKJg==
X-Forwarded-Encrypted: i=1; AJvYcCXCF954+C18RAOUu88SWxfqxruSgZSERUaOX6hdbrQ5s2fQCQXNoeyuY7vNnEHzQDFX/keGVzY+sB4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1+Vsj90cPoYU6d+GI15DMcTRVE+ZDExTfsSt7d0yNknack8y1
	TEH+HIsOJmeowoUmafuuNe/PKstTqzgIX7RUD3zqeyVxQ2ePeTra1Ra7QmeUKn7IUwykk9uonot
	to7xYZbVdzhHV4kzsNSAfBYnMoGRhBfA=
X-Gm-Gg: AZuq6aLMtu27hIUOPvxykVkF9QIsIM5t7tz8t27u7B8RyhUn+EwEiXnM7SjZG+RG4NZ
	5bo4UehHwdf8OtQDTaL5GzPVWFnb6OAc6nOVpcyeapPj5PaAGJD6Ae1MieWhcYRAYJVPQmoCojF
	uH0c/SX3CBKSimAupjDDk5PR9r9nZBJSaZXD8+p7shwJyB6UwHba+7zUElM0KeN0SLR/2kDX6qT
	Sk1N4iNhlmlHOI4Vb9AdCb2Sb8zjTwLZsHZO8Mwlr5cUC7qByq/DRrbTZ+7Xwt+WAbf+pncdGrO
	Do2mvYbDvBfC8urkFBEe/tq6d6XJ5gk11MLczsHMElWgJz2Wom2NskmIkYeb
X-Received: by 2002:a05:620a:172a:b0:8c6:ac96:f5e5 with SMTP id
 af79cd13be357-8c6f96e6cdemr280705485a.83.1769377299320; Sun, 25 Jan 2026
 13:41:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADkSEUjyXH74izTrsfhdAjh=n-jnGx=tXbqPx86M9OYqjXj0PA@mail.gmail.com>
 <20260125181125.GA209392@bhelgaas>
In-Reply-To: <20260125181125.GA209392@bhelgaas>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sun, 25 Jan 2026 13:41:28 -0800
X-Gm-Features: AZwV_QjfdD5BNg849bWJiQdew-9LUzyZdNbSnd1c07lERk8YVDkD-hDCRqejbYg
Message-ID: <CADkSEUiwQTq=175VZ7Trm4Mf2o7_ckcAkPouoawC5s4oumdcdQ@mail.gmail.com>
Subject: Re: [PATCH net-next] net: ethernet: neterion: s2io: remove unused driver
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-s390@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Jon Mason <jdmason@kudzu.us>, Jonathan Corbet <corbet@lwn.net>, 
	Linas Vepstas <linasvepstas@gmail.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	"Oliver O'Halloran" <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Danilo Krummrich <dakr@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	=?UTF-8?Q?Martin_Kepplinger=2DNovakovi=C4=87?= <martink@posteo.de>, 
	Pavel Machek <pavel@ucw.cz>, MD Danish Anwar <danishanwar@ti.com>, 
	Mengyuan Lou <mengyuanlou@net-swift.com>, Pablo Neira Ayuso <pablo@netfilter.org>, 
	Huacai Chen <chenhuacai@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, Takashi Iwai <tiwai@suse.de>, 
	Eric Biggers <ebiggers@google.com>, Madadi Vineeth Reddy <vineethr@linux.ibm.com>, 
	Ard Biesheuvel <ardb@kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Frederic Barrat <fbarrat@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Dong Yibo <dong100@mucse.com>, 
	Lukas Bulwahn <lukas.bulwahn@redhat.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 25, 2026 at 10:11=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.org>=
 wrote:
> What is the value in removing the IDs?
>
> The values can never be reused for new hardware, so removal doesn't
> make room for anything in the future.  Unlike the removal of driver
> code, removing the IDs doesn't reduce complexity or improve
> readability or maintainability.

Understood. I'll send an updated patch which retains the device IDs.
