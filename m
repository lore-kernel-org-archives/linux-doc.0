Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EE628C5CB
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 13:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284107; cv=none; b=t7GBqbQ0UyyKLF0iIEFGVU7Nbrq8RX23qI3HRA3eXzFr6uwSZunKDi+O0cazyk/Qrvr3GtptufHfEKFPa+hovWPX06pKFE13WI7ODEfJ5J9FoAX0HKKdUOM1E+CEq+i+oubyex9EbSA4wZckUOIuku/GsLS0AijVcbUaYQy/Jmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284107; c=relaxed/simple;
	bh=bfqcKJwJVsdxU+OsVIOUxblylyC49hP5UPV2edFxfIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSFl6ULIu9pysVCOH7m44dmwrVqCUAk/sdd3bJL2ebR1WSXbxxWU6NM52eTtNFzwKHHC0Cbuyg8+6O3YkZtqcjpoiUIwsnSblwe9qxnsT1s+PrZliOQSc3NGJ07zNJ3q8kN4daIojqRwLawZSB3DRAlflq3Jr8h5kfcyEZbJm4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Msvu5ilP; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Msvu5ilP"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12ddbe104ccso3423285c88.0
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 06:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779284105; x=1779888905; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJO8l0QRuWP0pFrbvTYkzMC6Ke3KuvPS+wOCBatPTaY=;
        b=Msvu5ilPE+FxELZ1RI4irrTVc5wM3s/dKXqpYL124+GtiMDOtUdxz0om2aVpUuV6Pe
         F38z9W8CI9QAytpkHObnVOiIKU7T5ocV8St1j4k8VpQFAI2m2wxonoE6PrKdiWQH8zLt
         B1ZKhdLixDa6pSPQfnGzxRxdeZKLMnb3reuLyRz2ISFmPFG28v8E2PLAaAZHmZ+qGJrr
         3BjY6ftHFnoG6zWsaJ6b8041CW6X5BCowcQxrCPJFj2dn8RrWPQcylYKPR11A3zLCa9Z
         VUjy9VI03E/afeL+5bzg2uqx/KEqd5Ks0jb6mGftIw07T6cOiiYPH+w9OKrQMRFwW+G+
         BYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284105; x=1779888905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kJO8l0QRuWP0pFrbvTYkzMC6Ke3KuvPS+wOCBatPTaY=;
        b=n8J5TsEYAXBUsMfAjjNaHkW5o9K7N5tV3w7GkdAqi/AzKuBVaR35eyn6CWHq/MjGmI
         5gQp7JvN4eeTIXENhRDNvD+OtmOe/qs2gS8yINTe6CXnoNEAt/r9jGHlmwsMzt90wWet
         XRZkqbzaxbGYFnV3aqokPm70+A8B4pBYHq3pO0DlYiw9FfjFPac0t92m9YT8UG7Cp1eD
         hu3P9JF7KtmMJvGVRSRXZBkc0GAQNtQzyJLp7xZYDrhK4z6hj1uWETrFD6FJIWrbX5kO
         6Dw5xYEPPB9IrCYV9qMxmQGoyMwiCeTB2JNCHi4DReVOR/R81+f6sW/AGu6gsT7g3y9K
         EGxg==
X-Forwarded-Encrypted: i=1; AFNElJ/FwUsFbw7NAsa08oAPq8GkAKMIzcgHTWgxlLWuS+49MJ6UJglNtROutvqnytl23s/2S1N09AaJgko=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfRds4OUJmOzzSF4oKO6bLIpBADjMRjWRW2UGGXjbJP09cmKCl
	UrsYL+5bEvbql62Al7QAMP/gMhKE5kbOPXpX1h8pGgsPAiHrdpE59Dv8
X-Gm-Gg: Acq92OHQxqNay4XWXIav4CSD/rE9p90+RvGcL955ZF6/qfy5ACMaPY+YQcYCb3Txvhc
	zgOzxsqVEtUzvm9IIOQfFqFKWJ6hFSYhg49YQzwe+NWqKuKnRZZPHOYzA1XqQOLojBqH4RW80aq
	GVSKFSaSgYL/fIQCBYwkvh2QWb1dRUNEt+RRru79z3Dhw33SY/ahWibLhvmtnfgXcPt6np3UzXa
	UTFnbiUYkzx26FuA71bv53qzbyOCu9VTh7hF9yE+KVHbqaIeRDHFxGvaZUFwNFrodvr0xHGEDjI
	nwiFFuPU3w0Uts7wgu0ZXDZmtrgPug580g7kFDVkRffC9j5LtpHpwEvNpS52+N7LF99z6tD3Ces
	IxDGyNtF8bnrjzfvhDFddA6wUTOUjKOzbJiHZpX5D+pNT+n1ydoyvOZKP38Z1yIf+ZinqtnCbjj
	nJVqTGe7NNmJa4VF614MBqlTk417rSy/pZXkiy
X-Received: by 2002:a05:701b:270c:b0:135:e312:47a0 with SMTP id a92af1059eb24-135e3124911mr1830342c88.26.1779284105158;
        Wed, 20 May 2026 06:35:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc2351c3sm28779710c88.11.2026.05.20.06.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:35:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 20 May 2026 06:35:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] soc: bcm2835: raspberrypi-firmware: Add voltage
 domain IDs
Message-ID: <82f2fae4-0c1b-421c-81e0-dcdc74d0225e@roeck-us.net>
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-2-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517080445.103962-2-chakrabortyshubham66@gmail.com>

On Sun, May 17, 2026 at 01:34:43PM +0530, Shubham Chakraborty wrote:
> Add Raspberry Pi firmware voltage domain identifiers for the mailbox
> property interface.
> 
> Also add the voltage request structure used with
> RPI_FIRMWARE_GET_VOLTAGE so firmware clients can share the common API
> definition from the firmware header.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>

Applied.

Thanks,
Guenter
