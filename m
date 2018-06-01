Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 077617D048
	for <lwn-linux-doc@archive.lwn.net>; Fri,  1 Jun 2018 16:37:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752036AbeFAQhf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 1 Jun 2018 12:37:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:33126 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751777AbeFAQhe (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 1 Jun 2018 12:37:34 -0400
Received: from localhost (unknown [104.132.1.75])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E76C12087C;
        Fri,  1 Jun 2018 16:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1527871054;
        bh=LO+NiZPdgsEpLIp1woBzZiUWhbuyiB4Fewtlw4WqYJ8=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=jE+OvCzjFlU4P2OBmTi0zdrmnnnwx8YLvbu/OyKjIdoStBRqI8S2oxphx6v4gw5/i
         iQ4T3h4iI2hdOwau6SE+xD+lw0ruBvRxZ1EJeoEunoFmkZqFA0HXhLPNc9uXyy3BzL
         qjA/yY1BLeh7Repf5FVl5+oVXF/pHZfoLgk8uYd0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Eduardo Valentin <edubezval@gmail.com>,
        Eric Anholt <eric@anholt.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jia-Ju Bai <baijiaju1990@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Zhang Rui <rui.zhang@intel.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1527845302-12159-2-git-send-email-geert+renesas@glider.be>
Cc:     Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-doc@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
        linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <1527845302-12159-1-git-send-email-geert+renesas@glider.be>
 <1527845302-12159-2-git-send-email-geert+renesas@glider.be>
Message-ID: <152787105335.144038.419639779875099925@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH 1/4] clk: renesas: cpg-mssr: Stop using printk format %pCr
Date:   Fri, 01 Jun 2018 09:37:33 -0700
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Quoting Geert Uytterhoeven (2018-06-01 02:28:19)
> Printk format "%pCr" will be removed soon, as clk_get_rate() must not be
> called in atomic context.
> =

> Replace it by open-coding the operation.  This is safe here, as the code
> runs in task context.
> =

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
