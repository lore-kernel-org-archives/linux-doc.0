Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794164371;
	b=DRjZAc0j8WucOCAnzO8IKD0J8mzQyBVrhc/E5n+SCL4x7gTH+C3X2c05bVTfHHyk8iMy
	 N2GOeTnFYlujVFhmvNBm1OkGWITkDbE9eOIoOvK/SQJCgF3uNhp3J6f0jPkMQk1YoDiZ6
	 uTZ0eYAumj868HOXkhN6r+hrJ5xKHwZT65UsuG99aTOJ4JJEKfTfH4h6JCpLWhiRXTAxu
	 2zzjshnfIiAcE0r8wt2vTSEJExJw03V9k6pxiYj8RRlEvEvIBfCAm+uh1Nm1ep1MKkapf
	 D16Opx4IHKJ1VIJFm8qgU9zNx7COY5yaLu5J7vk4nffrTIDeXd6WLI+CeNu5Md5cevQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794164371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:
	 References:Content-Language:In-Reply-To:Content-Type;
	bh=EG4lPV5GD6MHzcQif79VS7R03/QdTS/TP7QGXLXitfM=;
	b=cbodgVYffLt2/FfLUIaMKhWiCDy2nGhW15sTnx9cnRiPHTA7dOtN82aEFaQUMBETtPUf
	 KOlkP+84ZGrriWE3AN4OGsHLCp+XQmE1MhmaeBvFdXIHqIfgH520K/Paf5mM8mhl2gpZF
	 PylttF2mdjXN+7hPt7W6M/nycG6W8opVVUVHJUfW9wPWXJ6VB0+s6L3qnUReFKH9fLIZ1
	 OpBJZSVjliGkeXLRqRouDYLbWIe2lx4V7fMNow6cXL+IJyObCJdFEReDZU/cPNOIuLlQo
	 npevarj0HIJu6B1RkuADpYnvX42VgbE7JZtVZ3HG/G53btvyWilOy+fjej/64RNLclg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r9d2HZ78;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF556606A321
	for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2026 18:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF556606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r9d2HZ78
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-49412eb1474so121239f8f.3
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 10:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794164369; x=1794769169; darn=vger.kernel.org;
        h=content-type:in-reply-to:content-language:references:cc:to:subject
         :from:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EG4lPV5GD6MHzcQif79VS7R03/QdTS/TP7QGXLXitfM=;
        b=r9d2HZ78YbTj/Kq3GKpr4ll6KcSqDsjfQ36hAEcveVM3BdSy3bM1RhlTRLT78iknd5
         cQZoQNTwWF3o76pb5x1OWVqfmHtAAMkVImeo8udHq/L7eURVCdK7YI4CJ3urpzD7m7X5
         5GyhPyMwGHZah7PKpgR6YVngS/PKh/iKbsZMiQKuahPxCiP6h8EA15R/m5iJiC9T8AX/
         m8f2c5QBRirITjAotPbPDKkE5hU1JDiILfZI4E+tzPHeVudJlk796dytDVrbur5RMI1W
         nSi+ILbIEF5LGVgvOO6qoVo4oP6JQUyLoiTHCdy8+hnj3P8jQEwfEHI2nROC3Fuix50F
         7YIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794164369; x=1794769169;
        h=content-type:in-reply-to:content-language:references:cc:to:subject
         :from:user-agent:mime-version:date:message-id:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EG4lPV5GD6MHzcQif79VS7R03/QdTS/TP7QGXLXitfM=;
        b=ay3vuRZi32kITsaCxdMA0548E4DoG8IzaafOPM7k3JVdZjTrm+uix9QA2XQcYKZFfy
         Av1w30uezFATH93wb62TTzJZ7nY3LYkQaFJcO7jRZDVzpPwyfsa1IeJ/eZxrEpqJOQ43
         BIm0rL3rEWsieqOAqNLC8QXYcvOSh4achk9YutLuNDalGhDIqxsA3tooBtnme1GJejXb
         bvdFNKUsGwZMnURm5g3UdNdIW/+g4OzH7M8n54S7Usi1wm7bGZGFaz/HogI1zRs2qZ6h
         KqpEoNRSs56WwvMzxusf7qlWWp23qVniwuT6W05wAWsRUn6h2TEkZIQch4z/pXWcL1JW
         w/kA==
X-Forwarded-Encrypted: i=1; AL+hErGCC969vWQYQVaU6/UFb0SCK6SjGFlJeD5a3Zh0MXo+yKrLAg6YYrR0Mo37opImgYNWPC5c02GZeGo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+XiEUNd7PwVIcvA8P2i3+vybBFdeb5paKkSZFHTfDY/DKWnau
	UXc7Up58TNMw9IET32GGPDxzIDOmKawJUAL5IqNyBDOKM2F3LWR+dPMB
