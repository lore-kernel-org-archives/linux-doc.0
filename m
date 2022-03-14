Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3784CC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 14 Mar 2022 00:04:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230522AbiCNAFd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 13 Mar 2022 20:05:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235703AbiCNAFd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 13 Mar 2022 20:05:33 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAAB01BEA7
        for <linux-doc@vger.kernel.org>; Sun, 13 Mar 2022 17:04:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 36738B8009F
        for <linux-doc@vger.kernel.org>; Mon, 14 Mar 2022 00:04:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2859BC340E8;
        Mon, 14 Mar 2022 00:04:19 +0000 (UTC)
Date:   Sun, 13 Mar 2022 20:04:17 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Roland Hieber <rhi@pengutronix.de>
Cc:     Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>,
        Daniel Bristot de Oliveira <bristot@kernel.org>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/3] docs: trace: events: apply literal markup
Message-ID: <20220313200417.07c68214@rorschach.local.home>
In-Reply-To: <20220313105557.172732-3-rhi@pengutronix.de>
References: <20220313105557.172732-1-rhi@pengutronix.de>
        <20220313105557.172732-3-rhi@pengutronix.de>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 13 Mar 2022 11:55:57 +0100
Roland Hieber <rhi@pengutronix.de> wrote:

> The document can be easier readable if not everything is in 'quotes',
> but sometimes also in fixed-width font.
> 

It is definitely not easier to read. Many of us that use this
documentation do so by looking at the ascii file and not the processed
file. This makes it harder to read.

-- Steve


> Signed-off-by: Roland Hieber <rhi@pengutronix.de>
> ---
