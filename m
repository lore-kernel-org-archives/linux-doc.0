Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A1E6ECDFA1
	for <linux-doc@archiver.kernel.org>; Mon, 24 Oct 2022 08:33:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbiJXIdj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 24 Oct 2022 04:33:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbiJXIdg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Oct 2022 04:33:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ECFF62930
        for <linux-doc@vger.kernel.org>; Mon, 24 Oct 2022 01:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666600407;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AztsCWn4r1NILXtf08X14NzvAXIznK04t2hI2Bcl7sY=;
        b=Jee7cwIPwVXPqwY0+BtcsmgHdq6wrtH3xIekC4tEI2UJp0Uag1MYyCezTQbhB8FqCxhJIc
        uNj01Lc/Bgc3qVKdl0c7b1KfxSgp8J/PEJyQeuoz9d47u25jfAc6v0CYcrQJZFFMIc6DSo
        OT0C7zxoJ72MnEbjOfTS4agkCWIsjNU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-522-xvIYiQ9zPkCdaby0wKBJ1Q-1; Mon, 24 Oct 2022 04:33:24 -0400
X-MC-Unique: xvIYiQ9zPkCdaby0wKBJ1Q-1
Received: by mail-qv1-f70.google.com with SMTP id q16-20020a0ce210000000b004ba8976d3aaso4564068qvl.5
        for <linux-doc@vger.kernel.org>; Mon, 24 Oct 2022 01:33:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AztsCWn4r1NILXtf08X14NzvAXIznK04t2hI2Bcl7sY=;
        b=hP3d2YeqxkVFuP3SLJi+3Pem872ayn401si9EpF6v/iRQ7539mn96MrapIHi5AWtem
         VpDE/aIFjb30LD2hVbaRsjpZNiHCvgTkJIuPnXRuPUsLlVTmv6kmH7oAdy66e44xTRfj
         RGRDwgBJEMhm1Jk9nCv5ZzzC807r3O4xQk7bt1LUGIco/1n2JtdwuG9BUputubkiLsrk
         0zV9FE/uljnJGlqXRxsUtp56WR1WYEdHYr2vXE1HFRPW5PXEbpH5b39DPvukMyJbUiU1
         2FtTcJEGIJidceJt75E201OL0EMRBPTpFgTB2AY691tb9L3dOzDNkTBl/AArB0xSoodk
         aldw==
X-Gm-Message-State: ACrzQf3e7jcPkcx36lHIiyP8bGbEpFyb5P6h3dis7YHnl9UlS6nU4Frl
        XtaB2m+7TtsQllMiTvnvmfdrmzmvqzoUe9SfcEjpnzh1HMhtpRpLhenbQLLhLm723JMJ/o9lq6m
        zz4Pc97Ix5rRKMi0x/sID
X-Received: by 2002:ac8:7d92:0:b0:39c:f4b6:f014 with SMTP id c18-20020ac87d92000000b0039cf4b6f014mr25667991qtd.513.1666600403842;
        Mon, 24 Oct 2022 01:33:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7YuSEiIz/2zlfJySdDr/Uv6YW5Od8GIBMEhw8v9FPEi+DDYWIDJDJn05RSRu9IVzjv9FqB5A==
X-Received: by 2002:ac8:7d92:0:b0:39c:f4b6:f014 with SMTP id c18-20020ac87d92000000b0039cf4b6f014mr25667975qtd.513.1666600403599;
        Mon, 24 Oct 2022 01:33:23 -0700 (PDT)
Received: from [192.168.149.123] (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
        by smtp.gmail.com with ESMTPSA id bl29-20020a05620a1a9d00b006f0fc145ae5sm5743365qkb.15.2022.10.24.01.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 01:33:22 -0700 (PDT)
Message-ID: <2701ce67-bfff-8c0c-4450-7c4a281419de@redhat.com>
Date:   Mon, 24 Oct 2022 10:33:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 0/4] KVM: API to block and resume all running vcpus in a
 vm
Content-Language: en-US
To:     Christian Borntraeger <borntraeger@linux.ibm.com>,
        kvm@vger.kernel.org
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Hildenbrand <david@redhat.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221022154819.1823133-1-eesposit@redhat.com>
 <a2e16531-5522-a334-40a1-2b0e17663800@linux.ibm.com>
From:   Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <a2e16531-5522-a334-40a1-2b0e17663800@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



Am 24/10/2022 um 09:56 schrieb Christian Borntraeger:
> Am 22.10.22 um 17:48 schrieb Emanuele Giuseppe Esposito:
>> This new API allows the userspace to stop all running
>> vcpus using KVM_KICK_ALL_RUNNING_VCPUS ioctl, and resume them with
>> KVM_RESUME_ALL_KICKED_VCPUS.
>> A "running" vcpu is a vcpu that is executing the KVM_RUN ioctl.
>>
>> This serie is especially helpful to userspace hypervisors like
>> QEMU when they need to perform operations on memslots without the
>> risk of having a vcpu reading them in the meanwhile.
>> With "memslots operations" we mean grow, shrink, merge and split
>> memslots, which are not "atomic" because there is a time window
>> between the DELETE memslot operation and the CREATE one.
>> Currently, each memslot operation is performed with one or more
>> ioctls.
>> For example, merging two memslots into one would imply:
>> DELETE(m1)
>> DELETE(m2)
>> CREATE(m1+m2)
>>
>> And a vcpu could attempt to read m2 right after it is deleted, but
>> before the new one is created.
>>
>> Therefore the simplest solution is to pause all vcpus in the kvm
>> side, so that:
>> - userspace just needs to call the new API before making memslots
>> changes, keeping modifications to the minimum
>> - dirty page updates are also performed when vcpus are blocked, so
>> there is no time window between the dirty page ioctl and memslots
>> modifications, since vcpus are all stopped.
>> - no need to modify the existing memslots API
> Isnt QEMU able to achieve the same goal today by forcing all vCPUs
> into userspace with a signal? Can you provide some rationale why this
> is better in the cover letter or patch description?
> 
David Hildenbrand tried to propose something similar here:
https://github.com/davidhildenbrand/qemu/commit/86b1bf546a8d00908e33f7362b0b61e2be8dbb7a

While it is not optimized, I think it's more complex that the current
serie, since qemu should also make sure all running ioctls finish and
prevent the new ones from getting executed.

Also we can't use pause_all_vcpus()/resume_all_vcpus() because they drop
the BQL.

Would that be ok as rationale?

Thank you,
Emanuele

