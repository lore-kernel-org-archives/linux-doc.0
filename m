Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF64ECAAD4
	for <linux-doc@archiver.kernel.org>; Mon, 29 Aug 2022 08:44:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbiH2Io2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 Aug 2022 04:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbiH2Io1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Aug 2022 04:44:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D14C4E86D
        for <linux-doc@vger.kernel.org>; Mon, 29 Aug 2022 01:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661762665;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vPEg5v/H0IBgzngITeel1OJt2CG88lxD/qPQRp0fsMA=;
        b=O6PCDsxefRksLG1eZnl+3j9pUcn54ufw9HKjamyfbCpdf62ed54tKaYXWYO88HFfuay+Nb
        GdlQ4a1o1wjIQTwhudnmn6Y+MNfarpWNUBawCwJn7cm0cT/Dd30T92ZFashZ/D6YES2N46
        Eba7iYeRe/LykqgdBqVPG+pmcBbC45U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-403-O0RQ1xs_MpaODrX9dj37oA-1; Mon, 29 Aug 2022 04:44:24 -0400
X-MC-Unique: O0RQ1xs_MpaODrX9dj37oA-1
Received: by mail-wr1-f72.google.com with SMTP id j9-20020a5d4649000000b00226d830857cso361578wrs.12
        for <linux-doc@vger.kernel.org>; Mon, 29 Aug 2022 01:44:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=vPEg5v/H0IBgzngITeel1OJt2CG88lxD/qPQRp0fsMA=;
        b=F6XOoPEqpF3K2MNJTKC6/jXPJHwq8y6Q4aJkmkoPpFrXXVY5iM0q9XCHAGbAkNDul8
         9lK4NCBXzgTTu1GvNHOI6xNR3sdkzB5o9t0d9t/WEuChi39tjWlCjl9mqU1JDgin7wAv
         jey4qA89jBdYP+Vg0wWitahoDAoC1SbMIvuM+WJUbC18aQZHwePBTrzrmmvNI0c8w8av
         hIu7wRBOHaw7ba1Eb9dVXtjNGamOdw7ApMioPQ0vh12vS1cojyBnDJ6J6QyYJdPXN4TU
         jyw8KeGeyCN855qk5r63SA++afGkcZPnEsMKJgQYvea2xSIIDRliSggH7QmrTXBgeaj1
         pjuw==
X-Gm-Message-State: ACgBeo3KvMGXRRdZaFry9WJ1hI65EqRu1k5ixZoey9R5QmurmvOGheBe
        5zKyjRgvse8yKFktf68M9ZLLyesEBZp0tk8ZHctWb1BZzk4RI0Mg2g4ftBeKEIBlKn5o7dv8Nq8
        N9IVU8MCFx7oTtqUVD2l8
X-Received: by 2002:a05:600c:3c96:b0:3a6:58b2:a98 with SMTP id bg22-20020a05600c3c9600b003a658b20a98mr6350294wmb.43.1661762662977;
        Mon, 29 Aug 2022 01:44:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6c1LM+DxjJvvwYlIG2gEu159GGRwHgGF9FOKgQMdRa/igmdp6O6MHWsDvlzNRJvTHJLqlTwg==
X-Received: by 2002:a05:600c:3c96:b0:3a6:58b2:a98 with SMTP id bg22-20020a05600c3c9600b003a658b20a98mr6350269wmb.43.1661762662680;
        Mon, 29 Aug 2022 01:44:22 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:3900:658b:bed0:4260:4c25? (p200300cbc7073900658bbed042604c25.dip0.t-ipconnect.de. [2003:cb:c707:3900:658b:bed0:4260:4c25])
        by smtp.gmail.com with ESMTPSA id j9-20020a05600c190900b003a2e92edeccsm9148897wmq.46.2022.08.29.01.44.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 01:44:22 -0700 (PDT)
Message-ID: <acd6cd81-d2fd-70bb-0cc4-9a63b71c51eb@redhat.com>
Date:   Mon, 29 Aug 2022 10:44:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Dave Young <dyoung@redhat.com>
Cc:     John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        kexec@lists.infradead.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        David Laight <David.Laight@aculab.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
        Stephen Johnston <sjohnsto@redhat.com>,
        Prarit Bhargava <prarit@redhat.com>
