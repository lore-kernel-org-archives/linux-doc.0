Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C51907D043
	for <lwn-linux-doc@archive.lwn.net>; Sun, 24 Jun 2018 07:40:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751533AbeFXHkl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 24 Jun 2018 03:40:41 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:32780 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751487AbeFXHkl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 24 Jun 2018 03:40:41 -0400
Received: from localhost (unknown [211.196.191.92])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 407AB119E4B92;
        Sun, 24 Jun 2018 00:40:38 -0700 (PDT)
Date:   Sun, 24 Jun 2018 16:40:36 +0900 (KST)
Message-Id: <20180624.164036.1691493990597117493.davem@davemloft.net>
To:     vakul.garg@nxp.com
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, corbet@lwn.net
Subject: Re: [PATCH net] strparser: Corrected typo in documentation.
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20180624124401.24584-1-vakul.garg@nxp.com>
References: <20180624124401.24584-1-vakul.garg@nxp.com>
X-Mailer: Mew version 6.7 on Emacs 26 / Mule 6.0 (HANACHIRUSATO)
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Sun, 24 Jun 2018 00:40:41 -0700 (PDT)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Vakul Garg <vakul.garg@nxp.com>
Date: Sun, 24 Jun 2018 18:14:01 +0530

> Replaced strp_pause() with strp_unpause() to correct a seemingly copy
> paste documentation mistake.
> 
> Signed-off-by: Vakul Garg <vakul.garg@nxp.com>
> ---
> Resending for 'net' as advised.

Applied, thank you.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
