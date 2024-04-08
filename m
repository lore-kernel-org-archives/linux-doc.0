Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1362B1411D9
	for <linux-doc@vger.kernel.org>; Mon,  8 Apr 2024 15:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712590850; cv=none; b=ECcDYyGYhu7LuitXFAFrhCJcTQaMfC3GP1I1cxWrw1/tbJoj5TDeYc+luMAfseFyj5ukzUQKb+yEdAW8WZ8jhdwLefERSyijD/SltxAz1sR7hfxEqkdKrQOWkNmFfAuPKzzhVBujlT+JM2d51QZwnLTOqlFc/GNIRBLbxAUniq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712590850; c=relaxed/simple;
	bh=53u/ieqERkyf7mkrfcHCloeINDAbD0lTZhdu4LH8wOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ryklC0lKCuh79NJiCmt1tvPWZEzN9BTDSld0Zp8RkgCI1KbLZWJKWm7TisCCheUlp9tz3N2DzaG7ob8Zu7+YioZyQ8+VZWpiVgXE93n5QvEgzd7gJuRNE2FtYYPaZOucueL47ZWDd0on0WjEjSJ00RB/fGRLH4Z9qKxTsBz9xz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ab03kL58; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ab03kL58"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712590848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qnh8e0FZeCXeuN57OAvQ7h9lJ3J1XV9u7rdXhlfnOms=;
	b=ab03kL58ekied4CFhTNHO4Tfbup6zz+HA920OL3Hn94qS5nZ2nhBndxnsIsKIrvIyz/GV/
	G4vo+c9PXiyS7PdMNlXcjwWjcSc1tF5bDeqeIh+o16tygXIrMif8C1o79dJVjFwebjG7Tm
	6kZjDowPpZe3pLM5O8pRM7zcdQ4uWkM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-gmICQph0M3-v_9ueHYaq-A-1; Mon, 08 Apr 2024 11:40:46 -0400
X-MC-Unique: gmICQph0M3-v_9ueHYaq-A-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a5199cc13b2so282601566b.0
        for <linux-doc@vger.kernel.org>; Mon, 08 Apr 2024 08:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712590845; x=1713195645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qnh8e0FZeCXeuN57OAvQ7h9lJ3J1XV9u7rdXhlfnOms=;
        b=iVcOoc3W0it2Ch3AJPkr4AoCi8XpuqKzg3wKKM8BTk6GkzWVX2++urNxQxigN8+rfm
         1UqgogtcXr8Q+6QYv4bWaF0/A1F7lU6awi8OlXjjbMmda272YSFLjZsnzy4ml6lJAy7c
         e0s8485CSHTEiPZCYBxLFs49/USnsqeDnGpCulSdlIp1B1dCeavuNuLJHghPmMyFUAAS
         tZWOKXp94/ZXK132OBohn9jGheJmUDbJukyV5LkESRLBRmmu9NNSS2ctfButQ+X+KcUC
         axiW//XwUxWBgVRWZRdeMh6zGuLfLILAf7M+CZShFYVd3Imp7G8AMTZIBAhQ6ZE/fG0L
         3DMA==
X-Forwarded-Encrypted: i=1; AJvYcCWrVlHs034jN/4UcKVa/hqOU73qWLwpOrxhuoez6n8YdfDDthEvmmtIwDpKc147OBtHuBoTk6ISbZPEflSABonvJvjzADi1COM2
X-Gm-Message-State: AOJu0YyV3W4juQ8FOw98xKtztvkRGhWxn2SyCCFY2/6R23OVhx6mGuAX
	xjKmgB5n6woY/1i28JBP/L9/on5TH0H3uzMh+OTsmfyKttguZLy1ubKe9jS8poPkt2GoWFW55eM
	xJ2aM/Uuz/9MGFZIWpR8oEsRV4pRoysypUid4HdFuqw/iiL8y4YOXcPIncCLAGtxQJZ8/
X-Received: by 2002:a17:907:2687:b0:a51:e427:f418 with SMTP id bn7-20020a170907268700b00a51e427f418mr30716ejc.35.1712590845509;
        Mon, 08 Apr 2024 08:40:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqFndACzMzgue7oq/n2V6d4eUGU5nTF24UnlZxTj1ggn2kkYl8iT6pHsyvZaXtQ8vguwA9HQ==
X-Received: by 2002:a17:907:2687:b0:a51:e427:f418 with SMTP id bn7-20020a170907268700b00a51e427f418mr30684ejc.35.1712590845135;
        Mon, 08 Apr 2024 08:40:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id m8-20020a1709061ec800b00a46d2e9fd73sm4573031ejj.222.2024.04.08.08.40.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 08:40:44 -0700 (PDT)
Message-ID: <7d1cd4f6-118a-4dbf-a882-4c13386a0e18@redhat.com>
Date: Mon, 8 Apr 2024 17:40:44 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] platform/x86: wmi: Mark simple WMI drivers as
 legacy-free
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com
Cc: corbet@lwn.net, sathyanarayanan.kuppuswamy@linux.intel.com,
 linux-doc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240402143059.8456-1-W_Armin@gmx.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240402143059.8456-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/2/24 4:30 PM, Armin Wolf wrote:
> The inspur_platform_profile driver and the xiaomi-wmi driver both
> meet the requirements for modern WMI drivers, as they both do not
> use the legacy GUID-based interface and can be safely instantiated
> multiple times.
> 
> Mark them both as legacy-free using the no_singleton flag.
> 
> Compile-tested only.
> 
> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans




> ---
> Changes since v1:
> - add Reviewed-by tag
> ---
>  drivers/platform/x86/inspur_platform_profile.c | 1 +
>  drivers/platform/x86/xiaomi-wmi.c              | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/inspur_platform_profile.c b/drivers/platform/x86/inspur_platform_profile.c
> index 743705bddda3..8440defa6788 100644
> --- a/drivers/platform/x86/inspur_platform_profile.c
> +++ b/drivers/platform/x86/inspur_platform_profile.c
> @@ -207,6 +207,7 @@ static struct wmi_driver inspur_wmi_driver = {
>  	.id_table = inspur_wmi_id_table,
>  	.probe = inspur_wmi_probe,
>  	.remove = inspur_wmi_remove,
> +	.no_singleton = true,
>  };
> 
>  module_wmi_driver(inspur_wmi_driver);
> diff --git a/drivers/platform/x86/xiaomi-wmi.c b/drivers/platform/x86/xiaomi-wmi.c
> index 54a2546bb93b..1f5f108d87c0 100644
> --- a/drivers/platform/x86/xiaomi-wmi.c
> +++ b/drivers/platform/x86/xiaomi-wmi.c
> @@ -83,6 +83,7 @@ static struct wmi_driver xiaomi_wmi_driver = {
>  	.id_table = xiaomi_wmi_id_table,
>  	.probe = xiaomi_wmi_probe,
>  	.notify = xiaomi_wmi_notify,
> +	.no_singleton = true,
>  };
>  module_wmi_driver(xiaomi_wmi_driver);
> 
> --
> 2.39.2
> 

