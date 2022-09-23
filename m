Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F9FC6FA8E
	for <linux-doc@archiver.kernel.org>; Fri, 23 Sep 2022 10:56:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbiIWK4t (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Sep 2022 06:56:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbiIWK4U (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Sep 2022 06:56:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9004B1075A3
        for <linux-doc@vger.kernel.org>; Fri, 23 Sep 2022 03:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663930533;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eef54XeIfI5ePPfdQCCa+xwkgeOXOv7/COauKA6kwwQ=;
        b=T1/dnU6p98uww+nanGTVnruJC9rupkKWmubAscT2C0i4dHvmIjX2isoheWoSXTI2E+WZMe
        Ivpi0a2jB7NP9+a0D//clBGqETi7e8u5dCtN1UnizMhPv8mLTB6Ksbl0G3YQIVOs+/0lrM
        PMgDVYXVuAJijAS86b+qJtC2bivLRWM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-492-6n6J7plsPGadW6jkEy1rCw-1; Fri, 23 Sep 2022 06:55:32 -0400
X-MC-Unique: 6n6J7plsPGadW6jkEy1rCw-1
Received: by mail-wr1-f69.google.com with SMTP id g19-20020adfa493000000b0022a2ee64216so3889959wrb.14
        for <linux-doc@vger.kernel.org>; Fri, 23 Sep 2022 03:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=eef54XeIfI5ePPfdQCCa+xwkgeOXOv7/COauKA6kwwQ=;
        b=OVOVStbOFSghZGFBxPbXMczpYnchXjPiBFzfM6IGnKopAJXoI1DQnVyJqHcP5d5lUE
         Brr99cNuPu3P+eM8aSd360vd8AtQUrj4d8sD2xo+P1fNc5+eVqjoRxc0mQYFSjrf41g5
         MsjcI9Td9/pJuE33ljMBElZ5/1DgsjQKyQwJ5tNsxf5Q71Zq1lqHtBIamqBTwFCcMQsR
         Pu20ByvTEpQsGXO+IlFc5J9kIa2zxDoa2r/6BqeeKKns0hpSidbL+B1cXIViyo/KYbpt
         MRm67lj5HOkAA27ZlIxX6p3PGoMI98+KRv1/C/zLAQzr0tqS0SL4GwqJAnX3Aib89RAO
         Rnxg==
X-Gm-Message-State: ACrzQf34otc6ghz8V3sPVwNUMuIXSnsAqmO8xPvQORz/IPJO6NQG5Rug
        TqfCRHfVbVxCJbayouILj/5m08ar/qhUOPx8S8+eG2ra9XlGsX7l6aSefrEB6DdbqA0UJrkRYIl
        L0OiSpkG0T6FL+bke82At
X-Received: by 2002:adf:de01:0:b0:228:62ae:78bc with SMTP id b1-20020adfde01000000b0022862ae78bcmr4702210wrm.41.1663930531715;
        Fri, 23 Sep 2022 03:55:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4kdGvtbB82mE3J4eOPvIcDO2feso4JPy2pwAaShDx+NaqgW7GNPKE3hF5xRI57FveqzL+0bQ==
X-Received: by 2002:adf:de01:0:b0:228:62ae:78bc with SMTP id b1-20020adfde01000000b0022862ae78bcmr4702188wrm.41.1663930531409;
        Fri, 23 Sep 2022 03:55:31 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:cc00:4585:a83b:64f2:ad21? (p200300cbc704cc004585a83b64f2ad21.dip0.t-ipconnect.de. [2003:cb:c704:cc00:4585:a83b:64f2:ad21])
        by smtp.gmail.com with ESMTPSA id d10-20020a056000114a00b002250c35826dsm7067750wrx.104.2022.09.23.03.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 03:55:30 -0700 (PDT)
Message-ID: <3108be4e-319d-3444-308d-ca60729ea502@redhat.com>
Date:   Fri, 23 Sep 2022 12:55:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 1/3] coding-style.rst: document BUG() and WARN() rules
 ("do not crash the kernel")
Content-Language: en-US
To:     John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
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
 <20220920122302.99195-2-david@redhat.com>
 <3dcbcc7b-9ca0-1465-5a73-075a1c151331@nvidia.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <3dcbcc7b-9ca0-1465-5a73-075a1c151331@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 23.09.22 04:26, John Hubbard wrote:
> On 9/20/22 05:23, David Hildenbrand wrote:
>> [1] https://lkml.kernel.org/r/CAHk-=wiEAH+ojSpAgx_Ep=NKPWHU8AdO3V56BXcCsU97oYJ1EA@mail.gmail.com
>> [2] https://lore.kernel.org/r/CAHk-=wg40EAZofO16Eviaj7mfqDhZ2gVEbvfsMf6gYzspRjYvw@mail.gmail.com
>> [2] https://lkml.kernel.org/r/CAHk-=wit-DmhMfQErY29JSPjFgebx_Ld+pnerc4J2Ag990WwAA@mail.gmail.com
> 
> s/2/3/

Thanks!

> 
> ...
>> diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
>> index 03eb53fd029a..e05899cbfd49 100644
>> --- a/Documentation/process/coding-style.rst
>> +++ b/Documentation/process/coding-style.rst
>> @@ -1186,6 +1186,67 @@ expression used.  For instance:
>>   	#endif /* CONFIG_SOMETHING */
>>   
>>   
>> +22) Do not crash the kernel
>> +---------------------------
>> +
>> +In general, it is not the kernel developer's decision to crash the kernel.
> 
> What do you think of this alternate wording:
> 
> In general, the decision to crash the kernel belongs to the user, rather
> than to the kernel developer.

Ack

[...]

> I like the wording, it feels familiar somehow! :)

:)

> 
> Reviewed-by: John Hubbard <jhubbard@nvidia.com>

Thanks!

-- 
Thanks,

David / dhildenb

