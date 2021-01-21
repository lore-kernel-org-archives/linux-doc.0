Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 015ECC433E9
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 20:13:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6FD723A77
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 20:13:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbhAUUM3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 21 Jan 2021 15:12:29 -0500
Received: from vps0.lunn.ch ([185.16.172.187]:53166 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726868AbhAUUMT (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 21 Jan 2021 15:12:19 -0500
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1l2gIi-001t5h-19; Thu, 21 Jan 2021 21:11:28 +0100
Date:   Thu, 21 Jan 2021 21:11:28 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Documentation: arm: Fix marvell file name
Message-ID: <YAnf8OtBJARxeCom@lunn.ch>
References: <20210121193418.22678-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210121193418.22678-1-pali@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 21, 2021 at 08:34:17PM +0100, Pali Rohár wrote:
> Signed-off-by: Pali Rohár <pali@kernel.org>

Fixes: dc7a12bdfccd ("docs: arm: convert docs to ReST and rename to *.rst")
Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
