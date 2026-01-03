Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5631AC44D
	for <linux-doc@vger.kernel.org>; Sat,  3 Jan 2026 09:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767431512; cv=none; b=JgW2fc+dHqg5i/kJ2KT8yD1WnHgn3/IYc0vNOlyj08OceiFyiPMYlfi5X/6Xt5XjMIHNpNeYxAiB4bXYV5MDMJuMS5GvFcr9yptGrWyjCtj2GqKHbxSM1vWW9kTHeMw2H3uMl/di9WQpMBFk2KkKgoCFWbo9EZhpq20g1wVHNTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767431512; c=relaxed/simple;
	bh=HA43poXcwQpADE2V9nU830RzFH6YDFnRj5guQFKHWY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1oZ+IMF6eAqZHZ1iSyGHFLSQV3JWTYlhPazyiWTG6CrQ5VnZcDHYbOk45QrACWs/JNbr+KG2b/cNMSWqlIXXut6f7bC5MDL2frzHOZFzeyeDWOHqQUaTLfXKkPQUt0PQlv4bafEV9vHaSYxF/k1D6evtxzVlirQhEzN+SgvR7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QBUVEBi8; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBUVEBi8"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7acd9a03ba9so13042715b3a.1
        for <linux-doc@vger.kernel.org>; Sat, 03 Jan 2026 01:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767431510; x=1768036310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CbB/u4Boyz6wim8LLKDK6vrmsmGBVfzV79ZjNtpeGas=;
        b=QBUVEBi82nqruvb4sfB04p3544/imFFRNhSir75cFMCYEf4h7wFYoiCRPAb2RDlCUI
         JerEuwpOEZ0GOxQ8jFm34HljVvdV5bYZafRfcssETKyeqFGT39xc0+IHNUcmMeHbwoDU
         FprCWxpzDtZY7DMFALG2r1vbuE8T7s6QlLk2RSj6hW+OSjM5W6mi3GBXRjauu0pptzFM
         c3hH95Ec9RJvj4mBlgHlSQ0LUkY4aOK+PSr/O8tdqqxMbs7WpK6/LQ1EBXhbvcy+QoE0
         FteuA3DvB8BRlyGkbU6KogeB1GAtL9ry9eLbltQrdGuLSVt3hPOqNDbi7sXQvHmDH21g
         +JtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767431510; x=1768036310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CbB/u4Boyz6wim8LLKDK6vrmsmGBVfzV79ZjNtpeGas=;
        b=FV4HrbMA6ky+XoBYiCrlbEYmdcVOAnkciVqPLi2d7Y7zb+S0kAgweedcpfqv4hVo4p
         j3dhiOaJTEo+p6yR/8yjpzV8W0dAUOMthrty7eF+2d14NcOr9FrU6vLaBWn4G3j7HuIW
         egIJvxRWXWxyZ4GpyMIQCerHeENmriTW49iW8m/HMg65NJ1nDND7U673cu0fFIqAqK1O
         GimaU2BhBWi3ioP1ZOGa+uJLn1y1TZmEikoPt+LMNnzMnvskTIcNrtNUePcKUghIDzjU
         fsY4T3AHTowa46Vlugk3rMIxdS6pBjEj9wS0M9k52L3/RELhY/Ur5b5kOcmTihEMxzR9
         bmPg==
X-Forwarded-Encrypted: i=1; AJvYcCXnrvs2Vuei/Nt9cYeYfZH8nKAPrrW/miWHjzqpHXnDxAVZ4Sa1YWm5AQ6Slw7jXcHkjClpFDZVjVw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxethVWvBbSsz4nO/5OWIQzPfxsWNnCOim1wxQHKSH2z9fzy4N8
	NDN8YrOr9aRsniXG2qv0oSwGX2/DdMXfZrk3dM6KWtanGZMLDvi3MYqE
