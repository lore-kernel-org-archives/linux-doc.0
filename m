Return-Path: <SRS0=/93U=D2=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F4EC433DF
	for <linux-doc@archiver.kernel.org>; Mon, 19 Oct 2020 15:12:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 639392231B
	for <linux-doc@archiver.kernel.org>; Mon, 19 Oct 2020 15:12:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H4eC25y9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729880AbgJSPL7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Oct 2020 11:11:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27581 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729941AbgJSPL7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Oct 2020 11:11:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603120318;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aXlleUnBQnXgRgurIE/X/dP18+C+fiLS1/SOsHDJ8GA=;
        b=H4eC25y9E9I7dFEakKen3kpM6c9iNqV1bvNDoawcUEBOiFHdV4NkgXhanYuWkyrHEJYglX
        UvWl54JE6SwHMKSMEQBqJy5nDF+EgX6FIVwKpz2EzwCOyWGfh2KPBw4keEecVwPQgoLcu5
        gFKNw2AJmx+K6uL1RoHMUS2v48KOfsY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-pz8vBYF8OOKZPwbQVKJIQw-1; Mon, 19 Oct 2020 11:11:56 -0400
X-MC-Unique: pz8vBYF8OOKZPwbQVKJIQw-1
Received: by mail-wr1-f72.google.com with SMTP id t3so9256wrq.2
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2020 08:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aXlleUnBQnXgRgurIE/X/dP18+C+fiLS1/SOsHDJ8GA=;
        b=WvefAnXE9LO166np6498OuzjGlj7g64R9nk9yCjBtq1/SL+UNohlZi3fXE5PGiR2QI
         oQT5DOoXlMJxzg6yTyo9W5hDyBjHF07QQGMHEgHRDAx+DA5fQiPsvS0RokBE3tjcW+f9
         i6OcI15lg3SHIY2CFz3//oUOYBn0KGNJwm+nqICYPJivq0xfv0B9nONcR47/LWEOiq1l
         3QCOYnjtnEo37D5M5NcFZFg0ZXV2BaG2eu+GO3nmXfCI07CITJzu9dKzYtH5fpy4rF7S
         g5Wcaf0iYKdBOxNs+5vNV22U0oMcdv1/wH/u3liA2oPqb5itfYQBjUxC7UsZzG3pYC+L
         Z4hw==
X-Gm-Message-State: AOAM531ebbq60FPHwvIKpEiMqsSsjn3xrUqRjHvkLxqPkEzOC1sG6+C9
        uks9GL8Gjckd/wGZ1ouA0OzM5xnVjboVyfR1HO9njrW+YYQ43XAG3XfGTXZvQcWKqZEw6M7LcHA
        regbUKFB3InpIl9h7lLyY
X-Received: by 2002:a5d:4648:: with SMTP id j8mr1356812wrs.131.1603120315532;
        Mon, 19 Oct 2020 08:11:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFIREbO6DezALO0JWKlg4qRoGscw71tin3lv0IQ+vqnXpANv4T2rRXqGWJt7uALR0ANL13wg==
X-Received: by 2002:a5d:4648:: with SMTP id j8mr1356789wrs.131.1603120315320;
        Mon, 19 Oct 2020 08:11:55 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id g4sm374295wmh.13.2020.10.19.08.11.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2020 08:11:54 -0700 (PDT)
Subject: Re: [PATCH] Documentation: kvm: fix a typo
To:     Li Qiang <liq3ea@163.com>, corbet@lwn.net, lnowakow@eng.ucsd.edu,
        kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     liq3ea@gmail.com
References: <20201001095333.7611-1-liq3ea@163.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a4339c95-8190-f477-381d-0617c74f9e9b@redhat.com>
Date:   Mon, 19 Oct 2020 17:11:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201001095333.7611-1-liq3ea@163.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 01/10/20 11:53, Li Qiang wrote:
> Fixes: e287d6de62f74 ("Documentation: kvm: Convert cpuid.txt to .rst")
> Signed-off-by: Li Qiang <liq3ea@163.com>
> ---
>  Documentation/virt/kvm/cpuid.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/virt/kvm/cpuid.rst b/Documentation/virt/kvm/cpuid.rst
> index a7dff9186bed..ff2b38d3e108 100644
> --- a/Documentation/virt/kvm/cpuid.rst
> +++ b/Documentation/virt/kvm/cpuid.rst
> @@ -62,7 +62,7 @@ KVM_FEATURE_PV_EOI                6           paravirtualized end of interrupt
>                                                handler can be enabled by
>                                                writing to msr 0x4b564d04
>  
> -KVM_FEATURE_PV_UNHAULT            7           guest checks this feature bit
> +KVM_FEATURE_PV_UNHALT             7           guest checks this feature bit
>                                                before enabling paravirtualized
>                                                spinlock support
>  
> 

Queued, thanks.

Paolo

