Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ACC1C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 10 Dec 2021 20:59:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243280AbhLJVDS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 10 Dec 2021 16:03:18 -0500
Received: from ms.lwn.net ([45.79.88.28]:53642 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238910AbhLJVDS (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 10 Dec 2021 16:03:18 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id EBB0160C;
        Fri, 10 Dec 2021 20:59:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EBB0160C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1639169983; bh=jgsDURp5VzW+HxSl44WIgSbZF5lFRvonWH90A+XJ+O4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=TNVgauYKvbTkC6sF7DBH5h9nhM9B4MWjCvencKg2PTTBX4Xab6kGVyU9RaxWv2juX
         Wlu0LlhHQZQZzXimANDuoNOo1Ibfk0gPAVyMzirhvgKr3itR2xJuw14zfEYVOFwq7P
         8xwSZ+dULbmjXhiI6VEb62IKmLaFY/zGGbDqOlNNFmS4YE0A/d5QadJ+Bz3Fg4bAKv
         X4lgpnVtipNPW6WE8PC+IUn7P2sUvWwkxU53ONQXSQtLBqYONOW6lTxbIXUkdP3G+v
         xUDUVM8Huqd5bHnUCwHf1yOFoiUYD/HU8Lm0gSPis/cFD9J2wiZ0b/r3XeA2bLOUpL
         DyZiftALJ9VuQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>
Cc:     Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        akiyks@gmail.com, Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH v2] docs/trace: fix a label of boottime-trace
In-Reply-To: <20211210123746.1774f294@gandalf.local.home>
References: <20211210041536.1446734-1-siyanteng@loongson.cn>
 <20211210141936.56fb2cfb71e057148cef15c7@kernel.org>
 <20211210123746.1774f294@gandalf.local.home>
Date:   Fri, 10 Dec 2021 13:59:42 -0700
Message-ID: <87zgp8qipt.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Steven Rostedt <rostedt@goodmis.org> writes:

> On Fri, 10 Dec 2021 14:19:36 +0900
> Masami Hiramatsu <mhiramat@kernel.org> wrote:
>
>> On Fri, 10 Dec 2021 12:15:36 +0800
>> Yanteng Si <siyanteng01@gmail.com> wrote:
>> 
>> > Since 559789539255 ("Documentation: tracing: Add histogram syntax to boot-time tracing") which
>> > introduced a warning:
>> > 
>> > linux/Documentation/trace/boottime-trace.rst:136: WARNING: undefined label: histogram (if the link has no caption the label must precede a section header)
>> > 
>> > Replace with: (path)
>> >   
>> 
>> Looks good to me.
>> 
>> Acked-by: Masami Hiramatsu <mhiramat@kernel.org>
>> Fixes: 559789539255 ("Documentation: tracing: Add histogram syntax to boot-time tracing")
>
> Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
>
> Jon, care to take this through your tree?

Applied, thanks.

jon
