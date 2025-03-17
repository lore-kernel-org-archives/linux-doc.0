Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF5418C00B
	for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 16:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742227875; cv=none; b=QJ4u5mK27Vkfh35u2QgNKh3X5dMXlszS+OoBvb/KKXGOTSgppzzMgPxf1bzHUu5KYU9MOs9UtjY52+kR3v2n47s7Ni3xqJ9cqFlDr10mI25EfhSHW6hlrZ7VJpsV6I5gXJ9auA5tdpkaA6L8K8EUvWG7CxSC6Z0hrv2ov69uYLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742227875; c=relaxed/simple;
	bh=Uoc1DrwhFhqKapvK2aZfs21XdFLHjo6sg1n08s0IZcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DFkGAWe6R1eysE/aPAeOJbCXgtWndkGtku9sTwjU/u0RJ3ScKPGCoARJkQ8K8N9rFBUuRAr/K+jo6975ZpdeFfkQAVtv/hcGo81jovjk2HwR16ao70yxANTKsmkTouKROFdYFg8oj9yFPa9f+BCkQdlO3PXor3Wop4SKJFNuvxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MEhXOilo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MEhXOilo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742227872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gMxOns8OLCANHT+gWoMrsh+8iH9de53W50uJK8mjjKs=;
	b=MEhXOiloO8IjTmd4nrxj3uvjB0In4oqAcr5MZqIO0BRCl/nl5OMyI62AGFJNQkjwI/nH/G
	k/StE3ABLkicKUVSU44tXzX5yvwVf3kjKkJzoGbgPo+dfx+HI2T/VrOMFnXN0oQFznDFhB
	b7Uk38Dt9vGCjb7usRS6GIGRiVUK9WA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-9-YUxEJCNEWB-RKMUc57Gw-1; Mon, 17 Mar 2025 12:11:11 -0400
X-MC-Unique: 9-YUxEJCNEWB-RKMUc57Gw-1
X-Mimecast-MFC-AGG-ID: 9-YUxEJCNEWB-RKMUc57Gw_1742227870
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac29ae0b2fbso465435466b.0
        for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 09:11:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742227870; x=1742832670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gMxOns8OLCANHT+gWoMrsh+8iH9de53W50uJK8mjjKs=;
        b=fdtm/qCvvrwCWE+iYDc4PjxKfmtVxNT/Fd4N+ExWxclevkav+BS2dvrAhGl7t4dwYe
         OsNYbnfC7c0BtmWl51gMCc67rv7fV/8H47BKE4eW2+HNuyu48CiJ+7Dl8Of0zQlll96d
         Vi+FZJBCxIp7oaRAiRSbk2kDzo6JQTD6o9JPIBsubGTbVEmXhYs00Zde9Zl5yOW9NT91
         pt8YEbV0Pr6jtNl3T8ykRT0KtqXyKgeQ8GyRpWi0e4HWEivJ4+AH6zpT27SfG69rKNCU
         QfHEnsOJmOF5C3c9o6a1XLGrxkYDXFQp6y1TvTMB28nBcnIb5bIpFmRuY7Hh+PAkQzo6
         cDsg==
X-Forwarded-Encrypted: i=1; AJvYcCWdPvAq2hnE+8FylfMgFo+Aozei5BjPP4NFyVgRKerqPwWBqdUyu5gcIPQeFFdfmk5c4/1VtdiHlAU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLI0F9eE+21UKzT1t4zDAaiZcjuciX6XY5OM/Yw9wRks/xN5LG
	DUbL3KHiqwBFMK4rwVInhtiNxyfSJEh7HtQVmXYEGu+N72GVTHTProCdJG44etJvNvtR4yoT0tG
	RSEjLgEf/9GFQvf7q+ptU7PLDPnzS7C4IXevBEp73X+KPHyHb35GAN4OwOQ==
X-Gm-Gg: ASbGnctZZ4bywyiJy1yRsJmDbhywhUj5XwXnYUCDKazl1uTkHKaVw8BW66Nkk4lkru7
	vB5sFXgtL8kEF2XeeSDx5cvXdPXxgTs2DibL6RHMrjZ3YljW1O/XWPzICeEuUxQhzgoufk9g8fB
	deX5r2mBMFHamANF4bIeR/72l4GnplwdaMte+VhsSsr9e1GRXqTqdrQhYkBr6PDfG984orUs8vN
	MAWjNtMJ7Nr4cW+mTB8afGqmi0J8N47D/7v1JqAL+H9MmLlva+InaCWf/mY50dkOoml1vDo/22U
	gVy0Yx3udbZ+Eb/9/tnK2RMls4jl3neb2UReshaMTabZWlz6WDeAAOCrfb1xI4vOfpZQKPuu7y+
	KVcoNeeM6ovXQenTOa+Gkr56XdzSRjvO6/jFcbvjOdh6Y+jH0aKoIZFsUFnfiOYgVoQ==
