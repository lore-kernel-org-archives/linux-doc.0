Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E52C32FA3D
	for <linux-doc@vger.kernel.org>; Mon, 15 Dec 2025 11:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765797099; cv=none; b=pE03LScbwNqIxqV9x0BrB4soJBe79DR6hVkLFRKI61VpB0azTb1Y+7+eh89kImU8VH4B48I5+HMNAd5Lduo1w3rdr/kvzsqKXMKyJGIBMRqCiPc2S+Edf+JT5MI4erVvio/LX5VALFUvR5ieFZMYI0w3Ssy2XC9uA4jzAskXGxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765797099; c=relaxed/simple;
	bh=xLkLnhXJLH4hRPCe5HQdE0kdJA9A6njjHeR77PMzKQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFbnQz8XvVb9rtS2O001DKN2B+954DYAo53SinAPinbXNxMV2LNIpoVX1Y9k1CyqDCwTpeu65pOzvXPSGWIRCCZO/Rh8KkIwpVK56ZvVH6iyMhjnwBgVqH3aj5lEuaGVPsuZJKr85s+Ai1aegfg2BGDp9/ScWoDPfdlbxWHuFKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fkCNBLQo; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fkCNBLQo"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-640c6577120so4025175a12.1
        for <linux-doc@vger.kernel.org>; Mon, 15 Dec 2025 03:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765797096; x=1766401896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hg923q+5CeeSYekQ+G/+hcSHwymAktpz89SKIFfb8tM=;
        b=fkCNBLQoKCAIe8BcgEvkwcInTBClViYA5PhENcWlgvaHBsMES8hbCpm7HH34Dvvb1B
         zE6w1u9SYhGxIJHMnuoMCR/xjaDvdyNlF1aXe3n01FMo5mEQXt5COYGTLMxzLNG2NL43
         Gjb11eWz/+cjokq7xjztvaduaCoprM4HtCMQop0b++TiWIvxgjT9biIP39QY5x8TWWUm
         it6bABhh85lT6iH4bziB5h4keD+CAq96axJT8hvvGyGse48POdgQAs2GBiYI0/di2SKS
         55Ir0QWTv/8PHHraLBIqmqVLLEd/4Y1bnqe14Pr1S7G6cbUsVuGsAVRh+z7U83fkQjgZ
         5n8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765797096; x=1766401896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hg923q+5CeeSYekQ+G/+hcSHwymAktpz89SKIFfb8tM=;
        b=brUQGl9wDbJhyr+vLKpHrRH5kkQqziuNGcOt9IsSg7l7Nc+94GSsJys0hnI2JYjDu4
         ZsIxJ72HgIGOJqUC88e5X/k6PTdVYP+RtWk40YysKInWx4olZLeLnJxxW8fO5JUahrqm
         xYQoW0o8Kufha21VxNBkDnv3zPpT2UzYGzEkHg6dUoIFXrqP13Ts1wIBJsRkEwaUmNLy
         PqGj1zreGY55XZYuwOyb0+Rn5AjGUH6pog92zYuUqE3/sx7d7aM3RNRYD1vMV/8TO6Cf
         Djw7f6n+jUKYFESk09w0d3E5ZdESugbyy77WWYxydtI1Cxv2uP3f1Mw5lDt5shImOEy0
         2hTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8Fkcpt1H/tIqjXzORU5N0bd87HssngvLA/7XEJFffwnKB2ry+3MMmMvSKv68a0E0WfVrpzeIGTGo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPHyjMcBvE2+vjJnPEA2bX6ZQQrVcftrKnuj7ZhcckhQ9pIP2T
	6+SvxpVgpJ2MsWBHVB6GuG1/Zypic30uXKwwqPjX/0am+rE1gD/pGtY2
