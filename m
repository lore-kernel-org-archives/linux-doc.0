Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E176A3B0584
	for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 08:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633174; cv=none; b=DS4T1f5mNyRpylhhvBQnCzNEKp/sHqOOdl3ikg4eXo/ZNKLHFRC4oACy/vZut8Ygy+NAahhzq9BPwjB76Sk/Fz4yIj+X+D9KYvb2PXoiFcEXQgSt3V/TeIDSs030/nD7bbUgzSc4Uz//SVCEmTOSF4I+SwwUGnYbnH8QzFSZEn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633174; c=relaxed/simple;
	bh=vihXrLriQOvLlnrPibh11AIJDiMSfGA+uFFnwcE7e8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6Xr1ScNGwxpC0+svXzYNVIfw53gRcfP0El3KJqcys7Im+CT2zhijWxTntLKD06GvicLipMh1WLgKY36sBKWfsplc+wFKIuShxV2D7D59qUW5id14QKlj95q58atG0Z28hCroaSRGfOAWGTIq5+OxkcbFqnrKN9EMncwC7Cr3yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=N13n9903; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="N13n9903"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so1381505e9.1
        for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 01:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789633167; x=1790237967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vihXrLriQOvLlnrPibh11AIJDiMSfGA+uFFnwcE7e8Y=;
        b=N13n9903cRYavQDJcy/ICxyQN69MxpRL7oCeGY1RwpPRjh1rAoalWiClS8jEy2iEWO
         pGQEQ1HxNPW78/d/1vYVNx/n/ny2tNTS6/JwKw4EcLrboBBnQXGH0w46ZU5Ac0ZdqbXk
         TMRQSXCmdV0zSUcdYqrUF60VvbvJmCCa6Ghqu/x7+UcXMBnaSIUdvLoZ7JBO8vhWFQfg
         UbY8BeztmRObBM7+0wflVma4PJXicoq92s2C7LZxaJOLZe3qgzIog87xnLOduqS/q5yR
         c7uRo+3uvrqpf5n47aaoz352hF5zOHDctWhSmgBoUn8lXwN37eI1txW5pa1bdBwAhrd+
         sxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633167; x=1790237967;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vihXrLriQOvLlnrPibh11AIJDiMSfGA+uFFnwcE7e8Y=;
        b=LUo9jLlyyJdLdi2STZv5FjWpl6a0EHXgmijWK8P4bzLfcL+Pclk6dHIidpkeSgdrOe
         yTTJ45N5Y3eMeSnq4EXHTM4hpiU25d7jyd+AJAN7U4Cos7gYSPZQnyHx23XU+vQZJbir
         HkqxaScT/wYzwEDD78ro1lhCAUIJyc02wIWJHQ/4n5Ba8bpPdLjRBOnI1FTJ8FFKvbUN
         /v1J0YDvjcEq8zaQhdDmKE/akKLGue9OZ3zj3lw7S6ET5KNXj/3TJYzu/h+qu9HjUu1m
         LSU6bpljMZcpgBulw0ee4ey1YpdZJB5HtJnbR6IsnK3/gMraHCQYl4q7K1fUXEpzooqL
         TKCg==
X-Forwarded-Encrypted: i=1; AKwUvBxE7G2/J82oy3xFiO+x7LWXrmxwuy7WnOR6UZ38UEh5otWbIWOxhyeKJpV18le71n5L0EmO2SJOSIo=@vger.kernel.org
X-Gm-Message-State: AFuF++n+TE5dAjFRAWfax8MPYZohIl7LkM5FKFrFyFrUaI+Q4VXiGKdA
	IhuTqWBC3GOxiOd+LCMYZERw5C1+bRNfO7bBzl5zSIcoJjQBSeAYMmNro+TeQqfnaOA=
