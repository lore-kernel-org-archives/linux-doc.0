Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDDBACCA473
	for <linux-doc@archiver.kernel.org>; Mon, 27 Jun 2022 16:35:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234722AbiF0Qf6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 27 Jun 2022 12:35:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239481AbiF0Qf5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Jun 2022 12:35:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 85490DECA
        for <linux-doc@vger.kernel.org>; Mon, 27 Jun 2022 09:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656347755;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ajZ6rDuNIkxlTWf9Tu/rlCccLsTD5TfeTqcQISFWLfw=;
        b=aL0JQ/8XmzmSj0GUZgT3V969XHM0+qy5GoaZblqIRe0U1YEb0b6fN3lHUqsm0Z4tWd530U
        eLDQMB/jvpxHXAXHjw0Yw6IBLm/TZVZDNaZOAl0DkxKGJFlcMbHIYicjXmenMWqkSjSVwH
        sJuTClQwIghQdAUQVU7IoqL4i+Corxc=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-H3dnHbNENw2xMyFNQ20IMQ-1; Mon, 27 Jun 2022 12:35:54 -0400
X-MC-Unique: H3dnHbNENw2xMyFNQ20IMQ-1
Received: by mail-io1-f71.google.com with SMTP id e195-20020a6bb5cc000000b0066cc9ece80fso5908617iof.5
        for <linux-doc@vger.kernel.org>; Mon, 27 Jun 2022 09:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=ajZ6rDuNIkxlTWf9Tu/rlCccLsTD5TfeTqcQISFWLfw=;
        b=nJ/cDi8KXFgZWiraOVcWC3U2aDMrRO+PDLmoIJIfQEgtN4r5MS08gCrpdbPKxz4mKD
         GHqHD3HLd1W6V3MHGD8oCjaTFufP02go6CFJPkPDDJxxqY9sXnAzcznG8hhrEodmHPsT
         a64wWZl4MmvNz7wknSsThMG1x02hEtXbyysT9T14MhsGRM5APNzo78rltuYq81Ra6T/4
         5sghJtfbg26W+6tIbv+eaKIL45joKMC4KCEpRdl/Duj66do/eV2Smflx+7TtUumAUPcN
         mqfXbo4BU68sjDqW9iGmWgmxDeJNVp6jhg3C9RNC2qrh15f0FicQVzn1ZY+MopJ3xbnu
         sQEQ==
X-Gm-Message-State: AJIora9ruTRQ4r3TWksHgzCLiKBKAREWi8uaz4Dg9SWqDAAQxPuPXt6W
        G7rcQAzLugbBAmdXIOMWKZkt44u5fFcE2ep1jJTsbzX88xS7sr9FFWRUtcXxImgyvW2XM9n9fA2
        28yrw9EsxzxM9xKgY19Jt
X-Received: by 2002:a05:6638:dc6:b0:332:3565:397a with SMTP id m6-20020a0566380dc600b003323565397amr7957173jaj.312.1656347753691;
        Mon, 27 Jun 2022 09:35:53 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vv1JOb9B1ol8/IGTBQLrpbIC5YwburDgiT1ESupNJ64ipmLjowP6AySpptuL2gZYgDyI57hw==
X-Received: by 2002:a05:6638:dc6:b0:332:3565:397a with SMTP id m6-20020a0566380dc600b003323565397amr7957152jaj.312.1656347753485;
        Mon, 27 Jun 2022 09:35:53 -0700 (PDT)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id p20-20020a02b014000000b00339c015fd84sm4957144jah.59.2022.06.27.09.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 09:35:52 -0700 (PDT)
Date:   Mon, 27 Jun 2022 10:35:51 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     kwankhede@nvidia.com, farman@linux.ibm.com, mjrosato@linux.ibm.com,
        pasic@linux.ibm.com, diana.craciun@oss.nxp.com, cohuck@redhat.com,
        eric.auger@redhat.com, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, yishaih@nvidia.com, hch@lst.de
Subject: Re: [PATCH] vfio: de-extern-ify function prototypes
Message-ID: <20220627103551.48b34517.alex.williamson@redhat.com>
In-Reply-To: <20220610164407.25feeb23.alex.williamson@redhat.com>
References: <165471414407.203056.474032786990662279.stgit@omen>
        <20220610000434.GE1343366@nvidia.com>
        <20220610164407.25feeb23.alex.williamson@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 10 Jun 2022 16:44:07 -0600
Alex Williamson <alex.williamson@redhat.com> wrote:

> On Thu, 9 Jun 2022 21:04:34 -0300
> Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
> > On Wed, Jun 08, 2022 at 12:55:13PM -0600, Alex Williamson wrote:  
> > > The use of 'extern' in function prototypes has been disrecommended in
> > > the kernel coding style for several years now, remove them from all vfio
> > > related files so contributors no longer need to decide between style and
> > > consistency.
> > > 
> > > Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> > > ---
> > > 
> > > A patch in the same vein was proposed about a year ago, but tied to an ill
> > > fated series and forgotten.  Now that we're at the beginning of a new
> > > development cycle, I'd like to propose kicking off the v5.20 vfio next
> > > branch with this patch and would kindly ask anyone with pending respins or
> > > significant conflicts to rebase on top of this patch.  Thanks!    
> > 
> > Can you stick it in your branch please?  
> 
> Thanks for the R-b, it was my plan today to put it in my next branch,
> but I can't currently test vfio on mainline due to:
> 
> https://lore.kernel.org/all/165490039431.944052.12458624139225785964.stgit@omen/
> 
> I'll get this in once there's a mainline base where vfio still works.  Thanks,

This has now been resolved in rc4 via 034e5afad921 ("mm: re-allow
pinning of zero pfns").  I've rebased to rc4 and pushed this patch out
to the vfio next branch.  Thanks,

Alex

