Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B60732E6B5
	for <linux-doc@vger.kernel.org>; Mon, 27 Oct 2025 23:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761608488; cv=none; b=gKiP17/agbKGZ4bbtsex1+Spcj9Dd6IY3CAvIMdqeb/QJnByErZot5buDYrnqdEMmNnpjA4PLSO6XgJ+64Fgf2ZaRZvvYNSKDW8t7rnmVPYAhqzH1QHeAgZ5DBocsUp+NOvOCYU5JNVTRDlprHXjoUyKeB5TDAZcrbmRKGlnfhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761608488; c=relaxed/simple;
	bh=s3TSreP4LnoaIqwTPt/6jjce6Jv8PhhiuGIE2VBvxQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ripYk7l4ElqNjNYARJMgZi3j1dFZAZLmd1A3UHu9/zXr20Q0Ik2pdyHmIOsme9GH6d3MHK9y4OwzWPUL8iIKKUuEa5if0cVkyO/Rs7v6B6SAU92ImF44fG8KPLa7+43/vGpxAtt7o8AvMDsWOlDfr9g5h23h3/xzxWRDSzVUb2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jycW97YE; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jycW97YE"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b5579235200so3705831a12.3
        for <linux-doc@vger.kernel.org>; Mon, 27 Oct 2025 16:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761608486; x=1762213286; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s3TSreP4LnoaIqwTPt/6jjce6Jv8PhhiuGIE2VBvxQg=;
        b=jycW97YEWCsbo9DaXwNFPsIwcfXgTClw+zYMM09uK8TzURJ0gqVTWBbeTuALcNvVA0
         rxq/1jdzJIhVU4Uaw4znVqCb1lBaGDtt6YG/BuiDNg5bT2yRuEH8msFsdz7zoW19/djP
         GL8TcJwHpR9oVilsml5Ddu9KNTEwjTLeDIoWAr/9qjFOxNNyWVsibCOw5Ber2DGKxl4t
         ur06DRTInldMCQyBsfQi3/OES2d9glNwkdOHKG9lnyZWWrmL0ETVHb0lksLcv2upij5D
         QhKN7RJucXyt4GNGMF6F5xUolrUcNto55CyALsvUEwriRXTC0tz4ICza/7FYr9KrGISg
         ojgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761608486; x=1762213286;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3TSreP4LnoaIqwTPt/6jjce6Jv8PhhiuGIE2VBvxQg=;
        b=t6D1sq0DoFfBFNy7AS/11CnHiTdu3tlly5TgjnfrELaFXhVSfrY//yi3oLoQ4FLhME
         k3Vz35Dc8QuGtn5OuTrywwZqQda+xqmK5xAZH/+f15tr7OIiF8qYcMIe2SiR8sEA9nLr
         XDFnmGCnyv5PxQnVUEhMPeA7c/nzjTxGmwUvkk4plpS5x7DoqehBXP8sk4s8loIfpzu2
         DHVkPfwX0OSHCZ+XCj1cLnSWPeCExzAhNKo2HqToapHnsJtZxx55xlkiKgOr3bVPpxv9
         JxWxaVPIPDW0Ju5xTRrdTqpB76bPPY03sfMNh6VVSBm1hS/DS9xfyay2sK31EiEycYJh
         znBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXX3AbcN57/PCXjffYRs5CLGe36GH5l4+BmEAmKsoyf8hhL0woIIu8jkF5MZXHIqiZkugfZrgmZ9L8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTeMN2BREq2tiubO9rMAICHe0eTnJtgOZuQPgLo4xQX7n28dq6
	eJJjDIdXcYVJ55Lc9kNeVjp9xhP7dA5DQnS6+zy13+HC2wriMw/HgwZR
X-Gm-Gg: ASbGncvTsqeeyV8dpsfpmSAagbHNV/AEETUMCNbh3ju6aOA56qrvjuC9WMD5pSjR4hH
	5IiuipeFz/6S3yI15zX6lKEPEhQtvEg4HEwJCU6NdExTP0WcN2WPXXGpm5zn7b0OIWH+LKPlB6E
	Sy6uBFejsfpfJPAjgIIoqPWR5WyHrKy9RsasQBnidqOLrKp5tLNRgvtQVvpnFv4G2O8iY/j+hms
	+DatJlC1sXK2t7RZ8/hwsnL5Y+LTSZ5t/8X1o4mTQnX2KRXkAzkP+zu89MhhLyrGwoPsaqUkENm
	X/dfJPR+eX5TzPB+6yRkFRJ0XREdgAy3KAtjiWlzWGY8pBWzzvOmMXJpQtpAk6VIUeBeF9I/1aV
	NlowpeZsKWu1YUVGkfqLw1nm7Eb2PZe+y5gUCAJWSydkvth5OIj6wqNMxjsx3oQCS3lbQUNUSrL
	VlNHSWpnt7ag4=
X-Google-Smtp-Source: AGHT+IElurffGRVabfwITQEOqntwzhUO8dSeIfiaVBREZKYDlvN/XqwOxblskEBswWTWEZMbSi3BXQ==
X-Received: by 2002:a17:903:2346:b0:270:ced4:911a with SMTP id d9443c01a7336-294cb36e45amr16790625ad.9.1761608486117;
        Mon, 27 Oct 2025 16:41:26 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf341bsm93730455ad.14.2025.10.27.16.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 16:41:25 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id D53664209E50; Tue, 28 Oct 2025 06:41:22 +0700 (WIB)
Date: Tue, 28 Oct 2025 06:41:22 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org
Cc: Michael Grzeschik <m.grzeschik@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH net] documentation: networking: arcnet: correct the
 ARCNET web URL
Message-ID: <aQADIpGASbUxRDzx@archie.me>
References: <20251027193711.600556-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aqE60w0Sukhk/Ofa"
Content-Disposition: inline
In-Reply-To: <20251027193711.600556-1-rdunlap@infradead.org>


--aqE60w0Sukhk/Ofa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 12:37:11PM -0700, Randy Dunlap wrote:
> The arcnet.com domain has become something other than ARCNET (it is
> something about AIoT and begins with an application/registration;
> no other info.) ARCNET info is now at arcnet.cc so update the
> ARCNET hardware documentation with this URL and page title.

I'll fold this into my patch [1] when I roll the v3.

Thanks.

[1]: https://lore.kernel.org/linux-doc/20251023025506.23779-1-bagasdotme@gm=
ail.com/

--=20
An old man doll... just what I always wanted! - Clara

--aqE60w0Sukhk/Ofa
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaQADHQAKCRD2uYlJVVFO
o2EcAQDqLQCDDc9q+5KW8KHHfbp/58DyQrfeH9wX5LjLgi7B4QEAjuouAs2BOgN7
hFukh6lzYvKSRVRLCnPlSNMjFutJtQw=
=ft2/
-----END PGP SIGNATURE-----

--aqE60w0Sukhk/Ofa--
