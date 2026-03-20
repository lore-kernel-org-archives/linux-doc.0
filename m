Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B895940DFA2
	for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 00:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773965200; cv=none; b=cXBjiUTUAGxvgcu5h4nPh1ID8BFRMmeQVKTwAjdzzShuVcpbSYfBS2ZvFAjugZCvsJl8coIhwmO9tqebBfqBKnmmJXH94eOiWbeS4Z6tknK1RrB/u1sZ7cfMnNMD2+7sBwNERc9jVnbpUJ2D1+Nno96DC6xQZMCT+SYZLYN7mgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773965200; c=relaxed/simple;
	bh=fqsNbSn1vkUgkLA7W4HRsglbBk3L092lZP5y40GjB54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QEOzJkkvOCrYReunp1skMs/ApGi3Ia/PyjAHtds5xz8cSzJf6w271aI/DvAKXA9Gvh4PKCrVOA9ZxF33Ss2AGVQQjko0qbx/XxYFc/4NoqUZPWZObFvXvfwOBRtKIGJbF5yH9NpfbcdxuhXnSjni1POJ6mX6K9i/6hyjmD5I1wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGugY9TB; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGugY9TB"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2aaf59c4f7cso6878125ad.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 17:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773965199; x=1774569999; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fqsNbSn1vkUgkLA7W4HRsglbBk3L092lZP5y40GjB54=;
        b=XGugY9TB7ik+A/6TFUhbEHPliyUnq8ypdQe8nrYoW3xYnxtd6nguMtoYGetziOSgaM
         iju+qXQeMH6VACtiGisVkxmw4PoZiqs035M4nFaL+rUHj1ULy6p/mTGggAnQv1lHUGQp
         K+yByIZsx2AMc008MlkLr3b1tY3QaHXPy5Np39NQmfs9Ck+HdKhYpMb/rwEL4d/Glp/u
         ig7cWzUZ2RLhlNpvBJkJluBa8W3lZh1dP2rfCQ7FtspqFNVYJCWtvxJMbILqnGEKDeh1
         rLHQTUNGjhTxTMHy4pvheGJ+5Splfl2a+4BXX6Tr3ftG/Cuc7dwpnWUEEOmyg7lW0Xrc
         SItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773965199; x=1774569999;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqsNbSn1vkUgkLA7W4HRsglbBk3L092lZP5y40GjB54=;
        b=it7tzxXXGpRFqKxsf9DRaEhmFD5fxbOwo0ApIHEbuVMSDBKFDHf3BEr+H4F7xTPAID
         S4QHrlFTroMDyDs+vAGxa0al/623rFjRrLi+lL49m4THV/1fyUqxegx+mx5v0oFnSNqW
         VI/W6fRHzRyV7Rtnt60P0lXzpZnxI6SGYmXPB+7Q/Uf2IbUWjQkZXIIi2j00ayORbxNB
         h7j5r8wMUbVjbAnYsMQerZtPc8rB8B1mhACgxMQhx+70YCtpGFo/iYDeZKif9noii4oC
         GTZHjSpeWnxMuTCqtc4qmtuA91JDlD0K1/DyWj+jfffXhMlAwni8UdwITNPKxCE3x491
         pzyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW60kbQszT+o/5Z+1bN+28MBeHoB4g1eSsQos9PFnYLjq+blDnBwBAxVsvrRA7QIUODZExVXX7f/OQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeuCTgqgt7jUDCY1qekjvX+gdANAprg6Ejg+n7xPOCD5j/qy9v
	Mkdf+NEN7guonZp0xNqg+skwPff3vagGW4MEyHfAw5ouaEIujGIhiSreOmRimU6I
X-Gm-Gg: ATEYQzxEVAlrhBoANEg3sQbBK3z/WyddxwAo1Pii2byZ8AUHiZY9leFnV7ssXIC3i4m
	4QKQWPtieU3u4/WGZ+CMPI3AfMou6ihwwMLnCtn4sD5u0tGnp22/t94A02jqPVAZ54C0FcqIxx2
	GjoZzJhr588Q1AsSjqtLnF5BkgIIsWhnT0zw3Er5rn+YWS2E17deMKcKwFXjG8CpsR4OkhNvD/V
	y+7UYBxYkKl9RSVy6rB2QbecGYhr9esUtHj0J/zv9cD1H7EJhlcbNCFmWgyslFPxFDktlltrQ0K
	6fkSECD/Duzz4pDycQxcgFQm6S9sB+vb1Y0202H/uElknO1cj+fQOTA7A7NDAv4RbrInBSVBppS
	KfBoki05ua10OVWfoAtkXo4oJbujaDJ8oYmZ1ZvHLoakXu3hQTn5+eQlwGQ5zeWTa2+Oj379GxT
	nhcLchshgVa/sw3Vn/OaOlrh5/obQ7MA==
X-Received: by 2002:a17:903:2284:b0:2ae:a45b:42f7 with SMTP id d9443c01a7336-2b0827a4c3dmr9865275ad.36.1773965198958;
        Thu, 19 Mar 2026 17:06:38 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c56bsm3880485ad.57.2026.03.19.17.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 17:06:37 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 7C249420BAC8; Fri, 20 Mar 2026 07:06:34 +0700 (WIB)
Date: Fri, 20 Mar 2026 07:06:34 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: Invalid link generation for equations
Message-ID: <abyPiqMmw4BbB6eq@archie.me>
References: <9b320e77-9acf-4f0d-8c52-6e1fc3a8cf53@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1MQiTQnGEmAcnTfI"
Content-Disposition: inline
In-Reply-To: <9b320e77-9acf-4f0d-8c52-6e1fc3a8cf53@arm.com>


--1MQiTQnGEmAcnTfI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 01:56:24PM +0100, Kevin Brodsky wrote:
> Hi,
>=20
> I have noticed that links to equation images are not generated correctly
> on docs.kernel.org. For instance, Documentation/mm/memory-model.rst has:
>=20
> =C2=A0 =C2=A0 .. math::
> =C2=A0 =C2=A0=C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0NR\_MEM\_SECTIONS =3D 2 ^ {(MAX\_PHYSMEM\_BITS=
 - SECTION\_SIZE\_BITS)}

I think we can just get rid of the math markup, no?

--=20
An old man doll... just what I always wanted! - Clara

--1MQiTQnGEmAcnTfI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCabyPhgAKCRD2uYlJVVFO
o2c5AP4vnbdQq0PlIl7wBofiCS9+Eq0Smfur3EFIktC0eg98egD/Q1bbUCJUTtQO
bCN5+5gF0FYkZnB3b9QfzTGAst4/vQY=
=Vxa5
-----END PGP SIGNATURE-----

--1MQiTQnGEmAcnTfI--
