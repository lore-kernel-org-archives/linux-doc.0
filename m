Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD0C30C358
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 07:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761721991; cv=none; b=EKyPoEaN8CXhWTZdj0jjeQRrIkvkagjkLCYFB3PbNc07IB6q+4bZr3J+cEnK9A+lXcyx/fuWr58lSgus8rLMIcgZPiqJeLtI3EiqmRll7IO6N/+AP5DrQYbdSc1Sm8/yafViTxZkjnfHLPmEPLwameI1I0Uh42+WLqNmgyciRJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761721991; c=relaxed/simple;
	bh=2kyOxJJWwjPVbI6PfmUjNp+QaO4Rel2HqvBjPB08TAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FERr8XAQuFenENXsVjSZmk0Aa4ZOAbW6lFbqzQbaEMNUoD3Wi09sZplJZBeIcJ4OgvljRHs7cYfGIQSgx9lLhnUPTnJTWaILk4XapcqgjL+TfchvwaFJuX/I7ct8m4m40bs/vaAz5p3NJaU0Y2X7lNsmQQJYLRk8J/w6G/uJg9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cE8pU5fB; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cE8pU5fB"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47721293fd3so1417305e9.1
        for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 00:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761721988; x=1762326788; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CrkuTRXdhrUwPkZ8oJK1F0pLoaivBeR5il7sP7DvySs=;
        b=cE8pU5fBLqAs4RdUskJYqkWQwXrYJjCX3bhDdw5/ZAGrvFnjOZCfi2g+vgtpJmMmAS
         K6I2aG/NaMoN32lmfhftEshgnVuPIE/zmBQ13Uz0eMj0ZAj0r18Gi0sayHn6/KlKkP0n
         /n2ec+YVrIExVgDfEqNsAq7NFZLQ0nyqTuKzg3KNtSIlf+drAEMzYUT0GmW1JXZ5c+ii
         OMe281AnOSEpIprYCP3dN4/rKqkPihSX1fu3ujtQbeWg4dgtYVsmMiHWAYBzEVEGZWUZ
         +wt5W3iCKRXwees3gQI1HVB/O0Z71wkkSlvGGEcrQ48Df3l96ggwvruNe0/wl6gOQBiC
         Cy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761721988; x=1762326788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CrkuTRXdhrUwPkZ8oJK1F0pLoaivBeR5il7sP7DvySs=;
        b=u2cwCqlqm4aO9CDSfg/SCfGLmTtmUaKePxxHoMrk8DLUTLS0DojvzlBw6+Qy/EHp9k
         xhSml9E0kHGM3CeuzM1/z+95o3i9tKMkmlPzzkwJvV6BLUTFEgDfU0DYj53pr6C/dn82
         TJPs7srWVMzRR9cdem7gapd+0iTnf0TGA7s/nbXjzO3vhLVHAxOOBSIqs+VAFRGJjHGG
         4ZEQYwQ3ekwvbkiWzkfbbdnZry0WNWPv6pcoZIqx+Mb3uJpP/nSWBGN6p37LYkhaqkVM
         9QjANqWZ1iaEyb3fXDNFDBlgDQGxPA7yZrlOhI6f6V3GVI+VF4LzV8cQED0RgVqm+PTs
         KatQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCUmn8GfWbGw7zZJFLXZDtHyxUHQy+mBCCpxmMIDDsaGEuQ6Hu4ij4dvxBpz1CdK3sdq/2OQZip3I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB2MMJ6+P0W3KcEX1tXzdc8xe0kTxhcyuFgEcNZcoEZHSnCflK
	XL5z37y1HlYYasuMY4nOF7ePUUFlG5oJuCLLOfMkbRbJlM02LOQudRPr
X-Gm-Gg: ASbGncue0YXKi5jb3y+gSH9+w7gbTrfeIsTncYsgGjJgwqvJTd87G6zQLm0JURP464k
	EB/3NybmDMF9kUILD8SMZTfjzhHdro4GLH/DWkSk4d8djKBz3hrKc2rF1wnSg6DaKoPclgf4gJ1
	W/MPK7VJOFSaU4nj3jZYwFWghO3pv8ofTOfZ4HvN8YQbGHgDSQwLlcRSaxHcw24K2AZ23/mKAQ3
	W7JpsPjJdGBV1jWo5upbgi+IQkj5reOhuYrGbrGhMHEBdQPHBq4W3nQYAKd3Igaqu2OASQpsaxm
	7aHb5rfSHbBRcSmKGnnWY2FbDJU7k++mbZ5VH3m2USaLK3V/cUvyCpFh4mUolTS2lwtthOS8flh
	4U9HMdZWSLh5cv5nfzf9+4kABjBRqYzVNqzuU39fbXFjkeDhv6pGlnOg8XdgvleOzxQbvRXG0+0
	iOx7eyEdE3B4c=
X-Google-Smtp-Source: AGHT+IGEGOsE2OrnbbcDCdmAgcn7mj3aZWx7j5UssiM3k3nBBvBv+aa77XTfyn5OWYHEU6eg94BWQQ==
X-Received: by 2002:a05:600c:534f:b0:477:e8c:923a with SMTP id 5b1f17b1804b1-4771813941emr35517865e9.8.1761721988174;
        Wed, 29 Oct 2025 00:13:08 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771906af34sm36243085e9.14.2025.10.29.00.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 00:13:07 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 37B954206925; Wed, 29 Oct 2025 14:13:00 +0700 (WIB)
Date: Wed, 29 Oct 2025 14:12:59 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: Breno Leitao <leitao@debian.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH net-next] Doucmentation: netconsole: Separate literal
 code blocks for full netcat command name versions
Message-ID: <aQG-exiysk7_oX_c@archie.me>
References: <20251029015940.10350-1-bagasdotme@gmail.com>
 <4521c29e-e6c3-4d9b-bbce-8ada0dd2065c@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mYZiC5WpAgVKy3eC"
Content-Disposition: inline
In-Reply-To: <4521c29e-e6c3-4d9b-bbce-8ada0dd2065c@infradead.org>


--mYZiC5WpAgVKy3eC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 09:58:07PM -0700, Randy Dunlap wrote:
>=20
> (typo in Subject: "Doucmentation")
>=20
> On 10/28/25 6:59 PM, Bagas Sanjaya wrote:
> > Both full and short (abbreviated) command name versions of netcat
> > example are combined in single literal code block due to 'or::'
> > paragraph being indented. Unindent it to separate the versions.
>=20
>             being indented one more space than the preceding
> 	    paragraph (before the command example).

Thanks for the wording suggestion! I'll apply it in v2.

--=20
An old man doll... just what I always wanted! - Clara

--mYZiC5WpAgVKy3eC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaQG+dgAKCRD2uYlJVVFO
o054AQD43ZwtXso0ovYwZpCUIfBKSjxyG6/LhxxzQMEwtIJDigD/cgyISKbGmv37
2eNL99Mpl+HBiBw/qLw7pZhWoPi9Kww=
=KvAw
-----END PGP SIGNATURE-----

--mYZiC5WpAgVKy3eC--
