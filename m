Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A78977D90F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 12 Feb 2019 05:29:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725916AbfBLF3a (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 12 Feb 2019 00:29:30 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:48250 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725778AbfBLF3a (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Feb 2019 00:29:30 -0500
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::bf5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 56D7814C18075;
        Mon, 11 Feb 2019 21:29:29 -0800 (PST)
Date:   Mon, 11 Feb 2019 21:29:28 -0800 (PST)
Message-Id: <20190211.212928.1493365605785629781.davem@davemloft.net>
To:     rdunlap@infradead.org
Cc:     netdev@vger.kernel.org, stuyoder@gmail.com,
        laurentiu.tudor@nxp.com, ruxandra.radulescu@nxp.com,
        madalin.bucur@nxp.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: fix some freescale dpio-driver.rst
 warnings
From:   David Miller <davem@davemloft.net>
In-Reply-To: <99c9792a-7218-76d9-9b53-8477afa69f79@infradead.org>
References: <99c9792a-7218-76d9-9b53-8477afa69f79@infradead.org>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Mon, 11 Feb 2019 21:29:29 -0800 (PST)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>
Date: Sun, 10 Feb 2019 22:32:42 -0800

> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix markup warnings for one list by using correct list syntax.
> Fix markup warnings for another list by using blank lines before the
> list.
> 
> Documentation/networking/device_drivers/freescale/dpaa2/dpio-driver.rst:30: WARNING: Unexpected indentation.
> Documentation/networking/device_drivers/freescale/dpaa2/dpio-driver.rst:143: WARNING: Unexpected indentation.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Applied, thanks.
