Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 835F0C04A95
	for <linux-doc@archiver.kernel.org>; Tue, 25 Oct 2022 09:33:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231310AbiJYJdm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 25 Oct 2022 05:33:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230259AbiJYJdl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Oct 2022 05:33:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6346FFB731
        for <linux-doc@vger.kernel.org>; Tue, 25 Oct 2022 02:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666690419;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Q1WPlJ0jB2RHuRDPtZ/Z3/cKViag2RWLtNP5Qb2h3/k=;
        b=SDoNYSyHNRaILz7u+fUqoC0D5ahnMaso/2vMSlYGmB04HSHQApmeZ4iwUt3NqaCleSp5aM
        at3AxZ9WvZXH3GCQpju/legYWArzK6cULRGJKjMDZPvxOI2tvuZLGJrYLAAT+BmyjcUnEd
        JfG+rfSt9slw+IJ9msPFuSBSRR5xDHQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-401-ri9usWB_OeGP79oNKXCt1Q-1; Tue, 25 Oct 2022 05:33:33 -0400
X-MC-Unique: ri9usWB_OeGP79oNKXCt1Q-1
Received: by mail-qt1-f199.google.com with SMTP id ff6-20020a05622a4d8600b0039cbf66e8b5so8628748qtb.19
        for <linux-doc@vger.kernel.org>; Tue, 25 Oct 2022 02:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1WPlJ0jB2RHuRDPtZ/Z3/cKViag2RWLtNP5Qb2h3/k=;
        b=tfu6BSVOVlznM7Fk1OXl+2gAKXMJEznXY5g4Efen+J0DSrnjkpdN48NeK8J//1IHGE
         0MHgDpG19vG61W/JLreaICnpME/n6tKoz7iw+pEOee/V2LQCUd3LyNv7fTDFns55XHfq
         7IU+aLIbW4qXEeyEZmDGYUOEKqL7kXjnWZIcshXwvbQ45Oeaiw+6h7gzkZ4JW7zRnVev
         JaU4AyKL9B2tzjKuRrK+JYDz0Q2uA9kLC3lFGniayZJJsA4+VCyHq1JS0ZlEcZ4qDk9/
         XdlvGPCn5FG3DyCngnDbxPHK2klBZqClfUneukzoYDW2zZr/avZCYhyeoPitasRpHPB8
         4y3g==
X-Gm-Message-State: ACrzQf1tKO6uzyyfe3U3CrNlG1rYV0MycozfeJzBMIL49NpO4gUCqtOP
        2ba91V7DS4OBJIEIDmzRVu9IsgBWedalrKYUB+724pVomXI8iarqNRzXdD0mi6iTjxV8mCHIaxw
        V6KKjg/6uaPC8OO7P5o2y
X-Received: by 2002:ac8:4e93:0:b0:39c:ca5b:33a4 with SMTP id 19-20020ac84e93000000b0039cca5b33a4mr31599316qtp.264.1666690413501;
        Tue, 25 Oct 2022 02:33:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7gqjfyuvNv4J5Yu+zlx9KNNT6Kf9uYb+eAIbb2NIjG+P6Rwt0nqWgSOq30UrdOrbBzyok4tg==
X-Received: by 2002:ac8:4e93:0:b0:39c:ca5b:33a4 with SMTP id 19-20020ac84e93000000b0039cca5b33a4mr31599301qtp.264.1666690413149;
        Tue, 25 Oct 2022 02:33:33 -0700 (PDT)
Received: from [10.201.49.36] (nat-pool-mxp-u.redhat.com. [149.6.153.187])
        by smtp.googlemail.com with ESMTPSA id h3-20020ac87763000000b0039ad65104fasm1333057qtu.12.2022.10.25.02.33.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 02:33:32 -0700 (PDT)
Message-ID: <5a26c107-9ab5-60ee-0e9c-a9955dfe313d@redhat.com>
Date:   Tue, 25 Oct 2022 11:33:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 0/4] KVM: API to block and resume all running vcpus in a
 vm
Content-Language: en-US
To:     Sean Christopherson <seanjc@google.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>
Cc:     Emanuele Giuseppe Esposito <eesposit@redhat.com>,
        kvm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Hildenbrand <david@redhat.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221022154819.1823133-1-eesposit@redhat.com>
 <a2e16531-5522-a334-40a1-2b0e17663800@linux.ibm.com>
 <2701ce67-bfff-8c0c-4450-7c4a281419de@redhat.com>
 <384b2622-8d7f-ce02-1452-84a86e3a5697@linux.ibm.com>
 <Y1cVfECAAfmp5XqA@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Y1cVfECAAfmp5XqA@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/25/22 00:45, Sean Christopherson wrote:
>> Yes that helps and should be part of the cover letter for the next iterations.
> But that doesn't explain why KVM needs to get involved, it only explains why QEMU
> can't use its existing pause_all_vcpus().  I do not understand why this is a
> problem QEMU needs KVM's help to solve.

I agree that it's not KVM's problem that QEMU cannot use 
pause_all_vcpus().  Having a ioctl in KVM, rather than coding the same 
in QEMU, is *mostly* a matter of programmer and computer efficiency 
because the code is pretty simple.

That said, I believe the limited memslot API makes it more than just a 
QEMU problem.  Because KVM_GET_DIRTY_LOG cannot be combined atomically 
with KVM_SET_USER_MEMORY_REGION(MR_DELETE), any VMM that uses dirty-log 
regions while the VM is running is liable to losing the dirty status of 
some pages.  That's also a reason to provide this API in KVM.

Paolo