X-Gm-Gg: AY/fxX67bgN/rba19LHqRbRkCzf1GjhI4s71xh02DRqH/xVP/Hq4RlwNrAJEaQYUYae
	fRlxQ5gZsSamK3Ai5P1VVlRoZ8Y7fUxOfDQHPnYZ0Uda3OgkdLp4w1ShPpmluOPIuC9dBZBxec6
	29aZPRlqq8EKk+Q3UZU4i3DQLohsP8sOORGQ7u6Tn1nEJUH8WEGqXKx6ytUjKBzmN336RQ39lpS
	P7IblPVUQxNWosumRqG7VwtbRj+c7A7Mk6CRQGX3QEnoF8jRsNzfFtIJylNA+gz0/8FykIHCUFs
	V7bAyrMo6hBgcN/0RfeYZMlxOLP/Qmoa2hFoETy8KlZsvCNmxq7Hgt48tnFkdFRBK7fvemO76+L
	xK0SAdd06TELxhVyHng0M0at2rAW+rGoGcdTuwa1b+J1VDOwCeN9npynXaZlZ/xcw4G8ap0GKbr
	5Ujh2zOwnFw7g=
X-Google-Smtp-Source: AGHT+IHj+Yc5i5BlyxHw8XH6x0veUjij66PZD5scVA7u5fS2kWQiygSaCY5f39DOPJCDQFwr9SkNbQ==
X-Received: by 2002:a05:6a00:e0f:b0:7e8:4398:b34f with SMTP id d2e1a72fcca58-7ff66079339mr38129658b3a.34.1767431510268;
        Sat, 03 Jan 2026 01:11:50 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e797aadsm42981212b3a.61.2026.01.03.01.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 01:11:48 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id ABA154092C2B; Sat, 03 Jan 2026 16:11:46 +0700 (WIB)
Date: Sat, 3 Jan 2026 16:11:46 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>,
	Hemanth Malla <vmalla@linux.microsoft.com>, bpf@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
	yonghong.song@linux.dev, john.fastabend@gmail.com,
	kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com,
	jolsa@kernel.org, vmalla@microsoft.com, corbet@lwn.net,
	Alan Maguire <alan.maguire@oracle.com>,
	dwarves <dwarves@vger.kernel.org>
Subject: Re: [PATCH bpf-next] bpf, docs: Update pahole to 1.28 for selftests
Message-ID: <aVjdUjai0lzpMeHv@archie.me>
References: <1767352415-24862-1-git-send-email-vmalla@linux.microsoft.com>
 <bcd23277-a18e-4bb5-ba76-3416c84511c2@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x53cqXSfhecsAUML"
Content-Disposition: inline
In-Reply-To: <bcd23277-a18e-4bb5-ba76-3416c84511c2@linux.dev>


--x53cqXSfhecsAUML
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 02, 2026 at 07:33:50AM -0800, Ihor Solodrai wrote:
> On 1/2/26 3:13 AM, Hemanth Malla wrote:
> > diff --git a/Documentation/bpf/bpf_devel_QA.rst b/Documentation/bpf/bpf=
_devel_QA.rst
> > index 0acb4c9b8d90..3a147b6c780e 100644
> > --- a/Documentation/bpf/bpf_devel_QA.rst
> > +++ b/Documentation/bpf/bpf_devel_QA.rst
> > @@ -482,7 +482,7 @@ under test should match the config file fragment in
> >  tools/testing/selftests/bpf as closely as possible.
> > =20
> >  Finally to ensure support for latest BPF Type Format features -
> > -discussed in Documentation/bpf/btf.rst - pahole version 1.16
> > +discussed in Documentation/bpf/btf.rst - pahole version 1.28
>=20
> Hi Hemanth, thanks for the patch.
>=20
> Acked-by: Ihor Solodrai <ihor.solodrai@linux.dev>
>=20
> 1.28 is needed for --distilled_base [1], which is only a requirement
> for tests using modules. Many other tests are likely to work with
> older versions, but the minimum for the kernel build is 1.22 now [2].
>=20
> Not sure if it's worth it to add this nuance to the QA doc, although
> in general we should recommend people running the selftests to use the
> latest pahole release. Maybe add a comment?

I guess minimum pahole version can be added to
Documentation/process/changes.rst.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--x53cqXSfhecsAUML
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaVjdSgAKCRD2uYlJVVFO
o/ofAP9+4EXkvyXn4xtHYs/ZObOs1c59JDS0PbftimugULAbBQD/bWQidzmK3WT/
kSgpPyJVYNhsw4M7WZ30T5LQm9z0QQk=
=xORZ
-----END PGP SIGNATURE-----

--x53cqXSfhecsAUML--
