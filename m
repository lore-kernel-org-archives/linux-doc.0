Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 38A177D071
	for <lwn-linux-doc@archive.lwn.net>; Sat, 28 Jul 2018 20:11:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730778AbeG1Vip (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 28 Jul 2018 17:38:45 -0400
Received: from mail-yw0-f193.google.com ([209.85.161.193]:45259 "EHLO
        mail-yw0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730603AbeG1Vip (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 28 Jul 2018 17:38:45 -0400
Received: by mail-yw0-f193.google.com with SMTP id 139-v6so3084969ywg.12
        for <linux-doc@vger.kernel.org>; Sat, 28 Jul 2018 13:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=cPMoboKkFV7lwvGjxrHbKH2jYD56z7LFUQwSYJjXuQ8=;
        b=g9JzTZdM+9ufVpk4TCSeCXz7VTcIioJCBYF80Upkoa1A/wAjpE9DR5rmh6PT+8i5ea
         SeBmC9AIDpXDGhtbXmwloVj+54yCWIDIL++rcOtiCCa6lzmPCszPlXnJgi9cQzOkjEq9
         qDA2FWTl6R6aEWd4ARZC7SBre+01lmFg2Mu3nsY15oxqUHcSiOW+PHSreZSlXhyvn9V7
         n3rn52AI/IfS8xsdudcPbRuXiubMa4XDzvgFljh7EIwuhm6BYtBgg2hQ8mOt/CW8+rFK
         YI4nC+EII2oWGkuf57RCz5TdD3aAETE9hJM0VBL9hQv9H+3maIRPb8eqr1JAHw/y+oN0
         IEzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=cPMoboKkFV7lwvGjxrHbKH2jYD56z7LFUQwSYJjXuQ8=;
        b=jM6p9rEMJ5aRlsgdNfYo0paZ3Ca0C/wEKOAEIwFckxVyUvC25xZyiH+7uti8byV69r
         fxXVhhfL7Lzbek40Iddms21wKybOTWAhiUBF3nW6NKYWxa83h3HCWLoaJoxsx6flWC8d
         n1YD/8ankcZHPqpHBg2WL/EbKsw1fOey5+vR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=cPMoboKkFV7lwvGjxrHbKH2jYD56z7LFUQwSYJjXuQ8=;
        b=LTDB4CyDVdusfZh9Jk7WC5DbpgEOnoEMUfwZdE/d5WSZp/6lqIXco9DSf5HmEwr/pK
         zpu1+QAUnGKlswD4Id9CVC0Kiddv4UVI3jEUb1JFUxLUngHSwjx2Lrca3l1CxAiIaUQo
         QL1MdwM/TlNWQh+fCDQfGxS2Xny2FjyV5W0Eeg52fZueT2jndoezX6lg3h0KETqy37Tg
         1OUcC388kryekcpDB6FMA8HzV+9i8HxXns2MYxvuExz13VXs2Puo8g22bPN4RYR9ovgY
         7uuytXg8Iygxr6C20KWUM3XVt4Tggq7PRMotTR9TcLoshTnwCmDZqvU45Dmz4nrutffR
         dNMw==
X-Gm-Message-State: AOUpUlF0Z8tJbICaWKNEY4egEvNPyW7mzQRNTJ6casfpRzCyCwly/Lzy
        r82ICdTVLO3Ea3T+EKne4kagsuKQAxFAYRrPhRSMNg==
X-Google-Smtp-Source: AAOMgpc4EAEafm++isfD2OCjn2naYO7Y7w64eS+FYJUM2lNayhGFJJUSf66eRXsw80thUNg07kxXG1yHy97FkKCWsNU=
X-Received: by 2002:a81:2706:: with SMTP id n6-v6mr5733915ywn.88.1532808666448;
 Sat, 28 Jul 2018 13:11:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:6602:0:0:0:0:0 with HTTP; Sat, 28 Jul 2018 13:11:05
 -0700 (PDT)
In-Reply-To: <CAK7LNASyzWvJ6Bf1Zp4k=B-QFOHEg7YqeFErA2Gg9PNZadvuew@mail.gmail.com>
References: <1531935483-30784-1-git-send-email-s.mesoraca16@gmail.com>
 <CAGXu5jK4q6HLDZ6jokTeDABbzVasY85Jo0HFNKYeaKWZYPjPKg@mail.gmail.com> <CAK7LNASyzWvJ6Bf1Zp4k=B-QFOHEg7YqeFErA2Gg9PNZadvuew@mail.gmail.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Sat, 28 Jul 2018 13:11:05 -0700
X-Google-Sender-Auth: a6VCqA5ncmQl7X8EMscit5HvJu4
Message-ID: <CAGXu5jL2s-Dv+4mFV3Wwev51kcQ3h5M02UoH6K71s_NqeXw1yw@mail.gmail.com>
Subject: Re: [RFC] kconfig: add hardened defconfig helpers
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Salvatore Mesoraca <s.mesoraca16@gmail.com>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        Laura Abbott <labbott@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Jul 22, 2018 at 6:55 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> 2018-07-20 14:15 GMT+09:00 Kees Cook <keescook@chromium.org>:
>> +lkml, Masahiro, and linux-doc, just for wider review/thoughts.
>
>
> I do not subscribe to kernel-hardening ML.
>
> I do not see the original patch in lkml or kbuild/kconfig ML.

Here's the start of the thread:
http://www.openwall.com/lists/kernel-hardening/2018/07/18/1

-Kees

-- 
Kees Cook
Pixel Security
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
