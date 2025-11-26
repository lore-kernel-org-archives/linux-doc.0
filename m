Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23621E5734
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 00:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764117008; cv=none; b=f7smSMxJdIqT+E/O2hmfFGWbQrx2ncUNtGtmZBWMkrl6NNB9ZPuY4Q3WcM9HSSsSfGO3fT/+OKhe5T0mbS1C7qwC7NbpoYpvqTeiBOHVbogQfxfQfOi20gozwF0okk+6873L+B1YJ3+1CXTSwCn7ToTCV+68hq1uuB4ZaHFUfw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764117008; c=relaxed/simple;
	bh=+7pgfRjo/daR/nWjZbzX/uZO08iJE3h0AwCxM47eCS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g0wURAaaNJR6hh+M3f/p0b5j+KCXeQ2pc5f7mf3JXpM457k4q2YzGMqB72vbYnvzuKmoPP3w5W4HpXuHdQJziEd1pwSPn1JOkKBWLuGT/Mt9v/bM+3Fbf+0zsx6bRZguMz/kohKWsbd6681hvP/WzcalmRQVe9z4yJQuDk/EZII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwamRu5s; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwamRu5s"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso7062002b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 16:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764117005; x=1764721805; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TQMjuKPHzUNhfDB/BTLq+fTDXNip/wwiVzkgCrUswNY=;
        b=VwamRu5scCwBUWz9WyCwemooMsOX3LyoCXEk4k4S4cQz6czo6mlzblsCC5ke5LkVQz
         9nhWPgF9YTBR93kBUD8/wKHuVC4YYrXrMRfmuGJQE+UAmwffula7JAChCIWYlMJKaAMK
         8IpXLpqBZATHqs7NvhN6hzM9OId92KG66j+Veofvn0GWjLB+Ir034DvR7WDtZ2Fdua7E
         P/VKd6VCJucQM76vaFNghQkgcmEzFjqUjYS++WtcX+I4XRGU4RDbJCAbmMQyTsci1QO8
         qYAVb7l43B7vaFhr0WlI/GIcLiQSDkh7FH6AeAagpRf91xYM1dV04CLKximUj3EgbsGU
         IHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764117005; x=1764721805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TQMjuKPHzUNhfDB/BTLq+fTDXNip/wwiVzkgCrUswNY=;
        b=feFVNfZifOEWPzpSPrW5/Y//92s2a2nJzPKc+sVYzNd2gKhxm+Q8ycVqgB4sYADEta
         AD8MN5yvJKoliPVt2C9sqK79G4OsXPIXBBw92/tyRJDQESC7HEdVBCvXwQTmoJBf1UPd
         4J/FefEyAt2BiqSvp2aV51mohHV9HguWW3czdsHVqUGCiVmJ8K6tpgLHH7n8CaE4KM1I
         ZGwr7LUoJz660F+YXY/KldQ/qlSwjGLz2Tu+9Iv9Yi/OQdSQnAO1vUnKSYACmB7VH+kn
         C7Fl/QXhDVYyE0XWpFtf0iSOYA2nOaRS7myzoD3CHkjsIkHjiZPjRe4sh1sJKkwgYWz6
         qwLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLDVTxZNzG40bem40Lyo6oDtjk+SJBnaSvSlTZsJNZxSXV8bQsbdsJSAOgvlsHGGcOivco4QDCYNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcrl8bAoc72/2EK+mX6iwUO265V7tjtIfoIBZKbMHsIqn6BcLt
	5FfvdeDYLs0kUy0JnlAMDRINSjuuoI63SdsC7jg7GAomCANUHIrSN+Pg
