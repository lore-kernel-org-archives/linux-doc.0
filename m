Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AB4447D08A
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Feb 2019 01:30:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbfBGBae (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 6 Feb 2019 20:30:34 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:39124 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726161AbfBGBae (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Feb 2019 20:30:34 -0500
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::bf5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id A1F9F1404973D;
        Wed,  6 Feb 2019 17:30:33 -0800 (PST)
Date:   Wed, 06 Feb 2019 17:30:32 -0800 (PST)
Message-Id: <20190206.173032.1315062430415479623.davem@davemloft.net>
To:     rmk+kernel@armlinux.org.uk
Cc:     linux-doc@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 1/2] net: phylink: update mac_config() documentation
From:   David Miller <davem@davemloft.net>
In-Reply-To: <E1gr371-0007eK-Gd@rmk-PC.armlinux.org.uk>
References: <E1gr371-0007eK-Gd@rmk-PC.armlinux.org.uk>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Wed, 06 Feb 2019 17:30:33 -0800 (PST)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


These two patches do not apply cleanly to net nor net-next.

Please send me something that does apply, and please always
clearly indicate which tree your changes are targetting.
