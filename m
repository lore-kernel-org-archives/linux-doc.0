Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C29C57DE78
	for <lwn-linux-doc@archive.lwn.net>; Sat, 28 Apr 2018 00:24:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933146AbeD1AYN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Apr 2018 20:24:13 -0400
Received: from shards.monkeyblade.net ([184.105.139.130]:59894 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933115AbeD1AYM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Apr 2018 20:24:12 -0400
Received: from localhost (pool-173-77-163-54.nycmny.fios.verizon.net [173.77.163.54])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 186F91097772C;
        Fri, 27 Apr 2018 17:24:12 -0700 (PDT)
Date:   Fri, 27 Apr 2018 20:24:11 -0400 (EDT)
Message-Id: <20180427.202411.1744974498374613547.davem@davemloft.net>
To:     amsalam20@gmail.com
Cc:     linux-doc@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [net-next v2] ipv6: sr: Add documentation for seg_flowlabel
 sysctl
From:   David Miller <davem@davemloft.net>
In-Reply-To: <1524844308-2891-1-git-send-email-amsalam20@gmail.com>
References: <1524844308-2891-1-git-send-email-amsalam20@gmail.com>
X-Mailer: Mew version 6.7 on Emacs 25.3 / Mule 6.0 (HANACHIRUSATO)
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Fri, 27 Apr 2018 17:24:12 -0700 (PDT)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Ahmed Abdelsalam <amsalam20@gmail.com>
Date: Fri, 27 Apr 2018 17:51:48 +0200

> This patch adds a documentation for seg_flowlabel sysctl into
> Documentation/networking/ip-sysctl.txt
> 
> Signed-off-by: Ahmed Abdelsalam <amsalam20@gmail.com>

Applied, thank you.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
