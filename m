Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1F54028F7
	for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2026 21:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788814866; cv=none; b=dyiM4b0pNZ6oe6tLwS70GHpqwO3fxggTvtrFWkEkVz70F6pPOv3MEtA7t3yzWfyEM7xMZ69Imdp2pSo8X0b7Bhgi5KTM7ykdFhRLe/DGbKXnUdVtU/MaTYvzBX1ALKd/qP1hUJTp3/WWkmJiZ7SAeSjr1e1QeQlcjGRnXzmZi5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788814866; c=relaxed/simple;
	bh=Pfp4fHaGp3DYNoQNsq++Hih2POFfdEHNA9k/g4/DYlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mX424X+6BbogoL0oGB3C7EdZi8ttl94smUrF0swcsZZNPA1IvFOdsY2vgzCUAdWGMgmNubBSqRm4cSDo0v34fpi1eXWPmMuJaDUoOVKz2qd6Y7gZdWC5lMoNMvdfWpkteJYpyCIKn7oxDHgKatAfpkQdEMwnGOZqpWYV7B9qqbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E4srLzoR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=eFb3gEgc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E4srLzoR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="eFb3gEgc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788814864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=km54XNA3pesnlH9MUSOEbKUzj91GMmwN/4bvXZLN1Qw=;
	b=E4srLzoRT2lSFcaQysiCLk/7gYWQXXHBWble0pc3yRK0BKbcUWXlkkenZdQBdblXltv429
	aq23hN2ImYmLgJhVNpUkK9ErT/FV8Sa0bc3WYo3Bf/cgSD4jChuPK5MW4huzJs8Xh8G3m2
	v2U/A6AYyGRGC393cggcW25+9qGapb4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-454-m4-yEQsaMjGrxPEUZy3Lwg-1; Mon, 07 Sep 2026 17:01:02 -0400
X-MC-Unique: m4-yEQsaMjGrxPEUZy3Lwg-1
X-Mimecast-MFC-AGG-ID: m4-yEQsaMjGrxPEUZy3Lwg_1788814862
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-495529a93f9so38127825e9.3
        for <linux-doc@vger.kernel.org>; Mon, 07 Sep 2026 14:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788814862; x=1789419662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=km54XNA3pesnlH9MUSOEbKUzj91GMmwN/4bvXZLN1Qw=;
        b=eFb3gEgcK3PB9MrfTHHThNcTr92004RvKuJ7uQwqQ3zoZ7OpJ1R7BPd8FvfmFxrl1h
         nExdIw/Pf64APOUElzXVszf8Z/bLMrjDYGro+gxFk3eIKe+kvhj2IB8lSL2BlD+ZIQW/
         sdkg+IjrmSSiahvTjLw32xG2CzD+GoXUxS2jj41mqgvtOOhUOA3AezChvYwsAcck82zI
         R8Qp2eVUoycJOT4nbsMOPyqRJSzwZjPX62S4veWmMlcAj5GMvzgVfhx2lUPn+2YQB2jd
         tEc6d0iHztEydGJgr9YF0mER6V2Nt6x2AB18PD42SQieJO4kg5XA+eKCw5FGTPbEsnwu
         1FIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788814862; x=1789419662;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=km54XNA3pesnlH9MUSOEbKUzj91GMmwN/4bvXZLN1Qw=;
        b=JlvMOpBPz49O/PCwUvOD+ivxaiBQ/rOeV8rz4uDr0QojgvN4wTxZ5scavmGS053z/5
         jzWKDqo8ZFb305/G1Yr1xSF12UV2grFsi5ko1ZzdTC0/qGC3/FF1xqWJebgP6srPmst/
         aPUWAVKwZcx2X9a9kp6nOYNq/9FiFcDHkUo7FNlS5Y2yzaa8KE8hY3iEz45SCcabK4fO
         ayh2l4ZRHDdssZixdqEAT9C4j7x+jJjKhHgLDPadk74FJ3Y3rOFA6gFlPLJKycYDc+eO
         BMy2G1aQigb+edvutLGTqoNpDLW0MMO1uVKO7bEjjBDFISjdKWlMGPQ73TNt4MvmNtbB
         KiqQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5CIwrOtaVWf1LWAzY37yvnfZjleFAVHnhvUULYTXh4i4t1TMDHY3nif5Jgb7SanvWOc7wUCP1F+s=@vger.kernel.org
