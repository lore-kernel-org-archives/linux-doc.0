Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27AD31AA9B
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 13:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767791962; cv=none; b=EReWKW0uOWhpXYTKoBGOJO2BYj8VS+pvr4BSPe8yoi9rh65hsrN3fYV8KOD5/7Dok1KJn08ScxBoGZIFuqC1p1q8Wh8zvLIN3TBwLfeuTILIbGPE3hLRRI3WK+6EjO4ww8//W05znibb53Lwpi2XGroYM80V8sb0bD9b+nD4vCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767791962; c=relaxed/simple;
	bh=Uq9yk0pqa6CErpXggBXldsd56C2yDeubsuwraPJTXIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gwOWdgJ9d3V3ZhG3DXHL2s0BIiSp0hYvELKCRkMPbwnSopehnUH0fT2lS0SoliQ+hrbuDK2T0gcrYm+lS7EbMabRJQU1xybMyvF/uZJD0BtRAwsuRO/uDeORKGIV/uVTdkgKP5f+8Dqwiyq+VCL55JurkLZ1RvVXT5m5CFNtU5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jO3uMlOk; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jO3uMlOk"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-34c708702dfso1553959a91.1
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 05:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767791959; x=1768396759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uq9yk0pqa6CErpXggBXldsd56C2yDeubsuwraPJTXIY=;
        b=jO3uMlOkn7Q1U7WAYSmSF+h4UHxzHCjXoM9YQYfh31SgWg4/O64bKtrzm4ysa79yCB
         zDcw3rBQjRUg8J3hUyFFtvDaHWpnD4jW+iPYrEYNHW8LgR0sYA/IGOkmFRkzMbTx0wCQ
         b5PxwfAx0FR8i3TUsR6UhrzXoLh3bfcjYYONgI/mVj/pRxeuT5wTHIJHNaRbHZOIT8sM
         K70G+heh/FW18t9GMf8euH4nOyuBPQ0PJhVCJ0Ke856bDIsD7NKrLwyGoX+xsN3C3Q1F
         KWJssgDISlbJHQ/QmrziWud4bGOOuwIRwS6XMAyqKa66U6f0VaTfN3YRh8RTT/qX1wbq
         B+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767791959; x=1768396759;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uq9yk0pqa6CErpXggBXldsd56C2yDeubsuwraPJTXIY=;
        b=Lz+/I3+XhU8lC5sq1AaXtMwNmqu46D2Lh/lSVGO5COSkGh/XRAgI/3tuNPvPrSAD2s
         nVgNfDl57+9HgLL1y/7lwb1kchvufgCFM/KIDdvGqKovMMfLiStYjjDKBSJadewLNBFW
         ZTOtsjsax1Fxw5ZKKONvlr6vRVqL/YE0f0ibJmOrvM6hov5iUMOqQI4vuWmz2W1e4EmZ
         yAqv6kzMkron2v0+yZn3IAzZH5X4KJ83rH6dSi2zN/CBWJ2biLFgPIiNWM/IXOLkLlwD
         on+XLH6XcHOkOVoTEBfkrjClwDdvUpGtF2HJRslTzZV3/FhtQjHLU6jU4E0Z0E2TTWwG
         YXjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8JxAspCEdKejpffSQx1D3Egv4+YbNswr/6juKYND2sbjYbzWw1X34245NGpMFhkT4MNIid1K7qKE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcemxmJG7deytbx1QuxU/3wkbsKjw+qL+B92WzC4IwWY2Y2l0g
	HWbHbdBjCFtMGeEWPRT9k9jvh2gTRz0QEAggSAtM5Oz23Fp5axsirgMT
