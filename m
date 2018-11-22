Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3A2987D08E
	for <lwn-linux-doc@archive.lwn.net>; Thu, 22 Nov 2018 02:58:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391802AbeKVNgA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 22 Nov 2018 08:36:00 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37174 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391793AbeKVNf7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Nov 2018 08:35:59 -0500
Received: by mail-pl1-f195.google.com with SMTP id b5so8253847plr.4
        for <linux-doc@vger.kernel.org>; Wed, 21 Nov 2018 18:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yX13UxWnJ8nh0jv4F6ynYHuuA4s7Rp3X3QUy9L7fHFw=;
        b=P9HkdoG4oK1CdS3DzYbSsjJwEaU7DfX/Y+bkc/J53wNkP5ihuaU7aL489CVegDaIKK
         unAzRS1KPoEQV0egzLV/XwR/T6/DCp6RLjYEGIyLKvgNiVJtWjd1Kts3cQjoUkX8G1RY
         BLgH+PrfA5KW7pPz/PrBGKu44NJVBQjKwn6PR2ZSJOtSu23+sRcWYC1OHeAP9anIo7V6
         LtnYBpideb9FFZEoVMC05/VTl1Q6FPxy397wGYiQeVW882k+KWCcA5BM5Xsb2af3TXUU
         aw2fKLRTiXg1MJaSjfTGcIbqUo2kWIG33WJ5FvKCORzzlxCDqZILptTdlusXoYFINY2d
         TpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yX13UxWnJ8nh0jv4F6ynYHuuA4s7Rp3X3QUy9L7fHFw=;
        b=q69/xp444Ra2kMK7nfLzMZNeCknWd5flH7+x3Nnvql+Bmx+s+lBpX+YBBbW2Lm+GJq
         M4+WBmP4FnPuVpyJ/ZCP9enoy3yDaVhklSg5x/0BTqI9H4cgngQlqv+gsFkCpBFd1dlo
         y3NYCp4V6WANl+FTmrvhDdOBWX6xiCqEtt9SY0OlCnvzP5NKOs0AJTwfxEycBtcB0bnz
         usx0N88VhwA+3IQx6HJftVmeIMQTMz0WWl2zLT/TQ7+OVX0iScsIY5MZMT7yYDbm3Lgg
         f5Pikef5Ri+WfUUhGCpQA8IPEw8B2FUo8YM6yVSASRYIHPumh5DGnbayng7b5FZFUjon
         OSUg==
X-Gm-Message-State: AA+aEWa83dLZogpeeVQD2kVTI9GhwgNRjBjI9KrYcF42sqpdY1His+a3
        YS4tODxlsNMQrBY8PEeoFUQXgg==
X-Google-Smtp-Source: AFSGD/UCSPM+MStRNIb8eRVdPspBQwD/yxjoNfRGHYsEPQ48OejEDHXEbobuidxfo3VNHNuK9HMsEQ==
X-Received: by 2002:a17:902:24a2:: with SMTP id w31mr1963035pla.216.1542855522506;
        Wed, 21 Nov 2018 18:58:42 -0800 (PST)
Received: from ziepe.ca (S010614cc2056d97f.ed.shawcable.net. [174.3.196.123])
        by smtp.gmail.com with ESMTPSA id t12sm45679384pfi.45.2018.11.21.18.58.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Nov 2018 18:58:41 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1gPfCS-0007Yc-JX; Wed, 21 Nov 2018 19:58:40 -0700
Date:   Wed, 21 Nov 2018 19:58:40 -0700
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
Message-ID: <20181122025840.GB19938@ziepe.ca>
References: <20181113002354.GO3695@mtr-leonro.mtl.com>
 <95310df4-b32c-42f0-c750-3ad5eb89b3dd@gmail.com>
 <20181114160017.GI3759@mtr-leonro.mtl.com>
 <20181115085109.GD157308@Turing-Arch-b>
 <20181115145455.GN3759@mtr-leonro.mtl.com>
 <20181119091405.GE157308@Turing-Arch-b>
 <20181119184954.GB4890@ziepe.ca>
 <20181120030702.GH157308@Turing-Arch-b>
 <20181120032939.GR4890@ziepe.ca>
 <20181121060805.GJ157308@Turing-Arch-b>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181121060805.GJ157308@Turing-Arch-b>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Nov 21, 2018 at 02:08:05PM +0800, Kenneth Lee wrote:

> > But considering Jean's SVA stuff seems based on mmu notifiers, I have
> > a hard time believing that it has any different behavior from RDMA's
> > ODP, and if it does have different behavior, then it is probably just
> > a bug in the ODP implementation.
> 
> As Jean has explained, his solution is based on page table sharing. I think ODP
> should also consider this new feature.

Shared page tables would require the HW to walk the page table format
of the CPU directly, not sure how that would be possible for ODP?

Presumably the implementation for ARM relies on the IOMMU hardware
doing this?

> > > > If all your driver needs is to mmap some PCI bar space, route
> > > > interrupts and do DMA mapping then mediated VFIO is probably a good
> > > > choice. 
> > > 
> > > Yes. That is what is done in our RFCv1/v2. But we accepted Jerome's opinion and
> > > try not to add complexity to the mm subsystem.
> > 
> > Why would a mediated VFIO driver touch the mm subsystem? Sounds like
> > you don't have a VFIO driver if it needs to do stuff like that...
> 
> VFIO has no ODP-like solution, and if we want to solve the fork problem, we have
> to make some change to iommu and the fork procedure. Further, VFIO takes every
> queue as a independent device. This create a lot of trouble on resource
> management. For example, you will need a manager process to withdraw the unused
> device and you need to let the user process know about PASID of the queue, and
> so on.

Well, I would think you'd add SVA support to the VFIO driver as a
generic capability - it seems pretty useful for any VFIO user as it
avoids all the kernel upcalls to do memory pinning and DMA address
translation.

Once the VFIO driver knows about this as a generic capability then the
device it exposes to userspace would use CPU addresses instead of DMA
addresses.

The question is if your driver needs much more than the device
agnostic generic services VFIO provides.

I'm not sure what you have in mind with resource management.. It is
hard to revoke resources from userspace, unless you are doing
kernel syscalls, but then why do all this?

Jason