X-Gm-Gg: AY/fxX4jOicb5C5eCcywBIejSIQfmX2L6zYC/3WHkdBO0NSe1mO+5KuCO3Lf9mu5UBq
	fNSVtoA26ZVOQiTCEqkH+0qq4QpKMrDI333CKYbIvAJGPA8YL2xMED2mz44WnriVB/bq0/g9zYZ
	DDV1sgA+zlhBwPdj26jzsPjhJOpTHdIF7dknUugkoqxU8Utl5Cud7bX06QMyFmQ/VZ1zb5FqoOf
	0LvdRT42gLeAtEdLpN8pgIzZ683dziw46TPWEApESrOulwNTjH4PePp8yj5actDhLkxivXaq4eb
	IRzIeNKvX0dtBNmFqoJpCCxe2G/cT6e8V181l/4D3MNofM5XvG62P4RJLYP3Zex8FvVs3aLk1Cj
	mqyK34K44EY4fLrCc8fsrP2+QDJ2epG2tecQelrL4EiyiXfQ2PQlJREesmjldSgWxhn/Chd0KF4
	PHFnNS5IJsgq8=
X-Google-Smtp-Source: AGHT+IGKOweNtFt3/0P8xssS/AP+j/taWGWWg8/7uGaPVWDTM4IPG3KqfrYrsCmbVakWZVr6/5Elxw==
X-Received: by 2002:a17:907:9494:b0:b71:df18:9fb6 with SMTP id a640c23a62f3a-b7d236eeaf3mr1166624966b.26.1765797095460;
        Mon, 15 Dec 2025 03:11:35 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa5d2680sm1349648566b.70.2025.12.15.03.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 03:11:34 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id A954941902F7; Mon, 15 Dec 2025 18:11:30 +0700 (WIB)
Date: Mon, 15 Dec 2025 18:11:30 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Crypto <linux-crypto@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: kernel-doc comment with anonymous variable in anonymous union?
Message-ID: <aT_s4gzB2w8fLVMh@archie.me>
References: <aT_RDASKMW4RI_Yf@archie.me>
 <aT_XmzUSkbFMLHK4@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7bdMZitQgsJdhtm8"
Content-Disposition: inline
In-Reply-To: <aT_XmzUSkbFMLHK4@gondor.apana.org.au>


--7bdMZitQgsJdhtm8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2025 at 05:40:43PM +0800, Herbert Xu wrote:
> On Mon, Dec 15, 2025 at 04:12:44PM +0700, Bagas Sanjaya wrote:
> > Hi,
> >=20
> > kernel-doc reports warning on include/crypto/skcipher.h:
> >=20
> > WARNING: ./include/crypto/skcipher.h:166 struct member 'SKCIPHER_ALG_CO=
MMON' not described in 'skcipher_alg'
> >=20
> > skciper_alg struct is defined as:
> >=20
> > struct skcipher_alg {
> > 	int (*setkey)(struct crypto_skcipher *tfm, const u8 *key,
> > 	              unsigned int keylen);
> > 	int (*encrypt)(struct skcipher_request *req);
> > 	int (*decrypt)(struct skcipher_request *req);
> > 	int (*export)(struct skcipher_request *req, void *out);
> > 	int (*import)(struct skcipher_request *req, const void *in);
> > 	int (*init)(struct crypto_skcipher *tfm);
> > 	void (*exit)(struct crypto_skcipher *tfm);
> >=20
> > 	unsigned int walksize;
> >=20
> > 	union {
> > 		struct SKCIPHER_ALG_COMMON;
> > 		struct skcipher_alg_common co;
> > 	};
> > };
> >=20
> > Note the first member in the union, which is an anonymous (i.e. unnamed=
) variable.
> >=20
> > What can I do on it? Should the offending member be deleted?
>=20
> You could either add a comment about SKCIPHER_ALG_COMMON, or
> fix up all the code that uses it by adding "co."

But that SKCIPHER_ALG_COMMON doesn't have any variable name, though.

Jon?

--=20
An old man doll... just what I always wanted! - Clara

--7bdMZitQgsJdhtm8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaT/s2wAKCRD2uYlJVVFO
owCiAPsH4XTNYLL743r/Gn8K0FybHSwMmrzfjy1MJrpO1o9qjAD+Jf/p+/3f25L5
df+TNpxg/LihogMNPQX+SYSozEx96AI=
=K5jI
-----END PGP SIGNATURE-----

--7bdMZitQgsJdhtm8--
