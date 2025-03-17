Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2262239089
	for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 12:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742214423; cv=none; b=q6L4+mfGSfxwN2bLfj5k1GylhaMdVNjsBB1cYBeAcQRV54n5qAfU5EfNX7nmZ2EBeVJx/4rDngaXhlvydAJgdSmLj3ugkmUkkzw1r7kz1orp3HOkDSV/1LP94QMlYlQb5w59KoLA6vrMaV830FCsmU1J45ku8wZyboDXMoj3uEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742214423; c=relaxed/simple;
	bh=Vic61tvV7K+zZ66KhZ9Nn4YiXR+6vfw+HabXpTBZ+bM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZS598XPdqjiw/E+LGjlgDoYf0VQ+0KxxgJqAZpiUPsLoR1asXXcS5u2lsh0Vz2cVck5Sb7aFoqJgf44J5cRQiMcx28FpzDdxVWstty1rWYLoMRDwM+E+fli6rYCvUjyfm/rQttR8f+jtX9XvaVWheOYtNWHrcvNqE/sva/dLKt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iXQthMvd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iXQthMvd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742214420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gq/3oDcqRFjbGO554tsErOa27UmZsBKNvIRH2SBUzQs=;
	b=iXQthMvdafA9nunsLX1q3nOo+vmj3TCeaxDv29rPXvWd1xdo2ZFmYYN9JM6ajaLveCXmVG
	+loo7RTJM0iYJoNS+ZZ3VI+bxJBtCO/ftyJjGmcLe/ZU337dc1yU/aTrbA3wtU5tTCbWLb
	LDzg1wZVoc+02RfYZrRahFG1zoqnxe8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-iQPr_-UiPbeeGTVJrowpYw-1; Mon, 17 Mar 2025 08:26:59 -0400
X-MC-Unique: iQPr_-UiPbeeGTVJrowpYw-1
X-Mimecast-MFC-AGG-ID: iQPr_-UiPbeeGTVJrowpYw_1742214418
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ab397fff5a3so512309366b.1
        for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 05:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742214418; x=1742819218;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gq/3oDcqRFjbGO554tsErOa27UmZsBKNvIRH2SBUzQs=;
        b=JyVAGZySs6yE/UfS3GSrSURzGGNkpMTGaxytS0hq8pvkds9KO+lbXR+roxnBb/d7ej
         LfyN4kqWvbV1zWxZ5Tk0EH5Gmc6lrv1+fosPbzkTV0pdWAfOBAm2nQHK205TZfBR7Uj7
         hc7c3/RRj1ULFd2o/119r5Fa1mMsSedXfKhJtjQT9AFNgNOelQG4bfPsVzpAv384a9tJ
         kp2iwYWg13u9hsWGspi9kLRmZyRhPAiBsNa6j8Ru5x8BZCdVAmpk4o/c9sE5IA1051l7
         GslSeWNKHn3jqfKwFPWb8WIh7+nD9tbKinApfiC38CgsKf21ze+Gn1Dhxnyn1IGTj5Ac
         1D1g==
X-Forwarded-Encrypted: i=1; AJvYcCWT46/OWMVvouiMx7yBHER51lr8rPnB9TGLRd3YB+cxDzYcdfFbCrqe2XfGErips1Rso0iBGq8g1bU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5TUq1Fb4SdEJhWpoV9Sl+Xs5sHDfMApq+f9AjwEFQrX+hztHX
	4ZErE1b9bGluCRH/m1HvCWy0T4T+oZycb7xKZa8vxY8zp9DpthAwVsXFs1ZsM+dAYFqcokYjxvT
	uxzjveVi6Y1rDhaJAIreE0kvT96bijZKOtifoj43gGAAZUBKp+SAvHZMNLA==
X-Gm-Gg: ASbGnct80Sh5RK3SfRduqrcNBPQ2rbT4zlOhNzYTFKJC25vMo3QpaB2mC5puMW5C478
	SZy/Xp6jNM98FOUJwp0Ir7iA0JQa+AjuVdZTkRIXYNCfPJrhn4gysqWuZ6hhGSbvB17EG5MTO4C
	cFVUQqGPvL1JFLjd4Yu5Bbm5NKVTETk+jah84SwPrtxu38dUgE2CnEmxCDEkvQ0UOUc+6NbW1CF
	eC9u2qKpMjGJalowQcp2hlZe8UqpaSoY6cQGw2VhZZdfqyL/cJ3/gRFwa2R1N6GMf0htJPIFauM
	o58MAvdk2rDbB9iBEeo=
X-Received: by 2002:a17:907:1784:b0:ac2:d1bd:3296 with SMTP id a640c23a62f3a-ac3122c9347mr1739014466b.10.1742214418199;
        Mon, 17 Mar 2025 05:26:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSAvM62Zyz90XQdYPLgsDArMxRRO1V+0sKnFycYqInMYtAjSRZs8HD7Xb01ze8pexMuvtFOg==
