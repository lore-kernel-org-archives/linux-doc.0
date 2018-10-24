Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2EF5C7D082
	for <lwn-linux-doc@archive.lwn.net>; Wed, 24 Oct 2018 20:09:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbeJYEir (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 25 Oct 2018 00:38:47 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:36595 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbeJYEir (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Oct 2018 00:38:47 -0400
Received: by mail-io1-f66.google.com with SMTP id o19-v6so3970457iod.3
        for <linux-doc@vger.kernel.org>; Wed, 24 Oct 2018 13:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=myUIaGAQ4FX09BC3WcQ/tTbGenycR0huzAA5WP9HNOM=;
        b=BCa/w9Kqa9uMTeQwC1JOhravLnMIgNNPp8L1DXtvsKbPyw8Gzfh5L3JzRb+eI4HCAg
         HjS2dou6uBQ189nOnHvQGwo/ZRm2eUgRRFAqtPONkVsGYF0c9W+6HAQTFcmIajf/HEmq
         JuM4St/WzCKJ5lA+rwMCD0bGoQcuNoUNDnhw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=myUIaGAQ4FX09BC3WcQ/tTbGenycR0huzAA5WP9HNOM=;
        b=IRd+RgR9WOcq1qJ0drFOjqvcP27U1t9grFtuTRmSc31E5yvppJ3hPpbIi4+dIOJJxW
         2NuVDibb3W1fU5Am9CEkxfmWP+6rsGiyNGHKB4y8xiVxpYWDLKKwlzrBfGnpjVLFd4VS
         dz6HJ+MGbxeDfMgNu5eLTU5ki9vzXAApd2b2pU5StFbDBAJsjLWqjGLkRO0g/Oyh8D1+
         85Gty+3vIS3tcUuAspnrp8x53MWwhOYanXhzoQYFwIBDzLxYLFc5oCJKRfYMLh2XO/CM
         77rRlrT+gDdl6Xg+M7b6aJqvNols7gry6DMh4AGYSUny6Rm+BSsAW3Gtv7pGEUGXdl0V
         IH+w==
X-Gm-Message-State: AGRZ1gKhKG9zZWGUHv5Ku7vlvaC+BWceJnsMxbwH8zAQB05bpXeUDlB+
        ZoeJvWuqhyWwbFLDFusywcrwWNYmbIyOrRCIGfMTXQ==
X-Google-Smtp-Source: AJdET5eLstqBg2h3GbonuFksgEXQq4ZMRiv99rVwn5cFUv3HtbaQvHtHPVMlnYbM36oA68bbtoagdoolPEirK3hdR0w=
X-Received: by 2002:a6b:ac45:: with SMTP id v66-v6mr16627405ioe.66.1540411758345;
 Wed, 24 Oct 2018 13:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <20181024013132.115907-1-dbasehore@chromium.org>
 <20181024013132.115907-2-dbasehore@chromium.org> <154038647375.53599.631725372765617195@swboyd.mtv.corp.google.com>
In-Reply-To: <154038647375.53599.631725372765617195@swboyd.mtv.corp.google.com>
From:   "dbasehore ." <dbasehore@chromium.org>
Date:   Wed, 24 Oct 2018 13:09:07 -0700
Message-ID: <CAGAzgspGA0CExLBrJvM8E7a1ybp=PRDz6kJ-dKyp0hi9db-19g@mail.gmail.com>
Subject: Re: [PATCH 1/6] clk: Remove recursion in clk_core_{prepare,enable}()
To:     sboyd@kernel.org
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-doc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        aisheng.dong@nxp.com, mchehab+samsung@kernel.org, corbet@lwn.net,
        Stephen Boyd <sboyd@codeaurora.org>, jbrunet@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 24, 2018 at 6:07 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Derek Basehore (2018-10-23 18:31:27)
> > From: Stephen Boyd <sboyd@codeaurora.org>
> >
> > Enabling and preparing clocks can be written quite naturally with
> > recursion. We start at some point in the tree and recurse up the
> > tree to find the oldest parent clk that needs to be enabled or
> > prepared. Then we enable/prepare and return to the caller, going
> > back to the clk we started at and enabling/preparing along the
> > way.
> >
> > The problem is recursion isn't great for kernel code where we
> > have a limited stack size. Furthermore, we may be calling this
> > code inside clk_set_rate() which also has recursion in it, so
> > we're really not looking good if we encounter a tall clk tree.
> >
> > Let's create a stack instead by looping over the parent chain and
> > collecting clks of interest. Then the enable/prepare becomes as
> > simple as iterating over that list and calling enable.
> >
> > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> > Signed-off-by: Derek Basehore <dbasehore@chromium.org>
>
> Did you change anything substantially? Or is it just a resend of my
> patch from a while ago? If you can add a link to the original and also
> describe what changed in a maintainer tag it would be much easier for me
> to compare.
>

It should just be your patch with the compilation warning fixed.

This is picked up from https://lore.kernel.org/patchwork/patch/814369/
