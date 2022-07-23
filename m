Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FAEBC43334
	for <linux-doc@archiver.kernel.org>; Sat, 23 Jul 2022 00:18:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231751AbiGWASK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 22 Jul 2022 20:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbiGWASJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 22 Jul 2022 20:18:09 -0400
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C0B887755B
        for <linux-doc@vger.kernel.org>; Fri, 22 Jul 2022 17:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658535485;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iEphr6ZIYFwSwZ4pYciMnV/Wf4dcsbYqo+HwMi5Di7E=;
        b=BMkb+MowpcA9AWBflrm3MortzhGqbtxIi9MmHxXMSCiP4Bks5nBKs8E/UY31xj0kemj3na
        fCwXABq4qIEWmPx12R1YyhqJJTlfioEit+ehzB9vgZ9nu+jbeoT7zPlXB+pHVSg32m/BeL
        LswSvtbZs2QTAWY0LOoGm2AOnIBmcYQ=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-0Ob3VQ39NUeoOfXEnQsLVg-1; Fri, 22 Jul 2022 20:18:04 -0400
X-MC-Unique: 0Ob3VQ39NUeoOfXEnQsLVg-1
Received: by mail-il1-f197.google.com with SMTP id e9-20020a056e020b2900b002dc6c27849cso3508164ilu.8
        for <linux-doc@vger.kernel.org>; Fri, 22 Jul 2022 17:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=iEphr6ZIYFwSwZ4pYciMnV/Wf4dcsbYqo+HwMi5Di7E=;
        b=orMVe1+Ubf6c2AgvxQEDDqqnttU2ANnoJEs4AV8B+b8yS1zyv7wfPnpzhCJyfny0CQ
         Mb8H9x+IV1y0pwX65e+6eHd8vSfrUMkiqOlStBpcy7oy2cOGeozLCRmvqDDaXKj8kDzd
         2CWMYU28hNrswbdgBpd97jPY2RGfsKcgDNgOKHqcen6K/UPl9We6oxfHYHznaCUe2STx
         v0KKfF9nJAZb8MuNMv6EefQDY6eq/B67wVvrakJvpOrDsIKsZPcQqk9OgIQ8yi0O2Q0Q
         Sry8qW0ZD6UtVKD4Avbu2yhS7TqvcVrFyMK46/YMCcSmux4NqIPzS7EoUFG9EDwQFFcm
         1amg==
X-Gm-Message-State: AJIora+UJiDEZ0l0CIxYxJt3cDjDyzUAeENqgm/2eKp9cnIbUK4D4X38
        z161xJtjK79seujPYGquL3fbkTCJWMCPZCRDjoSWo8bQT7I51002u5JFMEgYl2XOclJWsRDuHoq
        NyI2MQpmxHpueoou3M85Z
X-Received: by 2002:a05:6638:160c:b0:33f:54c7:ee69 with SMTP id x12-20020a056638160c00b0033f54c7ee69mr1050246jas.65.1658535483692;
        Fri, 22 Jul 2022 17:18:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vh5y3jozCZ7iRDuGEDUiaJjAA10VNoYNXKY4pR3tY8wyP5ioYAHZdpqHyeNFeMGRhrxZbgZA==
X-Received: by 2002:a05:6638:160c:b0:33f:54c7:ee69 with SMTP id x12-20020a056638160c00b0033f54c7ee69mr1050243jas.65.1658535483492;
        Fri, 22 Jul 2022 17:18:03 -0700 (PDT)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id n4-20020a056602340400b00674f9fb1531sm2752495ioz.30.2022.07.22.17.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 17:18:03 -0700 (PDT)
Date:   Fri, 22 Jul 2022 18:18:00 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Nicolin Chen <nicolinc@nvidia.com>
Cc:     <kwankhede@nvidia.com>, <corbet@lwn.net>, <hca@linux.ibm.com>,
        <gor@linux.ibm.com>, <agordeev@linux.ibm.com>,
        <borntraeger@linux.ibm.com>, <svens@linux.ibm.com>,
        <zhenyuw@linux.intel.com>, <zhi.a.wang@intel.com>,
        <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
        <rodrigo.vivi@intel.com>, <tvrtko.ursulin@linux.intel.com>,
        <airlied@linux.ie>, <daniel@ffwll.ch>, <farman@linux.ibm.com>,
        <mjrosato@linux.ibm.com>, <pasic@linux.ibm.com>,
        <vneethv@linux.ibm.com>, <oberpar@linux.ibm.com>,
        <freude@linux.ibm.com>, <akrowiak@linux.ibm.com>,
        <jjherne@linux.ibm.com>, <cohuck@redhat.com>, <jgg@nvidia.com>,
        <kevin.tian@intel.com>, <hch@infradead.org>,
        <jchrist@linux.ibm.com>, <kvm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-s390@vger.kernel.org>,
        <intel-gvt-dev@lists.freedesktop.org>,
        <intel-gfx@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <terrence.xu@intel.com>
Subject: Re: [PATCH v3 00/10] Update vfio_pin/unpin_pages API
Message-ID: <20220722181800.56093444.alex.williamson@redhat.com>
In-Reply-To: <Ytsu07eGHS9B7HY8@Asurada-Nvidia>
References: <20220708224427.1245-1-nicolinc@nvidia.com>
        <20220722161129.21059262.alex.williamson@redhat.com>
        <Ytsu07eGHS9B7HY8@Asurada-Nvidia>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 22 Jul 2022 16:12:19 -0700
Nicolin Chen <nicolinc@nvidia.com> wrote:

> On Fri, Jul 22, 2022 at 04:11:29PM -0600, Alex Williamson wrote:
> 
> > GVT-g explodes for me with this series on my Broadwell test system,
> > continuously spewing the following:  
> 
> Thank you for running additional tests.
> 
> > [   47.348778] WARNING: CPU: 3 PID: 501 at drivers/vfio/vfio_iommu_type1.c:978 vfio_iommu_type1_unpin_pages+0x7b/0x100 [vfio_iommu_type1]  
>  
> > Line 978 is the WARN_ON(i != npage) line.  For the cases where we don't
> > find a matching vfio_dma, I'm seeing addresses that look maybe like
> > we're shifting  a value that's already an iova by PAGE_SHIFT somewhere.  
> 
> Hmm..I don't understand the PAGE_SHIFT part. Do you mind clarifying?

The iova was a very large address for a 4GB VM with a lot of zeros on
the low order bits, ex. 0x162459000000.  Thanks,

Alex
 
> And GVT code initiated an unpin request from gvt_unpin_guest_pag()
> that is currently unpinning one page at a time on a contiguous IOVA
> range, prior to this series. After this series, it leaves the per-
> page routine to the internal loop of vfio_iommu_type1_unpin_pages(),
> which is supposed to do the same.
> 
> So, either resulted from the npage input being wrong or some other
> factor weighed in that invoked a vfio_remove_dma on those iovas?
> 
> Thanks
> Nic
> 

