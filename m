Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793715807;
	b=Tnaijm1haW/yJViL7JTCI46JgmYEgqOPYrgZD7ZZy2AfMTQeVlWG9DvIkPPIrW3e9gvR
	 irK18ytvzLoiA6tsrkh7hQJvtfySs9CVY4dB0WAY4rmZYhW03mG1QooOlB2wVmBrnm6AP
	 S5/c2vtLw1noz7MYmNLoOi7KqsRgTksuIolLbJ8dVUtORyueXYp0uHdrJwvrQTNid9rPq
	 cA75117neiiqVRL7S/amqSAkHTSUs9/skSRw/bjcpGWrtoD39y216T7C7BfUmk/S2UQAM
	 b2AQss2BlmVmWe8+U0JLTVW3hG8RMFIAEWQ41e3rN6AwLXAEJePrSsRZChq8ZaSGD3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fW4J7ACOHfYfOjstKUthqY4FWfHMPDpmyijSUiEDLZc=;
	b=sP2uTfm726hW3KNv24hKOThOw47j/xVsI6Dk3mzjt/9JFdMracfAavW0GxNAXJgv49Pe
	 dZDUYanCFdgaHyzXbaqPV3Hf1FlfVdKm5T+jOL69epgwi6jN6HUf3ozjDFj4heUy2KkDo
	 MtC8CEXakoXiZZfQMcEW7gyWqE3MJA2MjhqHfJg+0PyKuNTpaLRp7TrkNqvheradr14LZ
	 3R15xm88HlRy/oku13U/HG7ZNsCUb+huOZ5cJGR3eV2hlZG1RK2u/Hiq5408L1sL4sft/
	 qvGsReY2a9nEEluuu7uDdr5P3YNplDxtD7EUlaFwBUdo7UhBQmXrLoncw49r3BAwkJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="J/unelNn";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E57606A337
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 14:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78E57606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J/unelNn
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso3914570e87.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 06:23:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793715806; cv=none;
        d=google.com; s=arc-20260327;
        b=Ga5ji8HrBD0rWXHJIi4d8XNC1OC9Q101bS1bCmP7uHb8dBwZSZcr9JbTIsJ6sQarB8
         AU5Vnh0Pq1Mf2+uy/6Mz+2L1Z4ahdPkgXLiEYE16BCTscTcqCp38IV5GDXyu4g7Fgi1E
         eP04wlYJuxpyC25ftlY+Ia/Tzuj1ZAnit5sftvRTpBYpo+2u5RkxRshbEqwEsrIdGppw
         4x5zmIPKfdETjlRmGywdLrhVQ7SwfIkAhidY2PaKDS6ghyw21Fa7S8kLnMbLi0EESG4p
         UZ60MPS4X2dEyVePKujnd2j+fA0r8Kv4uDiWNUFv/q3FuJLKRE+JF9XIXQGg4IDk9E/T
         RLiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fW4J7ACOHfYfOjstKUthqY4FWfHMPDpmyijSUiEDLZc=;
        fh=oH7BIYe626r1C274sH4JYvIGfrlmwwglv2Ka3LWDGLo=;
        b=PzUJEZxmFKEvO3E0xpI5VhKS0zyJwVMRQ+dJLcnk2lGCgNtYEZselp3K2kVNyDuh7M
         +5UBBvPBgFJNrl6WX+oLkj+vvWL7K46SqAYs7jrJKcVSBpoobc2zUezgwaichhtq36CW
         O8p1Ze1F7qQRyxOwzeaTN5tfdXqLEw2o4FdffHKegb3FJWLXMC3upSTrvkLp07G/nsRf
         xKtoX5pSXHIZIgglH7qpoZlH9G3V2mh908rHM7XDjHN451dBwhhyxRtNu5BkXpVI8Huc
         zDAfF29LPk3TYEsftrEvV0Wn62DE46NPFFenymVo/mJf3gWseCGoR6W6chTSE1ojw6di
         XTXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793715806; x=1794320606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fW4J7ACOHfYfOjstKUthqY4FWfHMPDpmyijSUiEDLZc=;
        b=J/unelNnXlS41STwOvKArtHOPDj7Di5X2HM32zIS9I8Fi9w4BOTSrEdO1CJN8Mt/tz
         MXc5jt+3s1X3rCFP7EYsa8iGxfqk/YEseRK/m96bIveDGs9aBEyMGIOgphYpvNOtNbDM
         sgylqNQninHdiOxkZP/IxMsKg8f3o1JDHhFyElLQsYpn6RONjYAFpvthV/EosYG9DoGI
         IAC+a6s3MLZde8bso57/P04Sncz34d4uht4LEJ+zDnlIdyPjuARiokeM7rV97D849/HA
         odDnTtOCJZ15yt+7Ec2VmphNva4T3cMcd0yQv6RVoSC6W62xtVMs9s1bOozaQ//iDuNv
         JEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793715806; x=1794320606;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fW4J7ACOHfYfOjstKUthqY4FWfHMPDpmyijSUiEDLZc=;
        b=eylBiFeoai2m3k9Oj5wR+EKiG3KsDr5qAr9gZoKKlN9xKjvn97FF1fwkjOShvM0yXu
         RsQrOXPBNAXyTker5/tJEZx5EB/d8eVcE+7VEbjFzvUA4NoyLopciXKnjL0kX0g22EW3
         H/M5wRGtY7FRL8xNLKBlDia0bz/r67U44H/c4ER0kRLu/pi1hvonKC+r29/XDDaTCQ64
         NEcInzWTiFYalVkokt6et2EAgMs4AKP2cJuHdW7U1EtoS4SZRcnV3CziGQW3jJ0iBgty
         icc14OVR/Sg3csJ41lc6ekemTu8GxNaCngYtH20kv4S7Siq9i5DBW5LGh7I5fLWi2XwJ
         ZXDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpMHShWzmZbUfHzRkPIW5m6undPVZpgFKMB1ERDIiPqW7yP02yjOUy4eWJuyXGVcU/HPIGmazocZE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+42797lmf9mYjWMYn6yOheM+zoemtYAmiwuC5pkTZgnB76TkkU
	/IiRmjpzQvV7M/MO8LQEY5C1g+NbMg/LH1HEhccpq3IWTYmDpzaRXClCgmgoHcw48KeLcgEk/2E
	T8UUkYCAGei5PLq2c9rR0X9l9BlPhrKM=
