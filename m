Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A62527DE6B
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Nov 2018 19:13:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730253AbeKTFOt (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Nov 2018 00:14:49 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45680 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730017AbeKTFOs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Nov 2018 00:14:48 -0500
Received: by mail-pg1-f195.google.com with SMTP id y4so14210966pgc.12
        for <linux-doc@vger.kernel.org>; Mon, 19 Nov 2018 10:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HPzch2+xfQ5Zwwd0ies2SS5zaY9twNjS93JRuKHK8CA=;
        b=jNXOpRFoNcCcayA62mq7lwhIOWAS5J7dNGC9gthtdWdsqRKYrarjfOWFQKfr+INzbK
         LasMexlAnQ2Dk+2QskAMPMOZ1va6Gp9lgqe4aRvZCakMDTQjQ/AYyINZSZyTH+HRzvzi
         fvp2deyJiJe8xguHCTj8N3wAWaQ3JnxgScA8t8690Lo35ayH4M9KuK31fXw9DwND+h9X
         HWOt5M6JpYI5fx1jbBoNK/79RN0qCR4wSDoAq/RWF1oJByGwLbr5QsKLPgwA0jvJq193
         c2fLf2ZSECNuhrSehpJ+2Q+d+4WWud7N8H2sYRYz6IRo/Pb3AdKZLgVvuN6Klqs5Q1Si
         a8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HPzch2+xfQ5Zwwd0ies2SS5zaY9twNjS93JRuKHK8CA=;
        b=WvSHWMT5nKVhkIoNfH4Cpf8smZZMQnlMglpu9Eq2D//ipmVZuDSBv2MklM2Ys4Cvxd
         K/x39Ms6KF1/u3lWI6fIHlmx4bUhiTtNSPf8a3GWBcCapkKRbLAnoAYz4jeUiInMpybp
         7oSrpasbnWHKRMMA6VTGHnBhyvyVJt8OXHvH+XrCZqjn1rfkzJ38yZ042bTZEnY874I0
         ew1ddfqo0noMiqzHBqXTKJ1lpCCkU2wVJ8kvWJKRcelPHg+UaLZb/WFlCfkxI7AWxYG0
         KB0hgzWmPqIDfQ6YjZwLfZXgDMa6DMmuESM+0YPptujnm3DhgZisFnEwD9zmSySU24/0
         KafQ==
X-Gm-Message-State: AGRZ1gK6LcXiO6QqsXmk38NWFYtLnxh8B4Fqpv7T1sTl3bF1Q9z8UUgR
        WYtBJYpEpEG7l3kv/tGZZk7qAQ==
X-Google-Smtp-Source: AJdET5e/ZSI5pFjSoHj7WeYB6xPCwPyGj4xsRMgo1sLtFKB6aaBqQjXvhgeGF+zhFSLfBMP3zTs+HQ==
X-Received: by 2002:a62:1a92:: with SMTP id a140-v6mr24139005pfa.219.1542653397352;
        Mon, 19 Nov 2018 10:49:57 -0800 (PST)
Received: from ziepe.ca (S010614cc2056d97f.ed.shawcable.net. [174.3.196.123])
        by smtp.gmail.com with ESMTPSA id c67sm17851554pfg.170.2018.11.19.10.49.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Nov 2018 10:49:55 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1gOocM-00053j-TR; Mon, 19 Nov 2018 11:49:54 -0700
Date:   Mon, 19 Nov 2018 11:49:54 -0700
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
Message-ID: <20181119184954.GB4890@ziepe.ca>
References: <20181112075807.9291-1-nek.in.cn@gmail.com>
 <20181112075807.9291-2-nek.in.cn@gmail.com>
 <20181113002354.GO3695@mtr-leonro.mtl.com>
 <95310df4-b32c-42f0-c750-3ad5eb89b3dd@gmail.com>
 <20181114160017.GI3759@mtr-leonro.mtl.com>
 <20181115085109.GD157308@Turing-Arch-b>
 <20181115145455.GN3759@mtr-leonro.mtl.com>
 <20181119091405.GE157308@Turing-Arch-b>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181119091405.GE157308@Turing-Arch-b>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 19, 2018 at 05:14:05PM +0800, Kenneth Lee wrote:
 
> If the hardware cannot share page table with the CPU, we then need to have
> some way to change the device page table. This is what happen in ODP. It
> invalidates the page table in device upon mmu_notifier call back. But this cannot
> solve the COW problem: if the user process A share a page P with device, and A 
> forks a new process B, and it continue to write to the page. By COW, the
> process B will keep the page P, while A will get a new page P'. But you have
> no way to let the device know it should use P' rather than P.

Is this true? I thought mmu_notifiers covered all these cases.

The mm_notifier for A should fire if B causes the physical address of
A's pages to change via COW. 

And this causes the device page tables to re-synchronize.

> In WarpDrive/uacce, we make this simple. If you support IOMMU and it support
> SVM/SVA. Everything will be fine just like ODP implicit mode. And you don't need
> to write any code for that. Because it has been done by IOMMU framework. If it

Looks like the IOMMU code uses mmu_notifier, so it is identical to
IB's ODP. The only difference is that IB tends to have the IOMMU page
table in the device, not in the CPU.

The only case I know if that is different is the new-fangled CAPI
stuff where the IOMMU can directly use the CPU's page table and the
IOMMU page table (in device or CPU) is eliminated.

Anyhow, I don't think a single instance of hardware should justify an
entire new subsystem. Subsystems are hard to make and without multiple
hardware examples there is no way to expect that it would cover any
future use cases.

If all your driver needs is to mmap some PCI bar space, route
interrupts and do DMA mapping then mediated VFIO is probably a good
choice. 

If it needs to do a bunch of other stuff, not related to PCI bar
space, interrupts and DMA mapping (ie special code for compression,
crypto, AI, whatever) then you should probably do what Jerome said and
make a drivers/char/hisillicon_foo_bar.c that exposes just what your
hardware does.

If you have networking involved in here then consider RDMA,
particularly if this functionality is already part of the same
hardware that the hns infiniband driver is servicing.

'computational MRs' are a reasonable approach to a side-car offload of
already existing RDMA support.

Jason
