Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972C9C48BE8
	for <linux-doc@archiver.kernel.org>; Tue, 15 Jun 2021 19:35:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 70085613B1
	for <linux-doc@archiver.kernel.org>; Tue, 15 Jun 2021 19:35:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbhFOTh7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Jun 2021 15:37:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57694 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230205AbhFOTh7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Jun 2021 15:37:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623785754;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Lqcix6Bye8GfBWjf8v07rNQNvUDYKUaSMsD+NDsgZyo=;
        b=KDLOo2dg0pTyT1QXDRrA8LF/5vwPbXSts436ShGnyMiTZxzSdaG1LqKOPRy6PNeNYwmGJF
        XM7LfLrJrsp2I/zU/suMXBPsPRpFPNJTYaTURfAZO/QcIutYpj9vIWUPupJztqOc2nLRfO
        kImByLwrPCNJCxdA8DCnMwk/1YG0nfQ=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-03qa8LnMMAuHG24AUuWqUQ-1; Tue, 15 Jun 2021 15:35:52 -0400
X-MC-Unique: 03qa8LnMMAuHG24AUuWqUQ-1
Received: by mail-oo1-f70.google.com with SMTP id t19-20020a4ae4130000b029023950cb8d35so110881oov.6
        for <linux-doc@vger.kernel.org>; Tue, 15 Jun 2021 12:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=Lqcix6Bye8GfBWjf8v07rNQNvUDYKUaSMsD+NDsgZyo=;
        b=a2lxqP2fBUfaIFRKS1xlXdvHoIifFrOj3tjD02yfH6FdJkzMKKBRy5EBWgx6COyRZo
         g72RfXkVH82K0MEVsU2i2HlixKr6HrYvaYpJ0/drSw6AO34t6wSiacPoTi//KgmL249G
         a/tPxRfAmeCzqlyaixLoY2F6qkIdaUwgiuVsbIdQqxsTod/NJdG2Rt51IkI7tbNjP4IU
         ziFAWe+TcVm00p47nLfVP0m4HNr/S11ZrFTeRRUkI8iLtPyPWOXBy8MxtFi8Fcb2ASjJ
         YwzGYJLLGPy2AHtedeDfKHxZGDaqu00TeoFp1UnB+NpVupFZ+VhsJ3eN5bwlufoZk8Ca
         e/8Q==
X-Gm-Message-State: AOAM5314HKD1DfPPiIidYIiDsTJhxNDEY7jxtznmYIW2gMqRNGQ3PysN
        sykoBqvib+dnAx0YGhKbfSLayNtLNyibIsUZxzkA1MYGdGDrl10Jf5xiSp59eREItgMyGtsI6Qx
        8sKK7Zpt/TbZb+9pYYFm1
X-Received: by 2002:a4a:98b0:: with SMTP id a45mr683008ooj.22.1623785751932;
        Tue, 15 Jun 2021 12:35:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEy2LCOJugZ+XL95JhEOH9gPPqCgkIMQXc0Pb6WDjknNr5iRFNesGYK5OnEUNjOdehrK9BNQ==
X-Received: by 2002:a4a:98b0:: with SMTP id a45mr682990ooj.22.1623785751738;
        Tue, 15 Jun 2021 12:35:51 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
        by smtp.gmail.com with ESMTPSA id j3sm3894698oii.46.2021.06.15.12.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 12:35:51 -0700 (PDT)
Date:   Tue, 15 Jun 2021 13:35:49 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Kirti Wankhede <kwankhede@nvidia.com>,
        David Airlie <airlied@linux.ie>,
        Tony Krowiak <akrowiak@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, Vasily Gorbik <gor@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        intel-gfx@lists.freedesktop.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jason Herne <jjherne@linux.ibm.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-s390@vger.kernel.org, Halil Pasic <pasic@linux.ibm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: Allow mdev drivers to directly create the vfio_device (v3)
Message-ID: <20210615133549.362e5a9e.alex.williamson@redhat.com>
In-Reply-To: <20210615133519.754763-1-hch@lst.de>
References: <20210615133519.754763-1-hch@lst.de>
Organization: Red Hat
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 15 Jun 2021 15:35:09 +0200
Christoph Hellwig <hch@lst.de> wrote:

> This is my alternative take on this series from Jason:
> 
> https://lore.kernel.org/dri-devel/87czsszi9i.fsf@redhat.com/T/
> 
> The mdev/vfio parts are exactly the same, but this solves the driver core
> changes for the direct probing without the in/out flag that Greg hated,
> which cause a little more work, but probably make the result better.
> 
> Original decription from Jason below:
> 
> The mdev bus's core part for managing the lifecycle of devices is mostly
> as one would expect for a driver core bus subsystem.
> 
> However instead of having a normal 'struct device_driver' and binding the
> actual mdev drivers through the standard driver core mechanisms it open
> codes this with the struct mdev_parent_ops and provides a single driver
> that shims between the VFIO core's struct vfio_device and the actual
> device driver.
> 
> Instead, allow mdev drivers implement an actual struct mdev_driver and
> directly call vfio_register_group_dev() in the probe() function for the
> mdev. Arrange to bind the created mdev_device to the mdev_driver that is
> provided by the end driver.
> 
> The actual execution flow doesn't change much, eg what was
> parent_ops->create is now device_driver->probe and it is called at almost
> the exact same time - except under the normal control of the driver core.
> 
> Ultimately converting all the drivers unlocks a fair number of additional
> VFIO simplifications and cleanups.

Looks like we need an update to
Documentation/driver-api/vfio-mediated-device.rst to go along with
this.

Also, if we're preserving compatibility with the "legacy"
mdev_parent_ops callbacks without deprecating them, does it really make
sense to convert every one of the sample drivers to this new direct
registration?  Thanks,

Alex

