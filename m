Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740D3255F5E
	for <linux-doc@vger.kernel.org>; Sat, 24 Jan 2026 23:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.194
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769297552; cv=pass; b=qutIHlMVA5WQsjxa8Zs9En0U+vwCTcvBgzph191BfPt6Cz72LnQMv9fyuj7Kp2n9OGZI8iDYPVRW07jzmM/y4udpvklFJR4gDhFdLgzfKfB29PME+dJROeurY7RLwZnPN8cjoI/86rn+pacCtYPGM3802qQthcRWcv2PcvNPT2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769297552; c=relaxed/simple;
	bh=62AUfn3TepYhzwErRqoDeLZjyZJQUDkNhXA5ssHqF2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yo+neGOurrgy6xETQ+1XVECfDLhIu3iePthCLz6oPWdeuBtRwFj449haodxNT9QZ+W4LtXy65d3EOtvd9YsN8ddg9aILkSf0+ZSn5op/ippRs7dqQn53iud/pn7ok40EO/lM0K6MP8oTcOYSx3uersuuKErOpy4eR6tuUA0Dpz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CaszhpSV; arc=pass smtp.client-ip=209.85.160.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CaszhpSV"
Received: by mail-qt1-f194.google.com with SMTP id d75a77b69052e-5014db8e268so55659921cf.1
        for <linux-doc@vger.kernel.org>; Sat, 24 Jan 2026 15:32:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769297549; cv=none;
        d=google.com; s=arc-20240605;
        b=PntAh3zVI6gQUXgNv78T7VTKPSiTeqhImCb5VYDQ8cG/LLLbUICMX448MnIs6pk07q
         pb/1j99YpaTZhLBgt4eUvDYE7V2XofMo2EknJCCvaeAzNE0Z5ewlKBG0WSFJlesr7agp
         2reYWLFsHzls2hq3XALF+3afNn7FQZLuHQXNXDUKTc6MZL7GP7uYPKtR0nGZJSRsp9f9
         Zjy64WnYdCa8z48qB1PYERYiorNlIbmFrNiK8F4JkSQtLLnjodSo7FxjbzorRBKLRVeI
         Oomjjsv6OCfPxuv63rovEvRrZEwz/AxMQK7NosGq4HfVXb1gweN1MM8FWGzz+wgucbKV
         BjJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=62AUfn3TepYhzwErRqoDeLZjyZJQUDkNhXA5ssHqF2g=;
        fh=Guf3c/i/pE5GwqjEtuRXeka99v1UA7AACCFXyfYenE8=;
        b=XQX5777dT040BlRdznh6QZ7Q0NHov2ATLzpzDJaqSFV1U+aMLE32H32uygcFHdkoxN
         gIfJRjmM9mRIdN4bjbxNvkY1euOLH7CnS7OvcO5W/TGTdc4CVqxhIQncLaTuGoYao0ui
         W2Q5cEX+PR7yLo4j/ocUx06ONyDZsu1vGqvVZl6WC/gIBT8d9MfhF6rHhZduHQMSCem/
         eCNSMNi2Y5GA2E/buufN8jGN5A/sBQtxwDjx/JKbZLsbUU3aCSTxIxd48VtEHXc/uz5i
         B+FYaqbAs4qNyPEschsLRZnT34vNCa8OYWfGKO0kXBdt9DWq9GY47nY/wgHZUT6Q+26R
         4Z0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769297549; x=1769902349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62AUfn3TepYhzwErRqoDeLZjyZJQUDkNhXA5ssHqF2g=;
        b=CaszhpSVDhvXzlO7i5v7MZuDpk3LEVYj90HYC5ggSo+i0hWCkXMXeL2ps/7SGClU0a
         oagfcI+67P9PYN50vUA1FDHzyLylIVj//6r7kPr33pdWNZG7OetHNJmVqH+RLue2f4Ti
         RyASq2nBsmRb82ZFGibxAdGiuiuySBj06PDEupDqzEYB0rBAYozg7/aJhtBCt3tt6xzL
         65TaECbGBd8wY8fCaLeVtZ6Vi86EIj8CBo5Wd1ntGwAZjFi+XN1qJ13vy8y6CTYTO0X8
         aN/lXBDHBZVyGzzEWqy6gkKrqikTEWYj1sr6AkDSoEB+QLGF5lPbzUj3fJXyyGRwSGcE
         xU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769297549; x=1769902349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=62AUfn3TepYhzwErRqoDeLZjyZJQUDkNhXA5ssHqF2g=;
        b=mTvXpQDF+cLxQ0Y+8rNcK1Nbyy//t/SEyGlICOcbEGm8RnYXfvjVd2ao8oyq67Savg
         iXPL6Io1ahBvwalxI9rM/Tzu3ZmmShNz2mxyU4Lvbsbu1Fum9ufD2rS8eM0+GEP04Fix
         q9Asctipcqc6FE38Ncj6wg/JVF6SgAysntTttmeWUEw4gEXJvEtUzOlwA8DoMBWi8gjy
         Eq8TdIvUZhJ0Cjm2vAgWV7VUXmIWofxSEoJ7d3nZc3OYAIjRT2Eaidr7nw4CKVCAunaV
         GHQFnSeWd0kP2QZHcxjAZGuxdrAFhTG7wShz52VT9ohgLgXU7+gE+DGrPJvZHSvzPeaq
         zNGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWio1nzkHQA5JwegnaNWgO3ANubxeK3i+GIh41AHDFct78Gyfu5/+iPR3L80Ix6OZHs3+URbznoLhY=@vger.kernel.org
