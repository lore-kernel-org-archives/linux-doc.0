Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC28C1C6FE1
	for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 19:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758742268; cv=none; b=XF95XlNbhaT1OIo1vQSm0WNfv78f4heR753Te7A1ulrbda5Ip2wsbYaGZe0n/unR4Hm7ulXCwpJ51rx6nyqORYWx8lh+AjCxB483E5vLi1g1VyHhJJRW7pZLtI31SIRI82HbsXf5rptS8nCI/aElfu2rRr97bJ2rfyVHWb+GABw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758742268; c=relaxed/simple;
	bh=GI9Xl+MPFOHHEWNS6m62yjXMQrhju00mYgKx0uA5d/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OK+YVxrhYP+8GhdQXMQZA5Orq9tip1Few4DQLuO/1nHerF6hXVP6+PJZQ6ubflgmyb7+34uxEdXzh8qo3wkiuEiPO/7DDrKXSFT6ckCmr9f/hpecVLtXtc4qaAQXpLHU8nI9Itul8VLxGNVA4t7wkHEe1IUSgaiQaNsQ+JFcuwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L2IxPYm/; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L2IxPYm/"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-77f343231fcso128739b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 12:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758742266; x=1759347066; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PmXYYWuE84Zx3GWpt8FZ0tAm371gI0YIhPYxwUcYz5Y=;
        b=L2IxPYm/E765vjxiyaHWxQo8kqevxsH82AZYoCi87u2cIJNGKhacdjSx1isE/nJEJB
         FjXYrxWXVFbVmVKsdRqIAQ6s/v4UNli3/n24/ZFoV9g7A/NHcMInPjpk83nrSBdSl9AH
         z7gQ7+y2EVyER1VljOxeaKSTyJu6SazCy8pOkCfbDYMuTj/3o9KyXXpA4Rc5Eo7GXW20
         d0EsbuQGm2HBLXVCVNz54il4NBxzj3P8l8i6IqMN7pv1nguoCEmN4ZCb0atxsWvRhxWZ
         hCcHpl3d6HK95Bw3TllB0qCrN2z6iXofBPnUfTi+nOdfABMH0qskgO+3HulB6C22YZeq
         GkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758742266; x=1759347066;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PmXYYWuE84Zx3GWpt8FZ0tAm371gI0YIhPYxwUcYz5Y=;
        b=BQcIkkAAvWMnyV2KKbSoKbijtmWpba8Bpkt8vjtCJzZISf2Ob09tWo7pY/PHsXUMvh
         gTaGF6inGvItI2FZUxcArEeN0mna52Z9GcZBSYKiaXJSSrCNJpYgxm808WOWE0x4Vbn3
         LG8FtdD9OYjamVX9/yX3HhaI0QaaQD/klFCVunljHUXG+14V8ooc0vweVvcjqDHJ7axE
         tRrzouGibLMcA3yjcnGN9DBaepgmqSWPxpH1agvpRFqA6bbQQbFDPjZ4Mt0QXa2lt/zr
         9ZJajGtfWr2dX+77Nc3MLJJ0nc1oobc5vNSoubDxgymQWpH4Y7/HdzaEafncIhNl4Y0O
         o8nA==
X-Forwarded-Encrypted: i=1; AJvYcCWhnZQgNXniSq4PDNZWSzHEbnXhhh8rKit32R0p2WIG0akHZ3OAmsfZw6I9GTqARb2lb5PdcqjkqFc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1rAvXWvArFbgjF59CxBLyoaqa9Kma9D7XCKAwk5ArNCZFL1p4
	JKvZ1Bi4ZePqtJH3rDKh26S2Hs5uEIrJfR6kWeMPZ+9x9EiH/D7igzFW
X-Gm-Gg: ASbGncusyVj5BMwcnPKdxo8zEoX+xaFoFxQkJIN4ENfb/WyB/oCoXFhvoctOYKd7S6h
	LdoXtrviIk7pfBpi2zuO0nwo7Z/DN/8ZwgU+CDgbV/S+Ty8cItuKwWVFd/peyFKME9CnAoEizzq
	+WnRRXsla3iu3akNCSQDHf8Dwhsxf8SGHzKMX1td2++uq9TBsCpxvwisoHork2ZBWhpM2lxsa1A
	wyD4tzNb3NleM3IyBv/HQVKZIUObxUol8ry8z+a2rBm9VdNRjB6msX3Vokr5KC0uM3X+ZuJ2Y/v
	jdUPduwYOT2l3FHz+lqmH8AkZ0WF1VdTSN2QvXWQI713/xKGu0ibFBv6dudeE31Anvyas4+bieB
	8zQC6YVYM6473W7125POyYpKb6rmqWURCh0o=
X-Google-Smtp-Source: AGHT+IF5CXklsVDvXe6vgWeVR2NFBBfKBUg2RT7kvwKZ6Qe4Syfm8nnQYr4AnphsGc3zSzkp7zeq+w==
X-Received: by 2002:a05:6a00:1382:b0:77f:383f:61f4 with SMTP id d2e1a72fcca58-780fce1fa18mr1117807b3a.12.1758742266232;
        Wed, 24 Sep 2025 12:31:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f2f02c15bsm10810811b3a.95.2025.09.24.12.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 12:31:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 12:31:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sung-Chi Li <lschyi@google.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Jonathan Corbet <corbet@lwn.net>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, Sung-Chi Li <lschyi@chromium.org>
Subject: Re: [PATCH v6 2/3] hwmon: (cros_ec) add PWM control over fans
Message-ID: <41c71099-d9ad-4beb-bdc5-c8d15293d41c@roeck-us.net>
References: <20250911-cros_ec_fan-v6-0-a1446cc098af@google.com>
 <20250911-cros_ec_fan-v6-2-a1446cc098af@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250911-cros_ec_fan-v6-2-a1446cc098af@google.com>

On Thu, Sep 11, 2025 at 06:56:35AM +0000, Sung-Chi Li wrote:
> From: Sung-Chi Li <lschyi@chromium.org>
> 
> Newer EC firmware supports controlling fans through host commands, so
> adding corresponding implementations for controlling these fans in the
> driver for other kernel services and userspace to control them.
> 
> The driver will first probe the supported host command versions (get and
> set of fan PWM values, get and set of fan control mode) to see if the
> connected EC fulfills the requirements of controlling the fan, then
> exposes corresponding sysfs nodes for userspace to control the fan with
> corresponding read and write implementations.
> As EC will automatically change the fan mode to auto when the device is
> suspended, the power management hooks are added as well to keep the fan
> control mode and fan PWM value consistent during suspend and resume. As
> we need to access the hwmon device in the power management hook, update
> the driver by storing the hwmon device in the driver data as well.
> 
> Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
> Acked-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied.

Guenter
