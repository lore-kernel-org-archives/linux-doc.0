Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D016F7D043
	for <lwn-linux-doc@archive.lwn.net>; Tue, 15 May 2018 14:52:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753325AbeEOOwe (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 15 May 2018 10:52:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:55774 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752448AbeEOOwd (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 15 May 2018 10:52:33 -0400
Received: from gandalf.local.home (cpe-66-24-56-78.stny.res.rr.com [66.24.56.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D5B4723895;
        Tue, 15 May 2018 14:52:29 +0000 (UTC)
Date:   Tue, 15 May 2018 10:52:28 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Harry Wei <harryxiyou@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Roy Pledge <Roy.Pledge@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Ingo Molnar <mingo@redhat.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-gpio@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@zh-kernel.org, linux-usb@vger.kernel.org,
        linux-input@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-fbdev@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH v2 11/11] docs: fix broken references with multiple
 hints
Message-ID: <20180515105228.4ac2df94@gandalf.local.home>
In-Reply-To: <63a4f8a93f9115475bc184d0f37d076c9b9c75ff.1525870886.git.mchehab+samsung@kernel.org>
References: <cover.1525870886.git.mchehab+samsung@kernel.org>
        <63a4f8a93f9115475bc184d0f37d076c9b9c75ff.1525870886.git.mchehab+samsung@kernel.org>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed,  9 May 2018 10:18:54 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:


> diff --git a/Documentation/trace/events.rst b/Documentation/trace/events.rst
> index 7b6b1236ec2e..c292117b83a9 100644
> --- a/Documentation/trace/events.rst
> +++ b/Documentation/trace/events.rst
> @@ -8,7 +8,7 @@ Event Tracing
>  1. Introduction
>  ===============
>  
> -Tracepoints (see Documentation/trace/tracepoints.txt) can be used
> +Tracepoints (see Documentation/trace/tracepoints.rst) can be used
>  without creating custom kernel modules to register probe functions
>  using the event tracing infrastructure.
>  
> diff --git a/Documentation/trace/tracepoint-analysis.rst b/Documentation/trace/tracepoint-analysis.rst
> index b0c9c21f129d..716326b9f152 100644
> --- a/Documentation/trace/tracepoint-analysis.rst
> +++ b/Documentation/trace/tracepoint-analysis.rst
> @@ -6,7 +6,7 @@ Notes on Analysing Behaviour Using Events and Tracepoints
>  1. Introduction
>  ===============
>  
> -Tracepoints (see Documentation/trace/tracepoints.txt) can be used without
> +Tracepoints (see Documentation/trace/tracepoints.rst) can be used without
>  creating custom kernel modules to register probe functions using the event
>  tracing infrastructure.
>  

> diff --git a/include/linux/tracepoint.h b/include/linux/tracepoint.h
> index c94f466d57ef..19a690b559ca 100644
> --- a/include/linux/tracepoint.h
> +++ b/include/linux/tracepoint.h
> @@ -4,7 +4,7 @@
>  /*
>   * Kernel Tracepoint API.
>   *
> - * See Documentation/trace/tracepoints.txt.
> + * See Documentation/trace/tracepoints.rst.
>   *
>   * Copyright (C) 2008-2014 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
>   *

Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- Steve
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
