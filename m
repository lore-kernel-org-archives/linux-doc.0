Return-Path: <SRS0=F/ae=DF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0B4C4741F
	for <linux-doc@archiver.kernel.org>; Mon, 28 Sep 2020 16:06:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 099DC20809
	for <linux-doc@archiver.kernel.org>; Mon, 28 Sep 2020 16:06:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fvsDnXfK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726409AbgI1QGP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Sep 2020 12:06:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbgI1QGL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Sep 2020 12:06:11 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C932FC0613CE
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2020 09:06:10 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id p9so9304439ejf.6
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2020 09:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o71LzbqX367JaJH9ttdwJUvGzrnJxktn3m8pbVRAwzw=;
        b=fvsDnXfKUBOAXccBDwFSPn5D6Csgk0G1mHyAUd74eUxAq5zR8163TbnodrFpDHFksK
         q2UiyDX8dhCNVWDabaAhGk6xzfG4SXk1cjcB+qzfJ7yDn1xhigkN52Szo+wj1QDppJZy
         SQIg1zSkc4EsBC+GeqRxR6kysSFmHW8aanRGoDDPzu+9MkTBuf1hXhNNXN+d3nIR/hOU
         1p+7sGA15/ttgAVlsAnYSh8fZUQuiNAtvq8tEXBc7wT+Dzt+eNRle4hU6ePzLCSiumPP
         94zV7qksW3cZEgcTnZWteH9J53JSPSP4z9MrIiYAh1NbGG9saHFBAmXyiozR7L2/MR6P
         ARaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o71LzbqX367JaJH9ttdwJUvGzrnJxktn3m8pbVRAwzw=;
        b=gqq5LFDnM5R4Q5XG16CZ46rD/yf3Obeosjp8vR6bTWFx0oD5mlj0+i8fBztcFXEPwY
         PMPrGoD5o6l9J34JYhQxgnVjYKJmUPPpg7EGGBPZbL8dZfguBNVGZIPj09Kuezu0yq/0
         kuioBgTljkv4VnFupew1hfCdrKZHwpJgUUg/VFhZwG6J30Umc0kSRtHH6ar2UyACyb7E
         VAMqJGmQbCESS9mv5OJdxnvUqbATuvmuny0PnYY9o6zRJT1uubWAG03qRE1LEW4dQoFa
         nGeQMle8DQfpkI3IT6GUERcUws83yRiioPnO/ZbX7UZgCsDnr+sCs2O1EfmkojZRDjSr
         tthA==
X-Gm-Message-State: AOAM5336xYZ0wEOhRo4qY+GTgtEUoZJ7LDozyinueEV4UaXrQFj6GFhu
        fas+DQIMzHkJlzuL+Uex42VYluHvUq5UrljOUSeARw==
X-Google-Smtp-Source: ABdhPJwqh8E0xHjHa+dXhoJEb6VW08INWmr1q9wGgTppwWtMYPE+FmoLDTQjTf5DzUZYK4TAiqHPx/WYKmjPD/totDw=
X-Received: by 2002:a17:906:3e08:: with SMTP id k8mr2297800eji.480.1601309169232;
 Mon, 28 Sep 2020 09:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200925143422.21718-1-graf@amazon.com> <20200925143422.21718-3-graf@amazon.com>
In-Reply-To: <20200925143422.21718-3-graf@amazon.com>
From:   Aaron Lewis <aaronlewis@google.com>
Date:   Mon, 28 Sep 2020 09:05:58 -0700
Message-ID: <CAAAPnDGVKDvVRdDK8yUzqXHzWzFK_9tnbwdmHkwbgcVb2wU5aA@mail.gmail.com>
Subject: Re: [PATCH v8 2/8] KVM: x86: Deflect unknown MSR accesses to user space
To:     Alexander Graf <graf@amazon.com>
Cc:     kvm list <kvm@vger.kernel.org>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        KarimAllah Raslan <karahmed@amazon.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

>
> This patch adds a generic interface to handle WRMSR and RDMSR from user
> space. With this, any future MSR that is part of the latter categories can
> be handled in user space.
>
> Furthermore, it allows us to replace the existing "ignore_msrs" logic with
> something that applies per-VM rather than on the full system. That way you
> can run productive VMs in parallel to experimental ones where you don't care
> about proper MSR handling.
>
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Reviewed-by: Jim Mattson <jmattson@google.com>

Reviewed-by: Aaron Lewis <aaronlewis@google.com>

>
> ---
>
> v1 -> v2:
