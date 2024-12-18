Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA29224F6
	for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 14:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734531858; cv=none; b=QM2zdQHlvhfsxr0l9ImYqRSBGbUPFd7WOjyWCduTqf4Em/kjINs8hSgKwXTkuskSIvPTWjoZj7aES4m0h3Xy1ixPfBv6cZqtTYPP710t5198rF2jLccS7CmeSJsIaieaGvhFqSj1hJqJG7kBDpfmL1LCbTT8e9UjFDfW1hR2cU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734531858; c=relaxed/simple;
	bh=fxq5WPhXvFyAK+buBZe3FD3w5xOl2nrTCisD3TZj8AA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PuQsJKyMabUGCdIC42HqIe1SXLBxGRC9qp6v8vTSQz9iciHaQDnb/gU+S+JuCtDCwmmssEprfIU/gPrs3WEeZnwNFxW4SokemEBGeRWZTXDhaA+0HpNRF7/G6rSLm7AyTQn4gulzg8fYixK6QNZAL7lwQLQJxzrkx39w4W7tFis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gYjMzyHY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gYjMzyHY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734531855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wYDfdm4rHVwC2HrRooT1qxFxAJepkEO0lOVD/zIJr0U=;
	b=gYjMzyHYiTlHqoEoATbxOo83IFpLKpQLQF3FZ5/QJdXYroy+XIsjtImBOoZKMgG5thYmkc
	EpQS/nMIBU5BP6jOBLJQSod5xu+KLRoVsCFGXr7Nh0K5x6KZLuBo8qkkqEICyY127LA3Ir
	6VVJP9/0VVrZA3uRILLZGN3DLMf8vwg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-157-yVQQ0-e9PqKLpx4PCPBbUA-1; Wed, 18 Dec 2024 09:24:13 -0500
X-MC-Unique: yVQQ0-e9PqKLpx4PCPBbUA-1
X-Mimecast-MFC-AGG-ID: yVQQ0-e9PqKLpx4PCPBbUA
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5d3eceb9fe8so4034691a12.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 06:24:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734531853; x=1735136653;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wYDfdm4rHVwC2HrRooT1qxFxAJepkEO0lOVD/zIJr0U=;
        b=CCnJF5ECmGf0Ih0dYGwpNFfiPRl+h4Hm9A+xE3I4YMMdipiA+8LMjharLs5dIwL8DN
         VI2L3SwhRfUiPahcywkUnyzN1SECIUDupEh5z0iDL195Tc6pTbphhgZIQEbbYPwZX37u
         Scjrz5YNawEYuLdaj6eFOSNAAuh7TFpQLh3qfhQ2CsEuoLosJ8tWOA/9t609aWFZHl7R
         uC/V7t/kYS5zbH8RmPavjyVrbH5q5qpD7aAGjwHidMMlNQit40tt0mu9JOmpgMi6M8KZ
         PawX26DYmZ2dgCWXoQWwpNGM4wHErCS3Z6Eo0jC/v/PhC+sKlh7R70THxcAlZRoJIf5c
         xsww==
X-Forwarded-Encrypted: i=1; AJvYcCVfVHCveVA8lV9QxjQpz0D94UfaJKJO864B0MS1xw+hlRdevM0JEE0+ewQFqH4qv5rL22IvtOEb+Lc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+Bsd7eMkicBb77WllLXEFJ294z1O6aZBxnzgSyH/xq8ak6eMm
	uh9522u+IWyFiHV/rwTLzKsjQ1taQkK/WL3I+3EGuwWDdRCTjfzcanplyAyszmWt33N3SUfhsBY
	cHwxBVCTv0Fdhonjt9bKjyFP/ds2o+lsd33hlAvP+2lSYKhZI3pFDVi90JA==
X-Gm-Gg: ASbGncs4sS9Er4Yh40w83FT832RrrHdZFMK73dJO8mCkdz5oCqtyWxBVFT+T8FDdMTv
	8ficaNB+tbJ8t0S2WtpxAGzK4rjsXCO1tQ5gQppWfutVNL3rQlaFc4nkNpzbGhwvEVkB1Ob82Qf
	gUgu8ImUB0Z+dG3/EN4b0hp1pTzKSNG1IGQd3zjsB90n6S68wz1GtIM4v9B3DhSLpRneQyHDMFS
	mWhoE8DhZG5yEvqwE8VLBWSOf39qYJcl0cGH8D+nrrpbrQ+Grx94dxulNl/X+gfLE1ghMhTvF3e
	lQBy73TSKkrQE4N0BwswuimlNif8nnAUTWwflS37+IrLqXMDYz+ZvqRgSu8PI/1qCH0ixOMvsLZ
	hGyu33CdqdeL4gTgL99Kds4yMJy45gWE=
