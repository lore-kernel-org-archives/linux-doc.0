Return-Path: <SRS0=8YJ4=CM=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86352C433E2
	for <linux-doc@archiver.kernel.org>; Thu,  3 Sep 2020 21:40:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61F9C206CA
	for <linux-doc@archiver.kernel.org>; Thu,  3 Sep 2020 21:40:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgICVke (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Sep 2020 17:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726528AbgICVke (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Sep 2020 17:40:34 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45F65C061244
        for <linux-doc@vger.kernel.org>; Thu,  3 Sep 2020 14:40:33 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 063A17DE;
        Thu,  3 Sep 2020 21:40:32 +0000 (UTC)
Date:   Thu, 3 Sep 2020 15:40:31 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Drew DeVault <sir@cmpwn.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 0/4] Improvements to submitting-patches.rst
Message-ID: <20200903154031.0faded85@lwn.net>
In-Reply-To: <20200903160545.83185-1-sir@cmpwn.com>
References: <20200903160545.83185-1-sir@cmpwn.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu,  3 Sep 2020 12:05:41 -0400
Drew DeVault <sir@cmpwn.com> wrote:

> Thanks for the feedback Jonathan! This one should be good to go.

Indeed it is - applied, thanks.

One little thing: it would have been good to keep Randy's Reviewed-by tag
for patch 2; I poked it in.

jon
