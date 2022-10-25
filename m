Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9CD2C04A95
	for <linux-doc@archiver.kernel.org>; Tue, 25 Oct 2022 10:08:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232208AbiJYKIo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 25 Oct 2022 06:08:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232151AbiJYKIB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Oct 2022 06:08:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D021D10327F
        for <linux-doc@vger.kernel.org>; Tue, 25 Oct 2022 03:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666692094;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=knqQPG7pPxcHsfRxnyxJXNLDn4XFV6zEBhTCEqjUpIc=;
        b=DjoIoNkniVxFFlkc+x7vcIm0UffHjQZJa5yXVOVL4kSdRjKLAdGZ1cFrISGiopGihN9fjS
        S7zfPimfJBnGKcChHTOuN2EM5MYSXzgRKv0y3mZE/qydLFXl3s7Fsgc/Cud9cvtNXT/nGe
        K4XG3TzHQCcEDKl/jxogdX+APrNCFPQ=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-333-_xA2a0vBOqeqZ1qPbZfW_g-1; Tue, 25 Oct 2022 06:01:33 -0400
X-MC-Unique: _xA2a0vBOqeqZ1qPbZfW_g-1
Received: by mail-qt1-f198.google.com with SMTP id a19-20020a05622a02d300b0039a3711179dso8642127qtx.12
        for <linux-doc@vger.kernel.org>; Tue, 25 Oct 2022 03:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=knqQPG7pPxcHsfRxnyxJXNLDn4XFV6zEBhTCEqjUpIc=;
        b=BKyEC32EPUcZusDQhQSbrPE68C4dAjnmFKMNSG6QGCyRs+sWDjnjf4GwM9+vFhBtMn
         1RT2hy521ZVHw5PtW2KTc1iCe1bNRzFuzckqLNFEswrz8faCm/gqtDgY/qqRsrpbEQOJ
         GUyM17M4XfJOq3IOFfk1vTxWd9n+ySXWYF6SwK5phxP+2iIarw1JI9jg5PJbHa3Kh60Z
         jeQNMGlACJUMd+KN/DhpwQtZsOv82Lz+LwyAD/csq1ShiCyalPk1mUCx0Wuqra2R/z3A
         ePR4qngVtnmER5ckNjOLQ/n32tk5iQ3bv9piRB8lqCjvOYiCAxLe82LHzgtJxqF1XeWG
         88Uw==
X-Gm-Message-State: ACrzQf2mrKO+v46ZabZFGXe+SirdAZJh699ocmKLWTwSML0OabxuAwiP
        zmxuY/I0fLCDw083+HsqGhXIUzL3FQDnMdua1YxHIoaYqAN5P8StbmpB5vTHEsSE/QBPwe+kZPJ
        XTOMkJqh4seW8PTBi8LrS
X-Received: by 2002:a0c:e28a:0:b0:4b9:e578:1581 with SMTP id r10-20020a0ce28a000000b004b9e5781581mr8746738qvl.102.1666692092759;
        Tue, 25 Oct 2022 03:01:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6lwkNGGlIieZxceU7YsexC1Uy1WKs+oksCMdHc86K1X1v/ucnRVCyAJYYWCoPnyhFV1xt3uA==
X-Received: by 2002:a0c:e28a:0:b0:4b9:e578:1581 with SMTP id r10-20020a0ce28a000000b004b9e5781581mr8746715qvl.102.1666692092521;
        Tue, 25 Oct 2022 03:01:32 -0700 (PDT)
Received: from [10.201.49.36] (nat-pool-mxp-u.redhat.com. [149.6.153.187])
        by smtp.googlemail.com with ESMTPSA id ay37-20020a05620a17a500b006eeb3165565sm1755740qkb.80.2022.10.25.03.01.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 03:01:32 -0700 (PDT)
Message-ID: <f6032e45-5d14-ae05-5383-f6ea1e8a4070@redhat.com>
Date:   Tue, 25 Oct 2022 12:01:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 3/4] KVM: introduce memory transaction semaphore
Content-Language: en-US
To:     Emanuele Giuseppe Esposito <eesposit@redhat.com>,
        kvm@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Hildenbrand <david@redhat.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221022154819.1823133-1-eesposit@redhat.com>
 <20221022154819.1823133-4-eesposit@redhat.com>
 <62500f94-b95b-1e16-4aa2-f67905fab01a@redhat.com>
 <fba8e829-0d28-8f4d-a8ce-84d533009eb9@redhat.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <fba8e829-0d28-8f4d-a8ce-84d533009eb9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/24/22 14:57, Emanuele Giuseppe Esposito wrote:
> 
> 
> Am 23/10/2022 um 19:50 schrieb Paolo Bonzini:
>> On 10/22/22 17:48, Emanuele Giuseppe Esposito wrote:
>>> +static DECLARE_RWSEM(memory_transaction);
>>
>> This cannot be global, it must be per-struct kvm.  Otherwise one VM can
>> keep the rwsem indefinitely while a second VM hangs in
>> KVM_KICK_ALL_RUNNING_VCPUS.
>>
>> It can also be changed to an SRCU (with the down_write+up_write sequence
>> changed to synchronize_srcu_expedited) which has similar characteristics
>> to your use of the rwsem.
>>
> 
> Makes sense, but why synchronize_srcu_expedited and not synchronize_srcu?

Because (thanks to the kick) you expect the grace period to end almost 
immediately, and synchronize_srcu() will slow down sensibly the changes 
to the memory map.

Paolo

