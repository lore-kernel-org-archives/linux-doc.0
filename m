Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36402ECAAD8
	for <linux-doc@archiver.kernel.org>; Tue, 20 Sep 2022 08:18:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbiITISR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Sep 2022 04:18:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbiITIR5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Sep 2022 04:17:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F7B467171
        for <linux-doc@vger.kernel.org>; Tue, 20 Sep 2022 01:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663661706;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IZY1YavaFvCQO8tOgPzXe0UBwQkGNW34ROeeUBFifyI=;
        b=bnbXqrexHF6ZFVLwzCA5gNxmsOXcwWWvWfHVRVV2xdqU0DW+uOEKWiOJYrtHfrR5YTGUDD
        cT+LsqRHrt+gM53LUWPfloLjHaJ+evjOCwA7mnVHVxaLXHR9ZNEPr0WJNOUIrOpu+qv4HN
        0rL69Q49SFXAXm4jEy0patXHjSElXfw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-257-7-hQE2HDPIK3z0Y0YOYBqg-1; Tue, 20 Sep 2022 04:14:59 -0400
X-MC-Unique: 7-hQE2HDPIK3z0Y0YOYBqg-1
Received: by mail-wr1-f72.google.com with SMTP id v7-20020adfa1c7000000b0022ae7d7313eso819864wrv.19
        for <linux-doc@vger.kernel.org>; Tue, 20 Sep 2022 01:14:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :content-language:references:to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=IZY1YavaFvCQO8tOgPzXe0UBwQkGNW34ROeeUBFifyI=;
        b=G5MXu/g16CjZBzCW0jww4jhbnsiZhkjXSC8ZZs0TzVsydUpE3dfGMFBR8cX+ZV7Tbw
         PHIDkUVhlXUvLBz1rn4V3wRRgY9sAdkgw7cNvQ3YSnAxOcFRKDGIvOOdZhjd/r44F1hY
         TAOblyW70WKCGuj9aDTsItUD4VgBV/T1lcaWWoYZFtKkpLdc/3kPspmGDYAi4W8L5m9A
         ldREPyBu7XW9U6h5PjzFNjSwbSli6waIERftTma9BY9ABe70k9F/bBc1BGDcv6lIWg3B
         CO5Guk5keXRId7zvRo9yyPDDlktrkrFoIfsxxOUSChKPcmSvnIQS8+9jRb4KnCTtwDJp
         ZXMg==
X-Gm-Message-State: ACrzQf03YmcOJg8bC7bQkD3jEK4KCyEUCFf/s0oY9YJ8ZecMGo8Mv4vx
        ZXIf5KWiT9asf6iGkkbafLIo/gu3x+UHxhJX/qRaKcbORweDGfj3VPqppM1UTH6qZXtOKcX1XNQ
        oshk3hsJ5UvV70KLtS9cJ
X-Received: by 2002:a05:600c:502c:b0:3a8:41e9:cd32 with SMTP id n44-20020a05600c502c00b003a841e9cd32mr1390975wmr.177.1663661698496;
        Tue, 20 Sep 2022 01:14:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM66+NV0/AY2AzFAp6F92Em689IXLMoLrKqSW9fGLIpywepwzilF5sHgjwovliPmjN35Y1UA+w==
X-Received: by 2002:a05:600c:502c:b0:3a8:41e9:cd32 with SMTP id n44-20020a05600c502c00b003a841e9cd32mr1390961wmr.177.1663661698255;
        Tue, 20 Sep 2022 01:14:58 -0700 (PDT)
Received: from ?IPV6:2003:cb:c712:2300:e82d:5a58:4fd8:c1e6? (p200300cbc7122300e82d5a584fd8c1e6.dip0.t-ipconnect.de. [2003:cb:c712:2300:e82d:5a58:4fd8:c1e6])
        by smtp.gmail.com with ESMTPSA id l4-20020adff484000000b0022ac13aa98fsm889374wro.97.2022.09.20.01.14.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 01:14:57 -0700 (PDT)
Message-ID: <08572e43-5de6-9bca-54ab-1779aeb54c25@redhat.com>
Date:   Tue, 20 Sep 2022 10:14:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
To:     Akinobu Mita <akinobu.mita@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        corbet@lwn.net, osalvador@suse.de, shuah@kernel.org,
        Zhao Gongyi <zhaogongyi@huawei.com>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Yicong Yang <yangyicong@hisilicon.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        akpm@linux-foundation.org
References: <20220919172418.45257-1-akinobu.mita@gmail.com>
 <20220919172418.45257-2-akinobu.mita@gmail.com>
Content-Language: en-US
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH 1/3] libfs: add DEFINE_SIMPLE_ATTRIBUTE_SIGNED for signed
 value
In-Reply-To: <20220919172418.45257-2-akinobu.mita@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 19.09.22 19:24, Akinobu Mita wrote:
> The simple attribute files do not accept a negative value since the
> commit 488dac0c9237 ("libfs: fix error cast of negative value in
> simple_attr_write()"), so we have to use a 64-bit value to write a
> negative value.
> 
> This adds DEFINE_SIMPLE_ATTRIBUTE_SIGNED for a signed value.
> 
> Fixes: 488dac0c9237 ("libfs: fix error cast of negative value in simple_attr_write()")

This patch itself isn't a fix. The fixes tags belong to the other 
patches that make use of this.

> Reported-by: Zhao Gongyi <zhaogongyi@huawei.com>
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

