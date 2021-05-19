Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F7EC433B4
	for <linux-doc@archiver.kernel.org>; Wed, 19 May 2021 15:26:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E768F611AE
	for <linux-doc@archiver.kernel.org>; Wed, 19 May 2021 15:26:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240398AbhESP2H (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 May 2021 11:28:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48458 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233470AbhESP2G (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 May 2021 11:28:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621438006;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BPRLpBAjZNhjflwwDzXS2G9ItWCI1OxLrIqekCHLw0A=;
        b=TinEsRcCPVWx5NAQEZEmIaeQc+Ca9e0+wmyuRuXnHIe9DG6Xe+48sN730wqeGPRhxa0GXS
        MdQXZPJppegYvAc/ZXqE2/cc3xOFusgRXMlJooOyhHbqzEL+RCut7CCzLT37JGSq0dPkME
        3vhbT/jGd5Xq164Uay0Di7o9WI0IKVM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-2DF9gdJSNuWAZ66KjcMZdQ-1; Wed, 19 May 2021 11:26:45 -0400
X-MC-Unique: 2DF9gdJSNuWAZ66KjcMZdQ-1
Received: by mail-wr1-f71.google.com with SMTP id f19-20020adfb6130000b02901121afc9a31so598474wre.10
        for <linux-doc@vger.kernel.org>; Wed, 19 May 2021 08:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BPRLpBAjZNhjflwwDzXS2G9ItWCI1OxLrIqekCHLw0A=;
        b=ZEIhm9tdlGx/411HM/nz+6ibL6GksxUFIxUGXvh0xrr1LscC2yZTuJsHKX48hOZyJY
         r5qs9mRA/U0m+nA8ZNMQYgN8PBdLwJ7hF4BTXvhQafSEcb5YCcpWN2VIn8vPyvmV6he6
         ofmwH4mQ7fBV3zSZ+QA0hStcH6bTRJmO/dOxMs0zIlU6wxdxzSTU1y+spZaOGh6RIK26
         urY9PCxEdDqpj15XWTkp9q1z1WKhCPLuKrMTarPOHw/mbJ0MhTCKIdJGxPVZRNqoN9gL
         NQOL0evUJCmVyS2yw2yhHIU+rHkNhursONrkFo31y7ZDlJ571+VbbDW53bs7my6sv4fm
         yGOw==
X-Gm-Message-State: AOAM530lCIxhqd28php1IXeh1jecP2RTHxx8AiDfkWvBQSIx+dWSWsJq
        vRhJA9Wx/Kd5rXOYLLzNPeYPRnPt9WzQYAdBrVeQEbsPgvTjFI0p4Oq8waz174x897DG2ar8aeY
        DeWfaEUoqObpLCZl/B0QJ
X-Received: by 2002:a5d:570c:: with SMTP id a12mr15048768wrv.354.1621438003868;
        Wed, 19 May 2021 08:26:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKFgM0dMznbTO2YJBPi9PLyM0fdlyyhnY2E+SOMK4tY3xOEu2tCm4NOpliSoEFl1o4vdaeSw==
X-Received: by 2002:a5d:570c:: with SMTP id a12mr15048755wrv.354.1621438003711;
        Wed, 19 May 2021 08:26:43 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id y137sm350209wmc.11.2021.05.19.08.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 08:26:43 -0700 (PDT)
Subject: Re: [PATCH v18 00/18] KVM RISC-V Support
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Anup Patel <anup@brainfault.org>, Anup Patel <anup.patel@wdc.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexander Graf <graf@amazon.com>,
        Atish Patra <atish.patra@wdc.com>,
        Alistair Francis <Alistair.Francis@wdc.com>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        KVM General <kvm@vger.kernel.org>,
        kvm-riscv@lists.infradead.org,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-doc@vger.kernel.org,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        linux-staging@lists.linux.dev
References: <20210519033553.1110536-1-anup.patel@wdc.com>
 <YKSa48cejI1Lax+/@kroah.com>
 <CAAhSdy18qySXbUdrEsUe-KtbtuEoYrys0TcmsV2UkEA2=7UQzw@mail.gmail.com>
 <YKSgcn5gxE/4u2bT@kroah.com> <YKTsyyVYsHVMQC+G@kroah.com>
 <d7d5ad76-aec3-3297-0fac-a9da9b0c3663@redhat.com>
 <YKUDWgZVj82/KiKw@kroah.com>
 <daa30135-8757-8d33-a92e-8db4207168ff@redhat.com>
 <YKUZbb6OK+UYAq+t@kroah.com> <20210519150814.GY1955@kadam>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1ce20fe0-0fea-406a-f7bf-1dde686b411a@redhat.com>
Date:   Wed, 19 May 2021 17:26:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210519150814.GY1955@kadam>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 19/05/21 17:08, Dan Carpenter wrote:
> It's sort of frustrating that none of this information was in the commit
> message.
> 
> "This code is not ready to be merged into the arch/risc/ directory
> because the RISC-V Foundation has not certified the hardware spec yet.
> However, the following chips have implemented it ABC12345, ABC6789 and
> they've already shipping to thousands of customers since blah blah blah
> so we should support it."
> 
> I honestly thought it was an issue with the code or the userspace API.

Yes, I was expecting this to be in the staging TODO file - I should have 
been more explicit with Anup.

Paolo

