Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 029FD7D584
	for <lwn-linux-doc@archive.lwn.net>; Thu, 13 Sep 2018 03:43:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbeIMIum (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 13 Sep 2018 04:50:42 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:42448 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbeIMIul (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Sep 2018 04:50:41 -0400
Received: from localhost (74-93-104-98-Washington.hfc.comcastbusiness.net [74.93.104.98])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id D1E6912DE581F;
        Wed, 12 Sep 2018 20:43:06 -0700 (PDT)
Date:   Wed, 12 Sep 2018 20:43:06 -0700 (PDT)
Message-Id: <20180912.204306.302431688795844335.davem@davemloft.net>
To:     me@tobin.cc
Cc:     edumazet@google.com, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: net: Remove TCP congestion document
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20180912081444.17258-1-me@tobin.cc>
References: <20180912081444.17258-1-me@tobin.cc>
X-Mailer: Mew version 6.7 on Emacs 25.3 / Mule 6.0 (HANACHIRUSATO)
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Wed, 12 Sep 2018 20:43:07 -0700 (PDT)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: "Tobin C. Harding" <me@tobin.cc>
Date: Wed, 12 Sep 2018 18:14:44 +1000

> Document is stale, let's remove it.
> 
> Remove TCP congestion document.
> 
> Signed-off-by: Tobin C. Harding <me@tobin.cc>

Applied, thanks.
