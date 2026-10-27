Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793122368;
	b=tUWWgJEKdNdXTxJpx0cwgNPdn9iwr8btaVqFOX180ZTPkfeiLAeevIKJ8IhnxJ1qCUhu
	 +a/P3EKCYJYKfIdTXo7PJhf3JIlZc4jbvqJ/jXrHxJ3R96aw7azjeOlcVy0/mpiwM1CNs
	 /nHXh9dWYI6YjnxQmo+tgzDW2Kj/L4MyiXUXxkQDTDBxBxkH5wGtlYmtsfa1RlcepdozR
	 +bRY/y0jDZlh+Ph35yw4BffiFbQoE2WmDT/Yr5k20KizKS1a4KcCU9nGiOKAcFnBfuzWs
	 k9lxbCki5Q1pvWps1tX5DPcIpHSveWRcycZCZOHw5yJ+kXHV1up6G4twDyGMZ7hlTFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793122368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=T7vpIX2c6I0fdln2Veyf9JYdJ3RICzbnThdpI2zJVAY=;
	b=UELCs7KotUiLsjqAy/KhB4K0OYeMZfq6kt92tbROONJVJQtwl7sMt0e4MRxNlcOm4xKL
	 Jq0zFiZCIn1rMlBPM6sH2axjyb5GiVEAxLdHMtu619q5cQzWPfgO86OW6XJ1oufpBkKqv
	 utm225KQ3SJHCsCO0VqKlWeCxSvZ1dnDYQrgkCPSwfyb5A22yfDxYqOoRt0wlrMwAOft3
	 sZQLF+Zwv6kjCOBPdKI/lzr0jXJMXfpvXYgx8YdGXaWU1pBI8ypahCno+mcLSl5M0lAFP
	 N7iNli1O7c/D4isXG9n5P0lNSNpcvfDF3+mSu+bgbelx+SGHzR9sqh0DP3usYtNMGSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IERQJ8SK;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B5B606A31E
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 17:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28B5B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IERQJ8SK
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so881945e9.3
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 10:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793122366; x=1793727166; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T7vpIX2c6I0fdln2Veyf9JYdJ3RICzbnThdpI2zJVAY=;
        b=IERQJ8SKVi7acDhRQssNKz1tac/IbKaQ1f3zM2O6OFxp7pR62BajqEQCEG9JaHuJ0M
         nQcwhrNTXW9RxyhteLIPA9LNKH3J8QG6lRhv0OL4TUC+apZBNfnCpD+BF0HWr/VmHLKj
         QLLQFq36t5Dn2Lbi3bALdp6V6iWGR0HV+f1uumVypHlLGv2yedaXHJ1JnI/oj9ZLGnjq
         QVjST8/BTNTCaXMtA8cSAV1xFORYJbiv1UzZNmsysoTn46/NG8HHUwfmp1BBp1TrWO6S
         RsL0VSK+XetFWxWIQrF+txjov/HPcyrMrdiw0sWqufM1K3ER+n4eY4ikpmfRoDWv53YC
         TSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793122366; x=1793727166;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T7vpIX2c6I0fdln2Veyf9JYdJ3RICzbnThdpI2zJVAY=;
        b=ce17UZTq/WWxIUfjJMx9T7Gy1SPggPTPfc4kDlWJhPCFt+u2XF9U2S2KVgGsa2eWhJ
         ZBWcYDW3iHkZruqdavWHNdTyPCYN44gAUX7MzV60GiAbFArJpCTQEZ9cZl/yi2vggLGp
         LO75vyxnwlPIyulfngJvhr/Y9v9SVk/fhiudeLKv2BJJtjvsN1n5dHNeAg6BqrVYbKbS
         zVVaXG+QcPv6UfWz3hvxbf5TPyqYmHhXB8qHVg1Nso00TykNwDiFZuxKw6YtaIXUY88c
         dowAFwslsLPTMWymiJHXpKZjgt0IAlwkb7GaCnzyR5kyhrW1cVP0I5b7u3f68etWcWFw
         /LBA==