X-Gm-Gg: AYBFou2Qz255G/KIOgUCphESzr6FVz93MJ+IM2yLF4RcZKGt14qCEM0OGonxF+KufE+
	LsHlEITs/4cwZub2IjXVw56/rF2cnjwwLkJtPCMFA5F5diF/7rw3xsO0ZcqA+aR6vRjz8gDvvQG
	Lg4uUiRByLt3N4CJjVcifjs6WjkIeegSFFhlU0VZE9YsdVXEuMhoHKQ33MZZ/rgTpKz68bAT46R
	j6H/g4mM+TZVCZG6ATGK2NNW26rFsQySaW/iuU0f9d1b6I3h/qV4FhR3vKXrAPfe3Q6o/QKV1Px
	ZbfRAgNRjA/78YpTBgSf0GTmuMyj6g61KeHIBsBgkt0kJSvzSFccgCKpykrx/Hr67T7FHW6dRJr
	p2O7PkJgOOZUYKMvAhULg2UltzP1cckMVNaQokRXOsBg4PXwd7SfENEEFYLx2A0NcXh2xYOSX02
	kTTPXs9uawh33y5nep7+BQxm00ioEW2yeKpQzuvZ1ovBW2j8DZ7DkN8LxacnZX9Q+NwluugCdc4
	+NnhrquK+OpT6fy2StR4Pi8ICAAyvWEj4cqzhd2sb0JrL5z6dvLCgXX94gtsw==
X-Received: by 2002:a05:600c:1d25:b0:49d:1916:2133 with SMTP id 5b1f17b1804b1-49fbd1ccc32mr42772625e9.8.1789633166769;
        Thu, 17 Sep 2026 01:19:26 -0700 (PDT)
Received: from localhost (p200300f65f19a904ca0f7403c08a2e26.dip0.t-ipconnect.de. [2003:f6:5f19:a904:ca0f:7403:c08a:2e26])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fbd24a6basm59658185e9.12.2026.09.17.01.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:19:25 -0700 (PDT)
Date: Thu, 17 Sep 2026 10:19:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dominik Brodowski <linux@dominikbrodowski.net>, 
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: pcmcia: Update location of PCMCIA_DEV_ID_MATCH_*
 constants
Message-ID: <aquiM-BdSq43WaTa@monoceros>
References: <20260917062537.112663-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qhq3bq62uv4wtksa"
Content-Disposition: inline
In-Reply-To: <20260917062537.112663-2-u.kleine-koenig@baylibre.com>


--qhq3bq62uv4wtksa
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] docs: pcmcia: Update location of PCMCIA_DEV_ID_MATCH_*
 constants
MIME-Version: 1.0

Hello,

On Thu, Sep 17, 2026 at 08:25:36AM +0200, Uwe Kleine-K=F6nig wrote:
> Recently <linux/mod_devicetable.h> was split into per-bus headers in
> commit ad428f5811bd ("mod_devicetable.h: Split into per subsystem
> headers"). Update the pcmcia documentation to refer to the new location
> of the mentioned #defines.

oops, I had the wrong branch checked out when I diagnosed this patch was
necessary.

https://lore.kernel.org/all/20260908070031.32833-1-kmehltretter@gmail.com/
is the better patch, please drop this one.

Best regards
Uwe

--qhq3bq62uv4wtksa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqrooEACgkQj4D7WH0S
/k76rggAoIgk2UF9wJTH0A/TXgFvN0TUsEzPMnlib5Npxev2fWawKm6NMPWTJTvr
dEvXyoTHoNKXeR+8XDHhk25hdrAAAGWjKu6i0US8aOXhwe+QTyuzzxPhutN9jfWu
8E1dBU9Q+abLzsaji2/0QIVHbWc5jNRCkKmkzXGZNdNZ9E4SOUz/fYc//LUJKaaJ
eTPSnuUwPt3UjOHtxtvskdO4UVvdy1zuHupqgQBXGdKuhnlg/k/1ys+AIvb14+pg
Tck8mVfkOutyVaxijF9PYS20R23rLGXwK3IcRubw3/oM9XVbMbSQbPNMGv5cLJgr
kJaUF6/0my/vE3jz6WgAp5LGgsPWpA==
=ZUpQ
-----END PGP SIGNATURE-----

--qhq3bq62uv4wtksa--
