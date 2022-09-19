Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF8F0C54EE9
	for <linux-doc@archiver.kernel.org>; Mon, 19 Sep 2022 13:32:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbiISNcy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Sep 2022 09:32:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbiISNcw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Sep 2022 09:32:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D4541BEBF
        for <linux-doc@vger.kernel.org>; Mon, 19 Sep 2022 06:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663594370;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=S3R/J9mAzmfvH9Y9E0yXACqtf5r5Llzujq7g/NYrlA8=;
        b=FY1KSt+ZBP+qu1yNlZF5w4EnAj2jX3FkiOmmmKQCsf1zvLvy2VYnTLq4w4obyLkDrn2t5u
        0+AZYAWKr+Og4J72OaAYJqohPo60Hu/p8T60MvM+CviPRJfQPN6HmBIvT0rHdefem84ZB7
        sSWWDXlg94yG6loZqntofVGL8EowRGY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-37-SLYcXeyKOVudzKVg7vRyCQ-1; Mon, 19 Sep 2022 09:32:49 -0400
X-MC-Unique: SLYcXeyKOVudzKVg7vRyCQ-1
Received: by mail-wr1-f71.google.com with SMTP id d25-20020adf9b99000000b0022adb03aee6so1752437wrc.6
        for <linux-doc@vger.kernel.org>; Mon, 19 Sep 2022 06:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=S3R/J9mAzmfvH9Y9E0yXACqtf5r5Llzujq7g/NYrlA8=;
        b=SxWnQ0sEPkxrwIL5PsusmIlJuzau+5rV36K9gxb4NzRT/j+4ZRbwPHE3bsux704+4V
         LG/pxWe9dWd1YgYjB0s9R5lFh0CkpSYJ+B+0Wm2sDldIrr1Pgja+CjwINoGV7qff77QD
         USSqxf64fd/j2uxGVbfV3paCZG4vFc/Gq/r6+/oc9dWocAVumEFsGmkClvPC0ZYDtvO5
         RUBNqqOv4dww5dDy9lv6dDZSKnFjjyhCuI8NfwZAdwg7HfgORiN3YgNx1oAEtQ+vCwUf
         zrCq246HZet71Y+fCb+g8iKSDXzul0GttKPooFcSCTICAWCapMGT5/mZekEKnSmjw9l1
         8wPA==
X-Gm-Message-State: ACgBeo144wP0RJzTCBOkw0ZXutm3vMSBTBNG4Qh+lw8XWVl9cKsC91JW
        ehxodiyiz7OaP6sGWPLLA1rQ3/bc5XtJiKs7sM4pkS5WaCvNprzYRw80c3K6awsNdXQ1bcN+Mt5
        gRmMRa3WoS4LSUQ7fA500
X-Received: by 2002:a7b:c8d6:0:b0:3b4:868b:afc3 with SMTP id f22-20020a7bc8d6000000b003b4868bafc3mr18599079wml.66.1663594363530;
        Mon, 19 Sep 2022 06:32:43 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6OcwxNBdq96pcCKiBsuz5gSLS3FYvAwyZhxQCkoPkFWU0g/YPusv2Hki3QnCjwBm0u4wEhQQ==
X-Received: by 2002:a7b:c8d6:0:b0:3b4:868b:afc3 with SMTP id f22-20020a7bc8d6000000b003b4868bafc3mr18598877wml.66.1663594359815;
        Mon, 19 Sep 2022 06:32:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:2bc:381::432? ([2a01:e0a:2bc:381::432])
        by smtp.gmail.com with ESMTPSA id x1-20020adfdd81000000b002205cbc1c74sm9753212wrl.101.2022.09.19.06.32.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 06:32:38 -0700 (PDT)
