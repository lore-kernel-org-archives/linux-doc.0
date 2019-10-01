Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 87A717D90D
	for <lwn-linux-doc@archive.lwn.net>; Tue,  1 Oct 2019 16:20:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731982AbfJAQUC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 1 Oct 2019 12:20:02 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:49186 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731657AbfJAQUB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Oct 2019 12:20:01 -0400
Received: from localhost (unknown [IPv6:2601:601:9f00:1e2::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 329EB154B6ADA;
        Tue,  1 Oct 2019 09:20:01 -0700 (PDT)
Date:   Tue, 01 Oct 2019 09:20:00 -0700 (PDT)
Message-Id: <20191001.092000.1273747856120657963.davem@davemloft.net>
To:     20190930113754.5902855e@cakuba.netronome.com,
        adam.zerella@gmail.com
Cc:     jakub.kicinski@netronome.com, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] docs: networking: Add title caret and missing doc
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20191001111658.GA10429@gmail.com>
References: <20191001111658.GA10429@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Tue, 01 Oct 2019 09:20:01 -0700 (PDT)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Adam Zerella <adam.zerella@gmail.com>
Date: Tue, 1 Oct 2019 21:16:58 +1000

> Resolving a couple of Sphinx documentation warnings
> that are generated in the networking section.
> 
> - WARNING: document isn't included in any toctree
> - WARNING: Title underline too short.
> 
> Signed-off-by: Adam Zerella <adam.zerella@gmail.com>

Applied.
