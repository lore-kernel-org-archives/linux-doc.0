Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AEC52843B
	for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 14:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073172; cv=pass; b=Q7rHfe60p1POJd6PmJ5ET9G9uzWB/R2+pg6uz6iA61OIoibxckgV5GtIq2XR2mryqu3b78RXIsdF4VrFtYdWIY9gXX4hqk6KUTUZcbptsiz8g71/6HAQV6/Pky+gJZuQtAIPDe442b2siljLOHdjm8EBK/jCKfRNEUNrr9OzxyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073172; c=relaxed/simple;
	bh=Ult2wbEPNmy3iN+NrU+/md6eFZJXKg3OExFz3pyUCCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q8SKfUT+BhGBzfazabh+UnIPoC6ho1gd9o90s8ygwI/HSPngCSOWIgUY4uhZhtR9FRwUsXOiULf1MM5qXynsdx4o9h7WvpC5EPVuX88p+SCcucd+Ve2Y89aPZMXLTlWuVPgQYyvoQIhLVC2DX3vNT9FiFatlLS0HTxBnZzfFBVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sGTJx7r+; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sGTJx7r+"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33c10faf6easo563220eec.0
        for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 07:06:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792073170; cv=none;
        d=google.com; s=arc-20260327;
        b=hDxG3cVsNOAT5yGYV4Z10Gm1afA0VI1XkETGvflCUf4Rmni5j/tOTcMM9pJoUpkcAy
         wiLuOB5P5Zm8kil1uNLiA9N+jKDn+6vQhOVwZdfyHxhKsAZ07/Za0OIblrxfI3giphEs
         hrVCZlOhte/5oZf5sUsVLOo7vTqIChCAZkxOt/B9J38OHp+L43HvlsNvIulQzkavMtBl
         7TSwlc6JIUUuvaNbXO39b7N5xgvgcCs52S8UfSE/YBSkIJI3vG3B9GODh4gLd9X1b1HX
         +NHcGlsZYIyttHrn1KyoE9iKDo1XtGt+922Gy/R75MwfXBVYUJjk6skaqP/WT3L8PH3y
         smTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P2P5MXeugorL2l1zb5x+FuUUdQZHK5/NjbEjCV7Jqx8=;
        fh=+do9q2oPmg4G7ppc8NRCpz7b78r6mx26YplufTb+HGo=;
        b=aGbCsKeLfb2sQUxlNofAuuug84vnVTDvFZGpIDIJwYPBii9vvZI/3juQxqFhra8wDY
         gIQyNAreYSONeo9vDZkZcP7xf19TsN1x3qzTQSAP2CK3wWW5ZAqd1j1yLJAnW1yQpWE0
         wvfSYXp0txCxQ1poWeeR/7FVIq7PLXwMr2NmJY5BZXzlxCAfiMJHMiEl7insEt/HpyMv
         xRVKgFM9GucnNUK+WzC0vufxBh+xibB1CWNQ/6IgSVdBrIAb5xs9ZUHmW5xi6T1zWfdD
         LwaozMsBKYlfXosgks5kfL0IqQ6HTZ5v13NWrEIOiwcKvQlf121j3/JgznUQFI5ggFn3
         +noQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792073170; x=1792677970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P2P5MXeugorL2l1zb5x+FuUUdQZHK5/NjbEjCV7Jqx8=;
        b=sGTJx7r+Z/9MQgXtI+uX30PqChS/HjVj4TBPitiO6AGLwjxb4ZpboK2FMm8bfHrNWv
         ae/G/fiBt61LhUAWib9tvRvALWdKfIcn+1akZQV7d7sS3HP/QMm4ytNVQFpvs+DaWyWX
         8ionMm9eApSxnOMg3DY21jGWBrifL3DHZhhXbUGy3yuLlQnCQ6Rt6oXy9ugFXmyRlQXp
         Ow2lFgCd8it8ms4RcNlbyL3XKjgmRPdyhPA0KtIKUKSBQuB6ijQDRMdahBZpTk3sQW3H
         1rEPjZU3wEe/Rd6U5tZIO8p5bGwBGcTvb628/MGlXV1ppir/dmfiezui6FiW1IkHoWCU
         nIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792073170; x=1792677970;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P2P5MXeugorL2l1zb5x+FuUUdQZHK5/NjbEjCV7Jqx8=;
        b=QKUxoQTxoRPE3adYWEESmUGLfnaCRYVNOmMx5TmSzau5e31M2pqzKj+wuYhfPd/Q20
         +ZiE9DR61yuYcqX5IaS8N+RwT9bwBjp+v6BN9gKk4x9YodOjjy6yfyMVGRHPs1Rd1Nuy
         30QFt+Lj3M+yL4jdvyNQ44ZrDVfrgzHjm8rm8wScP3ThYZoVKxdNQbDv8EsYjnSysdo3
         iL354PMLOo7u+diqFFNf5h0VImxVykVbhtgEuqAqPD830X58WVhdIpD79k7lMtFGdBN0
         5etMU2GU7JwhPYHGMnIRFhMDtzbfRslTCT1805Rjh2g/ZFFPm/zzxv3qNBZ7acmFRKVh
         gWiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVidxtpRnrSa8tU29cJWgt57Ve5ARX2QMeMz+timGr9DblrJ02NBJsjUN9C8W/2SpuuS0cpYJ8bVg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIK57nf9BQEOA1Jj73+O6CTdETeSjGc1/L0nD11+Fc6rU3Bi3E8
	4HMo+Ym5ciLc9uM1CXyrYTeN4vMW/fAYRlJ6gTWKC72ynnCmWcmcoGeFgoGvWt1vz/BG+wGuJqJ
	Ou9ekhwgWTAE1bPh87RrToUxYFcVmb58=
