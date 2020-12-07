Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 636DBC4361B
	for <linux-doc@archiver.kernel.org>; Mon,  7 Dec 2020 13:18:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 38B38233A0
	for <linux-doc@archiver.kernel.org>; Mon,  7 Dec 2020 13:18:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbgLGNRr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Dec 2020 08:17:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51554 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726344AbgLGNRq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Dec 2020 08:17:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607346980;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=79CDQSAGopTcyYZWDZiCTCDAaMDLvT94+iPcW3Ja/gg=;
        b=LvLi/A5dfoYuRJy3OAC9ysOWrhyr4fHfCqo32guSrmwZmFWor3q/a9dBulAxx8zMBNwoEG
        vA/AUpZJiFSlwVgxNCu81KgnxCTrAqmtzHjLJhrj0lqtN9Me7peTiJbOQbB0l0lvCboBp0
        0hORq99iT7V2NQD/YO6vcnG8d4M5wTQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-9Wz8oW0cNj-R6B2oKCrVDA-1; Mon, 07 Dec 2020 08:16:18 -0500
X-MC-Unique: 9Wz8oW0cNj-R6B2oKCrVDA-1
Received: by mail-ej1-f72.google.com with SMTP id u10so3849841ejy.18
        for <linux-doc@vger.kernel.org>; Mon, 07 Dec 2020 05:16:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=79CDQSAGopTcyYZWDZiCTCDAaMDLvT94+iPcW3Ja/gg=;
        b=C+0qpU4Ex/bBd9bD5S2zfi3Hbp+iqAJSr56pj3AGLlB7vhca2BOZuA8wm0OTJ+ZYf5
         pcss0y19FxpBfzh7r3xYtTBZhgqt9mWIit60TSSbpf1Ikx5X1hBMD30hBnXb5MjkK0wh
         D0XCPDDx6DY6IW1EiTOCZdgbAcI6lBLyohgpyUmafFwxBwW+DDaqeWMyQN/ssIF1YI1L
         rY4h8a0IuhCXcwTWkmKNCibdyPk04Gn/CLexkfGDWfsXupUUugrJZ6hlWCehDelA1zM7
         ZzlOtZI8zsYoE2xxbWL7ITg1NJaGlU6Ox1LikDfWMMByro3zt3FkomO8Pu5n3a9xQxOn
         AGbA==
X-Gm-Message-State: AOAM5323tfSkMK4OHopdZgqe9kZhAFn57yo93NHqyj3vw0fpS0z+KgmZ
        9UKQxWpW09CVMNi/CBlPIuH1N/adJHwiUxLKBN0xW05Kga65EpMqR+6W0R7WYm0pfZN6qwLP5FL
        V2dJzxAS72ZJE5reh2WIU
X-Received: by 2002:a50:ff0c:: with SMTP id a12mr19974975edu.79.1607346977395;
        Mon, 07 Dec 2020 05:16:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwl7wJhrOzNS1+1ArDJ93sSPPCNdBbU63ASXPczoyfqdvj9aq9nJs+MSWplfTwlW8IubCCmHg==
X-Received: by 2002:a50:ff0c:: with SMTP id a12mr19974957edu.79.1607346977230;
        Mon, 07 Dec 2020 05:16:17 -0800 (PST)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
        by smtp.gmail.com with ESMTPSA id x20sm12357813ejv.66.2020.12.07.05.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 05:16:16 -0800 (PST)
From:   Vitaly Kuznetsov <vkuznets@redhat.com>
To:     Maxim Levitsky <mlevitsk@redhat.com>
Cc:     "H. Peter Anvin" <hpa@zytor.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jim Mattson <jmattson@google.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        open list <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Borislav Petkov <bp@alien8.de>,
        Shuah Khan <shuah@kernel.org>,
        Andrew Jones <drjones@redhat.com>,
        Oliver Upton <oupton@google.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, kvm@vger.kernel.org
Subject: Re: [PATCH v2 1/3] KVM: x86: implement KVM_{GET|SET}_TSC_STATE
In-Reply-To: <1dbbeefc7c76c259b55582468ccd3aab35a6de60.camel@redhat.com>
References: <20201203171118.372391-1-mlevitsk@redhat.com>
 <20201203171118.372391-2-mlevitsk@redhat.com>
 <87a6uq9abf.fsf@nanos.tec.linutronix.de>
 <1dbbeefc7c76c259b55582468ccd3aab35a6de60.camel@redhat.com>
Date:   Mon, 07 Dec 2020 14:16:15 +0100
Message-ID: <87im9dlpsw.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Maxim Levitsky <mlevitsk@redhat.com> writes:

>
> But other than that I don't mind making TSC offset global per VM thing.
> Paulo, what do you think about this?
>

Not Paolo here but personally I'd very much prefer we go this route but
unsynchronized TSCs are, unfortunately, still a thing: I was observing
it on an AMD Epyc server just a couple years ago (cured with firmware
update). We try to catch such situation in KVM instead of blowing up but
this may still result in subtle bugs I believe. Maybe we would be better
off killing all VMs in case TSC ever gets unsynced (by default).

Another thing to this bucket is kvmclock which is currently per-cpu. If
we forbid TSC to un-synchronize (he-he), there is no point in doing
that. We can as well use e.g. Hyper-V TSC page method which is
per-VM. Creating another PV clock in KVM may be a hard sell as all
modern x86 CPUs support TSC scaling (in addition to TSC offsetting which
is there for a long time) and when it's there we don't really need a PV
clock to make migration possible.

-- 
Vitaly

