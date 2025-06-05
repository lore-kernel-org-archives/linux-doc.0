Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADB6770E2
	for <linux-doc@vger.kernel.org>; Thu,  5 Jun 2025 15:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749138628; cv=none; b=kFQ1+AgJpai+zmNvxin4VNPbdV1EEp8COXknvP/PV/pBj78+fG4j6ulSyPLk1z0JN8fxUAA5PaffAkYmNdGFguNlszfJgoh5G9zzXijVjWb3NuojcsnVjXJXVFxHKfvqPJMckpKuJG6ueLRZv0i/5o/3yzYB4cP3Yo2if+IIduQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749138628; c=relaxed/simple;
	bh=PH2gg5/25bWwXBMWyv5HpO0mhwg5KYPWfIuk4bNNBPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=efRVGjNVMplojMt1yf1qd97Lg95yQEGKKqS1gL8XlXPLMgYga2nsPL8qXd4Ow0Tj6yjVs0JNTBohCciZIh7XJGe3dSdN6DYXX8us9Zt+xW+S6zUDLnas6c1jAhfplgEvFwRGuci/yV4H4kheyL83vlEUipIYm5/rIRfy+QB/2dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Hvn1lwir; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Hvn1lwir"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a36748920cso1167532f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Jun 2025 08:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749138624; x=1749743424; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JRCqLN5L4Rr3WE8pJIILtJZPUbBl7/a5g9L3/1Mvsfo=;
        b=Hvn1lwirJd9qggJQ5xoWI5LFYst7HV5ityrA7rsdjNxzkAPIBpTjqfjY1KWxr4wV79
         gE+ihtJ+FXEgQI6WUk5AC6rRnQlOGnqqKkasmxFkTdQr4M1dNCGeA00K9U9/KW7Lud1J
         MMJk8PYLCJ16TAK9mTM7LPfMKnAobWv4tUKSgv0uNbwGkva/je25pwKoCH0tem1KH4wi
         TnB/xLzpi3g0H1Sf76oXX0MH9vJrF5CxKe/Kc5X6vHJnPergEeaBjWJEPku2xw/pTeiz
         7IHhtNu7tczRUn0spjpWAa7hUPa7BsbDxTWbkUOy81a3rm2j13Ek5XLxF3uwfVuY6jTq
         /Y1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749138624; x=1749743424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRCqLN5L4Rr3WE8pJIILtJZPUbBl7/a5g9L3/1Mvsfo=;
        b=UXv7DyAEi2T9OE5xb6QK6W0gVwNv6K8KT6LOCtpyRX09qVUBzGvjeXeHY2KvUEb2ne
         kh7FnK78LhBn+0D7FvoN+peiicKPwzhZknvhGeMfc0TW6vnp+FeEsXYGwKvqa7lgHWxy
         e0P8LDq2SZBtrrRaScdjQrS+SzyKXoovCak0+YjKNlNbTCZH7qc5c8xNzUnhRhNQlZ/N
         PMtZuVhn0qpNtxiGWYLAv9tzhNTJr7bSI08zkGV3iknrfu13/8pjSu4Pjh294ftk1Mfu
         2UoLeJrATNnlx0s4Q5Xpk0mVAiubNLQPUxkIS6MLElQBDKMYaIZfzJNxi3t0yNtJRp0l
         ovxw==
X-Forwarded-Encrypted: i=1; AJvYcCV+cE1T9GFF7pCP52wMItYm8kkOOsm6DSYfvstQ5U3qWnGoXOlvWhocV6+a8vvtlbfLV8BDkdtwVYI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAp82CnSd66O3sg1meRR2kx2qm+e4DHMymbQGM3irXcN6HAFkk
	5hYdXqOc6WOXbOdw+XbO/wbGcIMtmOGWAAJY207GLHjtiL/0iZ5YRbabpmAgjecIAfI=
X-Gm-Gg: ASbGnct752gcMlbKs9ForVue8/rwFCzJ6g7n1ulFJ8r8aqTKMh1uBdy+M6/jwE1t+E8
	eEwcEeVgh6SBf71kEsflURa1U+LPuYh/uMLIkB3EH36EgexukLKAHP2gDoMSbAgww61oeXBj9Wc
	slQXT1EKtvuhqw2g0Ryyt4dQgYh/OYOu2oGzwUbD8HvlT4NLyBkJAk7/3UOE5KadkAMCQtoJXqj
	OKpfCtBr8Sx1IclNzYQ1S1hQ/oVBKjPLoxRaP+llk1mV17j06yROCjFdtmL0NnJLRDLcyEQ2zyR
	jskCRUPYLfoFkRofHGaWKR1pE1cdzfws0kmFF0psRkSRHDYclzO39g==
X-Google-Smtp-Source: AGHT+IELoMlwsCu+FjoJVCzoFEowpMUAlbq++KbjZI5GGOu59FebaVIM2y+qSY8qYZiSkvqrwc1U4A==
X-Received: by 2002:a05:6000:220d:b0:3a4:eed7:15f2 with SMTP id ffacd0b85a97d-3a51d96ae39mr6337955f8f.43.1749138624495;
        Thu, 05 Jun 2025 08:50:24 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe7414fsm25349729f8f.55.2025.06.05.08.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 08:50:24 -0700 (PDT)
Date: Thu, 5 Jun 2025 17:50:22 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Vishal Chourasia <vishalc@linux.ibm.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llong@redhat.com, bagasdotme@gmail.com
Subject: Re: [PATCH v2] Documentation: cgroup: add section explaining
 controller availability
Message-ID: <xn2sq6byy2qvylmnhzgzhjuac44t5qnndq5eo2rp23xjndbhlg@oymknwf3cxw5>
References: <20250605145421.193189-2-vishalc@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bayaay3n4q7jtjk7"
Content-Disposition: inline
In-Reply-To: <20250605145421.193189-2-vishalc@linux.ibm.com>


--bayaay3n4q7jtjk7
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] Documentation: cgroup: add section explaining
 controller availability
MIME-Version: 1.0

On Thu, Jun 05, 2025 at 08:24:22PM +0530, Vishal Chourasia <vishalc@linux.i=
bm.com> wrote:
=2E..
>=20
> Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
> ---
>  Documentation/admin-guide/cgroup-v2.rst | 9 +++++++++
>  1 file changed, 9 insertions(+)

Acked-by: Michal Koutn=FD <mkoutny@suse.com>

--bayaay3n4q7jtjk7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaEG8vAAKCRAt3Wney77B
SXmRAQDPQPSQbPWaqiXwU4vsbDRInrcwQad8DauYGFYkN3J/UQD/RsuAsYUG7+pd
13hnOACyQdZK9AGRKldC1S4PUT8p6ws=
=Vr5j
-----END PGP SIGNATURE-----

--bayaay3n4q7jtjk7--
