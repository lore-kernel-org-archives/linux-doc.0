Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C9FC433F5
	for <linux-doc@archiver.kernel.org>; Wed, 16 Mar 2022 21:12:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344811AbiCPVNd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Mar 2022 17:13:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242647AbiCPVNc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Mar 2022 17:13:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2AD1C39BAC
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 14:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647465137;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i7/+xJxJo5EtPXTa2Igw+/A1HJm8dgW21+h/vVG4wM4=;
        b=fuyEJ4u10kvX4M+xNSQbYtg7tVC3kILhdUQ/hX1DGCDmYv7NjsU51gImDAI1kXr7QluRjo
        HVRPLZV3Z5DW4lfrtqUYEn5iZI9zx3gZBZij5R6RfXPLpwpujRP/ZLPWBOzstwEM+kFSn2
        G9WyBulpVzbYfy5zjRQJhNEgViRz/bM=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-j1MwcWWCPxa6ZoDN1E2SRA-1; Wed, 16 Mar 2022 17:12:16 -0400
X-MC-Unique: j1MwcWWCPxa6ZoDN1E2SRA-1
Received: by mail-io1-f69.google.com with SMTP id g16-20020a05660203d000b005f7b3b0642eso2011957iov.16
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 14:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=i7/+xJxJo5EtPXTa2Igw+/A1HJm8dgW21+h/vVG4wM4=;
        b=6iaB2hLYUOEDQO8ZkuE6QVchKovj01QGdRe72W8cLeDCzKA0/3LqjL6URcaj/vCRLz
         yc/Qik6uCjvjZzA7RmMqRxfaSfwWwjW+KOqyTQkonmEmTtjWIn3FXiN+seLmzEr2NGvh
         v5cZIHsuATPQu0gIquBn2Ud7n3h/AEWi0/4gVugCzBvZm53y/Ca+J5vGNLw53A4AZ+ya
         s3okGkz73CPz6ZsDKTiEeHvBAsNGCL3kLGP3h1mXinur0PWder2SaWNsbR2fV7sSzwGC
         9jIOqSxEAPusg/HMk2ZqXVVGovsP6HZK7THuoTxjSJSvluhCgmmUh85DysTh5QveA1/k
         GKTg==
X-Gm-Message-State: AOAM530K1B0iVZwJ1BCKO3m2INWSWO7Mk1nKmOn639MBgoRfVuPBXDGD
        +JhbJshmFI+DElE96WEvzMTNRs8S8tPOWOuflsHMd431Rrzd7pM/mY0JvGN2o9Gfq2l3DsGwJ5v
        gqjLwNSz3TUiPZUrGKQWK
X-Received: by 2002:a5d:89d8:0:b0:645:d853:66f0 with SMTP id a24-20020a5d89d8000000b00645d85366f0mr843235iot.30.1647465135580;
        Wed, 16 Mar 2022 14:12:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJympsKSmFw7oQCxHWBDz7yJ2qwkRpX+Zxgw7rY0YM2XSCu1AysybpyZqRKvCwZ/gOtVUbVdUQ==
X-Received: by 2002:a5d:89d8:0:b0:645:d853:66f0 with SMTP id a24-20020a5d89d8000000b00645d85366f0mr843226iot.30.1647465135380;
        Wed, 16 Mar 2022 14:12:15 -0700 (PDT)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id t17-20020a92ca91000000b002c7e2664bf7sm126377ilo.36.2022.03.16.14.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 14:12:15 -0700 (PDT)
Date:   Wed, 16 Mar 2022 15:12:14 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     kvm@vger.kernel.org, linux-kernel@vger.kernel.org, jgg@nvidia.com,
        shameerali.kolothum.thodi@huawei.com, kevin.tian@intel.com,
        yishaih@nvidia.com, linux-doc@vger.kernel.org, hch@infradead.org
Subject: Re: [PATCH v4] vfio-pci: Provide reviewers and acceptance criteria
 for variant drivers
Message-ID: <20220316151214.552a16b3.alex.williamson@redhat.com>
In-Reply-To: <87wngtsiws.fsf@meer.lwn.net>
References: <164736509088.181560.2887686123582116702.stgit@omen>
        <87wngtsiws.fsf@meer.lwn.net>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 16 Mar 2022 15:10:27 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> Alex Williamson <alex.williamson@redhat.com> writes:
> 
> > Device specific extensions for devices exposed to userspace through
> > the vfio-pci-core library open both new functionality and new risks.
> > Here we attempt to provided formalized requirements and expectations
> > to ensure that future drivers both collaborate in their interaction
> > with existing host drivers, as well as receive additional reviews
> > from community members with experience in this area.
> >
> > Cc: Jason Gunthorpe <jgg@nvidia.com>
> > Acked-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > Reviewed-by: Yishai Hadas <yishaih@nvidia.com>
> > Acked-by: Kevin Tian <kevin.tian@intel.com>
> > Signed-off-by: Alex Williamson <alex.williamson@redhat.com>  
> 
> So this seems fine to me.  Did you want it to go through the docs tree,
> or did you have another path in mind for it?

Thanks, Jon.  I can bring it in through the vfio tree if that works for
you.  Thanks,

Alex

