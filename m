Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C761AC54EE9
	for <linux-doc@archiver.kernel.org>; Thu, 22 Sep 2022 14:12:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231879AbiIVOMk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Sep 2022 10:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231199AbiIVOMV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Sep 2022 10:12:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D46CCF3F82
        for <linux-doc@vger.kernel.org>; Thu, 22 Sep 2022 07:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663855931;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Y/iFP6H1ozi01zUaORnvK3MXE2O4OXdY0B940ZuFJpQ=;
        b=B1a77JK4A4gJ3tJg+SQAR9BySYfR3ApM7ERQQyprCWsTeXmL7uVkaGJanhLEs/mKPF38J+
        Kp+FvJxyFOFOmaNit7FmyAIK6/oVu+dNKHMY39KPweV6r+oGg5HVY3eT3rW8v7U/StDV7q
        IdzNtemgXmBjpEUtDRUw58ygu1xz0k0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-640-wOpIsMA3NR-FqjfgWQxf6Q-1; Thu, 22 Sep 2022 10:12:09 -0400
X-MC-Unique: wOpIsMA3NR-FqjfgWQxf6Q-1
Received: by mail-wm1-f71.google.com with SMTP id r7-20020a1c4407000000b003b3309435a9so747665wma.6
        for <linux-doc@vger.kernel.org>; Thu, 22 Sep 2022 07:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=Y/iFP6H1ozi01zUaORnvK3MXE2O4OXdY0B940ZuFJpQ=;
        b=dCIuDaX4d6h3k5iF3sx7Gr4Qu3iwesrQZpWEb7mlFUKKOJzq7BbRxOaCl3N3ipljnE
         SgBK5wpQ3/S19Jv28jFAfAelhrmfsh37Bz1of0bs575oQA3fX5wjY1ePa+KxK8sMqqFJ
         qmSAJyLr16rujt/rdBPN87lZsDDk98l41CjXtjFGzPXHxn20EHEbonHv1ceJf8UiUscz
         TuuQOdDfO+KBfzwiw9ezNLJKUxF8cHt3oayhADq3hJYqOis4SvBylwPCsrKEevjNomF/
         5NwNGjOQXr91HbrfBgdGfIrtBFN7rbhEr1nK/ZFPzduSXf+ZnH5nSW5ZpIsBqkSylsac
         nrNA==
X-Gm-Message-State: ACrzQf39gof+kx0KEecuu7sl1JlPwRl5JiR6+Ki/qlW/1ME+KNPEWfuj
        0UlZU8OSgPURCeVAqHYBRxY4egZikA0m/gsZ0p7jvZim/Tk5+NwsGQSU7VU61WkZaWHDO+Ddlmh
        Fzs2VfEmihku6OAckfaL4
X-Received: by 2002:a5d:59c4:0:b0:22b:237c:3e23 with SMTP id v4-20020a5d59c4000000b0022b237c3e23mr2314025wry.291.1663855928452;
        Thu, 22 Sep 2022 07:12:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6qIYRASR2IfsvAvIir7beVokLpyQg1uzYzGbKfWQNOhgzM7pV5+gao6b9nQQt3+MNJlTYtjA==
X-Received: by 2002:a5d:59c4:0:b0:22b:237c:3e23 with SMTP id v4-20020a5d59c4000000b0022b237c3e23mr2314002wry.291.1663855928114;
        Thu, 22 Sep 2022 07:12:08 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:2200:d595:cc20:2e3a:fc5f? (p200300cbc7082200d595cc202e3afc5f.dip0.t-ipconnect.de. [2003:cb:c708:2200:d595:cc20:2e3a:fc5f])
        by smtp.gmail.com with ESMTPSA id bt25-20020a056000081900b00228d52b935asm5332956wrb.71.2022.09.22.07.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 07:12:07 -0700 (PDT)