X-Gm-Gg: AYBFou3r4WuGORpTGii8/A/hVzUm6VpKlaC2KO3D+2WRkzP06ZVPgSaWRxpmWuuM5oJ
	gqiDzVc/phM84PDamnFOwNcXrIIcni+thmTJHhWKftoc+vLJLrBVLzJOsWU0+JEanHpuKxbUYr1
	rOc+y9UNdhtG1zUIl3c682cbQwMrdeAU4arm0WYAiVLGeG40t+E9gqpexGGJTMMADhDmf2cC1Oc
	6gBc4OuLoTbKGkXzYBmCXlndYK39RQX4ihoczdjRvhceAgLqfgTnxXTrS/ZNum9HxmdJtk3afrf
	Lr7gthINf+XQoJ58BT4ZC818lhnZBazRybFfM2bTDfv48s3y96q9ye/AUrrPBBCUI7k3Y7uTZQ4
	H2CrP/D8wZ1y9rOWBhAcGquWEDzQvDDvuweE92y18rxWVhRXn683YQXZvWeJ0aI6F+OALO4k6Vl
	NB9OTDNaFDWon12nVEtLsx2OIpZ/m0mHcVp5OSLFCRvja4V38ZBHlQjHylWTFBibnoqNM8a7GqC
	Lco67L5s6lYFJ3xyqIzRB4=
X-Received: by 2002:a05:6512:3402:b0:5be:5409:3886 with SMTP id
 2adb3069b0e04-5bfd95791eamr4374297e87.49.1793715805365; Tue, 03 Nov 2026
 06:23:25 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103121716.102730-2-manuelebnerli@mailbox.org>
In-Reply-To: <20261103121716.102730-2-manuelebnerli@mailbox.org>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 3 Nov 2026 11:23:11 -0300
X-Gm-Features: AclHuK-VDs-Z0So0fxDRqULrC_8-8BejpNW7-paqqdaT-hr4vP9Unej-j5TEqWI
Message-ID: <CAMAsx6ehPnWBEb=6=j0pEUoPWj=kDYNK61XaJVGDtR2WbEEw9Q@mail.gmail.com>
Subject: Re: [PATCH] Documentation: exception-tables.rst: fix bracket
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 3 de nov. de 2026 =C3=A0s 11:10, Manuel Ebner
<manuelebnerli@mailbox.org> escreveu:
>
> Remove needless pair of brackets.
>
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel
