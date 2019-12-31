Return-Path: <SRS0=w2yy=2V=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38744C2D0C8
	for <linux-doc@archiver.kernel.org>; Tue, 31 Dec 2019 04:14:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 10D3920663
	for <linux-doc@archiver.kernel.org>; Tue, 31 Dec 2019 04:14:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbfLaEOm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Dec 2019 23:14:42 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:50408 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726364AbfLaEOm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Dec 2019 23:14:42 -0500
Received: from localhost (unknown [IPv6:2601:601:9f00:1c3::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id B9F0D13EF0981;
        Mon, 30 Dec 2019 20:14:41 -0800 (PST)
Date:   Mon, 30 Dec 2019 20:14:41 -0800 (PST)
Message-Id: <20191230.201441.787233776240313519.davem@davemloft.net>
To:     olteanv@gmail.com
Cc:     corbet@lwn.net, mchehab+samsung@kernel.org, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: net: dsa: sja1105: Remove text about
 taprio base-time limitation
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20191227010807.28162-1-olteanv@gmail.com>
References: <20191227010807.28162-1-olteanv@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Mon, 30 Dec 2019 20:14:41 -0800 (PST)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Vladimir Oltean <olteanv@gmail.com>
Date: Fri, 27 Dec 2019 03:08:07 +0200

> Since commit 86db36a347b4 ("net: dsa: sja1105: Implement state machine
> for TAS with PTP clock source"), this paragraph is no longer true. So
> remove it.
> 
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>

Applied.