X-Gm-Gg: AY/fxX4wHrZpG1iSmbAW+p9scjVN1yGXUn2KN98/0Ib5eoK4ozgs7Xt6jpovWlvh4FZ
	5pPjaAvEQ5jaeLTZqKj+PvxThD0KM9QE0RM4JCkXEtctf/uo4oODcZzp/NVVoWhAHXPNwH/pMwy
	vuQFCgrjeWi5u8huQqC/ezsSUYz3P7+3JdA5gRJ5RNMEL6kXAZOgjORhbsbNgAzB/l83N6JyXzL
	HJgB8lHhRy4imYZdLbDYmf8csJf43sAyCSnIyCpicOpYC146zgkSy1W3J779/EIIkinyfLsKC/i
	sn/G8k89rVBcEMhgZEKYu7rj/oEtsj1m0kLEJOR5shukEk5Ekcz6M5NVXtGwuyMDD+Wv3QnXhLx
	7LEkk6f/Rv+pPztF4tIF7J7ERPJPP9bXMuRm5w/PrsuWasPs96Rmzh51P07n/MbRw1bZ0LKKlCN
	pGje/Impiw5R4=
X-Google-Smtp-Source: AGHT+IFeDRL/b8QepEuqdVndH+CCmCN1ugMAXxIErciQBd/TK/BwskXiSKTpfxPKZ00Mm2Wqq53x8Q==
X-Received: by 2002:a17:90b:4acf:b0:32e:749d:fcb7 with SMTP id 98e67ed59e1d1-34f68c28379mr2157102a91.13.1767791958715;
        Wed, 07 Jan 2026 05:19:18 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fb74435sm5150241a91.14.2026.01.07.05.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 05:19:14 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 211B1415FEEC; Wed, 07 Jan 2026 20:19:11 +0700 (WIB)
Date: Wed, 7 Jan 2026 20:19:10 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Ihor Solodrai <ihor.solodrai@linux.dev>,
	Hemanth Malla <vmalla@linux.microsoft.com>, bpf@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
	yonghong.song@linux.dev, john.fastabend@gmail.com,
	kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com,
	jolsa@kernel.org, vmalla@microsoft.com, corbet@lwn.net,
	Alan Maguire <alan.maguire@oracle.com>,
	dwarves <dwarves@vger.kernel.org>
Subject: Re: [PATCH bpf-next] bpf, docs: Update pahole to 1.28 for selftests
Message-ID: <aV5dToFzshRdIjgS@archie.me>
References: <1767352415-24862-1-git-send-email-vmalla@linux.microsoft.com>
 <bcd23277-a18e-4bb5-ba76-3416c84511c2@linux.dev>
 <aVjdUjai0lzpMeHv@archie.me>
 <CAEf4BzbAKGJsWov1udk+f5jS-qKSLMY+j76FP-JuWuxjhc0h-A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8GbvbpBfl39DdqHx"
Content-Disposition: inline
In-Reply-To: <CAEf4BzbAKGJsWov1udk+f5jS-qKSLMY+j76FP-JuWuxjhc0h-A@mail.gmail.com>


--8GbvbpBfl39DdqHx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 05, 2026 at 01:46:52PM -0800, Andrii Nakryiko wrote:
> On Sat, Jan 3, 2026 at 1:11=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.co=
m> wrote:
> >
> > On Fri, Jan 02, 2026 at 07:33:50AM -0800, Ihor Solodrai wrote:
> > > Not sure if it's worth it to add this nuance to the QA doc, although
> > > in general we should recommend people running the selftests to use the
> > > latest pahole release. Maybe add a comment?
> >
> > I guess minimum pahole version can be added to
> > Documentation/process/changes.rst.
>=20
> pahole 1.22 is already specified in Documentation/process/changes.rst

Oops, I didn't see that pointer.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--8GbvbpBfl39DdqHx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaV5dTgAKCRD2uYlJVVFO
o1kXAP9UlgleGCs3hp35KABPfg2p2+nPRBacjHknZrtTwIG/GgEAyfGQ4DIno+uM
KJeAT/uGjeN9Vkfg3/yhXRR9UYN3CAs=
=SAY7
-----END PGP SIGNATURE-----

--8GbvbpBfl39DdqHx--
