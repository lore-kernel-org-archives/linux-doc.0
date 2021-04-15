Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F377CC433ED
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 16:08:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1E0C61152
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 16:08:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234046AbhDOQIs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Apr 2021 12:08:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50007 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233682AbhDOQIq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Apr 2021 12:08:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618502902;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GPWTOZkuVV9uKxyAib9OOYGzA4pl+7XPQzG6f3iPsNE=;
        b=VlAlpaK+xy2VtCmAopdRM3jQo+uBZWOk1mRzs0pG0LA4gjx5HVQLtM/GDbasdn+z5/uG1v
        N0Jepxhj3GvM0rOrUVMeu7vJfFh1gme9epsE7AoFML6vZoFz2c+ihrknPfw+teA4Gv9+kP
        EAJWynSGa4K4u0D23HeDJTURjj5uJc4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-LvNWs0u3ONG6aPLtz8E_hg-1; Thu, 15 Apr 2021 12:08:19 -0400
X-MC-Unique: LvNWs0u3ONG6aPLtz8E_hg-1
Received: by mail-ej1-f71.google.com with SMTP id 16-20020a1709063010b029037417ca2d43so1116246ejz.5
        for <linux-doc@vger.kernel.org>; Thu, 15 Apr 2021 09:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GPWTOZkuVV9uKxyAib9OOYGzA4pl+7XPQzG6f3iPsNE=;
        b=t2IQcB+JWFffba6WY1gPozJRVGyuSr0Ij9NF4AOo3slLsnO/YbSMl6ODx+ivu8sJDc
         na/xkUlE8urZpcsWqm3ovzWbFpHNw6aG/2R12nzgQmeKKNib1qfxRBcNgaOP9NZSvuQJ
         IqW6JWQP+SvIj/bnZssrKE0czFFuLG2EFPR1kryOBa7MANFFeSlld68a36vnWaSwS4MY
         E58WJx5E5zXfiAePAe1pZaI/vVQ9Wfb59Fb+gj9tvJ8pOE02aSZ72GcSSDaDMC45cFbA
         ++ilqWbF2IyA5dG134979FtQeZbN8D2IZGxcstdnwFyDyHpr9+hbM+5QPClf1pYyhBfe
         AAZQ==
X-Gm-Message-State: AOAM53075TowJinWkjMUTtfi79ZCCOlrr4CYTXmUc4s+RVQFZxJ7OQrb
        AMQfiqHVBpGkZCDUuwNie3wpWRC73UdpYd614X+wCb+j4R3z777R+r9iXM8iLi6x1e1mFAlWM9U
        GIsVGtofpjyMjsWZvvfRP
X-Received: by 2002:a17:906:7f01:: with SMTP id d1mr4338507ejr.136.1618502898583;
        Thu, 15 Apr 2021 09:08:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7WrvK1l6FVJlJKF6M6McOJ8gnW3B/2pPeOqGw+FE6kSlfaUMAJeNxJh1gTw4wVr2vncSDmA==
X-Received: by 2002:a17:906:7f01:: with SMTP id d1mr4338497ejr.136.1618502898384;
        Thu, 15 Apr 2021 09:08:18 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.gmail.com with ESMTPSA id la24sm2393268ejb.71.2021.04.15.09.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Apr 2021 09:08:17 -0700 (PDT)
Subject: Re: [PATCH v3 5/8] docs: vcpu-requests.rst: fix reference for atomic
 ops
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Peter Zijlstra <peterz@infradead.org>, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1617972339.git.mchehab+huawei@kernel.org>
 <fc194806772325d60b7406368ba726f07990b968.1617972339.git.mchehab+huawei@kernel.org>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e72a06e6-d027-74f6-14da-31666187b893@redhat.com>
Date:   Thu, 15 Apr 2021 18:08:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <fc194806772325d60b7406368ba726f07990b968.1617972339.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 09/04/21 14:47, Mauro Carvalho Chehab wrote:
> Changeset f0400a77ebdc ("atomic: Delete obsolete documentation")
> got rid of atomic_ops.rst, pointing that this was superseded by
> Documentation/atomic_*.txt.
> 
> Update its reference accordingly.
> 
> Fixes: f0400a77ebdc ("atomic: Delete obsolete documentation")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>   Documentation/virt/kvm/vcpu-requests.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/virt/kvm/vcpu-requests.rst b/Documentation/virt/kvm/vcpu-requests.rst
> index 5feb3706a7ae..5f8798e7fdf8 100644
> --- a/Documentation/virt/kvm/vcpu-requests.rst
> +++ b/Documentation/virt/kvm/vcpu-requests.rst
> @@ -302,6 +302,6 @@ VCPU returns from the call.
>   References
>   ==========
>   
> -.. [atomic-ops] Documentation/core-api/atomic_ops.rst
> +.. [atomic-ops] Documentation/atomic_bitops.txt and Documentation/atomic_t.txt
>   .. [memory-barriers] Documentation/memory-barriers.txt
>   .. [lwn-mb] https://lwn.net/Articles/573436/
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

