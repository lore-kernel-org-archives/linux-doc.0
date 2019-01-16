Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 96AC07D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 16 Jan 2019 04:35:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732019AbfAPEfO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 15 Jan 2019 23:35:14 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:33494 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728227AbfAPEfN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Jan 2019 23:35:13 -0500
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::bf5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 17C4614AAA9C1;
        Tue, 15 Jan 2019 20:35:13 -0800 (PST)
Date:   Tue, 15 Jan 2019 20:35:12 -0800 (PST)
Message-Id: <20190115.203512.745234019944172123.davem@davemloft.net>
To:     ottosabart@seberm.com
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        netdev@vger.kernel.org, corbet@lwn.net
Subject: Re: [PATCH 0/3] doc: networking: integrate scaling document into
 doc tree
From:   David Miller <davem@davemloft.net>
In-Reply-To: <cover.1547063330.git.ottosabart@seberm.com>
References: <cover.1547063330.git.ottosabart@seberm.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Tue, 15 Jan 2019 20:35:13 -0800 (PST)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Otto Sabart <ottosabart@seberm.com>
Date: Wed, 9 Jan 2019 20:57:01 +0100

> These patches integrate scaling document into documentation tree.
> 
> There are no semantic changes.

Jon, I assume this is another series you will take in.

Again, I expect no major conflicts with the networking tree.
