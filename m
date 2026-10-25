Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792932496;
	b=aF0rr9DgnU2KDer4TDcrf32XgzjcYPcTf3KCM3lVSffOs7sWvIFEfP8vciTG84MVvf/p
	 qrw768g7pq9u5JsKTmvVdNc/IG6RjC1CYxsSfs6QoKEL+JTBaj7eq+HZj98tXd2ua/sYA
	 XuZfxMHhCYAr7wLKmxH0cGOYdPCu26PvP6eE0eRtFXwpo4uT0e3DayzzzfKS3cXojtOe6
	 5rimTYSLL4VjWQY63kHnJfpjHPB04+gR/uT42U6mrPEgDSi8P9D8f958tKAT2vRqZANEs
	 BB1m1P86mIDGGNFKUsOu+enuSQwWKoxPh3IG0t8ZoKRyJ0YcDtwcj8kFHx9BlJiYs5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792932496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GFk493A56cYfyK4uM8/JlxklDpnCWTgb/zmDZtIoFro=;
	b=L3AlIfPILm9zB08u4AjJmHFUHkeZSBAfQrGr68aqUWnbCBQwCSlTDURC7ESKNmYZcEU9
	 DGmtFMnLOEXMnStCwrSe3BRyvLB6kPCjpYcgKh2EQiqE30LaXIi33P0DSiqOAKipP4ZKV
	 BSZLkJGYIX99wSYEdB/z3XriVbjo6g/FPAB8Jy09chCpmmDfIFpWXEUQUjr73sUu0/no6
	 obkiQSkr5jKrVb3hx2X5PnsrwxvRWiRwvipMCYSmzJy9EglMxWTcE82/gKJf+2o5vGOEN
	 4iz3qgZevCO/E5QRz8XYKNdzjrLUfymxuBH/crwHcMS4fdj0Fph2X/6U23ed1NZ37tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CB7606A31A
	for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 12:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29CB7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso22329835e9.3
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 05:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792932488; x=1793537288; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GFk493A56cYfyK4uM8/JlxklDpnCWTgb/zmDZtIoFro=;
        b=pg8FDG9OpzKln8+QRdvhMAtMVp0WQ1NMYaLASyxAEYJWLNST/WK5rNIhMJud+ol1qL
         fnBQe5FIbncQ9e7Yf2jY5Avm2y32XlQwi8zLdEdscaiuJNlhCMoPO1s4R86eAMZm65+N
         4wN667A/guovDHJDdgGvxXS+E40NfJnWTsV/VNIYrlv42LuwoD8jhjPqOl8WFcqIB9pB
         a1e9nczTgOPdUb4RwVqkaM30MzLLvdbX8vRjHV0JGK6vlZjszCVuRfZPWEEEj2bVwOtS
         Onb1sPkJ2qFK+BNjMAVgcE1OO2VGj/K5/NoSG134pZJDNd8mh6bvz+WE17qQMRc8Utq5
         4GBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792932488; x=1793537288;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GFk493A56cYfyK4uM8/JlxklDpnCWTgb/zmDZtIoFro=;
        b=HiaaOIJWeug+86Q7N9zVrr4FT+aJAymNZKw1qt0YdCZgEtCypQPCVGzHrsVRJrblbw
         dX7PhELHX/U6JbTwOi7dtUP4y2KUMdzuMrAT5EbfvpDk1za+MjTJG06BwrtnZtMbJdX3
         P1pHnei2LSTjHEyVkzxkgBSuDpK3EYv4a2K/xexP1wMb8hBuf5x+ahDcQ1m31c8H5is8
         nySdHfngdWcpIhOAP1E57Mr2y7BZ5NooHWPTy+DTjl4MUaI0BVWF6D/Q2B0z6nlPVw0k
         TEElxgyhdVa92sii94mOxxnHkw8AaaGAH2medV1Uywso687AGvZaNXq7GtZuSB6XSWH4
         +6iw==
X-Forwarded-Encrypted: i=1; AKwUvByU/dm7aly6/g2Y1HgGP+5HvrOwx5Tf5XXvd2m8N70pd8USAWqn4+/01QtCy+uISu5M1wxlWYe7S0E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxgVvQ92yvQJFmnZ5DaIqdd8C4umNUa9Fr+1jWq5+zxeQFqZsV
	KcxGasLXkt/dQCFC8l1ShPYnMiJoCF8KkcKsJjX24aoaecbEMqSlTjqm7pREKK6Bxcc=
