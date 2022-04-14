Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E093C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 14 Apr 2022 10:04:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240040AbiDNKGx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 14 Apr 2022 06:06:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241084AbiDNKGw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Apr 2022 06:06:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 900322253C
        for <linux-doc@vger.kernel.org>; Thu, 14 Apr 2022 03:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649930667;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yuBcaeBniy5n5/L8X5921bwDC++5b8Xw6Z88KRpE9bQ=;
        b=Emo/ajYVZelhDAfc9x8P6kPCj6nDiU5zlNTubOxUdi9nQaXkVUGFgd4Mq+pQj0MkBk//8r
        Hl/Gj+MppC+NnldJRuQkEQw9s8TdRVW45Xq3h5+bGYHJpy4U+SmEyvK+7N/md5RzmmECDi
        qf+6xGUWkaaQ51OcYvP0sw9qsRfGkOI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-YwGUxuINNoGVJV-Enq7XMg-1; Thu, 14 Apr 2022 06:04:26 -0400
X-MC-Unique: YwGUxuINNoGVJV-Enq7XMg-1
Received: by mail-wm1-f71.google.com with SMTP id n37-20020a05600c502500b0038fdc1394c6so1571996wmr.6
        for <linux-doc@vger.kernel.org>; Thu, 14 Apr 2022 03:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yuBcaeBniy5n5/L8X5921bwDC++5b8Xw6Z88KRpE9bQ=;
        b=ZsBvANOJS7aQfD6chRhNphvdPSOQS4UHB1EvHx4sCcqmi/iHw6Eirto7Wqfimh8Jpi
         s8riFaB2vPoOLVjlWQSi9gd4ADCB+gHjnRzyDonODMR1y6Hkg6Mglyk0VYI6XZNZzzax
         hJEmK8F8alMLno9U2qhO3O+aMv7qDfvVq1BvpFsmrkntrjM6k6LGP90Xgo/vx2Rg9I21
         2dzTFv9gbW+zQNRCVLV2RCEG+fjmQfY6a6iVa5Yui7e64Xfe41UCWc3R+UaPtaEs5JC7
         cxvbtPwWKQHBnGp6B513Rs4ikyVY2iN3+mWCbGdUcNv9eemPXzjDp4fZIyAWGmU/eeD0
         g3bA==
X-Gm-Message-State: AOAM530K3+24bosdkC5K0i4Q9zG/s5hFOi4OvOprNTf3WqdrGA2ie4Jd
        arMwMcJ3E4sxKFWMyDZxdSIkOCMc6IWH2Pw8njwTzNqien1NvYJ7BXZFqiE7cFKoZT7E2vYEWHe
        K/bIgkDjcRSsw3rYnk5jS
X-Received: by 2002:a05:600c:3ba9:b0:38e:c8c6:ae0d with SMTP id n41-20020a05600c3ba900b0038ec8c6ae0dmr2410329wms.120.1649930664854;
        Thu, 14 Apr 2022 03:04:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWW/CBrPwe+sYaoZNvV9T6UgMbQHF1faFSZFy0/f2vgkvI5kJx/Q5UzWAjnkbtTzqBMnumbg==
X-Received: by 2002:a05:600c:3ba9:b0:38e:c8c6:ae0d with SMTP id n41-20020a05600c3ba900b0038ec8c6ae0dmr2410293wms.120.1649930664610;
        Thu, 14 Apr 2022 03:04:24 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.googlemail.com with ESMTPSA id r14-20020a0560001b8e00b00205918bd86esm1395196wru.78.2022.04.14.03.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Apr 2022 03:04:24 -0700 (PDT)
Message-ID: <658729a1-a4a1-a353-50d6-ef71e83a4375@redhat.com>
Date:   Thu, 14 Apr 2022 12:04:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH V3 3/4] KVM: X86: Alloc role.pae_root shadow page
Content-Language: en-US
To:     Lai Jiangshan <jiangshanlai@gmail.com>
Cc:     Sean Christopherson <seanjc@google.com>,
        LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
        Lai Jiangshan <jiangshan.ljs@antgroup.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        X86 ML <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        linux-doc@vger.kernel.org
References: <20220330132152.4568-1-jiangshanlai@gmail.com>
 <20220330132152.4568-4-jiangshanlai@gmail.com> <YlXrshJa2Sd1WQ0P@google.com>
 <CAJhGHyD-4YFDhkxk2SQFmKe3ooqw_0wE+9u3+sZ8zOdSUfbnxw@mail.gmail.com>
 <683974e7-5801-e289-8fa4-c8a8d21ec1b2@redhat.com>
 <CAJhGHyCgo-FEgvuRfuLZikgJSyo7HGm1OfU3gme35-WBmqo7yQ@mail.gmail.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAJhGHyCgo-FEgvuRfuLZikgJSyo7HGm1OfU3gme35-WBmqo7yQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/14/22 11:32, Lai Jiangshan wrote:
> kvm_mmu_free_roots() can not free those new types of sp if they are still
> valid.  And different vcpu can use the same pae root sp if the guest cr3
> of the vcpus are the same.

Right, but then load_pdptrs only needs to zap the page before (or 
instead of) calling kvm_mmu_free_roots().

Paolo

> And new pae root can be put in prev_root too (not implemented yet)
> because they are not too special anymore.  As long as sp->gfn, sp->pae_off,
> sp->role are matched, they can be reused.

