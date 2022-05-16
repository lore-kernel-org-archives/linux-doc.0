Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D45EC433F5
	for <linux-doc@archiver.kernel.org>; Mon, 16 May 2022 19:39:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345565AbiEPTjt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 16 May 2022 15:39:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345609AbiEPTi5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 May 2022 15:38:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A725C3F88F
        for <linux-doc@vger.kernel.org>; Mon, 16 May 2022 12:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652729924;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+tK7o+o7Kj2BQK1w3k57mXkaPLoN/4QFNnxgOKxEuBU=;
        b=Z+2smTLF8dOMbtm4CN6e0vhtAdMDt409pnyseY0ANHIlVecxFTquOsbs2br2z318hBOqg1
        G92oFCyFGygQmQSZjAmxB21lJ3/0vK4Ue51nakxm6rASUBnyB3w4k0JRoJPsRx342E4zqs
        M3bdkAkrDKXOeVSZDe1VLAX0QJRtDmA=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-tX_IfpenNZ25_BkRvGPPNw-1; Mon, 16 May 2022 15:38:42 -0400
X-MC-Unique: tX_IfpenNZ25_BkRvGPPNw-1
Received: by mail-il1-f198.google.com with SMTP id j4-20020a056e02154400b002d113a19116so2051077ilu.1
        for <linux-doc@vger.kernel.org>; Mon, 16 May 2022 12:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=+tK7o+o7Kj2BQK1w3k57mXkaPLoN/4QFNnxgOKxEuBU=;
        b=P4Ynmv7bUqfdCsPVcb5iHWO5Yep2hmG5MXygaSPGXI7REkM0cjVWzz5As+21c/g+XE
         6eJ7xwTG0MhB+jo5GDwuniSxOTBdeOTB8VWXN6HvABGoKCTvc0eVWnKLVYg21rfIdna+
         pOXv48hO3P1qfcL0Q0PKLq3z44ObSNUvD4ABmHj5ul41exTxPnoinWocHD+lR5DX3XRM
         9TLAATrdAd5+GCfsi3TAuQsn9K7IXBpSZPX9TiJwRIvqTd9wFKNAAYzRGXvSBcXwAcA5
         mG/6Sk2HjwDV5pvgLgw9xbtoHr2uRnGOuJA7V/+SXbTIF7XSZb3RZn3paAjcD1aVngHW
         2JdA==
X-Gm-Message-State: AOAM533HFZ6d/KLLpVYit4yhdIA0iljLJtsdHGn2VLVdEALmQtJCNfvq
        7m2OnWghVTWDiAnu2RzMJxgr/TNidLIPhT6Bwobg5zJXgSPvuJu2Gjh9lPJ++EB2vV8pXAIYE/F
        VbzQUpytpqNrop03sjlTQ
X-Received: by 2002:a05:6638:41a9:b0:32e:415a:a8a9 with SMTP id az41-20020a05663841a900b0032e415aa8a9mr2168797jab.101.1652729921714;
        Mon, 16 May 2022 12:38:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1ASRKUsHnS3u0hy5oNZdsYdaQJ/MYozulGQvgUeh7FSJ+d//YDvBT7RymfdniEX5hlCY/9Q==
X-Received: by 2002:a05:6638:41a9:b0:32e:415a:a8a9 with SMTP id az41-20020a05663841a900b0032e415aa8a9mr2168777jab.101.1652729921515;
        Mon, 16 May 2022 12:38:41 -0700 (PDT)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id v20-20020a02b914000000b0032e049b2949sm2803562jan.101.2022.05.16.12.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 12:38:41 -0700 (PDT)
Date:   Mon, 16 May 2022 13:38:39 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Matthew Rosato <mjrosato@linux.ibm.com>,
        linux-s390@vger.kernel.org, cohuck@redhat.com,
        schnelle@linux.ibm.com, farman@linux.ibm.com, pmorel@linux.ibm.com,
        borntraeger@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com,
        gerald.schaefer@linux.ibm.com, agordeev@linux.ibm.com,
        svens@linux.ibm.com, frankja@linux.ibm.com, david@redhat.com,
        imbrenda@linux.ibm.com, vneethv@linux.ibm.com,
        oberpar@linux.ibm.com, freude@linux.ibm.com, thuth@redhat.com,
        pasic@linux.ibm.com, pbonzini@redhat.com, corbet@lwn.net,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 17/22] vfio-pci/zdev: add open/close device hooks
Message-ID: <20220516133839.7e116489.alex.williamson@redhat.com>
In-Reply-To: <20220516183558.GN1343366@nvidia.com>
References: <20220513191509.272897-1-mjrosato@linux.ibm.com>
        <20220513191509.272897-18-mjrosato@linux.ibm.com>
        <20220516172734.GE1343366@nvidia.com>
        <7a31ec36-ceaf-dcef-8bd0-2b4732050aed@linux.ibm.com>
        <20220516183558.GN1343366@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 16 May 2022 15:35:58 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Mon, May 16, 2022 at 02:30:46PM -0400, Matthew Rosato wrote:
> 
> > Conceptually I think this would work for QEMU anyway (it always sets the kvm
> > before we open the device).  I tried to test the idea quickly but couldn't
> > get the following to apply on vfio-next or your vfio_group_locking -- but I
> > understand what you're trying to do so I'll re-work and try it out.  
> 
> I created it on 8c9350e9bf43de1ebab3cc8a80703671e6495ab4 which is the
> vfio_group_locking.. I can send you a github if it helps
> https://github.com/jgunthorpe/linux/commits/vfio_group_lockin
> 
> > @Alex can you think of any usecase/reason why we would need to be able to
> > set the KVM sometime after the device was opened?  Doing something like
> > below would break that, as this introduces the assumption that the group is
> > associated with the KVM before the device is opened (and if it's not, the
> > device open fails).  
> 
> Keep in mind that GVT already hard requires this ordering to even
> allow open_device to work - so it already sets a floor for what
> userspace can do..

How is this going to work when vfio devices are exposed directly?  We
currently have a strict ordering through the group to get to the
device, and it's therefore a reasonable requirement for userspace to
register the group with kvm before opening the device.  Is the notifier
and async KVM registration necessary to support this dependency with
direct device access?  I don't have as clear a picture of the ordering
with with direct access.  Thanks,

Alex

