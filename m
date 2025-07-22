Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15A924467B
	for <linux-doc@vger.kernel.org>; Tue, 22 Jul 2025 11:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753185253; cv=none; b=u9pb7o5mOQ0N/iXGa4soAXrPwI7mLzrIMPQeBC8maN245WVhuXKq48c/yW2vDsP6KigvRGYC5qjPOTLzX4cttz99PpTmLH07af/d6vOfRIePC3iUCAlZ2BDkaKNRMGnu7CUYhvuwPpZXhzqZxLMLMkFBRt59Job1LSZVuLeDas4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753185253; c=relaxed/simple;
	bh=Fla3OlF+/YSMx3UOhbmIQazfbvpT43e/E5z5T5vEJVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cg+xW/GyvtNIXhfHBAWZtO2RPGPxqXkmoR2K8yzV8z6ta+1j7IJ1DiMoHdteHc9Ogq4vEY7KOlvbTXxOQKDo/NJNVjwUOhSOFPsaaCFZMrZFlPqEktDS6xmsknxkm+zmhD2fbi+UtCwjIC57Bzag5XS1vzolJaBmO8es+XltO64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DjtDc0LH; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DjtDc0LH"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae0dad3a179so865185466b.1
        for <linux-doc@vger.kernel.org>; Tue, 22 Jul 2025 04:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753185250; x=1753790050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9kKt2BVvYAWPd9RG6IbzHHUIGJ1xcLJOliFtWnoC7pE=;
        b=DjtDc0LHqZeKUILy3s2oQKZYOl67ZHw3E6MR8ZsoFMudW1LCstl+1eVWktnLYedAyc
         QHAZDacJek7qNDVWuqyXRaQr0SahdEmxNND230oHu5FmwnW0nLv4tUMhBUQBLw6eGB79
         RX/2eypfTwu4wocmsOlkZfQrIPfk98OvbmqZJdAh+YOn4PDQTyQ3kvMocezzh3W7IBWs
         yfTyz630RbtfHiirLXjmBYuUMoTKwY74jQ55U76ttqlOKqb8HsCqMXo2/r0gsOVbeMZ0
         CK964OQlGW2Dn4GhoJftIcb33+ypxiWkR2Sy+n4aOO/oaHjtr0giypvSCv9snrk+VJb2
         nR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753185250; x=1753790050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kKt2BVvYAWPd9RG6IbzHHUIGJ1xcLJOliFtWnoC7pE=;
        b=GlNfdvvwZ1mBSg6AUghJQPXDkaYdK4ScYr20dMM4+mA/fq/kODkNwgZimeuSj5qR9Q
         maZ00tURIz6kxJVxKakL4vizGOpqaDIQbki0p5NxvJJlo1oz80vK6FhtrY/D54KimNSj
         /LgvtyqVdk+FVhOGHABhHuZMnc7FGxfY3tDcIslsQD8b9MYUiuOjk/tA0WFdKEHHSnJI
         SDLGZkyk5Kn8UNajHQ3iiYSTEUDNokbx8TaSg0mSEKY6DF2qVn8UiyYCB/9SMZuooqY2
         W8Ady9JNY0Ld5vU0eccsDTkhte1Uv0vF0s2rzyrb8UTRQ00BiMw9SSuvaPIGvY1Lgp1H
         XrVA==
X-Forwarded-Encrypted: i=1; AJvYcCU7CPfcvAnmfrGu1it1zHEIxQD2GOtgZH6QSK349s6wpqPZKu1P7UR+UFwhEtCpQcpXMeMixMners4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4aHxWqDBJfUnjwxVJ6UlkcE2w2I0vabsWOpXHkW6rBL6hxRhl
	MViNbVWbo/40xS0xWkcMWCDUt3v9GviG0pc0hpUrrExMLaC+P19jwpszV61oGdcm3DA4D97xaL4
	cwn9e
