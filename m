Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25ED1C433F5
	for <linux-doc@archiver.kernel.org>; Tue,  4 Oct 2022 12:32:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbiJDMcz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 4 Oct 2022 08:32:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbiJDMcx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Oct 2022 08:32:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD84D5A2EC
        for <linux-doc@vger.kernel.org>; Tue,  4 Oct 2022 05:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664886769;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ARqzLCUGK9oxipjgV/TP0dhqnyFoncnYQ36iiV2KnPc=;
        b=Bj3j42Z1UFJxAf6YnYiq7NJ3NO9F4UlDsMIq/7WYaWkpoVrynneqQ4mr6cmd8P35wooo+5
        YZikVsJClDnsIlB4/Pq/SufLkKeAPtSRu2ZnjjVHRF5aQOrXEaeBt1id4GngKaVoV67Uyk
        y+uh0YZd8vEipXD3A8r7trk4I9m0sI4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-583-UznzIA1CPea5uLG64atAnA-1; Tue, 04 Oct 2022 08:32:48 -0400
X-MC-Unique: UznzIA1CPea5uLG64atAnA-1
Received: by mail-wr1-f72.google.com with SMTP id j8-20020adfa548000000b0022e2bf8f48fso2396002wrb.23
        for <linux-doc@vger.kernel.org>; Tue, 04 Oct 2022 05:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=ARqzLCUGK9oxipjgV/TP0dhqnyFoncnYQ36iiV2KnPc=;
        b=hvkAd0EVeN/GCLeDkTBGy2YEva32y90+ZEcu0WaIYZ0jJltuU7tZE5eGetrnRknQoa
         GW0gsZlw6elz1z/VfsEdu0aet+5BI/QuvHHyQ/dFjHuXERkHm1zmSYlUjwE2L0WjshGG
         v2pmLPEtHtL9Fw9r2BMZC4e/KR6ZpatfEVEe7pqAJo+y+m5HLOUeZYcBg7uIQeub0302
         ARahqjFnWVdihmFvkCAsP2yYuuYWU6mDLczlMEA9MP9AFr6kbnZ2tuEy9bvLszY8lNRy
         cx4u7+/LJpiRyeTWscrSFticAinDeHW+JmGa6t50a6dgNgEHmsrxrsp4yVJVG5okjBoa
         8RUA==
X-Gm-Message-State: ACrzQf3EinSn4vCRpmJV7HnNwL3010aX1KF1QsG30VkmSc2OR9KFSpL7
        nVk8DVyiIhiaUZD5Ym8EmNt6ppyV+fLUQpyvBQis/tGx4GkuL5HFIRkxfrX4UepS6lli2/WtVQY
        EFN9aIAJIotsnd52yKgYL
X-Received: by 2002:adf:fb84:0:b0:21a:10f2:1661 with SMTP id a4-20020adffb84000000b0021a10f21661mr15777339wrr.2.1664886767405;
        Tue, 04 Oct 2022 05:32:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4xqePutEPB3BXlHEVeHUD3E+8ExIhv/azDcUvIYjAckd2CXwfmrDfdmGjPdpAJS/YBJHMgGg==
X-Received: by 2002:adf:fb84:0:b0:21a:10f2:1661 with SMTP id a4-20020adffb84000000b0021a10f21661mr15777319wrr.2.1664886767130;
        Tue, 04 Oct 2022 05:32:47 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:5000:4fff:1dd6:7868:a36? (p200300cbc70650004fff1dd678680a36.dip0.t-ipconnect.de. [2003:cb:c706:5000:4fff:1dd6:7868:a36])
        by smtp.gmail.com with ESMTPSA id k5-20020adff5c5000000b0022afbd02c69sm10360655wrp.56.2022.10.04.05.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 05:32:46 -0700 (PDT)
Message-ID: <31f20ddf-cd41-69b5-2875-2d738b166ae2@redhat.com>
Date:   Tue, 4 Oct 2022 14:32:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 1/3] coding-style.rst: document BUG() and WARN() rules
 ("do not crash the kernel")
Content-Language: en-US
To:     Kalle Valo <kvalo@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        David Laight <David.Laight@ACULAB.COM>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
        Dave Young <dyoung@redhat.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20220920122302.99195-1-david@redhat.com>
 <20220920122302.99195-2-david@redhat.com> <87pmfp8hnj.fsf@kernel.org>
 <d1ceedca-b28e-c47e-aa0d-aa1cb36d12b9@redhat.com> <87leq64m20.fsf@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <87leq64m20.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 26.09.22 09:44, Kalle Valo wrote:
> David Hildenbrand <david@redhat.com> writes:
> 
>>>> +Use WARN_ON_ONCE() rather than WARN() or WARN_ON()
>>>> +**************************************************
>>>> +
>>>> +WARN_ON_ONCE() is generally preferred over WARN() or WARN_ON(), because it
>>>> +is common for a given warning condition, if it occurs at all, to occur
>>>> +multiple times. This can fill up and wrap the kernel log, and can even slow
>>>> +the system enough that the excessive logging turns into its own, additional
>>>> +problem.
>>>
>>> FWIW I have had cases where WARN() messages caused a reboot, maybe
>>> mention that here? In my case the logging was so excessive that the
>>> watchdog wasn't updated and in the end the device was forcefully
>>> rebooted.
>>>
>>
>> That should be covered by the last part, no? What would be your suggestion?
> 
> I was just thinking that maybe make it more obvious that even WARN_ON()
> can crash the system, something along these lines:
> 
> "..., additional problem like stalling the system so much that it causes
> a reboot."

Hi Kalle,

sorry for the late reply. Jonathan already queued v2 and sent it upstream.

I think that's it is already covered by the statement and that the 
additional example isn't required -- most of us learned the hard way 
that "excessive logging turns into its own problem" includes all weird 
kinds of kernel crashes. A panic/reboot due to a watchdog not firing is 
one such possible outcome.

Thanks!

-- 
Thanks,

David / dhildenb