X-Received: by 2002:a17:906:ee85:b0:ac2:d6d1:fe65 with SMTP id a640c23a62f3a-ac38d515007mr31491666b.41.1742227869893;
        Mon, 17 Mar 2025 09:11:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0sssDA3BQRaSOyamV/S0PXeQ9xKfhQPA6HZicsQtZlhud1G2Kdvgy67YBjeYvH5sJJ0eE7Q==
X-Received: by 2002:a17:906:ee85:b0:ac2:d6d1:fe65 with SMTP id a640c23a62f3a-ac38d515007mr31484766b.41.1742227869395;
        Mon, 17 Mar 2025 09:11:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314858a8fsm676871266b.80.2025.03.17.09.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 09:11:08 -0700 (PDT)
Message-ID: <d9da58be-7a83-4007-8ea7-8c6d6005094a@redhat.com>
Date: Mon, 17 Mar 2025 17:11:07 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/13] power: supply: add inhibit-charge-awake to
 charge_behaviour
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pm@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Joaquin Ignacio Aramendia <samsagax@gmail.com>,
 Derek J Clark <derekjohn.clark@gmail.com>,
 Kevin Greenberg <kdgreenberg234@protonmail.com>,
 Joshua Tam <csinaction@pm.me>, Parth Menon <parthasarathymenon@gmail.com>,
 Eileen <eileen@one-netbook.com>, linux-kernel@vger.kernel.org,
 sre@kernel.org, linux@weissschuh.net
References: <20250317155349.1236188-1-lkml@antheas.dev>
 <20250317155349.1236188-13-lkml@antheas.dev>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250317155349.1236188-13-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 17-Mar-25 4:53 PM, Antheas Kapenekakis wrote:
> OneXPlayer devices have a charge inhibit feature
> that allows the user to select between it being
> active always or only when the device is on.
> 
> Therefore, add attribute inhibit-charge-awake to
> charge_behaviour to allow the user to select
> that charge should be paused only when the device
> is awake.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>

Thanks, patch looks good to me, FWIW:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
>  Documentation/ABI/testing/sysfs-class-power | 11 ++++++-----
>  drivers/power/supply/power_supply_sysfs.c   |  1 +
>  drivers/power/supply/test_power.c           |  1 +
>  include/linux/power_supply.h                |  1 +
>  4 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-power b/Documentation/ABI/testing/sysfs-class-power
> index 2a5c1a09a28f9..78afb2422fc5a 100644
> --- a/Documentation/ABI/testing/sysfs-class-power
> +++ b/Documentation/ABI/testing/sysfs-class-power
> @@ -508,11 +508,12 @@ Description:
>  		Access: Read, Write
>  
>  		Valid values:
> -			================ ====================================
> -			auto:            Charge normally, respect thresholds
> -			inhibit-charge:  Do not charge while AC is attached
> -			force-discharge: Force discharge while AC is attached
> -			================ ====================================
> +			===================== ========================================
> +			auto:                 Charge normally, respect thresholds
> +			inhibit-charge:       Do not charge while AC is attached
> +			inhibit-charge-awake: inhibit-charge only when device is awake
> +			force-discharge:      Force discharge while AC is attached
> +			===================== ========================================
>  
>  What:		/sys/class/power_supply/<supply_name>/technology
>  Date:		May 2007
> diff --git a/drivers/power/supply/power_supply_sysfs.c b/drivers/power/supply/power_supply_sysfs.c
> index edb058c19c9c4..8d036faf220ec 100644
> --- a/drivers/power/supply/power_supply_sysfs.c
> +++ b/drivers/power/supply/power_supply_sysfs.c
> @@ -140,6 +140,7 @@ static const char * const POWER_SUPPLY_SCOPE_TEXT[] = {
>  static const char * const POWER_SUPPLY_CHARGE_BEHAVIOUR_TEXT[] = {
>  	[POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO]		= "auto",
>  	[POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE]	= "inhibit-charge",
> +	[POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE_AWAKE]	= "inhibit-charge-awake",
>  	[POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE]	= "force-discharge",
>  };
>  
> diff --git a/drivers/power/supply/test_power.c b/drivers/power/supply/test_power.c
> index 2a975a110f485..958e0c0cf2876 100644
> --- a/drivers/power/supply/test_power.c
> +++ b/drivers/power/supply/test_power.c
> @@ -214,6 +214,7 @@ static const struct power_supply_desc test_power_desc[] = {
>  		.property_is_writeable = test_power_battery_property_is_writeable,
>  		.charge_behaviours = BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO)
>  				   | BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE)
> +				   | BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE_AWAKE)
>  				   | BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE),
>  	},
>  	[TEST_USB] = {
> diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
> index 6ed53b2921624..bb8e9e62ce834 100644
> --- a/include/linux/power_supply.h
> +++ b/include/linux/power_supply.h
> @@ -212,6 +212,7 @@ enum power_supply_usb_type {
>  enum power_supply_charge_behaviour {
>  	POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO = 0,
>  	POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE,
> +	POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE_AWAKE,
>  	POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE,
>  };
>  

