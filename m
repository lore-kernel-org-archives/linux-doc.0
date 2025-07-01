Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAEB2741DC
	for <linux-doc@vger.kernel.org>; Tue,  1 Jul 2025 15:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751382964; cv=none; b=Jiwsz2EnJWHvvM5ihIQP8xxPiZY9U4G/n0NWvNc5TwiQKpNV9ECg8897n07zZlrJdNSkrdmEHdcuW1a2dtYYzWxjzSwqhygNUo3GEsY95ZhHSb1gI6SH693SQGttyixMa0QIvRoX2m6q90W35VxDK6d/2pundgDqNQYQZmIVbd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751382964; c=relaxed/simple;
	bh=z8oQ/Qy5X99Vz/00GxMthGnaJqgHyWqeMhz2LAS6JsQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=XwaGm+1D5UDwOudMQXoaVFF4lDMwtd/Ju+wBDpZI/Hk1M2biHDymAh+rpaYUE0bsOzpLQwOWq0Z9FoGD0f7m5j+wTeyC18wN2qfvkEk7o66WW51C2I6pMF/Mt4+urKTYGoqjNLAE4DebEs26ngELiTexrvogIdEdKKTjSds5NLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=azF4OEEG; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="azF4OEEG"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60c4521ae2cso10374356a12.0
        for <linux-doc@vger.kernel.org>; Tue, 01 Jul 2025 08:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751382961; x=1751987761; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmBKSATmHIQjY6DYREp8ocZ1PWaVredog5Vim00fHOg=;
        b=azF4OEEGsHJxwfz18vHY7eOqjsBJ/cbRgYSUFBxOe2jTg80SMEVo54MlunEGI8Tjhf
         gocq7v2NW5ZP04jb2Hy/16gMAgtDxmNg5fGxjzRbHDmso/B78uv8mG78JgVVoHZytX+T
         YZBSpqyr6N8VBoEoetB+DPQMrWHBID3qyGhqCtA5Ae8mcYpBsg/sy9KNvGnf3kK2YANu
         qg8fRcBjU4XG/iMjgV5RcvASYf9O4eyI7j0BBureql0/LxQWtQPeNaSOxCsJoUhTy8vl
         3sNHH27ACki5xh2MpeRNfZqpFBcNxtxfUrT8qgoZ+PzsXM7UYcq7kc8YxOBnmFyCYAb+
         Njkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751382961; x=1751987761;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LmBKSATmHIQjY6DYREp8ocZ1PWaVredog5Vim00fHOg=;
        b=T2DQ1IPbuPmnmJ7XOjpYGiPRH5iTawAo3KNqYU8R5yDm3I3NP04OBaD59EvOxN5BWz
         pN1e4YMDYBuH3pyt8/0JTT8n/OQpLdVlwx93sqAk3gXsFk+q63R1veyCq7B2wo4dbUwf
         eBlG//BxeCFvGod5SbMCMlkxdlCBBg26I7jrNOV40OjgO7+eIgeOcttUjp1jjpphXBrr
         N2UTmLAdlppJXlIh23PmVCH4hVD0P7EHYx+ceKKKboKKyjaxVLl5wMsnUqsTeNSMKgjA
         JRrUDCB6R40965CDUshCsK3kocRV8tJzNwSLMyFuL7HPcwo/GAhLZyjzOgCFRcg5U8G8
         MqAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqTJ4wMHjqdV2As0yzpQHW6MumCVfkWXEkef2Qo/T5A6AthglzWD7JnDSxwn7RIvKaipz43PpGaTk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9NhjJKpRWJiquIuJxoLfjwUCtYJvCuznXAAK59MpEISKO6rNm
	gohk/oef3erKpWTLR0Vg+GcmTN9L0jCIxfVcXktbyCe4fiIRiY16oNbGTBoy5PIKOGw=
