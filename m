Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 749E3C00140
	for <linux-doc@archiver.kernel.org>; Mon,  8 Aug 2022 12:31:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234872AbiHHMbk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Aug 2022 08:31:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234545AbiHHMbh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Aug 2022 08:31:37 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DC1A6552
        for <linux-doc@vger.kernel.org>; Mon,  8 Aug 2022 05:31:34 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id m2so8420450pls.4
        for <linux-doc@vger.kernel.org>; Mon, 08 Aug 2022 05:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=z/KW1IDpK7QJHXi9O7Uk5IUUVA6pBcI3nOmLX9hErQw=;
        b=Hgi3Kz1znu1rLQA1rVyVtlvAtm32ntHI7GpCk2dx9TK2f0FE5l1228xFDssjMfGMY1
         CVx+KneUT0mOpz5Q4xZXMHehd+BT8mYikIcpnICpo6ONenlWkUq179lHe3qx2e1QvIfF
         LQyKRGdTIcoNbkgMSjLcV5qLFleY11udgCq2cIjKrDIkC+SPerErjB8hFHLXVy/7HE64
         a7locMSd9gE8fLf6NTKfus1petM8GpWTrSY/+nsvy20+ELK8YOROy9bcaOoIgbtQWmLu
         t0besxhqDdYk7SGgisXqfZhj01zXQ4VqB3b9HZEABTgJo+HXGafDMGRb3/p/41Bskx/5
         ckyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=z/KW1IDpK7QJHXi9O7Uk5IUUVA6pBcI3nOmLX9hErQw=;
        b=trkANhC37DXobv4lVNWopAEJM1pvLDj+JNrQ2B+lQlDG1Szi3pFuC+3F5ELCbnSzIT
         qRY9xshikC5ALHI1npOZGtqdiwRjONj6hN9EWkz1c3sS8oUMbKBmuUpsOaGswJ3V1ZBc
         K7j/onKP/XQUoCLRAKmxfulpK/5FDJz2Rg7skrshg0v4mtg1WWogbHA5GFMDJzsuVIAC
         ueNpfNlv6qLArZsFQm4CbPPV7iDlhpW1/QV+AGzMsZTnDnXgivWoCLGF8V32UUuqQ6VS
         +qi5FZqUT6Pw2cXPwvjQYpHEXiDM5/q9q+CRl7AeLOwQ1PYI8/xMpwi8/MUFJAqabBpX
         PuoQ==
X-Gm-Message-State: ACgBeo2mcViogATnFARSQP1YngBREYgF1nUoJ9Zh3JjMU5dWiM31YeL1
        E0BFYjBytuflDepfRdteUn5QcDhMiXw=
X-Google-Smtp-Source: AA6agR49PDm/YkSr/akz1MAybBqBDQspweUCbcz2VOlHaV7n+cDbf27SziAMglaRW/EzzQJdWLqZbw==
X-Received: by 2002:a17:90a:d711:b0:1f4:cac7:b353 with SMTP id y17-20020a17090ad71100b001f4cac7b353mr20866280pju.8.1659961893503;
        Mon, 08 Aug 2022 05:31:33 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-80.three.co.id. [180.214.232.80])
        by smtp.gmail.com with ESMTPSA id 78-20020a621651000000b0052d3ea78858sm8450457pfw.127.2022.08.08.05.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Aug 2022 05:31:33 -0700 (PDT)
Message-ID: <17055cee-e154-6074-c974-5c6fad27a295@gmail.com>
Date:   Mon, 8 Aug 2022 19:31:24 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/2] docs: driver-api: virtio: virtio on Linux
Content-Language: en-US
To:     =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>
Cc:     linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org, mst@redhat.com,
        jasowang@redhat.com, kernel@collabora.com, cohuck@redhat.com
References: <20220804105914.3707389-1-ricardo.canuelo@collabora.com>
 <20220804105914.3707389-3-ricardo.canuelo@collabora.com>
 <Yu4fEEDMVrC7eNY1@debian.me>
 <87o7wvqf2k.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <87o7wvqf2k.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 8/8/22 16:06, Ricardo Cañuelo wrote:
>> -[1] Virtio Spec v1.2:
>> -https://docs.oasis-open.org/virtio/virtio/v1.2/virtio-v1.2.html
>> +.. [1] Virtio Spec v1.2:
>> +   https://docs.oasis-open.org/virtio/virtio/v1.2/virtio-v1.2.html
>>  
>> -Check for later versions of the spec as well.
>> +   Check for later versions of the spec as well.
>>  
>> -[2] Virtqueues and virtio ring: How the data travels
>> -https://www.redhat.com/en/blog/virtqueues-and-virtio-ring-how-data-travels
>> +.. [2] Virtqueues and virtio ring: How the data travels
>> +   https://www.redhat.com/en/blog/virtqueues-and-virtio-ring-how-data-travels
>>  
>>  .. rubric:: Footnotes
> 
> Is that the preferred way to do it? I didn't find any guidelines about
> it and the existing docs don't seem to settle on any specific
> style. Personally I prefer to keep it as it is in the patch because I
> like the bibliography references to look different than footnote links
> ([] vs superscript).
> 

I think the citation syntax is better suited for this case of external
references mentioned in a documentation.

-- 
An old man doll... just what I always wanted! - Clara
