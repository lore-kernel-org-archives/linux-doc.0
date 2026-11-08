Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794164389;
	b=sGTTTOp0SXcK1hDBfd2I7ZC60xVSP/S/QN/RK+/+3rNYX1Y79POsrBRYhmFfSVeHjIex
	 CBnQHBXaz4t/lgNirzfOcsXZFIaQccqWMDxH49Et+qmUdG/WR1Mqk9efiNXiB0gAFZHM2
	 W5fp/Q+ytIC5FHv/sQW3akm5q2gm9mRLr7oI9jOZIzpi+BlhOEzseBuYZAWb5fdyY8KK/
	 wzFg1kHQa6Tw/QxJxF7uw+K7Dj8QtL+6S/rke9yzJ71fUD5LmmwXycHgwDGIk1leCPO/K
	 2E+/dI80XT0QX41YohGAFNgtzYQffRrrHfNZWmJz+gs5Jod3l2lsj7R2J2YKEApoNag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794164389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type;
	bh=GpAFUlt0XxBY6dBpUlo0gkGGdcjqwC3S9cjFDt6ElxU=;
	b=dNAbzq6M80jHHL3591nS+rdGAqCxkM5NTDun7RK602ZZc/DBzCrQapeMg/NI1ckgXDv0
	 zx2pbfUmetGWPFmu29+YIexXr66hvdpXsKQYnm2EcZxk6G0Vgy5C+sgK79VLUbFUIUu+6
	 SiUldaHw2iwRoRVVq6R3hcuKmqyum4C4asfwP52LznqRemREoVDd9GUWKgJp2VlulBLkw
	 wVH+Ncrt0WeluBXQEwbH5QHZkNO7zt7Jauzej+1ZJll2LS8Lam164bzPremBRDND+SGP2
	 2excPQceoOT6tufbp7cvxza3BI3bYCyeEYtCgkujiTastd/Jq79AdZm1lLVWCi1aQbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J5dWnNiF;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26E4606A323
	for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2026 18:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E26E4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J5dWnNiF
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-491aaed7565so124017f8f.2
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 10:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794164387; x=1794769187; darn=vger.kernel.org;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GpAFUlt0XxBY6dBpUlo0gkGGdcjqwC3S9cjFDt6ElxU=;
        b=J5dWnNiFRKZj0dtJfdFFjQLklNQbzPYUrEh25hgk7Motlge51LERu4P4P/TQlOUbgq
         iBlijpaSV/UfK5kMduDdxTVwVINj3JbvY6soIiXQQvfEdCOsmSjKq1rviZWtK1iaoaXF
         6IDxeEL6xY8eT5LA1UYCJ4UkJOO3eL6uOspPn8HF0IGUihihkerf/MBFkAioF5nInmZM
         drHx4xFDCHd8+Ek7/nkf3Gwg4H1KSB7v4XnA4oKWTzmwfb6d8+4EEuQdYnQxbST1abWl
         DbUlOOu86QNHAzYgk6o/bC3OfsXOkpfa1ZYNjle/htFyJ21zhRyCYbtO8MCxvowUMQhZ
         sKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794164387; x=1794769187;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GpAFUlt0XxBY6dBpUlo0gkGGdcjqwC3S9cjFDt6ElxU=;
        b=G/lhEVLu5IExSrMxkp9HbhdY8nqd+guhtUFcd6Mx5mhmISECBD/rHvOWjT+b3hDhrt
         hG42uvBtQj2tUTohBoNJPJ+jNv9Y42WSnJ+N+WacV6qjAV+If5BOiPyP1Qy55CX/VDB2
         x8EZtUjBCwSzeLMG9/BrBnBpu+Eo7nvH9TrNJEJll0U14dlaAtT121thgOrmZ++2IO2Q
         W4bYJSgxJm8hzSYJgmy9LHogANoQE148fRBIVKvwctjP9CJLyVGNEuATlgM4ZjUV6dUU
         eP775ACQjbOY/X17uVNWba5GZPKGkK2HUEbcisNsiHki9jAW2qY5wUmtusS3WyKFIUbz
         vVBg==
X-Forwarded-Encrypted: i=1; AL+hErEui9ijiHgD/J266Pp4+MrEp3zySfSaqVO1iPESO2MHscFQ0f/RqOAj/IluLGJXHnSnHI8W8VdTXd0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Y9jmvfAxiOXlY9a5Dm+wEWosEY4gAOPDPdiJIES9DgGrlkKmg
	lxBO1xuGozm1yPwb9WfO2biSvqwgPLCanysFWTYdXHXKiv9he3hFWRIh
X-Gm-Gg: AYBFou1KeeNot8UMg2HrfiXw3uBxr2r+FkU3hFGQwuX0eaSt8ek/t0kARVOcalFVQBa
	EsGyGScpYE+Xf45T6pD+/4vQM20UjNjygzLAbGk26a4taD4WF6PiLx9wA5cyeqgYPFSCyifuunP
	8KG5wFke3d7Vt8VVTJ6LVACKbfUDRUz4rYFjJe8yGhfTvuGCb0nzoNBQjbuhD7p97uOftclMDzW
	qkPghdyq5Ka53fzIqElkJ3ZSnePsfVrClxuZco9NJKkSQJaCrT9pi0QDUUe5IUrbhoqdWzZWRRK
	uVt0VimoFNyVCLjG2HlqZM4hpEOr06M4y/58ZGE+5K3mNTIN1EP54XFtLfO7FW6PVjZ/z+HItkU
	nuBqlR5sGklJtjHIimUECNeYduR8BFALjQdjl5QFC8Vpt4tEGH7+3Ix+EjQ9luvRD/ybjpfrZTV
	P20GY7RJsF1CRogBnsrWjLgp0hWQ/JTsqXSCuZOSDy6VJd2evu2SZ8zz+vkCRcmucgUhRNewkdl
	Jh2nOHZ9wRco08TBEodPUJ0EEkl6rrWtiE+EYnBqkxNj1rVGH9zlL8CJ4t3bDQG3gKE1Sqf84G/
	qGzzJtIyio1yDCe44u52yRSRX1jNZMKNXmMHZkTTaENXfPR4fiU7V/+mvEkiApiLNZoM92a2Euq
	r2Pm6Y3Smc7PuKmVA+5uGIB/7J0uz0+VzBgXRqwN/yg==
