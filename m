Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A7F697D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon,  4 Mar 2019 19:53:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbfCDTxl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 4 Mar 2019 14:53:41 -0500
Received: from ms.lwn.net ([45.79.88.28]:34434 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726054AbfCDTxl (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 4 Mar 2019 14:53:41 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 5128B2B4;
        Mon,  4 Mar 2019 19:53:40 +0000 (UTC)
Date:   Mon, 4 Mar 2019 12:53:39 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "Paul E . McKenney" <paulmck@linux.ibm.com>,
        Josh Triplett <josh@joshtriplett.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] doc: rcu: Suspicious RCU usage is a warning
Message-ID: <20190304125339.6615b841@lwn.net>
In-Reply-To: <20190228105932.1274-1-geert+renesas@glider.be>
References: <20190228105932.1274-1-geert+renesas@glider.be>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 28 Feb 2019 11:59:32 +0100
Geert Uytterhoeven <geert+renesas@glider.be> wrote:

> Suspicious RCU usage messages are reported as warnings.
> 
> Fixes: a5dd63efda3d07b5 ("lockdep: Use "WARNING" tag on lockdep splats")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> And before that, they were printed as errors, which was also never
> reflected in the documentation...
> ---
>  Documentation/RCU/lockdep-splat.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

jon
