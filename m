Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A60C00140
	for <linux-doc@archiver.kernel.org>; Wed, 24 Aug 2022 19:00:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239835AbiHXTAa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 24 Aug 2022 15:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239348AbiHXTAU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Aug 2022 15:00:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50AA7658C
        for <linux-doc@vger.kernel.org>; Wed, 24 Aug 2022 12:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661367616;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FIiUmby88Yb55/rny3f+ooD+63bbUsdXMXTOH9q/LhQ=;
        b=Zh9x3VQKu+PcrbaZVglpHgKNzHfn7bKy9642fh9qZTIXxG0DwE6QJzSUaj6hr9p+5wJZxO
        4cu6OjZ8K8asNRzf6UKO9CzixC/QZ/rzpuy6eHQALjmjMUOgqCz+SQpzzo2wkVJrciIzkL
        oDJsD6LcrSf5Xk1Z97vxBMd3Kar4Lyk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-92-XBcEfPpePO-63Tkz4FbOGw-1; Wed, 24 Aug 2022 15:00:15 -0400
X-MC-Unique: XBcEfPpePO-63Tkz4FbOGw-1
Received: by mail-wm1-f72.google.com with SMTP id j3-20020a05600c1c0300b003a5e72421c2so1872402wms.1
        for <linux-doc@vger.kernel.org>; Wed, 24 Aug 2022 12:00:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=FIiUmby88Yb55/rny3f+ooD+63bbUsdXMXTOH9q/LhQ=;
        b=ZQk+UQHnAT7R7b9OqGsd2TxkWHZGyktFNn25vfGWBeEeLca40q4Cgkg0A0Zu3SCY10
         dX87/1QEtkKXZFlCWhhD80NpaoZUcAkSWvXbDn0n18PvvjON3z/zNvoMeOM2p6i4L3qh
         yjctpjVc9nDZMxsk3I1tlWmnJyzDtzy21RFQ3ClSRYYsmGBkt1ex8WxrZHGgmQ5uwATC
         3E5WR3pAWl39rBHbLqVA0rmx1GO957tx8ECMzpw5CXDpflZ8JOINnayzRFeAFCFS4iNy
         ixQLzl05Mp3rh7+mno3+LM1sRtXMh/FMSae0cJ7248lVqp9L39ZHOigcaSB+rQPiHrdx
         +YhA==
X-Gm-Message-State: ACgBeo1fQBn2r8i92d30MiNTXRFwkgHQsKZLDBnctrV1nZaEE3F097TM
        R1IBkTunun/lhKzapsN0U5yOUoRZF979Znjg6B2xAC8L2Gp3h+Jyu7Qtb3bXDFthhu7jdwG2Cc6
        NUWqtfkpAQg3wmnyGkrV+
X-Received: by 2002:a7b:c451:0:b0:3a6:829a:6102 with SMTP id l17-20020a7bc451000000b003a6829a6102mr5173702wmi.12.1661367614310;
        Wed, 24 Aug 2022 12:00:14 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5ZOVK4qpWVvOkODaq4ZLUaZhRYxNGGEB2PU/jsgu2M5tKioth0d58LkEi9N7bWMamVaYBo2w==
X-Received: by 2002:a7b:c451:0:b0:3a6:829a:6102 with SMTP id l17-20020a7bc451000000b003a6829a6102mr5173682wmi.12.1661367614025;
        Wed, 24 Aug 2022 12:00:14 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:c500:5445:cf40:2e32:6e73? (p200300cbc707c5005445cf402e326e73.dip0.t-ipconnect.de. [2003:cb:c707:c500:5445:cf40:2e32:6e73])
        by smtp.gmail.com with ESMTPSA id w5-20020a5d5445000000b0021e571a99d5sm17290174wrv.17.2022.08.24.12.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 12:00:13 -0700 (PDT)
Message-ID: <693dc564-349b-7174-b096-53d2107f27a8@redhat.com>
Date:   Wed, 24 Aug 2022 21:00:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH RFC 2/2] checkpatch: warn on usage of VM_BUG_ON() and
 friends
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
> 		if ($line =~ /\b(?!KVM_|BUILD_)(?:[A-Z_]*_)?BUG(?:_ON)?(?:_[A-Z_]+)?\s*\(/

... then I'll have to scan the other cases if they do something similar
as KVM. ... well, okay, I'll do it. :)

> 
>>  			my $msg_level = \&WARN;
>>  			$msg_level = \&CHK if ($file);
>>  			&{$msg_level}("AVOID_BUG",
>> -				      "Avoid crashing the kernel - try using WARN_ON & recovery code rather than BUG() or BUG_ON()\n" . $herecurr);
> 
> and maybe:
> 
> 				      "Do not crash the kernel unless it is unavoidable - use WARN_ON_ONCE & recovery code (if reasonable) rather than BUG() or variants\n" . $herecurr);
> 
> 

Yes, thanks!

-- 
Thanks,

David / dhildenb

