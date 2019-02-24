Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AECC77D04D
	for <lwn-linux-doc@archive.lwn.net>; Sun, 24 Feb 2019 20:40:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728091AbfBXUkD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 24 Feb 2019 15:40:03 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:59704 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727798AbfBXUkD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 24 Feb 2019 15:40:03 -0500
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::bf5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 74A4514D06D6D;
        Sun, 24 Feb 2019 12:40:02 -0800 (PST)
Date:   Sun, 24 Feb 2019 12:40:01 -0800 (PST)
Message-Id: <20190224.124001.1340848904892966698.davem@davemloft.net>
To:     rmk+kernel@armlinux.org.uk
Cc:     linux-doc@vger.kernel.org, netdev@vger.kernel.org, corbet@lwn.net
Subject: Re: [PATCH net-next v2 2/2] doc: add phylink documentation to the
 networking book
From:   David Miller <davem@davemloft.net>
In-Reply-To: <E1gx93S-00047E-CW@rmk-PC.armlinux.org.uk>
References: <E1gx93S-00047E-CW@rmk-PC.armlinux.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Sun, 24 Feb 2019 12:40:02 -0800 (PST)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Russell King <rmk+kernel@armlinux.org.uk>
Date: Fri, 22 Feb 2019 11:31:46 +0000

> Add some phylink documentation to the networking book detailing how
> to convert network drivers from phylib to phylink.
> 
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> ---
> v2: updated with comments from Randy and updated to apply to net-next

Applied.
