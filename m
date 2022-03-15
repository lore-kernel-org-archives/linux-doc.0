Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 804FBC433EF
	for <linux-doc@archiver.kernel.org>; Tue, 15 Mar 2022 17:57:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350788AbiCOR6w (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Mar 2022 13:58:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237505AbiCOR6v (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Mar 2022 13:58:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BA18A5938C
        for <linux-doc@vger.kernel.org>; Tue, 15 Mar 2022 10:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647367058;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fMedA9WfDLM5Ii8pfrj6jSSL52RCVYUyNjTGE84uBgM=;
        b=fD0wGxnzALVJENVAk+tvxD+OaD/Fv25/TdIN/LpwHGUTV816dxcBXUqblnF59KrhB9qUqK
        WcwLF6SbA2PxNOX8a0zNBFke5yFTGYjic+e4/dHpejaAOzNY34z/TK0zv41lun00rAJjr4
        U6PsOzkh8ZD+4WoK0K7Z5TPpao5CPn8=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-RILnz-i5PWqh8Q2X7cixQw-1; Tue, 15 Mar 2022 13:57:37 -0400
X-MC-Unique: RILnz-i5PWqh8Q2X7cixQw-1
Received: by mail-ot1-f69.google.com with SMTP id o17-20020a9d5c11000000b005b24a70c275so14470863otk.10
        for <linux-doc@vger.kernel.org>; Tue, 15 Mar 2022 10:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=fMedA9WfDLM5Ii8pfrj6jSSL52RCVYUyNjTGE84uBgM=;
        b=LQwlk0t2Nd4sU7sfFsxURctNWDUUwrKBHixmWj8g2rkqTYMcM5WxX5wOCvxsW/2lnV
         uf692st27OT6WT+jfWFK3yk4pAzn3liXkNyAVX/to7MWG3q9ACkklF+in6T2FLuIi4Zj
         7vXELx87iywSXS5zGk/CwhDE1p6AzfoU3url0OulnfIaaQMZOy82uCMHbgRoiBMQ3HyK
         eo2SqSi9nseqavJ2a8iXct63xeNwQpNnlueoeVBrPiOHQIBcK2qUaY13KmpmzhEIvG87
         ufIWMps8uDNaPMm1OXVfQQmtYg/cZ24peyD3/3fVEEO2DH6VmwUkxZeOAuZLeLxe938b
         zRrg==
X-Gm-Message-State: AOAM530fDMnU06+Z8bu3nbr/MCE0fWPAiBONb/G9LszZKoHfc4B1I/37
        Nn8uRJ4syId5TuSL3y0lHuU4xeOcdLyg5V/51jJRPzAvgvlgJhAa5UGBuxlJLxY2ENmkEIpaDXs
        /7NfsRzpq+iLdeqUvrKj3
X-Received: by 2002:a05:6870:f21a:b0:dd:9bec:caf8 with SMTP id t26-20020a056870f21a00b000dd9beccaf8mr873948oao.78.1647367056640;
        Tue, 15 Mar 2022 10:57:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzE0G+Iyi868FpnRpeqpjvFcGN9EznuWhCxB2z8lLfYG22OepTHiVkPgi+Sek7WhuBRDRt2Cw==
X-Received: by 2002:a05:6870:f21a:b0:dd:9bec:caf8 with SMTP id t26-20020a056870f21a00b000dd9beccaf8mr873941oao.78.1647367056433;
        Tue, 15 Mar 2022 10:57:36 -0700 (PDT)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id q39-20020a4a88ea000000b0032165eb3af8sm7321527ooh.42.2022.03.15.10.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 10:57:36 -0700 (PDT)
Date:   Tue, 15 Mar 2022 11:57:34 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        shameerali.kolothum.thodi@huawei.com, kevin.tian@intel.com,
        yishaih@nvidia.com, linux-doc@vger.kernel.org, corbet@lwn.net,
        hch@infradead.org
Subject: Re: [PATCH v4] vfio-pci: Provide reviewers and acceptance criteria
 for variant drivers
Message-ID: <20220315115734.71facb10.alex.williamson@redhat.com>
In-Reply-To: <20220315175039.GL11336@nvidia.com>
References: <164736509088.181560.2887686123582116702.stgit@omen>
        <20220315175039.GL11336@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 15 Mar 2022 14:50:39 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, Mar 15, 2022 at 11:29:57AM -0600, Alex Williamson wrote:
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
> > 
> > v4:
> > 
> > Banish the word "vendor", replace with "device specific"
> > Minor wording changes in docs file
> > Add sign-offs from Kevin and Yishai
> > 
> > I'll drop Jason from reviewers if there's no positive approval
> > after this round.  
> 
> Sorry, you are looking for this?
> 
> Acked-by: Jason Gunthorpe <jgg@nvidia.com>

Yup, thanks for volunteering!