X-Gm-Gg: ASbGncuDtciqfp/8dIsbs1ubgnsV2WD5m3IUEnc8SowZsLquGS0QATM2i5hi99us7Av
	464T3GZ/JF7Uq7LijZKuHKYXmetBUU6TaRkpuyKmIQOO8x0+87VSA2O1SKAerdqCHCQAi60eEYG
	bbFWSjLfa4DrfKeMT8DWWjsYGlDrEbDsj+MGRBlGsll0a5MfQcDzwTBsz1DrZ+u1uqygKzy0IUD
	Gd6NzkxfJmeXHdwZs6FoIY+dWIAyFna756EkOrTpAEqz6yc/xh/S8eX5nVJoBsTJYsa1ES2Guu5
	wSGoVQfTpmaoGNMJ71k62OJnddqVhKiFQNbNFO4gxzOKbQ4++GiIx0CAsuiK9fL9pK4DdDyOxKh
	7LpYTqUuxrRvm14G7I5mq+3dkLtw8GBnQ3DO2xVakbKUzktanSspU
X-Google-Smtp-Source: AGHT+IEfIxYTONnhe+xRu0jikk0G+zzebdF83eXd074o2mrK0k86lhWSA/IBxcIozC2KvB4QKVdAMQ==
X-Received: by 2002:a17:906:165a:b0:ae7:ec3:ef41 with SMTP id a640c23a62f3a-aec4fc42368mr1727192666b.45.1753185249984;
        Tue, 22 Jul 2025 04:54:09 -0700 (PDT)
Received: from blackdock.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca2f19csm849926466b.70.2025.07.22.04.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 04:54:09 -0700 (PDT)
Date: Tue, 22 Jul 2025 13:54:07 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Chen Ridong <chenridong@huaweicloud.com>
Cc: Tejun Heo <tj@kernel.org>, Tiffany Yang <ynaffit@google.com>, 
	linux-kernel@vger.kernel.org, John Stultz <jstultz@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Chen Ridong <chenridong@huawei.com>, kernel-team@android.com, Jonathan Corbet <corbet@lwn.net>, 
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: cpu.stat in core or cpu controller (was Re: [RFC PATCH v2]
 cgroup: Track time in cgroup v2 freezer)
Message-ID: <adrjkqsqqwxcsdr5z4wmxcrvgvutkulzgka6pjjv23v6242txr@vv2ysb46nhpk>
References: <20250714050008.2167786-2-ynaffit@google.com>
 <5rm53pnhpdeqljxqywh26gffh6vlyb5j5s6pzxhv52odhkl4fm@o6p7daoponsn>
 <aHktSgmh-9dyB7bz@slm.duckdns.org>
 <mknvbcalyaheobnfeeyyldytcoyturmeuq3twcrri5gaxtjojs@bbyqhshtjfab>
 <180b4c3f-9ea2-4124-b014-226ff8a97877@huaweicloud.com>
 <jyvlpm6whamo5ge533xdsvqnsjsxdonpvdjbtt5gqvcw5fjp56@q4ej7gy5frj7>
 <e065b8da-9e7c-4214-9122-83d83700a729@huaweicloud.com>
 <aHvHb0i6c8A_aCIo@slm.duckdns.org>
 <2c723007-710f-4592-9fe2-7534eb47e74f@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="euhvc2odhqtm7xfg"
Content-Disposition: inline
In-Reply-To: <2c723007-710f-4592-9fe2-7534eb47e74f@huaweicloud.com>


--euhvc2odhqtm7xfg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: cpu.stat in core or cpu controller (was Re: [RFC PATCH v2]
 cgroup: Track time in cgroup v2 freezer)
MIME-Version: 1.0

On Tue, Jul 22, 2025 at 05:01:50PM +0800, Chen Ridong <chenridong@huaweiclo=
ud.com> wrote:
> Specifically, this change would allow us to:
>=20
> 1.Remove these CPU-specific callbacks from the core:
>   css_extra_stat_show()
>   css_local_stat_show()
> 2. Clean up the 'is_self' logic in rstat.c.

If you see an option to organize the code better, why not. (At the same
time, I currently also don't see the "why.)


> 3. Make the stat handling consistent across subsystems (currently cpu.sta=
t is the only
> subsystem-specific stat implemented in the core).

But beware that the possibility of having cpu.stat without enabling the
cpu controller on v2 is a user visible behavior and I'm quite sure some
userspace relies on it, so you'd need to preserve that.

Michal

--euhvc2odhqtm7xfg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaH973QAKCRB+PQLnlNv4
CFq/AQClJUmKOphL5NvNc5AVqGOpLStkEZI+TheupLy0GZFR7gEAnedr53Iw59zU
//68DI0J9sYoXIgmUXii8bcidi8uwwY=
=Mri+
-----END PGP SIGNATURE-----

--euhvc2odhqtm7xfg--
