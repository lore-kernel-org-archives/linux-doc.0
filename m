Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 42BCC7D08A
	for <lwn-linux-doc@archive.lwn.net>; Wed, 16 Jan 2019 21:30:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730328AbfAPVaK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 16 Jan 2019 16:30:10 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:44906 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730241AbfAPVaK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Jan 2019 16:30:10 -0500
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::bf5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id E093F126436BC;
        Wed, 16 Jan 2019 13:30:09 -0800 (PST)
Date:   Wed, 16 Jan 2019 13:30:09 -0800 (PST)
Message-Id: <20190116.133009.124084386696970547.davem@davemloft.net>
To:     rdunlap@infradead.org
Cc:     netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        yupeng0921@gmail.com
Subject: Re: [PATCH] networking: Documentation: fix snmp_counters.rst
 Sphinx warnings
From:   David Miller <davem@davemloft.net>
In-Reply-To: <b6936a0a-6ef8-47c0-19f1-f8ad17244407@infradead.org>
References: <b6936a0a-6ef8-47c0-19f1-f8ad17244407@infradead.org>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Wed, 16 Jan 2019 13:30:10 -0800 (PST)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>
Date: Sun, 13 Jan 2019 20:17:41 -0800

> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix over 100 documentation warnings in snmp_counter.rst by
> extending the underline string lengths and inserting a blank line
> after bullet items.
> 
> Examples:
> 
> Documentation/networking/snmp_counter.rst:1: WARNING: Title overline too short.
> Documentation/networking/snmp_counter.rst:14: WARNING: Bullet list ends without a blank line; unexpected unindent.
> 
> Fixes: 2b96547223e3 ("add document for TCP OFO, PAWS and skip ACK counters")
> Fixes: 8e2ea53a83df ("add snmp counters document")
> Fixes: 712ee16c230f ("add documents for snmp counters")
> Fixes: 80cc49507ba4 ("net: Add part of TCP counts explanations in snmp_counters.rst")
> Fixes: b08794a922c4 ("documentation of some IP/ICMP snmp counters")
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Applied.