X-Gm-Gg: AYBFou0Iyydyu46+7cIGpj62YhIH3GjFSyo4K/MvGkYOhtLdyDTBARon/JY9l0+Ip5v
	ec7dxNTbt1gF6/ezHyALweRN9EKgX04jBHUwjw/mkTBh9VEp4Gwm3VqMkD0JQuJS8HPqUfJzbj3
	H3SYv2tfJJ0X1CPWB72ev9GQZw6r2BdB8FIpMcpGgycVp1+6DekNlhMqmtIH2E0gAesqdWrmdX7
	12PRvcssWhSRHzh01lwCI66/tdONCh9NVCeodSQg1FysLVs5ZrGgsUqhHFhjkyLjqqfAyQ8vOKb
	LVnConbzbP4cery6+S+GbgQA8vfLQy2E1UW7trTS7rTnHyx1AGzJ9Qv5lSs48Kcanx1YqpA3i7u
	tYAfNNL15x+xg6KJyIC9J7TNU4xaveluZuet26FkrT2vYnSMgDa5AtGug0q3+jwBsvWb5pVbSNo
	MDcKd3rsCATOnaEwKOvl4rg38LRETy5jMCl2gSwiz4yZd6HqiqkY/JSTq3S+KWjbZGHyK0ZHAux
	TsouKp5b9zyiU5x23kaZ+WliIvGeEAgv+jEe6R+pPY8e1DxQb5GIwWgA2ZxXEA0DW1jepBTMK3v
	99Ti0Q5vA3lYQ1S5cJERYl+iLGs0kLwUzo5DdVU2wr6xhph01aFVBAxhD9DkVfb92sy9RPdkYnE
	MxpllgLNneinzX7uuViUe
X-Received: by 2002:a05:600c:34cc:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4b963c6ca22mr39222205e9.18.1794164368936;
        Sun, 08 Nov 2026 10:59:28 -0800 (PST)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79502652csm116251035e9.4.2026.11.08.10.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 10:59:28 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <a20153cd-d148-4618-8089-ad81cb16fe23@gmail.com>
Date: Sun, 8 Nov 2026 18:59:26 +0000
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
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH v1 00/10] tools: Introduce a kernel configuration checker
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
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, arighi@nvidia.com
References: <20261106091922.7560-1-darwi@linutronix.de>
Content-Language: en-US
In-Reply-To: <20261106091922.7560-1-darwi@linutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RdQycBE5cMMMiUBKuDcENBzr"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RdQycBE5cMMMiUBKuDcENBzr
Content-Type: multipart/mixed; boundary="------------DqGXJIIQNEu3dpPKwL26zFRE";
 protected-headers="v1"; hp="clear"
Message-ID: <a20153cd-d148-4618-8089-ad81cb16fe23@gmail.com>
Date: Sun, 8 Nov 2026 18:59:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH v1 00/10] tools: Introduce a kernel configuration checker
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
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, arighi@nvidia.com
References: <20261106091922.7560-1-darwi@linutronix.de>
Content-Language: en-US
In-Reply-To: <20261106091922.7560-1-darwi@linutronix.de>

--------------DqGXJIIQNEu3dpPKwL26zFRE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Ahmed,

Cool tool :)

On 11/6/26 09:19, Ahmed S. Darwish wrote:
> Hi,
>=20
> A month ago in Prague I proposed a kernel configuration checker:
>=20
>     PREEMPT_RT configuration: Best practices with kconfig-checker
>     https://youtu.be/hqnOmdpGBdQ
>=20
> This series adds kconfig-checker: a Python tool that checks the kernel
> .config against a set of YAML rules and reports all issues by severity.=

>=20
> The series also adds:
>=20
>      - a PREEMPT_RT configuration ruleset
>      - a make checkconfig target
>      - support for ruleset overlays
>=20
> Example:
>=20
>     $ make defconfig
>     $ ./tools/kconfig-checker/check.py check -c .config -r preempt_rt
>=20
>       Configuration Issues with severity =3D FATAL
>       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
>       * CONFIG_PREEMPT_RT is not in .config
>=20
>         Rationale:
>         https://docs.kernel.org/core-api/real-time/kernel-
> configuration.html#config-preempt-rt
>=20
>       Configuration Issues with severity =3D HIGH
>       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
>       * CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is unset
>=20
>         Rationale:
>         https://docs.kernel.org/core-api/real-time/kernel-
> configuration.html#config-cpu-freq-default-gov-performance
>=20
>       * Below options are set:
>=20
>         CONFIG_SLUB_DEBUG
>=20
>         Rationale:
>         https://docs.kernel.org/core-api/real-time/kernel-
> configuration.html#kernel-debug-options
>=20
>       Configuration Issues with severity =3D MEDIUM
>       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
>       * Below options are set:
>=20
>         CONFIG_CPU_FREQ_GOV_USERSPACE
>         CONFIG_CPU_FREQ_GOV_ONDEMAND
>=20
>         Rationale:
>         https://docs.kernel.org/core-api/real-time/kernel-
> configuration.html#non-performance-cpu-frequency-governors
>=20
>       ### ...
>       ### More output
>       ### ...
>=20
> The same check can be run through make:
>=20
>     $ make RULES=3Dpreempt_rt checkconfig
>=20
> If no ruleset is specified, the target prints the available rulesets:
>=20
>     $ make checkconfig
>       Usage: make RULES=3D<profile> [OVERLAY=3D<overlay>] checkconfig
>       Available RULES: preempt_rt
>=20
> The overlay mechanism allows distributions, CI systems, and Board Suppo=
rt

