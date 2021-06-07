Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB83C47094
	for <linux-doc@archiver.kernel.org>; Mon,  7 Jun 2021 10:08:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9FED2611C0
	for <linux-doc@archiver.kernel.org>; Mon,  7 Jun 2021 10:08:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbhFGKJu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Jun 2021 06:09:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33179 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230173AbhFGKJu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Jun 2021 06:09:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623060478;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4DJcwRNKgr1OBDo4WX+IJbKHUeQSd/tstLULEr3UeRI=;
        b=LerhHY8800IB9TzcYKtgaZc6qA0YlwtLKGZUo+nYGal2Tjc859BCZT2gUoAdsHzdMNvTb/
        tebJogntPT0rD+5A0dn4FTsi4HQwIBxw/J3MVvSP5jwAbY9peyHJVKjk/9Np+m+xx6ajwU
        Xzcpi468XEXzoExMk/vW+HKzqwP0fYI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-CaGi92m-OCi25cbPzalMAg-1; Mon, 07 Jun 2021 06:07:57 -0400
X-MC-Unique: CaGi92m-OCi25cbPzalMAg-1
Received: by mail-ej1-f71.google.com with SMTP id n8-20020a1709067b48b02904171dc68f87so596730ejo.21
        for <linux-doc@vger.kernel.org>; Mon, 07 Jun 2021 03:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4DJcwRNKgr1OBDo4WX+IJbKHUeQSd/tstLULEr3UeRI=;
        b=LEbf7q43DKGlLhgXUy6/16Oxt/e+YDvVbv0OSwrnbGlbRQlDfSHWPb6fkaDGNVixcZ
         jQvcUNe0Aku5CC0+uqlR2+bHgqtezH3ACO2rhSmVkLN07adQ7kQT4xyro+j+ZuHULeuh
         qtLi0FzLQBBD6w4byt07/H/KzVVYJFZ/dKGJNRcC8iV/KRAgfr61ap8T1hlB5yt23iic
         /YXc7NiSTtq3M29pohqh/9sOyiuVtkS+potxfgmQuayVfZXh/do/gCDcuR81mysct0vK
         5JM8kGZ3UkpeujRpg4fgRVQCzlbWRoDqlI5XquZ/HLZUB8CxkcIFKTL3qR6SmHoNneiT
         jD0Q==
X-Gm-Message-State: AOAM533nGbfNLZLiA+nWk3XVYwFN/X00TyyStUN7CVYkiQs8BWUauUSk
        07HfCfs99Wq1vYxo+VNJLHtzqlFMjZeLmvrp3hOrBCbSwz1zsWESzeEiaZ6vWGo/QEkosHsc7/Y
        VDQ+GzQSoSmmMWXuH3/Dn
X-Received: by 2002:aa7:c4d0:: with SMTP id p16mr19752204edr.150.1623060476221;
        Mon, 07 Jun 2021 03:07:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzj4Vq4xUy4Dtd0hVocAhAt3wVsI2rZmbsL8IEfrCWhphyW+TcptupAZdlm8P3Gc3nncXAvHQ==
X-Received: by 2002:aa7:c4d0:: with SMTP id p16mr19752190edr.150.1623060476115;
        Mon, 07 Jun 2021 03:07:56 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id f18sm6324272ejz.119.2021.06.07.03.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jun 2021 03:07:55 -0700 (PDT)
Subject: Re: [PATCH 19/34] docs: driver-api: surface_aggregator: avoid using
 ReSt :doc:`foo` markup
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org
References: <cover.1622898327.git.mchehab+huawei@kernel.org>
 <c42fe427e6538ce7914645468ef63f83254c26d7.1622898327.git.mchehab+huawei@kernel.org>
 <91d72412-3bba-8a50-4527-7c8fb9fa54c4@gmail.com>
 <1663da2c-571f-cf7d-a0ca-ea7031515b40@redhat.com>
 <20210607115535.0181e679@coco.lan>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <28662dee-dd1b-761a-488a-e4af92a8ddfc@redhat.com>
Date:   Mon, 7 Jun 2021 12:07:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210607115535.0181e679@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 6/7/21 11:55 AM, Mauro Carvalho Chehab wrote:
> Hi Hans,
> 
> Em Mon, 7 Jun 2021 11:31:49 +0200
> Hans de Goede <hdegoede@redhat.com> escreveu:
> 
>> Hi,
>>
>> On 6/5/21 4:14 PM, Maximilian Luz wrote:
>>> On 6/5/21 3:18 PM, Mauro Carvalho Chehab wrote:  
>>>> The :doc:`foo` tag is auto-generated via automarkup.py.
>>>> So, use the filename at the sources, instead of :doc:`foo`.
>>>>
>>>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
>>>
>>> Acked-by: Maximilian Luz <luzmaximilian@gmail.com>  
>>
>> Mauro, I assume that you are going to take care of sending this
>> to Linus, or do you want me to merge this patch into the pdx86 tree?
> 
> Whatever works best for you and Jon, as it should either be merged
> via each maintainers' tree or at the docs tree ;-)

I think it is probably easiest if Jon just picks up the entire series.

Jon, please let me know if you want me to merge this patch.

Regards,

Hans

