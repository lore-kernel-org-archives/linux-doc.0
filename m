Return-Path: <SRS0=PsPG=6H=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B3FC55185
	for <linux-doc@archiver.kernel.org>; Thu, 23 Apr 2020 02:29:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7ECF720747
	for <linux-doc@archiver.kernel.org>; Thu, 23 Apr 2020 02:29:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbgDWC3l (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Apr 2020 22:29:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726271AbgDWC3l (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Apr 2020 22:29:41 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0412C03C1AA;
        Wed, 22 Apr 2020 19:29:40 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id B3DC4127AA060;
        Wed, 22 Apr 2020 19:29:40 -0700 (PDT)
Date:   Wed, 22 Apr 2020 19:29:40 -0700 (PDT)
Message-Id: <20200422.192940.1685473383760448858.davem@davemloft.net>
To:     stephen@networkplumber.org
Cc:     netdev@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: add documentation of ping_group_range
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200421203448.17937-1-stephen@networkplumber.org>
References: <20200421203448.17937-1-stephen@networkplumber.org>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Wed, 22 Apr 2020 19:29:40 -0700 (PDT)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Stephen Hemminger <stephen@networkplumber.org>
Date: Tue, 21 Apr 2020 13:34:48 -0700

> Support for non-root users to send ICMP ECHO requests was added
> back in Linux 3.0 kernel, but the documentation for the sysctl
> to enable it has been missing.
> 
> Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>

Applied, thanks.
