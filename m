Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7962ECAAD3
	for <linux-doc@archiver.kernel.org>; Mon, 19 Sep 2022 11:05:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbiISLFm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Sep 2022 07:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbiISLFh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Sep 2022 07:05:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AD1B9FD9
        for <linux-doc@vger.kernel.org>; Mon, 19 Sep 2022 04:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663585528;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IulqkCtEaGt099GbXE/BHeOG0mRKOudTYkQ9exTVP/g=;
        b=Rzgpec3nxF2pp+TRGKk4NLGjSMlXSVSVDumQyUyBkUdVFJpZqdjzSmQ0LA5vvbQtnVZG0P
        DbZBrtmLF2LKC31lj+s1Z+RQ1i5pC6sdWJyOo2bpihwtyE0rdjuP0HsPXB1y8nKWu8Kw/H
        01LL9yFPN6+qiPav5avN5QfLv3FlJ8I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-602-9s11UZJYO9WWPLEEhThERA-1; Mon, 19 Sep 2022 07:05:27 -0400
X-MC-Unique: 9s11UZJYO9WWPLEEhThERA-1
Received: by mail-wr1-f70.google.com with SMTP id q17-20020adfab11000000b0022a44f0c5d9so6105224wrc.2
        for <linux-doc@vger.kernel.org>; Mon, 19 Sep 2022 04:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=IulqkCtEaGt099GbXE/BHeOG0mRKOudTYkQ9exTVP/g=;
        b=7sPPQf8gvhTWWhL2pciWX4lvUdVXO8jD/hhC/HwilBTUhKphE6NQrF+d2XBQzQkG3X
         FX3hBil4v0hYTnUOmFfifIfE+4m11a+eQRHqhmDFFd4DZfMCmkKVM06S9Wy/qabV52hN
         Hwk/Q4O5MYV+WedY4a6v2EeFUTRSeAZjFotVc6iM16skpBbYZP1EcI5izNGIULVbu+tk
         HK2vNGpTTpEt9ISeEPpJ6FnLCYRr5QBCdWBLaRKKtpt545Y27Nvkza2xIiT60iQWfL//
         6BevBHJU12XpdWTgOpdCruOgQNTPygNjkUJuceTw22zLPEz6S/+wph95u+Vo4vmxyjsz
         BMLQ==
X-Gm-Message-State: ACrzQf1b/OYc+8ARl+ctTZzkK67ZRgpgcuVpv3iN/Rq/9Q0JFmxZIKel
        MEj0r/pW1aW3Rq6HRKLm3yifniCahmzBdgq0vzOvCcFPln5DuZRWPTB76/pZ8jvUuNj0XFzAZkT
        logdk3wYWXKqLqAD4a9c2
X-Received: by 2002:a05:6000:114b:b0:228:ab76:fa00 with SMTP id d11-20020a056000114b00b00228ab76fa00mr10087466wrx.628.1663585526815;
        Mon, 19 Sep 2022 04:05:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM57vq8QjEFjVNsIk+CislbvrnvNW7MFRM57slGULMzKF0ghTms9waLzTbyAJnL91m2L8CeC3Q==
X-Received: by 2002:a05:6000:114b:b0:228:ab76:fa00 with SMTP id d11-20020a056000114b00b00228ab76fa00mr10087440wrx.628.1663585526436;
        Mon, 19 Sep 2022 04:05:26 -0700 (PDT)
Received: from ?IPV6:2003:cb:c703:c100:c136:f914:345f:f5f3? (p200300cbc703c100c136f914345ff5f3.dip0.t-ipconnect.de. [2003:cb:c703:c100:c136:f914:345f:f5f3])
        by smtp.gmail.com with ESMTPSA id bx26-20020a5d5b1a000000b0022afcc11f65sm3939718wrb.47.2022.09.19.04.05.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 04:05:25 -0700 (PDT)
Message-ID: <93339a97-ea08-0880-b0cf-e5270179079a@redhat.com>
Date:   Mon, 19 Sep 2022 13:05:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH -next v2 1/5] docs: notifier-error-inject: fix non-working
 usage of negative values
Content-Language: en-US
To:     zhaogongyi <zhaogongyi@huawei.com>,
        Akinobu Mita <akinobu.mita@gmail.com>
Cc:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "osalvador@suse.de" <osalvador@suse.de>,
        "shuah@kernel.org" <shuah@kernel.org>
References: <076b1f2a38ab4ca4a61e6a79c765bcba@huawei.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <076b1f2a38ab4ca4a61e6a79c765bcba@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 19.09.22 11:01, zhaogongyi wrote:
> Hi!
> 
>>
>> On 17.09.22 07:39, Akinobu Mita wrote:
>>> 2022年9月15日(木) 18:01 Zhao Gongyi <zhaogongyi@huawei.com>:
>>>>
>>>> Fault injection uses debugfs in a way that the provided values via
>>>> sysfs are interpreted as u64. Providing negative numbers results in
>>>> an error:
>>>>
>>>>     # cd sys/kernel/debug/notifier-error-inject/memory
>>>>     #  echo -12 > actions/MEM_GOING_ONLINE/error
>>>>     -bash: echo: write error: Invalid argument
>>>>
>>>> Update the docs and examples to use "printf %#x <val>" in these cases.
>>>
>>> I'd rather fix the notifier-error-inject module than change the user
>> interface.
>>> I'll send a patch, so could you check if that solves the problem.
>>>
>>
>> That will also make patch #2 unnecessary, correct?
> 
> Yes. But there is another commit 005747526d4f3c2ec995891e95cb7625161022f9 that has the same problem.
> 
> Thanks!

Right. See my reply to the other patch:

https://lkml.kernel.org/r/93c044ca-7d2f-e23f-8eb4-72c133737a15@redhat.com

simple_attr_read()/simple_attr_write() fmt behavior is odd.

-- 
Thanks,

David / dhildenb