Message-ID: <d4b420a0-23da-6ab6-886a-7342f7e63651@redhat.com>
Date:   Mon, 19 Sep 2022 15:32:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [RESEND PATCH 1/2] HID: Add driver for RC Simulator Controllers
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Marcus Folkesson <marcus.folkesson@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Jiri Kosina <jikos@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
References: <20220822060936.769855-1-marcus.folkesson@gmail.com>
 <CAO-hwJ+3Yrr--cr=r5+jvs4A=A-cmDtrKQETo=YOYDC3nXTMBg@mail.gmail.com>
 <YwTvrNuulKx0SB6H@gmail.com>
 <CAO-hwJKiq50fWwXNUGcXeWtWcUXb65ZmJMsADfrsUTac_Xj2dw@mail.gmail.com>
 <YwcbVJswrL1Doi4s@gmail.com>
 <CAO-hwJJ86oAuaFD+uX7Rwv7cASO=4mchRJ1UBTxz9gYs6M1rUg@mail.gmail.com>
 <YyLVblZkIPCvNd/2@gmail.com>
 <CAO-hwJJ5dRrgxrae-RasYXuu7C9xjw6RmPaPfmO=YU3StMaQ3A@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAO-hwJJ5dRrgxrae-RasYXuu7C9xjw6RmPaPfmO=YU3StMaQ3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 9/15/22 09:35, Benjamin Tissoires wrote:
> On Thu, Sep 15, 2022 at 8:28 AM Marcus Folkesson
> <marcus.folkesson@gmail.com> wrote:
>>
>> Hi Benjamin,
>>
>> On Tue, Aug 30, 2022 at 02:45:11PM +0200, Benjamin Tissoires wrote:
>>> On Thu, Aug 25, 2022 at 8:44 AM Marcus Folkesson
>>> <marcus.folkesson@gmail.com> wrote:
>>>>
>>
>>
>> [...]
>>>>
>>>>
>>>> Is the fact that more than one button share the same
>>>> byte hard to describe in the report?
>>>
>>> No, this is actually easy to describe. You say that there is one usage
>>> of "something" which has a report size of 1 bit, and then you have
>>> another usage of "something else" with the same report size.
>>>
>>> But usually you have to add padding after to make up to 8 bits (so 6
>>> bits in that case).
>>>
>>> I was referring to the case  where you are parsing the same bit on the
>>> wire, and give a different usage based if you have received an odd or
>>> an even number of reports. In that case, we probably need to use move
>>> this bit to a const field in the original report descriptor and say
>>> that the data is now not const:
>>>
>>> - initial report (completely random example):
>>>    X (2 bytes) | Y (2 bytes) | button this_or_that (1 bit, depending of
>>> odd or even received reports) | 7 bits of padding
>>> - we can declare it as:
>>>    X (2 bytes) | Y (2 bytes) | button this (1 bit) | button that (1
>>> bit) | 6 bits of padding
>>
>> How about if there is no unused bytes?
>>
>> The XTRG2FMS has 8 10-bit channels and use every byte in the report.
>> Should I specify 8 8-bit channels instead and fix that in raw_event?
>> If so, should I only use 8bit values then?
> 
> If I am not wrong, you should be able to add another byte in the
> report descriptor, as long as your raw_event function always adds it.
> Though now that I am typing it, I am actually wondering if this will
> work. You can always try, there is a chance it'll work, but I can't
> remember if it'll result in a timeout on the USB front because it'll
> expect one more byte that will never arrive.

I am back home, and I just tested that. I had a doubt, and it is indeed
failing. You need the following change for this to be working (I need to
send it as a proper patch after assessing it hasn't side effects)

---

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index 13cce286247e..f37ffe2bd488 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -275,6 +275,7 @@ static void hid_irq_in(struct urb *urb)
         int                     status;
  
         switch (urb->status) {
+       case -EOVERFLOW:        /* happens with modified report descriptors */
         case 0:                 /* success */
                 usbhid->retry_delay = 0;
                 if (!test_bit(HID_OPENED, &usbhid->iofl))
---

Cheers,
Benjamin

> 
>>
>> (Are you at the ELCE conference btw?)
> 
> I was at Plumbers this week, but got an extra day today. But yeah, I'm
> in Dublin today.
> 
> Cheers,
> Benjamin
> 
>>
>> Best regards
>> Marcus Folkesson

