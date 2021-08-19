Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F9E4C4338F
	for <linux-doc@archiver.kernel.org>; Thu, 19 Aug 2021 21:38:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28AF6610A0
	for <linux-doc@archiver.kernel.org>; Thu, 19 Aug 2021 21:38:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbhHSVjc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 Aug 2021 17:39:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36488 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229619AbhHSVjb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Aug 2021 17:39:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629409134;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nBzgR7XCkOLtoH5Yvb/WeoEepDn8l0sH9+YEvlAnXq8=;
        b=KU+n2ErUKSTPKaXu88iuo/2bj9UQpxiKptSDWKlFS4KH+ESb5V4s1dLoTquBgA2dxgbp++
        GOupbhiOG2WrYgjn/w2UUdWKU3aCNCMRXtiSerLT7NlktK7hIIMlUawBcKt9xEX6gumAvD
        NqIskeeL9aX1Fh50EP6p6g/IFLjMbyc=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-a9asPX0RPyGyUoLH-8mYHw-1; Thu, 19 Aug 2021 17:38:52 -0400
X-MC-Unique: a9asPX0RPyGyUoLH-8mYHw-1
Received: by mail-oo1-f71.google.com with SMTP id s20-20020a4aead40000b029028b41986b27so3285755ooh.14
        for <linux-doc@vger.kernel.org>; Thu, 19 Aug 2021 14:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nBzgR7XCkOLtoH5Yvb/WeoEepDn8l0sH9+YEvlAnXq8=;
        b=NaCVTU7a9XtQoRg6YA6SYyP/dvXBRPABvSBICmgCa3w5Cr7Z9j8qkkfuc7ihR0OITM
         3EgZzhDI5hakywyLaCs8X4TAvlgXuI/wIBPdXt/85DahqC7eFqzYGiBJWYA7wBog/Lon
         fsznUD56eiiGutgH/KdkhDuC0VbVJ44eZaqKtiO7EVIAC3HFham3IK6TJPVrjw0C3s25
         ewVSkV3GKpGXk4uFmlZBlbNEIbP5BB1l20k8b+7VsczvaYaBMHpELwKymI9SZfxshZBT
         BUcEEP51hfxrCnLpmq8TSXjI4zsQXxORR0DNV04qEdhAhgjLfm6iO8dMzM3Dn+0HOzYd
         EXww==
X-Gm-Message-State: AOAM533jdCr0v0LLgee8j9IYgYzbDx8/TYAXasPsdUmgZGXo3N7OqlDN
        8JxkXsCq2pOrc3HtWKzTW86sXohJ3MFCdMFeZLVpBkD++snEjayNAYqoTxReFnz0RcZEbc5Pm5l
        1UHdpdmX0XG3+272gtrcN
X-Received: by 2002:a05:6830:25ce:: with SMTP id d14mr13997897otu.87.1629409131797;
        Thu, 19 Aug 2021 14:38:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXo86cMZwiteRgztCDTbYxT83N7YNWeCuTuo1Gafd50BVVBx8Z/pbVTsnabs0y+xWiACesDA==
X-Received: by 2002:a05:6830:25ce:: with SMTP id d14mr13997878otu.87.1629409131629;
        Thu, 19 Aug 2021 14:38:51 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
        by smtp.gmail.com with ESMTPSA id g16sm968289otr.20.2021.08.19.14.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 14:38:51 -0700 (PDT)
Date:   Thu, 19 Aug 2021 15:38:49 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Yishai Hadas <yishaih@nvidia.com>
Cc:     <bhelgaas@google.com>, <corbet@lwn.net>,
        <diana.craciun@oss.nxp.com>, <kwankhede@nvidia.com>,
        <eric.auger@redhat.com>, <masahiroy@kernel.org>,
        <michal.lkml@markovi.net>, <linux-pci@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <kvm@vger.kernel.org>,
        <linux-s390@vger.kernel.org>, <linux-kbuild@vger.kernel.org>,
        <mgurtovoy@nvidia.com>, <jgg@nvidia.com>, <maorg@nvidia.com>,
        <leonro@nvidia.com>
Subject: Re: [PATCH V2 06/12] vfio/pci: Split the pci_driver code out of
 vfio_pci_core.c
Message-ID: <20210819153849.1e1ffc83.alex.williamson@redhat.com>
In-Reply-To: <20210819151235.6fe61269.alex.williamson@redhat.com>
References: <20210818151606.202815-1-yishaih@nvidia.com>
        <20210818151606.202815-7-yishaih@nvidia.com>
        <20210819151235.6fe61269.alex.williamson@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 19 Aug 2021 15:12:35 -0600
Alex Williamson <alex.williamson@redhat.com> wrote:

> On Wed, 18 Aug 2021 18:16:00 +0300
> Yishai Hadas <yishaih@nvidia.com> wrote:
> > +
> > +static int vfio_pci_sriov_configure(struct pci_dev *pdev, int nr_virtfn)
> > +{
> > +	might_sleep();  
> 
> vfio_pci_core_sriov_configure() retained the might_sleep(), it
> shouldn't be needed here.
> 
> > +
> > +	if (!enable_sriov)
> > +		return -ENOENT;
> > +
> > +	return vfio_pci_core_sriov_configure(pdev, nr_virtfn);
> > +}  
> ...
> > @@ -509,7 +449,7 @@ static struct vfio_pci_core_device *get_pf_vdev(struct vfio_pci_core_device *vde
> >  	if (!pf_dev)
> >  		return NULL;
> >  
> > -	if (pci_dev_driver(physfn) != &vfio_pci_driver) {
> > +	if (pci_dev_driver(physfn) != pci_dev_driver(vdev->pdev)) {  
> 
> I think this means that the PF and VF must use the same vfio-pci
> "variant" driver, it's too bad we're not enabling vfio-pci to own the
> PF while vfio-vendor-foo-pci owns the VF since our SR-IOV security
> model remains in the core.  We can work on that later though, no loss
> of functionality here.
> 
> ...
> > @@ -1795,12 +1723,12 @@ static int vfio_pci_bus_notifier(struct notifier_block *nb,
> >  		pci_info(vdev->pdev, "Captured SR-IOV VF %s driver_override\n",
> >  			 pci_name(pdev));
> >  		pdev->driver_override = kasprintf(GFP_KERNEL, "%s",
> > -						  vfio_pci_ops.name);
> > +						  vdev->vdev.ops->name);
> >  	} else if (action == BUS_NOTIFY_BOUND_DRIVER &&
> >  		   pdev->is_virtfn && physfn == vdev->pdev) {
> >  		struct pci_driver *drv = pci_dev_driver(pdev);
> >  
> > -		if (drv && drv != &vfio_pci_driver)
> > +		if (drv && drv != pci_dev_driver(vdev->pdev))
> >  			pci_warn(vdev->pdev,
> >  				 "VF %s bound to driver %s while PF bound to vfio-pci\n",  
> 
> "vfio-pci" is hardcoded in this comment.  There are a few other user
> visible instances of this in vfio-pci-core.c as well:
> 
> MODULE_PARM_DESC(disable_vga, "Disable VGA resource access through vfio-pci");

I see this one is resolved in a later patch.  Thanks,

Alex

> 
>                 ret = pci_request_selected_regions(pdev,
>                                                    1 << index, "vfio-pci");
> 
>                         pci_info_ratelimited(vdev->pdev,
>                                 "VF token incorrectly provided, PF not bound to vfio-pci\n");
> 
> We should try to fix or reword as many of these as we reasonably can.
> Thanks,
> 
> Alex

