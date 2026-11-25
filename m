Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649784;
	b=ueLM7B8j66RIVsAon+KLE4pa8TPh8UAnEw8+M6DsEDkuwK84ZGhXWTMwHKT/u+XiTf+9
	 YfqXQHnpw+75Kpdf0QmA10e65z5s6kt7CsRGRQyJOHL9tChSU6+07FYhf0Qb+6qgGNrvD
	 j9C31zqBpoxeyv6IGAw/Ye6QnpURFUAqeA476N6fho2tvYdPXQIXyl0+LwRFruOE065hX
	 D6DgOKLOiiNqvC92lnwrOcv1i8kl7fqwraOhQlpOQtabqKvQHW5h9h8YoJFzTs4os5uoD
	 A1X+jaa3EgFhPkLMNQFzz9gl69naNaaWWIGKvgnHgkxUkuqnCT8NYT6KzeoPRlRdpzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rlp9gEwrZkHdgv9tEPsrmJHObN6Zh/DO91hvElQOqsQ=;
	b=G98FQY3T8+9Tn9+63qWSqRDVBQVMHr11t1LeC2x95QLY3WZAwKnA06w7gmJt+XGo7AUE
	 prxkhKGQoQv8dd3CxGMJXljthr6H2zB8g4BSRlvyGef7aT+sSlxEdguMFYJjvZJC7LSUt
	 9rblhtB0bb9hpC+T1wRBKWTz2vdPq+j/DKWBKqNmvAgdiuxyDE+4PjYH/Y9xZGkoZHpb9
	 gVf86uZwbQHJwty/TtuI7L+cnMwWwnX3j0QBTxI1/W2mJQ9Ae4Y/VJBcB6D+wJLdCTAL/
	 53tuhGHjV6eL5RlyB0apC7wrYLb80rBMG3zCzX/90JHXxrCiQEPuviqvcRx1rq5eFSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nR9+m7iT;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E1C606A326
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 23:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0E1C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nR9+m7iT
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f052ae3c86so35387655ad.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 15:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649783; x=1796254583; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rlp9gEwrZkHdgv9tEPsrmJHObN6Zh/DO91hvElQOqsQ=;
        b=nR9+m7iTvWR/jIkbcf9Z+O6bsNRp72Axj2s0OUlmt9yupfWpUT6wQsOmbmA/yZJycV
         li74Whz8zjMczAWHicw6f0f6u4EbjNGeTVeld99kVxbyTQpe2UH7YhtyOh0QMNjRMOep
         HDFIn6AteS/5VpRAOObaLgMoB1UpY+xLEepGGj+nAnWWf7f47TiOtegrcKmxE4VtrxQH
         8OOQxOA/8pggzN/01WLKokpRZletP0m1gmJ/5enVlmreyR7RdJTTGCglXNYekVu8ZEY+
         6SHfiqaacf6otbN3RQX1njz4RCmmRFNHgVZyIWxQeQ/vINPUGxE0gI+gO4JZjNy/S/m7
         Nn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649783; x=1796254583;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rlp9gEwrZkHdgv9tEPsrmJHObN6Zh/DO91hvElQOqsQ=;
        b=zs49gkIzKLTEHbXT8OKGLeXSwqYC18S0zqtGQWwjDao4P5t3UpnciPDJkIJzK2Plt7
         BlY7Aj29pNIyGnNNZ5Tk45YIMSsGKGIxYCk/lOazC+KmOh75Lp1Yu+NELpYTri82K90c
         5n9wBIgCJVirs06cifQSZRfvTavxOPLF0+IBSSWANLgyQ9IW39K91H31d2PoiJ2q6VaD
         HLa3avGegFR5+owVTQeFYDCJ2hdQ98KVZXF//naSdNuBkQZsXWCUZYxKFF4uiCovpvty
         NmdvQhAi+3D2CZcaCweyhryU6BqhE+goxvLq3i8pLZPNu552JDQnpQkS36PICukXtKEz
         jC3A==
X-Forwarded-Encrypted: i=1; AL+hErGXKmxSgw9ovuL6bcQuOupO0Np/KPqVLhpPnPRVIkqfuZBuTyWLstO1aOls/qwKWFqsxy/zFJA19k0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qTYx5zZT3fWwakF1GBZBfGhIuPCNGpI0EaVyCpqflsDjBIodL
	jHkdjznF3EWTTqKeX0Gf/KUFe9HmJlgMI0sNowMyUznMbph3IrJDvUkd
