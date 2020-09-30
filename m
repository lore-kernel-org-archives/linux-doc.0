Return-Path: <SRS0=Pt5A=DH=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A00C4363D
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 21:23:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A0FD20759
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 21:23:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729792AbgI3VXH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Sep 2020 17:23:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725814AbgI3VXH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Sep 2020 17:23:07 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 736F2C061755;
        Wed, 30 Sep 2020 14:23:07 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 8458913C6ADB7;
        Wed, 30 Sep 2020 14:06:19 -0700 (PDT)
Date:   Wed, 30 Sep 2020 14:23:06 -0700 (PDT)
Message-Id: <20200930.142306.880363049583322752.davem@davemloft.net>
To:     mchehab+huawei@kernel.org
Cc:     linux-doc@vger.kernel.org, corbet@lwn.net, kuba@kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v4 33/52] docs: net: statistics.rst: remove a
 duplicated kernel-doc
From:   David Miller <davem@davemloft.net>
In-Reply-To: <c484b653417a3ba2c0eb7bb70331397577a71980.1601467849.git.mchehab+huawei@kernel.org>
References: <cover.1601467849.git.mchehab+huawei@kernel.org>
        <c484b653417a3ba2c0eb7bb70331397577a71980.1601467849.git.mchehab+huawei@kernel.org>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [2620:137:e000::1:9]); Wed, 30 Sep 2020 14:06:19 -0700 (PDT)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date: Wed, 30 Sep 2020 15:24:56 +0200

> include/linux/ethtool.h is included twice with kernel-doc,
> both to document ethtool_pause_stats(). The first one is
> at statistics.rst, and the second one at ethtool-netlink.rst.
> 
> Replace one of the references to use the name of the
> function. The automarkup.py extension should create the
> cross-references.
> 
> Solves this warning:
> 
> 	../Documentation/networking/ethtool-netlink.rst: WARNING: Duplicate C declaration, also defined in 'networking/statistics'.
> 	Declaration is 'ethtool_pause_stats'.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: David S. Miller <davem@davemloft.net>
