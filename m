Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187B1259CB3
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 14:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752503837; cv=none; b=Kgmhq4PNuyAeVwdvN3c3iEVWw4+FyheLApbBxKkYD70BuKM2hLXsvDz+KY5QhUz9cQl7T6wFQwhVDbB43RzTEwOspyMrM9JO7mSkanWJudDcbigp8OPSW6UBHOXLTsdAn/oKEWGodJB84w3PDt91JbrIW7kziq4lXj249GnSgQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752503837; c=relaxed/simple;
	bh=TRcpibRTLH9cseWylS1uM49SbJnEmrei1lux8cE11sE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NPyysjFwl3dQ4DMEXvIN/EnsPoiS6PLFU1TwBKBdYydHYs/JWunyR87y84UFkuP3FZhlh/xrf0MG9n4BZzLVuT02buCirsy3RNLP6k7D1bo4zTZedrwiYg0F7BiqRRyyG+fUD+XQPGWiT7TP6KN24D8NxvpmMIo86o5CDwx/fV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YFAjWZJb; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YFAjWZJb"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3139027b825so3451934a91.0
        for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 07:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752503835; x=1753108635; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lRw/NX+KklOoltNcYQ1FFnx+QWAS9ZeWaLliEu+hd3U=;
        b=YFAjWZJbri7WyStVubAZWla8N4Qz/VXHOrXjyK0c8J0cea6UfqQ8y6wpuWvtZBYnTC
         xVgEiM2vWxUaKWRZPvSGPUu+E201rEd/iyEBqAjvq7fH6nwLU3s028J0exf2/mG3L8f+
         8wS6QxGHV+rxRHDTO4ehhopMaHGEUumEEgIyfnYSz8JBLmzF6ikeVPp6jgpw2I9xWZ5N
         UP5dRTzCKjYQ4QosLPc2cjAHlptuaOQatTtbr4EmN9qSipOheaNOkXTHAdJKD9M/7zL9
         mpaEqnj25guZVZjp2QFzplYmU4EOGXBY8z9lFyW2Oi0t1CxlIiLYwOUOP1YLWL+I5rLa
         jtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752503835; x=1753108635;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lRw/NX+KklOoltNcYQ1FFnx+QWAS9ZeWaLliEu+hd3U=;
        b=c7WvW7wjIrYu9hDG9UaGX0ZcVsqd2ctFqFRIXftBKi3oA9j/C+Pp2skItM0S+huCY/
         YtOg8oWUwyI2N/ipVuCJctHn3Gl8s/ozcfskYqHh5fvU3OKhPKGZMR3dhXVfS6yolghB
         C9TVIASqLV4ZhupLyZLx2PDmHJ4KmG+YAb9SzTeskCpgWUjnxvdFFk6KzPzX7R6Zwyq6
         t0QltQw9e//IBYBKa5c/vUCXxRU6q7MbHcgRIpOCov7vF54DKg/2u40n3ayYJc2f3bBT
         nJDbO70teOIyiVqrHbgMel/u2Y7pXRYn6aygdE8dnAaYsfGyhVP8hYsuT3hW3Y6GiYXX
         bdww==
X-Gm-Message-State: AOJu0Yxf0waX6AnbFoKevahmOXg4aoqYSUjJpgbe7Dhmi4kwpnP8BQhO
	iGdszE14NtKHKk1lW9zGuhjAW4B4D9xLQhjpGmuxIdXQpBI8Ln5up2fxz5d6pTwGpxAFFXU6Uyg
	OKfVHkr/aDsrVX4Ut1pXbULnoYYC8w9eucttJd6VGPA==
X-Gm-Gg: ASbGnctLRR+AXJrOU8OtA20XJ02K7Y7lYDtAOvgZ8z7Fhal33LvZHxmc3lWE8ZnXghy
	ZMDMl9uCC++bMNyLSDkZQWkJjZU4EntYXzx+LF5PXyhqglyM6y8k5wo2TzdZDrm7MOLp1oTvx9Z
	9lakKlSn9ZB+17iW0HYJv7lzXSndqiZHUnKpd0jypFW9DnHGwfU6t4VZ/apU9dbvWxgmxnhZZe7
	eiqnVqOgzMQLfhWi0Y=
X-Google-Smtp-Source: AGHT+IE9vli31u992ZT8kPqLb073rl0Qa9Fp1wDpRWfD+6c5waYC0lIxt4DAIY775EghGpjiJXOpIWCdhZUB6c4WwNM=
X-Received: by 2002:a17:90b:1643:b0:311:9c9a:58d7 with SMTP id
 98e67ed59e1d1-31c4ccdcce7mr20175039a91.19.1752503835123; Mon, 14 Jul 2025
 07:37:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624181320.2810521-1-raymond.mao@linaro.org> <20250710005821.GA94507-robh@kernel.org>
