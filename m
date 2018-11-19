Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6E1DF7E2C8
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Nov 2018 19:13:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730614AbeKTFS3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Nov 2018 00:18:29 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34187 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730613AbeKTFS2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Nov 2018 00:18:28 -0500
Received: by mail-pl1-f193.google.com with SMTP id f12-v6so15020771plo.1
        for <linux-doc@vger.kernel.org>; Mon, 19 Nov 2018 10:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=orlOOr/BaGm17SJPpAirxLsaGVwjrtuMXrDM5zHWlAM=;
        b=eDvpkyndPb9nHnCbDWhNMRFZo+KUUCjQ3cAGuI97NRsiytg5IiG5PwFWwQN5hawQ7h
         2S+ZlFoXi2SY9MyNVMhReXKyV7DQe4eyXH+mV5jxVzd0b5FvsX+joGCA9y/bPa377WRB
         vwKbkAJeBwexOgy1Q5AxeTXiLSpSP2cB/B2mKvoYKhlXNIZ6WTTQ2RQx04TJoisWBtv6
         AAm4Nw7llyJHLWK/Kw8obScvm0/QSNtRT7XDDaq3v1h8CQJbTpzVR91bFVVkf880NYv8
         W3K8s/Jub68imUNSsoGkFri6V5wWxwh6GWiESbHN9K3PJr5P2JfTaDsJao4WADuD2b6h
         QAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=orlOOr/BaGm17SJPpAirxLsaGVwjrtuMXrDM5zHWlAM=;
        b=ZSCdOnECoCK3y4ehTIxdc1tP9kQm13P/2rrPna8MuP15vI2FUFl1d+Uhjj3RNAsKSi
         CvmyOSi9SiWiZQK3I8RlHJQHps8iAWAHLKMaX9N4n1/hfMSOKmxJis04UTREKMmncQXf
         LLs/uaT3cVXR4DNfFoAhXLbWw6wyiT0vbxyCbWoG9dnPJAQJiZ8qXFLhtRMD46PY2s5Q
         EN0pBoslXS3oXUQZQYr4ROJlAQMF0vBpQNGWpHrswklSVN5n6X6pv9XWDdOPoiBuuVWX
         YiH47f1MZsQVq+0jg0ZIb65QUrFslDVW5+c+VQUYTrUtV9iJwnfb2GddY65HRQf5FpCE
         l95w==
X-Gm-Message-State: AGRZ1gIeMpKBylvoL3x8j6c9/rJgK/9jvGdXso3xUQe31IGEFxU8mY18
        5dQ5qr07B0sU1Y0kM3FrIfRqJA==
X-Google-Smtp-Source: AJdET5dxOUhUB98xe6rTqY6BNrXvHa6s+q68yu6OA6hkZlyrpNm7U//bIp/SXUueSN0I32JGtlM0Gw==
X-Received: by 2002:a17:902:c5:: with SMTP id a63-v6mr23603684pla.201.1542653615215;
        Mon, 19 Nov 2018 10:53:35 -0800 (PST)
Received: from ziepe.ca (S010614cc2056d97f.ed.shawcable.net. [174.3.196.123])
        by smtp.gmail.com with ESMTPSA id g65sm115246778pfa.63.2018.11.19.10.53.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Nov 2018 10:53:34 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1gOoft-000563-FM; Mon, 19 Nov 2018 11:53:33 -0700
Date:   Mon, 19 Nov 2018 11:53:33 -0700
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Jerome Glisse <jglisse@redhat.com>
Cc:     Leon Romanovsky <leon@kernel.org>,
        Kenneth Lee <liguozhu@hisilicon.com>,
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
        Kenneth Lee <nek.in.cn@gmail.com>,
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
Message-ID: <20181119185333.GC4890@ziepe.ca>
References: <95310df4-b32c-42f0-c750-3ad5eb89b3dd@gmail.com>
 <20181114160017.GI3759@mtr-leonro.mtl.com>
 <20181115085109.GD157308@Turing-Arch-b>
 <20181115145455.GN3759@mtr-leonro.mtl.com>
 <20181119091405.GE157308@Turing-Arch-b>
 <20181119091910.GF157308@Turing-Arch-b>
 <20181119104801.GF8268@mtr-leonro.mtl.com>
 <20181119164853.GA4593@redhat.com>
 <20181119182752.GA4890@ziepe.ca>
 <20181119184215.GB4593@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181119184215.GB4593@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 19, 2018 at 01:42:16PM -0500, Jerome Glisse wrote:
> On Mon, Nov 19, 2018 at 11:27:52AM -0700, Jason Gunthorpe wrote:
> > On Mon, Nov 19, 2018 at 11:48:54AM -0500, Jerome Glisse wrote:
> > 
> > > Just to comment on this, any infiniband driver which use umem and do
> > > not have ODP (here ODP for me means listening to mmu notifier so all
> > > infiniband driver except mlx5) will be affected by same issue AFAICT.
> > > 
> > > AFAICT there is no special thing happening after fork() inside any of
> > > those driver. So if parent create a umem mr before fork() and program
> > > hardware with it then after fork() the parent might start using new
> > > page for the umem range while the old memory is use by the child. The
> > > reverse is also true (parent using old memory and child new memory)
> > > bottom line you can not predict which memory the child or the parent
> > > will use for the range after fork().
> > > 
> > > So no matter what you consider the child or the parent, what the hw
> > > will use for the mr is unlikely to match what the CPU use for the
> > > same virtual address. In other word:
> > > 
> > > Before fork:
> > >     CPU parent: virtual addr ptr1 -> physical address = 0xCAFE
> > >     HARDWARE:   virtual addr ptr1 -> physical address = 0xCAFE
> > > 
> > > Case 1:
> > >     CPU parent: virtual addr ptr1 -> physical address = 0xCAFE
> > >     CPU child:  virtual addr ptr1 -> physical address = 0xDEAD
> > >     HARDWARE:   virtual addr ptr1 -> physical address = 0xCAFE
> > > 
> > > Case 2:
> > >     CPU parent: virtual addr ptr1 -> physical address = 0xBEEF
> > >     CPU child:  virtual addr ptr1 -> physical address = 0xCAFE
> > >     HARDWARE:   virtual addr ptr1 -> physical address = 0xCAFE
> > 
> > IIRC this is solved in IB by automatically calling
> > madvise(MADV_DONTFORK) before creating the MR.
> > 
> > MADV_DONTFORK
> >   .. This is useful to prevent copy-on-write semantics from changing the
> >   physical location of a page if the parent writes to it after a
> >   fork(2) ..
> 
> This would work around the issue but this is not transparent ie
> range marked with DONTFORK no longer behave as expected from the
> application point of view.

Do you know what the difference is? The man page really gives no
hint..

Does it sometimes unmap the pages during fork?

I actually wonder if the kernel is a bit broken here, we have the same
problem with O_DIRECT and other stuff, right?

Really, if I have a get_user_pages FOLL_WRITE on a page and we fork,
then shouldn't the COW immediately be broken during the fork?

The kernel can't guarentee that an ongoing DMA will not write to those
pages, and it breaks the fork semantic to write to both processes.

> Also it relies on userspace doing the right thing (which is not
> something i usualy trust :)).

Well, if they do it wrong they get to keep all the broken bits :)

Jason
