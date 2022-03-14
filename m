Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C44F3C433FE
	for <linux-doc@archiver.kernel.org>; Mon, 14 Mar 2022 19:17:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243941AbiCNTSy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Mar 2022 15:18:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234586AbiCNTSy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Mar 2022 15:18:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9468C39BB6
        for <linux-doc@vger.kernel.org>; Mon, 14 Mar 2022 12:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647285461;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=daDOGiFxYv+daOkza11q48xlAEr2nJLNiwY29z+sBn8=;
        b=T1WBWK/uB5k8/avts5YsQ9PXqUDk/DBdSlRIg5QgL5CBD24YuMwuMo3mDFInKIcGBJmUEs
        XqrVnIBeXTqjMsByQfbpgdZ0//cVSymS/ftsefGC8exN9yUsuQFGLUB2PvX02fKzUqnP7l
        HkboYVbi+p7naDpRqza6YjUgtcc7WZ4=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-t1SmcVp0NyKlyrIxHuoOpQ-1; Mon, 14 Mar 2022 15:17:40 -0400
X-MC-Unique: t1SmcVp0NyKlyrIxHuoOpQ-1
Received: by mail-io1-f72.google.com with SMTP id e27-20020a056602045b00b00645bd576184so12967666iov.3
        for <linux-doc@vger.kernel.org>; Mon, 14 Mar 2022 12:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=daDOGiFxYv+daOkza11q48xlAEr2nJLNiwY29z+sBn8=;
        b=1oOB7yOvFpAmOTJ7BhFRtKsGNVU1lV/sNUrZNAvZg+ha5pJWhVX1pY0NRRZznXSjC1
         p0+EN5MtF0nPXv2WvusVfYHhlzkhuFjtAMj4HnTCGCC4R+GGB7tq2yGIkgLbp7FvIVtI
         o4CpgxIfO7Su/d0ivRy77gi5d6ZAHhivIOdlse1NV+myvK3GMpu1pom1z3iU62EvV0v5
         pZMucDoEnJAYg4QzPZ8fhYBJO0FtT2FVOzEq1xPGzYThMnFYfbSdblcUq9Y3121EGhGO
         EGdyR0imq8usKfhyaMN4cTLDSuOmle9Vpta3swXJO47JPH3dyoCFUFju0hhcy1MTPZD4
         tt9g==
X-Gm-Message-State: AOAM533T3K/EzhBkdVKarzZqu4tK7aoY4dDFilRT7ihAcFC3/eMpGddm
        der7ylwj8ysZ52zWEg39U32R2AASfYzBJqyqMYv5Sbx9e+k7ryATt//j7bk/lmv3XP5zQyDHoHC
        2XH2NDBosxvCzpi9Q4Fnu
X-Received: by 2002:a05:6e02:1c8c:b0:2c7:9b38:69ea with SMTP id w12-20020a056e021c8c00b002c79b3869eamr7193967ill.50.1647285459486;
        Mon, 14 Mar 2022 12:17:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzo3y4VD1H3SQM7st2tJN84lL8sPivPb1chKeRJw63xDV4M4CIwHF2nrTiSJFiTG0fkaJKYBw==
X-Received: by 2002:a05:6e02:1c8c:b0:2c7:9b38:69ea with SMTP id w12-20020a056e021c8c00b002c79b3869eamr7193954ill.50.1647285459222;
        Mon, 14 Mar 2022 12:17:39 -0700 (PDT)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id n14-20020a056602340e00b00648c287cc02sm6029337ioz.27.2022.03.14.12.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 12:17:38 -0700 (PDT)
Date:   Mon, 14 Mar 2022 13:17:38 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Yishai Hadas <yishaih@nvidia.com>
Cc:     <linux-kernel@vger.kernel.org>, <jgg@nvidia.com>,
        <shameerali.kolothum.thodi@huawei.com>, <kevin.tian@intel.com>,
        <linux-doc@vger.kernel.org>, <corbet@lwn.net>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Subject: Re: [PATCH] vfio-pci: Provide reviewers and acceptance criteria for
 vendor drivers
Message-ID: <20220314131738.146c3e79.alex.williamson@redhat.com>
In-Reply-To: <a635abc8-be36-a9ee-dd8b-2950cc368562@nvidia.com>
References: <164727326053.17467.1731353533389014796.stgit@omen>
        <a635abc8-be36-a9ee-dd8b-2950cc368562@nvidia.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 14 Mar 2022 21:07:01 +0200
Yishai Hadas <yishaih@nvidia.com> wrote:

> On 3/14/2022 6:09 PM, Alex Williamson wrote:
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
> >
> > Per the proposal here[1], I've collected those that volunteered and
> > those that I interpreted as showing interest (alpha by last name).  For
> > those on the reviewers list below, please R-b/A-b to keep your name as a
> > reviewer.  More volunteers are still welcome, please let me know
> > explicitly; R-b/A-b will not be used to automatically add reviewers but
> > are of course welcome.  Thanks,  
> 
> You can add me as well to the reviewers list.

Thanks, Yishai!  v2 posted including you, please send ack or review.
Thanks,

Alex

