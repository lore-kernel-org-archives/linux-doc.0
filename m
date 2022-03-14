Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B0BC433F5
	for <linux-doc@archiver.kernel.org>; Mon, 14 Mar 2022 19:53:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244558AbiCNTy5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Mar 2022 15:54:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244607AbiCNTys (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Mar 2022 15:54:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2F9BB25EC
        for <linux-doc@vger.kernel.org>; Mon, 14 Mar 2022 12:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647287540;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GBOGyth8SUjOhbMl4iXnJi0rODftuyM/OOyrFjsN+/8=;
        b=YDi9++S7ansLS1XXVkMeV3KK2bR5HXzt7v4NlkzidBfh5qkYT7yNOaKwgT+F1X30DLZb3U
        O3r6RETn5h00jQuW6C5xEGFiFjmoEdp8RHItFrP0XziNiJUJ4ooZ5X69mUBl1nz9CbHKKz
        8EICQpdQetMLvUVV3QQdEY8gskt6qQE=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-UQf5v2-yPqqlQOsfBKn1RA-1; Mon, 14 Mar 2022 15:52:18 -0400
X-MC-Unique: UQf5v2-yPqqlQOsfBKn1RA-1
Received: by mail-io1-f69.google.com with SMTP id u17-20020a6be311000000b00648f92b7b8cso2773882ioc.23
        for <linux-doc@vger.kernel.org>; Mon, 14 Mar 2022 12:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GBOGyth8SUjOhbMl4iXnJi0rODftuyM/OOyrFjsN+/8=;
        b=fxsNWOoH89Y7eM80lc0/qjeEs9ep40vIsjWq7GXQnCL8G7qBeF1jFJcI+4eIRIXm2J
         Pp1WgzgxxqRr07hIQ+dtKmzVxdapBSJp4jb8VyhKsBngFlz1n15y8KJqqIRqMc9h9g0y
         WFuQLLm/hIh/+4hq3hg+bqF1juPR6rKv2BrToFd3LPFSTtHEj8SmAL0DcrHG1c31WEZH
         gXrMJT5WHGmavBe3iQGuq9gKh9Z1N74U6XCtSfRo9BRTr+AeswEnyoMerinFVjYv1Xwk
         znJron+bEmZIa3bgSY0ntsqzasnRZC4xU5X02QhpPqY/GXFO3zWgXpNhkTMFBJ0/B2Dd
         YwNQ==
X-Gm-Message-State: AOAM533NfDg53rxUIEY4mac+B2Opylkla8cZRRcdp7rX7EbEWWlbREif
        WyxChQasBDDbbEN3MLFZVo5wJB1DpuRJ1hOfVRIuwjojbrXcUkyL2bN8DfbxUmCJbtdRnWLue9O
        BTps3L4dB3KBf9K8M6k3p
X-Received: by 2002:a02:1d45:0:b0:317:c1ed:882f with SMTP id 66-20020a021d45000000b00317c1ed882fmr22366749jaj.33.1647287538238;
        Mon, 14 Mar 2022 12:52:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzL70MDAi9m5dOEzNFXAK2hOJ4q3gZT3CFGBlHf6tZ4stiRQUgD9xY/OIi31lTSnRRajnBrsQ==
X-Received: by 2002:a02:1d45:0:b0:317:c1ed:882f with SMTP id 66-20020a021d45000000b00317c1ed882fmr22366737jaj.33.1647287538003;
        Mon, 14 Mar 2022 12:52:18 -0700 (PDT)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id w6-20020a056e021c8600b002c602537ab9sm9693969ill.54.2022.03.14.12.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 12:52:17 -0700 (PDT)
Date:   Mon, 14 Mar 2022 13:52:16 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     kvm@vger.kernel.org, linux-kernel@vger.kernel.org, jgg@nvidia.com,
        shameerali.kolothum.thodi@huawei.com, kevin.tian@intel.com,
        yishaih@nvidia.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] vfio-pci: Provide reviewers and acceptance criteria
 for vendor drivers
Message-ID: <20220314135216.0cd5e16a.alex.williamson@redhat.com>
In-Reply-To: <87pmmoxqv8.fsf@meer.lwn.net>
References: <164728518026.40450.7442813673746870904.stgit@omen>
        <87pmmoxqv8.fsf@meer.lwn.net>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jon,

On Mon, 14 Mar 2022 13:42:51 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> Alex Williamson <alex.williamson@redhat.com> writes:
> 
> > Vendor or device specific extensions for devices exposed to userspace
> > through the vfio-pci-core library open both new functionality and new
> > risks.  Here we attempt to provided formalized requirements and
> > expectations to ensure that future drivers both collaborate in their
> > interaction with existing host drivers, as well as receive additional
> > reviews from community members with experience in this area.
> >
> > Cc: Jason Gunthorpe <jgg@nvidia.com>
> > Cc: Yishai Hadas <yishaih@nvidia.com>
> > Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > Cc: Kevin Tian <kevin.tian@intel.com>
> > Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> > ---  
> 
> One thing...
> 
> >  .../vfio/vfio-pci-vendor-driver-acceptance.rst     |   35 ++++++++++++++++++++
> >  MAINTAINERS                                        |   10 ++++++
> >  2 files changed, 45 insertions(+)  
> 
> If you add a new RST file, you need to add it to an index.rst somewhere
> so that it becomes part of the kernel docs build.

Whoops

> Also, though: can we avoid creating a new top-level documentation
> directory for just this file?  It seems like it would logically be a
> part of the maintainers guide (Documentation/maintainer) ... ?

I'm not sure it's appropriate for Documentation/maintainer/ but it
would make sense to link it from maintainer-entry-profile.rst there.
What if I move it to Documentation/driver-api where there are a couple
other vfio docs?  Thanks,

Alex

