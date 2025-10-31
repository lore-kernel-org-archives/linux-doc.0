Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463F8277C9A
	for <linux-doc@vger.kernel.org>; Fri, 31 Oct 2025 02:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761877092; cv=none; b=pYUlvMPA3sGb42xaD82L6nO/HZa8m5kQaggc/3jhdg1wKjtZelCswSDJKWiQ9Bsq5eUiqWdvFxeMzdSHYJ38ALChhyO0jm7kvEy6a5OfjCdlE3CzQHrioIBPsH8K5c9SrEWOPf2BIKpdmMN4k67o+/NWkZRG9XebG32lZ7n6Do4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761877092; c=relaxed/simple;
	bh=2Qz23v1zvkjWWO/0KBTostHDqcO8A9fKu8aLJCvZrxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O/AXgTPRcIHR3EDhlh/CeWqAF5h5/NP22gSa8eKTSPAqfV5EPEnocduUgUqvwil4cikpgIdxOsPXnIICWwYW60lyomAu1J3FS82F1zhreDkWtP6fh+AAWs0JIEHekwIZkRseuQD+eVOsBXsroXS1IuYurti1GPGegSlqS51UjKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NETnpgWT; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NETnpgWT"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29524abfba3so2169555ad.1
        for <linux-doc@vger.kernel.org>; Thu, 30 Oct 2025 19:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761877090; x=1762481890; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Qz23v1zvkjWWO/0KBTostHDqcO8A9fKu8aLJCvZrxw=;
        b=NETnpgWTCdXKoDasEYybumdnAEqR2riF8rD6hk9JLe89jqTxU2orKkZvvNOfw82Vgn
         W5hoLMqs7DLMtWMSrv8vQZR+Ng1GGta2ugjfPkF+vVKzD3RV+VJapSRSL8muzeyiCRGl
         AhP7wltbS+KIlo8QoyU3DrcEz/1pzapjLQLcMcH0a1BAHcsB9Zf0jnASS+6ql7mQaCC2
         KsBMDGciZGewbUXo4sRGwM6JP+l4i3dcEf5A02nY1CQVvfd3szmsxDT7Ezf+lRT3dnRB
         YhIgBvnR/RaBAPgVZNJAHOZEWljnnFSGKBR2sbcpUDRXYfktChrryLRuxh/jsobvgWa2
         eHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761877090; x=1762481890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Qz23v1zvkjWWO/0KBTostHDqcO8A9fKu8aLJCvZrxw=;
        b=dYOatf5nY/rLJVxms3GY2eM6W6TLdshS4r0HGaEXsr5/ubK4lFrpYaf7wRwx5wHvLJ
         5GREQL0AB9i/01E7aLwLNdxtlD1P5lWOA1efr+fezWVfZ1AxN9Iyj50XEVXCeLjdLYjF
         7Qi8fQOM6MOT8SjQyJ4tVfBwggn1kT+q3iSAVebx3hZG3PedMWsycAyF3lz4SKr3pofw
         4BGB83b3LCnEFYz0QgLQOKajkCUsi2MGVPJW89zxtnRjFFfJExfNqgDYscpeedoGxcvJ
         gxGFcC5koVZF7Pkk5r7vJiQKapPt8Gia9N0UiHyVJd3JqjPEHtdjf35rsMoy9PNFDt6E
         CJmw==
X-Forwarded-Encrypted: i=1; AJvYcCWPzXK7f5onqqhHoj31gifdDcKcJenvtO83Kb8SoQYIaJtbrpnKnxsREfd7exmQR1k0NtXoCK5BvuA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM92/1SyAQ0Vmh5+qbC+iR7wEUavgCd0XJN1/BtyoE0oHclLHr
	qCvNXTTtMYFgmjwVr3FNFzWXPYXj9g1RZbUkQMoPtxce1enJg0tubIvB