X-Gm-Gg: ASbGncs4msHMgoNGbFkD35lSdkuSuNEQcoJtjHzCpyKZIYVYO46xKUdWXUgqNM0VxLK
	d5bGgQRSccPF6MS9x/IAPPX0ngciqF3m0eZZ5hp2a0bbX4cJnAFshyJxSGBwZzx25AqNPr3dwZk
	jYJLMV7Va9ju9NI2xvxVzMRpTkvN4DPHDjNISHItAybGUrCLC/wDepeenxLRBfXpGTUGpw43fS6
	nW0bK3AT8vclWlGFAiFH3GKwqLFsJH+s/1DqvCTk87pRLezsQP0UIXZHtAlLfW6K9f/hpR3R9k3
	4Lj90zsw/ODmORU655+15eQrrqlout8Rll55WhLBl9tnpEUue+AXFwFnr07OtqFBxSRV7ubhuQh
	trOBJrTkqDa5lY9zxuPxCFX86
X-Google-Smtp-Source: AGHT+IHL1iIhwrXApah4rYbKaIE+inzvLNC8tyiskTzjDNA+vRNLW36MNlQTR2zyMbL0FHm03im1Ig==
X-Received: by 2002:a05:6402:4412:b0:60b:fb2c:b789 with SMTP id 4fb4d7f45d1cf-60c88ddd1fcmr14069289a12.21.1751382960619;
        Tue, 01 Jul 2025 08:16:00 -0700 (PDT)
Received: from localhost (ppp089210105145.access.hol.gr. [89.210.105.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8320226fsm7535009a12.71.2025.07.01.08.15.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 08:16:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Jul 2025 18:15:58 +0300
Message-Id: <DB0TFZWLD0HE.3I2409138M8B1@linaro.org>
Subject: Re: [PATCH] docs: devicetree: overlay-notes: recommend top-level
 compatible in DTSO
From: "Ilias Apalodimas" <ilias.apalodimas@linaro.org>
To: "Raymond Mao" <raymond.mao@linaro.org>, <linux-doc@vger.kernel.org>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20250624181320.2810521-1-raymond.mao@linaro.org>
In-Reply-To: <20250624181320.2810521-1-raymond.mao@linaro.org>

Hi Raymond,

On Tue Jun 24, 2025 at 9:13 PM EEST, Raymond Mao wrote:
> When managing multiple base device trees and overlays in a structured
> way (e.g. bundled in firmware or tools), it is helpful to identify the
> intended target base DT for each overlay, which can be done via a
> top-level compatible string in the overlay.
>
> This patch updates the document with a note and example for this
> practice.

I think it would make sense to describe the firmware handoff stuff shortly
here [0] and explain why we need it. I.e it's possible for devices have a c=
ommon
firmware binary which only differs on the DT and the applied overlays so we=
 need
a way to identify which overlays should be applied once the DT is selected.

[0] https://github.com/FirmwareHandoff/firmware_handoff

Also please add
Suggested-by: Ilias Apalodimas <ilias.apalodimas@linaro.org> if you send
another version.

Thanks
/Ilias
>
> Signed-off-by: Raymond Mao <raymond.mao@linaro.org>
> ---
>  Documentation/devicetree/overlay-notes.rst | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/Documentation/devicetree/overlay-notes.rst b/Documentation/d=
evicetree/overlay-notes.rst
> index 35e79242af9a..30b142d1b2ee 100644
> --- a/Documentation/devicetree/overlay-notes.rst
> +++ b/Documentation/devicetree/overlay-notes.rst
> @@ -103,6 +103,34 @@ The above bar.dtso example modified to use target pa=
th syntax is::
>      ---- bar.dtso ------------------------------------------------------=
--------
>
>
> +Overlay identification
> +----------------------
> +
> +When managing overlays dynamically or bundling multiple base device tree=
s
> +and overlays in a single system (e.g., in firmware, initramfs, or user-s=
pace
> +tools), it becomes important to associate each overlay with its intended
> +target base DT.
> +
> +To support this, overlays should include the top-level compatible string
> +from its base DT.
> +This enables higher-level software or firmware to identify which base DT
> +an overlay is compatible with and apply it accordingly.
> +
> +Example usage::
> +
> +    ---- bar.dtso - overlay with top-level compatible string -----------=
--------
> +	/dts-v1/;
> +	/plugin/;
> +	compatible =3D "corp,foo";
> +
> +	...
> +    ---- bar.dtso ------------------------------------------------------=
--------
> +
> +This top-level compatible string is not required by the kernel overlay
> +mechanism itself, but it is strongly recommended for managing overlays i=
n
> +scalable systems.
> +
> +
>  Overlay in-kernel API
>  --------------------------------
>