X-Gm-Message-State: AFuF++kUHdecba2EDlN9igZhcrc7C9FOsnrpLh4F7+DhahQxqH6AUftO
	VglkLachXdxsMKinwo/5zrrQkEFndyvmbQhL67PMhrGOIujVlCQTmcpyujRs2qiYJz+7mbh3nX7
	mYgHwI33QrSzCSyNZ2VP86jqZWZU2/6R0PRcEWGmXDuwqJJr5ZGpKxuvNEpJa2A==
X-Gm-Gg: AYBFou3/V8slqU4+6cpy+tU2xmy5/zQcgkdEzZf2tw3PtPUie3VLi5aDxMb9pTL1BMP
	DB1ML3Wsq/zNuthuckD/RkEF8hrCsa2mIB7TspA2G1r4CFqIREA7bau4W+lhlnKSQTzkg+Tx0V7
	B9gEFd9DgUnZaetTpZoi/LFaWrbwX/A5a0W6eAg3RleSII9x5yP/5u8ZqFUJtYv+oykjLRLAyK+
	Xo/+qX7LU+UCSmj4ESOaMlTNUdMGIVK1BBCL2ygve98awi+e2xkj+C7IEfoIe7FllvCzUCz5HRd
	3giU6Ca+d9fjCMzfm1Iplh9tOSx5tx58WBL053tyUtUIb5NQQhVFKjIvncL68njtptKNlPv0z6Q
	WtAskyQW2xNy98Tar8UDHTA3y4tDDFmn6bak4poFsBhsgbhMJ
X-Received: by 2002:a05:600d:8649:10b0:49c:fa20:cc0a with SMTP id 5b1f17b1804b1-49cfa20cd58mr167275105e9.33.1788814861708;
        Mon, 07 Sep 2026 14:01:01 -0700 (PDT)
X-Received: by 2002:a05:600d:8649:10b0:49c:fa20:cc0a with SMTP id 5b1f17b1804b1-49cfa20cd58mr167274945e9.33.1788814861409;
        Mon, 07 Sep 2026 14:01:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9? ([2a01:e0a:11aa:87f0:ea69:b2b0:2dae:5ef9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm458086515e9.5.2026.09.07.14.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 14:01:00 -0700 (PDT)
Message-ID: <b34807ad-6390-4804-ba29-43a407b3d9fb@redhat.com>
Date: Mon, 7 Sep 2026 23:00:54 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] drm/panic: Do not use un-escaped URL as format
 string
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geert@linux-m68k.org, rdunlap@infradead.org
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev,
 sashiko-reviews@lists.linux.dev, stable@vger.kernel.org
References: <20260902121930.597222-1-tzimmermann@suse.de>
 <20260902121930.597222-2-tzimmermann@suse.de>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260902121930.597222-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/2/26 14:13, Thomas Zimmermann wrote:
> Replace the direct use of DRM_PANIC_SCREEN_QR_CODE_URL in snprintf()
> with a %s conversion specifier. Avoids a possible vulnerabilty from
> a crafted URL string.
> 
> As the attacker needs to control the kernel at the Kconfig level, the
> potential for an exploit is likely low.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: cb5164ac43d0 ("drm/panic: Add a QR code panic screen")
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.12+
> ---
>   drivers/gpu/drm/drm_panic.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index e576c4791861..ba21df4be338 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -658,7 +658,8 @@ static int drm_panic_get_qr_code_url(u8 **qr_image)
>   	char *kmsg;
>   	int max_qr_data_size, url_len;
>   
> -	url_len = snprintf(url, sizeof(url), CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL "?a=%s&v=%s&z=",
> +	url_len = snprintf(url, sizeof(url), "%s?a=%s&v=%s&z=",
> +			   CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL,
>   			   utsname()->machine, utsname()->release);
>   
>   	max_qr_data_size = drm_panic_qr_max_data_size(panic_qr_version, url_len);

