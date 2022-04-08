Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D73C43217
	for <linux-doc@archiver.kernel.org>; Fri,  8 Apr 2022 12:45:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235848AbiDHMrs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 8 Apr 2022 08:47:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235941AbiDHMrp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Apr 2022 08:47:45 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F0BDED9E7
        for <linux-doc@vger.kernel.org>; Fri,  8 Apr 2022 05:45:41 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id s4so4650922qkh.0
        for <linux-doc@vger.kernel.org>; Fri, 08 Apr 2022 05:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=n0Q03Y/eZmvD4gdqyNKPm3EQwhmNG2mz8mwozYTQaEw=;
        b=DXGaRsNTjOlC6moq6bFtHJK+OFb8JayyOqjhIFqjLBKYh4H+KjBdyxlXTRttGVUdpj
         IV6yeFaThuOFW0HyqpTWHnWlDDQsOoKz1LHeMESPiD+Zu0MHKqBtZ55OkzkEvbSLDkHr
         M6CBRhi5F38L6gyljRT4uBWN11BYsYNs2lGwMx5tnt8HkVZw7NUq9ExN2NHYUVofshZF
         Fzm9kYhfCYhQuFW1ZhvpCUNu2SqEPEuvuD1jsnbzcnDqJyVa3kqyFqsuXrkbKL+ZoK7k
         iOuQD/wbU8th/0iKaxOSKq92AQgkYZX9Re3WStH2yCGmAjeKj3tabBD0j/IntMcguZgX
         FxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=n0Q03Y/eZmvD4gdqyNKPm3EQwhmNG2mz8mwozYTQaEw=;
        b=7b4z0L722nOoEnTdyMcP7QaSaIiv9uXpdNgNrgcd2eOPUCCGzide51HoQbigumE8Zn
         98c9hOBfT05Hf9kDJ5AKmDXt1r1awEdR8EhVS6EDV1q3tpRcQIlUGbgUY02fAnY+59O5
         oaOYHbFtcsZkB91QglrGAsA2l8YQPv5nmc79AfEx+4W5jVWtPHEuK/kVa0J5BQWGn8n7
         cQQtCr8gD1Lm+kZMGXageQuZjFMwNpoAf5Ir2bAfKuTm4QHsZsq+PTwQEdfnF9eBqQEi
         TiE2pY+8BYUVeN48zshultY5HiIwVM1Gi6ec7FqSV1ChFgCIfVYCa6tN+Csk4lTNMxms
         KxVA==
X-Gm-Message-State: AOAM532jUZn9dGVkM2wZhwH3bVoQznAB0nbyvyY9n55zWfoHuLJ+uXpu
        KU4RcHPmGweNnJztNNRvOupZXA==
X-Google-Smtp-Source: ABdhPJxoiUP1tZ7KeNBPWAx2H5m7E3mW/0pyOPTv0wkEGMWe6jMBimeBnZDbkH6Rv5j9d7LBGVtYTw==
X-Received: by 2002:a05:620a:2681:b0:67e:933e:54b6 with SMTP id c1-20020a05620a268100b0067e933e54b6mr12895867qkp.428.1649421940184;
        Fri, 08 Apr 2022 05:45:40 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id c70-20020a379a49000000b0069bdce177e2sm979729qke.55.2022.04.08.05.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 05:45:37 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1ncnzc-00Eyq7-W4; Fri, 08 Apr 2022 09:45:37 -0300
Date:   Fri, 8 Apr 2022 09:45:36 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Matthew Rosato <mjrosato@linux.ibm.com>
Cc:     linux-s390@vger.kernel.org, alex.williamson@redhat.com,
        cohuck@redhat.com, schnelle@linux.ibm.com, farman@linux.ibm.com,
        pmorel@linux.ibm.com, borntraeger@linux.ibm.com, hca@linux.ibm.com,
        gor@linux.ibm.com, gerald.schaefer@linux.ibm.com,
        agordeev@linux.ibm.com, svens@linux.ibm.com, frankja@linux.ibm.com,
        david@redhat.com, imbrenda@linux.ibm.com, vneethv@linux.ibm.com,
        oberpar@linux.ibm.com, freude@linux.ibm.com, thuth@redhat.com,
        pasic@linux.ibm.com, pbonzini@redhat.com, corbet@lwn.net,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 16/21] KVM: vfio: add s390x hook to register KVM guest
 designation
Message-ID: <20220408124536.GX64706@ziepe.ca>
References: <20220404174349.58530-1-mjrosato@linux.ibm.com>
 <20220404174349.58530-17-mjrosato@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220404174349.58530-17-mjrosato@linux.ibm.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 04, 2022 at 01:43:44PM -0400, Matthew Rosato wrote:
> At the time a KVM is associated with a vfio group, s390x zPCI devices
> must register a special guest indication (GISA designation) to allow
> for the use of interpretive execution facilities.  This indication is
> used to ensure that only the specified KVM can interact with the device.
> Similarly, the indication must be removed once the KVM is no longer
> associated with the device.
> 
> This patch adds an s390-specific hook to invoke a KVM registration routine
> for each device associated with the iommu group; in reality, it will be a
> NOP for all but zPCI devices on s390x.
> 
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>  virt/kvm/vfio.c | 35 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)

I wonder if this should be done in the vfio_pci side from the existing
kvm notifier

Jason
