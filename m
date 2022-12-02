Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9189EC47088
	for <linux-doc@archiver.kernel.org>; Fri,  2 Dec 2022 09:43:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232851AbiLBJnx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Dec 2022 04:43:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232598AbiLBJnw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Dec 2022 04:43:52 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C26CD638A
        for <linux-doc@vger.kernel.org>; Fri,  2 Dec 2022 01:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669974169;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+wLl4vtYCGhwohXxITZQq5I6CY9K6KjTKaeRzYrEEpY=;
        b=GVyMkVrxHuH6ntzuBs4aff9tewyssz9Vp2M/M4P1m+LoXlEEKm8kH2GbKgdYtd2OJeF+vE
        RyWKS65gp9qEqlF88IMqgTPxdZZiUdCeYdKGVDv6WMLCE2WO1AivtqZxglgo1HaZW+Wknk
        BK4lxk/HK8Xti52QOHJO/Z22nhzgWSQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-424-npUUOJNVMp2pkpvfdLzYEA-1; Fri, 02 Dec 2022 04:42:47 -0500
X-MC-Unique: npUUOJNVMp2pkpvfdLzYEA-1
Received: by mail-wr1-f71.google.com with SMTP id w11-20020adfbacb000000b002418a90da01so929502wrg.16
        for <linux-doc@vger.kernel.org>; Fri, 02 Dec 2022 01:42:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+wLl4vtYCGhwohXxITZQq5I6CY9K6KjTKaeRzYrEEpY=;
        b=bk+E5v5B1UQ4ALaZ++2FQmpMujGKglgieo78oTlHbTOuvIYL5+Yz5sKD8IbiMKI4wW
         SUQewi4obsldOrSQJmC3p6FBhL1Ppi2H8mGV8jrpATh+9qfkqRyi3VqsfGABFiS6sw8K
         xjhh+Du6V/mnxI47g0ZLDs3Zf/S4msQRIcEkzovoHuDJdAiHSYCGx1+/4f9EsqgLjv4U
         NGYr3URqNhKb4D5CrCBDS0ZtvbEGvd6lqWhHcuMBFgfyastaizbkTC0E/HJGQn3neR0v
         z2q6zLYE5K8z5JanJ+T7x5cGzSMM7y5qM9litX4OQndnOuEyAdBK16tkWR/6hHHvAlDc
         ZNgw==
X-Gm-Message-State: ANoB5pnxrVvr+GJjnPSNQhRcC2ZXXmhDsdsW5G8GhgbX6rtbq1kDTZGJ
        DFtqMDZf9i0Tc73YooIdjimBpUGuRxiAydq6Fw61jBN82yZgrNcVHKnd/zRCkVC4qu3dNI5bmDG
        590yzoKE8M+u4Lh8nVXXq
X-Received: by 2002:a5d:6947:0:b0:242:17a5:ee80 with SMTP id r7-20020a5d6947000000b0024217a5ee80mr14530213wrw.628.1669974166726;
        Fri, 02 Dec 2022 01:42:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6UdJV/mDJpmRG4muvnS79yLQAxAfJtB+81SwOHAcWOxkps8MZJhxfA5YRNqhJp3giA0N1wyw==
X-Received: by 2002:a5d:6947:0:b0:242:17a5:ee80 with SMTP id r7-20020a5d6947000000b0024217a5ee80mr14530202wrw.628.1669974166476;
        Fri, 02 Dec 2022 01:42:46 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id z5-20020adff745000000b002383fc96509sm6488257wrp.47.2022.12.02.01.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 01:42:46 -0800 (PST)
Message-ID: <3805ed81-2315-4eca-3ea6-b391c1659cc7@redhat.com>
Date:   Fri, 2 Dec 2022 10:42:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/2] KVM: Mark KVM_SET_MEMORY_REGION and
 KVM_SET_MEMORY_ALIAS as obsoleted
To:     Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>
Cc:     linux-kernel@vger.kernel.org,
        Sergio Lopez Pascual <slp@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20221119085632.1018994-1-javierm@redhat.com>
 <Y4T+SY9SZIRFBdBM@google.com>
 <a6a59b75-2ee2-ab9b-3038-2590df17d031@redhat.com>
Content-Language: en-US
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <a6a59b75-2ee2-ab9b-3038-2590df17d031@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello Sean and Paolo,

Thanks for your feedback.

On 11/30/22 15:28, Paolo Bonzini wrote:
> On 11/28/22 19:30, Sean Christopherson wrote:
>> E.g. KVM_{CREATE,GET,SET}_PIT are good examples of obsolete ioctls; they've been
>> supplanted by newer variants, but KVM still supports the old ones too.
>>
>> Alternatively (to marking them deprecated), can we completely remove all references
>> to VM_SET_MEMORY_REGION and KVM_SET_MEMORY_ALIAS?  The cascading updates in api.rst
>> will be painful, but it's one-time pain.
> 
> Yes, we should.
>

Ok. I'll do that and post a v2 then.
 
> Paolo
> 

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

