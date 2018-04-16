Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BCD637E22E
	for <lwn-linux-doc@archive.lwn.net>; Mon, 16 Apr 2018 00:45:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753015AbeDPAps (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 15 Apr 2018 20:45:48 -0400
Received: from shards.monkeyblade.net ([184.105.139.130]:34880 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752888AbeDPApr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 15 Apr 2018 20:45:47 -0400
Received: from localhost (pool-173-77-163-229.nycmny.fios.verizon.net [173.77.163.229])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 594E111628008;
        Sun, 15 Apr 2018 17:45:46 -0700 (PDT)
Date:   Sun, 15 Apr 2018 20:45:43 -0400 (EDT)
Message-Id: <20180415.204543.2073552415391435410.davem@davemloft.net>
To:     shhuiw@foxmail.com
Cc:     ast@kernel.org, daniel@iogearbox.net, corbet@lwn.net,
        netdev@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] filter.txt: update 'tools/net/' to 'tools/bpf/'
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20180415080712.2213-1-shhuiw@foxmail.com>
References: <20180415080712.2213-1-shhuiw@foxmail.com>
X-Mailer: Mew version 6.7 on Emacs 25.3 / Mule 6.0 (HANACHIRUSATO)
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Sun, 15 Apr 2018 17:45:46 -0700 (PDT)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Wang Sheng-Hui <shhuiw@foxmail.com>
Date: Sun, 15 Apr 2018 16:07:12 +0800

> The tools are located at tootls/bpf/ instead of tools/net/.
> Update the filter.txt doc.
> 
> Signed-off-by: Wang Sheng-Hui <shhuiw@foxmail.com>

Applied, thank you.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
