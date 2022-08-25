Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C762C04AA5
	for <linux-doc@archiver.kernel.org>; Thu, 25 Aug 2022 09:58:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238624AbiHYJ64 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Aug 2022 05:58:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238276AbiHYJ6z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Aug 2022 05:58:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE1CA3A4AC
        for <linux-doc@vger.kernel.org>; Thu, 25 Aug 2022 02:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661421532;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sXEuh/C7EhMT4N5IVCTMgJSlHVPtxpuWjvzgdztQOwA=;
        b=FyYafbFkTwL/yGrlVFUCKT4YjfwfnI7ZlkozTJ2e2AFuQQ9kdkSEIcovrum9Rq4hthtpiJ
        dDWKpP0h9SlzziymOCHgTfyAZHgQJzPquw55v/oaYuhXHa+0NP+WJErOOIWkI9eDQF/y5V
        +I4kDsOmkwpyKuPhNfX65drDz3NJnKo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-112-eY3g5R4cNdex78N9266hzQ-1; Thu, 25 Aug 2022 05:58:51 -0400
X-MC-Unique: eY3g5R4cNdex78N9266hzQ-1
Received: by mail-wr1-f72.google.com with SMTP id k20-20020adfb354000000b0022556a0b8cbso2020185wrd.5
        for <linux-doc@vger.kernel.org>; Thu, 25 Aug 2022 02:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=sXEuh/C7EhMT4N5IVCTMgJSlHVPtxpuWjvzgdztQOwA=;
        b=4eh3ke2RR6RlzbpSdEXoOAVL6iLvisX+HBR6SezdrPXK7M0tbNZ8Zb1p7jjFb1nn2e
         HB9DVVMvRgrKZgCwVGGR0OsPq2SZJVGO2vvDyOdg+KvkOL0aby1tTTDDnIcu1NeF6Egn
         Z/MNL+AHfrDhyWmbethVy/T/kgo5L1xGhdmH6XQe5vqcW936MzR2QVE2jH7SE5raeCRA
         sq7T6kkv/0Ir17Fy3RWb/xzdQHkD5pkpejV56JAf0jo0TbVHJKlhsiGXu82FNqXcuU3r
         n5Nl/LG3/6pHJ+hrKsPsxnpbiW77ilXQdv+dozsXO/cxKhRgHFro3n1w9lHGxmfRO/Zr
         ILGw==
X-Gm-Message-State: ACgBeo0ZQmXtpf5Sc+s4dSLIBqWpQAP0KW4dLAG6/IjWYCixlUB1tgYp
        C3B08pdwpA3VlMrsVxsB6r3iJBsAim+uu0rc+jRE1k8ZxRwsqwFwZg6zUsIv5siVSxnsKLz3Yar
        s8R6jKd9d2qUm1Wgjp51N
X-Received: by 2002:adf:fe09:0:b0:225:6c9a:1925 with SMTP id n9-20020adffe09000000b002256c9a1925mr1689601wrr.546.1661421530148;
        Thu, 25 Aug 2022 02:58:50 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4zjV5/uX5zJoDDQGvyv88ADNp860yGdsGm+iTCH+1DVQ3YBmb2/7qZdaBeUnu1fynPZfG7sQ==
X-Received: by 2002:adf:fe09:0:b0:225:6c9a:1925 with SMTP id n9-20020adffe09000000b002256c9a1925mr1689579wrr.546.1661421529892;
        Thu, 25 Aug 2022 02:58:49 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:20af:34be:985b:b6c8? ([2a09:80c0:192:0:20af:34be:985b:b6c8])
        by smtp.gmail.com with ESMTPSA id e20-20020a5d5954000000b0021e42e7c7dbsm19557923wri.83.2022.08.25.02.58.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 02:58:49 -0700 (PDT)
