Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6374E1F708C
	for <linux-doc@vger.kernel.org>; Tue, 17 Dec 2024 15:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734448104; cv=none; b=KrO86IhtOv+bO6gmVQ0Lr6+hhsszP+Je40tDs4sKuu+INQ9QWjGPYW5HhZwOkSAG9YPR/6VoupANQlX9OK1TLXsWNfb2Kc6+oVKtIkY1Q4KS5WIHha9pa2eowMPrYPODa1UPPdoEqZvuPbIUUbmLhrYzj1sJ4GtjlOhALHWx1Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734448104; c=relaxed/simple;
	bh=EnOLx/nHKpZaAJE5Zlhn7nWmQRH3Q2HYlAAYXXmpiJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KY462TPmh2NLjmJGZu4B5aHzWDyq1ChO9g2aDQwup8BbHoBHshb4pylfB5NAxYwW0LlhFpfCbN5eSTsAsxh23gUw3XU5+cxP1EOL7CWkmbdJy5/S/tzzinViL1gQXP6aRelf4K+tmeMG7v3c8+a041u+FNgh3Tm9NLbOeUqt1jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S5qLMCar; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S5qLMCar"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734448099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D7ABiOnpBEGx89PJw5n4fgFhL0VnSY3UoS2smPvphwQ=;
	b=S5qLMCaroKOv72Ui+nrTCrRXB60mhldBWu99hVNLarud+aJgpkhGUGD4cW1yI5j7DBY0TO
	BXPgevqoWyepubYSu6DUXF+pQRrMvH92KpX/vHJ7t8dw9fpIL6hZtuC6BCC7zZcAweIRfb
	6xqT1YYic5rg05fVv8liCtunZWyq3pM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-ikrkh0LAMDiowYcI5iVd7g-1; Tue, 17 Dec 2024 10:08:17 -0500
X-MC-Unique: ikrkh0LAMDiowYcI5iVd7g-1
X-Mimecast-MFC-AGG-ID: ikrkh0LAMDiowYcI5iVd7g
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-aa676465b44so464224466b.2
        for <linux-doc@vger.kernel.org>; Tue, 17 Dec 2024 07:08:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734448097; x=1735052897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D7ABiOnpBEGx89PJw5n4fgFhL0VnSY3UoS2smPvphwQ=;
        b=nXiq6q4XAIQBig74tL9amNsOWUh3nyrf5CLm/GLY5BJj2Il8PzTBBjkAZ5gfAoETHF
         eDOZeyizhN0dRjKp0EiFe1WpgL802irosvx3eG87G4zEp9f9gayH6d42aUwIsjcqxo3K
         5WipFo/mHoacYg0dkke4nAd8e7TM1r2q4Hx5VV5QTLEKujXf8eplWg/yTC6G/Fz6bOS4
         qmuTcKL3EkPfcXfouDyjpgNtiGQQD8sPHiS0ZJAJj1ct3/xs5kp7/e/QkAV8Ywh9/SMf
         qfuwu1cLERjSQcVEUOBeiko1ZMAEGUL7sNRPDrgPIRrnZM7gPhc40/tHAjw5umD4g+8n
         qEcw==
X-Forwarded-Encrypted: i=1; AJvYcCVUKMMqs49/zhZG5OEHZdjieHwAZZ+7oVNDw6TZsMpQmPOiLSOXoGakA5ZNYTlBhZaZcxIYfQy3ZNg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhcyBe1BflrDGgF1HsK2H88T+5DCjH0CgfD5v5HVM/myKQ+CmS
	0TYUSzEi5+AZpyXc09d9TWZiK1ObptSMJlU6wMBd/yVBrCinCzeKpJ4N8bECE5mK+6EUxGppVQ9
	WsdJsT1FTgH5zN4rSxy9AnqRaBHj86pu3xOElEtSGyzQMpy6ili4uVhjDjA==
X-Gm-Gg: ASbGncubcG2K/n6BmD8dxzSckcQwX7pyDN2ok/Z3D4Fu6Vm248F4LytauxJR+KY1p3z
	oCgDgdStawFKy4j/3vG7LV7ALDvP+snwPTqBnAs/EXyyw/qYChuo1tmL2TdJWw5YmYeZ3Js4E2h
	/3kSDXaDecH3FpIelbQYqMY2/18VrYR9h0f5QdTf38a1JOspne2MMBpF6a7iOLkRIoNKzhL/KtS
	7I2323UeG7pEQ51tRWm0Zbk3G1To1H5BGEIpVI2zVUdetvmm1xcDpGFssW7TsG3
X-Received: by 2002:a17:907:2d26:b0:aa6:691f:20a9 with SMTP id a640c23a62f3a-aab778d9db3mr1484535766b.4.1734448096601;
        Tue, 17 Dec 2024 07:08:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDWHkMPveAxZ0xKYxQGkeagwKHAxrWPUWCyDh6esu0iO6udkUJ+rwK5j9MucJziPskb6Bquw==
X-Received: by 2002:a17:907:2d26:b0:aa6:691f:20a9 with SMTP id a640c23a62f3a-aab778d9db3mr1484531766b.4.1734448096173;
        Tue, 17 Dec 2024 07:08:16 -0800 (PST)
Received: from [192.168.162.203] ([109.36.231.174])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab9639363asm452932366b.169.2024.12.17.07.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 07:08:15 -0800 (PST)
Message-ID: <1aecf86b-6e3b-4755-8f1f-d3dbc8d13644@redhat.com>
Date: Tue, 17 Dec 2024 16:07:49 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: samsung-galaxybook: Add samsung-galaxybook
 driver
To: Armin Wolf <W_Armin@gmx.de>, Joshua Grisham <josh@joshuagrisham.com>
Cc: ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 corbet@lwn.net, linux-doc@vger.kernel.org, jdelvare@suse.com,
 linux@roeck-us.net, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241209163720.17597-1-josh@joshuagrisham.com>
 <53c5075b-1967-45d0-937f-463912dd966d@gmx.de>
 <CAMF+KebYQyN+gkHayAdZZHPU7DbghwpmVQaLFaf0TiBb-CVp7A@mail.gmail.com>
 <44cd9966-e24a-4386-a0cb-20b1022adcee@gmx.de>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <44cd9966-e24a-4386-a0cb-20b1022adcee@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 17-Dec-24 2:41 AM, Armin Wolf wrote:

<snip>

>> Regarding the keycode do you mean that this should send something to
>> the input device via the sparse keymap or that the i8042 filter should
>> emit a key event, or? And/or that it could be handled with a hwdb
>> update in systemd so that this key gets mapped to the right event?
> 
> Please send the input event through the input device with the sparse keymap.
> 
>>
>> Regarding the specific keycode I assume that maybe the appropriate one
>> would be KEY_CAMERA_ACCESS_TOGGLE ? (though I have not seen any OSD
>> notification with this keycode but maybe it was only with older
>> versions of userspace tools I was originally testing this with..).
> 
> Depends, that will happen if recording gets disabled?

Since the driver handles the toggling of recording on/off itself
KEY_CAMERA_ACCESS_TOGGLE should not be used. As mentioned in my
reply to the v3 posting:

"It would be good to report the camera state to userspace using
a separate input/evdev device which reports SW_CAMERA_LENS_COVER
as discussed here:

https://lore.kernel.org/linux-media/CANiDSCtjpPG3XzaEOEeczZWO5gL-V_sj_Fv5=w82D6zKC9hnpw@mail.gmail.com/

the plan is to make that the canonical API to reported "muted"
cameras."

Regards,

Hans



