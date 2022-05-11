Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BE9C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 11 May 2022 12:01:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbiEKMB0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 May 2022 08:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230192AbiEKMBZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 May 2022 08:01:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ADB0242EC6
        for <linux-doc@vger.kernel.org>; Wed, 11 May 2022 05:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652270483;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dvJz3kIQp6oFZy6gEtQUxT64p3T3zR43kmgls6fwHwE=;
        b=JUjoytB9qLmmyA4UnpRFRKouoedSuxqbyOc674wb3ZaiGFB9/ZgeN/FxSpCN9tXMt3TX0i
        q75yvUb66j/OFbfjAfSGJwepHqA9UY96gaZ2s7PkJGRiRsMoH+QCw2g3D9Ih2MmorJ/eVe
        mp4NQFSdx8aPIN0N9V41o8SsBEkvA78=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-LE6WEJRZO2KzJl8sqoezhw-1; Wed, 11 May 2022 08:01:22 -0400
X-MC-Unique: LE6WEJRZO2KzJl8sqoezhw-1
Received: by mail-wr1-f69.google.com with SMTP id w4-20020adfbac4000000b0020acba4b779so752426wrg.22
        for <linux-doc@vger.kernel.org>; Wed, 11 May 2022 05:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dvJz3kIQp6oFZy6gEtQUxT64p3T3zR43kmgls6fwHwE=;
        b=gyxK4YkgDM844UgETXUv69yM89vNCJ1JheUDe1XSMREn3EE+7eni/RkNxtldlChQND
         LiJKlV0M36pk3oFPAhVo4/MjsZ0dR5NcuQdRWrbGWnqAbKp4yBFwVF00DUJ5e9GiPH9C
         A01aijgllnbZV+F7mPWkaYB3FYuSoocqzkBtV/W+bjKxQOhd40Em5AUi2yQTsVZNbDif
         IDPUgRT9+0XCTXHD3+nmlLfpCeiZrCFvndAr69MveG8y7cFyPmzO2TNaOu6RE2cNPfMX
         AxMgUUe9MLjWN2MCxwFjLq7LpfhwEyD6KAROe8+h1Dj8imTb5TqVHWMZaL020D2cZsQ3
         be0g==
X-Gm-Message-State: AOAM531PpE0feNPk36n2KuPocKI/bsyAU+FS/it5Vtt9F2LHvstl8cuR
        bEcs5pIBrMfZGJbS1IyYKGOgo1xl+NnCZxnW1Eg0ZwNFIedb2ZyPFIboHiOL3MySxxEb9rc2BFz
        ILinpplcHeEKw1O2y70Kl
X-Received: by 2002:a7b:c186:0:b0:394:bed:e0cf with SMTP id y6-20020a7bc186000000b003940bede0cfmr4401634wmi.162.1652270480858;
        Wed, 11 May 2022 05:01:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJU9TiluFpK/8RtXUWSj8BNNT56qPPeY24uIkteINdDQBh7GlSAISg5cd1QveK6E+uS7WTog==
X-Received: by 2002:a7b:c186:0:b0:394:bed:e0cf with SMTP id y6-20020a7bc186000000b003940bede0cfmr4401600wmi.162.1652270480623;
        Wed, 11 May 2022 05:01:20 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id z19-20020a05600c221300b003942a244ec5sm1925339wml.10.2022.05.11.05.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 05:01:20 -0700 (PDT)
Message-ID: <7d9f44e6-ae45-1747-366a-15cf2941dc2f@redhat.com>
Date:   Wed, 11 May 2022 14:01:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 2/7] firmware: sysfb: Add helpers to unregister a pdev
 and disable registration
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        dri-devel@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
References: <20220511112438.1251024-1-javierm@redhat.com>
 <20220511112438.1251024-3-javierm@redhat.com>
 <09cc267d-ead4-dd63-07dd-dfa347cbcee1@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <09cc267d-ead4-dd63-07dd-dfa347cbcee1@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello Thomas,

On 5/11/22 13:54, Thomas Zimmermann wrote:
> Hi
> 
> Am 11.05.22 um 13:24 schrieb Javier Martinez Canillas:
>> These can be used by subsystems to unregister a platform device registered
>> by sysfb and also to disable future platform device registration in sysfb.
>>
> 
> I find it very hard to review these patches, as related things are put 
> into separate patches.
> 
> I suggest to put the sysfb_disable() stuff into patch 5 and the rest 
> into patch 4.
>

Ok, you then want in the same patch to have both the helper definition
and first usage.

Other subsystems ask you to do the opposite, to split the definition and
usage in separate patches. But I'm fine with merging those if you prefer.
 
> Best regards
> Thomas
> 
> 
-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

