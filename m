Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D62BECCA486
	for <linux-doc@archiver.kernel.org>; Wed,  8 Jun 2022 06:54:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233591AbiFHGyZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Jun 2022 02:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233451AbiFHGQk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Jun 2022 02:16:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 57219646E
        for <linux-doc@vger.kernel.org>; Tue,  7 Jun 2022 23:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654668055;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=K4EmZpbnZG2iGxtLA1wEpmaCgsZIV0Qp3tq0M8QVlG4=;
        b=GC/bfxzy96M93D9kSfBI5C9RrkrsuIWUiwyP6wWNZxeaZnqf/4ERA8i0mukBJbVtFzPn7v
        XLI3F8ggR4rtjKb4k8eH2jypcmBSyesjfxyLNGubCy8iYE1o+UGSc7P6eGPGoFrJ07Aw47
        k3XaNMtJ1uYV+rh68JbGF1T+c2fXIBU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-S5xYTLnuO_27erxdDeFhQA-1; Wed, 08 Jun 2022 02:00:53 -0400
X-MC-Unique: S5xYTLnuO_27erxdDeFhQA-1
Received: by mail-wr1-f69.google.com with SMTP id h2-20020adfe982000000b002102da95c71so4382219wrm.23
        for <linux-doc@vger.kernel.org>; Tue, 07 Jun 2022 23:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=K4EmZpbnZG2iGxtLA1wEpmaCgsZIV0Qp3tq0M8QVlG4=;
        b=QjV4E2xcI41+MQhUb7JmnbIOnKdsQg7BPoFGZ35TLCUom1sU/AOrSIH1L9Bj5FPtHj
         0mvCIrx20HUxBDqLo32LV96RT4blQtiPXhHudWYY/LrXz99/1SI6sn+XyQw/dvkqSWqf
         JfrmHbfY68SIIyerbH44/KN38clwqcuTzixtmLMbJaUZ2Uh64f1fkX8sXWpLl6IptQ68
         Yn0VpxDGfGm7ELnBnmBtn/uxTrIq9bRQ8yWm8nRgCpVJ41slvXfIMrscy+LSyOFIP9YY
         3ONXrB79hP2tWckUm1z5uacp3FStgMCcrM+jPON3y5fHLWMrYXqxGXun4xz6JnyM9S7N
         rF2Q==
X-Gm-Message-State: AOAM531ZrOBaceD/mOnw6YWlCOG6R9xv/8ehJ7UhlS2zUDM82JrGeJkZ
        +zb1JnRdDfq5mNAT4mNBqI83WaQ3m3XN/ovFF9fHP751u8XbH9Pqfn+nB4f3AB6hWRSlor+nTK1
        8LzlVjTs1KcVq/UVRBPYU
X-Received: by 2002:adf:9cc2:0:b0:20f:e59a:ec41 with SMTP id h2-20020adf9cc2000000b0020fe59aec41mr31401232wre.124.1654668052535;
        Tue, 07 Jun 2022 23:00:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHQplGnELB+79hF5tZieuRC/jNvYpvm+mt9Ta1KGoefr17nHK6bc6qds9St+Vp2bqRhwe1fg==
X-Received: by 2002:adf:9cc2:0:b0:20f:e59a:ec41 with SMTP id h2-20020adf9cc2000000b0020fe59aec41mr31401201wre.124.1654668052305;
        Tue, 07 Jun 2022 23:00:52 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-42-114-66.web.vodafone.de. [109.42.114.66])
        by smtp.gmail.com with ESMTPSA id h12-20020a05600c2cac00b0039749256d74sm27609665wmc.2.2022.06.07.23.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 23:00:51 -0700 (PDT)
Message-ID: <7350ca00-2dbe-f92c-ee28-9b0438051171@redhat.com>
Date:   Wed, 8 Jun 2022 08:00:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     Matthew Rosato <mjrosato@linux.ibm.com>, linux-s390@vger.kernel.org
Cc:     alex.williamson@redhat.com, cohuck@redhat.com,
        schnelle@linux.ibm.com, farman@linux.ibm.com, pmorel@linux.ibm.com,
        borntraeger@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com,
        gerald.schaefer@linux.ibm.com, agordeev@linux.ibm.com,
        svens@linux.ibm.com, frankja@linux.ibm.com, david@redhat.com,
        imbrenda@linux.ibm.com, vneethv@linux.ibm.com,
        oberpar@linux.ibm.com, freude@linux.ibm.com, pasic@linux.ibm.com,
        pbonzini@redhat.com, corbet@lwn.net, jgg@nvidia.com,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20220606203325.110625-1-mjrosato@linux.ibm.com>
 <20220606203325.110625-21-mjrosato@linux.ibm.com>
From:   Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v9 20/21] KVM: s390: add KVM_S390_ZPCI_OP to manage guest
 zPCI devices
In-Reply-To: <20220606203325.110625-21-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 06/06/2022 22.33, Matthew Rosato wrote:
> The KVM_S390_ZPCI_OP ioctl provides a mechanism for managing
> hardware-assisted virtualization features for s390x zPCI passthrough.
> Add the first 2 operations, which can be used to enable/disable
> the specified device for Adapter Event Notification interpretation.
> 
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>   Documentation/virt/kvm/api.rst | 47 +++++++++++++++++++
>   arch/s390/kvm/kvm-s390.c       | 16 +++++++
>   arch/s390/kvm/pci.c            | 85 ++++++++++++++++++++++++++++++++++
>   arch/s390/kvm/pci.h            |  2 +
>   include/uapi/linux/kvm.h       | 31 +++++++++++++
>   5 files changed, 181 insertions(+)

Reviewed-by: Thomas Huth <thuth@redhat.com>

