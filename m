Return-Path: <SRS0=yfWO=5R=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A87C2BA12
	for <linux-doc@archiver.kernel.org>; Wed,  1 Apr 2020 16:46:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF45D20705
	for <linux-doc@archiver.kernel.org>; Wed,  1 Apr 2020 16:46:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RWqirBfk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389977AbgDAQqp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Apr 2020 12:46:45 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:55070 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389965AbgDAQqo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Apr 2020 12:46:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=RZ1DCgHt67uVltVoQgZaCCuI0kAzJy8E1a5Ir9Y83Eg=; b=RWqirBfkV6VRmHcDuHqqc0f3Hy
        Vk8liFl/wC0cNx+n1Kd1pc80R8IdXi6Q5zFEVJdOj6WNwpCQh4B4eMHxJqaDLikQc9dPTrIjRWszU
        KGPr9Fjf4euwsja3vnMvaE1SUxOdNrUAkUTNhkXOAfY8XcKjxqkjNhSCI2FOOwAjW3v00WprG3duO
        k+dfN397aijSKPkejDUBTKrGdeH6WEmfnAyrKIfKuU5J3g7vR6D0mZNmNeOvGU8q2bNQFwl2SpV9Q
        b0BzZWaCaOhkBa0Hig4wwLES1wkJDlCQP4xVuiCOe5STZP1gBFRAJQ/oG5+snBeGwCs8XxqKLZtHG
        VTURT82g==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jJgVm-0008V4-53; Wed, 01 Apr 2020 16:46:42 +0000
Subject: Re: [PATCH] docs: pr_*() kerneldocs and basic printk docs
To:     =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>,
        corbet@lwn.net, linux-doc@vger.kernel.org, pmladek@suse.com
Cc:     kernel@collabora.com
References: <20200401083121.20961-1-ricardo.canuelo@collabora.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6e398e11-0c5b-7308-1bda-8d7178c0a42b@infradead.org>
Date:   Wed, 1 Apr 2020 09:46:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200401083121.20961-1-ricardo.canuelo@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/1/20 1:31 AM, Ricardo Cañuelo wrote:
> Add kerneldocs comments to the pr_*() macros in printk.h.
> 
> Add a new rst node in the core-api manual describing the basic usage of
> printk and the related macro aliases.
> 
> Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
> ---
> Hi,
> 
> I'm taking over this task which my colleague André Almeida proposed a
> while ago: https://patchwork.kernel.org/patch/11145385/
> 
> I created kerneldoc comments for all the pr_*() macros and a new rst
> node for printk basics in the core-api linking to them. The printk
> documentation I added is targeted at newcomers and simply covers the
> usage of printk et al from a functional perspective.
> 
> Initially I thought about having all the printk-related docs in one
> single node in the core-api, but I think having the basics of printk in
> a separate node works better as a first draft, and there's also the
> chance to grow this file further with more specific information,
> examples and use cases if needed.
> 
> Best,
> Ricardo
> 
>  Documentation/core-api/index.rst          |   1 +
>  Documentation/core-api/printk-basics.rst  | 141 ++++++++++++++++++++++
>  Documentation/core-api/printk-formats.rst |   2 +
>  include/linux/printk.h                    | 102 ++++++++++++++--
>  4 files changed, 234 insertions(+), 12 deletions(-)
>  create mode 100644 Documentation/core-api/printk-basics.rst
> 

> diff --git a/Documentation/core-api/printk-basics.rst b/Documentation/core-api/printk-basics.rst
> new file mode 100644
> index 000000000000..fbc6745503ec
> --- /dev/null
> +++ b/Documentation/core-api/printk-basics.rst
> @@ -0,0 +1,141 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +===========================
> +Message logging with printk
> +===========================
> +
> +printk() is one of the most widely known functions in the Linux kernel. It's the
> +standard tool we have for printing messages and usually the most basic way of
> +tracing and debugging. If you're familiar with printf(3) you can tell printk()
> +is based on it, although it has two functional differences:

s/two/three/

> +
> +  - printk() messages can specify a log level

     - '%n' is not supported