X-Forwarded-Encrypted: i=1; AKwUvBzczVu5I3iW69CMMDEQmx9JAbOS5QRvfcsJrriz+SfTkcQcr5w9RsMDw1MJOi3Qgfwyoy2k1e5QDYk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+5h4afyK3RG1RsUuUS8QS/2IXkVvcyTA8XoXndKAxrDQTmicH
	034Zr0WVgPRmtwLoTVgRLkxYYf4fUZnS/I9/N6YbKnXs+iiiCmI3Hzj1Ix4xNW8gOzc=
X-Gm-Gg: AYBFou0e9yG61Y4k6nXZgFANlyrRMJj0LMV3KF4FflahdgbkaxH6uVVRhZpQ7gJ6DBs
	WVdJqGlhbYlAj7c6T9PJdQ/q2meS3Dv2hp8jvBGGZowSOBAKAAz8zdNDKeGuTmHwRNuBhoXYXR8
	EVcwEbkuHLjD7GzWMOUL7wmsn7iJPe9Nzi7Wmy7X6+5rLLrF7pD6xSSzi0Dwndq77tGRyPlZy8l
	/mOBYFH3rVNdDi6Hjb+nIlH2ByjE/kn/25IepqWl5/kyT432zn1FVmAQEJqSRMaMgKjzuttM0hd
	9vp7McDUAdZ71/OMKNSNW08CuIR6IG5GoNHt0xsJQ3AS4FtgfeopncaYSwhlixg9y2w9KHYWv/C
	u85zxf5/iftobw3roEXEnxwO39PX4IOVotkEGMUcbCFi6y7BQcQD69nYaBPcQPK89Gre45FevRK
	ks5bVKdFsbK4+CmTp4V5WKsCNppL8FAko+MKK3LimeYauTvoONfK8YwrojJuT5AYvJqsncTzGmU
	jMz2aeQXaU+rmdnO7t59tEZHyndXocybkAkiC444RGptC9ivobOJiQ=
X-Received: by 2002:a05:600c:4ece:b0:4a1:fbd2:f689 with SMTP id 5b1f17b1804b1-4a35ac9d100mr198532065e9.7.1793122366508;
        Tue, 27 Oct 2026 10:32:46 -0700 (PDT)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a92b881f90sm5173585e9.11.2026.10.27.10.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 10:32:45 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 27 Oct 2026 18:36:37 +0100
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-pwm@vger.kernel.org,
	Gary Guo <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH RFC 3/4] hwmon: Add driver for Raspberry Pi RP1 fan
 tachometer
Message-ID: <auDhJbMOQ-qAeBBs@apocalypse>
References: <cover.1792748690.git.andrea.porta@suse.com>
 <0d2249a66732bfce38a2260bee08cd1ba4097e51.1792748690.git.andrea.porta@suse.com>
 <auDRHk8eaYife2zH@monoceros>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auDRHk8eaYife2zH@monoceros>

Hi Uwe,

On 17:32 Tue 27 Oct     , Uwe Kleine-König wrote:
> Hello,
> 
> On Fri, Oct 23, 2026 at 12:15:56PM +0200, Andrea della Porta wrote:
> > Add a hardware monitoring driver to support the fan tachometer on the
> > Raspberry Pi RP1 southbridge, found on the Raspberry Pi 5.
> > 
> > The RP1 PWM controller block contains specific MMIO registers that hold
> > the current fan speed in RPM. These registers are periodically updated by
> > the RP1 internal firmware based on the tachometer pulses.
> > 
> > Since the Linux PWM subsystem does not currently offer a framework for
> > exposing integrated hardware tachometer readings, this driver is
> > implemented as a standalone hwmon device. It parses the
> > 'raspberrypi,pwm-tachometer' DT property to find the supplier PWM device,
> > establishes a device link to ensure proper lifecycle management, and uses
> > RP1-specific PWM functions to retrieve the RPM values.
> 
> I wonder if the tachometer readout should be a counter driver? That
> would allow this driver to not be specific to the RP1 hardware.

I suspect the counter driver won't work with userspace daemons (e.g.
fancontrol) which use hwmon as an interface.
OTOH this driver is indeed specific to the RP1 driver: the fan rpm are
read from the same registers range and hw of teh PWM controller.

Regards,
Andrea 

> 
> Best regards
> Uwe


