Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9283086348
	for <linux-doc@vger.kernel.org>; Sat, 24 Jan 2026 02:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769220100; cv=pass; b=ZsGA0ggMRYPM5MBRTohUW1q8RUUu9UFUMEltWe9a3PJg1IYJtXNbnaW50dEA8s2YJ/FDoNE54UVoc6W016V5EfpN3q1aicCYFq+JvdqkzBfXeNAsHeXKYpTUtFxm2dZWZMseIJo9oA7fOJn+5J0z+Pu99O9YOo6iykOprVYUlZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769220100; c=relaxed/simple;
	bh=jLt0PwGKxUNFP/UMurV5/9hmISNtz6t9H2HpKnVOTXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t1/leD+4H+CmuR37ad9M2yiKczI9K0T4B0j5praKfGjfVoM93Asajn+zx9CO3ESun+/itkxiYeoZELjWImXK7FV+ErjkUGpdWhTmOccTAaYu6XylZSp8D5vDgudVKIwt0L/AiMVL7VLOaPbVa52Ei34TkvyXIQv6/XPjEEbJj3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbnLfBIw; arc=pass smtp.client-ip=209.85.219.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbnLfBIw"
Received: by mail-qv1-f68.google.com with SMTP id 6a1803df08f44-8947e6ffd30so31383096d6.0
        for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 18:01:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769220097; cv=none;
        d=google.com; s=arc-20240605;
        b=A90UKtPZBNKQUCuBpghOCGD9ep68NuKnXCplqLtJRuiZXS0gaWASaKwxcB/hbpz3jm
         W/hJbO18/lmIDqxtVpldMnlcrk+NySdIsNjDgsybokNkH97nZH3YnB5qUcu0Uh/1NBu2
         huoXtxkRip8QsXPi5VYWNCptUidzE81YKFKL9jv/oY3AS7DA7lDWMWAQhqOIip/b35fv
         gwn3xrM4NedmoG19sDrfkfz2bBhzn9IE9oe98wLo8Ys9zf+2vCSkkeHihGi2YQWsQRrl
         zn+L+XI49sJDo/r0mT72y/663nXkQR24rWTy11cg3oxwYru+GPjMshfvCRu+hT0qzdWm
         zBxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GcF2ydOy+nfomakh5Blwon1hHz6tHyuDcePaQDWXLgo=;
        fh=/DYzVL58BWvo7SJERcgExHpcWTvkJ0y286h4qJkXI88=;
        b=gjD2aTsg3oj5T/HpG5v/SiQJemtsI4k11foIBixMaExC9yViGGuulRKJrK4INcxUR/
         EiDTM8ywFd0/86ZeN3x0ber5BCWSDsUx9J3qOOAbnynJ29122aLr4tCNXbuDI3YNB5Gc
         a7LrO8LD2ZaxBqRjJm3or8MSHQUn/xgYAQNdI5T6HjbQmiEQkGQFFrEI4GUTfoHmZ3HI
         BBln/KVK8gwOLq6u0j8v5YYQDptV49gVe1unWfGo7KEBKoBkmjxX1dyhktQY/pLLBpx/
         +psthuEDjjsMqYS6oNwYhQZ+D2zhzvo9X59201XvToMYR0K+V7Yh8TCzcodXY3Fqj0lq
         Ornw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769220097; x=1769824897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GcF2ydOy+nfomakh5Blwon1hHz6tHyuDcePaQDWXLgo=;
        b=MbnLfBIwUY7s5JWxSi5k0cNKlLxO3lYFzN9LojBwsQ4pDdC8XVwO5+R+/h+1IFsf27
         q4+PzSgB5wS2PNv4PdEsCJ7UbiYfZgzZKLXxVZ/og1hakbRn20Qs921fX4Wi6iHStHP/
         bZMael74BErb/s1YoYs/jlUHmtO4iUSIc4i3YVtT+n0Da7PNQkQwkbe/xytokq57lRgm
         PsuOLQU9ZgR3LRwtXFTVbA0QPf/vb7m0+kd51rAeLmrvmBurK/1mB/3C9tcPWVpi0mIS
         DaDojl0ddnaXDI//bByPqXD8Cp22LeM6eaCpRT3Ov9K2Kvo0R/cDo3HVb7uwFcDO14+m
         ZbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769220097; x=1769824897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GcF2ydOy+nfomakh5Blwon1hHz6tHyuDcePaQDWXLgo=;
        b=Dlgatb+8M125vTjqCxu2CHhIeQumTIH6sbk1L9OxTBTdNJzIbHdioBeltRseOvlfUR
         19Pzub5CBgjCyZ2n1b1qr2DBAYS3JHHu0/Vu/rEn4CIslwWYAVH3juYiW9EvFATCNYTa
         Yn5x1p6NL4/0ApiDRv+7VNJsNiJEYkoSuxsWtLmwbu6YIu11lNJCP89U2GNSxHTUzNnp
         +B9+tJthphsZI+BaC2jPWGev8kdt7EXNqDVu7VR7L2ocWfKVsjmQSfFcs/u/y0whsqRv
         tQwSjC1Ekmnsp88ZetCrGePdZ5XjN0O3JpTK8i6b5l/2/rW35/tjbjopiAOHqrjlMNCi
         sIGg==
