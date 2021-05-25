Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7BBBC47084
	for <linux-doc@archiver.kernel.org>; Tue, 25 May 2021 08:24:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B37A061400
	for <linux-doc@archiver.kernel.org>; Tue, 25 May 2021 08:24:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232326AbhEYIZl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 25 May 2021 04:25:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31760 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230226AbhEYIZi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 May 2021 04:25:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621931048;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nMNrS2AH+pWQGLicYKYrV08FbwOU09YffgbHD3gux2Q=;
        b=P5A9KrRtsLXVNPfo0wac7J6zkBsiE3zNljU6u/nSwBLWx10PyV8FJQt2aQ43h2l/4UhwDD
        8Z9AfNhpf0kWa+K0kHPPlY3Jbhdnab5yaHxyEpdsaANCRS8faNOSZ6YBJg96j+ryz2GkGd
        LdW8So2jMFAxzQ8ZsD4jSh9NVFVHg4Q=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-BIsdtcEaN4-zwu3EsFQ2Bg-1; Tue, 25 May 2021 04:24:06 -0400
X-MC-Unique: BIsdtcEaN4-zwu3EsFQ2Bg-1
Received: by mail-ej1-f70.google.com with SMTP id sd18-20020a170906ce32b02903cedf584542so8494393ejb.9
        for <linux-doc@vger.kernel.org>; Tue, 25 May 2021 01:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nMNrS2AH+pWQGLicYKYrV08FbwOU09YffgbHD3gux2Q=;
        b=OqoWOKaTHhprV8XefvU0jx4nLi1jx01yYVkvwAS14Faq4WVeGW30Q5ViOLuyReb2Uv
         myLuO6TvlghSuYiZO/furAJTdK7fo8IsMc0HN8DO1/JRMBxTuEH59Z2ECgsG274EpSoE
         TZJNEWBwYhOLmiMXTkvygoxQJhZctG7HQd7zfoXEDqn/JKi24HRTyQVfpVPngKvmLtVY
         dev8ZngbnCxMkNfse9kpDtpX9n9+FsAWBGhL9XrxqQWz2pu+qW0W0QTY6Sgxl8lE4i/V
         jbVhnJgp5iE4hnB3OPKJ69zWNVd1EZYxFTukq0beSZRlTwt2R1JEng3dWkB/jE/ySqx+
         FqkQ==
X-Gm-Message-State: AOAM532aIezICyWzdEJBjsHFGJlnyJnxpTpZep+f46nSx4TfNjw8ETfR
        p5aWIPn65mzd66Jo6qnbZz726lMA5BiKfgY2PiE0y5pZPCSCc35V1HQnCFiLbcjlu7PGPTm2LPb
        Pr7wmpfCZM390P46DNGfl
X-Received: by 2002:a17:906:2749:: with SMTP id a9mr7301263ejd.498.1621931045769;
        Tue, 25 May 2021 01:24:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3ejiTVjnk0KxP0784vBVyBVdsw1rtPY3FP7JEZB/fGwja1e9e9HqFVf3ExrM8SXokAJlR3w==
X-Received: by 2002:a17:906:2749:: with SMTP id a9mr7301238ejd.498.1621931045543;
        Tue, 25 May 2021 01:24:05 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id gl20sm8752886ejb.5.2021.05.25.01.24.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 01:24:05 -0700 (PDT)
To:     Greg KH <gregkh@linuxfoundation.org>,
        Damien Le Moal <Damien.LeMoal@wdc.com>
Cc:     Palmer Dabbelt <palmerdabbelt@google.com>,
        "guoren@kernel.org" <guoren@kernel.org>,
        Anup Patel <Anup.Patel@wdc.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "graf@amazon.com" <graf@amazon.com>,
        Atish Patra <Atish.Patra@wdc.com>,
        Alistair Francis <Alistair.Francis@wdc.com>,
        "anup@brainfault.org" <anup@brainfault.org>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
        "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>
References: <mhng-b093a5aa-ff9d-437f-a10b-47558f182639@palmerdabbelt-glaptop>
 <DM6PR04MB708173B754E145BC843C4123E7269@DM6PR04MB7081.namprd04.prod.outlook.com>
 <YKypJ5SJg2sDtn7/@kroah.com>
 <DM6PR04MB7081843419AFCECABA75AD74E7259@DM6PR04MB7081.namprd04.prod.outlook.com>
 <YKyxMy+djlscUhr1@kroah.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v18 00/18] KVM RISC-V Support
Message-ID: <fb03a89a-873d-ab85-8b05-f5f283f54489@redhat.com>
Date:   Tue, 25 May 2021 10:24:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKyxMy+djlscUhr1@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 25/05/21 10:11, Greg KH wrote:
>> 1) facilitate the development work overall, both for Paolo and Anup on the KVM
>> part, but also others to check that their changes do not break KVM support.
> 
> Who are the "others" here?  You can't force your code into the tree just
> to keep it up to date with internal apis that others are changing, if
> you have no real users for it yet.  That's asking others to do your work
> for you:(

I don't know about changes that would break KVM support.  However, 
"other KVM developers" would be able to check that their changes do not 
break the RISC-V implementation, and I would certainly either enforce 
that or do the work myself.

Also, excluding simulators and emulators from the set of "real users" 
ignores the needs of userspace developers, as well as other uses such as 
education/academia.  Linux for x86 (both KVM and bare metal) supports 
features that are only available in emulators and simulators which are 
not even free software.  I am pretty sure that there would be more users 
of KVM/RISC-V than with KVM/MIPS, despite the latter having support in 
real hardware.

Paolo

