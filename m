Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8407CC433F5
	for <linux-doc@archiver.kernel.org>; Thu,  5 May 2022 08:34:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343578AbiEEIhl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 May 2022 04:37:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234567AbiEEIhk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 May 2022 04:37:40 -0400
X-Greylist: delayed 102 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 05 May 2022 01:34:01 PDT
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.133.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CDD7E4833C
        for <linux-doc@vger.kernel.org>; Thu,  5 May 2022 01:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651739640;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S96mA4Ie3bRtv9R+1bbKD4AnGf5O4BhFOs7D+b38OJQ=;
        b=QCmbO0ue5lCzZeJsfylz6b7o1VWq07Y5Z5P4KHnFoswngp4y0DlGg061m0VmRtmmMZH1Yd
        cceZzU2VWXczbz8rB+c7jhUFmOyCkBPLB1Wy/In9c1p3VLbTV+XXQR6zO2yEyKbV/X8Xll
        f/FYsUavfdu2GY3ikBBi//Iu8klJQAE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-UNwxVUWDOZeDx7EcVP9PDA-1; Thu, 05 May 2022 04:32:17 -0400
X-MC-Unique: UNwxVUWDOZeDx7EcVP9PDA-1
Received: by mail-wm1-f70.google.com with SMTP id k5-20020a05600c0b4500b003941ca130f9so1451268wmr.0
        for <linux-doc@vger.kernel.org>; Thu, 05 May 2022 01:32:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=S96mA4Ie3bRtv9R+1bbKD4AnGf5O4BhFOs7D+b38OJQ=;
        b=PWLe8d7DkzkPNGGuVinqBpf2fmojphaK2I3s8rBceczFakRx5GTfvcOjIUMvttDCUT
         RaSgeMwAcD2DE9XYPrxsSJmnkIuVafZWUyDsk1uM2jzqQsZDNysELcibm81HSOVYUu/t
         fPRqCtqjqE3S3nePW3kWbx7Bbh7byH/3kuVBOWuP7wcWkmgn1URqMq+unSM3Z9bHW5Ek
         LZHnQn6QRNKM6SrdKQzpe14Z460jcAm+kk8osKeo1tuz3vvf7iw0YJwBqAgqtr8AhAjm
         sWfSBQuYkc7d5utIeGdJCYuw4h3reulmaw/jxMdmAB5ePsMe1nfDQvN1CjB1fa7uEAIU
         fdbg==
X-Gm-Message-State: AOAM532AawAm5JB0TZIQWr9PTkzjQzqZ24StsjQ/PEYA0sUmAGcP5eD4
        MnTw+UIGRLuJZ9oqAxf21V3moMBLT6UYkyiSV06MTvnUxe7ZF/QayLxgGU73aOEPlnuyDzGtz6S
        DMjuY4X6SUzQgYaHEwHNC
X-Received: by 2002:adf:dc42:0:b0:20a:cf97:f1b7 with SMTP id m2-20020adfdc42000000b0020acf97f1b7mr19626857wrj.200.1651739535721;
        Thu, 05 May 2022 01:32:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3Wtm4DgnIJxwRdiMAj0etcbY/FRx4Rofh1acsbZWYdXjyJBptet2S8gRODazb7sgMUh1mFA==
X-Received: by 2002:adf:dc42:0:b0:20a:cf97:f1b7 with SMTP id m2-20020adfdc42000000b0020acf97f1b7mr19626837wrj.200.1651739535431;
        Thu, 05 May 2022 01:32:15 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id k9-20020adfe3c9000000b0020c5253d8eesm678310wrm.58.2022.05.05.01.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 May 2022 01:32:14 -0700 (PDT)
Message-ID: <d3e60b09-caf1-d62a-c764-eb7976450ef2@redhat.com>
Date:   Thu, 5 May 2022 10:32:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/todo: Add entry for using kunit in the subsystem
Content-Language: en-US
To:     linux-kernel@vger.kernel.org
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
References: <20220504080212.713275-1-javierm@redhat.com>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220504080212.713275-1-javierm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/4/22 10:02, Javier Martinez Canillas wrote:
> The Kernel Unit Testing (KUnit) framework provides a common framework for
> unit tests within the Linux kernel. Having a test suite would allow to
> identify regressions earlier.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---

Pushed to drm-misc (drm-misc-next). Thanks all!

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

