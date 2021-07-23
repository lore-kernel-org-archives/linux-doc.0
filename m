Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ABA2C4338F
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jul 2021 08:12:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D1A560F02
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jul 2021 08:12:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233619AbhGWHbr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Jul 2021 03:31:47 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:59412 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234329AbhGWHbq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Jul 2021 03:31:46 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id BED1421C17;
        Fri, 23 Jul 2021 08:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1627027939; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=cXw1TpQ0D3E9XTymWq53h91IqpdC/mLTK0Zbjn6qwDw=;
        b=YAvb605//+HHFgioy94Uds31YVWAf90ggI4jdxxYZ6N1m5jUQ0OkA5SimPM78NY7IdSAVU
        Sk1So/LqCp9J4UDZL29ABUSwwxVW4kEwkepNuH/cuBNZY0p+jgfNIMpy64zibmoSES0mtJ
        gpMBuG6fBLynKFH9uwo+QVS5Ll6mr0g=
Received: from suse.cz (unknown [10.100.224.162])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by relay2.suse.de (Postfix) with ESMTPS id 60EFAA3B88;
        Fri, 23 Jul 2021 08:12:19 +0000 (UTC)
Date:   Fri, 23 Jul 2021 10:12:19 +0200
From:   Petr Mladek <pmladek@suse.com>
To:     Ioana Ciornei <ciorneiioana@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-doc@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        Jing Zhang <jingzhangos@google.com>,
        Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: Re: [PATCH 1/4] docs: printk-formats: fix build warning
Message-ID: <YPp546NMGuZxDyHi@alley>
References: <20210722100356.635078-1-ciorneiioana@gmail.com>
 <20210722100356.635078-2-ciorneiioana@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210722100356.635078-2-ciorneiioana@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu 2021-07-22 13:03:53, Ioana Ciornei wrote:
> From: Ioana Ciornei <ioana.ciornei@nxp.com>
> 
> Add an empty line after the '::' starting the code block so that the
> following lines are properly interpreted.
> 
> Without this, the following build warnings are visible.
> 
> Documentation/core-api/printk-formats.rst:136: WARNING: Unexpected indentation.
> Documentation/core-api/printk-formats.rst:137: WARNING: Block quote ends without a blank line; unexpected unindent.
> 
> Fixes: 9294523e3768 ("module: add printk formats to add module build ID to stacktraces")
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>

Acked-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
