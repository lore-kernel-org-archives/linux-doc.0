Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 032E87D2EF
	for <lwn-linux-doc@archive.lwn.net>; Sat,  2 Mar 2019 01:03:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727666AbfCBBDU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 1 Mar 2019 20:03:20 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:60836 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbfCBBDT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Mar 2019 20:03:19 -0500
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::cf9])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 3A24D14013FC7;
        Fri,  1 Mar 2019 17:03:19 -0800 (PST)
Date:   Fri, 01 Mar 2019 17:03:18 -0800 (PST)
Message-Id: <20190301.170318.1704538618070251369.davem@davemloft.net>
To:     stefan@datenfreihafen.org
Cc:     corbet@lwn.net, netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-wpan@vger.kernel.org
Subject: Re: [PATCH 0/2] doc: net: ieee802154: move from plain text to rst
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190227195914.4594-1-stefan@datenfreihafen.org>
References: <20190227195914.4594-1-stefan@datenfreihafen.org>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Fri, 01 Mar 2019 17:03:19 -0800 (PST)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Stefan Schmidt <stefan@datenfreihafen.org>
Date: Wed, 27 Feb 2019 20:59:12 +0100

> The ieee802154 subsystem doc was still in plain text. With the networking book
> taking shape I thought it was time to do the first step and move it over to rst.
> This really is only the minimal conversion. I need to take some time to update
> and extend the docs.
> 
> The patches are based on net-next, but they only touch the networking book so I
> would not expect and trouble. From what I have seen they would go through
> Jonathan's tree after being acked by Dave? If you want this patches against a
> different tree let me know.

Series applied, thanks Stefan.
