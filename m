Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E0A3F7D099
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Mar 2019 02:37:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727276AbfCRCh3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 17 Mar 2019 22:37:29 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:56674 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727201AbfCRCh3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 17 Mar 2019 22:37:29 -0400
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id B20AB133FBEEB;
        Sun, 17 Mar 2019 19:37:28 -0700 (PDT)
Date:   Sun, 17 Mar 2019 19:37:24 -0700 (PDT)
Message-Id: <20190317.193724.1251273991165737411.davem@davemloft.net>
To:     rdunlap@infradead.org
Cc:     netdev@vger.kernel.org, yupeng0921@gmail.com,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] networking: fix snmp_counter.rst Doc. Warnings
From:   David Miller <davem@davemloft.net>
In-Reply-To: <d5d2f833-0a08-6b02-1754-6262b5102369@infradead.org>
References: <d5d2f833-0a08-6b02-1754-6262b5102369@infradead.org>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Sun, 17 Mar 2019 19:37:28 -0700 (PDT)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>
Date: Sun, 17 Mar 2019 17:17:45 -0700

> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix documentation markup warnings in snmp_counter.rst:
> 
> Documentation/networking/snmp_counter.rst:416: WARNING: Title underline too short.
> Documentation/networking/snmp_counter.rst:684: WARNING: Bullet list ends without a blank line; unexpected unindent.
> Documentation/networking/snmp_counter.rst:693: WARNING: Title underline too short.
> Documentation/networking/snmp_counter.rst:707: WARNING: Bullet list ends without a blank line; unexpected unindent.
> Documentation/networking/snmp_counter.rst:712: WARNING: Bullet list ends without a blank line; unexpected unindent.
> Documentation/networking/snmp_counter.rst:722: WARNING: Title underline too short.
> Documentation/networking/snmp_counter.rst:733: WARNING: Bullet list ends without a blank line; unexpected unindent.
> Documentation/networking/snmp_counter.rst:736: WARNING: Bullet list ends without a blank line; unexpected unindent.
> Documentation/networking/snmp_counter.rst:739: WARNING: Bullet list ends without a blank line; unexpected unindent.
> 
> Fixes: 80cc49507ba48 ("net: Add part of TCP counts explanations in snmp_counters.rst")
> Fixes: 8e2ea53a83dfb ("add snmp counters document")
> Fixes: a6c7c7aac2de6 ("net: add document for several snmp counters")
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Applied, thanks Randy.
