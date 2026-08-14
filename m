Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053AD4921BB
	for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 17:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786728644; cv=none; b=ryWRpW1rN2R/2yTKPRDnbx7k7oOgUmjJ0qxwpdjlCJPQzpaVvHh9x6cN9JZv2sPGXJpY+SsAeSUg7VOsPlfxizaOEQfwOQbcwtiwNmnwR+t0JHwTJkV9iDUGihaugBA2skcuGwx5BzxM1+o1ew4P2E92Yi0US+DT7Eg5k/ceDrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786728644; c=relaxed/simple;
	bh=ZMmE6HnybGXuW/OUMPqOr4Ds53IAGZtGSGwj9udzJOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iXVsM97VtYdenHcYWQRXLDCCve1WW21o0V5Zz6CcvyV/87toP1AIzJmJKCzVs9F+YbnIb7GHF8C8owSNPz3fApJ4XOajubBlZWISRrDg/ru0VSUPlsYvz6L5u29hydBoB+rgVzqp+TpG+8HJqa3QHR/NBnyL/XsjnSI5A4D7+78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f97oTlWG; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f97oTlWG"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4980dc26022so13913815e9.1
        for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 10:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786728638; x=1787333438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QubrOEDi3lm/FL4BqCrGlULbQHcdMBDdc4OsupKoh8o=;
        b=f97oTlWGt/D+Der2gC92NOdtUO++OWllQA+3K6wVTZQ1PZZe236REgtNvGSxf+TVke
         cGA+CJnXRUIr9rUDMIe5GHq06YlmnBAE7edkcJP9Nj2A7VMonNXMtfea8PYL/Y3JnESL
         bCAO0NtWGBHU3wuY4PIV1ysTnKv6Tgg76ZQZ11v31n6SEkXs/Wwo91Xgm8vD4QrtHiEe
         cj8VukDkVPQOIu/fQMARFD8NPHuLRCezVrKAtNPQz91toSQNIhOqp1CPm7G6NmZJQDgY
         2ozfcqKr0mh289P7wbD+0I7ryyw0e6fMGSGZ/AeoLpwC6Ir37VEuxqG86JepbTA5yjAC
         3ffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786728638; x=1787333438;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QubrOEDi3lm/FL4BqCrGlULbQHcdMBDdc4OsupKoh8o=;
        b=hkhxOTA4zQnSHJjje4o9bu4MYzC0h12kZZtFFnWhZVjewHERyy2rYNMpdZxbRsTFRK
         gh9MlBZS6uxx9MI75FLcH7Kf3ZT3rQeSuRZZK+ONVRT9CJGp+yLN/K/YJpeSQfc6TdbK
         2Z/oHzrWXGwyo0NYNOcfHy1EBIQ5mLDYeNTyqj2VifBAQcaTwKOJ+Onk1EIfF0K1zpsP
         0JVu7UTkEANiXE+1r3DBXl5VrrjbAaHNGXf4ZwFluLo2YsNMFBHW7HyYWt6aUCRmn8Co
         26HGlmwt/7Q1dcy6QX+wQCeN5tgVFbz+l9Yn52/4k7PZetbMEecFOf3ubBe2qcNyiSj+
         HUHg==
X-Forwarded-Encrypted: i=1; AHgh+RpUqudkip7kmNHXa02hX5/3JAC+qjdkwVNsnT5qX6ERrOHNSHZvmOgUAzVYKzNEHLFnCUHdqL9sE78=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtFuDzXrqXGnHXxeaT8UJYjr6KKTxwccrNdFuMN6Qcp8qfMLx9
	2uy/TVPyrrbwLwtaaucbRZLoRToJhsIXOO6GIqEQiKdBBzJ+h3tWjmGE
X-Gm-Gg: AR+sD113k1hq28ga7rGC/jOOkLl1m9VfIlLOnJrFSNlBOZADuDFXRHxtlBj/wBhdTnv
	4QrbkOhFM0rB/eNc+CKbJACiJi7/ZGLZgJUbqD7sjyjzBDe0cN+7Yu12wX21GMzdWU7+qEqpDLZ
	GCVgmASB3gIwOfyWNOBbI/tuXI/Y773V3KJ7Ssic1f0q73X4ue7hRQe1ofq5g2crq8Tecd1Hr+n
	dqPDfW3sWywO/P3xusC58WOaCJol0V9DpZCBPwx5Zujin1rMvlo9lDFBZmuqtiCxvze19AMSlGq
	+CVRzYaXDn5Roci32LOtmDwdGgfRy2yzMSAWVuGgY8rYfx/hda5MqNE7iFbYBjx5+FYqFN4wAdD
	2s3HjQQK2ajsVYR9Gm7Xhjazv/dPTsClqFsoaimb8+Tt+bGydF4wTZwhQ/ClW9D3ouqFwp2IfLO
	tO/DEFI0msXCa6JYcRv0XYHSShv7XXJ2iVmuMcqbU5QHoGeJgDrDS2tDpfXm0emZ3k8sf9pS/1E
	vd6XqxM9tkwR36+Gc61/MQQfu4uhJtr1Xw=
X-Received: by 2002:a05:600c:3f06:b0:499:484a:81d0 with SMTP id 5b1f17b1804b1-49987961c32mr113672865e9.9.1786728637436;
        Fri, 14 Aug 2026 10:30:37 -0700 (PDT)
Received: from [192.168.0.32] (cable-178-148-247-5.dynamic.sbb.rs. [178.148.247.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49989ae96c1sm43136255e9.12.2026.08.14.10.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 10:30:36 -0700 (PDT)
Message-ID: <1dd8a04b-4627-4a3d-b432-ff4c5589bfca@gmail.com>
Date: Fri, 14 Aug 2026 19:30:35 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] hwmon: (asus_rog_ryujin) Add per-device
 configuration
To: Arie Miller <renari@arimil.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Will Smith <github@notthatwillsmith.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260812103532.395049-1-renari@arimil.com>
 <20260812103532.395049-2-renari@arimil.com>
Content-Language: en-US
From: Aleksa Savic <savicaleksa83@gmail.com>
In-Reply-To: <20260812103532.395049-2-renari@arimil.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/12/26 12:35 PM, Arie Miller wrote:
> Move model-specific report offsets and capabilities into a device
> information structure. This prepares the driver for coolers which use
> a different report layout or do not include the external fan
> controller, while preserving the existing Ryujin II 360 behavior.
> 
> Handles an issue reported by Sashiko where an id could
> be missing driver_data.
> 
> Link: https://lore.kernel.org/r/5a817284-a9f4-48b2-9f0f-802c5dc6963c@roeck-us.net
> Assisted-by: Codex:gpt-5.6-sol sparse
> Signed-off-by: Arie Miller <renari@arimil.com>

Reviewed-by: Aleksa Savic <savicaleksa83@gmail.com>

Thanks,
Aleksa
