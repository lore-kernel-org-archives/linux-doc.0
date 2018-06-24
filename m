Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2B5B67D043
	for <lwn-linux-doc@archive.lwn.net>; Sun, 24 Jun 2018 07:18:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751206AbeFXHS0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 24 Jun 2018 03:18:26 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:60478 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750817AbeFXHSZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 24 Jun 2018 03:18:25 -0400
Received: from localhost (unknown [211.196.191.92])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 5D79313D398FA;
        Sun, 24 Jun 2018 00:18:22 -0700 (PDT)
Date:   Sun, 24 Jun 2018 16:18:20 +0900 (KST)
Message-Id: <20180624.161820.1373188259754361242.davem@davemloft.net>
To:     vakul.garg@nxp.com
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, corbet@lwn.net
Subject: Re: [PATCH net-next] strparser: Corrected typo in documentation.
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20180624123721.24287-1-vakul.garg@nxp.com>
References: <20180624123721.24287-1-vakul.garg@nxp.com>
X-Mailer: Mew version 6.7 on Emacs 26 / Mule 6.0 (HANACHIRUSATO)
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Sun, 24 Jun 2018 00:18:25 -0700 (PDT)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Vakul Garg <vakul.garg@nxp.com>
Date: Sun, 24 Jun 2018 18:07:21 +0530

> Replaced strp_pause() with strp_unpause() to correct a seemingly copy
> paste documentation mistake.
> 
> Signed-off-by: Vakul Garg <vakul.garg@nxp.com>

As a bug fix this should target 'net'.

This is even more true since this fixes documentation.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
