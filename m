Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B1247DF9B
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 17:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787245505; cv=none; b=tmClHrAuwyP+tyTAXnlyq8gx9BKLLNCyU9GAblaiEqp0HjCNX1THNdMPyifv81PdJBtp5yv6sjM03fMb+KdDpyC25IIa8BEoS0CA+D8GEHdVR25rhWurS9C+urkFvILOhHOaMuP/i0GQP8bNIl9G6UMqvIjn6GeMAufHmbgc4nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787245505; c=relaxed/simple;
	bh=OOvAhEjtRhOw0a+UjXxcotOqI4sqWEFsEYl3cZ0ejEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m77pnON6SdPFfdcf2QegKyBeUr2a0OHg/nOakzBukcRFlVpgebxfqBfyY8ojJzxlL8ccZRii+mOW87eBInpTMbvfgitPwdysM+RkjcEX49lWgdOcn7LajW4v/BkJb7ZspRNlxl7tXNRxjo67INzKoRhjuKmQI5yPyOeCWa2uKGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Be3T+p6m; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=GNngpUhG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Be3T+p6m";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="GNngpUhG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787245503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TF+roY3oCVB3u96D2m+Kn+7JYFil1XkjxfPcXPVAxaA=;
	b=Be3T+p6mFPfn5YcVDRQG2CTD8jYXC1m/QI14N6v0z2Suy97Ou/5AV8Mlfx+Yz+DuEII7D6
	hs+wBoZ4O4hvmcm27JtziryF4Yq2/xiHoaKlEa7LzaolwrJVDX9R+R3Ku8lQBpe1XyZ8N3
	hdLCWQHgz3whNb0tpqBArAFqfzPNBt4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-3en8CtzRN2yW5BhrLY6C7A-1; Thu, 20 Aug 2026 13:05:00 -0400
X-MC-Unique: 3en8CtzRN2yW5BhrLY6C7A-1
X-Mimecast-MFC-AGG-ID: 3en8CtzRN2yW5BhrLY6C7A_1787245499
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-495474a5fbcso391585e9.1
        for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 10:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787245499; x=1787850299; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TF+roY3oCVB3u96D2m+Kn+7JYFil1XkjxfPcXPVAxaA=;
        b=GNngpUhGw6LvGOZy9Q9TqjDH/Jo4/N0UbO4oLdHnx1bz2LLQR7bdoORWUXOO0MWywX
         we1MQuBsglWX4t3Kp4SbHafc05j1YigY9Q1GioUFTdzJ+frrO4CdStl7pGAbg4Aj5Y1j
         yjQFYfS2ilL23rAbgMHBZcptID7e3L+KmfjH9cyq2dzPTqsaCCxlzk+hn2LoakpWmt+r
         Lg8V+YDNGI87UIrkPlvZVvrlmVMJj0Pu8bIv5DxE/DqyfOthKbdzQokjPKampK9hvdkt
         ORgdaKC8BHMf6sFgvoUhtBE5lEqF9uAFXSkwtrxrxy5GI3vcyVlcmHAmZ9tNsgMOmrTa
         RFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787245499; x=1787850299;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TF+roY3oCVB3u96D2m+Kn+7JYFil1XkjxfPcXPVAxaA=;
        b=pzebPAddT03KOasf6YdUkY67v08c86ZJCWw3rOtj7d5isvm4Ny80Tg97mpvDkFOo94
         1w7aE8T+HYdITpfBIFlAZOAqefBYy+8Fj7JsMYs+r1/NNk/DLDOpQMLVQ/WQe5ioKeNq
         0QnKi9xmxJu/tl/5L52WN805l1l1e+XVTmZA8wfj9P9rEqSXzkJLbLdiSzJjmFd5P5Oh
         /Q1V9a7To/v4pYNct5Z/nx0ajIEkWoxG1dUFDvLp3sgEwjuoHCvExYITGn+6AhRzbkZF
         wJ/UYxHW5GemQohMzQrKNqzv4Xx8U1a5Bvr21oaHpjcHNHdAlkA+2hRQNeSZ25raLhFr
         SSIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqu9ZgjQZX4DIhEDwlsJnXQs/g48//No3A2Q8giuI2ETVRS8IwjC2vCOoTn8FDNjEqFHReZWxpS7a4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZXRWomNLsNljnerrwDs5cCxKqX8HnikWs2v8DTjacF+VeXsti
	oHocKwA25nA5okQGl2xvT4Qo1LhesSP7P/ZBpAobhGjc9Jgy43sQ7BVKFaXx57XXMnjT3dWJEQo
	YIa8DWpp9wha+a0zSJiAUDMmCqda5YM04/53DKsxP1FHPPCVCH8jQay4ilcLK4A==
X-Gm-Gg: AR+sD12Hc1WbPNZUlA38eEw+eo7MlEkb522IGlmd4RVWz4V4AGMPPB/F3sbSKeNQC+9
	lD9ZG9vhAxXF9wqr1Vo7xEv0dg1RUW7zle8qWEut+j53gw4IynjfwlIVcrSuvua/vJRG5pLltvP
	sc9NqEy9UlvlzIjUrf/CChxLXgvu4Yh6Wt2SkP+xkYavGyBnDKRy1CLtSYYy6T+LYXMt5FVzJCy
	o+ZWAY4ZH34XjKzCTM2U8XsBsgcGouFUK/SidlbcorByrDvA0ulHlV9AuWwMyXCbATjVpcuxZ97
	3MzQ8KW7pOXzPZ7O8e0esIyQ2ybyBRm30oYGgwwhC2yQaCdS5yHOuDEBXi45pGY0hzgNYDXVYgl
	74xAp3kyrPiLohSQHidykj+zhTXHyjIIUPMAqAnWeJ7HnhA==
X-Received: by 2002:a05:600c:6211:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-499b8465f7dmr5016925e9.10.1787245499082;
        Thu, 20 Aug 2026 10:04:59 -0700 (PDT)
X-Received: by 2002:a05:600c:6211:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-499b8465f7dmr5015695e9.10.1787245498659;
        Thu, 20 Aug 2026 10:04:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:935:4f8e:b423:64eb? ([2a01:e0a:11aa:87f0:935:4f8e:b423:64eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c33b3sm13157002f8f.27.2026.08.20.10.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:04:58 -0700 (PDT)
Message-ID: <cb784cf6-f3d8-41aa-9f71-c197a5eba7f2@redhat.com>
Date: Thu, 20 Aug 2026 19:04:51 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] drm/panic: Return -EINVAL if font is not available
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev,
 sashiko-reviews@lists.linux.dev
References: <20260818125012.468092-1-tzimmermann@suse.de>
 <20260818125012.468092-4-tzimmermann@suse.de>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260818125012.468092-4-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/08/2026 14:28, Thomas Zimmermann wrote:
> Font lookup does not allocate memory. Hence reporting ENOMEM on
> failed lookups is misleading. Report EINVAL instead.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_panic.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 705b72bf0d83..96d238bfceee 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -757,8 +757,10 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
>   	int qr_width, qr_canvas_width, qr_pitch, v_margin;
>   	u8 *qr_image;
>   
> -	if (!font || !stream.workspace)
> +	if (!stream.workspace)
>   		return -ENOMEM;
> +	if (!font)
> +		return -EINVAL;
>   
>   	r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
>   

