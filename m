Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83B753C3A0
	for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 14:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174800; cv=none; b=aFQ/86b+YihTtl8K4lR+e3WXkBkZJUb0i45Nh+D/tkifdhX5uCD+VkULhIQrPUzQHG9E5TyrDBCoe0MaCbu5gYevZFZXPhAuemyLKhaBmA/X8IXvJmAC5iT2pjUvfBAB96UOw7qFcxOSGLyku78Q9/WArb5udtgn7YpmmvjOSEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174800; c=relaxed/simple;
	bh=XwpjmJluvtoDZaA6MKdbJZybCqPcUBUalWYslDZI7Kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F6DWOaEupKZjclEc1CFdfqzlunjVXGDDqRVopiSAFDo9acRXUYBasiMHFtvLzURltOAbKVjNDyz71tS6jjpai/omxhQu33rQqq4y5ZEbk/drEpQ2A40OAAmoWkI5USVujpiuzF320yceIqt2plDgR4PSJkW6jrQzSkPrWveKM4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CDMDuTgT; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CDMDuTgT"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2dso496888a12.3
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 07:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790174798; x=1790779598; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j2hU/V/9OkaoLGgLOfMT38LPn29XKPRospCOIHDkyow=;
        b=CDMDuTgT1GXqI4KOrqwClYKloigjbiRyn2b2GK3xda6opT2Rxjof82hE4AYe/h/HM9
         GI/I0s5tobfm/3ppZWuMG9YfuYbeVYil8YWBkLoqel61OSyMPrBssuaQVehj3KNGFtjz
         v00FbcUsOBXMArCsvm/EkFviOGNJf0DxWa3O3oUYdWkoihdg2BsVpAmcQ3zw3/3U6t0H
         hm77D/JDni85lu9uMFOVHDBFqFFKzj3+bwIUayQEAmTGeiobA648sSJB9Ig/jUFrnBa+
         48JOujCwzCI9gR+DzhvsHAnolHBNR4IOWeQYBVqsokztM4ZwjfEoXGNiGWrCywpHMOd4
         bcbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174798; x=1790779598;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j2hU/V/9OkaoLGgLOfMT38LPn29XKPRospCOIHDkyow=;
        b=aMQmnDh53zLq0qP4DQu5WJhLJHRaOswPJFcAzP5VKtmd7sdc6NkDYCijGrffgDyk5s
         krc6N8cI/AE/Tb5IUsovTQDrI4qWgz8Re4PAXJI95iMJbF1sMkklWJirKsg1PN1giaT5
         D4OKiw0SYaYRjuAwivukDy7BhY9BQYf+v6Qgq+yJFHgsEqFChezhv2AF25XBoF2ejVtb
         lQSjm2RwhpmRF5Km8mGdiXpYlTrS0D1NbuxtxTlkX08H3DFJTIUHH8/jz+cfl2Ufs2Kq
         xlAUwIPgF4kqDQmiTtRExNywPQWUUsFb7UZInaxJcAJCut4btcxOLQcJ6V12R+F5KDOT
         lPQg==
X-Forwarded-Encrypted: i=1; AKwUvBwqI8cYhqoG2TDiq0NivqeORvLiHFFhqCrZn8ouWyQp57C+SuuACboptMm7Bw9QSu7h1Wqgfgn17ig=@vger.kernel.org
X-Gm-Message-State: AFuF++laytCGht+BucPUxHFsnQ+Dnw9DMNSxARjZgjsJnLrKtT0R6Idx
	9h1CVOcEcsP+Vfl4bzqev97SVq9NPJaXwdiZxXw7G/Ls/g6WMZaaN/os
X-Gm-Gg: AYBFou29EFHpK+KDxLtZvjiF16jG+gYZixZ0lCOgWQWF51/BFCO/qkgnrp0ziMp1MMl
	+aSxvT+Hi9z9jxBVeJM0cdXFKMD5eGCBejHabtY0SszeN2SkV3j63fJPbtpBev00BC7nlwHtdtR
	naXyUe9D+Dy/IzKPjH8rpbE5RmJIxDg/hTd2hOgC/bM0YPZRKWySEh0yQaKpp7ZaufQtK2A1+R0
	lo3qWABQ5UhCJ0fAeEXLt6ncGG+yp93Wn9RT1P+AZnukRfoDaW2vlpsxTsxa6Sls/CLjKmdYPbk
	RqlCuG1Uhld/JOyVNm/CHIBcKCZ97oJqQTeB0cXOH+tYhWqf9ole+U1c82PtQxaUG77Pimh2A0I
	GWls+0gytJWtcj7QVxxEnGDU6KHIj0wAdmWb7gS5RbdRYlNYVvIOQMM8icjdsO1YjOtsfMXDiqs
	CgULrUMJZDPCf5IRQVo0ObEGVNkZJON7YpzPPTHw/UD/FXYoeSaA64zS0UrUJZSzr3yJDaNU4Me
	SsF7SkTwc2+