> +  - the format string has some extensions over C99 (see :ref:`How to get printk
> +    format specifiers right <printk-specifiers>`)
> +
> +All printk() messages are printed to the kernel log buffer, which is a ring
> +buffer exported to userspace through /dev/kmsg. The usual way to read it is
> +using ``dmesg``.
> +
> +printk() is typically used like this::
> +
> +  printk(KERN_INFO "Message: %s\n", arg);
> +
> +where ``KERN_INFO`` is the log level (note that it's concatenated to the format
> +string, the log level is not a separate argument). The available log levels are:
> +
> ++----------------+--------+-----------------------------------------------+
> +| Name           | String |  Alias function                               |
> ++================+========+===============================================+
> +| KERN_EMERG     | "0"    | pr_emerg()                                    |
> ++----------------+--------+-----------------------------------------------+
> +| KERN_ALERT     | "1"    | pr_alert()                                    |
> ++----------------+--------+-----------------------------------------------+
> +| KERN_CRIT      | "2"    | pr_crit()                                     |
> ++----------------+--------+-----------------------------------------------+
> +| KERN_ERR       | "3"    | pr_err()                                      |
> ++----------------+--------+-----------------------------------------------+
> +| KERN_WARNING   | "4"    | pr_warn()                                     |
> ++----------------+--------+-----------------------------------------------+
> +| KERN_NOTICE    | "5"    | pr_notice()                                   |
> ++----------------+--------+-----------------------------------------------+
> +| KERN_INFO      | "6"    | pr_info()                                     |
> ++----------------+--------+-----------------------------------------------+
> +| KERN_DEBUG     | "7"    | pr_debug() and pr_devel() if DEBUG is defined |
> ++----------------+--------+-----------------------------------------------+
> +| KERN_DEFAULT   | ""     |                                               |
> ++----------------+--------+-----------------------------------------------+
> +| KERN_CONT      | "c"    | pr_cont()                                     |
> ++----------------+--------+-----------------------------------------------+
> +
> +
> +The log level determines the importance of a message. The kernel decides whether

                 specifies (?)

> +to show the message immediately (printing it to the current console) depending
> +on its log level and the current *console_loglevel* (a kernel variable). If the
> +message priority is higher (lower log level value) than the *console_loglevel*
> +the message will be printed to the console.
> +
> +If the log level is omitted, the message is printed with ``KERN_DEFAULT``
> +level.
> +
> +You can check the current *console_loglevel* with::
> +
> +  $ cat /proc/sys/kernel/printk
> +  4        4        1        7
> +
> +The result shows the *current*, *default*, *minimum* and *boot-time-default* log
> +levels.
> +
> +To change the current console_loglevel simply write the the desired level to
> +``/proc/sys/kernel/printk``. For example, to print all messages to the console::
> +
> +  # echo 8 > /proc/sys/kernel/printk
> +
> +Another way, using ``dmesg``::
> +
> +  # dmesg -n 5
> +
> +would set the console_loglevel to print KERN_WARNING (4) or more severe messages

s/would set/sets/

> +to console. See ``dmesg(1)`` for more information.
> +
> +As an alternative to printk() you can use the ``pr_*()`` aliases for
> +logging. This family of macros embed the log level in the macro names. For
> +example::
> +
> +  pr_info("Info message no. %d\n", msg_num);
> +
> +would print a ``KERN_INFO`` message.

s/would print/prints/

> +
> +Besides being more concise than the equivalent printk() calls, they can use a
> +common definition for the format string through the pr_fmt() macro. For
> +instance, defining this at the top of a source file (before any ``#include``
> +directive)::
> +
> +  #define pr_fmt(fmt) "%s:%s: " fmt, KBUILD_MODNAME, __func__

"fmt" should be last, not first, in order for modname and func to be
prefixes.

> +
> +would prefix every pr_*() message in that file with the module and function name
> +that originated the message.
> +
> +For debugging purposes there are also two conditionally-compiled macros:
> +pr_debug() and pr_devel(), which are compiled-out unless ``DEBUG`` (or
> +also ``CONFIG_DYNAMIC_DEBUG`` in the case of pr_debug()) is defined.
> +
> +
> +Function reference
> +==================
> +
> +.. kernel-doc:: kernel/printk/printk.c
> +   :functions: printk
> +
> +.. kernel-doc:: include/linux/printk.h
> +   :functions: pr_emerg
> +
> +.. kernel-doc:: include/linux/printk.h
> +   :functions: pr_alert
> +
> +.. kernel-doc:: include/linux/printk.h
> +   :functions: pr_crit
> +
> +.. kernel-doc:: include/linux/printk.h
> +   :functions: pr_err
> +
> +.. kernel-doc:: include/linux/printk.h
> +   :functions: pr_warn
> +
> +.. kernel-doc:: include/linux/printk.h
> +   :functions: pr_notice
> +
> +.. kernel-doc:: include/linux/printk.h
> +   :functions: pr_info
> +
> +.. kernel-doc:: include/linux/printk.h
> +   :functions: pr_fmt
> +
> +.. kernel-doc:: include/linux/printk.h
> +   :functions: pr_debug
> +
> +.. kernel-doc:: include/linux/printk.h
> +   :functions: pr_devel
> +
> +.. kernel-doc:: include/linux/printk.h
> +   :functions: pr_cont


thanks.
-- 
~Randy

