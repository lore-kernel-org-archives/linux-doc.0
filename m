Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7794EC4338F
	for <linux-doc@archiver.kernel.org>; Sun, 25 Jul 2021 20:35:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A527606A5
	for <linux-doc@archiver.kernel.org>; Sun, 25 Jul 2021 20:35:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbhGYTys (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 25 Jul 2021 15:54:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbhGYTyr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 25 Jul 2021 15:54:47 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 420F5C061757
        for <linux-doc@vger.kernel.org>; Sun, 25 Jul 2021 13:35:16 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B7A032E6;
        Sun, 25 Jul 2021 20:35:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B7A032E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1627245315; bh=BZXW1j20s6fhRKq39mMEcfmLaqE07l2pyWK79bnu+0E=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=FjWsfu7CMGRNVt+f8fRwiydf2i3HwW717ZqqVJYQjascDCKqSN17khPoj8DEfi9Gc
         ItPrk1P6okOON06tx4y+x6PbvLmn3H6TfTNEqPc4HIFu7/CrgnOxDvcmL7x+E27jVB
         x7GANRIUnq6rFfge9UhaEMvLlSwpif3oOwsFTPzzzeeftAnWMUyPNuQpGUrza2b+Ci
         ili3DoUFHxcPDgX5wGsHREIOd0ObaMMNw6VC2rZUtNcJY2hn5KA4vNN+goumZq9m4T
         Z7piGiKzFVmArqauE2G7RmjDDK0lKesg6n/DpJUA5Q2Ddrk9UAMukLrTPAoN5DG6X7
         S41XL20V9j8EA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Ioana Ciornei <ciorneiioana@gmail.com>,
        Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     linux-doc@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        Jing Zhang <jingzhangos@google.com>,
        Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: Re: [PATCH 0/4] docs: small fixes
In-Reply-To: <20210722100356.635078-1-ciorneiioana@gmail.com>
References: <20210722100356.635078-1-ciorneiioana@gmail.com>
Date:   Sun, 25 Jul 2021 14:35:15 -0600
Message-ID: <87k0leuo70.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Ioana Ciornei <ciorneiioana@gmail.com> writes:

> From: Ioana Ciornei <ioana.ciornei@nxp.com>
>
> This patch set is just a bundle of small fixes for problems and build
> warnings that I stumbled upon when trying to add a new section of
> documentation.
>
> Ioana Ciornei (4):
>   docs: printk-formats: fix build warning
>   docs: kvm: fix build warnings
>   docs: kvm: properly format code blocks and lists
>   docs: networking: dpaa2: fix chapter title format
>
>  Documentation/core-api/printk-formats.rst     |  1 +
>  .../ethernet/freescale/dpaa2/dpio-driver.rst  |  1 +
>  Documentation/virt/kvm/api.rst                | 32 +++++++++++--------
>  3 files changed, 20 insertions(+), 14 deletions(-)

I've applied the set.

Thanks,

jon
