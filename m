Return-Path: <SRS0=A0dr=DB=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B5CC4363D
	for <linux-doc@archiver.kernel.org>; Thu, 24 Sep 2020 00:43:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B98452311E
	for <linux-doc@archiver.kernel.org>; Thu, 24 Sep 2020 00:43:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbgIXAnR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Sep 2020 20:43:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbgIXAnR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Sep 2020 20:43:17 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43E8BC0613CE;
        Wed, 23 Sep 2020 17:43:17 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id DAE2911E58429;
        Wed, 23 Sep 2020 17:26:28 -0700 (PDT)
Date:   Wed, 23 Sep 2020 17:43:15 -0700 (PDT)
Message-Id: <20200923.174315.476378523694485733.davem@davemloft.net>
To:     mchehab+huawei@kernel.org
Cc:     linux-doc@vger.kernel.org, corbet@lwn.net, ast@kernel.org,
        andriin@fb.com, xiyou.wangcong@gmail.com, edumazet@google.com,
        fruggeri@arista.com, kuba@kernel.org, jiri@mellanox.com,
        ap420073@gmail.com, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH 1/3] net: fix a new kernel-doc warning at dev.c
From:   David Miller <davem@davemloft.net>
In-Reply-To: <dbe62eb5e9dda5a5ee145f866a24c4cfddbd754f.1600773619.git.mchehab+huawei@kernel.org>
References: <cover.1600773619.git.mchehab+huawei@kernel.org>
        <dbe62eb5e9dda5a5ee145f866a24c4cfddbd754f.1600773619.git.mchehab+huawei@kernel.org>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [2620:137:e000::1:9]); Wed, 23 Sep 2020 17:26:29 -0700 (PDT)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date: Tue, 22 Sep 2020 13:22:52 +0200

> kernel-doc expects the function prototype to be just after
> the kernel-doc markup, as otherwise it will get it all wrong:
> 
> 	./net/core/dev.c:10036: warning: Excess function parameter 'dev' description in 'WAIT_REFS_MIN_MSECS'
> 
> Fixes: 0e4be9e57e8c ("net: use exponential backoff in netdev_wait_allrefs")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Applied to net-next.
