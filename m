Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA600362157
	for <linux-doc@vger.kernel.org>; Sat, 22 Aug 2026 18:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787423602; cv=pass; b=Lnto7VVzyn60AqED3iczfpe9hyf/3QPC2kruelctrCxIwzJk3eH8zFYERaYLbzqPRC33X9zbb2SdWaITvdOcoYqNouhdG0aR0lJHRiGZId94oEOz92FTqGYPvqKoBiY4k8J80BH7X572Cw2Fqd1qU+Er89qFkYsGdsCcpdzt0FM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787423602; c=relaxed/simple;
	bh=R9FV2HxucpilWHyhzkBkCHkgZ1FDOT/C59w828bmyvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mc1lkagTpQOOGuD7bqEKRjzmaDQ0DXKUoI4PSS4iSowMvoS8HBUmNLIiyZ9gViaCQBAtMytRGTqaRT8Eh7IV/2NQPNYwWbBGR920NxHg2Kl7K6JmCKcgV+BV4PA0h6S0r5K38N77WQ2/8D3jQoIp1efaKYqdut9ycVCst0B2R34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bIFWdCkh; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bIFWdCkh"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d5655cc850so25656345ad.3
        for <linux-doc@vger.kernel.org>; Sat, 22 Aug 2026 11:33:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787423598; cv=none;
        d=google.com; s=arc-20260327;
        b=MNBBMhMoEfx7yHdyZUDyFspjKjAjmlyTdObBMhdfmkfq5bxiGyviYDB+oZn+p/BMFK
         /YZzx8qJTSynk6JHFPtKnAD2q1nQ5FFCfUPuSPSFBSI64GJ3/WwtjdcCfYjTyG+LaSOV
         YcYsw4noLHS02Vew1f5NHIep7MJP91P11kfCojGXQHWoxh/mzQ67fPo1B3po8Lsec34C
         496YFzuhe30DJrwept2MhRTbsLVJu9thSHwHFzPv+D+oBUfkfKAVcZdvQlQEeksiOxhx
         mRsGX2i1TUA+EScKknYz2CnWg/lSmzMLmysSj1/iqSzQZyUbGJ8kLkyW8nmutndhgzLH
         os2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xLeowlHbnVdnW8myVY1gYicbBcUAa0KA4FLMPva2FLw=;
        fh=bBk4q+UTfyTN2NJRQEPmD1EAVKqkh2jTe5414h2D3Zo=;
        b=Rw8frwLPBnchNI2tXCRQXen5IkTlVGIFzIUYvUFsYPzxyv3+l4uppAiSDcqNqpxVV4
         nhKKN5fJM44EGEJUk9LdV1cftBfyYsAsXyF51bBeQykRH5uKMPAraE1KzKecJRMW33Q9
         hq3/Fn131Fkqvg20RGDaxb040FZgn+pDBTk4HQZGjznYxLlhhTGKYmUb5z6yuB2eEmU6
         256sV271JpLQJHRdAtuibViaJCs0PRUQlB70uFxLdByeQj7HVFX7nPuljutDSwRU0iWU
         8tna099kOFRhhKrwGEeEEHn2t1ozdt5Nx0WSXg1Id3TA59YnDcVGC4bC2pozgHWbEuBf
         WnmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787423598; x=1788028398; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xLeowlHbnVdnW8myVY1gYicbBcUAa0KA4FLMPva2FLw=;
        b=bIFWdCkh7vqUMhnBrmm/V4n1Qk6U6u4Dy+0wpsb6ATkO6IeL9i+7mV7MOH6rIeioXs
         rZUfSp7clDfVa2qCSKxkYkxLj2sVq8R0JhJ7JT+dAOHry2NFqQs9+PckamqyZibOl2wr
         nZXx1P6QoxM7vJvRKNaIoZQ1FO20H4CXusbMM6rR/BOU2xVOIsFv+0qNCXsnZsJWSln/
         +IS34de7sbf3WcjczTJ17t6CIjBM7FO/JPy+PzW/UHgNEJ/DmKlNyodEDJ2zVed/TKMy
         Wv5tqI2BozmpEYTJlWSVy7aSSUghnSlZYkJyoC1JgMyMId8zAekw07koDpnVsSryzdvn
         o71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787423598; x=1788028398;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xLeowlHbnVdnW8myVY1gYicbBcUAa0KA4FLMPva2FLw=;
        b=sQI0lj8P0bGYJyxiqbAgmGd0v9vuqm2/NDgo4dGXXYzVjcQsNsuIR5QKvqbYjGsS4W
         tclYKaJXuJqeA65bfF8+urp5TYCDwfctFlqcsVnauJF9g1pUlLbnoCFG4HVGMMAhvzBY
         jCHscEWyRntUZApUA/Osm0vsF5HwK+5Y/SWunCwRUkJsi2zfonLjzmirAShyL8/u6rzF
         i13g4XwF4KgfOrvPp/aWaZPQ04kKGUA/svjysi4VRK+XGZqFNmgSQenfszsHS9dZkyFU
         NI9r2/dYbopJmLXIHvWKkn+bHxKL2qF5xW/XI/H5bpNr0FX9r45nllvAzWaXnJKVfV3/
         102A==
X-Forwarded-Encrypted: i=1; AHgh+RpKfY5xjn4zb7/OxNCDIX+UHtgeLEAbMyTocDR09LVcO+J53hcIUgvZv08CMXk4rSs1DfQNYv+IVi0=@vger.kernel.org
X-Gm-Message-State: AFuF++kQcfkF+slKZX0oPCgKyU7Se8NLAJ7FS5aSK5E6WcqkxYUEDLAJ
	3p/b+2+ePpFr5k9KABGTMmwnQ/INFvdA5wbSl3LI8dfDyFuOD5/Um094bCPlKfUUA6kSTY7XLr2
	ZHt4reGxPdEPMd4z4ajPVjrybVc8vmy0=
