Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0CE3E1204
	for <linux-doc@vger.kernel.org>; Thu,  9 Apr 2026 17:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775755015; cv=none; b=T2NFxryZQiIwTLnpX2/+y7NqiUsIlEzG2ysNl1ndWqmqf9LjiPmc4lXLseFTiHJRL4LQdAzf3lWKfIz5hdj13zwPZiAkbGl2+5GBVtPTcj9cL6hUb24WM99urDjrtCg1aYHM+1+Q9PfVX3J6Er/Ek3l642txByPz7dJsmJQYP5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775755015; c=relaxed/simple;
	bh=S60+iELf201hWfWsA0+5HzASsARSxTciNv62Lq5+S90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q86OSEAiKtqKREpGrO6l17VfrsNwXDe+qttHV701JPCJc19irOk4t1cCjzjy6vF8QZYBvKCOZwO/kb4vzH7bgmSUeuvqb0dJiX3q91C9xBAp1HMXt4CjadO3YXmuEXZvHUSZzMs+ZQUtW7HrQAD2v8N+6RIyRuzVT5Cdt3aOzqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ix9GuZZA; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ix9GuZZA"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1271195d2a7so321759c88.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Apr 2026 10:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775755011; x=1776359811; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OiUmxJypMk7dUgMF/8X+eU6lB0Kg/0QHff8vgI/w/kA=;
        b=Ix9GuZZA7oD3oe45n0dpQmNG+x2p3bO3hgebWxOV2WoySs6B/HLyE6lPOdXKM1guQQ
         /O31QDbYhoG+obtxcw03evTeIhKf2vU5JrIIsH3ylr6+RunTX9vpy5NCRAbgZwSIpp/S
         7jftrBtpowJOe9riVQ60YmAm4o8MBNkll0nXQSaDvYZ9Dks9RVCswpJNh69uNQWg5q37
         zfMGmpM1OMsSrCn2tU+iFMQ9X5gjw3DBc0MLFOzmkCCaLM4qbjjVHhdfAphEfet8yso9
         yrjwYi+No1UGdcvaX5/yv2aYpsEGlQVhs20REHeZWDCVsnDWKMBRiuPw86e02y/L0Cps
         WQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775755011; x=1776359811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OiUmxJypMk7dUgMF/8X+eU6lB0Kg/0QHff8vgI/w/kA=;
        b=OE8Qv6izA42RShWAqV/keSUsNYoA48ti/twu5xoC8acR0n6It+CENnTkQeRe+l4H2f
         yRlQxEvhAo9pDKPgRgKvjpxzxvoyFHOBZ9KiB10wKFph5l3PCYCZJJ6X3DxHfQ47NUDd
         WdcmcE2R9/9TW+h3sgHxwwktPPYkGLFGHl42CXZPXUSD1pR3Tq4hxnQl30klmBzMiZ1f
         CO2tO4UZ997k8nNGGey3uPbHpADO6EncOSmhX3s31XGurJq5BskbIbSCDETyoelDU2VX
         J3vi9vuNo6X2M/azSJXWj0tYDpKDr6EnBxZ2LMuM/ZQ+reCctRuwnsDxtcdVclkjR4+G
         k0Ww==
X-Forwarded-Encrypted: i=1; AJvYcCU7xdfG4ZAsPY+wdikbcfi3ro+cdSaaQpL2xHOPm0OCkZSwq91cBBgLLneGtOtC/E9CMVvPmejROSo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOjkswzYZY7CjVz3CovRYr0x8VL6lMJ6gFKTuFRWfcTSA8TB8S
	NBasCuRrLmtcSiKJs42vEGlL39unH5h/Sb7WarHrJcf5kLx2wR2F/57p
X-Gm-Gg: AeBDieuZ0B6H3JrviJGMcIbH2GwhgEh8XoAPfTQ8YlJ7sTGmJjNRurgui5DrVyA1fW1
	SoB4mfhQcMUH1F+i9AI/pTyrgRxcZhCf8rqlPikAE/0rQgDtYLJZsTlnQlf/kznUNmt9DOSffQ0
	2lISdKefmf8eT/lv1d+g8qpbnqTJ/2c4bOgSAJYMjyHLmvCCxyIh0J/xuRD/u1YnrqOEx7jMCK+
	He42WVzt8XxB/GDIYjcP8ncSkQ1y90PN3YpJxGCFuuqRlQkUgjYYw7Ath+/UGokGt7Sj7NH7XVS
	Lge28d3W0fT5KUBd2SQa7EwOSCX+N30uVo0c0wddbgMyCfNG7nuFQxaJHfdzg38I7c7x/QWbtd5
	LpMyvRpqPNEqRkgxbk8ePFriosFaGUQgcdPAKxLCq/enWadp4w90z0rpwRK4VCxL81zuYI5TmjB
	VEmT42kO15r80ryQFcY3Gqp88Q172+T+IwQ5cFgKFt2FkICKCv/+o5aFY7wa8Q4SDr
