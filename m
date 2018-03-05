Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 416DB7E244
	for <lwn-linux-doc@archive.lwn.net>; Mon,  5 Mar 2018 15:02:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752545AbeCEPCI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 5 Mar 2018 10:02:08 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:23104 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752522AbeCEPCG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Mar 2018 10:02:06 -0500
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com [209.85.213.42]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id w25F22IO007238;
        Tue, 6 Mar 2018 00:02:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com w25F22IO007238
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1520262123;
        bh=4IM/mp2icbT3fqE3x0I+/xPrY4kmKsV+PbwQFWVmq4A=;
        h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
        b=DuriFyFqs1Zaikc78xcYmrdMS1EjGX+nRJSzrKyhLj5DW6GKvc/KqPguhNATGDuHA
         F2ecGtZrcLoMthThPuabkwguHiNMPw8P1s9xgbc5pKH0qqyFLsu14BMINYUVJo5Oqi
         4L3UlBi1/uNhQQIWj3YKQ9st5i0lCs70b8S9K9lLgkeRY59ljxYDqKDqZ52EhyZZqI
         6Lz2hYi7Myduag5XD8pTUt1tE0ZOgYrteXhhMn7PFyl6oc6lu6sHcifGBRJ6JGciTC
         mWvwfQaWKay1uQK5fvb7jWpFZLaMnaWCqaccMeTBotVNmwNL1vzY9198t6RTztDoqk
         fahHEjB+rD4TA==
X-Nifty-SrcIP: [209.85.213.42]
Received: by mail-vk0-f42.google.com with SMTP id z190so10019283vkg.1;
        Mon, 05 Mar 2018 07:02:03 -0800 (PST)
X-Gm-Message-State: APf1xPAdxIPtnnx1c8VS9RrbIsLa0PyUpDsCObjAZUUZt4rH96CC/V6z
        Ca+dOpx0PepZKczaGsLEnvhdPNsK3AvfFsFphxs=
X-Google-Smtp-Source: AG47ELtkrGGLIuIL6eRqj3Q2yXZCx7c+JkKkh1mwqq+xQM/kmi20119cqStGLTVjf/A9h6ofyOiJaRisIwq6KvRn5o8=
X-Received: by 10.31.33.68 with SMTP id h65mr10110126vkh.65.1520262122286;
 Mon, 05 Mar 2018 07:02:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.32.138 with HTTP; Mon, 5 Mar 2018 07:01:21 -0800 (PST)
In-Reply-To: <1519812864-852-1-git-send-email-yamada.masahiro@socionext.com>
References: <1519812864-852-1-git-send-email-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 6 Mar 2018 00:01:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNASzxVy1D48-aOTfwNRdMd48CSoJfe0hpvH=XXZL5czwmQ@mail.gmail.com>
Message-ID: <CAK7LNASzxVy1D48-aOTfwNRdMd48CSoJfe0hpvH=XXZL5czwmQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: remove command line interface LDFLAGS_MODULE
 from makefiles.txt
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Robin Jarry <robin.jarry@6wind.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2018-02-28 19:14 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Documentation/kbuild/makefiles.txt lists variables used in Makefile
> whereas Documentation/kbuild/kbuild.txt describes user assignable
> parameters given via environments or the command line.
>
> LDFLAGS_MODULE is a command line interface, so it should be dropped
> from makefiles.txt.
>
> Some lines below in this file, it is clearly explained that
> KBUILD_LDFLAGS_MODULE is the right one for the internal use:
>
>     KBUILD_LDFLAGS_MODULE   Options for $(LD) when linking modules
>
>         $(KBUILD_LDFLAGS_MODULE) is used to add arch-specific options
>         used when linking modules. This is often a linker script.
>         From commandline LDFLAGS_MODULE shall be used (see kbuild.txt).
>
> Then, kbuild.txt explains LDFLAGS_MODULE, like follows:
>
>     LDFLAGS_MODULE
>     --------------------------------------------------
>     Additional options used for $(LD) when linking modules.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  Documentation/kbuild/makefiles.txt | 6 ------
>  1 file changed, 6 deletions(-)


Both applied to linux-kbuild/kbuild.






-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
