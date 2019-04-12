Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A9D2A7D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 12 Apr 2019 23:48:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbfDLXsv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 12 Apr 2019 19:48:51 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:50876 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726815AbfDLXsv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 Apr 2019 19:48:51 -0400
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 5B96F1405215C;
        Fri, 12 Apr 2019 16:48:50 -0700 (PDT)
Date:   Fri, 12 Apr 2019 16:48:49 -0700 (PDT)
Message-Id: <20190412.164849.861952045826240326.davem@davemloft.net>
To:     ciorneiioana@gmail.com
Cc:     f.fainelli@gmail.com, andrew@lunn.ch, corbet@lwn.net,
        hauke@hauke-m.de, netdev@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next] Documentation: net: dsa: transition to the
 rst format
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190412115518.13288-1-ciorneiioana@gmail.com>
References: <20190412115518.13288-1-ciorneiioana@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Fri, 12 Apr 2019 16:48:50 -0700 (PDT)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Ioana Ciornei <ciorneiioana@gmail.com>
Date: Fri, 12 Apr 2019 14:55:18 +0300

> This patch also performs some minor adjustments such as numbering for
> the receive path sequence, conversion of keywords to inline literals and
> adding an index page so it looks better in the output of 'make htmldocs'.
> 
> Signed-off-by: Ioana Ciornei <ciorneiioana@gmail.com>

I'll apply this, thank you.