X-Received: by 2002:a05:6a20:c90e:b0:3dd:a196:5396 with SMTP id adf61e73a8af0-3ddf8296889mr2890417637.56.1790174798050;
        Wed, 23 Sep 2026 07:46:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f2228a2sm1257186a12.4.2026.09.23.07.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:46:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 23 Sep 2026 07:46:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] hwmon: axiado-pwm-fan: Add missing documentation and
 MAINTAINERS entries
Message-ID: <8b761904-27e7-4e03-bc37-9fb048368b2b@roeck-us.net>
References: <20260923-axiado-pwm-fan-doc-fix-new-v1-1-8c8c2ce58a21@axiado.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-axiado-pwm-fan-doc-fix-new-v1-1-8c8c2ce58a21@axiado.com>

On Wed, Sep 23, 2026 at 02:58:41AM -0700, Petar Stepanovic wrote:
> The axiado-pwm-fan entry was added to the hwmon documentation index, but
> the corresponding Documentation/hwmon/axiado-pwm-fan.rst file is missing.
> 
> The MAINTAINERS entry also only lists the devicetree binding and is missing
> entries for the hwmon documentation and driver.
> 
> Add the missing documentation file and MAINTAINERS entries.
> 
> Fixes: 2d52742f408f ("hwmon: add Axiado AX3000 and AX3005 PWM fan controller driver")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202609230904.aIWyLsSt-lkp@intel.com/
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Sorry for that. The patch did not apply due to conflicts, and I had to
apply manually using patch. Doing so I forgot to include the missing
entries.

I'll fold this patch into the original patch introducing the driver.

Thanks,
Guenter

> ---
> This patch adds the missing Axiado PWM fan documentation file and updates
> the MAINTAINERS entry to include the documentation and driver source
> files.
> ---
>  Documentation/hwmon/axiado-pwm-fan.rst | 38 ++++++++++++++++++++++++++++++++++
>  MAINTAINERS                            |  2 ++
>  2 files changed, 40 insertions(+)
> 
> 
> ---
> base-commit: bf92ea2a46120fd0809f24d39ad3482d0f20876b
> change-id: 20260923-axiado-pwm-fan-doc-fix-new-d0e42bbb0cbc
> 
> Best regards,
> --  
> Petar Stepanovic <pstepanovic@axiado.com>
> 
> diff --git a/Documentation/hwmon/axiado-pwm-fan.rst b/Documentation/hwmon/axiado-pwm-fan.rst
> new file mode 100644
> index 000000000000..d110e170b0df
> --- /dev/null
> +++ b/Documentation/hwmon/axiado-pwm-fan.rst
> @@ -0,0 +1,38 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver axiado-pwm-fan
> +============================
> +
> +Supported chips:
> +
> +  * Axiado AX3000
> +  * Axiado AX3005
> +
> +    Datasheet: Not publicly available
> +
> +Author:
> +
> +  * Petar Stepanovic <pstepanovic@axiado.com>
> +
> +Description
> +-----------
> +
> +The Axiado AX3000 and AX3005 PWM fan controllers measure the rotational
> +speed of one fan using a hardware tachometer block. Fan speed is controlled
> +through a PWM signal supplied by an external PWM controller.
> +
> +The number of tachometer pulses generated per fan revolution is configured
> +through the ``pulses-per-revolution`` devicetree property. If the property
> +is not specified, the driver uses two pulses per revolution.
> +
> +Sysfs attributes
> +----------------
> +
> +The driver provides the following standard hwmon attributes:
> +
> +=============== ====== =====================================================
> +fan1_input      RO     Fan speed in revolutions per minute (RPM).
> +
> +pwm1            RW     Relative PWM control value from 0 to 255. A value of
> +                       255 selects the maximum PWM duty cycle.
> +=============== ====== =====================================================
> diff --git a/MAINTAINERS b/MAINTAINERS
> index eb3cc6c81bcf..5ad12c57ca5f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4504,6 +4504,8 @@ M:	Prasad Bolisetty <pbolisetty@axiado.com>
>  L:	linux-hwmon@vger.kernel.org
>  S:	Supported
>  F:	Documentation/devicetree/bindings/hwmon/axiado,ax3000-pwm-fan.yaml
> +F:	Documentation/hwmon/axiado-pwm-fan.rst
> +F:	drivers/hwmon/axiado-pwm-fan.c
>  
>  AXIADO SPI DB DRIVER
>  M:	Vladimir Moravcevic <vmoravcevic@axiado.com>