Message-ID: <b1103c81-0c56-0e9b-711c-246e431db151@redhat.com>
Date:   Thu, 25 Aug 2022 11:58:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To:     Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org
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
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH RFC 2/2] checkpatch: warn on usage of VM_BUG_ON() and
 friends
In-Reply-To: <3c250aa26020b2f336fd575a58d06ba26faf1f14.camel@perches.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 24.08.22 18:52, Joe Perches wrote:
> On Wed, 2022-08-24 at 18:31 +0200, David Hildenbrand wrote:
>> checkpatch does not point out that VM_BUG_ON() and friends should be
>> avoided, however, Linus notes:
>>
>>     VM_BUG_ON() has the exact same semantics as BUG_ON. It is literally
>>     no different, the only difference is "we can make the code smaller
>>     because these are less important". [1]
>>
>> So let's warn on VM_BUG_ON() and friends as well. While at it, make it
>> clearer that the kernel really shouldn't be crashed.
>>
>> Note that there are some other *_BUG_ON flavors, but they are not all
>> bad: for example, KVM_BUG_ON() only triggers a WARN_ON_ONCE and then
>> flags KVM as being buggy, so we'll not care about them for now here.
> []
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
>> @@ -4695,12 +4695,12 @@ sub process {
>>  			}
>>  		}
>>  
>> -# avoid BUG() or BUG_ON()
>> -		if ($line =~ /\b(?:BUG|BUG_ON)\b/) {
>> +# do not use BUG(), BUG_ON(), VM_BUG_ON() and friends.
>> +		if ($line =~ /\b(?:BUG|BUG_ON|VM_BUG_ON|VM_BUG_ON_[A-Z]+)\b/) {
> 
> Perhaps better as something like the below to pick up more variants
> 

Trying to find more possible variants and exceptions

$ git grep -h -o -E "\b[a-zA-Z]+_BUG(_ON(_[a-zA-Z]+)*)?\(" | sort | uniq
AA_BUG(
-> Ok, no BUG()
ASM_BUG(
-> Bad
BUILD_BUG(
BUILD_BUG_ON(
BUILD_BUG_ON_INVALID(
BUILD_BUG_ON_MSG(
BUILD_BUG_ON_ZERO(
-> Ok
CI_BUG_ON(
-> Bad with CONFIG_DRM_I915_DEBUG
DCCP_BUG(
DCCP_BUG_ON(
-> Ok, no BUG()
do_BUG(
-> BUG implementation, ok.
GEM_BUG_ON(
-> Bad with CONFIG_DRM_I915_DEBUG_GEM_ONCE
GLOCK_BUG_ON(
-> Bad
handle_BUG(
-> BUG implementation, ok.
IDA_BUG_ON(
KVM_BUG(
KVM_BUG_ON(
-> Ok, no BUG()
lkdtm_BUG(
paravirt_BUG(
-> bad
PROM_BUG(
-> unused, will remove
RWLOCK_BUG_ON(
-> Ok, no BUG()
snd_BUG(
snd_BUG_ON(
-> Ok, no BUG()
SNIC_BUG_ON(
-> Bad
SPIN_BUG_ON(
-> Ok, no BUG()
UNWINDER_BUG(
UNWINDER_BUG_ON(
VIRTUAL_BUG_ON(
VM_BUG_ON(
VM_BUG_ON_FOLIO(
VM_BUG_ON_MM(
VM_BUG_ON_PAGE(
VM_BUG_ON_PGFLAGS(
VM_BUG_ON_VMA(
XA_BUG_ON(
-> Bad

So an extended versions of your proposal like (ignoring do_BUG and handle_BUG, people are smart enough to figure that out)

if ($line =~ /\b(?!AA_|BUILD_|DCCP_|IDA_|KVM_|RWLOCK_|snd_|SPIN_)(?:[a-zA-Z_]*_)?BUG(?:_ON)?(?:_[A-Z_]+)?\s*\(/

?

-- 
Thanks,

David / dhildenb

