Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 877FAC54EE9
	for <linux-doc@archiver.kernel.org>; Mon, 19 Sep 2022 08:43:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbiISInc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Sep 2022 04:43:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbiISInb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Sep 2022 04:43:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FB62220C1
        for <linux-doc@vger.kernel.org>; Mon, 19 Sep 2022 01:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663577008;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=c68X5zyTPcgo56gf8lFXosz3ez64Ms9Dsywzzb9DBq4=;
        b=D4mRk4LzY9PNBUB2uwkzAEFSHem4xXS/IIFU2EUObNaMi4d0futZ/Bnl1vZnNhxsdsphSY
        DBzq82JzNRjyLftxL4JfFK9KfMwiFnvFNqYJN27ROFb+zYtS1VqYyOEhulGkq36H+sbgvs
        hH3ZzO5umL6eEdGVrU8vNxgYvKN1XUk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-404-DuD3NbIkM0ubbqRKqEXGAg-1; Mon, 19 Sep 2022 04:43:27 -0400
X-MC-Unique: DuD3NbIkM0ubbqRKqEXGAg-1
Received: by mail-wr1-f69.google.com with SMTP id q17-20020adfab11000000b0022a44f0c5d9so5987705wrc.2
        for <linux-doc@vger.kernel.org>; Mon, 19 Sep 2022 01:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=c68X5zyTPcgo56gf8lFXosz3ez64Ms9Dsywzzb9DBq4=;
        b=VvcsbWNB8gSSWvvQvEQ1/WJRl1TONfxh7kbyls+1SvreGflKLeAvmpicUN5DOEQbLh
         +uSj3zGr5hl5G3mrDOAHVpo6uxOAitweghjLMOfDnrrmZOCu2gHCeBXNgfrliqPyPyUA
         r1f+g/nPB2l7gYm7/wOYav0yFrwCEcAL3P0MaZGzsXVWGCbMQ7wkYTlDhXahKrTW2ig9
         KunB3PE9ill53kSjckPExHExPHzpmSwxSS7vm/tdhwZQ/kXGqJRu+ny4YLGY58U5h1tH
         fhk4FZkeh2b/c1/lSy1NHYWJI5lyGupFkAnmWi8IgftfHYufl5y8MQNxyZUKVLzoK8jS
         By/Q==
X-Gm-Message-State: ACrzQf0L2SZfo2i/iitm2lAIY8Wd4B7CFpgw4v9gJv7OGZld4q7tDWhv
        jIggkL/9oZqFYzNA450VL1zkHcgqwv2uDHdJUftQwdHo497tvTnFgra6396aM/0IdAI+4RzrqvC
        pew/XgmI/yXw/js5q6hYn
X-Received: by 2002:a05:600c:4e11:b0:3b4:91fd:d0c with SMTP id b17-20020a05600c4e1100b003b491fd0d0cmr11562109wmq.71.1663577006568;
        Mon, 19 Sep 2022 01:43:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6N7jj2hCArDkIS0hqCNfKGStr12fevzZwsYldSD36MylkUB8fFQzxSwsr4/3VsP5ZV8nEMQw==
X-Received: by 2002:a05:600c:4e11:b0:3b4:91fd:d0c with SMTP id b17-20020a05600c4e1100b003b491fd0d0cmr11562098wmq.71.1663577006284;
        Mon, 19 Sep 2022 01:43:26 -0700 (PDT)
Received: from ?IPV6:2003:cb:c703:c100:c136:f914:345f:f5f3? (p200300cbc703c100c136f914345ff5f3.dip0.t-ipconnect.de. [2003:cb:c703:c100:c136:f914:345f:f5f3])
        by smtp.gmail.com with ESMTPSA id h22-20020a05600c2cb600b003b4868eb71bsm14009883wmc.25.2022.09.19.01.43.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 01:43:25 -0700 (PDT)
Message-ID: <ebcaadb8-a698-b7ba-a11c-dbd2e379fdef@redhat.com>
Date:   Mon, 19 Sep 2022 10:43:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH -next v2 1/5] docs: notifier-error-inject: fix non-working
 usage of negative values
Content-Language: en-US
To:     Akinobu Mita <akinobu.mita@gmail.com>,
        Zhao Gongyi <zhaogongyi@huawei.com>
Cc:     linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, osalvador@suse.de,
        shuah@kernel.org
References: <20220915085757.258608-1-zhaogongyi@huawei.com>
 <20220915085757.258608-2-zhaogongyi@huawei.com>
 <CAC5umyhUteOFg1Q+rxU01axu_Rt2gadTqi9NxLESiqNyLtHaZA@mail.gmail.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CAC5umyhUteOFg1Q+rxU01axu_Rt2gadTqi9NxLESiqNyLtHaZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 17.09.22 07:39, Akinobu Mita wrote:
> 2022年9月15日(木) 18:01 Zhao Gongyi <zhaogongyi@huawei.com>:
>>
>> Fault injection uses debugfs in a way that the provided values via
>> sysfs are interpreted as u64. Providing negative numbers results in
>> an error:
>>
>>    # cd sys/kernel/debug/notifier-error-inject/memory
>>    #  echo -12 > actions/MEM_GOING_ONLINE/error
>>    -bash: echo: write error: Invalid argument
>>
>> Update the docs and examples to use "printf %#x <val>" in these cases.
> 
> I'd rather fix the notifier-error-inject module than change the user interface.
> I'll send a patch, so could you check if that solves the problem.
> 

That will also make patch #2 unnecessary, correct?

-- 
Thanks,

David / dhildenb

