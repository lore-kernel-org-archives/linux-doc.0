Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 580FA7D089
	for <lwn-linux-doc@archive.lwn.net>; Wed, 12 Dec 2018 06:50:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbeLLGuu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 12 Dec 2018 01:50:50 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:51248 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726428AbeLLGuu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Dec 2018 01:50:50 -0500
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::bf5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 4E6961456EE6D;
        Tue, 11 Dec 2018 22:50:50 -0800 (PST)
Date:   Tue, 11 Dec 2018 22:50:49 -0800 (PST)
Message-Id: <20181211.225049.1058545043529020701.davem@davemloft.net>
To:     rppt@linux.ibm.com
Cc:     jeffrey.t.kirsher@intel.com, corbet@lwn.net,
        netdev@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs/networking: fix formatting of Intel drivers
 documentation
From:   David Miller <davem@davemloft.net>
In-Reply-To: <1544371791-31192-1-git-send-email-rppt@linux.ibm.com>
References: <1544371791-31192-1-git-send-email-rppt@linux.ibm.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Tue, 11 Dec 2018 22:50:50 -0800 (PST)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Mike Rapoport <rppt@linux.ibm.com>
Date: Sun,  9 Dec 2018 18:09:51 +0200

> The documentation of Intel drivers is missing the heading adornment for
> document titles.
> 
> This causes the generated html to have TOC entries from these documents to
> appear as top level TOC entries:
> 
> * Linux* Base Driver for Intel(R) Ethernet Network Connection
> * Contents
> * Identifying Your Adapter
> * Command Line Parameters
>   * AutoNeg
>   * Duplex
>   ...
> 
> Add overline heading adornment to document titles.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Jeff, I am assuming you picked this up.

Let me know if you haven't and you want me to integrate it.

Thanks.
