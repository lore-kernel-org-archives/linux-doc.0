Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3271DD9AC
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 00:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761006104; cv=none; b=pOenXVL180yiVgaQ7fG2FwFkmkrVgC+V17by6YGaeHYbbt4Ux4sAffJjZDr+2xtjKut5FdVgJ+B0QFvYcrwhuAAqI/pguSgNFOUgYDQ4cj42gqSylEuekdMjaJ6mD0iOEehSCUf742KT+fo9sm7bwg1nZzbSrx002PyNhuZh/U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761006104; c=relaxed/simple;
	bh=yjHPLVgEdW5sJWrbNXJ3MIoDYB+QxWa40YMfzuMRRyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K8Sjvu1kv+N7Y6Vmb+C2DeRRDgPNu7PW2GaRR52s9YyHkp9hjySgVbx8n24wN5azA1QVBnOd2IXGz1RJbC2PYMtkIahBqnyYiTWxJBrivWiNfrGECnKQMXkM6kBso4YWRyxXxbtjIv3tNlSNkoi795jUE45pvbma3HnWDLHS5Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDWeEZLk; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDWeEZLk"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-79af647cef2so4203770b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 17:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761006102; x=1761610902; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yjHPLVgEdW5sJWrbNXJ3MIoDYB+QxWa40YMfzuMRRyA=;
        b=BDWeEZLkSVwrdkmTnB91g6L1OqHF2LRA2AkMW0JV1/t0JTYUj5gsF/tLeKeKn57zAf
         njFHX/hr6Ugh2dJkHDfs3oELaH/w3K/RMD7LCFGgd6WVSU19QaoTHUUSIEka2k6Az1cG
         H1sV6LQ/mf6QKbHQxGKPqyLs66BS/doVGya0w0BE2I3kXP36Zv57imLE29copPk/BPnO
         0VPA+YjiMJClAsKCeczgjVadZ7kpVVxeoKhQiC4D24Uxckp9xRHNOvnezU+h9IW5jD1X
         YnJ0jI8qIucmQ9+ZhBQ3STD8JrEeuoODg2Ytnrt8wKYXck9gI8EpurDrFGWNbFoQ62a7
         cd+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761006102; x=1761610902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjHPLVgEdW5sJWrbNXJ3MIoDYB+QxWa40YMfzuMRRyA=;
        b=uwMqdnIAtbHneSS8VVWF9XheJnDAH5G8IHxikoz/vkDl/0lx05RWl+aGVdY/xTac2d
         KwViODRS7Iar8Oc5f1sqBxtxUPUErDKUeTGOtayRn44+KQIS8r045YlchsqQnd2mIVw/
         jOMqk7nXW8qu8v5yFiopRKKhwX3+1ijgJIRFhUFQK3LIBvZyP9vaF3YynQOSetezR6/b
         QxyhLjpxzSXOmy/i3ppAfBhx6lZMzpziRGSjoD7QbWewwUs4ybKuy14lGODKMKGm8NWk
         M2KGgqazwfix+RT/OgfGjGO30koYzCSMA+++tJxKFP8g4z80s/OEtU3FeyLNb2slTtcR
         wdqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVob7X2DZqAOcs/UWKuoVuwXLUZExHr7p+WfungkpCqTnUcpLXeJpd3bD7Pb9rYsxr6fcs8PBmGhjU=@vger.kernel.org
X-Gm-Message-State: AOJu0YygvpuVHTMv3YOgoDSBdkuVItjLmrgVmvDXRv7EDP5Larh1dflf
	uWd4S5ExRfwLaxIbAhcKnPwHOmQRdlHsWpX0DTN3CKMTPGGjrqz7kW44
X-Gm-Gg: ASbGncv5LALnjIIWzUFquVmdRwzON6X+Fhmxsiy3vrkU6XzkXWR3ZtCN2O8R3dBKav1
	TmCDJ8iptu/rWj/zErVFta+MqNlqpiAJjmM7G4nrqxgEgh8rRZKmiNWIdRwKCW3x/GzHjUi8X8o
	DzC01iLzYvk3/u9rvoDVFMaxgdNtF9HPNRExlQwHmRj8Kk2ah8/WEtT8DgBkpxFEv8AOanrbYoL
	YtLbj7ftq6rNXZvBRg2d91HZnUI3WOGLWGqhZnfhxxqW1HW3E8UnyMQK2X6ENRAdKBIzL01eV//
	bgi+xy7jCOWVDM+p0zIKDDqJoxcBCK2e6JA/bRft72OLfikzdZk4AWkukzYTnS0GWSu7rPIH19f
	yQpyXSfIyehddHuZSTSV+hfuRvNj0VRR/IQM4RMj+yJnZfWANRPf34YScVNSK0aOhE4KfJlIwNn
	A/6aQ=
X-Google-Smtp-Source: AGHT+IGbji5PS2wR9+wnyLjXP7fZ55l75L4OjmPE1c9z6DFc+64aTfHdBaYLcLRVmf1fSi0fYoMixA==
X-Received: by 2002:a05:6a21:7914:b0:334:bec2:5b63 with SMTP id adf61e73a8af0-334bec25e36mr9854338637.24.1761006101915;
        Mon, 20 Oct 2025 17:21:41 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f251fsm9453888b3a.39.2025.10.20.17.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 17:21:40 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 676F2412B0A6; Tue, 21 Oct 2025 07:21:38 +0700 (WIB)
Date: Tue, 21 Oct 2025 07:21:38 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>,
	Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>,
	Sean Tranchetti <sean.tranchetti@oss.qualcomm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH net-next] net: rmnet: Use section heading for packet
 format subsections
Message-ID: <aPbSErGuC_FZPCvf@archie.me>
References: <20251016092552.27053-1-bagasdotme@gmail.com>
 <20251020171629.0c2c5f5e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LjzbLi24OC08S6O0"
Content-Disposition: inline
In-Reply-To: <20251020171629.0c2c5f5e@kernel.org>


--LjzbLi24OC08S6O0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 05:16:29PM -0700, Jakub Kicinski wrote:
> On Thu, 16 Oct 2025 16:25:52 +0700 Bagas Sanjaya wrote:
> > -a. MAP packet v1 (data / control)
> > +A. MAP packet v1 (data / control)
> > +---------------------------------
>=20
> Why capitalize the "A" here? it could have stayed the way it was, IMO
> lowercase is actually more common and (at least my) Sphinx doesn't seem
> to detect this leading letter as in any way special.

I follow Simon's suggestion in packet formatting patch [1].

Thanks.

[1]: https://lore.kernel.org/linux-doc/aO_MefPIlQQrCU3j@horms.kernel.org/

--=20
An old man doll... just what I always wanted! - Clara

--LjzbLi24OC08S6O0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaPbSEgAKCRD2uYlJVVFO
oz1JAP92OJiXU9/4Buy/9Zrw/pTqhdMb4tVYDi+526Un+p3DxgEA7ksgvqYHKaNm
qY32OXGc7Yp4NPYMuQ7KKxncy36TdwE=
=Utyd
-----END PGP SIGNATURE-----

--LjzbLi24OC08S6O0--
