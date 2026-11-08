Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794164381;
	b=dr4Icpc+qkCdrsbwd1X1hwpnYZWg4Z1cljTgckatQSKV5Mp9hpnqNEmtIyHvsjp4/swu
	 7O04QOYy7ubBb2p1gxW9JuvRXRma4wO+idGxncuEqRI8+qVkLiJr7fKWVYCG/cSi5aYxr
	 Lk3/qnB6ADrbxyefr0N4O7KEJD+W/Kyu4F58IKqdU+32fv6tkZVbRx8I8OAi9RyMpmAgJ
	 o7Ukpb3bsCd2FYoCyURp0XtqmDWlDmn4JCyB/NXqKa2VQyip+BuU4GDU38tK+Oqe/fhEu
	 Y7X6mkegGg82rr/ofp0TtT1s+j/i9/jWhvbod2kkwZQhb2Gbc4FikF5nt1SARIY/oWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794164381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type;
	bh=hRnFLZttE2HPaN2aGWT8I7nTJ9h2UoaKauDcSkba7jQ=;
	b=vrbM1c3j6hBbkbfpdH7SzGia58GnEhlf75ID787TP97oPSJXc80J0uToD87QBsCwDqyJ
	 a9RPd119PP7+V2wMHQ4qUSSrmv4Xci72fftZpIvQwhTUC2u6KNQDSRSEh188+eXg8SoSr
	 rAMhKOdY70IErDbXvMU+80QgPXgqeCcLi3kK4YpMAVRWNaTZma8vW4X2rOUreLoa4bTR6
	 oV9jbzYv+Xb6gZBWD75c+34DwSQPVgO0RBRnuudGnLIfurtNU1/R/8aBAFk5fi2vwvqB6
	 3UlRO16dsHlJmgBPCnRZVt6dzGqC/pmHn72/nSyRVkqJgemo+8nO0xALkJr3IjpnvgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LZiPLsrl;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4766D606A326
	for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2026 18:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4766D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LZiPLsrl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so1227555e9.2
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 10:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794164379; x=1794769179; darn=vger.kernel.org;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hRnFLZttE2HPaN2aGWT8I7nTJ9h2UoaKauDcSkba7jQ=;
        b=LZiPLsrlu1x8AztRr9Uq6JLLsP7Yb+7eubPrBwFxd8nZPLedfudb5+EUpZi1R3Zd6t
         kdLmKiiLo0hfGZAP7cEuHoJIPs70tvyFELtdLlN1XdvrhI7QJHcJY/U+S7kV2m01vCrj
         uHEzeYRrLKlN6+0dE1mYTwuTWt2Ywkuedk0qTtLZN2NrAmJpNUYApx6likhuTN/VvrkY
         rL51UfQ4i7FagdSGbb56a6go7X0Nt0FXxKcHbn0hstftBI2m6nv4R2BylyLDyckEQwV6
         AZAv5gwpIGj3xQjsPRpl+Exm/kqHQhOECoX/7bJfjkGP1nDZE9TJX7QvaSr0s36996TR
         IYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794164379; x=1794769179;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hRnFLZttE2HPaN2aGWT8I7nTJ9h2UoaKauDcSkba7jQ=;
        b=swZBdRXO2VYz1lj6k0vgS6pRnU5CA5lznuxXgtwfvGvAgA8Qi323vXruaF3EXPKqGj
         IE5iEznmkyXu4Q+xW2ojlWbxQGSDy3Z2jAfjXpw4DcIOgg++zXt6EqYYbEbzD/q1BKFJ
         fTrZ/GEGYxXvYD2qzCCFYmJXCF3Fof2fkX4XTVtzrr4vuGP17ou0nF9NofDZPKXH4imD
         0H37tTu+uyPYIdqv5uq2Z2Zt8QtSMPwwjR86HT/B2uZCjvoD8O3XbCltqcM4g2a/JzER
         0L2t36mAXJpKDZWBsYru8iuwsTdoF57dqKtR+77xU7KtBY3fjRSuVRU7r84dOB+gt7El
         Zh5A==
