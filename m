Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7473BA24F
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 09:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780046553; cv=none; b=uwMgvj68NgtV1RwNE7DNoFv05zS4eUZ43xN6mbWu2K8CHNO1n2mVDJwgD3iUz24PiG9z7fTxE/9xBfNIlkOK88d8zovUrmoG5U22A/X7OXa/owpqZhpzfIvxZkfAwFUcAZ3OGjsaTNVDxWvxnvDmZv6we/11lEqYNrQYeXc3EeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780046553; c=relaxed/simple;
	bh=tmV9dJLMu0sRKJzLUgwpdlqw+ZSXnLB7bB+l1ToG4zk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/qBtgrEW7ztTVfJwxZFs7L4NIVbVLeiLQ04+HG8qkZ31ntwHjpXI7z0VECyYnB864JlIvKA1FYL+DV7vOfI8QEto2tzKAk0ADS5yZOdgrLpui3AqOHhK1MUiLq+EVQ5WXf6JRPQkjxZwNSjkfDEURjwG3FM6Ag6oABIkwBjw14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g4ybf+qK; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g4ybf+qK"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bd3d7c29b4dso1978447566b.2
        for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 02:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780046550; x=1780651350; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LPOdFtlxbAd+SCXAV1KKChh2WjDpaHhM9mfLcDgn5rk=;
        b=g4ybf+qKa1VTMJdBG9uYTFQcTV9+jntB3Uiw0Pkbsu/W0LqdY5Y0wWybT3NyYI+cXH
         3kEMpD/dbStEC8z0SOMbpW8Elu2J3/X4x+EvVGlY/Jef3tIayxKgb6r107VB+dZJnpE2
         tH1Ic6eWkWh2eJyL9L76OvVtoOPL9NT2g2uyNAdwS3qVG+mU5cgNllkfNhA0rBDMdk5Y
         ixelQYwrTHzvZwhtb5yY/NHop9umxe+JATUfe3QW95sk4fGkZODab8IplRPZHQS6nDvn
         GM2MeCKP42gtGevcYUTzUveyvRhctLZA8NnRiRLx+4Cul4bDHgHLSglgg4PWn1l9+It+
         q1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780046550; x=1780651350;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LPOdFtlxbAd+SCXAV1KKChh2WjDpaHhM9mfLcDgn5rk=;
        b=GMlxeTB3BtITQ5ONJ1nwo6ugjlOVfb5aCQnDqswsZ/CWObjJacL520eBKque3dNBi/
         cqUC+Szwud3oGw5l9ogS9pC1ArCDoDWvmzRar3YIqO2lHWMNAsKxs/M0zWN82ZXFvQ4D
         TEjbi1KLYwsf9U6v4kNbC/vmgCxsiCHs7QTX0VShvdXF4NEwkyeU2Ey+ctSWaJfmMjcj
         8DsIEVHNuvWw62RuPS2rJlZFs/a20AClw2EJHc17DTEE6yQb/YCYLlJ5eSOtKLzKjkN8
         W6WuhqcUmhtNYWqt/SSob6106r2O4zpSUqqa0KDIr1c697JQbQzzVHZr5hDDoLghRyB4
         YunQ==
X-Forwarded-Encrypted: i=1; AFNElJ+nGezlvVyAKvil7qCxJmN3ey1MQw6B/wHiDlIzsutMmr9uiaEN3zWzUuRxAZGJ0k8sdQ7lAASewK4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPNvimVBZEbWo87PY3O1+gHtoPGKrZcnBePT3iDLbog2b1xan3
	l3oCxmmG4E7og9NykLLpwiBZTGKEXt9XXGhS0rtGzg7HaPwZdPpbt5eR