Message-ID: <d1ceedca-b28e-c47e-aa0d-aa1cb36d12b9@redhat.com>
Date:   Thu, 22 Sep 2022 16:12:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
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
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <87pmfp8hnj.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 21.09.22 06:40, Kalle Valo wrote:
> David Hildenbrand <david@redhat.com> writes:
> 
>> Linus notes [1] that the introduction of new code that uses VM_BUG_ON()
>> is just as bad as BUG_ON(), because it will crash the kernel on
>> distributions that enable CONFIG_DEBUG_VM (like Fedora):
>>
>>      VM_BUG_ON() has the exact same semantics as BUG_ON. It is literally
>>      no different, the only difference is "we can make the code smaller
>>      because these are less important". [2]
>>
>> This resulted in a more generic discussion about usage of BUG() and
>> friends. While there might be corner cases that still deserve a BUG_ON(),
>> most BUG_ON() cases should simply use WARN_ON_ONCE() and implement a
>> recovery path if reasonable:
>>
>>      The only possible case where BUG_ON can validly be used is "I have
>>      some fundamental data corruption and cannot possibly return an
>>      error". [2]
>>
>> As a very good approximation is the general rule:
>>
>>      "absolutely no new BUG_ON() calls _ever_" [2]
>>
>> ... not even if something really shouldn't ever happen and is merely for
>> documenting that an invariant always has to hold. However, there are sill
>> exceptions where BUG_ON() may be used:
>>
>>      If you have a "this is major internal corruption, there's no way we can
>>      continue", then BUG_ON() is appropriate. [3]
>>
>> There is only one good BUG_ON():
>>
>>      Now, that said, there is one very valid sub-form of BUG_ON():
>>      BUILD_BUG_ON() is absolutely 100% fine. [2]
>>
>> While WARN will also crash the machine with panic_on_warn set, that's
>> exactly to be expected:
>>
>>      So we have two very different cases: the "virtual machine with good
>>      logging where a dead machine is fine" - use 'panic_on_warn'. And
>>      the actual real hardware with real drivers, running real loads by
>>      users. [4]
>>
>> The basic idea is that warnings will similarly get reported by users
>> and be found during testing. However, in contrast to a BUG(), there is a
>> way to actually influence the expected behavior (e.g., panic_on_warn)
>> and to eventually keep the machine alive to extract some debug info.
>>
>> Ingo notes that not all WARN_ON_ONCE cases need recovery. If we don't ever
>> expect this code to trigger in any case, recovery code is not really
>> helpful.
>>
>>      I'd prefer to keep all these warnings 'simple' - i.e. no attempted
>>      recovery & control flow, unless we ever expect these to trigger.
>>      [5]
>>
>> There have been different rules floating around that were never properly
>> documented. Let's try to clarify.
>>
>> [1] https://lkml.kernel.org/r/CAHk-=wiEAH+ojSpAgx_Ep=NKPWHU8AdO3V56BXcCsU97oYJ1EA@mail.gmail.com
>> [2] https://lore.kernel.org/r/CAHk-=wg40EAZofO16Eviaj7mfqDhZ2gVEbvfsMf6gYzspRjYvw@mail.gmail.com
>> [2] https://lkml.kernel.org/r/CAHk-=wit-DmhMfQErY29JSPjFgebx_Ld+pnerc4J2Ag990WwAA@mail.gmail.com
>> [4] https://lore.kernel.org/r/CAHk-=wgF7K2gSSpy=m_=K3Nov4zaceUX9puQf1TjkTJLA2XC_g@mail.gmail.com
>> [5] https://lore.kernel.org/r/YwIW+mVeZoTOxn%2F4@gmail.com
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> [...]
> 
>> +Use WARN_ON_ONCE() rather than WARN() or WARN_ON()
>> +**************************************************
>> +
>> +WARN_ON_ONCE() is generally preferred over WARN() or WARN_ON(), because it
>> +is common for a given warning condition, if it occurs at all, to occur
>> +multiple times. This can fill up and wrap the kernel log, and can even slow
>> +the system enough that the excessive logging turns into its own, additional
>> +problem.
> 
> FWIW I have had cases where WARN() messages caused a reboot, maybe
> mention that here? In my case the logging was so excessive that the
> watchdog wasn't updated and in the end the device was forcefully
> rebooted.
> 

That should be covered by the last part, no? What would be your suggestion?

-- 
Thanks,

David / dhildenb

