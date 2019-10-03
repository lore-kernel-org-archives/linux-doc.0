Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 875627D2F0
	for <lwn-linux-doc@archive.lwn.net>; Thu,  3 Oct 2019 19:29:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731412AbfJCT3a convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 Oct 2019 15:29:30 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:47724 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731411AbfJCT3a (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Oct 2019 15:29:30 -0400
Received: from localhost (unknown [IPv6:2601:601:9f00:1e2::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id B55AD146D1ABB;
        Thu,  3 Oct 2019 12:29:29 -0700 (PDT)
Date:   Thu, 03 Oct 2019 12:29:29 -0700 (PDT)
Message-Id: <20191003.122929.5827330149147558.davem@davemloft.net>
To:     j.neuschaefer@gmx.net
Cc:     netdev@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: networking: devlink-trap: Fix reference to other
 document
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20191003190536.32463-1-j.neuschaefer@gmx.net>
References: <20191003190536.32463-1-j.neuschaefer@gmx.net>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Thu, 03 Oct 2019 12:29:29 -0700 (PDT)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
Date: Thu,  3 Oct 2019 21:05:36 +0200

> This fixes the following Sphinx warning:
> 
> Documentation/networking/devlink-trap.rst:175: WARNING: unknown document: /devlink-trap-netdevsim
> 
> Fixes: 9e0874570488 ("Documentation: Add description of netdevsim traps")
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>

Acked-by: David S. Miller <davem@davemloft.net>
