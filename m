Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72E24C91
	for <linux-doc@vger.kernel.org>; Sun,  6 Oct 2024 10:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728211800; cv=none; b=jwZkLvUprQlibm8beA1StiFznOgD0idcESGe5kfBNaImK+ZEwL1Vtm4oH8UdXf5m4Mr0SlqyjNXmI7lVfBNaLswUMqkmlDJRMleYgvc6STVwOy/ATJbeW0aWBXFk13DAVV0dYw/2bgRUofTZuoHgjWj4uRllzhQsg+UOx1rBE/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728211800; c=relaxed/simple;
	bh=E8L96tVfgGVZ7VX9L5r18iqyQhEy1HOc44YA4bAOI/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZUFQ4Zd/ful5NrQafI4fv9M7U0K23PZLB9m1srmVzbGifVtolxc8IXoTKfIOx4VQ9Bnhm6YKDXnE0OLb5uNyGTmmPa+yzW0Vd4M5U2ekYQgopNQ92VIHHvhr8ThJpFCR56tSEBuF8Atmnwvgye4IafVEF9yni6aZ6W7Buc4W5Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T+RNSkc5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T+RNSkc5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728211796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N0I5g/3hrB2raC35TGDOkVo1grl5AIkAJOloeD3JxtA=;
	b=T+RNSkc5108ItuG1WhDxDESnhfUyOZ+6wznraFYfZUpfqyN/Prg0xU1veI8nPL6ufKnXm7
	N6w9wLv1QKuFVp7jZRClrrJzur0dSNWhnu0L5GUCTea59W0ggFA2D7JdGoIVwynvi7QlFZ
	nA9YlHxJ6AWPBWObLDdLIb23aDoADbM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-SNTm5lp3MjWO-hfVYHYoKA-1; Sun, 06 Oct 2024 06:49:55 -0400
X-MC-Unique: SNTm5lp3MjWO-hfVYHYoKA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5c86d0ff3a8so3186531a12.1
        for <linux-doc@vger.kernel.org>; Sun, 06 Oct 2024 03:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728211794; x=1728816594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N0I5g/3hrB2raC35TGDOkVo1grl5AIkAJOloeD3JxtA=;
        b=K5Q+BNj0o0GpFFs4AVkW04elpETHIGfTazZZ5J7y0njPwkM2wrM0EWPimTRkNUxXCC
         /dJSsSA/vtbq8sykEhBTBNLD13gylRl6i+1LdNYhJTI0EtWvSwCHfhvGbEf855f6ODZJ
         iv000MVqK76EQxIfE3BoQ11ymaEJxr2u1iYpcrsU57d0hsSJsAGDaLW3rTmGtiXLtCMU
         67mRKkvmIHxvrafyfrnYFgUp5TyKTYz8cl9h24XOuT/4myEoFuZplU2BUeMJVNA2LcYJ
         C7Q1nd07NoZveKCU3wemJ16N3mFbI8SB2itLYCbTyDbTipsKfFuIJWNmYct9xwJmbXpo
         cnXw==
X-Forwarded-Encrypted: i=1; AJvYcCVPdOT7ssFfdKcwF7S684pwP7mixNVURE5ADz6rtMZkhBzcEYwKDx9jpJ8ML9sSnw7mb7iR4Q5h394=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHRDErJknAgGXiZXOpN93Rj/WiY61IAawsUFabosacIclxT8go
	IvInUluKcyVd3P18aqNB42E1fDrs/m8vAT2En8s1YuXee+a1Fos0Jh6AGoyxApfuocm+NvRbpKO
	mve0GCe/QqIg0gknMTA08SBhB0OR1RMFbbusyAX1iICIddgG8ZR5a7TuQOw==
X-Received: by 2002:a17:906:6a20:b0:a89:f1b9:d391 with SMTP id a640c23a62f3a-a991bd08219mr1036198866b.14.1728211794317;
        Sun, 06 Oct 2024 03:49:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaA+xxSBuABBBNfUx7MGmssKZawRSVqf5LpTu2EeC7zHnSUgXDHUcLau3WnsT1s4Fv2dILVw==
X-Received: by 2002:a17:906:6a20:b0:a89:f1b9:d391 with SMTP id a640c23a62f3a-a991bd08219mr1036197266b.14.1728211793924;
        Sun, 06 Oct 2024 03:49:53 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a992e7e5544sm238105566b.202.2024.10.06.03.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Oct 2024 03:49:53 -0700 (PDT)
Message-ID: <263ec855-d19d-4b81-b3cd-1a7f575c9c27@redhat.com>
Date: Sun, 6 Oct 2024 12:49:53 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86: wmi: Update WMI driver API
 documentation
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com, corbet@lwn.net
Cc: platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241005213825.701887-1-W_Armin@gmx.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241005213825.701887-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Armin,

On 5-Oct-24 11:38 PM, Armin Wolf wrote:
> The WMI driver core now passes the WMI event data to legacy notify
> handlers, so WMI devices sharing notification IDs are now being
> handled properly.
> 
> Fixes: e04e2b760ddb ("platform/x86: wmi: Pass event data directly to legacy notify handlers")
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Thank you for your patch/series, I've applied this patch
(series) to my review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Since patch 2/2 makes non pure bugfix functional changes
I expect Ilpo to pick that one up for pdx86/for-next.

Regards,

Hans




> ---
>  Documentation/driver-api/wmi.rst | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/driver-api/wmi.rst b/Documentation/driver-api/wmi.rst
> index 6ca58c8249e5..4e8dbdb1fc67 100644
> --- a/Documentation/driver-api/wmi.rst
> +++ b/Documentation/driver-api/wmi.rst
> @@ -7,12 +7,11 @@ WMI Driver API
>  The WMI driver core supports a more modern bus-based interface for interacting
>  with WMI devices, and an older GUID-based interface. The latter interface is
>  considered to be deprecated, so new WMI drivers should generally avoid it since
> -it has some issues with multiple WMI devices and events sharing the same GUIDs
> -and/or notification IDs. The modern bus-based interface instead maps each
> -WMI device to a :c:type:`struct wmi_device <wmi_device>`, so it supports
> -WMI devices sharing GUIDs and/or notification IDs. Drivers can then register
> -a :c:type:`struct wmi_driver <wmi_driver>`, which will be bound to compatible
> -WMI devices by the driver core.
> +it has some issues with multiple WMI devices sharing the same GUID.
> +The modern bus-based interface instead maps each WMI device to a
> +:c:type:`struct wmi_device <wmi_device>`, so it supports WMI devices sharing the
> +same GUID. Drivers can then register a :c:type:`struct wmi_driver <wmi_driver>`
> +which will be bound to compatible WMI devices by the driver core.
> 
>  .. kernel-doc:: include/linux/wmi.h
>     :internal:
> --
> 2.39.5
> 

