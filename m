Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 316B77D072
	for <lwn-linux-doc@archive.lwn.net>; Mon, 16 Jul 2018 18:28:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728037AbeGPS4w (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 16 Jul 2018 14:56:52 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:57796 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727866AbeGPS4w (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Jul 2018 14:56:52 -0400
Received: from localhost (74-93-104-98-Washington.hfc.comcastbusiness.net [74.93.104.98])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id A60D313FD9040;
        Mon, 16 Jul 2018 11:28:13 -0700 (PDT)
Date:   Mon, 16 Jul 2018 11:28:13 -0700 (PDT)
Message-Id: <20180716.112813.1857756879663677102.davem@davemloft.net>
To:     me@tobin.cc
Cc:     sridhar.samudrala@intel.com, linux-doc@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 0/2] docs: Fix failover build warnings
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20180711214250.19039-1-me@tobin.cc>
References: <20180711214250.19039-1-me@tobin.cc>
X-Mailer: Mew version 6.7 on Emacs 25.3 / Mule 6.0 (HANACHIRUSATO)
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Mon, 16 Jul 2018 11:28:13 -0700 (PDT)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: "Tobin C. Harding" <me@tobin.cc>
Date: Thu, 12 Jul 2018 07:42:48 +1000

> This is my first patch set to net-next.  Please shout loud and clear if
> I've botched anything.
> 
> Recently failover and net_failover modules were added to the mainline.
> Documentation was included in rst format but they were not added to the
> toctree in `networking/index.rst`.  Also building docs for net_failover
> is currently emitting a few warnings.
> 
> Patch 1 adds failover and net_failover to the index toctree
> Patch 2 fixes the build warnings for net_failover
> 
> I haven't been super active on netdev list so if there is some reason I
> missed why these files are not in the index please do say so.
> 
> Has there been any discussion on preferred order for the toctree index
> list?  I just added them to the bottom of the list.

Series applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
