Return-Path: <SRS0=NxQi=CL=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E91C433E2
	for <linux-doc@archiver.kernel.org>; Wed,  2 Sep 2020 11:06:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E2DD2072A
	for <linux-doc@archiver.kernel.org>; Wed,  2 Sep 2020 11:06:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QjMjMMIP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbgIBLGg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Sep 2020 07:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbgIBLGd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Sep 2020 07:06:33 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79173C061244
        for <linux-doc@vger.kernel.org>; Wed,  2 Sep 2020 04:06:32 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id g4so4283597wrs.5
        for <linux-doc@vger.kernel.org>; Wed, 02 Sep 2020 04:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=twCG0p2wcM15uhFFhccs3FoLycIAVHdvzhdgouUISjE=;
        b=QjMjMMIP3AuV0DYTBlqgh8WTTL3IZkCOfKHsC0TtSMXTGeb8yc0kHuGd38RaV8rxER
         h4+gZDDw2KRrPAKT2Hmj+jap/iA6w+D7oPcBISu4NFgNmyNGpiyazXDBZr/1rLvf2YvE
         rJyoLCW6hz7K+Q85sFE8z/v7/EhUeQZJS871djquj0y3/kXx2pd08SmQa82muEvGS6cY
         g9wH//D/v680S5Nw/Kma9VIneLohEmanmFAibUESRZuvVkFNC6QatOeAlct3S/WtlsBY
         qqCcu1z3aeT1Us/eDPaaoEIM89PmSe+i63/EZ9eubg4/UOUorAQzb91jwdfkj3bU88jT
         NCCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=twCG0p2wcM15uhFFhccs3FoLycIAVHdvzhdgouUISjE=;
        b=Tplef2TW/tyr/5y0m61/ZxzuOsJTPXqftAjIKSIlOBgDWLb37wxOMnYLoarAA6pR/C
         8n907iMD2/4YhDYeXJDH+eO4Nsdq6YWLx2HMY+uCDF4cQDIwruFE45POM+//2l8H2DNT
         qz8XJyijuFNTW6TMDCispaaTRKKtWWelPlA9hhyvvXakpN4y+oLYkF6Hb+Qnz8EHEeMF
         mmODaJDW64Oy3KR37qH+Jiak9Ro8Ts1fe7hvE0V1zzR+EIaPJqgflSmPuu8dEejQK3WM
         D4QWnVgy2zcDz9esKgwzJj33Oh81BtrbeRHxJmGzdxRII4dEhL3VDS8/3XZslRlQgne0
         QTuQ==
X-Gm-Message-State: AOAM532me7hLYwUW8F/sy0oZ8/LaCliXMxuZguAWMMxf4mYIK5ickQul
        /TFT6tbRQlEiIEDbylK9MUIv8Q==
X-Google-Smtp-Source: ABdhPJyDLhEkGLP0nkSt39qJ0i2C3tbY9x1xvi9Lc2JnHnngBcYOSgjATJ5lGcYb/GvxwYMF5p/PyQ==
X-Received: by 2002:adf:c108:: with SMTP id r8mr6834034wre.350.1599044790992;
        Wed, 02 Sep 2020 04:06:30 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id f6sm6876125wro.5.2020.09.02.04.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 04:06:30 -0700 (PDT)
Date:   Wed, 2 Sep 2020 12:06:28 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 02/24] backlight: Add DECLARE_* macro for device
 registration
Message-ID: <20200902110628.5npko5kuuaec2ldd@holly.lan>
References: <20200823104532.1024798-1-sam@ravnborg.org>
 <20200823104532.1024798-3-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823104532.1024798-3-sam@ravnborg.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Aug 23, 2020 at 12:45:10PM +0200, Sam Ravnborg wrote:
> Device registration almost always uses a struct backlight_properties
> variable to pass config info. Make it simpler and less error prone
> by the introduction of a number of macros.
> 
> There is one macro for each type of backlight {firmware, platform, raw}.
> All members in struct backlight_properties are initialized.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> ---
>  include/linux/backlight.h | 63 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> index 190963ffb7fc..93a47a6cf681 100644
> --- a/include/linux/backlight.h
> +++ b/include/linux/backlight.h
> @@ -272,6 +272,69 @@ struct backlight_properties {
>  	enum backlight_scale scale;
>  };
>  
> +/**
> + * BACKLIGHT_PROPS - init backlight_properties with default values
> + *
> + * This macro is used to initialize backlight_properties with default
> + * values. It is intended to be used when registering a backlight device
> + * and the properties needs to be adjusted at run-time, for example
> + * when the max_brightness is configurable.
> + *
> + * .. code-block:: c

sphinx markup in kernel-doc comments is pretty rare at the moment (and
presumably it does odd things to direct man page generation). Has it
been discussed and approved of by doc maintainers or is it just creeping
organically?


> + *
> + *	struct backlight_properties props = {
> + *		BACKLIGHT_PROPS(0, 255, BACKLIGHT_RAW)
> + *	};
> + *	...
> + *	props.max_brightness = new_max;
> + *	err = devm_backlight_device_register(,,,, props);
> + *
> + */
> +#define BACKLIGHT_PROPS(_brightness, _max_brightness, _type)	\
> +	.brightness = _brightness,				\
> +	.max_brightness = _max_brightness,			\
> +	.power = FB_BLANK_POWERDOWN,				\
> +	.type = _type,						\
> +	.fb_blank = 0,						\
> +	.state = 0,						\
> +	.scale = BACKLIGHT_SCALE_UNKNOWN,

Hmnnn... not sure I like seeing this buried.

BACKLIGHT_SCALE_UNKNOWN is not a sane default... it is pure legacy
so it would be good to force drivers to declare this explicitly
(since it would require new drivers to think about the correct value).

It then also becomes a good git grep target to help identify drivers
whose scale hasn't been reviewed and recorded yet...


Daniel.


> +
> +/**
> + * DECLARE_BACKLIGHT_INIT_RAW - backlight_properties to init a raw
> + *                              backlight device
> + *
> + * This macro is used to initialize backlight_properties that is used when
> + * registering a raw backlight device.
> + */
> +#define DECLARE_BACKLIGHT_INIT_RAW(name, _brightness, _max_brightness)		\
> +	const struct backlight_properties name = {				\
> +		BACKLIGHT_PROPS(_brightness, _max_brightness, BACKLIGHT_RAW)	\
> +	}
> +
> +/**
> + * DECLARE_BACKLIGHT_INIT_PLATFORM - backlight_properties to init a platform
> + *                                   backlight device
> + *
> + * This macro is used to initialize backlight_properties that is used when
> + * registering a platform backlight device.
> + */
> +#define DECLARE_BACKLIGHT_INIT_PLATFORM(name, _brightness, _max_brightness)		\
> +	const struct backlight_properties name = {					\
> +		BACKLIGHT_PROPS(_brightness, _max_brightness, BACKLIGHT_PLATFORM)	\
> +	}
> +
> +/**
> + * DECLARE_BACKLIGHT_INIT_FIRMWARE - backlight_properties to init a firmware
> + *                                   backlight device
> + *
> + * This macro is used to initialize backlight_properties that is used when
> + * registering a firmware backlight device.
> + */
> +#define DECLARE_BACKLIGHT_INIT_FIRMWARE(name, _brightness, _max_brightness)		\
> +	const struct backlight_properties name = {					\
> +		BACKLIGHT_PROPS(_brightness, _max_brightness, BACKLIGHT_FIRMWARE)	\
> +	}
> +
>  /**
>   * struct backlight_device - backlight device data
>   *
> -- 
> 2.25.1
> 
