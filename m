Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E4F7D7D90F
	for <lwn-linux-doc@archive.lwn.net>; Thu,  3 Oct 2019 20:57:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730331AbfJCU50 convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 Oct 2019 16:57:26 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:48574 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728031AbfJCU50 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Oct 2019 16:57:26 -0400
Received: from localhost (unknown [IPv6:2601:601:9f00:1e2::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 85C3814735CFB;
        Thu,  3 Oct 2019 13:57:25 -0700 (PDT)
Date:   Thu, 03 Oct 2019 13:57:21 -0700 (PDT)
Message-Id: <20191003.135721.1125853327808086336.davem@davemloft.net>
To:     j.neuschaefer@gmx.net
Cc:     linux-doc@vger.kernel.org, andrew@lunn.ch, f.fainelli@gmail.com,
        hkallweit1@gmail.com, corbet@lwn.net, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: networking: phy: Improve phrasing
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20191003204322.32349-1-j.neuschaefer@gmx.net>
References: <20191003204322.32349-1-j.neuschaefer@gmx.net>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Thu, 03 Oct 2019 13:57:25 -0700 (PDT)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
Date: Thu,  3 Oct 2019 22:43:22 +0200

> It's not about times (multiple occurences of an event) but about the
> duration of a time interval.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>

Looks fine to me:

Acked-by: David S. Miller <davem@davemloft.net>
