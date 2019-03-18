Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E3A6C7D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Mar 2019 16:51:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbfCRQvF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Mar 2019 12:51:05 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:36030 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbfCRQvF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Mar 2019 12:51:05 -0400
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 4EF1514012124;
        Mon, 18 Mar 2019 09:51:04 -0700 (PDT)
Date:   Mon, 18 Mar 2019 09:51:03 -0700 (PDT)
Message-Id: <20190318.095103.984218884596301682.davem@davemloft.net>
To:     tklauser@distanz.ch
Cc:     corbet@lwn.net, willemb@google.com, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] doc: fix link to MSG_ZEROCOPY patchset
From:   David Miller <davem@davemloft.net>
In-Reply-To: <1552907338-1784-1-git-send-email-tklauser@distanz.ch>
References: <1552907338-1784-1-git-send-email-tklauser@distanz.ch>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Mon, 18 Mar 2019 09:51:04 -0700 (PDT)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Tobias Klauser <tklauser@distanz.ch>
Date: Mon, 18 Mar 2019 12:08:58 +0100

> Use https and link to the patch directly.
> 
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

Since this fixes the documentation, I'll apply this to 'net'.

Thanks.
