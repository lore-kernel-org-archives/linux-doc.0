Return-Path: <SRS0=Succ=4U=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF97C3F2C6
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 23:35:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8A1A920716
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 23:35:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728347AbgCCXfs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Mar 2020 18:35:48 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:37136 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728317AbgCCXfr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Mar 2020 18:35:47 -0500
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 4AE3215A9FC20;
        Tue,  3 Mar 2020 15:35:47 -0800 (PST)
Date:   Tue, 03 Mar 2020 15:35:46 -0800 (PST)
Message-Id: <20200303.153546.1011655145785464830.davem@davemloft.net>
To:     rmk+kernel@armlinux.org.uk
Cc:     kuba@kernel.org, corbet@lwn.net, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next] doc: sfp-phylink: correct code indentation
From:   David Miller <davem@davemloft.net>
In-Reply-To: <E1j97cE-0004aW-Ur@rmk-PC.armlinux.org.uk>
References: <E1j97cE-0004aW-Ur@rmk-PC.armlinux.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Tue, 03 Mar 2020 15:35:47 -0800 (PST)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Russell King <rmk+kernel@armlinux.org.uk>
Date: Tue, 03 Mar 2020 13:29:42 +0000

> Using vim to edit the phylink documentation reveals some mistakes due
> to the "invisible" pythonesque white space indentation that can't be
> seen with other editors. Fix it.
> 
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

I applied this, but you do know that GIT is going to warn about the
trailing whitespace to me:

.git/rebase-apply/patch:29: trailing whitespace.
	
.git/rebase-apply/patch:39: trailing whitespace.
	
warning: 2 lines add whitespace errors.

Do the empty lines really need that leading TAB?