X-Gm-Gg: AYBFou0umvdo4h5VPdJm7JtHw+Va4zzTMBgp+XbafMa/Rr92HwBdnU9/aJOQCAlZlM6
	+WeJ/s3cNT/K7e8B2/H79wfQLsteCoXWQLKoQ+QtwsmoVdSZRmh3kfgpTQDMbOki4cgqt5FN3eB
	q3WiCMDAdM8EEM4rdjf+ew+eT6OOHq7WF6FyR+N8yhzXSYXSVXbN9u8iVGomKvkl+TOePC6n5Yo
	OLlI+dvkX1Zku+RTik9zpMNH+fms0shfw0ZHB22ArWQ6UTtHaOEh2gCLTz9lcjV3bAPmmJivPiq
	/gugj2Z42fseSPmU9Qgmx5bk45H6bY4NGL1mseVg+foGrYJ3LFzRus3SrZvqc25bzdS+X0DR7Us
	E9CQPidBv+X32qxK0PD6aud16fa9eT4dE+68JK90ig3A5vXKbXvn9KbNMsVGI9BpvllFrhoU2pB
	BF2/5t0bCSoO+Apx7qRxMD1GvZffHeNZ/YLK2dv0brk1iIV2b6AfVZEoggeL6anlOOWtZ/Z0DzY
	ORi862anhzR6VoediQqjLafCk4jQOeVn03Sf/0TqK+s5tpcVevU+vAY685WOhrSPpfOPKb50kMT
	jlUJsQ==
X-Received: by 2002:a05:600c:3b19:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4a35acc7696mr71714575e9.18.1792932488137;
        Sun, 25 Oct 2026 05:48:08 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a04ad39sm326937255e9.1.2026.10.25.05.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 05:48:06 -0700 (PDT)
Date: Sun, 25 Oct 2026 13:48:04 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alex Williamson <alex@shazbot.org>, Armin Wolf <W_Armin@gmx.de>, 
	David Lechner <dlechner@baylibre.com>, Danilo Krummrich <dakr@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Bradley Morgan <brads@mainlining.org>, Aleksandr Nogikh <nogikh@google.com>, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-usb@vger.kernel.org, driver-core@lists.linux.dev, linux-trace-kernel@vger.kernel.org, 
	Johan Hovold <johan@kernel.org>, Richard Weinberger <richard@nod.at>, 
	Thierry Reding <thierry.reding@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v4 0/3] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
Message-ID: <at34UOuYv3NtX36R@monoceros>
References: <20260914-bind_taint-v4-0-eadf8a090903@linuxfoundation.org>
 <DLIL9H50MALI.3JROXYEEUM3KU@kernel.org>
 <arIvG0nx4LXG9nlW@monoceros>
 <defb3953-7516-437e-b70b-d57de55b91bf@baylibre.com>
 <9bd3a34b-5e98-4038-80d6-da2c3b1948dd@gmx.de>
 <2026092321-province-yearly-44aa@gregkh>
 <arOfHEsGGglNse7T@monoceros>
 <2026092348-victory-erased-0e5a@gregkh>
 <20261023181326.0dc2f7ed@shazbot.org>
 <2026102437-vista-unsoiled-b089@gregkh>
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
	protocol="application/pgp-signature"; boundary="hexcezj4rledtjd3"
Content-Disposition: inline
In-Reply-To: <2026102437-vista-unsoiled-b089@gregkh>


--hexcezj4rledtjd3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v4 0/3] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
MIME-Version: 1.0

Hello,

On Sat, Oct 24, 2026 at 06:56:34AM +0200, Greg Kroah-Hartman wrote:
> So what is the real use case here, taking any type of any device and
> thinking you can bind a random kernel driver to it and it will work ok?
> You all have specific platform and pci vfio drivers, why not use the
> proper device ids there instead, or better yet, bake-in this type of
> functionality into the bus-specific logic so that you can have generic
> userspace control of a device (like usbfs and uio does today)?

Also note that even if the platform and pci busses implement
bus-specific code to pass a given device to userspace and/or a VM, you
need proper unbind support in the driver currently managing the device
(or cripple the mechanism to only work for devices that were not bound
to a host driver before).

The more I think about this taint, the more I believe the commit should
be reverted and replaced by a some stop gaps for driver_override. (Be it
a taint or better yet
https://lore.kernel.org/all/0f7446324f6a0c8f0153d6532d92a6eeecd6a308.1790612298.git.u.kleine-koenig@baylibre.com/
.)

Best regards
Uwe

--hexcezj4rledtjd3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrd+oIACgkQj4D7WH0S
/k6aewf/a1J79AfBUwvrOd6Ba/0Y7Snc6nW1R3bcrJe5+V181tlQ+NubUnz+DJdu
l8Jqw1xcQaALmyYYZ+CaEenSacHj9TFNREGi92ZjNkN8m6+iH5soIV1vTHPZaevX
R9oV4vf5RnsRXugZv92lNktCGbzbu2ceTDhJU4IoX5FyuqL95AVajJ4awrTw+nol
Y+gyqcgb8mzONrS7D52rBINMIjpn9/nmcPs4bVkXCZjAvPg+MFRZTpjwZ7hB3Guo
GM19dH/Q7rfMakDFZ/TJqgDbxuKHrPdU/EFkrRXiolTo+VEKvUOmiiW/JK6zrFH9
WNnJHHFnJdcfBwsazk9IIqGimnpBHQ==
=zFX2
-----END PGP SIGNATURE-----

--hexcezj4rledtjd3--