X-Received: by 2002:a17:907:1784:b0:ac2:d1bd:3296 with SMTP id a640c23a62f3a-ac3122c9347mr1739011866b.10.1742214417791;
        Mon, 17 Mar 2025 05:26:57 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816ad3d53sm5823562a12.52.2025.03.17.05.26.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 05:26:57 -0700 (PDT)
Message-ID: <b1ac8a33-06ed-482a-b5f6-ca88eb3802a1@redhat.com>
Date: Mon, 17 Mar 2025 13:26:56 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/13] power: supply: add inhibit-charge-s0 to
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
 Eileen <eileen@one-netbook.com>
References: <20250311165406.331046-1-lkml@antheas.dev>
 <20250311165406.331046-6-lkml@antheas.dev>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250311165406.331046-6-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Antheas,

On 11-Mar-25 17:53, Antheas Kapenekakis wrote:
> OneXPlayer devices have a charge bypass

The term "charge bypass" is typically used for the case where the
external charger gets directly connected to the battery cells,
bypassing the charge-IC inside the device, in making
the external charger directly responsible for battery/charge
management.

Yet you name the feature inhibit charge, so I guess it simply
disables charging of the battery rather then doing an actual
chaerger-IC bypass ?

Assuming I have this correct, please stop using the term
charge-bypass as that has a specific (different) meaning.

> feature
> that allows the user to select between it being
> active always or only when the device is on.
> 
> Therefore, add attribute inhibit-charge-s0 to
> charge_behaviour to allow the user to select
> that bypass should only be on when the device is

Also don't use bypass here please.

> in the s0 state.
> 
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  Documentation/ABI/testing/sysfs-class-power | 11 ++++++-----
>  drivers/power/supply/power_supply_sysfs.c   |  1 +
>  drivers/power/supply/test_power.c           |  1 +
>  include/linux/power_supply.h                |  1 +
>  4 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-power b/Documentation/ABI/testing/sysfs-class-power
> index 2a5c1a09a28f..4a187ca11f92 100644
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
> +			================== =====================================
> +			auto:              Charge normally, respect thresholds
> +			inhibit-charge:    Do not charge while AC is attached
> +			inhibit-charge-s0: same as inhibit-charge but only in S0

Only in S0 suggests that charging gets disabled when the device is on / in-use,
I guess this is intended to avoid generating extra heat while the device is on?

What about when the device is suspended, should the battery charge then ?

On x86 we've 2 sorts of suspends S3, and the current name suggests that the
device will charge (no inhibit) then. But modern hw almost always uses
s0i3 / suspend to idle suspend and the name suggests charging would then
still be inhibited?

Also s0 is an ACPI specific term, so basically 2 remarks here:

1. The name should probably be "inhibit-charge-when-on" since the power_supply
   calls is platform agnositic and "S0" is not.

2. We need to clearly define what happens when the device is suspended and then
   make sure that the driver matches this (e.g. if we want to *not* inhibit during
   suspend we may need to turn this feature off during suspend).

Regards,

Hans



> +			force-discharge:   Force discharge while AC is attached
> +			================== =====================================
>  
>  What:		/sys/class/power_supply/<supply_name>/technology
>  Date:		May 2007
> diff --git a/drivers/power/supply/power_supply_sysfs.c b/drivers/power/supply/power_supply_sysfs.c
> index edb058c19c9c..1a98fc26ce96 100644
> --- a/drivers/power/supply/power_supply_sysfs.c
> +++ b/drivers/power/supply/power_supply_sysfs.c
> @@ -140,6 +140,7 @@ static const char * const POWER_SUPPLY_SCOPE_TEXT[] = {
>  static const char * const POWER_SUPPLY_CHARGE_BEHAVIOUR_TEXT[] = {
>  	[POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO]		= "auto",
>  	[POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE]	= "inhibit-charge",
> +	[POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE_S0]	= "inhibit-charge-s0",
>  	[POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE]	= "force-discharge",
>  };
>  
> diff --git a/drivers/power/supply/test_power.c b/drivers/power/supply/test_power.c
> index 2a975a110f48..4bc5ab84a9d6 100644
> --- a/drivers/power/supply/test_power.c
> +++ b/drivers/power/supply/test_power.c
> @@ -214,6 +214,7 @@ static const struct power_supply_desc test_power_desc[] = {
>  		.property_is_writeable = test_power_battery_property_is_writeable,
>  		.charge_behaviours = BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO)
>  				   | BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE)
> +				   | BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE_S0)
>  				   | BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE),
>  	},
>  	[TEST_USB] = {
> diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
> index 6ed53b292162..b1ca5e148759 100644
> --- a/include/linux/power_supply.h
> +++ b/include/linux/power_supply.h
> @@ -212,6 +212,7 @@ enum power_supply_usb_type {
>  enum power_supply_charge_behaviour {
>  	POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO = 0,
>  	POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE,
> +	POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE_S0,
>  	POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE,
>  };
>  

