Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648580;
	b=YHypw9qK6L8dreYsErv4wRcMPkz8thazEzYNC2YDivOeeKu4jEE156prS09CBEhJf/1O
	 3Eee89KNO/HToJa0YDIp+R2TqpTrPJUTboR+a8YHT9gAlEJLRcpJx+Q7/vYj/XICx6sXc
	 v06+xwUVgKQJlfCwvdGROgcChHOXsadL39XkCRxoiSH/WO7nwPOp/6z33lVDKn8S78T5X
	 mPz5EG5DLnrj+dOJ9YGMSIaeMyNBSJUuwemC01qrdcLZoL0VTSeXdsW69Nqpvdg9/qdyn
	 nU6zW2CEWzF2RHT23/WUs1T4UQ24BwOlfr2EBpWqx4af0wj1UFhAKcWPOmcVioPEIZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=E8vKd1x4175mc7dp2xB6lAEMhr1F0E2ODkggdlQIUIE=;
	b=Sbp/oOJ9jCuwntzoP3n+Fy3fZ+B+JK1QLy/93ZPbh55qMCFRd6IAIKyqm/BARqNtyHCp
	 IHlCUTIXA3asTljyEcUaH7vElRUiUSfsY+Yu+y6iDuvH1h/BxgRlrHSAwDtT6b7vLbrGg
	 JUq8jG3vM2GWvbh33pNzlaINFMDiixtbAuMtGHQCha0i5L9zdn2B8Bnoez4Kn+uilVXJr
	 RyLHkdaQOeFdpH5nk0k6Pr+dhIjwoPIhzt0lcvd/5jXaG8dUxRmdgz5Z2Q86p2rePXtUd
	 x+evlXdY38d6h/0HrzSMufveMAsSOMD77nSgCoG3KlZcKkWroIL4zAztg5EnzOj9GxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jKVIZ7Dv;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB1D606A326
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 23:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AB1D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jKVIZ7Dv
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b413d04c93so3750872a91.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 15:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648579; x=1796253379; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E8vKd1x4175mc7dp2xB6lAEMhr1F0E2ODkggdlQIUIE=;
        b=jKVIZ7DvKZtbXaP2DWsG09+5JZ3RgD/mzAYzNjFfghXqE8SLLfTjgQVYyBObvfZCIE
         u46RPFKr8glGu10TadtWqkJSA+3yPwR6nZ7qoJY3i9sH2LNi4yvOq2SMZBS3h3J46CnL
         CkVwe0jjwltsnc7kUiZHEkusvRGEg86aCCiucpp/NAxej67F4qRP4AsCDV7CrqXlEadi
         I4ZJvss+NMW9r2Tp3r17lk6RoXBeo6dA/zcXSL3qyGEfzRDD6F/xUfn7zmYoNLHFv+0F
         D1ZFxvU3E62+cAleVRJ/ZhJhKRi3GTUlH8P58M9GUwU9apVhS2soKP335BgzHyB97ApV
         bMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648579; x=1796253379;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E8vKd1x4175mc7dp2xB6lAEMhr1F0E2ODkggdlQIUIE=;
        b=muvzKSR43FTl3b/tb0A8zTMmVbaXyHEzJQ+aCcS4DcFG/h801wmXnAAgx4Xk6E22Mm
         1ElRjWArfLvHc6Q8505YfEE0RGaBmSf4ER8MQYvdIy/P8BNj3derxFWu7nePNfsoMkrJ
         wJIXDxR9FzG7MviNyoTI8a2SDd6wdTLQp8+pUocu3eBVkFH9a0iNoVMtF4juYxm08gtV
         5XQFTBr7wmgHjs43K6izUjfSVqL+ChF+JSwEHdbuO9gohIuZnETl1RaE3W6b48YNMp+5
         Kuc0uRSzdjEPY2p2xfzEETNlp/ieZlUN67Mlb0vvrwy8YPROy6YGByzN0RpJgsfgTJL1
         2vQQ==
X-Forwarded-Encrypted: i=1; AL+hErEoLbFH1mUp7T1/cT5sXpEolXjGab2r1YMRwLlhry9gWKuz2N8s2fdbcjNYEDNwg6wYnIeGvoG8Fsg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tS4d+O3aNSUtiiE8qHarVB3OUneEmnmB8oJRtw8ohooEBHtgu
	e637DvprIEUJl21JRtQ5rFHg3UdfWBCZIuaoZ5Y1C4qI2AzllfJKGCS0
