Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD838C04AA5
	for <linux-doc@archiver.kernel.org>; Thu, 25 Aug 2022 11:51:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240732AbiHYLvX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Aug 2022 07:51:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238224AbiHYLvW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Aug 2022 07:51:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D43025294
        for <linux-doc@vger.kernel.org>; Thu, 25 Aug 2022 04:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661428280;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FtM1BEUnONM80EGQIlSjFJxOzxx4asObkPOcf/dUoJ4=;
        b=Lyr54WD1q0IE6LrorPtddJy0VppvUkGqsnwW5MLVOF5qrswTQjoK2e2RKO7L80ceNr38Wd
        d6WAaWa7HdZihIUhJn2v+hxgUNuroHOOODk/OhOsmrVJ7Mdews4NXURnzKIOr2LRmkT00M
        +J1wNXNa5AJKmDTiCil0A8s2i3BbFbo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-633-ltyyiPEqNhSqheFWJ0VVsQ-1; Thu, 25 Aug 2022 07:51:19 -0400
X-MC-Unique: ltyyiPEqNhSqheFWJ0VVsQ-1
Received: by mail-wm1-f71.google.com with SMTP id v64-20020a1cac43000000b003a4bea31b4dso2368304wme.3
        for <linux-doc@vger.kernel.org>; Thu, 25 Aug 2022 04:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=FtM1BEUnONM80EGQIlSjFJxOzxx4asObkPOcf/dUoJ4=;
        b=x8Q3cwJHgYCOYH60YEYO7paK8uktTtfX/a8mEuqHoVfLQA8rto7Dn663WpN6NR3G/+
         vImwM9OnMCXeAPIx9YBasgIt8fuG0IcpZXxnTWaxqB2blMWzeDGKte/73vsg1sfWZ/iL
         IgT9QmwN0JR8Ub86J0uD7CeRRFodyXplwr4YPfeX360qxB4IPt8iS0UTj0IMFazj9zlO
         aefA5ccimalLZpEQFi730/3Mk1GYJxGwMHUYLItLkvBBBVcZ0/MTadbO57xgOT5YPRBO
         oNANIFiiaZiVtmVtuhD7vHBacoTc2q+/e6aN9Pg+y/5yGIzX4piUNheQQeAf9GwEMn11
         qgTA==
X-Gm-Message-State: ACgBeo0qKfDqSGs02V59SzDr4VVSXRCx2Sgg/MrtR//r4lJv0RmVhsJ2
        86hrF90A70qmrwu26CnvLADZ3Kd6WAQcL/ykqFdfya9lfGkUCQRYoGd+rvr5g7ftj5ojzCAS4im
        nACrz/tXBU8hahMk12dOu
X-Received: by 2002:a5d:5711:0:b0:225:2884:cc88 with SMTP id a17-20020a5d5711000000b002252884cc88mr2042076wrv.141.1661428278224;
        Thu, 25 Aug 2022 04:51:18 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5ItDcDX1kgqfGm06T3zwrfPTH11v1D3bxOfe8g8QfbYHQI/EKxqMNESF+ugudGdiYuS0nzTQ==
X-Received: by 2002:a5d:5711:0:b0:225:2884:cc88 with SMTP id a17-20020a5d5711000000b002252884cc88mr2042062wrv.141.1661428277919;
        Thu, 25 Aug 2022 04:51:17 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:20af:34be:985b:b6c8? ([2a09:80c0:192:0:20af:34be:985b:b6c8])
        by smtp.gmail.com with ESMTPSA id w6-20020a5d4b46000000b002205a5de337sm19282158wrs.102.2022.08.25.04.51.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 04:51:17 -0700 (PDT)
Message-ID: <7d146520-52e2-bd8d-3c53-a444e93e4006@redhat.com>
Date:   Thu, 25 Aug 2022 13:51:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH RFC 2/2] checkpatch: warn on usage of VM_BUG_ON() and
 friends
Content-Language: en-US
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org,
        kexec@lists.infradead.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        David Laight <David.Laight@ACULAB.COM>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Whitcroft <apw@canonical.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
        Dave Young <dyoung@redhat.com>
References: <20220824163100.224449-1-david@redhat.com>
 <20220824163100.224449-3-david@redhat.com>
 <3c250aa26020b2f336fd575a58d06ba26faf1f14.camel@perches.com>
 <b1103c81-0c56-0e9b-711c-246e431db151@redhat.com> <87y1vch7ll.fsf@intel.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <87y1vch7ll.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 25.08.22 13:43, Jani Nikula wrote:
> On Thu, 25 Aug 2022, David Hildenbrand <david@redhat.com> wrote:
>> On 24.08.22 18:52, Joe Perches wrote:
>>> On Wed, 2022-08-24 at 18:31 +0200, David Hildenbrand wrote:
>>>> checkpatch does not point out that VM_BUG_ON() and friends should be
>>>> avoided, however, Linus notes:
>>>>
>>>>     VM_BUG_ON() has the exact same semantics as BUG_ON. It is literally
>>>>     no different, the only difference is "we can make the code smaller
>>>>     because these are less important". [1]
>>>>
>>>> So let's warn on VM_BUG_ON() and friends as well. While at it, make it
>>>> clearer that the kernel really shouldn't be crashed.
>>>>
>>>> Note that there are some other *_BUG_ON flavors, but they are not all
>>>> bad: for example, KVM_BUG_ON() only triggers a WARN_ON_ONCE and then
>>>> flags KVM as being buggy, so we'll not care about them for now here.
>>> []
>>>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>>> []
>>>> @@ -4695,12 +4695,12 @@ sub process {
>>>>  			}
>>>>  		}
>>>>  
>>>> -# avoid BUG() or BUG_ON()
>>>> -		if ($line =~ /\b(?:BUG|BUG_ON)\b/) {
>>>> +# do not use BUG(), BUG_ON(), VM_BUG_ON() and friends.
>>>> +		if ($line =~ /\b(?:BUG|BUG_ON|VM_BUG_ON|VM_BUG_ON_[A-Z]+)\b/) {
>>>
>>> Perhaps better as something like the below to pick up more variants
>>>
>>
>> Trying to find more possible variants and exceptions
> 
>> CI_BUG_ON(
>> -> Bad with CONFIG_DRM_I915_DEBUG
>> GEM_BUG_ON(
>> -> Bad with CONFIG_DRM_I915_DEBUG_GEM_ONCE
> 
> These are hidden behind debug knobs that we use in our CI to
> specifically catch "should not happen" cases fast and loud. Should not
> be a problem for regular users.
> 

I tend to agree but I don't think this is worth an exception.
VM_BUG_ON also requires CONFIG_DEBUG_VM and absolutely shouldn't
be used as I learned.

Quoting Linus:

   Really. BUG_ON() IS NOT FOR DEBUGGING. [1]

   This kind of "I don't think this can happen" is _never_ an excuse for it. [2]


For CI work, it might be sufficient to use WARN_ON_ONCE() combined with panic_on_warn.

[1] https://lore.kernel.org/all/CAHk-=wiEAH+ojSpAgx_Ep=NKPWHU8AdO3V56BXcCsU97oYJ1EA@mail.gmail.com/
[2] https://lore.kernel.org/all/CAHk-=wg40EAZofO16Eviaj7mfqDhZ2gVEbvfsMf6gYzspRjYvw@mail.gmail.com/ 

-- 
Thanks,

David / dhildenb

