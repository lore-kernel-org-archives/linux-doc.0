Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BC4C43334
	for <linux-doc@archiver.kernel.org>; Fri, 10 Jun 2022 22:44:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348368AbiFJWoP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 10 Jun 2022 18:44:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348403AbiFJWoO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Jun 2022 18:44:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 82D233C480
        for <linux-doc@vger.kernel.org>; Fri, 10 Jun 2022 15:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654901052;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pblZd+Kqp7f2K+2rxNpvXUuiOLaopPh9IaEYk0kwYKE=;
        b=NTjYhRsx6ctDVsjQjsegWvbKCxKclOsEO07UrXSk8ypDynoqmphEPoXwlWosTDmIHU9jKu
        NKAwmxOJK34qSCSYKb+G7QwCrJl47j/kbQpKWg4P/UnmlckC+uUe3niKVZInsbxS/dMuzs
        suM1nz9eAMOXglsw91/x6M5dOdPLk4g=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-NsQryGV5PUa_VHADxP0iuQ-1; Fri, 10 Jun 2022 18:44:11 -0400
X-MC-Unique: NsQryGV5PUa_VHADxP0iuQ-1
Received: by mail-io1-f72.google.com with SMTP id l7-20020a6b7007000000b00669b2a0d497so279263ioc.0
        for <linux-doc@vger.kernel.org>; Fri, 10 Jun 2022 15:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=pblZd+Kqp7f2K+2rxNpvXUuiOLaopPh9IaEYk0kwYKE=;
        b=HLRV/5hv2UKDPVogn14iYIWlBwSgE6a66G/m3okhfBj3qbt/F4D6XxxFLgxLxIOGXU
         FJ7x1/SJNb15Rb6G5Ts2RvZIWKYL8fl3rwuzqQ3qLAf5F456CZwKtn5+cvSteSKQirTE
         WHQafSbBkiijN/nzl3a9Ym6uPG6r+959pW+0gNkbxf7lFR4nK9Lp7I7aMwX/FkLgoFBK
         M9Bv9gZ8znfSgIiFE5EuKTyVob/d/wSRVTc3P7Nn5SKdn9l9PNxoO07ih99QtxquUpMs
         r6AOxe60FLlPuPpXu4xHLiSQ90YIR8jJSlUXgbLUt4UxCNbuJzH+HpRQ99NPssB9/LXy
         eICA==
X-Gm-Message-State: AOAM531oW1WPHFu14GrqCSuESXK3XRqMz1z6/KSjdy2h4YWbooFQxIGO
        ljJvBE4Z8KxO6wXQBb3F/X9E0Vi6pWnthGPQamoiVXfY7uafFj4yUq+ltEm8SUutkQ1L+cGg2YE
        jLPGUKjazjTlVpjcqOSAf
X-Received: by 2002:a02:c811:0:b0:332:2c2e:88e0 with SMTP id p17-20020a02c811000000b003322c2e88e0mr343363jao.132.1654901050840;
        Fri, 10 Jun 2022 15:44:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgEFjSHs9TXHG3p6x60NRKxwsOGKtJ1mMFIodXcBQ3lbM9zLgveeGgcd98DfNgAuz2vKQAXQ==
X-Received: by 2002:a02:c811:0:b0:332:2c2e:88e0 with SMTP id p17-20020a02c811000000b003322c2e88e0mr343346jao.132.1654901050600;
        Fri, 10 Jun 2022 15:44:10 -0700 (PDT)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id y2-20020a926402000000b002d3a3a089b3sm130533ilb.1.2022.06.10.15.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 15:44:09 -0700 (PDT)
Date:   Fri, 10 Jun 2022 16:44:07 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     kwankhede@nvidia.com, farman@linux.ibm.com, mjrosato@linux.ibm.com,
        pasic@linux.ibm.com, diana.craciun@oss.nxp.com, cohuck@redhat.com,
        eric.auger@redhat.com, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, yishaih@nvidia.com, hch@lst.de
Subject: Re: [PATCH] vfio: de-extern-ify function prototypes
Message-ID: <20220610164407.25feeb23.alex.williamson@redhat.com>
In-Reply-To: <20220610000434.GE1343366@nvidia.com>
References: <165471414407.203056.474032786990662279.stgit@omen>
        <20220610000434.GE1343366@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 9 Jun 2022 21:04:34 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Wed, Jun 08, 2022 at 12:55:13PM -0600, Alex Williamson wrote:
> > The use of 'extern' in function prototypes has been disrecommended in
> > the kernel coding style for several years now, remove them from all vfio
> > related files so contributors no longer need to decide between style and
> > consistency.
> > 
> > Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> > ---
> > 
> > A patch in the same vein was proposed about a year ago, but tied to an ill
> > fated series and forgotten.  Now that we're at the beginning of a new
> > development cycle, I'd like to propose kicking off the v5.20 vfio next
> > branch with this patch and would kindly ask anyone with pending respins or
> > significant conflicts to rebase on top of this patch.  Thanks!  
> 
> Can you stick it in your branch please?

Thanks for the R-b, it was my plan today to put it in my next branch,
but I can't currently test vfio on mainline due to:

https://lore.kernel.org/all/165490039431.944052.12458624139225785964.stgit@omen/

I'll get this in once there's a mainline base where vfio still works.  Thanks,

Alex

