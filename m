Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79257C4338F
	for <linux-doc@archiver.kernel.org>; Sat, 31 Jul 2021 14:49:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 507F560FE7
	for <linux-doc@archiver.kernel.org>; Sat, 31 Jul 2021 14:49:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233299AbhGaOtl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 31 Jul 2021 10:49:41 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:55246 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233273AbhGaOtl (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 31 Jul 2021 10:49:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=4wIE3UAedvU0X5OL046mu4GRUy2Zi6vswLl1mtaMiEc=; b=cOsp/c4Q+6nzxmoFHR3qNh9Zj6
        u5Mfu0eYrrGLfxB+nrPWIZDqS+2aEYmva+fPotWSwdxuyPeFxNJvq5NkFKwnN4llv68kUn3qk6Dpl
        A5AJMRSE/TFu0OVRLNCWKOnLQJZy5MOGnA8L46B5NO6Yds5n0nc/khjCoGEzEUOkcT3c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1m9qIn-00Fcgo-GD; Sat, 31 Jul 2021 16:49:25 +0200
Date:   Sat, 31 Jul 2021 16:49:25 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH net] docs: operstates: document IF_OPER_TESTING
Message-ID: <YQVi9et1Ew7ICCiG@lunn.ch>
References: <20210731144052.1000147-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210731144052.1000147-1-kuba@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jul 31, 2021 at 07:40:52AM -0700, Jakub Kicinski wrote:
> IF_OPER_TESTING is in fact used today.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