X-Received: by 2002:a05:6402:34cb:b0:5d0:e826:f0da with SMTP id 4fb4d7f45d1cf-5d7ee3b4ce0mr2712544a12.16.1734531852727;
        Wed, 18 Dec 2024 06:24:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFtRdU6T9fjczyDU36xPulMKDITuG4yX5oo84uMCHGFDo5XudrAQybG+dnV4bd1kStWZRLnQ==
X-Received: by 2002:a05:6402:34cb:b0:5d0:e826:f0da with SMTP id 4fb4d7f45d1cf-5d7ee3b4ce0mr2712521a12.16.1734531852288;
        Wed, 18 Dec 2024 06:24:12 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652ab5109sm5407494a12.16.2024.12.18.06.24.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 06:24:11 -0800 (PST)
Message-ID: <6d2e175f-0a84-4a6f-9484-c2c299bcc3c5@redhat.com>
Date: Wed, 18 Dec 2024 15:24:10 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
To: Armin Wolf <W_Armin@gmx.de>, Joshua Grisham <josh@joshuagrisham.com>,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org
References: <20241216103855.18457-1-josh@joshuagrisham.com>
 <c23c4c88-786a-4662-a448-deb006b7a03c@gmx.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <c23c4c88-786a-4662-a448-deb006b7a03c@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Armin,

Thank you for reviewing this new driver.

On 17-Dec-24 10:31 PM, Armin Wolf wrote:
> Am 16.12.24 um 11:38 schrieb Joshua Grisham:

<snip>

>> +/*
>> + * Hotkey work and filters
>> + */
>> +
>> +static void galaxybook_kbd_backlight_hotkey_work(struct work_struct *work)
>> +{
>> +    struct samsung_galaxybook *galaxybook =
>> +        container_of(work, struct samsung_galaxybook, kbd_backlight_hotkey_work);
>> +
>> +    if (galaxybook->kbd_backlight.brightness < galaxybook->kbd_backlight.max_brightness)
>> +        kbd_backlight_acpi_set(galaxybook, galaxybook->kbd_backlight.brightness + 1);
>> +    else
>> +        kbd_backlight_acpi_set(galaxybook, 0);
>> +
>> +    led_classdev_notify_brightness_hw_changed(
>> +        &galaxybook->kbd_backlight,
>> +        galaxybook->kbd_backlight.brightness);
> 
> This is the exact reason why i think this should be done in userspace. You can replace this code
> with a simple input event submission using the KBDILLUM* key codes. This would also allow you to
> avoid any special locking in this case.
> 
> This would also allow userspace to configure the step with of the brightness changes.

As discussed in an earlier thread, there is really no good way to let
userspace handle this atm. KEY_KBDILLUMTOGGLE gets mapped to XF86KbdLightOnOff
while we really want Cycle, as we have in e.g. XF86MonBrightnessCycle.

I just checked gnome-settings-daemon and it does handle XF86KbdLightOnOff
but it only toggles on/off. In most laptops the cycle key is handled by
the embedded controller and this simply emulates that common setup to
match what userspace currently expects.

Handling this in userspace would require adding a new KEY_KBDILLUMCYCLE
and then adding support for that to xkb and maybe also upower and
gnome-settings-daemon and KDE and then wait for that all to land before
things start to work.

As for your argument about allowing to set the percentage to step,
note that this in kernel handling only increaeses the level by 1 on
the hotkey press that make sense because typically these kbds backlights
only have 2 - 4 levels.

So IMHO handling this in the kernel is an acceptable compromise,
(yes I do realize that this is a compromise).

If some need arises later to do move this to userspace we can always
add a module parameter to completely disable the in kernel handling and
instead send out a new KEY_KBDILLUMCYCLE key-code when this now
module parameter is set.

Regards,

Hans