X-Received: by 2002:a05:600c:3ba4:b0:4b2:61e5:b2f4 with SMTP id 5b1f17b1804b1-4b963c65a88mr49152645e9.11.1794164387223;
        Sun, 08 Nov 2026 10:59:47 -0800 (PST)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f11172esm80401145e9.12.2026.11.08.10.59.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 10:59:46 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <3dd2bb0d-8486-4630-b496-e92e4ac37c29@gmail.com>
Date: Sun, 8 Nov 2026 18:59:45 +0000
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
Subject: Re: [PATCH v1 04/10] kconfig: Introduce checkconfig target
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
 <20261106091922.7560-5-darwi@linutronix.de>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20261106091922.7560-5-darwi@linutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3ScbaGCYTbGeYkRt0jz5kpka"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3ScbaGCYTbGeYkRt0jz5kpka
Content-Type: multipart/mixed; boundary="------------NII28W9PtdHxoeuGqG7HRNpZ";
 protected-headers="v1"; hp="clear"
Message-ID: <3dd2bb0d-8486-4630-b496-e92e4ac37c29@gmail.com>
Date: Sun, 8 Nov 2026 18:59:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/10] kconfig: Introduce checkconfig target
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
 <20261106091922.7560-5-darwi@linutronix.de>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20261106091922.7560-5-darwi@linutronix.de>

--------------NII28W9PtdHxoeuGqG7HRNpZ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/6/26 09:19, Ahmed S. Darwish wrote:
> Add a checkconfig target to validate the current kernel .config against=
 a
> set of rules.  Select the rules using a mandatory RULES=3D make variabl=
e.
>=20
> Example usage:
>=20
>    make RULES=3Dpreempt_rt checkconfig
>=20
> Use the kconfig-checker to perform all sanity checks.
>=20
> Document the new target at the 'make help' text.
>=20
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> ---
>  scripts/kconfig/Makefile | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index 5baf1c44ffa2..d67a23730259 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -125,6 +125,26 @@ testconfig: $(obj)/conf
>  	$(if $(findstring 1,$(KBUILD_VERBOSE)),--capture=3Dno)
>  clean-files +=3D tests/.cache
> =20
> +checkconfig :=3D $(PYTHON3) -B $(srctree)/tools/kconfig-checker/check.=
py
> +list_checkconfig_rules =3D						\
> +	echo -n >&2 "Available RULES: ";				\
> +	$(checkconfig) list-rules >&2;					\
> +	echo >&2
> +
> +PHONY +=3D checkconfig
> +checkconfig:
> +	$(Q)if [ -z "$(RULES)" ]; then					\
> +		echo >&2 "Usage: make RULES=3D<profile> checkconfig";	\
> +		$(list_checkconfig_rules);				\
> +		exit 2;							\
> +	fi
> +	$(Q)if ! $(checkconfig) list-rules | grep -qw "$(RULES)"; then	\
> +		echo >&2 "Unknown RULES profile =3D $(RULES)";		\
> +		$(list_checkconfig_rules);				\
> +		exit 2;							\
> +	fi
> +	$(Q)$(checkconfig) check -r "$(RULES)" -c "$(KCONFIG_CONFIG)"
> +
>  # Help text used by make help
>  help:
>  	@echo  'Configuration targets:'
> @@ -154,6 +174,9 @@ help:
>  	@echo  '                    default value without prompting'
>  	@echo  '  tinyconfig	  - Configure the tiniest possible kernel'
>  	@echo  '  testconfig	  - Run Kconfig unit tests (requires python3 and=
 pytest)'
> +	@echo  '  checkconfig	  - Check current config against sanity rules s=
pecified by RULES'
> +	@echo  '                    Example usage: "make RULES=3Dpreempt_rt c=
heckconfig"'
> +	@echo  '                    (requires python3, PyYAML, and jsonschema=
)'
>  	@echo  ''
>  	@echo  'Configuration topic targets:'
>  	@$(foreach f, $(all-config-fragments), \
> -- 2.56.0
>=20

I think this tool may belong in scripts/ due to the kbuild integration,
as was mentioned in the past on another tool review:

https://lore.kernel.org/linux-kbuild/20260428183101.GA3304253@ax162/

- Julian Braha

--------------NII28W9PtdHxoeuGqG7HRNpZ--

--------------3ScbaGCYTbGeYkRt0jz5kpka
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQT6qjll++tIFxF8TUPElYPCBXNxIAUCavDGoQUDAAAAAAAKCRDElYPCBXNxICr8
AP9ab7lj4yj0R79XczFEOb9wo5VIMZGC3vGZY5oFqemP3wEA3AwrJodpubXiVsw04hceTbqM6l8E
RZBUQogdrKCHxwU=
=wQlh
-----END PGP SIGNATURE-----

--------------3ScbaGCYTbGeYkRt0jz5kpka--
