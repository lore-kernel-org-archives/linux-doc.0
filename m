Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE2BC4338F
	for <linux-doc@archiver.kernel.org>; Mon, 26 Jul 2021 12:26:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 900A860F44
	for <linux-doc@archiver.kernel.org>; Mon, 26 Jul 2021 12:26:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233968AbhGZLpy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Jul 2021 07:45:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45557 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233859AbhGZLpy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Jul 2021 07:45:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627302383;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yAG0xqQccUP+f+kw+pTAihdi2ZzJSxeVDJcF4UMu+5c=;
        b=PMK/07gOm+XTU6g7ldzBrbrnvRpFnNhSn0OWBT263FaqOqfO6S7qpOS0KSo8FMLnk5599x
        fFpzTcM/kaNmgyW81douPvG4P2vv8p57SgIfB31VJ6n2pq+oOHIR4JRaGEm4SE/Nc7VZu/
        lLBtW7NhmINwu8YhmZwU28s/n528a2c=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-h45bTW2-NAWi6ob81VOhew-1; Mon, 26 Jul 2021 08:26:21 -0400
X-MC-Unique: h45bTW2-NAWi6ob81VOhew-1
Received: by mail-ed1-f70.google.com with SMTP id s8-20020a0564020148b02903948b71f25cso4650031edu.4
        for <linux-doc@vger.kernel.org>; Mon, 26 Jul 2021 05:26:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yAG0xqQccUP+f+kw+pTAihdi2ZzJSxeVDJcF4UMu+5c=;
        b=sGLSMbfUvPuzNS8nhkGx3EwtJe9j/1inon4aeZdf9ZeuR9Bkxl32Tv0wV52xl/vWXv
         ITg9pmYKkhGLkcV4c/rH7C/6BLazAWDaD+hH/0AkKi1NtTukij3tLCtVc5jhoLb3HO8M
         md0Dp2DdP0oBMatDWBvfdAZQZ7to4OxtB4Rm95fo1eWzT7xjEbzxaRuUPUpCjMWqs5ZI
         NDz42DST5NgQmAmKCz0ng/MdA9RS5r1Zn4CGRE/tY+J754my4dKSKKcwm/R/PGCIU7Ao
         ZNahJQhbr8iWE+PhY9k/77WzUvAOYKh/T9yijKF6TdsRMTyWOhfXxrCa1mX/ZE0WGEfn
         l9qw==
X-Gm-Message-State: AOAM5338zAOOzN/StjiNmbpVhrNlMI12s8hV5TzCBhcOfZ2G7+FOZ2X1
        pG5fLbKtY4YXNp0raCXOC4fLT0mRYqI2PEP3ddujIOriNaZQaldgXC4KjNmbBOnj5dPsw019HXY
        8/r0NX/FKSl0rc+to805u
X-Received: by 2002:a05:6402:424e:: with SMTP id g14mr21291849edb.364.1627302380128;
        Mon, 26 Jul 2021 05:26:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqkwdPnaViy67oIjfnoktBLJlDQUHjdW1FLT6+T736sxyjwJBwk4dpFQzX7c9cnngwMutAlQ==
X-Received: by 2002:a05:6402:424e:: with SMTP id g14mr21291836edb.364.1627302379979;
        Mon, 26 Jul 2021 05:26:19 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id g23sm18681156edp.90.2021.07.26.05.26.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jul 2021 05:26:19 -0700 (PDT)
Subject: Re: [PATCH 3/3] docs: virt: kvm: api.rst: replace some characters
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     kvm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1626947264.git.mchehab+huawei@kernel.org>
 <ff70cb42d63f3a1da66af1b21b8d038418ed5189.1626947264.git.mchehab+huawei@kernel.org>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <33d0dd04-15ba-9d32-c73f-9d086cd3e458@redhat.com>
