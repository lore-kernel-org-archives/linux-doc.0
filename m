Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D54132130
	for <linux-doc@vger.kernel.org>; Mon, 24 Jun 2024 11:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719229696; cv=none; b=Q36RAtk/MkwCkSrBJFmo5QNGFoOpGZzRIhQtjytBX6SRjc0y1IpFkgpwozmnyOfy/ITidrE+Au+qbNNIel7aPSwb25C5K+82cLbLw3HKdsGntJ7fiReQyKSIRODQbnocySxNThXLDaIxyZ4FN77hovtSkvx0/LypabSuHKoC24w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719229696; c=relaxed/simple;
	bh=xGsMt4ZMBJrDwABO0KnAkxwZA8PSWTKbV5FABWmD/aw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rzOkmQhUgTPYpRhIHs/9ohIPj39GzNYiDFRmest5KYzNFqbXfni9Jbpzv47Txa/aL+KlGbvdMWbJy0Jr2SQaMa97XqfEexQqvRp+SQRfkLjLhA9WzIaw68sPkkp8QIf5gPdjYgSyNZp0RV8PIZQ5SQckrj2+CzawIWx7fq7wCEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ghpYbXER; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ghpYbXER"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719229693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EcV889m9n099FSa3hGP9VdafvCoKGrReBu+wZKTWFrk=;
	b=ghpYbXERWi3BMXVv1ElE/T1p1DQbNs2W+3vEAzoQlZ3W+x3WDhUJ7vY1MyrC78enM+Cxg+
	o8UbuXcsV806mC9ydc8AyHhYpz2JDsKUzFS1XoCQPplLqw8L5yyte0IrG9zFPsJ1mI7xs1
	8ozkb6SFDoGBFpUx7tgjdeM+/8+kyjA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-5uTr4PQ8MLOAP8Wz2Yib9g-1; Mon, 24 Jun 2024 07:48:11 -0400
X-MC-Unique: 5uTr4PQ8MLOAP8Wz2Yib9g-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a725eed1cecso27125566b.3
        for <linux-doc@vger.kernel.org>; Mon, 24 Jun 2024 04:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719229690; x=1719834490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EcV889m9n099FSa3hGP9VdafvCoKGrReBu+wZKTWFrk=;
        b=vn0qoGgyoToTHGg3SNQsA/L9J1YjSa9mDp+N27FF5Bb8WRIym0SGcEHhvcKXgDSwfG
         Gf6PeMugJog3ebiAMiQ9P8Oz/I1PlmUc20HsSSVNzdZxDHaAWwTf21l1FTF7Mi3nDkG9
         A9iizE4pX2ppraIT1nVzP1F0dAh8hqvp/IMpTrCiNM+eeJ2gHRszQCMlR4Bj+vUxx6VS
         gbrH3Q17z71s7fPEjJ36uUwtJFYiulduVcpUQzAkP0VDhNJFLM/5zcZsmvcRxBt6IwBm
         EHLurVZmrcBc8bwiWoZ4TxL3HQJNjOQ5KAbG2jRWGALoyT7giOTyJznDI8GnvIMQFUvm
         9fTg==
X-Forwarded-Encrypted: i=1; AJvYcCWE9h+IVOwoa/L4FSuLZ7ThDRdMT7hZLrazI6jMPx7QzDEpq+MsR29CAYYSAWk0QNRqh2j7u2EoEzwAJr/hW9frhNmkqWqyi1EN
X-Gm-Message-State: AOJu0YzPjcyvjsCg4dpGA3/8nNrKhuNhowlIBeGj2H5zv8UWSZjr/u2i
	jQpHfVoBFWHxwT9VNYB6MJtm832IvESmvNBTaACgpq5KfIbbOCCK1U4T0uk2em/8thDwCYZe5ac
	cNB0P84YBfKPBU4kFj4PhepqiTpoawrKG7CT1vMUl4BF5M5c8kYxSqqJvO4Nk9Ug+kg==
X-Received: by 2002:a17:906:a8d:b0:a6f:b940:10b with SMTP id a640c23a62f3a-a7245c824admr247625466b.62.1719229689812;
        Mon, 24 Jun 2024 04:48:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcCsPIHseM/1ERsjsN4BH9BeJrdjRCslHDdFQUF18nXEPnqFecu9/ZrknsYtKsmjg/BSm14g==
X-Received: by 2002:a17:906:a8d:b0:a6f:b940:10b with SMTP id a640c23a62f3a-a7245c824admr247624566b.62.1719229689456;
        Mon, 24 Jun 2024 04:48:09 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a725f74ee94sm33863466b.224.2024.06.24.04.48.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 04:48:09 -0700 (PDT)
Message-ID: <8a6e955e-1829-404a-a962-32dcbacd53cc@redhat.com>
Date: Mon, 24 Jun 2024 13:48:08 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] platform/x86: wmi: Add driver_override support
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com
Cc: corbet@lwn.net, platform-driver-x86@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240620194214.3071-1-W_Armin@gmx.de>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240620194214.3071-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/20/24 9:42 PM, Armin Wolf wrote:
> This patch series add support for using the driver_override sysfs
> attribute with WMI devices. The reason for this is that there will
> exist a couple of generic WMI drivers in the future for allowing
> driver developers to directly access the underlying WMI device.
> 
> Since those generic WMI drivers do not have an ID table, the
> driver_override mechanism is used to bind them to WMI devices.
> 
> Armin Wolf (2):
>   platform/x86: wmi: Add driver_override support
>   platform/x86: wmi: Add bus ABI documentation

Thanks, the series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Regards,

Hans

> 
>  Documentation/ABI/testing/sysfs-bus-wmi | 79 +++++++++++++++++++++++++
>  MAINTAINERS                             |  1 +
>  drivers/platform/x86/wmi.c              | 33 +++++++++++
>  include/linux/wmi.h                     |  4 ++
>  4 files changed, 117 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-wmi
> 
> --
> 2.39.2
> 

