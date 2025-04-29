Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62D7288CAD
	for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 09:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745917633; cv=none; b=Ts8ovPxws2hwD4TonUuIqQyYpRPjHVydIYTOTDksu0Ud4VyEiZdI9PTIRgiFDJ6pviO/S3Wley7eUoUU234VnOPf3kyujNrTVWKmF/r9JWfyF3eAOTqou1N1JTzJt27HgWUxKs6m3ETRqKDTKUWquSJ4JourAi7fmktSBsR73tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745917633; c=relaxed/simple;
	bh=oh7CCnYDblP4XNung4PYLs6HI3+l/+Uc4f9IBVFDP2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7+6qnNWu1WqZ1Sz4oBYszu6hZws7icnxNGNZ1aYbbcFJKiIdB7IMgeHhIb378t/p69GpEt/u0Tq5zS0W9m0EySC839oRCTokC+/C4Z+Wi9n7xegj979/vvV1MP4+kZIQzStfrI8nrUXYDTI9z4eJiwumAYTZ6RTyCGYhPrho5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SS24RLrS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SS24RLrS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745917630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mzyYtGASTCZH53kkh5r8Etd3SYnPqWVoda3Vr+Vvexk=;
	b=SS24RLrSRJalk9pj9y0BpI6RdcuNfr+MQwQX3/a9XjNi1j3qxjf0YMPdX8kmrggr9F+naq
	XKztVuGa1LCvAlEqm4AFCkThXruwTYKL8Aohm2guoMvFV2vcqCgzyJa/NiEtysx4AwctLu
	6r82QzxbA0MAogMuhJELSxNiUCyuR3E=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-H2xIgnj-Mumlz_GSGMjbNQ-1; Tue, 29 Apr 2025 05:07:09 -0400
X-MC-Unique: H2xIgnj-Mumlz_GSGMjbNQ-1
X-Mimecast-MFC-AGG-ID: H2xIgnj-Mumlz_GSGMjbNQ_1745917628
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-acbbb000796so408767466b.2
        for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 02:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745917628; x=1746522428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mzyYtGASTCZH53kkh5r8Etd3SYnPqWVoda3Vr+Vvexk=;
        b=wmWYLLgqrnNoZXMzXinx7suuxpUqj0zztPigLuw4+LFDKwbipUyqWnmQPTtqDxvPq/
         gYjDuLaeowG5lEJKTfkWyHyHugLdmBp3dVD3n7fOXm8nBxjQw87WVVy6ogpTGQaQnjC1
         2SRbYXY0Q6pkA6gEys9u/5kOk+5rFXM7IrBkW9X0K3k0irIm9HhAuy2AK/pfg5lRO+oN
         6/o5Z2WnTWQPCwNNNHqNk61WJDDaa7SjBef1y2rl08TnNKMSAZjtiVEOeW7Y3sN3Vs8e
         70RXr2OSDx/UjsemYx9F1Yq4AyMf38gUoMnIvV48+TKQr40AoY6pEpelKRnIN/UdU8H1
         X3xg==
X-Forwarded-Encrypted: i=1; AJvYcCVZ8S8iZIYfy0CxPh90Ib/Ivl8MiRfic0DpU+hITJiuJbNMUsvNVqCP97hzcxMuC2n7S3+CVrut9pA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0+8MQgxhehUU+V+Ok0s2e1VpIIOS9C/sRcAEfyb/m+f4XGoxM
	Vf/MjBWuu+Dp3pLk57pHKWVJ+7Dh2VXbZaHXoBll9TAawWuw4Q6RgEp17UFQNd2a7Rqd2NbDw4I
	H3618fvatinJ3xQv0p8rgTZz4FIdx/gmBYTG1qPQGE7+IRFOXVlet5Hu20Q==
X-Gm-Gg: ASbGncuW5mUKKWg3wZfoNTGQjZLGWOlwYNZI4ZpMHwkLc2yGcusDcKCR5KfZ412maDj
	W8NyKjQIs1eHBPTiUxf5ydn2UDdDbNtutIhr44RojNdkZ50k6K8FhmYM3Uqo8sJLjxXhIgTm9/Q
	Jn4WNkcsEBA0N9nbCkFj3RXsZm5nezB4JPPyd3fJ01lVvEOZRiaz+gWr1NZeGDKjHTeG61TDyrV
	Nf1T5+bQv4tsHk/8pEEtsmEao7IdoCUTNsFs8eL1Pt/spFA7jeZ0r+aQrhIeDTScUQInIh2bE+W
	5jnPVrKLenNvDqJKtpzSwJa4PSDM8mGMicYfZy2UrBamzOzCVMO2NYF1x+E=
X-Received: by 2002:a17:906:6b83:b0:ace:cb59:6c4d with SMTP id a640c23a62f3a-acecb596f66mr114678566b.43.1745917627864;
        Tue, 29 Apr 2025 02:07:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0UT9RESKMoOz8328LlBMB1TkH6XGlQcYjJuX9WOxFYoUYjXafd0Mghnrx4VAIMHLBk84pgQ==
X-Received: by 2002:a17:906:6b83:b0:ace:cb59:6c4d with SMTP id a640c23a62f3a-acecb596f66mr114674466b.43.1745917627414;
        Tue, 29 Apr 2025 02:07:07 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2726:1910:4ca0:1e29:d7a3:b897? ([2a0d:3344:2726:1910:4ca0:1e29:d7a3:b897])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acec171fd52sm141333066b.166.2025.04.29.02.07.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 02:07:06 -0700 (PDT)
Message-ID: <366c8743-224b-4715-a2ff-399b16996621@redhat.com>
Date: Tue, 29 Apr 2025 11:07:04 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 03/13] net: pse-pd: tps23881: Add support for
 PSE events and interrupts
To: Kory Maincent <kory.maincent@bootlin.com>, Andrew Lunn <andrew@lunn.ch>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Donald Hunter <donald.hunter@gmail.com>, Rob Herring <robh@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, Kyle Swenson <kyle.swenson@est.tech>,
 Dent Project <dentproject@linuxfoundation.org>, kernel@pengutronix.de,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250422-feature_poe_port_prio-v9-0-417fc007572d@bootlin.com>
 <20250422-feature_poe_port_prio-v9-3-417fc007572d@bootlin.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250422-feature_poe_port_prio-v9-3-417fc007572d@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/22/25 4:56 PM, Kory Maincent wrote:
> +/* Convert interrupt events to 0xff to be aligned with the chan
> + * number.
> + */
> +static u8 tps23881_irq_export_chans_helper(u16 reg_val, u8 field_offset)
> +{
> +	u8 val;
> +
> +	val = (reg_val >> (4 + field_offset) & 0xf0) |
> +	      (reg_val >> field_offset & 0x0f);

I'm probably low on coffee but I don't see why the above could not be
replaced with:

	return reg_val >> field_offset;

(given that the return type is u8)

/P

