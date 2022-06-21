Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C466C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 21 Jun 2022 12:25:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350228AbiFUMZr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Jun 2022 08:25:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350130AbiFUMZq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Jun 2022 08:25:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1B7BD26119
        for <linux-doc@vger.kernel.org>; Tue, 21 Jun 2022 05:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655814345;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ChvXxqyn9OOMyURFW0VTLkgw2UAz7rtxv6HEJjFmKS0=;
        b=L1KD7FzLfeAqAn+A2J1qSJrpHUfps1bSoGYyx3aNoJcBhsVlfOXOVZmruvLqM3bKjl0Gxy
        NEVlsy3UzgLEzHxVWZyJ9/10shc4mQ+1fOTaE+lsiE0/m6arxN7wCvohz4RtuBJvBuLHoP
        F8YEwRfAcjpxCaCq4LZFrX3LcmoMnhk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-NPHZq4XQMFa4SGido5gTXQ-1; Tue, 21 Jun 2022 08:25:42 -0400
X-MC-Unique: NPHZq4XQMFa4SGido5gTXQ-1
Received: by mail-wm1-f70.google.com with SMTP id o2-20020a05600c510200b0039747b0216fso8400013wms.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Jun 2022 05:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ChvXxqyn9OOMyURFW0VTLkgw2UAz7rtxv6HEJjFmKS0=;
        b=VTq0R7vz49rtZrQAf0YJerf9hY7NpBpKksAuEhx7Z2Q0eekNnvZHbNUmQL0VUZa9DH
         sAW94goN/7UjRP8CVkzP8eOyyrObqjAX7V14pqSlklolOf1vt88mQvVo9e44vLZ6tVuQ
         0udxmkXEpW39r6Mbs3zEFMa0V8/KTAoda2dSdAo7+WwUNQ9Lj3mxZjvH1GQePxi7cGEN
         8np/cbIAndKH6PpoEBABRqoe5061IweJWDDtbayuNMhDZczyBlvpFyg16aacR/YPsnCX
         o4Y8chSBkLIkbBVZoZq9rOVCXOvauZ2I2A/hLg9Zr+SWUcRMS0vPLfJdmLPt3KrxgZ1f
         JpyQ==
X-Gm-Message-State: AOAM531IujzrmWn0+LB8nS9av9EfVxssdTiGMR5a5fNwsKpuHGBvIj0l
        r8qHaMO8lMfqBGtgHbRzGYsFOafW5okP3pstxa7kuEjCloSMkAp2Pn00feyULAY6dXVd49v2IFi
        whnSbw8fERoJrBNW/kQiU
X-Received: by 2002:a1c:5411:0:b0:39c:4761:66f8 with SMTP id i17-20020a1c5411000000b0039c476166f8mr39561335wmb.47.1655814340792;
        Tue, 21 Jun 2022 05:25:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTAiCn5Imotvz18wokmi04OBc4tB0BgS4MkpRYCxooHQh3Q2IacQwQDWlfA//FgEeY08KGiA==
X-Received: by 2002:a1c:5411:0:b0:39c:4761:66f8 with SMTP id i17-20020a1c5411000000b0039c476166f8mr39561316wmb.47.1655814340566;
        Tue, 21 Jun 2022 05:25:40 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id t19-20020a05600c129300b0039c8a22554bsm18838723wmd.27.2022.06.21.05.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jun 2022 05:25:40 -0700 (PDT)
Message-ID: <c259699e-c478-d3f6-f892-721727a5f1bf@redhat.com>
Date:   Tue, 21 Jun 2022 14:25:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/2] drm: Implement DRM aperture helpers under video/
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        Alex Williamson <alex.williamson@redhat.com>, corbet@lwn.net,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de,
        gregkh@linuxfoundation.org
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <165541020563.1955826.16350888595945658159.stgit@omen>
 <165541192621.1955826.6848784198896919390.stgit@omen>
 <e1fd76ae-a865-889f-b4f0-878c00837368@redhat.com>
 <4f6e9b63-f955-d263-e69b-6396fbe48868@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <4f6e9b63-f955-d263-e69b-6396fbe48868@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello Thomas,

On 6/21/22 13:29, Thomas Zimmermann wrote:

[...]

>>> +
>>> +static bool overlap(resource_size_t base1, resource_size_t end1,
>>> +		    resource_size_t base2, resource_size_t end2)
>>> +{
>>> +	return (base1 < end2) && (end1 > base2);
>>> +}
>>
>> There's a resource_overlaps() helper in include/linux/ioport.h, I wonder if it
>> could just be used, maybe declaring and filling a struct resource just to call
>> that helper. Later as an optimization a resource_range_overlap() or something
>> could be proposed for include/linux/ioport.h.
> 
> Bu then we'd have to declare struct resource-es for using an interface. 
> This helper is trivial. If anything, resource_overlaps() should be 
> generalized.
>

Yes, that works too. Probably then we should just keep as is and then as a follow
up we can add another helper to include/linux/ioport.h to avoid having something
that's only for the aperture helpers.

>>
>> Also, I noticed that resource_overlaps() uses <= and >= but this helper uses
>> < and >. It seems there's an off-by-one error here but maybe I'm wrong on this.
> 
> struct resource stores the final byte of the resource. In our case 'end' 
> is the byte after that. So the code is correct.
> 
> Do we ever have resources that end at the top-most byte of the address 
> space?
>

I don't know to be honest.

[...]

>>> +static void detach_platform_device(struct device *dev)
>>> +{
>>> +	struct platform_device *pdev = to_platform_device(dev);
>>> +
>>> +	/*
>>> +	 * Remove the device from the device hierarchy. This is the right thing
>>> +	 * to do for firmware-based DRM drivers, such as EFI, VESA or VGA. After
>>> +	 * the new driver takes over the hardware, the firmware device's state
>>> +	 * will be lost.
>>> +	 *
>>> +	 * For non-platform devices, a new callback would be required.
>>> +	 *
>>
>> I wonder if we ever are going to need this. AFAICT the problem only happens for
>> platform devices. Or do you envision a case when some a bus could need this and
>> the aperture unregister the device instead of the Linux kernel device model ?
>>
> 
> In the current code, we clearly distinguish between the device and the 
> platform device. The latter is only used in a few places where it's 
> absolutely necessary, because there's no generic equivalent to 
> platform_device_unregister(). (device_unregister() is something else 
> AFAICT.)  At some point, I'd like to see the aperture code being handled 
> in a more prominent place within resource management. That would need it 
> to use struct device.
>

Ok, I was wondering what was the value of the indirection level other than
making the code more complex and supporting an hypothetical case of a FW
driver that would not bind against a platform device.

But if the goal is to move this at some point to a more generic place (i.e:
the Linux device model itself) then I agree that we can just keep it as is.

When you re-spin this patch, feel free to add my R-b since looks good to me.

And thanks again for working on this!

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

