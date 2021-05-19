Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 366C4C433ED
	for <linux-doc@archiver.kernel.org>; Wed, 19 May 2021 11:19:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 163286139A
	for <linux-doc@archiver.kernel.org>; Wed, 19 May 2021 11:19:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241474AbhESLUZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 May 2021 07:20:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60963 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1349934AbhESLUL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 May 2021 07:20:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621423130;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NWPwTLXUbkkuBeNGwn+3y597gm6t7tmE54rpjMpE4pA=;
        b=RKWa2iA9rxg69RsfOxR9jwKscMv7Fhob28ukgfKT56LqXY+LuSIfkSuM7TyJgnF/l48eU9
        gQ8jEjZQenGDyyaK0IkqOulyzt0ePcT38Edurz8qcswlmtKsyBS3OTBtICpxUG6BIgkNkK
        FnhPQaZ1KwVtz90da/4f05znrC04xCQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-3tDWgznsMoWoxc7aN53eag-1; Wed, 19 May 2021 07:18:48 -0400
X-MC-Unique: 3tDWgznsMoWoxc7aN53eag-1
Received: by mail-wr1-f71.google.com with SMTP id 22-20020adf82960000b02901115ae2f734so7029306wrc.5
        for <linux-doc@vger.kernel.org>; Wed, 19 May 2021 04:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NWPwTLXUbkkuBeNGwn+3y597gm6t7tmE54rpjMpE4pA=;
        b=O9QtEDVCBqYmxx6KsKVOgHQT93QaZiUfYpl+NQvQZ9wdQPqOUSc0IwJsIyvZ0Fhdhc
         BlWPLaf+0aruTLUIkFe+uW0FrEoCBlQ8uQId0PWb7Xp2O2HI+74QFcUQErVo0f2dHH9e
         AuDsxINBDFSEDAiD2I9CaQC3aKzuGea7MTh6Pg53gL77xpUF1T/a3ZCFCCsqqP3h2fwZ
         wAfGZ1zudUPJCVYNLjZbcvqbhwhTd9CbjNvczxqAuBAy37x+bLfsdZzScsdsj3wg5ChQ
         RZBqQqFW4HZGeqw1rmFNIFf0x1m5a1iijVQslIY/bOdYg8/vMUEmDgYPMbPsvj5sHf3f
         oAWQ==
X-Gm-Message-State: AOAM530MZEWD0bJ6QSdSu6YIxCFv7mu8mDhKbiUQbgl54wurTXwfAbWq
        19zYTOf8GtF5V2XS0PuZ9PZXnFeTmFkXk7LGBE2JwKtGR5jaUdRj2UspPfMeWeLuhcLCClfni5i
        LmsgEH3ke8vUcABkceY7M
X-Received: by 2002:a5d:6910:: with SMTP id t16mr13720355wru.416.1621423127668;
        Wed, 19 May 2021 04:18:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsKGojU2DgZBTVi6QJ5uaGR/qngB2I/7EjHlNBsabqXVj4gNUE+e0fQBwiJa1DS8Rsi1PZLg==
X-Received: by 2002:a5d:6910:: with SMTP id t16mr13720320wru.416.1621423127405;
        Wed, 19 May 2021 04:18:47 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id v10sm28926558wrq.0.2021.05.19.04.18.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 04:18:46 -0700 (PDT)
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Anup Patel <anup@brainfault.org>
Cc:     Anup Patel <anup.patel@wdc.com>,
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
From:   Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v18 00/18] KVM RISC-V Support
Message-ID: <d7d5ad76-aec3-3297-0fac-a9da9b0c3663@redhat.com>
Date:   Wed, 19 May 2021 13:18:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKTsyyVYsHVMQC+G@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 19/05/21 12:47, Greg Kroah-Hartman wrote:
>> It is not a dumping ground for stuff that arch maintainers can not seem
>> to agree on, and it is not a place where you can just randomly play
>> around with user/kernel apis with no consequences.
>>
>> So no, sorry, not going to take this code at all.
>
> And to be a bit more clear about this, having other subsystem
> maintainers drop their unwanted code on this subsystem,_without_  even
> asking me first is just not very nice. All of a sudden I am now > responsible for this stuff, without me even being asked about it.
> Should I start throwing random drivers into the kvm subsystem for them
> to maintain because I don't want to?:)

(I did see the smiley), I'm on board with throwing random drivers in 
arch/riscv. :)

The situation here didn't seem very far from what process/2.Process.rst 
says about staging:

- "a way to keep track of drivers that aren't up to standards", though 
in this case the issue is not coding standards or quality---the code is 
very good---and which people "may want to use"

- the code could be removed if there's no progress on either changing 
the RISC-V acceptance policy or ratifying the spec

Of course there should have been a TODO file explaining the situation. 
But if you think this is not the right place, I totally understand; if 
my opinion had any weight in this, I would just place it in arch/riscv/kvm.

The RISC-V acceptance policy as is just doesn't work, and the fact that 
people are trying to work around it is proving it.  There are many ways 
to improve it:

- get rid of it;

- provide a path to get an exception;

- provide a staging place sot hat people to do their job of contributing 
code to Linux (e.g. arch/riscv/staging/kvm).

If everything else fail, I guess we can place it in 
drivers/virt/riscv/kvm, even though that's just as silly a workaround. 
It's a pity because the RISC-V virtualization architecture has a very 
nice design, and the KVM code is also a very good example of how to do 
things right.

Paolo

> If there's really no other way to do this, than to put it in staging,
> let's talk about it.  But saying "this must go here" is not a
> conversation...