X-Received: by 2002:a05:693c:2b17:b0:2c3:5dc0:a06b with SMTP id 5a478bee46e88-2d40defc97fmr3118618eec.20.1775755011019;
        Thu, 09 Apr 2026 10:16:51 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:12ff:7738:6560:2618])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55ff826dcsm484882eec.13.2026.04.09.10.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 10:16:50 -0700 (PDT)
Date: Thu, 9 Apr 2026 10:16:46 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jingyuan Liang <jingyliang@chromium.org>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, devicetree@vger.kernel.org, hbarnor@chromium.org, 
	tfiga@chromium.org, Dmitry Antipov <dmanti@microsoft.com>, 
	Jarrett Schultz <jaschultz@microsoft.com>
Subject: Re: [PATCH v3 09/11] dt-bindings: input: Document hid-over-spi DT
 schema
Message-ID: <adfdkwq_bF9dirAq@google.com>
References: <20260402-send-upstream-v3-0-6091c458d357@chromium.org>
 <20260402-send-upstream-v3-9-6091c458d357@chromium.org>
 <20260409-defuse-thank-4b038128fac5@spud>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-defuse-thank-4b038128fac5@spud>

On Thu, Apr 09, 2026 at 05:02:11PM +0100, Conor Dooley wrote:
> On Thu, Apr 02, 2026 at 01:59:46AM +0000, Jingyuan Liang wrote:
> > Documentation describes the required and optional properties for
> > implementing Device Tree for a Microsoft G6 Touch Digitizer that
> > supports HID over SPI Protocol 1.0 specification.
> > 
> > The properties are common to HID over SPI.
> > 
> > Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
> > Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>
> > Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
> > ---
> >  .../devicetree/bindings/input/hid-over-spi.yaml    | 126 +++++++++++++++++++++
> >  1 file changed, 126 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/input/hid-over-spi.yaml b/Documentation/devicetree/bindings/input/hid-over-spi.yaml
> > new file mode 100644
> > index 000000000000..d1b0a2e26c32
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/hid-over-spi.yaml
> > @@ -0,0 +1,126 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/input/hid-over-spi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: HID over SPI Devices
> > +
> > +maintainers:
> > +  - Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > +  - Jiri Kosina <jkosina@suse.cz>
> 
> Why them and not you, the developers of the series?
> 
> > +
> > +description: |+
> > +  HID over SPI provides support for various Human Interface Devices over the
> > +  SPI bus. These devices can be for example touchpads, keyboards, touch screens
> > +  or sensors.
> > +
> > +  The specification has been written by Microsoft and is currently available
> > +  here: https://www.microsoft.com/en-us/download/details.aspx?id=103325
> > +
> > +  If this binding is used, the kernel module spi-hid will handle the
> > +  communication with the device and the generic hid core layer will handle the
> > +  protocol.
> 
> This is not relevant to the binding, please remove it.
> 
> > +
> > +allOf:
> > +  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - microsoft,g6-touch-digitizer
> > +          - const: hid-over-spi
> > +      - description: Just "hid-over-spi" alone is allowed, but not recommended.
> > +        const: hid-over-spi
> 
> Why is it allowed but not recommended? Seems to me like we should
> require device-specific compatibles.

Why would we want to change the driver code to add a new compatible each
time a vendor decides to create a chip that is fully hid-spi-protocol
compliant? Or is the plan to still allow "hid-over-spi" fallback but
require device-specific compatible that will be ignored unless there is
device-specific quirk needed?

> 
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +    description:
> > +      GPIO specifier for the digitizer's reset pin (active low). The line must
> > +      be flagged with GPIO_ACTIVE_LOW.
> > +
> > +  vdd-supply:
> > +    description:
> > +      Regulator for the VDD supply voltage.
> > +
> > +  input-report-header-address:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 0xffffff
> > +    description:
> > +      A value to be included in the Read Approval packet, listing an address of
> > +      the input report header to be put on the SPI bus. This address has 24
> > +      bits.
> > +
> > +  input-report-body-address:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 0xffffff
> > +    description:
> > +      A value to be included in the Read Approval packet, listing an address of
> > +      the input report body to be put on the SPI bus. This address has 24 bits.
> > +
> > +  output-report-address:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 0xffffff
> > +    description:
> > +      A value to be included in the Output Report sent by the host, listing an
> > +      address where the output report on the SPI bus is to be written to. This
> > +      address has 24 bits.
> > +
> > +  read-opcode:
> > +    $ref: /schemas/types.yaml#/definitions/uint8
> > +    description:
> > +      Value to be used in Read Approval packets. 1 byte.
> > +
> > +  write-opcode:
> > +    $ref: /schemas/types.yaml#/definitions/uint8
> > +    description:
> > +      Value to be used in Write Approval packets. 1 byte.
> 
> Why can none of these things be determined from the device's compatible?
> On the surface, they like the kinds of things that could/should be.

Why would we want to keep tables of these values in the kernel and again
have to update the driver for each new chip? It also probably
firmware-dependent.

Thanks.

-- 
Dmitry
