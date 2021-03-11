Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18388C433DB
	for <linux-doc@archiver.kernel.org>; Thu, 11 Mar 2021 17:26:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C343864FE5
	for <linux-doc@archiver.kernel.org>; Thu, 11 Mar 2021 17:26:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbhCKR0W (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 11 Mar 2021 12:26:22 -0500
Received: from vps0.lunn.ch ([185.16.172.187]:52308 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229819AbhCKR0I (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 11 Mar 2021 12:26:08 -0500
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1lKP4S-00AOE1-Mw; Thu, 11 Mar 2021 18:26:00 +0100
Date:   Thu, 11 Mar 2021 18:26:00 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Cc:     netdev@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: networking: phy: Improve placement of parenthesis
Message-ID: <YEpSqO7/3eCJjx3b@lunn.ch>
References: <20210311172234.1812323-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210311172234.1812323-1-j.neuschaefer@gmx.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 11, 2021 at 06:22:34PM +0100, Jonathan Neuschäfer wrote:
> "either" is outside the parentheses, so the matching "or" should be too.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
