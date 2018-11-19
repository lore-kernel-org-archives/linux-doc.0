Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CF0517D8A9
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Nov 2018 20:12:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729957AbeKTGhS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Nov 2018 01:37:18 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36661 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730352AbeKTGhM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Nov 2018 01:37:12 -0500
Received: by mail-pf1-f195.google.com with SMTP id b85so8545273pfc.3
        for <linux-doc@vger.kernel.org>; Mon, 19 Nov 2018 12:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uvRC36rXsNXiZnvvRR40e4FzmmdFK6vqRNz0Zao0K2M=;
        b=nO5L3dEgm53OeydXNSnYxOhNHwB2KJu3TRJvXtRmJYt7kt3qK31s+d0CyL1V2AepsW
         HLS6K57IqygFI2omIJZxzr/QJ59Dt6pNAMYH5HG3lA9Zw0GCv36/y5YHmhFD0BUkgPiG
         T5rExH+g8/UFLKbhUy6yak75l+1NZTkaVhiFjGVK1Wheio4lbHDxkxBr3TgXEFidI5QV
         ++XkWPzyammbQKtvd1xqRvbQeEUy4utW13WViotpKw0eAu9yi6Og6gUCUjwYHPl66X6S
         6ZNi50xl9v3/F6C8Emo8SHuYzzueZTBTo/DaTiw2nMELJUkFiiB6SOtzTf39+snTHCbl
         grtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uvRC36rXsNXiZnvvRR40e4FzmmdFK6vqRNz0Zao0K2M=;
        b=ZfmgoUARS3FwE7KMGpGxvxq6Z5pRIscnopW7bBAgAGxpW9hf/5WPh5dXsbB1Wi9jSf
         ExjnurNdsbQ7M74VuK62lf+nhdSfIFvhWXTObDZyHdd7bPt8qB3JSZm4589J/lkbRATn
         SW6/RMTs7GkJz/XQOjw0rDnd96mbsZjTvwSf2cu3mE5QKfkg5Wn17q8yZCQfVYELWjLV
         28ml+cDhf39JQReeLPRTWqh320OKQwtX5/K8LmYxZyjwjrnTH83QoeW1CzD+AkY2x85V
         kbJzf80SuyzGYvsZmN6jIhBkXRBmiVVuI+dNsP4QacZV/EZz569P5ZWtg5avWrV5AEmZ
         ciqw==
X-Gm-Message-State: AGRZ1gKhRxt+ges6uUyOkR1T3iVX816V+wczCtDq8qmzCtsLH/YlGm5w
        /pDEdslJrVekD7ZOJfJoKa+ZeQ==
X-Google-Smtp-Source: AJdET5dLVXYI0787gY/cnzC5nocCn2FhHx6xqd+eC9wB8gK7UB4tT0WPSZ1GLgM1QoseJ59Kkklu7Q==
X-Received: by 2002:a63:1204:: with SMTP id h4mr21425509pgl.51.1542658317828;
        Mon, 19 Nov 2018 12:11:57 -0800 (PST)
Received: from ziepe.ca (S010614cc2056d97f.ed.shawcable.net. [174.3.196.123])
        by smtp.gmail.com with ESMTPSA id x27sm56696559pfe.178.2018.11.19.12.11.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Nov 2018 12:11:56 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1gOptk-0005xv-3X; Mon, 19 Nov 2018 13:11:56 -0700
Date:   Mon, 19 Nov 2018 13:11:56 -0700
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
Message-ID: <20181119201156.GG4890@ziepe.ca>
References: <20181119091405.GE157308@Turing-Arch-b>
 <20181119091910.GF157308@Turing-Arch-b>
 <20181119104801.GF8268@mtr-leonro.mtl.com>
 <20181119164853.GA4593@redhat.com>
 <20181119182752.GA4890@ziepe.ca>
 <20181119184215.GB4593@redhat.com>
 <20181119185333.GC4890@ziepe.ca>
 <20181119191721.GC4593@redhat.com>
 <20181119192702.GD4890@ziepe.ca>
 <20181119194631.GE4593@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181119194631.GE4593@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 19, 2018 at 02:46:32PM -0500, Jerome Glisse wrote:

> > ?? How can O_DIRECT be fine but RDMA not? They use exactly the same
> > get_user_pages flow, right? Can we do what O_DIRECT does in RDMA and
> > be fine too?
> > 
> > AFAIK the only difference is the length of the race window. You'd have
> > to fork and fault during the shorter time O_DIRECT has get_user_pages
> > open.
> 
> Well in O_DIRECT case there is only one page table, the CPU
> page table and it gets updated during fork() so there is an
> ordering there and the race window is small.

Not really, in O_DIRECT case there is another 'page table', we just
call it a DMA scatter/gather list and it is sent directly to the block
device's DMA HW. The sgl plays exactly the same role as the various HW
page list data structures that underly RDMA MRs.

It is not a page table that matters here, it is if the DMA address of
the page is active for DMA on HW.

Like you say, the only difference is that the race is hopefully small
with O_DIRECT (though that is not really small, NVMeof for instance
has windows as large as connection timeouts, if you try hard enough)

So we probably can trigger this trouble with O_DIRECT and fork(), and
I would call it a bug :(

> > Why? Keep track in each mm if there are any active get_user_pages
> > FOLL_WRITE pages in the mm, if yes then sweep the VMAs and fix the
> > issue for the FOLL_WRITE pages.
> 
> This has a cost and you don't want to do it for O_DIRECT. I am pretty
> sure that any such patch to modify fork() code path would be rejected.
> At least i would not like it and vote against.

I was thinking the incremental cost on top of what John is already
doing would be very small in the common case and only be triggered in
cases that matter (which apps should avoid anyhow).

Jason
