Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E355A7DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue,  8 May 2018 16:11:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932460AbeEHQLG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 8 May 2018 12:11:06 -0400
Received: from ms.lwn.net ([45.79.88.28]:35922 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932127AbeEHQLE (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 8 May 2018 12:11:04 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id EDA3A318;
        Tue,  8 May 2018 16:11:01 +0000 (UTC)
Date:   Tue, 8 May 2018 10:10:59 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Christoffer Dall <cdall@linaro.org>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Thymo van Beers <thymovanbeers@gmail.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Rientjes <rientjes@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vinod Koul <vinod.koul@intel.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Sagar Dharia <sdharia@codeaurora.org>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 08/18] docs: driver-api: add clk documentation
Message-ID: <20180508101059.44ecdbd1@lwn.net>
In-Reply-To: <f3398bca6fba979bd55b8a053b6b46fe35bf9891.1525684985.git.mchehab+samsung@kernel.org>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
        <f3398bca6fba979bd55b8a053b6b46fe35bf9891.1525684985.git.mchehab+samsung@kernel.org>
Organization: LWN.net
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon,  7 May 2018 06:35:44 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:

> The clk.rst is already in ReST format. So, move it to the
> driver-api guide, where it belongs.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Applied, thanks.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
