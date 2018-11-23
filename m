Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1565D7D089
	for <lwn-linux-doc@archive.lwn.net>; Fri, 23 Nov 2018 18:05:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395335AbeKXEu0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 23 Nov 2018 23:50:26 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43339 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395269AbeKXEu0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Nov 2018 23:50:26 -0500
Received: by mail-pg1-f195.google.com with SMTP id v28so3340357pgk.10
        for <linux-doc@vger.kernel.org>; Fri, 23 Nov 2018 10:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mLGXK/dNfwHeDavvB2GkmSK7lW9Am0Mpj9z7LI5hfcs=;
        b=PhfuvGeD4ynaoG65V78SUvVrPLZBjzuP75HjRch8zj7cXNnxHZSQ3Q0Mg8njg+h3Hm
         ANzyvIKOosxGcus8upBqCnQANEpJO44u78ywb2CcF3MaBndvbuAgzrqkm5K/5HSbmKZw
         mPzdNV33jPtRHYuhFLREfiqOBKXqmkG9nRG8pIQWaNNEQPZCt2pfK4FwtNphZbamdc3F
         jZisWY9WzProZQ8CA0c1hPdJ61Ww6i8TlCl3nJsqoL/JE7XvHJk8gbX/05lJsJKPBmuy
         azfpCRBHkRSJRi6KzMeMrZ7D/Rrje7aPACpBBLkvZHiDeQyGQE99fQ7ixEs83wNrb1Ib
         bTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mLGXK/dNfwHeDavvB2GkmSK7lW9Am0Mpj9z7LI5hfcs=;
        b=mPBlATKeO1OcB3e18OFIRrQEa7GZ7m6abjly4EMAbcXePN2AhHDYO/uu5T9u+stJ1i
         1AYHi0ffUNUBvWreJ6A309oDRGFgdxGjNfzQfUwDz0Qyr5hfmH8gC0BR0MRUc+GOMj3R
         EZxhCducTACzXIryHgHCppVchkrUbsncStZPzz3hFb6/MKDNxyV1inig8aw0i+zG8dYr
         xLzE/gnkmO45vwivKd6WmfymKsXI6J+O9J4Yecb8JKuOzq3fOmr2JJ0XiGjVqOaKUenE
         5/UVoR9OrQKcf1tLmcaAZFWYuxIY+2Wcb1lhJvQuX+9GhxDxmbGiD8TX7RZsvXFC921Z
         vVNQ==
X-Gm-Message-State: AGRZ1gKe9HcdJ+wu7FBHwC8INLoutqQ7ggHLcFxcFXvGnDICL4R/S8Ha
        5xMCjkG23sHv1E2WlDV7RV/X4A==
X-Google-Smtp-Source: AJdET5dDBQNia6LXDIQX62ME2WBEBJM6uPAKstP1IiGmP41sf6kjlzX49fbzukD9GpZhj5Z3GcAF3g==
X-Received: by 2002:a62:434d:: with SMTP id q74-v6mr17128683pfa.242.1542996307316;
        Fri, 23 Nov 2018 10:05:07 -0800 (PST)
Received: from ziepe.ca (S010614cc2056d97f.ed.shawcable.net. [174.3.196.123])
        by smtp.gmail.com with ESMTPSA id k15sm8514470pfb.147.2018.11.23.10.05.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Nov 2018 10:05:06 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1gQFpA-0001tq-VG; Fri, 23 Nov 2018 11:05:04 -0700
Date:   Fri, 23 Nov 2018 11:05:04 -0700
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Kenneth Lee <liguozhu@hisilicon.com>
Cc:     Leon Romanovsky <leon@kernel.org>,
        Kenneth Lee <nek.in.cn@gmail.com>,
        Tim Sell <timothy.sell@unisys.com>, linux-doc@vger.kernel.org,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Zaibo Xu <xuzaibo@huawei.com>, zhangfei.gao@foxmail.com,
        linuxarm@huawei.com, haojian.zhuang@linaro.org,
        Christoph Lameter <cl@linux.com>,
        Hao Fang <fanghao11@huawei.com>,
        Gavin Schenk <g.schenk@eckelmann.de>,
        RDMA mailing list <linux-rdma@vger.kernel.org>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        Doug Ledford <dledford@redhat.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        David Kershner <david.kershner@unisys.com>,
        Johan Hovold <johan@kernel.org>,
        Cyrille Pitchen <cyrille.pitchen@free-electrons.com>,
        Sagar Dharia <sdharia@codeaurora.org>,
        Jens Axboe <axboe@kernel.dk>, guodong.xu@linaro.org,
        linux-netdev <netdev@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        linux-crypto@vger.kernel.org,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        linux-accelerators@lists.ozlabs.org
Subject: Re: [RFCv3 PATCH 1/6] uacce: Add documents for WarpDrive/uacce
Message-ID: <20181123180504.GA3395@ziepe.ca>
References: <20181114160017.GI3759@mtr-leonro.mtl.com>
 <20181115085109.GD157308@Turing-Arch-b>
 <20181115145455.GN3759@mtr-leonro.mtl.com>
 <20181119091405.GE157308@Turing-Arch-b>
 <20181119184954.GB4890@ziepe.ca>
 <20181120030702.GH157308@Turing-Arch-b>
 <20181120032939.GR4890@ziepe.ca>
 <20181121060805.GJ157308@Turing-Arch-b>
 <20181122025840.GB19938@ziepe.ca>
 <20181123080242.GK157308@Turing-Arch-b>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181123080242.GK157308@Turing-Arch-b>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Nov 23, 2018 at 04:02:42PM +0800, Kenneth Lee wrote:

> It is already part of Jean's patchset. And that's why I built my solution on
> VFIO in the first place. But I think the concept of SVA and PASID is not
> compatible with the original VFIO concept space. You would not share your whole
> address space to a device at all in a virtual machine manager,
> wouldn't you?

Why not? That seems to fit VFIO's space just fine to me.. You might
need a new upcall to create a full MM registration, but that doesn't
seem unsuited.

Part of the point here is you should try to make sensible revisions to
existing subsystems before just inventing a new thing...

VFIO is deeply connected to the IOMMU, so enabling more general IOMMU
based approache seems perfectly fine to me..

> > Once the VFIO driver knows about this as a generic capability then the
> > device it exposes to userspace would use CPU addresses instead of DMA
> > addresses.
> > 
> > The question is if your driver needs much more than the device
> > agnostic generic services VFIO provides.
> > 
> > I'm not sure what you have in mind with resource management.. It is
> > hard to revoke resources from userspace, unless you are doing
> > kernel syscalls, but then why do all this?
> 
> Say, I have 1024 queues in my accelerator. I can get one by opening the device
> and attach it with the fd. If the process exit by any means, the queue can be
> returned with the release of the fd. But if it is mdev, it will still be there
> and some one should tell the allocator it is available again. This is not easy
> to design in user space.

?? why wouldn't the mdev track the queues assigned using the existing
open/close/ioctl callbacks?

That is basic flow I would expect:

 open(/dev/vfio)
 ioctl(unity map entire process MM to mdev with IOMMU)

 // Create a HQ queue and link the PASID in the HW to this HW queue
 struct hw queue[..];
 ioctl(create HW queue)

 // Get BAR doorbell memory for the queue
 bar = mmap()

 // Submit work to the queue using CPU addresses
 queue[0] = ...
 writel(bar [..], &queue);

 // Queue, SVA, etc is cleaned up when the VFIO closes
 close()

Presumably the kernel has to handle the PASID and related for security
reasons, so they shouldn't go to userspace?

If there is something missing in vfio to do this is it looks pretty
small to me..

Jason
