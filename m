Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DBF3FE48
	for <linux-doc@vger.kernel.org>; Mon, 22 Jan 2024 11:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705922902; cv=none; b=SuePbXlIGGpG7d1g6HgfpUz2ZWKUjNMqLLJpD3/nOfXKvQAFwyAgT7v3jdumdd/FW/vZzNrik8wpKVFsxMozlWU9LD7DQTpwSMBkg/Y/jodYtg2TEVkMWbPPGYZHfJNDbfotYC6DTL/7Om1oUaQupGqVIjL1iq6wOBteaGaakNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705922902; c=relaxed/simple;
	bh=+P/PxxB9xXCSENlP/VU3mHAi0Q3gkIF8SmyqvXOjVrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gwntGA2UrQCZLOA6cCFpoamvr7lZoa8HhvzSZKHLzLmnufS6lvjIH8nVesF4X1AFpFIv0BwnOEnCBM1CP/k/HLvM01c/LZooXo0CwKlPC9NeQ45RlSap240GPGftLG7J9VjSeL2eAc461pqxoe/SyCCyGpOEA0JMnTl5PQR79ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=httGQIhg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="httGQIhg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705922900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MnMtinosHpLnbII+9S7MEoYav8UQT9UmvvoZomxIxQs=;
	b=httGQIhg9WNFnV+sPrql2uTpPUd6ySxNmGTu+I6nNEYSHpOORTjc0hlFeHB+hGZJDUp0Bc
	hWP/yqqPkmNH2Gyib0FvntrbGpaVAeCRGDlmiaM6k04sI69lWBRIsrwhU0KwlyrgpZ/SE/
	Wcv02E9iRGsbuYGKGKZecgInHiy/p7k=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-xqH4ogSDO2atNztoycZ2LQ-1; Mon, 22 Jan 2024 06:28:19 -0500
X-MC-Unique: xqH4ogSDO2atNztoycZ2LQ-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2ccae3410d3so16890221fa.2
        for <linux-doc@vger.kernel.org>; Mon, 22 Jan 2024 03:28:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705922897; x=1706527697;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MnMtinosHpLnbII+9S7MEoYav8UQT9UmvvoZomxIxQs=;
        b=UVquEfQvMWLpsNVzhNla4Jfg6hax1B0p8aJoKrjTILtqCLWuvxlbx1hi39bZmusn5G
         Gmm8ozEhQEQqTRPy9QT6DJXmyCQpnePxMJV/Auxodg+6qVPKCGRvIhJnng2LLOZ6sAT6
         TBtHqv4TAi7/hy2HBVgWQlTSA2eExqw73c1YtDTcBh6yPioSw0TACkWO4utCaBp0SZMm
         uiTex99+kWaqdrvUfZ9OKK7ZlglnOEcsw6PdaoSPiVwsHZnVW3kCrH/pEuaQjCm2x5Sv
         qYTTsvWvo/admXW1zrQVenrMa9ZPv68xFsbvkkALx2TcmfIUIBEpu7Tj9bgMpUsgNGIg
         BZzg==
X-Gm-Message-State: AOJu0YwTZ1ZUOTkiIF5fo14qo/pFgbLh0+La/90BMF62Vmr8IUcr53aQ
	rMt3GAmoisFnjMttTpGHml0/kIYM0BkhRbHtwQfUeW9LCygXozX7brXtKav3KIqpUTdEEj6a17R
	wqZc4heSwdT8BUw2Qjw9MKqbFLLR3pX5UBrPHqALK9+2TzQAZ9+7IKUmAsC8KhNqbzQ==
X-Received: by 2002:a05:6512:220f:b0:50e:aee2:d55e with SMTP id h15-20020a056512220f00b0050eaee2d55emr1139737lfu.100.1705922896869;
        Mon, 22 Jan 2024 03:28:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1Mt20VKTIGU4mltb75bJnFQEqGLue7NfdlRCFFijVXPfAH78mnMOrL2wKHEc+FjiUHwDVTg==
X-Received: by 2002:a05:6512:220f:b0:50e:aee2:d55e with SMTP id h15-20020a056512220f00b0050eaee2d55emr1139736lfu.100.1705922896543;
        Mon, 22 Jan 2024 03:28:16 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id fj12-20020a1709069c8c00b00a3076eec436sm423813ejc.5.2024.01.22.03.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 03:28:16 -0800 (PST)