References: <20220824163100.224449-1-david@redhat.com>
 <20220824163100.224449-2-david@redhat.com>
 <0db131cf-013e-6f0e-c90b-5c1e840d869c@nvidia.com>
 <ea380cf0-acda-aaba-fb63-2834da91b66b@redhat.com>
 <CALu+AoThhou7z+JCyv44AxGWDLDt2b7h0W6wcKRsJyLvSR1iQA@mail.gmail.com>
 <fe7aee66-d9f7-e472-a13f-e4c5aa176cca@redhat.com>
 <CALu+AoRwVfr=9KabOLUQigWwCtP5RLQ1YaKbG75ZVM9E-bW2ZQ@mail.gmail.com>
 <CAHk-=wit-DmhMfQErY29JSPjFgebx_Ld+pnerc4J2Ag990WwAA@mail.gmail.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH RFC 1/2] coding-style.rst: document BUG() and WARN() rules
 ("do not crash the kernel")
In-Reply-To: <CAHk-=wit-DmhMfQErY29JSPjFgebx_Ld+pnerc4J2Ag990WwAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 29.08.22 05:07, Linus Torvalds wrote:
> On Sun, Aug 28, 2022 at 6:56 PM Dave Young <dyoung@redhat.com> wrote:
>>
>>> John mentioned PANIC_ON().
>>
>> I would vote for PANIC_ON(), it sounds like a good idea, because
>> BUG_ON() is not obvious and, PANIC_ON() can alert the code author that
>> this will cause a kernel panic and one will be more careful before
>> using it.
> 
> People, NO.
> 
> We're trying to get rid of BUG_ON() because it kills the machine.
> 
> Not replace it with another bogus thing that kills a machine.
> 
> So no PANIC_ON(). We used to have "panic()" many many years ago, we
> got rid of it. We're not re-introducing it.
> 
> People who want to panic on warnings can do so. WARN_ON() _becomes_
> PANIC for those people. But those people are the "we have a million
> machines, we want to just fail things on any sign of trouble, and we
> have MIS people who can look at the logs".
> 
> And it's not like we need to get rid of _all_ BUG_ON() cases. If you
> have a "this is major internal corruption, there's no way we can
> continue", then BUG_ON() is appropriate. It will try to kill that
> process and try to keep the machine running, and again, the kind of
> people who don't care about one machine (because - again - they have
> millions of them) can just turn that into a panic-and-reboot
> situation.
> 
> But the kind of people for whom the machine they are on IS THEIR ONLY
> MACHINE - whether it be a workstation, a laptop, or a cellphone -
> there is absolutely zero situation where "let's just kill the machine"
> is *EVER* approproate. Even a BUG_ON() will try to continue as well as
> it can after killing the current thread, but it's going to be iffy,
> because locking etc.
> 
> So WARN_ON_ONCE() is the thing to aim for. BUG_ON() is the thing for
> "oops, I really don't know what to do, and I physically *cannot*
> continue" (and that is *not* "I'm too lazy to do error handling").
> 
> There is no room for PANIC. None. Ever.

Let me clearer what I had in mind, avoiding the PANIC_ON terminology
John raised. I was wondering if it would make sense to

1) Be able to specify a severity for WARN (developer decision)

2) Be able to specify a severity for panic_on_warn (admin decision)

Distributions with kdump could keep a mode whereby severe warnings
(e.g., former BUG_ON) would properly kdump+reboot and harmless warnings
(e.g., clean recovery path) would WARN once + continue.

I agree that whether to panic should in most cases be a decision of the
admin, not the developer.


Now, that's a different discussion then the documentation update at
hand, and I primary wanted to raise awareness for the kdump people, and
ask them if a stronger move towards WARN_ON_ONCE will affect
them/customer expectations.

I'll work with John to document the current rules to reflect everything
you said here.

-- 
Thanks,

David / dhildenb

