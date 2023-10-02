Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A4B5E784BB
	for <linux-doc@archiver.kernel.org>; Mon,  2 Oct 2023 15:08:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237813AbjJBPIh convert rfc822-to-8bit (ORCPT
        <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 2 Oct 2023 11:08:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237788AbjJBPIh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Oct 2023 11:08:37 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43583A7;
        Mon,  2 Oct 2023 08:08:34 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36EC7C433C7;
        Mon,  2 Oct 2023 15:08:33 +0000 (UTC)
Date:   Mon, 2 Oct 2023 11:09:35 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Christian Loehle <christian.loehle@arm.com>
Cc:     Zheng Yejian <zhengyejian1@huawei.com>, mhiramat@kernel.org,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] tracing: document buffer_size_kb more precisely
Message-ID: <20231002110935.2fde6637@gandalf.local.home>
In-Reply-To: <efe41cee-42dd-290f-9ec2-ac002e2ec34e@arm.com>
References: <cee6d5cd-e15b-3bb1-f867-de467d96d6b5@arm.com>
        <a1ae1bc0-0677-8284-9f18-1171e1dcb175@huawei.com>
        <efe41cee-42dd-290f-9ec2-ac002e2ec34e@arm.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 26 Sep 2023 11:38:14 +0100
Christian Loehle <christian.loehle@arm.com> wrote:

> >> @@ -191,7 +191,7 @@ of ftrace. Here is a list of some of the key files:
> >>       A few extra pages may be allocated to accommodate buffer management
> >>       meta-data. If the last page allocated has room for more bytes
> >>       than requested, the rest of the page will be used,
> >> -    making the actual allocation bigger than requested or shown.
> >> +    making the actual allocation bigger than requested.  
> > 
> > Hi, the actual allocation should still be bigger than shown due to the
> > loss of accuracy when doing unit conversion from bytes to kilobytes (see
> > tracing_entries_read()).
> >   
> Right, the sysfs obviously only allows for KB aligned setting, but you're right.
> If set on the cmdline non-KB multiples are possible and accuracy is lost.
> Nevermind then.

I'm assuming this patch can be dropped?

-- Steve