Message-ID: <729d7887-7681-476b-9b5f-c498d78df2cb@redhat.com>
Date: Mon, 22 Jan 2024 12:28:15 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: Support for mode FN key
Content-Language: en-US, nl
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: corbet@lwn.net, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <mpearson-lenovo@squebb.ca>
 <20240120232949.317337-1-mpearson-lenovo@squebb.ca>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240120232949.317337-1-mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/21/24 00:29, Mark Pearson wrote:
> New Thinkpads have added a 'Mode' Function key that on Windows allows
> you to choose the active profile (low-power, balanced, performance)
> 
> Added suppoort for this hotkey (F8), and have it cycle through the
> options available.
> 
> Tested on X1 Carbon G12.
> 
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  .../admin-guide/laptops/thinkpad-acpi.rst     |  7 ++++++-
>  drivers/platform/x86/thinkpad_acpi.c          | 20 ++++++++++++++++++-
>  2 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> index 98d304010170..7f674a6cfa8a 100644
> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> @@ -444,7 +444,9 @@ event	code	Key		Notes
>  
>  0x1008	0x07	FN+F8		IBM: toggle screen expand
>  				Lenovo: configure UltraNav,
> -				or toggle screen expand
> +				or toggle screen expand.
> +				On newer platforms (2024+)
> +				replaced by 0x131f (see below)
>  
>  0x1009	0x08	FN+F9		-
>  
> @@ -504,6 +506,9 @@ event	code	Key		Notes
>  
>  0x1019	0x18	unknown
>  
> +0x131f	...	FN+F8	        Platform Mode change.
> +				Implemented in driver.
> +
>  ...	...	...
>  
>  0x1020	0x1F	unknown
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index c4895e9bc714..ceb22f8d8442 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -166,6 +166,7 @@ enum tpacpi_hkey_event_t {
>  	TP_HKEY_EV_VOL_MUTE		= 0x1017, /* Mixer output mute */
>  	TP_HKEY_EV_PRIVACYGUARD_TOGGLE	= 0x130f, /* Toggle priv.guard on/off */
>  	TP_HKEY_EV_AMT_TOGGLE		= 0x131a, /* Toggle AMT on/off */
> +	TP_HKEY_EV_PROFILE_TOGGLE	= 0x131f, /* Toggle platform profile */
>  
>  	/* Reasons for waking up from S3/S4 */
>  	TP_HKEY_EV_WKUP_S3_UNDOCK	= 0x2304, /* undock requested, S3 */
> @@ -3731,6 +3732,7 @@ static bool hotkey_notify_extended_hotkey(const u32 hkey)
>  	switch (hkey) {
>  	case TP_HKEY_EV_PRIVACYGUARD_TOGGLE:
>  	case TP_HKEY_EV_AMT_TOGGLE:
> +	case TP_HKEY_EV_PROFILE_TOGGLE:
>  		tpacpi_driver_event(hkey);
>  		return true;
>  	}
> @@ -11118,7 +11120,23 @@ static void tpacpi_driver_event(const unsigned int hkey_event)
>  		else
>  			dytc_control_amt(!dytc_amt_active);
>  	}
> -
> +	if (hkey_event == TP_HKEY_EV_PROFILE_TOGGLE) {
> +		switch (dytc_current_profile) {
> +		case PLATFORM_PROFILE_LOW_POWER:
> +			dytc_profile_set(NULL, PLATFORM_PROFILE_BALANCED);
> +			break;
> +		case PLATFORM_PROFILE_BALANCED:
> +			dytc_profile_set(NULL, PLATFORM_PROFILE_PERFORMANCE);
> +			break;
> +		case PLATFORM_PROFILE_PERFORMANCE:
> +			dytc_profile_set(NULL, PLATFORM_PROFILE_LOW_POWER);
> +			break;
> +		default:
> +			pr_warn("Profile HKEY unexpected profile %d", dytc_current_profile);
> +		}
> +		/* Notify user space the profile changed */
> +		platform_profile_notify();
> +	}
>  }
>  
>  static void hotkey_driver_event(const unsigned int scancode)

