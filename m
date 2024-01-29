Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5705C8E8
	for <linux-doc@vger.kernel.org>; Mon, 29 Jan 2024 11:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706526961; cv=none; b=VmrZdS5/tD+Q2IMmebvQZwXwEux5fhL4YMe/Uy0Anp+bEag7uI1ZMKG/zdXyLgi1nRJ4VoIOGZyYxYCdYYlnmfoMn/usmjpynEhMsvwYqZxRM8/CW93pWyozonSpVpuC8gHtWaaIW8lbihbQTwN3+cvV0guSKC8igXxpDjGOKMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706526961; c=relaxed/simple;
	bh=RpKJBPyAuJx70Gw2vedDa9+hb0ZDyAGj7AdkuSzaxD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VS9JaDpmPWtCy2PQ3fgHu48GSj1i7TdpKPARg/ky043kAbKrSFpsDClctkrd+bU2E2wtLvCgGcG7Xi671Ul0vRhugTVgdJIiV6ohYXSly7Sy+s1IXTEviaAc4+JM3Jjm0Ko/J+YiNYMN31A0hEHqXJSNV93kYwoYky4KWGy5JWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LtJ/qmzN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LtJ/qmzN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706526957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PdmBCDGtM8wSDqYKx2ZDXDpktAyoxR2CO0TvUORZDug=;
	b=LtJ/qmzNA3bIhBYjHwuOakIEXZ89j3mhz/D9XZLjGQ+JKqSD9JcoIkigGUO3TRYC6/UFOB
	tt5VdKx+9VJ6b6UggkQJ5oMWeSvJP2+AqovtIAhRe85raDtfsYeWYniEpEubMOlu4c3jBF
	CBOy5bIA2AH8cWjI3EvdAUPLNAINIPk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-gWToU5SsNcu9GjvFbq2MdA-1; Mon, 29 Jan 2024 06:15:56 -0500
X-MC-Unique: gWToU5SsNcu9GjvFbq2MdA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a2bc65005feso199707566b.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Jan 2024 03:15:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706526955; x=1707131755;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PdmBCDGtM8wSDqYKx2ZDXDpktAyoxR2CO0TvUORZDug=;
        b=OxYIEWwpSCkSilScdII5hkUu5gh6eTRTg2IzJ0EsUgjmyDmGM7ewEvcz3Pt8NJ37Qj
         p1UxNe7L2B2jAtuLeIRB6adzP813GRgsEvuGGTL/3rMGAZiqZ891nCDiGTley+1w/063
         RzNiJSaBfsDNDJHcluQaYo44rm6Y3ij22sAsDxiWuFscdxMNgX44MTyGM1kIIBJPpO9k
         GB4aPV2VWObcxQciRA2NtkrF6k219bvUdwwtLqCVhR8whUJsgsjG//ZEP90j8yNapG3a
         LxQnlBKlqr7g97qQujmkV/d0bbpuN82DnL601YVmdouPBsfLBqf9XSDfBD/nwvMSRN/5
         T9Xg==
X-Gm-Message-State: AOJu0YzEToIICI7lcfusI0hVWH+9MinJBT9VswJYRtxm4FgODdG4htsz
	w/2PeUyZbImTKEUO3Tf6UKOpYLjZQ0BuF+X9VYr40HcH1GtK6JI04zPAB4+ojtEeFJSNYM7FZVh
	THps+tN0gfu+yrwUOWTM/FBlDcVipFHXQRnNiPBCuh2pmA7Ics9/lHQq8AA==
X-Received: by 2002:a17:906:a013:b0:a2b:a7e:3496 with SMTP id p19-20020a170906a01300b00a2b0a7e3496mr3812591ejy.28.1706526955476;
        Mon, 29 Jan 2024 03:15:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpAHqhErhQZXiA+dg1bA0riWjrWB83FQhDQeuo1UG0xYvOnaHB3CqQACeeik/4F+TYM4aupQ==
X-Received: by 2002:a17:906:a013:b0:a2b:a7e:3496 with SMTP id p19-20020a170906a01300b00a2b0a7e3496mr3812571ejy.28.1706526955125;
        Mon, 29 Jan 2024 03:15:55 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id qx25-20020a170906fcd900b00a311a360433sm3893770ejb.143.2024.01.29.03.15.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 03:15:54 -0800 (PST)