X-Gm-Gg: AZFdTZdEfO2WJsS8BZeGvQdKhvkKWX8n6K9ldnuY3HzoDw+EE1No153O8YoNVjy02Iy
	CLgTAEvSmVtqrkW97PjChnKaEtupUVuRMOTHayqkajfGh9+R6JFpvNXgo5d7vgIfkn47rxGILpd
	lzgXKzG1qgTjTNbh9VYHWrISaPOX78AVblN56z+AFQFbqOmA9ExoEl2rcmSMv1sdeLHV/STweHA
	ljROTt+fRsU5gmVexWMIMO7uSwn9vzsM/l28VaJCr0xY4srDW1RMs/23RQu2YKWBsYI96Fk9YHr
	qDirZq/Kl+t4MQPqsuNRbNjkDYzcbFQk7ivxCNe9SxF59z5p5zP32/xI1rH3qX8jY9SVg1tApln
	l4Mypkk847TxuLVuAnTcVjpjHAgD3le8zlxxpZATF/OxCtSpMsk9+rCWW+ByGosra7NiiybxtTB
	lTuUxlaxhGYqgUh2SvSEl1lHDwxsKW5JYkIDk9RWHi3xwXGIfTUAhv8lyOq5JqlkaF1//mdWHPa
	qZJidBzRzDrsCJBId2mjSytW+BAq9ms5FxUJcmuWL654fXb+tW9m8ZtGaxXf6IroRD/9YqySIsl
	WCF2iBW/DX2huGdkl7/kSkZ266o=
X-Received: by 2002:a17:90b:2e49:b0:3b4:625:3d2f with SMTP id 98e67ed59e1d1-3b41cb212bfmr17680989a91.55.1795648579180;
        Wed, 25 Nov 2026 15:16:19 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41aab4729sm29282158a91.0.2026.11.25.15.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:16:18 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 5F6F6420A76D; Thu, 26 Nov 2026 06:16:14 +0700 (WIB)
Date: Thu, 26 Nov 2026 06:16:14 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Willy Tarreau <w@1wt.eu>, Jonathan Corbet <corbet@lwn.net>
Cc: skhan@linuxfoundation.org, Randy Dunlap <rdunlap@infradead.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	gregkh@linuxfoundation.org, Johan Hovold <johan@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v2 06/14] docs: security-bugs: do not send archives or
 binary attachments
Message-ID: <awdsPgHF6Y0xuSQI@archie.me>
References: <20261114190014.17826-1-w@1wt.eu>
 <20261114190014.17826-7-w@1wt.eu>
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
	protocol="application/pgp-signature"; boundary="Yd+Dybq0Bn8RY/CL"
Content-Disposition: inline
In-Reply-To: <20261114190014.17826-7-w@1wt.eu>

--Yd+Dybq0Bn8RY/CL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 08:00:06PM +0100, Willy Tarreau wrote:
>  Please send **plain text** emails without attachments where possible.
>  It is much harder to have a context-quoted discussion about a complex
> -issue if all the details are hidden away in attachments.  Think of it li=
ke a
> +issue if all the details are hidden away in attachments. Archives (zip, =
tar,
> +etc.), binary files and documents (PDF, etc.) are never acceptable: when=
 a
> +reproducer is too large to be placed in the message, attach its source f=
iles
> +as plain text, and provide scripts that generate the required files (e.g=
=2E file
> +system images) instead of the files themselves. Think of it like a
>  :doc:`regular patch submission <../process/submitting-patches>`
>  (even if you don't have a patch yet): describe the problem and impact, a=
nd
>  list reproduction steps, all in plain text, then provide a proposed fix =
as

What if the issue can only be reproduced with specific binary files? Should=
 I
send it as e.g. ASCII-armored, OpenPGP-encrypted attachment or should I put
it somewhere else on the Internet (as privately-accessed file) and share its
link instead?

Confused...

--=20
An old man doll... just what I always wanted! - Clara

--Yd+Dybq0Bn8RY/CL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCawdsPgAKCRD2uYlJVVFO
o5lbAQCf+HFr4dpqHo/NjE5YZQjZhBumSvZxjxGVy4Bc+rJ6OwD/dQ9wDciflsw8
W5Gcx2EYKEBwUYE42WbwBHghakXKQQc=
=0aJI
-----END PGP SIGNATURE-----

--Yd+Dybq0Bn8RY/CL--
