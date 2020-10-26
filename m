Return-Path: <SRS0=Bwbi=EB=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1FEEC4363A
	for <linux-doc@archiver.kernel.org>; Mon, 26 Oct 2020 13:17:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6981924640
	for <linux-doc@archiver.kernel.org>; Mon, 26 Oct 2020 13:17:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1774634AbgJZNRE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Oct 2020 09:17:04 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:44574 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1774629AbgJZNRE (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 26 Oct 2020 09:17:04 -0400
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1kX2Mo-003biD-UZ; Mon, 26 Oct 2020 14:16:54 +0100
Date:   Mon, 26 Oct 2020 14:16:54 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH RESEND 1/3] net: phy: fix kernel-doc markups
Message-ID: <20201026131654.GJ752111@lunn.ch>
References: <cover.1603705472.git.mchehab+huawei@kernel.org>
 <d23c5638c4fd0e7b9f294f2bf647d2386428eb7e.1603705472.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d23c5638c4fd0e7b9f294f2bf647d2386428eb7e.1603705472.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 26, 2020 at 10:47:36AM +0100, Mauro Carvalho Chehab wrote:
> Some functions have different names between their prototypes
> and the kernel-doc markup.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

