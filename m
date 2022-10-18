Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1CAFC4332F
	for <linux-doc@archiver.kernel.org>; Tue, 18 Oct 2022 16:18:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230413AbiJRQSN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 Oct 2022 12:18:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230339AbiJRQSH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Oct 2022 12:18:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCDD0BA271;
        Tue, 18 Oct 2022 09:18:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D923F61626;
        Tue, 18 Oct 2022 16:18:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ECE5C433D6;
        Tue, 18 Oct 2022 16:18:03 +0000 (UTC)
Date:   Tue, 18 Oct 2022 12:18:04 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
        Zheng Yejian <zhengyejian1@huawei.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        tom.zanussi@linux.intel.com
Subject: Re: [PATCH -next] tracing/histogram: Update document for KEYS_MAX
 size
Message-ID: <20221018121804.666c700a@gandalf.local.home>
In-Reply-To: <87a65tdtcw.fsf@meer.lwn.net>
References: <20221017103806.2479139-1-zhengyejian1@huawei.com>
        <20221019003134.cc24bd624cc6fca06a05206c@kernel.org>
        <20221018113558.73790f54@gandalf.local.home>
        <87a65tdtcw.fsf@meer.lwn.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 18 Oct 2022 09:49:51 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> > Jon, do you want to tag this for stable and pull it through your tree?  
> 
> Sure, I can do that.

Thanks Jon!

-- Steve
