Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 362B3C433ED
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 00:13:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE53E61369
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 00:13:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235870AbhDGANU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Apr 2021 20:13:20 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:37042 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233917AbhDGANU (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Apr 2021 20:13:20 -0400
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1lTvoh-00FDWi-Bi; Wed, 07 Apr 2021 02:13:07 +0200
Date:   Wed, 7 Apr 2021 02:13:07 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, mkubecek@suse.cz
Subject: Re: [PATCH net-next] docs: ethtool: correct quotes
Message-ID: <YGz5E29hbwwn+y8u@lunn.ch>
References: <20210406225931.1846872-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210406225931.1846872-1-kuba@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 06, 2021 at 03:59:31PM -0700, Jakub Kicinski wrote:
> Quotes to backticks. All commands use backticks since the names
> are constants.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Upps. Sorry.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
