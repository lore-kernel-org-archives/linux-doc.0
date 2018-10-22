Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 78FA97D082
	for <lwn-linux-doc@archive.lwn.net>; Mon, 22 Oct 2018 12:07:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728137AbeJVUZ1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 22 Oct 2018 16:25:27 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35988 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727774AbeJVUZ0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Oct 2018 16:25:26 -0400
Received: by mail-wm1-f66.google.com with SMTP id a8-v6so10050742wmf.1;
        Mon, 22 Oct 2018 05:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZsbZ57fCsmzw176SsPwxEiIqrGSAPMgNXx6xKcWDpBQ=;
        b=kAhEWmiCpjIDNGMC8dkcpT+4kPnx3eOXzKmR+5CABoflyoJGSWAVy0k8L1heZzUh0f
         pFOwTFEQAJDuG6b2vH1L2KlhYfwhVm18bhvXgO0kVip6LnXo88oc5eIjPwgl0n0/w3q+
         a3J2anXE7t4RmrxLoofpXNl3Atvjg7YuMSLnCFQlHagV2Yy5/YE/rCVzHxIg2gkF4A76
         MNRBNAHtQ3RifG7AlQvulMpPNRa/o/hQvXy36Rb86TbEtnrgvthJE+07vlDk/yQi8auA
         VOT5ofpJty4uZNbsBxkVkJPgE1RMpzjP+56jOLEJHroS7aQoa36RZH7zAc4YGm2j1LzW
         Rl8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZsbZ57fCsmzw176SsPwxEiIqrGSAPMgNXx6xKcWDpBQ=;
        b=FHPOurDIRnSWmzAmY/yUHadlMHP4M0k6//p7wUqKw/oyoSUBQGtGgsEqjEiq/WMa3z
         zLJniX8zXkktrPPgE9KNOU+7ZRPcuq+CjNwOgvt10u/AcfXOUbbS3TjCMmTfKR83lSit
         sqWeg287sEB2qQ+SXZz1z+yEGWs47/xO0Brj102Az91wqyZTvmJDQ2GAJ5RtKBzzHltp
         ZB3z4+rmLnaDy5GvF5mialQbR3GuOKYUoJ8P3+5kRnQimyRL0rfD+oGj72tm/68HUUMf
         w3Ta30bZNUVwl3g6qclEo6yl0m9p1FOfh6PX1o0PWnV8iBc1xjejtn0/UjPjFNavHco8
         razw==
X-Gm-Message-State: ABuFfohkibN53kHXoYXfOObCpyZ+PWILbotw8GR4VmYSJ4lgHuX0qZqO
        S7mZOkOq4tRh7KGuTW/qyrY=
X-Google-Smtp-Source: ACcGV61edh6pVV4a6OCq3Ierrcmq8Z6vKd124ESVc9lXSf0bk7q2mMN4B/9Olg7fiyF6CW1sX23mxg==
X-Received: by 2002:a1c:890:: with SMTP id 138-v6mr15058491wmi.128.1540210027473;
        Mon, 22 Oct 2018 05:07:07 -0700 (PDT)
Received: from ltop.local ([185.7.230.215])
        by smtp.gmail.com with ESMTPSA id g186-v6sm12093582wmf.19.2018.10.22.05.07.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Oct 2018 05:07:06 -0700 (PDT)
Date:   Mon, 22 Oct 2018 13:07:02 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Olof Johansson <olof@lxom.net>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        "David S . Miller" <davem@davemloft.net>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Kees Cook <keescook@chromium.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>,
        Paul Lawrence <paullawrence@google.com>,
        Sandipan Das <sandipan@linux.vnet.ibm.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Will Deacon <will.deacon@arm.com>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Paul Burton <paul.burton@mips.com>,
        David Rientjes <rientjes@google.com>, Willy Tarreau <w@1wt.eu>,
        Martin Sebor <msebor@gmail.com>,
        Christopher Li <sparse@chrisli.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Theodore Ts'o <tytso@mit.edu>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@arndb.de>,
        Dominique Martinet <asmadeus@codewreck.org>,
        Stefan Agner <stefan@agner.ch>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-doc@vger.kernel.org, linux-ext4@vger.kernel.org,
        linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 1/2] Compiler Attributes: add support for __fallthrough
 (gcc >= 7.1)
Message-ID: <20181022120658.jm7dv7jiq7riuqci@ltop.local>
References: <20181021171414.22674-1-miguel.ojeda.sandonis@gmail.com>
 <20181021171414.22674-2-miguel.ojeda.sandonis@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181021171414.22674-2-miguel.ojeda.sandonis@gmail.com>
User-Agent: NeoMutt/20180622
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Oct 21, 2018 at 07:14:13PM +0200, Miguel Ojeda wrote:
> 
> While comment parsing is a good idea to deal with old codebases
> that used such a comment as documentation for humans, the best
> solution is to use the attribute:
> 
>   * It is a "real" part of the AST (=> better for tooling).

This will create a problem for the recent versions of sparse which
support __has_attribute() because sparse falsely pretends to support
this attribute while, to play nice with -Wdeclaration-after-statement,
it needs some adaptation to the parsing (it's actually seen not as a 
statement but as a declaration).  I'll see to fix it this evening.


Regards,
-- Luc