X-Forwarded-Encrypted: i=1; AL+hErGNwBOUxBSm3cA8YypBeIYFjSSl7OD8J++INYE+syWff9GyNyy5AgAZj13QTopAG2PckJpRciJ7fnE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dqJ0LKOQGQCappHvPFDX/3K9zk7EMtNJ/9FXEdvuj6Q1M6x3U
	g/OLPezZxo7VTePZvPoArABLBsN7eJHQk0iIY4mwSVCwI9X4QUGVONoA
X-Gm-Gg: AYBFou3Wc2gonwpBZwWxO64BSFIAI7pQ3Vk2SYC1n0ylAlISuC0L4+y0iFL8ttW/enh
	w7lfS7nskcFmtFFXRj5KYkQFFmHs5ynT5lFGE5gvg24Z9nAV9i7X+W5QNefAsLDkampo/uuyMtv
	xQ/AdF4fKpLVQCQLTfC6ek8NTnQDx/+Ixxai8ItvEv1CWLykTmY1upUscB+u5Z2r65qTUaVS/Yy
	EkEavRV6DetO0cz4I+MvnOd122fTyn70ROd93LyZGlhChxhWBfFV1rfPNzUSnEQRwWu5QdEcYc0
	SB9DyLQ7YELvfQ9CLunmqUznIUAn1cas1i45mhY25jM1S//bvx9/aDAc6PWsF1n9b087vfRyitB
	IcE4HS1kPmBhb28udnB2MbVbfZBfpOsTfpoZeyHjqUOTH/KkNah/3DKj7rhis3XPGwfVN5x59/O
	3FeRn+eNwNg0QAyeu7M14lE41pxS8Xco1i3nb9nDybG+HOCgHX3JaHC3zafqiV4LW/cbekO1QM8
	xwRFigvwRV3kTyUSx4GRZJ7FpRI2Wli75fYyUMMm52wa7j76EpK5YcsW+BoiTyQgZRX9+EhUTcX
	W8bgrdz7HQYo7JNrxCuQMfFdpEMkUbfYJeSCew7/p1391BJD7RlC5/U7Is6/fVFOPN0e9x4HBQE
	PcUNQdZTOPaI2/6GeMQMZ
X-Received: by 2002:a05:600c:4e50:b0:4a2:c9b:9b98 with SMTP id 5b1f17b1804b1-4b963c7d01fmr38198605e9.17.1794164379254;
        Sun, 08 Nov 2026 10:59:39 -0800 (PST)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f11172esm80401145e9.12.2026.11.08.10.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 10:59:38 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <e0ffecfe-8c4f-457e-ae8d-32a9601e69e5@gmail.com>
Date: Sun, 8 Nov 2026 18:59:37 +0000
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/10] kconfig-checker: Add schema for rule files
To: "Ahmed S. Darwish" <darwi@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Ingo Molnar <mingo@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, John Ogness <john.ogness@linutronix.de>,
 Derek Barbosa <debarbos@redhat.com>,
 =?UTF-8?Q?Zbigniew_J=C4=99drzejewski-Szmek?= <zbyszek@amutable.com>,
 Daan De Meyer <daan.j.demeyer@gmail.com>,
 Luca Boccassi <luca.boccassi@gmail.com>, linux-rt-devel@lists.linux.dev,
 debian-kernel@lists.debian.org, linux-kbuild@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106091922.7560-1-darwi@linutronix.de>
 <20261106091922.7560-2-darwi@linutronix.de>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20261106091922.7560-2-darwi@linutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------n0jyBVewKwmhUucz3R1v1dT0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------n0jyBVewKwmhUucz3R1v1dT0
Content-Type: multipart/mixed; boundary="------------DIHfuWC5H49s70Tk4afQiYfK";
 protected-headers="v1"; hp="clear"
