Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A3E4F7D08A
	for <lwn-linux-doc@archive.lwn.net>; Sun, 24 Feb 2019 02:38:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727948AbfBXCir (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 23 Feb 2019 21:38:47 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:44932 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726405AbfBXCir (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 23 Feb 2019 21:38:47 -0500
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::bf5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 6C85514BF7A60;
        Sat, 23 Feb 2019 18:38:46 -0800 (PST)
Date:   Sat, 23 Feb 2019 18:38:45 -0800 (PST)
Message-Id: <20190223.183845.1860714149812694686.davem@davemloft.net>
To:     hauke@hauke-m.de
Cc:     arkadis@mellanox.com, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] net: dsa: Remove documentation for port_fdb_prepare
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190222190745.28020-1-hauke@hauke-m.de>
References: <20190222190745.28020-1-hauke@hauke-m.de>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Sat, 23 Feb 2019 18:38:46 -0800 (PST)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Hauke Mehrtens <hauke@hauke-m.de>
Date: Fri, 22 Feb 2019 20:07:45 +0100

> This callback was removed some time ago, also remove the documentation.
> 
> Fixes: 1b6dd556c304 ("net: dsa: Remove prepare phase for FDB")
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>

Applied.