X-Gm-Gg: ASbGnctV59BDX4cScwM1A12i2ilEfSjCRx9o0xy7s90s6qUI5QW6Wyw21xzCoSJvGgK
	flHw6gSi3WDpIdWdYbH8MqLk1wms5a6ivcC/rVDHGwCExM+avjTYUxGcqr87z2jr01fttLN9jvB
	bqydMTmEeBikDsSg0mS8hkR75DPFL1OLGJi4uug7bj/6fBe8Zn1aWuw9lXPdLspi82jIX7UuwLk
	7800B3h+ZBbJCUai/5y+pXJWqN1IXHSzDteayU0bQkGAhplm1oR0akgDT7TcdWz5SDKr9Q1wR+Z
	6jbDWSaJ2gkYQc93xgksbsl8Bjdmthy7qVx8Az+inxE/BaUoIx5iFKYw6V32i7WVfdnyiwsqWGm
	NH9vtFyoUNnt0zAGeK7GiRajAWXuGEjNm0OfgWTxJy/V57urAQaeStsQdTIGLjURqpHoiYnv7sz
	cQ
X-Google-Smtp-Source: AGHT+IEz3P0iXAib7Z2cGOdrMtRf7H0zrT15bfpF3CfQuDRY7RsUzDg9OOFcPbi3DmNBqyD6LTgZxg==
X-Received: by 2002:a17:902:cec3:b0:268:1034:ac8b with SMTP id d9443c01a7336-2951a405331mr24147385ad.26.1761877090372;
        Thu, 30 Oct 2025 19:18:10 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952699d9f1sm4060325ad.87.2025.10.30.19.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 19:18:09 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 10DE54209E4A; Fri, 31 Oct 2025 09:18:06 +0700 (WIB)
Date: Fri, 31 Oct 2025 09:18:06 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>,
	Linux BPF <bpf@vger.kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Subject: Re: [PATCH net-next] net: Reorganize networking documentation toctree
Message-ID: <aQQcXjetZJoL8Oy4@archie.me>
References: <20251028113923.41932-2-bagasdotme@gmail.com>
 <20251030175018.01eda2a5@kernel.org>
 <aQQM0Likqs1RFNQ1@archie.me>
 <20251030182251.60e01849@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BXvm9uCYqYGRGsTM"
Content-Disposition: inline
In-Reply-To: <20251030182251.60e01849@kernel.org>


--BXvm9uCYqYGRGsTM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 06:22:51PM -0700, Jakub Kicinski wrote:
> On Fri, 31 Oct 2025 08:11:44 +0700 Bagas Sanjaya wrote:
> > On Thu, Oct 30, 2025 at 05:50:18PM -0700, Jakub Kicinski wrote:
> > > On Tue, 28 Oct 2025 18:39:24 +0700 Bagas Sanjaya wrote: =20
> > > > Current netdev docs has one large, unorganized toctree that makes
> > > > finding relevant docs harder like a needle in a haystack. Split the
> > > > toctree into four categories: networking core; protocols; devices; =
and
> > > > assorted miscellaneous.
> > > >=20
> > > > While at it, also sort the toctree entries and reduce toctree depth=
=2E =20
> > >=20
> > > Looking at the outcome -- I'm not sure we're achieving sufficient
> > > categorization here. It's a hard problem to group these things.
> > > What ends up under Networking devices and Miscellaneous seems
> > > pretty random. Bunch of the entries under there should be in protocols
> > > or core. And at the end of the day if we don't have a very intuitive
> > > categorization the reader has to search anyway. So no point.. =20
> >=20
> > Do you have any categorization suggestions then?
>=20
> No.

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--BXvm9uCYqYGRGsTM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaQQcVwAKCRD2uYlJVVFO
o+zbAP0fBuQ0lT/TbMuaV0+mS7JJ3Wnvl0OIvrBazmA/rcVQfgD+ILTIpGeEuT/n
oVmkefA17coMJv4DSK7ZhwR81/aqywU=
=XtrN
-----END PGP SIGNATURE-----

--BXvm9uCYqYGRGsTM--
