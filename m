Return-Path: <SRS0=iu5e=BI=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EFCFC433E0
	for <linux-doc@archiver.kernel.org>; Wed, 29 Jul 2020 08:23:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 14F9F206D4
	for <linux-doc@archiver.kernel.org>; Wed, 29 Jul 2020 08:23:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="izATLkqo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727844AbgG2IX0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 29 Jul 2020 04:23:26 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:23655 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726336AbgG2IX0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Jul 2020 04:23:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1596011005;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8lrqZhx4wIlIKGfI1v+EKqO6jc0hqmda+j4PZMrvWEE=;
        b=izATLkqoGsmn4NG6MP7HxZydLZv+7lEfCEEwa7nofJYBi+idgLTcpHMgWzgWEP07esXa8C
        f5L9WvT7cLQ9N4h704UtbI0zELjZo0z6Hd67gptJjLBUcGkZejw7woN6ek+t+Ju1hvnVgn
        Sv/3byYdJZLX2gX2O05Gzf/+VF/RAKo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-yFApBZvuO9Gqpw70RZnXOg-1; Wed, 29 Jul 2020 04:23:23 -0400
X-MC-Unique: yFApBZvuO9Gqpw70RZnXOg-1
Received: by mail-ej1-f70.google.com with SMTP id e21so8211226ejr.9
        for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2020 01:23:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=8lrqZhx4wIlIKGfI1v+EKqO6jc0hqmda+j4PZMrvWEE=;
        b=aV1DqY4DMY1Sp5msMLDzcW2YWTxvtZJGgTsRuEGTB4Dzsxs5SDg/cTojPyfSxD+aL0
         sL58DWhJxF7murb/ZxowkCY+H73shCvO6XoNNBfJGTvi4xmOAXzsa5Rs5zDderDOc6Dd
         69c1Gl+oJMV3jcywVge0gG9mF5ZbIA2N3UwQvkxoyGs9IsUoJsct6GM8YGYoxSpa4/x4
         +4ALQ3XHjVl7xgstIArw8GM03k4vqmC6nxU4bAT+Gvcyc7a8HB8NqCgPcQUnKn3uRcvJ
         wi4H1/WM3t3esljgVXmXPwGeenXBNgRbpTvrMJNoYgf0t8q1u4oThUFZPAwsFq8Flh6+
         wDLQ==
X-Gm-Message-State: AOAM531SbOniaiz9RIhIN0nUlYFhFTSTYSaV/u/hbY938QGU8nK489D6
        O2hwyyRUmv/aMZTFP9HDAO0pTMl/4l5yZ5gXmXZrBIHIPKOGTfxnU23lAON0qbp5/nrO7ncugoG
        EDsAQ3dWdZohXvwl0vO4W
X-Received: by 2002:a17:906:c096:: with SMTP id f22mr19924874ejz.159.1596011002578;
        Wed, 29 Jul 2020 01:23:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrtor48PKaJPzhZluQN3DnUZRQ0VogdZPOhAt3ZNs96b8Wg1nFDHyxjUTEMO1FmMqAUc0VVA==
X-Received: by 2002:a17:906:c096:: with SMTP id f22mr19924858ejz.159.1596011002411;
        Wed, 29 Jul 2020 01:23:22 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
        by smtp.gmail.com with ESMTPSA id g9sm609366ejf.101.2020.07.29.01.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 01:23:21 -0700 (PDT)
From:   Vitaly Kuznetsov <vkuznets@redhat.com>
To:     Jim Mattson <jmattson@google.com>, Alexander Graf <graf@amazon.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Joerg Roedel <joro@8bytes.org>, kvm list <kvm@vger.kernel.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Aaron Lewis <aaronlewis@google.com>
Subject: Re: [PATCH] KVM: x86: Deflect unknown MSR accesses to user space
In-Reply-To: <CALMp9eQ3OxhQZYiHPiebX=KyvjWQgxQEO-owjSoxgPKsOMRvjw@mail.gmail.com>
References: <20200728004446.932-1-graf@amazon.com> <87d04gm4ws.fsf@vitty.brq.redhat.com> <a1f30fc8-09f5-fe2f-39e2-136b881ed15a@amazon.com> <CALMp9eQ3OxhQZYiHPiebX=KyvjWQgxQEO-owjSoxgPKsOMRvjw@mail.gmail.com>
Date:   Wed, 29 Jul 2020 10:23:20 +0200
Message-ID: <87y2n2log7.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jim Mattson <jmattson@google.com> writes:

> On Tue, Jul 28, 2020 at 5:41 AM Alexander Graf <graf@amazon.com> wrote:
>>

...

>> While it does feel a bit overengineered, it would solve the problem that
>> we're turning in-KVM handled MSRs into an ABI.
>
> It seems unlikely that userspace is going to know what to do with a
> large number of MSRs. I suspect that a small enumerated list will
> suffice.

The list can also be 'wildcarded', i.e. 
{
 u32 index;
 u32 mask;
 ...
}

to make it really short.

-- 
Vitaly

