Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173D748C3EB
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 15:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019052; cv=none; b=mhqNXnpMNjgGfET1mzDeWi5y1ASCAX8HtN/SHlLtOzNJUbpdfQQvSaPKLuUBu3giOLxk03w9dP/XLXZv7O68pvIKN7wAzLfyWw4s7Dz/QQHa5cMnYa9VS5RPkN8ZLWNe2r0sUJFCMYFLoXLj+qv97iFvtPKGumOtHdQh3EQ5onM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019052; c=relaxed/simple;
	bh=11WhgqEt9zgT+ZWXS7ElY2GogLk4HG1AB68dGIPIaxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uO3akO8kL4+98SKgwEIGPWPbGwhB1LEkLxV1hXg68ImEhOAx5vbjI2CAf3LSlmWuISzunlz1dZkZRtARdx4gHRfduHPcRskm1faQgbczMRTe7G1LNg8Y7yaISEbj5AgiAueLZe4WwVKGkv1G8I+Da6NPML8ve6tKSIJBU5EgBXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wg0j8zQz; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wg0j8zQz"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c8589498839so2525529a12.2
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 08:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781019050; x=1781623850; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tfoL8NhaievxojnidDqV0SnsthszxSn+iRp8X4DAOXY=;
        b=Wg0j8zQzHW+KSie6yZ/U++pU00g4DfbwbKgfhdhwDo+L8alXDCAoKCDwdR35iNGHd3
         NR9fXMEv+dCP+Ye8xUVd0lPBk0DvAgflS9t4X4JbxNBlitoSjqihqYgL6It5FfZOFVaT
         OzuVWZvpt+IJzRLTUitlgechxgoDbhqVGrpQk+L6fCH/R3/9WI8ojLk7a1aqW1XpLur7
         LvJerYtEkxvA6LhVp6mEp8ZnDdsq6LN4vYbcUnbbSl41KCpiDgPVDbQn7RQ14sO3ke2S
         TdVx1J+/3Vj2xx+YTWx4flEGhJgQEuipu6YUfq9FmOTQY3wB95M/wirg6gH7DgjXTgnC
         rCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019050; x=1781623850;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tfoL8NhaievxojnidDqV0SnsthszxSn+iRp8X4DAOXY=;
        b=sBKwG/sTRHeq/iIii1ZdW3LvdEHbswPYoG/NTG4jHsexakfDJYcy6XXUC+qIaKovcq
         QuYDSLtDouGkXSxwJLPHEoDYXAgQ7xKoaZuoiLj6vHzt+fiky8jLMD+Pc5UEY1b18df7
         5Ha0I8g6kFPPmijUTaljxdPscDWYKYtb2xIRLpntq5aVezOXXV9yhteXeEWyq1JqC5ep
         x9AaqwwFLznZZhW5jZGIGmwG/A9HODT1alJyRXciztoRB/fYuFzILmUfmKuXNNsyLEjp
         fCvBC7vqT6DzMu0AFbYYi2C2kbZD/fNXbtvm+mM/LFqcca1JQSejahKz5ddWUVfsRzxd
         x5qw==
X-Forwarded-Encrypted: i=1; AFNElJ9HL5cJBnFqXMosiw6Qni5HptSrviHfEuJykYwnYUYCeozZDUJT80RG69Eo57bDbveeJaS6+Kn0x7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJve5A9E94NsY0F7wHagyrJUyhCYAZEAiWW8OEJlfZX4srwJ2m
	J5nzcXWTtTEem24o9uARcsgNblCzD/kZFYqa+Z4YIjXXgIndU/4weCVO
X-Gm-Gg: Acq92OF055g2SHwJjLrtCTFgpo2c06WXbOhDcV7CED1tQsVBCMfFmnFECczi59ya2ss
	un/YTKRYmYnrAPbvCHHFBqpMTgO5RHfgcj6xRhQcsESm8lCd76w1zZxPb5uJEzpBbLrCcZkzHVy
	s0CxCFE3PWzmfMgiwDG1+T4dp3vD+/5SYoDAKzw+WOOTRH43wtUUzsA6F6hLlf8QBZQIcOBWtZo
	UWcGGuFTMZi3wniUQ23wqjwhac7ELYQbNmiB944ZGG/Qwn/qfXbnyFbzAAkmwFtrSzGoF9y2WLU
	zq9M4a8DpBfKu23a8KwIi6sdRtVIi+aps2hxAZbLtzDIwCKUVE9pSh1xHIaDS7tcVwbw3O1m2XB
	WT6Z/393SAdYGTdkTs5AQ7Vy2LbHOhzrHxysh7W0ZgggHaUGc4vxta5DdWgvsQ67egjBvDp5OS8
	FuWISSWNpskChg1bE1LYr2WHoeFdt8RfC7wPI5657t+N5/z3U=
X-Received: by 2002:a05:6a00:928a:b0:842:5a8d:3036 with SMTP id d2e1a72fcca58-842b0fb6e13mr21005108b3a.35.1781019050176;
        Tue, 09 Jun 2026 08:30:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428221c3e4sm22494788b3a.5.2026.06.09.08.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:30:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 9 Jun 2026 08:30:48 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v13 3/3] gpio: gpio-ltc4283: Add support for the LTC4283
 Swap Controller
Message-ID: <6a33cc01-e6a4-4e3b-a629-66fda71d8ef7@roeck-us.net>
References: <20260502-ltc4283-support-v13-0-1c206542e652@analog.com>
 <20260502-ltc4283-support-v13-3-1c206542e652@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260502-ltc4283-support-v13-3-1c206542e652@analog.com>

On Sat, May 02, 2026 at 10:56:54AM +0100, Nuno Sá wrote:
> From: Nuno Sá <nuno.sa@analog.com>
> 
> The LTC4283 device has up to 8 pins that can be configured as GPIOs.
> 
> Note that PGIO pins are not set as GPIOs by default so if they are
> configured to be used as GPIOs we need to make sure to initialize them
> to a sane default. They are set as inputs by default.
> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