Message-ID: <e0ffecfe-8c4f-457e-ae8d-32a9601e69e5@gmail.com>
Date: Sun, 8 Nov 2026 18:59:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/10] kconfig-checker: Add schema for rule files
To: "Ahmed S. Darwish" <darwi@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Ingo Molnar <mingo@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, John Ogness <john.ogness@linutronix.de>,
 Derek Barbosa <debarbos@redhat.com>,
 =?UTF-8?Q?Zbigniew_J=C4=99drzejewski-Szmek?= <zbyszek@amutable.com>,
 Daan De Meyer <daan.j.demeyer@gmail.com>,
 Luca Boccassi <luca.boccassi@gmail.com>, linux-rt-devel@lists.linux.dev,
 debian-kernel@lists.debian.org, linux-kbuild@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106091922.7560-1-darwi@linutronix.de>
 <20261106091922.7560-2-darwi@linutronix.de>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20261106091922.7560-2-darwi@linutronix.de>

--------------DIHfuWC5H49s70Tk4afQiYfK
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/6/26 09:19, Ahmed S. Darwish wrote:
> The kconfig-checker YAML rule files describes which kernel .config symb=
ols
> are expected to be enabled or disabled. Introduce a schema for such fil=
es.
>=20
> Describe and add rational for each element in the schema as well.
>=20
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> ---
>  tools/kconfig-checker/schema.yml | 115 +++++++++++++++++++++++++++++++=

>  1 file changed, 115 insertions(+)
>  create mode 100644 tools/kconfig-checker/schema.yml
>=20
> diff --git a/tools/kconfig-checker/schema.yml b/tools/kconfig-checker/s=
chema.yml
> new file mode 100644
> index 000000000000..a7f1b0a78cc7
> --- /dev/null
> +++ b/tools/kconfig-checker/schema.yml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +"$schema": "https://json-schema.org/draft-07/schema"
> +
> +title: Schema for kconfig-checker rule files
> +type: object
> +required: [rules]
> +additionalProperties: false
> +
> +properties:
> +  #
> +  # Optional base URL for the documentation page used by rationale
> +  # links.  See `docs_hint`.
> +  #
> +  docs_url:
> +    type: string
> +    format: uri
> +
> +  rules:
> +    type: array
> +    minItems: 1
> +    items:
> +      type: object
> +      oneOf:
> +        - required: [name]
> +        - required: [name_pattern]
> +      required: [expected, severity]
> +      additionalProperties: false
> +
> +      properties:
> +        #
> +        # Exact kernel configuration symbol to check.
> +        #
> +        # Example: CONFIG_PREEMPT_RT
> +        #
> +        name:
> +          type: string
> +          pattern: '^CONFIG_[A-Z0-9_]+$'
> +
> +        #
> +        # Regex matching one or more kernel configuration symbols.
> +        #
> +        # Example: CONFIG_DEBUG_.*
> +        #
> +        name_pattern:
> +          type: string
> +          format: regex
> +
> +        #
> +        # Expected value for the matching kernel configuration option.=

> +        #
> +        # Values:
> +        #
> +        #   y        option is expected to be enabled (built-in or mod=
ule).

Kconfig's tristates use 3-state logic. It seems like you're
approximating 'm' as 'y'?

These are meaningfully different values :/

> +        #   n        option is expected to be disabled or unset.
> +        #   allowed  option is permitted and must not be reported as a=
 violation.
> +        #            This is used to exempt a specific symbol from a b=
roader
> +        #            `name_pattern` rule  with `expected: n`.
> +        #
> +        expected:
> +          type: string
> +          enum: [y, n, allowed]

What if a user wants to specify that the value can be 'n' or 'y', but
not 'm'?

- Julian Braha

--------------DIHfuWC5H49s70Tk4afQiYfK--

--------------n0jyBVewKwmhUucz3R1v1dT0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQT6qjll++tIFxF8TUPElYPCBXNxIAUCavDGmQUDAAAAAAAKCRDElYPCBXNxIBhZ
AP0St5Gm6t5qmVeEmHVFmeBETjuK3DVAGHB6hDtQY4jQcQD/ZxYo1ObM3GAgg5kaUzxTu4/2XW7B
bUrRbAjtbCe3pQs=
=jHVw
-----END PGP SIGNATURE-----

--------------n0jyBVewKwmhUucz3R1v1dT0--