On the topic of distributions, this seems *a lot* like Canonical's
Annotations [1], albeit yours uses YAML and supports matching option
names with regex. As you say about PREEMPT_RT configuration not being
"one-size-fits-all", similarly there are 100+ Ubuntu kernels that need
to adhere to a configuration "policy".

So this seems to be a real problem that others are having.

> Packages to apply additional policy or override existing mainline rules=
=2E
>=20
> For example:
>=20
>     $ ./tools/kconfig-checker/check.py check	\
>           -c path/to/.config			\
>           -r preempt_rt				\
>           -o path/to/overlay.yml
>=20
> or:
>=20
>     $ make RULES=3Dpreempt_rt OVERLAY=3Dpath/to/overlay.yml checkconfig=

>=20
> Patch 09/10 documents the overlay format and gives an example use case.=

>=20
> My goal is to get this into the kernel and have Debian's PREEMPT_RT ker=
nel
> packaging to use it.  I'd also like systemd to use it: its README lists=
 60
> kernel CONFIG_* symbols with different requirements severity.
>=20
> Thank you!
> Ahmed
>=20
> 8<-----
>=20
> Ahmed S. Darwish (10):
>   kconfig-checker: Add schema for rule files
>   kconfig-checker: Introduce PREEMPT_RT configuration rules
>   kconfig-checker: Add the configuration checker code
>   kconfig: Introduce checkconfig target
>   Documentation: Describe kconfig-checker usage and design
>   kconfig-checker: Split schema to support component reuse
>   kconfig-checker: Introduce overlays schema
>   kconfig-checker: Add support for rule overlays
>   Documentation: Describe kconfig-checker overlays
>   kconfig: Introduce OVERLAY=3D for make checkconfig
>=20
>  Documentation/admin-guide/README.rst          |  29 +
>  .../real-time/kernel-configuration.rst        |   3 +
>  Documentation/tools/index.rst                 |   1 +
>  Documentation/tools/kconfig_checker.rst       | 101 +++
>  scripts/kconfig/Makefile                      |  25 +
>  tools/kconfig-checker/check.py                | 686 ++++++++++++++++++=

>  tools/kconfig-checker/rules/preempt_rt.yml    | 169 +++++
>  tools/kconfig-checker/schemas/base.yml        | 114 +++
>  tools/kconfig-checker/schemas/overlay.yml     |  28 +
>  tools/kconfig-checker/schemas/rules.yml       |  20 +
>  10 files changed, 1176 insertions(+)
> =20
>  create mode 100644 Documentation/tools/kconfig_checker.rst
>  create mode 100755 tools/kconfig-checker/check.py
>  create mode 100644 tools/kconfig-checker/rules/preempt_rt.yml
>  create mode 100644 tools/kconfig-checker/schemas/base.yml
>  create mode 100644 tools/kconfig-checker/schemas/overlay.yml
>  create mode 100644 tools/kconfig-checker/schemas/rules.yml
>=20
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> -- 2.56.0
>=20

I think the name will cause confusion.

We already have some "kconfig checkers" in-tree, like
scripts/kconfig-sym-check.pl

But actually, your tool is quite unrelated, because that one checks
'Kconfig' source files, while yours checks the user's '.config' file.

This has already caused some confusion in the past, for example in this
thread [2], someone misunderstood which one 'kconfig-sym-check'
actually checks.

In addition to .config vs Kconfig, the name is similar to
'kconfig-sym-check', but is not as descriptive about *what kind* of
checks it performs.

[1] https://lists.ubuntu.com/archives/kernel-team/2023-June/140230.html
[2] https://lore.kernel.org/all/ajo4DVWoSaEZtBDa@google.com/

- Julian Braha

--------------DqGXJIIQNEu3dpPKwL26zFRE--

--------------RdQycBE5cMMMiUBKuDcENBzr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQT6qjll++tIFxF8TUPElYPCBXNxIAUCavDGjgUDAAAAAAAKCRDElYPCBXNxIFSI
AQCDtDk4+oYBccZZgs+OoTuGu0I3s6o7yQXNz7whYRGfogEA7DEWidXa/2MWHU9Jv6J8SSA+WGkh
n7X58cRcqhQiDwk=
=cRiT
-----END PGP SIGNATURE-----

--------------RdQycBE5cMMMiUBKuDcENBzr--
