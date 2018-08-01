Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2DCD57D071
	for <lwn-linux-doc@archive.lwn.net>; Wed,  1 Aug 2018 16:46:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390228AbeHASdC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 1 Aug 2018 14:33:02 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:48872 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390188AbeHASdC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Aug 2018 14:33:02 -0400
Received: from localhost (c-24-20-22-31.hsd1.or.comcast.net [24.20.22.31])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id CF242108A9056;
        Wed,  1 Aug 2018 09:46:26 -0700 (PDT)
Date:   Wed, 01 Aug 2018 09:46:24 -0700 (PDT)
Message-Id: <20180801.094624.1369542003568924077.davem@davemloft.net>
To:     ioana.ciornei@nxp.com
Cc:     corbet@lwn.net, laurentiu.tudor@nxp.com, stuyoder@gmail.com,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: dpaa2: Use correct heading adornment
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20180731154553.3648-1-ioana.ciornei@nxp.com>
References: <20180731154553.3648-1-ioana.ciornei@nxp.com>
X-Mailer: Mew version 6.7 on Emacs 26 / Mule 6.0 (HANACHIRUSATO)
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Wed, 01 Aug 2018 09:46:27 -0700 (PDT)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Ioana Ciornei <ioana.ciornei@nxp.com>
Date: Tue, 31 Jul 2018 10:45:53 -0500

> Add overline heading adornment to document title in order to comply
> with kernel doc requirements.
> 
> Fixes: 60b9131 staging: fsl-mc: Convert documentation to rst format
> 
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>

Applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