X-Gm-Gg: ASbGncuqKHpc9Saa3u8PUT78hwIS5P/SdTnsDHNWM+gK+4Tx0ioRj2pLw/WiQvL1Mmd
	2QT7IW+/y75LFz9VW5iyNzvwstglbr5HzwG5CCsRpuS+XjZKAo27npJPwyxwV+IDXucNKQTXsGl
	C1RrxEqmf0nR6evhgW3WgYtj39fIol5twHE55m9XBkhEF560hZUk/opfzMN/BzzAB19dJodHG/q
	J46xkSHLNvlwINu4SV8wCyyzdPyaSI/KUurRUix1HYw2SCagy0tgXhiAM0VCQhf8pgYo+KPyZMq
	psCOlW33TgZdFHpO7R/iS2LOZ01hY2xyrEI1aG1HQc8bpr02CALy1ljqpKKAAVxtNGKZT/oQb51
	QLrxGDjCIJjsIF2QvjAU8j2/m8CcM6z2hU7oHzdFWsRUaEWnjv+0ODIWq5qw+yxZojcE0/ysAC0
	U4I6YqdD/ACss1zMPa9OJgCw==
X-Google-Smtp-Source: AGHT+IFlzBzMU6uRJEoPA/DtA6ralWIDq9xCWcLTBXEwpgMrSQIUxDFPucCWFcH95f/neuSSWsnHWg==
X-Received: by 2002:a05:6a00:1490:b0:7a2:7f1e:f2dd with SMTP id d2e1a72fcca58-7c58c7a69a5mr14956775b3a.11.1764117004888;
        Tue, 25 Nov 2025 16:30:04 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0d55b71sm19503922b3a.55.2025.11.25.16.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 16:30:03 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id DAF2F420A78D; Wed, 26 Nov 2025 07:30:01 +0700 (WIB)
Date: Wed, 26 Nov 2025 07:30:01 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Tariq Toukan <tariqt@nvidia.com>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>
Cc: Jonathan Corbet <corbet@lwn.net>, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mark Bloch <mbloch@nvidia.com>, Gal Pressman <gal@nvidia.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shahar Shitrit <shshitrit@nvidia.com>
Subject: Re: [PATCH net-next] docs: tls: Enhance TLS resync async process
 documentation
Message-ID: <aSZKCZkUnllzyydN@archie.me>
References: <1764054037-1307522-1-git-send-email-tariqt@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Uhx3q5Xis8IAS4gY"
Content-Disposition: inline
In-Reply-To: <1764054037-1307522-1-git-send-email-tariqt@nvidia.com>


--Uhx3q5Xis8IAS4gY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 09:00:37AM +0200, Tariq Toukan wrote:
> +When the kernel processes an RX segment that begins a new TLS record, it
> +examines the current status of the asynchronous resynchronization reques=
t.
> +- If the device is still waiting to provide its guessed TCP sequence num=
ber
> +  (the async state), the kernel records the sequence number of this segm=
ent
> +  so that it can later be compared once the device's guess becomes avail=
able.
> +- If the device has already submitted its guessed sequence number (the n=
on-async
> +  state), the kernel now tries to match that guess against the sequence =
numbers
> +  of all TLS record headers that have been logged since the resync reque=
st
> +  started.
> +

You need to separate the status list:

---- >8 ----
diff --git a/Documentation/networking/tls-offload.rst b/Documentation/netwo=
rking/tls-offload.rst
index 6d276931669979..a41d02d72e1ee6 100644
--- a/Documentation/networking/tls-offload.rst
+++ b/Documentation/networking/tls-offload.rst
@@ -338,6 +338,7 @@ Cancels any in-progress resync attempt, clearing the re=
quest state.
=20
 When the kernel processes an RX segment that begins a new TLS record, it
 examines the current status of the asynchronous resynchronization request.
+
 - If the device is still waiting to provide its guessed TCP sequence number
   (the async state), the kernel records the sequence number of this segment
   so that it can later be compared once the device's guess becomes availab=
le.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--Uhx3q5Xis8IAS4gY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaSZKBQAKCRD2uYlJVVFO
oyacAP0fN/NP544JfEy704TIpMviAVm7qketzfORZ/nMxtq97wEAjUGwXZm8f2Hk
f0XnH1RkaVFGzFchC4P1xk7c1Dv7qQ4=
=xNTM
-----END PGP SIGNATURE-----

--Uhx3q5Xis8IAS4gY--