X-Gm-Message-State: AOJu0YybRQMtrHA8bYLF/YGIbYXJckKc05DPW/PhH+LXvTtRf7TXexvl
	UjpTGOhRoghJ41jhaTMAbBp9jQEvilNbrEETykLCcC5IoBhRIXxeRdXOMBx50iF9dXPvYaX0tLK
	R8OGNQUSvNEcXGtFs62Eu8bJc2qRRp9w=
X-Gm-Gg: AZuq6aIFKh+ayIX7RJiLXY/MbRlA+FNOHIX1rwXl1/f0RYR564KJgj+U9fkWx+KkRWq
	9GBYx5Bzz7xAuIFMzulZLWBPZ4zwBdg3USiVmtBa/Wrw7n/rfEPe8XVAYRzzNd6HM8KPXFtgNiJ
	sWrpvgNXgxNsDsVNZBVN9hR6Xjb2XL+U/GF18VKNRX1U4KMNBOdhpz+24HYDvPdLHsdLtk2rgmv
	pgAJgh90wfGpOPZiZGIWOVTFHfBNvdGdWRcvWZ0MvkObY/josGHWfmja4xbmPDyTBjH4+DcjO/7
	1yxs8YFT5x+0ePRjoQ6X0gdK/Er2Y+P8kBRTkLuz2XzARWfSTJy0dAV54+lcZo/OCYum5azqQCz
	bzSpMnnlLLjvDZaI=
X-Received: by 2002:a05:622a:55:b0:502:6312:8d6 with SMTP id
 d75a77b69052e-50314b7a6e1mr2969171cf.12.1769297549164; Sat, 24 Jan 2026
 15:32:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123033233.16906-1-enelsonmoore@gmail.com>
 <20260123181156.GA84531@bhelgaas> <CADkSEUg5EqpKg2_X3LRc1CaQ2RVFNucJbuxDcHQxvjdLq1Qg1A@mail.gmail.com>
 <8477da83-2441-440c-80f1-66dac9700523@kernel.org>
In-Reply-To: <8477da83-2441-440c-80f1-66dac9700523@kernel.org>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sat, 24 Jan 2026 15:32:17 -0800
X-Gm-Features: AZwV_QgT7HJ5RzGZbmSKdUH5ZCEsN2PptDSPTNTy9vD6bN7Rq-MPZtQjsOmB-V8
Message-ID: <CADkSEUjyXH74izTrsfhdAjh=n-jnGx=tXbqPx86M9OYqjXj0PA@mail.gmail.com>
Subject: Re: [PATCH net-next] net: ethernet: neterion: s2io: remove unused driver
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
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

On Fri, Jan 23, 2026 at 11:25=E2=80=AFPM Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
> Yes and that's exactly the reason why removing unused IDs will be a probl=
em.
>
> Let's take an exemple: some patch adds PCI_DEVICE_ID_ARECA_1682 after
> PCI_DEVICE_ID_ARECA_1681 in pci_ids.h in the mainline. That patch needs
> to be backported and it conflicts with PCI_VENDOR_ID_S2IO which is not
> anymore in the mainline but is still in stable.

Hi, Christophe,

I understand your reasoning now. Thanks for clarifying. In my opinion,
changes to pci_ids.h don't happen often enough for that to be a
problem. Unused IDs have been removed from it before.

Sincerely,
Ethan
