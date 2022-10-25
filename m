Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC7DC38A2D
	for <linux-doc@archiver.kernel.org>; Tue, 25 Oct 2022 12:01:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbiJYMBc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 25 Oct 2022 08:01:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230040AbiJYMBa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Oct 2022 08:01:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A2267D792
        for <linux-doc@vger.kernel.org>; Tue, 25 Oct 2022 05:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666699288;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3NP8R3IYLYmihDVV7WTD3Rj7jwPsio2DD4wfaKkI+8g=;
        b=JSV+/cRzYuIgiYjc3qbQkkYSmv96f3VvT/diGYSkUjjqH8hEYzlCW7rHr9qbcsJjZCyA20
        Uyge91VgeY3ZzmdPbHGT0OvG7Hc8TUbPMXDLeprW62o07XFY6TuM0uaFKe4DfnWxJiukmt
        u2yO4IA48DWRX8FygQwlOfJJSotC6Pk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-160-hQf31lrKPfaxYzCqk0ZGgQ-1; Tue, 25 Oct 2022 08:01:27 -0400
X-MC-Unique: hQf31lrKPfaxYzCqk0ZGgQ-1
Received: by mail-ej1-f71.google.com with SMTP id hr26-20020a1709073f9a00b007a20c586f1eso1536289ejc.20
        for <linux-doc@vger.kernel.org>; Tue, 25 Oct 2022 05:01:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to
         :content-language:subject:cc:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3NP8R3IYLYmihDVV7WTD3Rj7jwPsio2DD4wfaKkI+8g=;
        b=UaF2mtNwNUtT3XAGLhgGvCNJA/rsQmnaR7Fqm4DBYUncGNLpsF748++ZyV8JQaUMNM
         3idGcBme47aRl2vlP8opRGX5vFkBmRNc4vc4mfx7Gonn2BzGEEBq4JpTmDIoTz+Ipr0j
         K1ZzfbdOuIJqibyp2GJFq8qyDM9PBKM2n758iPqZuYsDLfQTvYFcbmIAqjgBkO3Ay0Gj
         c5P2qscMi0rVShUvU8j7EqOoNrHryfuQAfBgPCheuTr9qNV2gl1O/6WNfU11/3DqsJe5
         9YQLurGh1cInc6fE6kRBYGBJJU/D+CynzACX/6g32p/EvTR3YgtWnIM8bzsmBZbyhlTy
         VbZw==
X-Gm-Message-State: ACrzQf0M24rhOVGwSoFKYbh5GukJzuXrYXGGPDecctiLsh+Yl8Wxaf2O
        7QR4AxCp+wp7mvnTm54HDca12YD1IX6W0gbLaL63mDL1N5Yj+12Qws8HEjt/pF1dbIVrj3eRgPl
        dMC1xrqr1bynABYcSoFAz
X-Received: by 2002:a05:6402:371b:b0:460:ff7d:f511 with SMTP id ek27-20020a056402371b00b00460ff7df511mr25245229edb.148.1666699285911;
        Tue, 25 Oct 2022 05:01:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4ByvT9CqolkhMMGCNXFGUXy8yFRrjzmrcPaD532k849sniIIwZYUM7s8f6bl8PHwOomnxrwg==
X-Received: by 2002:a05:6402:371b:b0:460:ff7d:f511 with SMTP id ek27-20020a056402371b00b00460ff7df511mr25245210edb.148.1666699285731;
        Tue, 25 Oct 2022 05:01:25 -0700 (PDT)
Received: from [192.168.41.200] (83-90-141-187-cable.dk.customer.tdc.net. [83.90.141.187])
        by smtp.gmail.com with ESMTPSA id d25-20020aa7d699000000b00461c375d88csm1473403edr.97.2022.10.25.05.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 05:01:24 -0700 (PDT)
From:   Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <62d3043f-51cc-b003-1a43-43550641cfd9@redhat.com>
Date:   Tue, 25 Oct 2022 14:01:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Cc:     brouer@redhat.com, Lorenzo Bianconi <lorenzo@kernel.org>
Subject: Re: [PATCH bpf-next v1 1/1] docs: BPF_MAP_TYPE_CPUMAP
Content-Language: en-US
To:     mtahhan@redhat.com, bpf@vger.kernel.org, linux-doc@vger.kernel.org
References: <20221021093050.2711300-1-mtahhan@redhat.com>
In-Reply-To: <20221021093050.2711300-1-mtahhan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 21/10/2022 11.30, mtahhan@redhat.com wrote:
> From: Maryam Tahhan <mtahhan@redhat.com>
> 
> Add documentation for BPF_MAP_TYPE_CPUMAP including
> kernel version introduced, usage and examples.
> 
> Signed-off-by: Maryam Tahhan <mtahhan@redhat.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>   Documentation/bpf/map_cpumap.rst | 166 +++++++++++++++++++++++++++++++
>   1 file changed, 166 insertions(+)
>   create mode 100644 Documentation/bpf/map_cpumap.rst

I was about to complain that this needed to be linked in file 
Documentation/bpf/maps.rst, but it seems it gets wildcard included.

I see Toke already gave you some feedback to address, so I'll wait for 
the next version to review.

--Jesper

