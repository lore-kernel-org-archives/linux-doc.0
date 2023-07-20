Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F807EB64DA
	for <linux-doc@archiver.kernel.org>; Thu, 20 Jul 2023 06:37:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbjGTGhW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Jul 2023 02:37:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230014AbjGTGhH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Jul 2023 02:37:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF09E3C07
        for <linux-doc@vger.kernel.org>; Wed, 19 Jul 2023 23:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689834888;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dtNCKI30gUb2ejju1iAv/z/Xf+Tlc73YIKqusu5O8yY=;
        b=AmoN8Tiu+2ZuBWAOgM/gON2bzPibUg3sG4aNY5U/iNK+6uSk+zBCOAtajwDQ8+J5abFyvb
        2pWU+T0fQzDY5g2r/QM4QNgKOONe4lJRLeAwNFR33e1zqs1/8ieZ7/qH8lZQTg7wzGAkS1
        4pSMoo5NIdS1zbVS6ILjvwDHXPmyfws=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-cmdQ8_hHO0q1ggBVCfFpQw-1; Thu, 20 Jul 2023 02:34:46 -0400
X-MC-Unique: cmdQ8_hHO0q1ggBVCfFpQw-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3fc07d4c63eso7066475e9.1
        for <linux-doc@vger.kernel.org>; Wed, 19 Jul 2023 23:34:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689834885; x=1690439685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtNCKI30gUb2ejju1iAv/z/Xf+Tlc73YIKqusu5O8yY=;
        b=fzyDdzhWDL4gjpKWsD5iK5Kb4Vsd5tzV+qHAJS6rhANnU9ryWFOQn0deBqtYfKEWNK
         +GCC3+S54azf4Afbg2GUWCGdOefxyXDrGF8Jee91XW2rRyCC+OPp3AxLv+/TsR+cqP2I
         el0s/LrH/aW9YlYvWdFZQk+DpivnErblVOHZJjCGQdfCxZ30JE+F57WYIYqFfvtZCWKV
         3px7+ZSOxQbypwrlJjPn+7XIMrJH20i18QSA8pwYVJl8Wo6aIm/DAuXnM1wasKgou2GU
         YOKMnv+sw0zr+0gJ/k7ruhMTuBLtd8hUmLLO83BpgjeW8A4pXgt7h7tqBt3YVvsK6b8A
         0GSg==
X-Gm-Message-State: ABy/qLbXvPHfdrlmTY28KkPImLkSFlelKSILJOgudUYLEF81JLATEV+R
        jGfxQQ1VkdekSuO0k/5k9x2uefdx70o2rTgPMT9FaCA6a4iDoL+I126GmbNNi5LWPTCKCK0C9ZI
        0E0mt8Ij7dLxwqFW0xgPe
X-Received: by 2002:a7b:c5d6:0:b0:3f4:2a69:409 with SMTP id n22-20020a7bc5d6000000b003f42a690409mr3717558wmk.11.1689834885485;
        Wed, 19 Jul 2023 23:34:45 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG/md4YMGZnSVmWQIIDVMHy+n/6oKujQJGj4xD8x/EzYsJTyApNBYgjSGjDE5JrX+Ajl2WgQA==
X-Received: by 2002:a7b:c5d6:0:b0:3f4:2a69:409 with SMTP id n22-20020a7bc5d6000000b003f42a690409mr3717539wmk.11.1689834885126;
        Wed, 19 Jul 2023 23:34:45 -0700 (PDT)
Received: from redhat.com ([2a02:14f:172:65c:3b05:aa8f:9ec2:7e3e])
        by smtp.gmail.com with ESMTPSA id j16-20020adfea50000000b0031424f4ef1dsm322685wrn.19.2023.07.19.23.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 23:34:44 -0700 (PDT)
Date:   Thu, 20 Jul 2023 02:34:41 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Christoph Hellwig <hch@lst.de>
Cc:     linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH] dma: DMA_ATTR_SKIP_CPU_SYNC documentation tweaks
Message-ID: <20230720023359-mutt-send-email-mst@kernel.org>
References: <98ef4f76d7a5f90b0878e649a70b101402b8889d.1689761699.git.mst@redhat.com>
 <20230720060742.GA2987@lst.de>
 <20230720021914-mutt-send-email-mst@kernel.org>
 <20230720062525.GA3723@lst.de>
 <20230720022702-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230720022702-mutt-send-email-mst@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 20, 2023 at 02:30:08AM -0400, Michael S. Tsirkin wrote:
> On Thu, Jul 20, 2023 at 08:25:25AM +0200, Christoph Hellwig wrote:
> > On Thu, Jul 20, 2023 at 02:21:05AM -0400, Michael S. Tsirkin wrote:
> > > On Thu, Jul 20, 2023 at 08:07:42AM +0200, Christoph Hellwig wrote:
> > > > On Wed, Jul 19, 2023 at 06:15:59AM -0400, Michael S. Tsirkin wrote:
> > > > > A recent patchset highlighted to me that DMA_ATTR_SKIP_CPU_SYNC
> > > > > might be easily misunderstood.
> > > > 
> > > > .. just curious: what patchset is that?  DMA_ATTR_SKIP_CPU_SYNC is
> > > > often a bad idea and all users probably could use a really good
> > > > audit..
> > > 
> > > Message-Id: <20230710034237.12391-1-xuanzhuo@linux.alibaba.com>
> > 
> > Do you have an actual link?
> 
> sure, they are not hard to generate ;)
> 
> https://lore.kernel.org/all/20230710034237.12391-11-xuanzhuo%40linux.alibaba.com


actually there's a new version

https://lore.kernel.org/all/20230719040422.126357-11-xuanzhuo%40linux.alibaba.com

you can see it does map, sync, unmap

unmap immediately after sync seems to be exactly the use case
for DMA_ATTR_SKIP_CPU_SYNC.


> > > 
> > > 
> > > Looks like there's really little else can be done: there's a
> > > shared page we allow DMA into, so we sync periodically.
> > > Then when we unmap we really do not need that data
> > > synced again.
> > > 
> > > What exactly is wrong with this?
> > 
> > A "shared" page without ownership can't work with the streaming
> > DMA API (dma_map_*) at all.  You need to use dma_alloc_coherent
> > so that it is mapped uncached.
> 
> Hmm confused.  Based on both documentation and code I think this works:
> 
> 	dma_map
> 	dma_sync
> 	dma_sync
> 	dma_sync
> 	dma_sync
> 	dma_unmap(DMA_ATTR_SKIP_CPU_SYNC)
> 
> right?
> 
> -- 
> MST