X-Gm-Gg: Acq92OF7AMweQKDk49rM7cqIhauc3B0zkOB4GsLgJMHsNTIob2Mp4YaRaMXLYbrl55N
	VfZF6lgEdpuQttU5b1M0bK81bYGk1uiY7KpOih3tF5iTQAFYjqsY/LhzV2TkFdIZfEQI3wRLud7
	4nrdI8i6JXeFL7OV77qQJpkcOFpqkUR4g//duTP1/Uig2cZsJUsdWai0fsdiqe8mJIDM9aeLNV2
	SCrT1+7ZXnE07zhJZJZfLeeDqTAVhSWdKPg37JNztnQCW7vWnVyzYzz6kIHi9Y90PB9+94t2U6j
	AJ9XD0fOYi+jKc27BRS2zOwujqrY9sb6lriw6m82ZtWKL/RqFdAuctBl7bXqInQw+6VfH4Jug7d
	FmmvryEDuvz1csrVH8voPud8Prm1c+yNBCHqdtU0wjWI38X+vB0JORFfLul066r+3KTIjhp8O0V
	uCDigrf2Wslfp6XzVoYaxx2fM=
X-Received: by 2002:a17:907:2d29:b0:be3:a586:8b87 with SMTP id a640c23a62f3a-be9cf69ae25mr95650466b.42.1780046549756;
        Fri, 29 May 2026 02:22:29 -0700 (PDT)
Received: from nsa ([45.94.208.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-be9d27f49a9sm49646966b.10.2026.05.29.02.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 02:22:29 -0700 (PDT)
Date: Fri, 29 May 2026 10:23:26 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: "Pradhan, Sanman" <sanman.pradhan@hpe.com>, 
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>, 
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"Syed, Arif" <arif.syed@hpe.com>, Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX20860A
Message-ID: <ahla7zM8f3yFYnsv@nsa>
References: <20260528173424.87503-1-sanman.pradhan@hpe.com>
 <20260528173424.87503-2-sanman.pradhan@hpe.com>
 <20260528-paging-alfalfa-9c3837635192@spud>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260528-paging-alfalfa-9c3837635192@spud>

On Thu, May 28, 2026 at 06:41:31PM +0100, Conor Dooley wrote:
> On Thu, May 28, 2026 at 05:34:36PM +0000, Pradhan, Sanman wrote:
> > From: Sanman Pradhan <psanman@juniper.net>
> > 
> > Add devicetree binding documentation for the Analog Devices MAX20860A
> > step-down DC-DC switching regulator with PMBus interface.
> > 
> > Both "adi,max20860a" and "maxim,max20860a" compatible strings are
> > supported. The MAX20860A was originally manufactured by Maxim Integrated,
> > now part of Analog Devices.
> > 
> > Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> > ---
> > v2:
> >   - Added allOf regulator.yaml reference and unevaluatedProperties
> 
> >   - Added "maxim,max20860a" as alternative compatible
> 
> No, please delete this.
> I don't remember what the policy that ADI use for things that used to be
> maxim products, but just pick one compatible for this device. I have a
> feeling they want adi to always be used in these cases.

Yes, adi should be the prefix.

- Nuno Sá

> 
> pw-bot: changes-requested
> 
> > 
> >  .../bindings/hwmon/pmbus/adi,max20860a.yaml   | 47 ++++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,max20860a.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20860a.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20860a.yaml
> > new file mode 100644
> > index 000000000000..f7eeb30f11b3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20860a.yaml
> > @@ -0,0 +1,47 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/hwmon/pmbus/adi,max20860a.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Analog Devices MAX20860A Step-Down Converter
> > +
> > +maintainers:
> > +  - Sanman Pradhan <psanman@juniper.net>
> > +
> > +description: |
> > +  The MAX20860A is a fully integrated step-down DC-DC switching regulator
> > +  with PMBus interface for monitoring input/output voltage, output current
> > +  and temperature.
> > +
> > +  Datasheet: https://www.analog.com/en/products/max20860a.html
> > +
> > +allOf:
> > +  - $ref: /schemas/regulator/regulator.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - adi,max20860a
> > +      - maxim,max20860a
> 
> And for future reference, please use fallback compatibles when dealing
> with devices that have the same programming mode.
> 
> Cheers,
> Conor.


