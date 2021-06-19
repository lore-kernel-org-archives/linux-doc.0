Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD51C2B9F4
	for <linux-doc@archiver.kernel.org>; Sat, 19 Jun 2021 07:03:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B5406120A
	for <linux-doc@archiver.kernel.org>; Sat, 19 Jun 2021 07:03:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234219AbhFSHFj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 19 Jun 2021 03:05:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51209 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234148AbhFSHF1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 19 Jun 2021 03:05:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624086196;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8ML4REiy5OkcaqfJ6brk7+RfQQvQg3ZqoRzOqMYC4CQ=;
        b=J0F5GsHhMdf4BjcqmRPbvxjekUgLvI8ieIlqkO+70qHtKV/eoSgGnb4CRKOZTdUAGtzPKe
        Dt/NNKKWK5OPBPGQ9nNJ2RT0HATEAatgN9CHg5AFwI9RXhmIlqNCyz27mmtrcEyTCyKunB
        YTAmIpKU/GxGZeXwEmh7hPdQAP+/QGI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-PKAV6sYbNiOd3hWTJSrHmg-1; Sat, 19 Jun 2021 03:03:15 -0400
X-MC-Unique: PKAV6sYbNiOd3hWTJSrHmg-1
Received: by mail-ed1-f72.google.com with SMTP id a16-20020aa7cf100000b0290391819a774aso2970786edy.8
        for <linux-doc@vger.kernel.org>; Sat, 19 Jun 2021 00:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8ML4REiy5OkcaqfJ6brk7+RfQQvQg3ZqoRzOqMYC4CQ=;
        b=pgdD2uGgd7eQMJ6bufdOnc0/mFt97uXofb3hk8OUiTAd0uFSysJtyw7CZ0FQyaWbx8
         a62A1f3S5giSO8DmBKRENBovTq17C+KNSPnyFasjtflURQLyt4UfmMBWNRD3VI/GqfOv
         Z7XSoYNHnHlfm2yODwNNs9GCeUPRSH5EOjHI27wAzYqzpzsdkWtip0NgQvz2HDhRTAbq
         JE4m0wGH3GfWJ1vDOFJCMj03HS09AToRPNN45AQzjLehTXAu5jpVsskLpqzE20HiV+MA
         nZTktCFhXtxXoND/TdWe+fW9mi+80oVB3xriAgFNrP2tlrys/2O02bMyhKnpAzPjkCoj
         xnvw==
X-Gm-Message-State: AOAM531dc702/+4nnzxM27kiRChTMeREvDp0U3y9VPx+80WILog1QFA3
        nUDOv9aY0Jp65hx48GOaZotkZNpY8tUaTxMgo61gWhcpOVOmcHFDtwqCLSQGDYuco3dEGGgOkt3
        fCbGWltE+kjRp2LEdOW5P
X-Received: by 2002:a05:6402:2317:: with SMTP id l23mr9400532eda.265.1624086194034;
        Sat, 19 Jun 2021 00:03:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhkU4ORZu2NUVqekm38wER3uTsadAxLzHjeKIBOfzZkIl9xiP0Gksb8acUUBxOaPCJVpfJRA==
X-Received: by 2002:a05:6402:2317:: with SMTP id l23mr9400523eda.265.1624086193880;
        Sat, 19 Jun 2021 00:03:13 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id hx18sm448140ejc.82.2021.06.19.00.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Jun 2021 00:03:13 -0700 (PDT)
Subject: Re: [PATCH v3 8/8] KVM: x86: avoid loading PDPTRs after migration
 when possible
To:     Sean Christopherson <seanjc@google.com>,
        Maxim Levitsky <mlevitsk@redhat.com>
Cc:     kvm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Wanpeng Li <wanpengli@tencent.com>,
        Ingo Molnar <mingo@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>, Joerg Roedel <joro@8bytes.org>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Jim Mattson <jmattson@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "H. Peter Anvin" <hpa@zytor.com>
References: <20210607090203.133058-1-mlevitsk@redhat.com>
 <20210607090203.133058-9-mlevitsk@redhat.com> <YM0H3Hvs8/3+twnc@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <289ac328-703f-6eb0-292e-99b1eda08784@redhat.com>
Date:   Sat, 19 Jun 2021 09:03:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YM0H3Hvs8/3+twnc@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 18/06/21 22:53, Sean Christopherson wrote:
> The bool is essentially an extension of
> KVM_REQ_GET_NESTED_STATE_PAGES, I think it makes sense to clear the flag whenever
> KVM_REQ_GET_NESTED_STATE_PAGES is cleared.

So in vcpu_enter_guest?

> Another thing that's not obvious is the required ordering between KVM_SET_SREGS2
> and KVM_SET_NESTED_STATE.  AFAICT it's not documented, but that may be PEBKAC on
> my end.  E.g. what happens if walk_mmu == &root_mmu (L1 active in targte KVM)
> when SET_SREGS2 is called, and_then_  KVM_SET_NESTED_STATE is called?

Either ordering should work.

Paolo