In-Reply-To: <20250710005821.GA94507-robh@kernel.org>
From: Raymond Mao <raymond.mao@linaro.org>
Date: Mon, 14 Jul 2025 10:37:03 -0400
X-Gm-Features: Ac12FXwMK2ygdSLWZAPAf0rvYVKKrh58aGskfqls54bumEBc4Dr9Mohtz6UOLQI
Message-ID: <CAEfUkUKXskNxdsFG0htpmcgNnVeau7n4wtH2FOweEW7BxC3scA@mail.gmail.com>
Subject: Re: [PATCH] docs: devicetree: overlay-notes: recommend top-level
 compatible in DTSO
To: Rob Herring <robh@kernel.org>
Cc: linux-doc@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Wed, 9 Jul 2025 at 20:58, Rob Herring <robh@kernel.org> wrote:
>
> +devicetree-spec (because linux-doc doesn't really care)
>
> On Tue, Jun 24, 2025 at 11:13:20AM -0700, Raymond Mao wrote:
> > When managing multiple base device trees and overlays in a structured
> > way (e.g. bundled in firmware or tools), it is helpful to identify the
> > intended target base DT for each overlay, which can be done via a
> > top-level compatible string in the overlay.
>
> I think this should be more general and more specific at the same time.
>
> You might not want to match on a top-level board/soc compatible, but
> rather the compatible for a specific node. For example, you may have an
> overlay for a cape, hat, etc. that applies to a connector node and that
> connector node could be on any number of boards or even multiple
> connectors on 1 board. That's all under development, but so far in those
> cases we expect some sort of connector driver to apply the overlays. But
> I think you could have the same issue of identifying which overlay files
> are relevant. I don't think folks working on add-on boards have thought
> that far ahead.
>

The use case from the angle of a specific driver might be a completely
different scenario.
The motivation of this patch is to support handing over DTOs as
transfer entries across different boot stages via transfer list.
Unlike for a specific driver, a DTO within a transfer entry is usually
board-leveled and contains nodes for more than one driver.
The transfer list library in each boot stage does not have knowledge
on a single specific driver and which target base should be applied is
the only interest.
That is the common DTO use case in Firmware Handoff and why we need
the top-level compatible to be introduced.
For details, please see my PR for the Firmware Handoff spec update to
support DTO as transfer entries at:
https://github.com/FirmwareHandoff/firmware_handoff/pull/74

> And since we don't know the target-path up front, it is just left blank
> so far. It would be better if we expressed *something*. Perhaps
> 'target-compatible'? Something like that would work in your case I
> think.
>
> You'd have to be somewhat crazy, but you can bundle a bunch of
> mutually-exclusive or unrelated overlays within a single overlay file. I
> don't know that we want to prevent doing that. Someone might come up
> with some not crazy reason to do that...
>
> >
> > This patch updates the document with a note and example for this
> > practice.
> >
> > Signed-off-by: Raymond Mao <raymond.mao@linaro.org>
> > ---
> >  Documentation/devicetree/overlay-notes.rst | 28 ++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >
> > diff --git a/Documentation/devicetree/overlay-notes.rst b/Documentation/devicetree/overlay-notes.rst
> > index 35e79242af9a..30b142d1b2ee 100644
> > --- a/Documentation/devicetree/overlay-notes.rst
> > +++ b/Documentation/devicetree/overlay-notes.rst
> > @@ -103,6 +103,34 @@ The above bar.dtso example modified to use target path syntax is::
> >      ---- bar.dtso --------------------------------------------------------------
> >
> >
> > +Overlay identification
> > +----------------------
> > +
> > +When managing overlays dynamically or bundling multiple base device trees
> > +and overlays in a single system (e.g., in firmware, initramfs, or user-space
> > +tools), it becomes important to associate each overlay with its intended
> > +target base DT.
> > +
> > +To support this, overlays should include the top-level compatible string
> > +from its base DT.
>
> The base has multiple compatible strings, so which one? Has to match on
> any one or all of them?

Match only with base's top-level compatible, see above for the
explanation of the use case.

Regards,
Raymond

>
> > +This enables higher-level software or firmware to identify which base DT
> > +an overlay is compatible with and apply it accordingly.
> > +
> > +Example usage::
> > +
> > +    ---- bar.dtso - overlay with top-level compatible string -------------------
> > +     /dts-v1/;
> > +     /plugin/;
> > +     compatible = "corp,foo";
> > +
> > +     ...
> > +    ---- bar.dtso --------------------------------------------------------------
> > +
> > +This top-level compatible string is not required by the kernel overlay
> > +mechanism itself, but it is strongly recommended for managing overlays in
> > +scalable systems.
> > +
> > +
> >  Overlay in-kernel API
> >  --------------------------------
> >
> > --
> > 2.25.1
> >