X-Gm-Gg: AZFdTZcrDT9ePzI/+ykHMTqit3Aqqahxxzt64rz0uGQ/giMGEsbEpeavYOG5VcliIYF
	03m0DWggyNvkZWAqOb0F5kbnucNGvtl4vu0FvrYdgoWm2DKAu1GazHLIs6jdxw3kGEyubgPOIoS
	E8ozn6Mg005XcW15MJQniDNt/7GPXAxg2shEWQ0LfrrEcj/puTXyQfEOfwZmA7YrjM1A7JtVUin
	mEMPF6SabwUV86oQtCcJsOGc//Dw+Wa9/BGD1pqK47qO13sl2k9q5c92ERN590LzLgFqhyP3fip
	XPxHS/lODwym33sGM8ZDjtU8UB5TXhubvwyzPPaOcNrlw38oD1UtcJ8tudzkKrL7WBX7kmIYOTp
	umI4qjzPbZFBzN9NlDGS3mrBhkkJEJ14sb+5LWM/ltaSVHpf2wzDTZVR4Ig+lJ2cIp3z2OMFEFr
	WwPLgs9EtuE4dr6I6Y3eBeI5woPYDQ0mruk8txBAs1W3UH8kf7vya/poAuoST8x3K7bG1XeJJBw
	+AUors4ZZagZSTAt+JhTIeMVFsN59vISdQiAfMqtO1Z6TDAKhnJ5KegJyv4l/vQKJz8pWhjKgFZ
	rwAyIIqdH0fX6Birgk6zN1i7Lcuf
X-Received: by 2002:a17:90b:4ec4:b0:3b0:a3eb:759d with SMTP id 98e67ed59e1d1-3b41c8fcd3fmr17046919a91.10.1795649783039;
        Wed, 25 Nov 2026 15:36:23 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b48b41928esm19602862a91.9.2026.11.25.15.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:36:20 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id C3C7E420A76D; Thu, 26 Nov 2026 06:36:17 +0700 (WIB)
Date: Thu, 26 Nov 2026 06:36:17 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Willy Tarreau <w@1wt.eu>
Cc: Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, gregkh@linuxfoundation.org,
	Johan Hovold <johan@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v2 05/14] docs: security-bugs: explain how to send a fix
 that can be applied
Message-ID: <awdw7OLaYvXcGPgj@archie.me>
References: <20261114190014.17826-1-w@1wt.eu>
 <20261114190014.17826-6-w@1wt.eu>
 <awdqgBF62SOKaU0Q@archie.me>
 <awdrPui-KI-SK_5N@1wt.eu>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Kjo8vLeaeTg8pZ2D"
Content-Disposition: inline
In-Reply-To: <awdrPui-KI-SK_5N@1wt.eu>

--Kjo8vLeaeTg8pZ2D
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 12:11:58AM +0100, Willy Tarreau wrote:
> On Thu, Nov 26, 2026 at 06:08:54AM +0700, Bagas Sanjaya wrote:
> > On Sat, Nov 14, 2026 at 08:00:05PM +0100, Willy Tarreau wrote:
> > > +Most fixes sent along with reports cannot be applied as-is because t=
hey were
> > > +damaged by the mailer or lacking a commit message, forcing maintaine=
rs to ask
> > > +for a resend. A fix must be applicable using ``git am``, which is mo=
st easily
> > > +achieved by letting git produce and send the messages (see
> > > +Documentation/process/submitting-patches.rst).
> > > +
> > > +When the fix is meant to only be sent privately, the preferred metho=
d is to
> > > +send the report as a cover letter of a series, followed by the fix::
> >=20
> > Documentation/process/submitting-patches.rst guidelines also applies to
> > privately-sent fixes, no?
>=20
> Yes, why this question ?
>=20
> > > +
> > > +  $ git format-patch --cover-letter -1
> > > +  (edit 0000-cover-letter.patch and replace the subject and text wit=
h the
> > > +   report's subject and text)
> > replace the subject and message body placeholder as appropriate for the=
 report
>=20
> That's a wording detail / preference, not going to respin a series for th=
at!

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--Kjo8vLeaeTg8pZ2D
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCawdw7AAKCRD2uYlJVVFO
oy3qAQC4EPhrAXmftWcO+Qjt6IRMGr42yV+tdJa0t7L7OWolnwEAxVxjaT6iGwY7
vDe54HMMZEorAqWYR7Jt1hlwu+PDuA4=
=BL++
-----END PGP SIGNATURE-----

--Kjo8vLeaeTg8pZ2D--