X-Gm-Gg: AYBFou3wcukOXV8rAc+dRUNGeOFtm4o4ThoBP6HHnv0tk3kjcZmj1bFReHar/EQ8tLH
	e95eJ1sGu1rObyKZy9PzpkJdngeUtuEDxRaJK248zMMi5vonWERCDEQsAE7GeyFQJf6pI0zeRLd
	cB+EiNEiZyjIGMblmcTgYsYj2yMyAVdUiLsgktLKQjACE0lPGBu+cf+m9NyCT6uHpFSs2e8FWz2
	hFt5GtgnQbQzscjIja8zOXh459IEk4Qbmh0hm/VzWVBQ5fSlXB75GDDfsLUfvsbVeUzgqwoSuuX
	NaztM85Ha4cuvV1tb/usg0yIudXBgsS7a9R2auTz+dnjdUR/OV8ZdZars3SM9uYhIWPL8Z4TpOa
	ee2S2J2mxPSUwYpCz7uvdSYT0Ioq5d11fPJCdnTCAW7YNCKM2k0UKSBIqj/ZjMKCoRnu4PG8yFa
	O9j9yCNifLykbePDnkur/n4dswauT8QcRys7relSN6AoTRGTSzg38=
X-Received: by 2002:a05:7300:c8c5:b0:351:7e15:9c59 with SMTP id
 5a478bee46e88-3537dc89f58mr38177586eec.0.1792073169449; Thu, 15 Oct 2026
 07:06:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791499378.git.sashal@kernel.org> <20261014174838.114990-1-ojeda@kernel.org>
 <as_Cr4FhzyAh-kC4@laps> <CANiq72m6okeCHuR8BCGENTw=wJhfXXZbXZtJq8xtoeVfvfo3TQ@mail.gmail.com>
 <atDYWe9L0tv90Xjk@laps> <CANiq72mgS15ZKwd-u1t1xvAaNf3ivpXdUMmVDfmGRyq1OewLvw@mail.gmail.com>
 <87jynjrrqo.fsf@trenco.lwn.net>
In-Reply-To: <87jynjrrqo.fsf@trenco.lwn.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Oct 2026 16:05:56 +0200
X-Gm-Features: AclHuK_RBJcp0X4oQoi_VtfEgbv-ao9LCjdidR0Z2ASFU3BEFBe0eg2AJEUSzpQ
Message-ID: <CANiq72=raWNCedXQW9dSDwxQTE0hfs9ecyGChRPnWqO6DUvbOw@mail.gmail.com>
Subject: Re: [PATCH 0/2] agents: add portable agent skills and Fixes attribution
To: Jonathan Corbet <corbet@lwn.net>
Cc: Sasha Levin <sashal@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, broonie@kernel.org, 
	ksummit@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rdunlap@infradead.org, 
	skhan@linuxfoundation.org, tytso@mit.edu, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 3:57=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> wr=
ote:
>
> For all that we hear about how smart these tools are, are they really
> incapable of dealing with two only slightly different markup formats?  I
> would really hate to bring in a separate format for this stuff...

I think it would work fine in practice. But it means that we have to
split every "skill" into two files (and reformat when we may want to
move details from one to the other), unless I am missing something.

So if we keep the files rendered and so on (possibly in
`Documentation/`), and make use of `.rst` features etc., then I think
it is worth doing it. If not, i.e. if we just use it as a place to
"dump text", then I think Markdown may be simpler.

Cheers,
Miguel