Message-ID: <e21c0853-d10a-44b5-917a-3f3c08102b87@redhat.com>
Date: Mon, 29 Jan 2024 12:15:53 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] drm/vboxvideo: fix mapping leaks
Content-Language: en-US, nl
To: Philipp Stanner <pstanner@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Sam Ravnborg <sam@ravnborg.org>,
 dakr@redhat.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org,
 stable@kernel.vger.org
References: <20240123094317.15958-1-pstanner@redhat.com>
 <20240123094317.15958-11-pstanner@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240123094317.15958-11-pstanner@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Philipp,

On 1/23/24 10:43, Philipp Stanner wrote:
> When the PCI devres API was introduced to this driver, it was wrongly
> assumed that initializing the device with pcim_enable_device() instead
> of pci_enable_device() will make all PCI functions managed.
> 
> This is wrong and was caused by the quite confusing devres API for PCI
> in which some, but not all, functions become managed that way.
> 
> The function pci_iomap_range() is never managed.
> 
> Replace pci_iomap_range() with the actually managed function
> pcim_iomap_range().
> 
> Additionally, add a call to pcim_request_region() to ensure exclusive
> access to BAR 0.

I'm a bit worried about this last change. There might be
issues where the pcim_request_region() fails due to
e.g. a conflict with the simplefb / simpledrm code.

There is a drm_aperture_remove_conflicting_pci_framebuffers()
call done before hw_init() gets called, but still this
has been known to cause issues in the past.

Can you split out the adding of the pcim_request_region()
into a separate patch and *not* mark that separate patch
for stable ?

Regards,

Hans





> 
> CC: <stable@kernel.vger.org> # v5.10+
> Fixes: 8558de401b5f ("drm/vboxvideo: use managed pci functions")
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
>  drivers/gpu/drm/vboxvideo/vbox_main.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_main.c b/drivers/gpu/drm/vboxvideo/vbox_main.c
> index 42c2d8a99509..7f686a0190e6 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_main.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_main.c
> @@ -42,12 +42,11 @@ static int vbox_accel_init(struct vbox_private *vbox)
>  	/* Take a command buffer for each screen from the end of usable VRAM. */
>  	vbox->available_vram_size -= vbox->num_crtcs * VBVA_MIN_BUFFER_SIZE;
>  
> -	vbox->vbva_buffers = pci_iomap_range(pdev, 0,
> -					     vbox->available_vram_size,
> -					     vbox->num_crtcs *
> -					     VBVA_MIN_BUFFER_SIZE);
> -	if (!vbox->vbva_buffers)
> -		return -ENOMEM;
> +	vbox->vbva_buffers = pcim_iomap_range(
> +			pdev, 0, vbox->available_vram_size,
> +			vbox->num_crtcs * VBVA_MIN_BUFFER_SIZE);
> +	if (IS_ERR(vbox->vbva_buffers))
> +		return PTR_ERR(vbox->vbva_buffers);
>  
>  	for (i = 0; i < vbox->num_crtcs; ++i) {
>  		vbva_setup_buffer_context(&vbox->vbva_info[i],
> @@ -115,12 +114,15 @@ int vbox_hw_init(struct vbox_private *vbox)
>  
>  	DRM_INFO("VRAM %08x\n", vbox->full_vram_size);
>  
> +	ret = pcim_request_region(pdev, 0, "vboxvideo");
> +	if (ret)
> +		return ret;
> +
>  	/* Map guest-heap at end of vram */
> -	vbox->guest_heap =
> -	    pci_iomap_range(pdev, 0, GUEST_HEAP_OFFSET(vbox),
> -			    GUEST_HEAP_SIZE);
> -	if (!vbox->guest_heap)
> -		return -ENOMEM;
> +	vbox->guest_heap = pcim_iomap_range(pdev, 0,
> +			GUEST_HEAP_OFFSET(vbox), GUEST_HEAP_SIZE);
> +	if (IS_ERR(vbox->guest_heap))
> +		return PTR_ERR(vbox->guest_heap);
>  
>  	/* Create guest-heap mem-pool use 2^4 = 16 byte chunks */
>  	vbox->guest_pool = devm_gen_pool_create(vbox->ddev.dev, 4, -1,