Date:   Mon, 26 Jul 2021 14:26:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ff70cb42d63f3a1da66af1b21b8d038418ed5189.1626947264.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 22/07/21 11:50, Mauro Carvalho Chehab wrote:
> The conversion tools used during DocBook/LaTeX/html/Markdown->ReST
> conversion and some cut-and-pasted text contain some characters that
> aren't easily reachable on standard keyboards and/or could cause
> troubles when parsed by the documentation build system.
> 
> Replace the occurences of the following characters:
> 
> 	- U+00a0 (' '): NO-BREAK SPACE
> 	  as it can cause lines being truncated on PDF output
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>   Documentation/virt/kvm/api.rst | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)

Queued, thanks.

Paolo

> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index c7b165ca70b6..3a6118540747 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -855,7 +855,7 @@ in-kernel irqchip (GIC), and for in-kernel irqchip can tell the GIC to
>   use PPIs designated for specific cpus.  The irq field is interpreted
>   like this::
>   
> -  bits:  |  31 ... 28  | 27 ... 24 | 23  ... 16 | 15 ... 0 |
> +  bits:  |  31 ... 28  | 27 ... 24 | 23  ... 16 | 15 ... 0 |
>     field: | vcpu2_index | irq_type  | vcpu_index |  irq_id  |
>   
>   The irq_type field has the following values:
> @@ -2149,10 +2149,10 @@ prior to calling the KVM_RUN ioctl.
>   Errors:
>   
>     ======   ============================================================
> -  ENOENT   no such register
> -  EINVAL   invalid register ID, or no such register or used with VMs in
> +  ENOENT   no such register
> +  EINVAL   invalid register ID, or no such register or used with VMs in
>              protected virtualization mode on s390
> -  EPERM    (arm64) register access not allowed before vcpu finalization
> +  EPERM    (arm64) register access not allowed before vcpu finalization
>     ======   ============================================================
>   
>   (These error codes are indicative only: do not rely on a specific error
> @@ -2590,10 +2590,10 @@ following id bit patterns::
>   Errors include:
>   
>     ======== ============================================================
> -  ENOENT   no such register
> -  EINVAL   invalid register ID, or no such register or used with VMs in
> +  ENOENT   no such register
> +  EINVAL   invalid register ID, or no such register or used with VMs in
>              protected virtualization mode on s390
> -  EPERM    (arm64) register access not allowed before vcpu finalization
> +  EPERM    (arm64) register access not allowed before vcpu finalization
>     ======== ============================================================
>   
>   (These error codes are indicative only: do not rely on a specific error
> @@ -3112,13 +3112,13 @@ current state.  "addr" is ignored.
>   Errors:
>   
>     ======     =================================================================
> -  EINVAL     the target is unknown, or the combination of features is invalid.
> -  ENOENT     a features bit specified is unknown.
> +  EINVAL     the target is unknown, or the combination of features is invalid.
> +  ENOENT     a features bit specified is unknown.
>     ======     =================================================================
>   
>   This tells KVM what type of CPU to present to the guest, and what
> -optional features it should have.  This will cause a reset of the cpu
> -registers to their initial values.  If this is not called, KVM_RUN will
> +optional features it should have.  This will cause a reset of the cpu
> +registers to their initial values.  If this is not called, KVM_RUN will
>   return ENOEXEC for that vcpu.
>   
>   The initial values are defined as:
> @@ -3239,8 +3239,8 @@ VCPU matching underlying host.
>   Errors:
>   
>     =====      ==============================================================
> -  E2BIG      the reg index list is too big to fit in the array specified by
> -             the user (the number required will be written into n).
> +  E2BIG      the reg index list is too big to fit in the array specified by
> +             the user (the number required will be written into n).
>     =====      ==============================================================
>   
>   ::
> @@ -3288,7 +3288,7 @@ specific device.
>   ARM/arm64 divides the id field into two parts, a device id and an
>   address type id specific to the individual device::
>   
> -  bits:  | 63        ...       32 | 31    ...    16 | 15    ...    0 |
> +  bits:  | 63        ...       32 | 31    ...    16 | 15    ...    0 |
>     field: |        0x00000000      |     device id   |  addr type id  |
>   
>   ARM/arm64 currently only require this when using the in-kernel GIC
> 

