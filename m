Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C6DC433F5
	for <linux-doc@archiver.kernel.org>; Thu, 27 Jan 2022 13:08:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241555AbiA0NIx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Jan 2022 08:08:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41647 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241485AbiA0NIx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jan 2022 08:08:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643288932;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UQyYdiBdtNH1VNsfeubJWuB78VJ2++qYCFEjN1L+z1o=;
        b=Mr9TGbunbicO194BYMP8HvMMi+hjalB146W5UmUxsV/aJr/zGKi+OedSJja8UkKH0UF2J+
        nklmyKwCETC8/kPvTk9uYHL/ZidUgFVyEvWY8XYxf6e8JLCUj3mO1KO/0ok0NI3a1uEafx
        1XSwcMvGnRrWDb4ZaiMOWPkqYqGPvdc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-OKQ8TfEuN8y_m-0_QeHNfw-1; Thu, 27 Jan 2022 08:08:51 -0500
X-MC-Unique: OKQ8TfEuN8y_m-0_QeHNfw-1
Received: by mail-wr1-f71.google.com with SMTP id t13-20020adfa2cd000000b001d09443ee4fso1077428wra.3
        for <linux-doc@vger.kernel.org>; Thu, 27 Jan 2022 05:08:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UQyYdiBdtNH1VNsfeubJWuB78VJ2++qYCFEjN1L+z1o=;
        b=V/EPzq1f116AjsaxcTEwRzxeL7iM4wIHduXAnXrZIvL63dbV795qr83ombxqzh7xF8
         NSOqBPO3C7PWY2s94LEC21hbggh8byajEBNlp+JSFi8n7pfPtpD2zttCOiXOTjQUu9L9
         m9d0YymxMOAOPIXElw1XQgHF0WbMoE0PoRO/Fa1QcHqXzaGIdBHZEsKOZF1fnTPKMUxJ
         bQc3hUGiJL2ITZqz2avWA8jlFktLb/xGu5TQnqsp3tzqLojJs9sYldfoWw3a3tzmJOi/
         UkB4kUodK7toQS8LjHJI4wrrs5kFDjcFO+GBtVkEdmYqyHq1dQzQTRuxRESw1ZaSVIIl
         IXLQ==
X-Gm-Message-State: AOAM530lfkQA/C7sl0sNSKKGcK0OD3GjCc5CEuFP4kzl8xmTfd/u7jrv
        VFQN32vwXXouI7mFmTtz02LEeHyrkxRV5mUQzz5luD57n7kdrv/WfNnTeuBvPv2zHZZgRz96ULd
        UBOtwl0lN/FN92W9zvxN2
X-Received: by 2002:a5d:4943:: with SMTP id r3mr3001772wrs.130.1643288925758;
        Thu, 27 Jan 2022 05:08:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8QfFcL0XfIO8hOXFedQuXUsgq2JTBDc2xnb6vs395KWwqaCiCCi/yJzVGlZa/jOkdHUHQ0Q==
X-Received: by 2002:a5d:4943:: with SMTP id r3mr3001421wrs.130.1643288920603;
        Thu, 27 Jan 2022 05:08:40 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id s9sm2100610wrr.84.2022.01.27.05.08.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 05:08:40 -0800 (PST)
Message-ID: <b54d8092-c7bc-93b3-c306-b77dd57db6ce@redhat.com>
Date:   Thu, 27 Jan 2022 14:08:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/doc: Add section in the introduction page about
 learning material
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pekka Paalanen <pekka.paalanen@collabora.co.uk>
References: <20220127082058.434421-1-javierm@redhat.com>
 <c99a7784-7ac4-e305-1a06-dfb514a409ff@suse.de>
 <b305cb36-1a09-c990-a3e6-98d420c62e3a@redhat.com>
 <YfKCoOk2sxDzHVXv@phenom.ffwll.local>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YfKCoOk2sxDzHVXv@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 1/27/22 12:31, Daniel Vetter wrote:
> On Thu, Jan 27, 2022 at 11:50:30AM +0100, Javier Martinez Canillas wrote:

[snip]

>> Indeed. And we can add such section as a follow-up. Maybe referring to some
>> of the drivers in drivers/gpu/drm/tiny.
> 
> Do we have a talk anywhere for tiny?
>

I couldn't find one for tiny.
 
> Otherwise I think it'd be good to just add a paragraph about "hey tiny
> exists" and maybe link to fbdev helpers and simple pipe helpers to get
> people started with the right entry points for simple drivers.
>

Ok. I can add some sentences about drm/tiny and point out that the DRM
drivers there could be used as a good references for simple drivers.
 
> And make it clear that the above pile of links is more for general
> overview and if you don't yet know what exactly it is you need.
> 

Sure, I'll add that too.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