X-Gm-Gg: AR+sD125BagYoQbo5DLNi5ixF1oxtC8M6yyqh4/zGcLDF7J4zs8TqXL5buKQyoMegHU
	MXsL+Rq04xyl7hQo0PpzZQAKnvRyD3cLpgKNP+HV22MaXMbpBbs3aEKHHZ4ooufLx0ToGjMAEf9
	a0aNaL/ac834g39emm+rhVzD6kuCXRJEAuXzM/92vH9stap1tUE3+9M/CxKLWRyXxnzTtDMIsu4
	7qbc7+PJQqXUA0UEmeQY/24ak83V0rmxfStePQoWA7i+ebcR4jDp035olA4aqqXbpfpD/YzzEDg
	hOI3wGH2m4r4+YXeIlveWVX17oSNsb1OmMzVmv1ztWBybti9SYdRgvBrDyyU4H5Dp8P8/FVeaZI
	H0dvn0QO6WjWCNZbqZZLfJ5df2Mw0kOjJnzRV9XrYiYORo8IAesyyD9Qxtk68qPyLnUIYrl+xU/
	wn9AkQ7TlKNGs=
X-Received: by 2002:a17:903:2bcb:b0:2ca:e5c:7fcf with SMTP id
 d9443c01a7336-2d64adaa1a2mr290285015ad.3.1787423598054; Sat, 22 Aug 2026
 11:33:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821214728.87773-1-mradityadash@gmail.com>
In-Reply-To: <20260821214728.87773-1-mradityadash@gmail.com>
From: Antheas Kapenekakis <kapenekakis@gmail.com>
Date: Sat, 22 Aug 2026 20:33:06 +0200
X-Gm-Features: AcwNN1VvGTJYj-FylegLqCK5oqlHT-UH52VShrmWTvXb4QcYz5Oy3GWhPKG-uaU
Message-ID: <CAGwozwFxiKjWAwOo6CjeAPKozDo80Jj6yNBv6Q=-ouBdWc0+ew@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] platform/x86: lenovo: Add Legion Go fan controls
To: Aditya Dash <mradityadash@gmail.com>
Cc: "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, Guenter Roeck <linux@roeck-us.net>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Aug 2026 at 23:47, Aditya Dash <mradityadash@gmail.com> wrote:
>
> Capability Data does not cover all fan controls on the Legion Go. Full
> Speed uses a separate Other Mode feature, some firmware exposes an RPM
> reading that Capability Data does not advertise, and the custom fan table
> uses a separate Fan Method WMI interface.
>
> Patches 1 and 2 add Full Speed and the RPM fallback to the existing HWMON
> device. Patch 3 adds a Fan Method driver and attaches the ten curve points
> to that device when both WMI interfaces belong to the same provider. Other
> Mode continues to work without Fan Method.
>
> The open question is how the firmware control range should map to HWMON.
> On the tested Legion Go 8APU1, values from 0 through 115 produce the
> observable fan response and correspond to Lenovo's 0 through 115 percent
> range. Lenovo software shows 0 through 100 percent to the user, and 115
> reaches the RPM observed in Full Speed mode. Firmware accepts values
> through 255, but no RPM increase was observed above 115.
>
> This series keeps the native values unchanged and exposes the fixed
> temperatures as read-only automatic points. Should the driver map the
> effective 0 through 115 range to the standard HWMON 0 through 255 scale,
> or keep the native firmware values unchanged?

Hi Aditya,
I actually wrote a similar driver for my downstream use that I do not
have time to upstream over the next two to three months, so it's fine
by me to pass the torch to you. I will leave some comments on your RFC
because in some ways it is overly complicated, and we can streamline
things so this merges quicker. You do do something I did not, which is
implement RPM speed. The device I tested had the bug you noticed and
fix on your second patch, so I skipped it for brevity.

As far as the series goes, I'd rather you do a standard 100->255 map,
and clip values on the way back from 115 to 100 and then scale to 255
(ie do not emit an error). Yes, technically the legion go can go up to
115, but this is undocumented behavior and will look weird on a UI
(100% will be 115% in Windows), and because of the extra quirk
handling that will have to be done to cover that. Since a full fan
speed button exists, this is recoverable functionality anyway.

IMO from V2 onwards, it's ok to drop the RFC marker, your current
series does not propose something too extraordinary.

Antheas

> Aditya Dash (3):
>   platform/x86: lenovo-wmi-other: Add Legion Go Full Speed control
>   platform/x86: lenovo-wmi-other: Add Legion Go fan RPM fallback
>   platform/x86: lenovo: Add Legion Go Fan Method curve driver
>
>  .../wmi/devices/lenovo-wmi-fan-method.rst     |  34 ++
>  .../wmi/devices/lenovo-wmi-other.rst          |  14 +
>  MAINTAINERS                                   |   1 +
>  drivers/platform/x86/lenovo/Kconfig           |  11 +
>  drivers/platform/x86/lenovo/Makefile          |   1 +
>  drivers/platform/x86/lenovo/wmi-fan-method.c  | 380 ++++++++++++++++++
>  drivers/platform/x86/lenovo/wmi-other.c       | 215 +++++++++-
>  7 files changed, 649 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/wmi/devices/lenovo-wmi-fan-method.rst
>  create mode 100644 drivers/platform/x86/lenovo/wmi-fan-method.c
>
>
> base-commit: aca39607c1734ed976fdd65deb75b3555a5a0326
> --
> 2.55.0
>