X-Forwarded-Encrypted: i=1; AJvYcCV3Fozrpn9hJ6Oip2LfUvvPagAhRVhXRXEeN1Dkmo+my7kG/Mowq4oqezKAlM+N+cNKUCGF8pPnyAE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs7e9imw3SlvdfmWeEJjHx47dRD2wc/z+NX5fja+y3LTSCR5lq
	Yi9EBxsTCmRkOJOEjVsu0ihp1tKw6gEJSQM0yxBDLhOFnjMNY8Bgv6c0BnMeeVYA7oSCIAnT6eW
	emWXw/aVPRkZyCNIxg2PrXcG4Kn+Zt2fCY7YbQ4s=
X-Gm-Gg: AZuq6aJeP5dSgMVGpDkXSnWpeaG8eWisbaXC4V78xgTMTfhCl62O14ayt8iD7+DEVx9
	L1/XFRiZwjK37UoXA5/UjHlBG/a6ZQ/5Ba2QG38fihuGXQB8ERdju9akkZv+soHYIfZ/4P7RapM
	bcOqUq7AR8yEl0Wui26omx2a7ZSdy64Jg2Z6vuEN0zCPZytfOjXF+SRwLzC5HGxriSLOm0v2D+j
	vClZbeHUO6h+ccXCBIcmYYQ26sFGsreZE5zFIzi2xeAfCWptJURh4Aa2f5J0GEBQV0KDx82m692
	I5W21iQSKwXYjhxpyQ1IdxOx+WvRhgdBMRk6PQNEsML3eiAVxKemWUyz
X-Received: by 2002:a05:6214:20ab:b0:890:5973:a567 with SMTP id
 6a1803df08f44-894901b45f3mr66553036d6.12.1769220097575; Fri, 23 Jan 2026
 18:01:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123033233.16906-1-enelsonmoore@gmail.com> <20260123181156.GA84531@bhelgaas>
In-Reply-To: <20260123181156.GA84531@bhelgaas>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Fri, 23 Jan 2026 18:01:26 -0800
X-Gm-Features: AZwV_Qihtc5vhyYPwevTdmoQ3m_JYluy6sboC_AzdDpVbJp4Phlr8m3XaH144WU
Message-ID: <CADkSEUg5EqpKg2_X3LRc1CaQ2RVFNucJbuxDcHQxvjdLq1Qg1A@mail.gmail.com>
Subject: Re: [PATCH net-next] net: ethernet: neterion: s2io: remove unused driver
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-s390@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Jon Mason <jdmason@kudzu.us>, Jonathan Corbet <corbet@lwn.net>, 
	Linas Vepstas <linasvepstas@gmail.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	"Oliver O'Halloran" <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Danilo Krummrich <dakr@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
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

On Fri, Jan 23, 2026 at 10:11=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.org>=
 wrote:
> Not sure there's value in removing the IDs from pci_ids.h.  It may
> lead to unnecessary conflicts later for stable and other backports.

Patches to remove drivers are generally not backported to stable
versions, even if the driver is broken, so I don't think this will be
an issue. There is no point in keeping unused IDs around.
