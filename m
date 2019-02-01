Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 310A67D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri,  1 Feb 2019 23:25:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbfBAXZ1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 1 Feb 2019 18:25:27 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:51376 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfBAXZ1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Feb 2019 18:25:27 -0500
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::bf5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id C5FFB14499F15;
        Fri,  1 Feb 2019 15:25:26 -0800 (PST)
Date:   Fri, 01 Feb 2019 15:25:26 -0800 (PST)
Message-Id: <20190201.152526.39050131489014224.davem@davemloft.net>
To:     martin.kepplinger@ginzinger.com
Cc:     corbet@lwn.net, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org,
        linux-doc@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, manfred.schlaegl@ginzinger.com
Subject: Re: [PATCH v2] ipconfig: add carrier_timeout kernel parameter
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190131101419.3988-1-martin.kepplinger@ginzinger.com>
References: <20190131101419.3988-1-martin.kepplinger@ginzinger.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Fri, 01 Feb 2019 15:25:27 -0800 (PST)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Thu, 31 Jan 2019 11:14:18 +0100

> commit 3fb72f1e6e61 ("ipconfig wait for carrier") added a
> "wait for carrier" policy, with a fixed worst case maximum wait
> of two minutes.
> 
> Now make the wait for carrier timeout configurable on the kernel
> commandline and use the 120s as the default.
> 
> The timeout messages introduced with
> commit 5e404cd65860 ("ipconfig: add informative timeout messages while
> waiting for carrier") are done in a fixed interval of 20 seconds, just
> like they were before (240/12).
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>

Ok, this seems fine for me.

Applied to net-next, thanks.
