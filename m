Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC59EC76188
	for <linux-doc@archiver.kernel.org>; Mon,  3 Apr 2023 15:13:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232411AbjDCPNu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Apr 2023 11:13:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbjDCPNt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Apr 2023 11:13:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA8E12D6B
        for <linux-doc@vger.kernel.org>; Mon,  3 Apr 2023 08:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680534784;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oJGlwjdQBeHi6YLZ8ILA8VzHl25fpiQW6XX1UoDjDiE=;
        b=Loe/QdqzgaPQ2qctUsu7wLgp7P0jdihdOOO29RP9hO0SNybPxHGNrV0WDhGkihKjXUOnsg
        L0kkqKU3iThtIQmeBys8TCRd6fNaT6bapahtp+6aZLEJg4SEyWrIEBjATDvCmA9/RkUTtX
        kB+FCrD554y0FE9PST53+l3BnyjHCHs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-_IiorG74OjSH7kLn7cmqiQ-1; Mon, 03 Apr 2023 11:13:02 -0400
X-MC-Unique: _IiorG74OjSH7kLn7cmqiQ-1
Received: by mail-ed1-f70.google.com with SMTP id i22-20020a05640242d600b004f5962985f4so42294486edc.12
        for <linux-doc@vger.kernel.org>; Mon, 03 Apr 2023 08:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680534780; x=1683126780;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oJGlwjdQBeHi6YLZ8ILA8VzHl25fpiQW6XX1UoDjDiE=;
        b=IhGmYfCevRdQTsJsrOYM/f1sPJKcE5B4XXssS6zsqq8rqXp/gSIJfvuwk7vw0B6YA0
         NE0fOfmR7kXbpeLloEkL9mZEGlv4c1xQ7SLoRBcKr6p7PMkjZ+02PpJhlQb2sqR+sueR
         kvdpYGC15lB15VUsKXBdIE0HdX4Jq7apVf7agp6bJMtlHQWteLpmzCvh3ZbbsKX3oVab
         buVSVxX5+Zxr0hs6FwczVNMvFIvc51M9UyHTp7d3pKs8dKwg2eMrMW4OQ7wrMwxXeoul
         nPdaiZ1N0G3SKtxvnMNCXvC+/5ripVKnjsct5u8/FJN5TrZ/ThudfllK+ACYx9F06E93
         HPwg==
X-Gm-Message-State: AAQBX9cmraRpJ/ycVLcrxR/EzLsTu0P5OSSTFQr//3iAhmq3BnDOl0K7
        l6bnrDAPO39q09uiplq2GfCG1I6Mhq6ojiUiUNIyhtwm3BUZLbvRuoqPil+kwNlyYRcRPusrsFd
        Iu/3RksDF2RKBhfnYyUTQ
X-Received: by 2002:a05:6402:26d5:b0:4af:7bdc:188e with SMTP id x21-20020a05640226d500b004af7bdc188emr18470946edd.16.1680534780396;
        Mon, 03 Apr 2023 08:13:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350bIBqpFmu+8nIFsIAOCGXx5GXxWZehiLtPezZpI5dUmdWJJTcc9ck45XoV8kzig2i+Rj3SX9Q==
X-Received: by 2002:a05:6402:26d5:b0:4af:7bdc:188e with SMTP id x21-20020a05640226d500b004af7bdc188emr18470927edd.16.1680534780085;
        Mon, 03 Apr 2023 08:13:00 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id w26-20020a50d79a000000b005021d1ae6adsm4677928edi.28.2023.04.03.08.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 08:12:59 -0700 (PDT)
Message-ID: <2add5a7e-ae72-c8ab-181d-23c1731cb966@redhat.com>
Date:   Mon, 3 Apr 2023 17:12:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] docs: kvm: x86: Fix broken field list
Content-Language: en-US
To:     Takahiro Itazuri <itazur@amazon.com>, linux-kernel@vger.kernel.org
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        David Dunn <daviddunn@google.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Takahiro Itazuri <zulinx86@gmail.com>
References: <20230331093116.99820-1-itazur@amazon.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230331093116.99820-1-itazur@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 3/31/23 11:31, Takahiro Itazuri wrote:
> Add a missing ":" to fix a broken field list.
> 
> Signed-off-by: Takahiro Itazuri <itazur@amazon.com>
> Fixes: ba7bb663f554 ("KVM: x86: Provide per VM capability for disabling PMU virtualization")
> ---
> v1 -> v2
> * Fix commit message to say "Do foo" instead of "This commit does foo".
> * Add "Fixes:" tag.
> * Link to v1: https://lore.kernel.org/all/20230330233956.78246-1-itazur@amazon.com/
> 
>   Documentation/virt/kvm/api.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 62de0768d..f9163590c 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -8296,7 +8296,7 @@ ENOSYS for the others.
>   8.35 KVM_CAP_PMU_CAPABILITY
>   ---------------------------
>   
> -:Capability KVM_CAP_PMU_CAPABILITY
> +:Capability: KVM_CAP_PMU_CAPABILITY
>   :Architectures: x86
>   :Type: vm
>   :Parameters: arg[0] is bitmask of PMU virtualization capabilities.

Queued, thanks.

Paolo

