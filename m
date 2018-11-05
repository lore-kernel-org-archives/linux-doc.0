Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6455C7D08A
	for <lwn-linux-doc@archive.lwn.net>; Mon,  5 Nov 2018 16:22:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387561AbeKFBm0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 5 Nov 2018 20:42:26 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:40837 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387438AbeKFBmZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Nov 2018 20:42:25 -0500
Received: by mail-lf1-f67.google.com with SMTP id v5so1587442lfe.7
        for <linux-doc@vger.kernel.org>; Mon, 05 Nov 2018 08:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6FiXcRazG+8Y58F0VbSDRsWsXplwZMT6n5Yf8iMw8eM=;
        b=MFqHbqv2a/M3PVOv97yNyLDIVWuLOPUvlgu0q/O6EHG87Muo5s9TvamDicVk06sPfQ
         YLOFwaAqthEnizI7sslfzxvdtDIHa8LSQClch6i8dmeIiBq1BtUyxTeXp0Wd41FylKUb
         weHqT6TJDx9zPEFE04Ib9KolnVs5Pnjy7T7Zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6FiXcRazG+8Y58F0VbSDRsWsXplwZMT6n5Yf8iMw8eM=;
        b=QcteZJ8yqHT86jw0JnlMdmyD8CP0TxmPWt/tCZjiz5ptZB05c99QB1OxzD4gX915kv
         Ml0QKhiM8k1QZ3reV4BKast1uiMc5WfuB1XL7kkFHOYNHmZc8ZIScMqzXtx2C5voggE1
         Hzxk38nQWqFvOT7GUDqO/PBO4tEr3LSlBiF9AJdhSJFnLVi4kU6Y5l+Blor5G6RIfgoC
         4jE76fk/DrSRLTeSPMWWJcPAWc10cvxEvQqIf7klqY4iatTV8I/TZTWJxCnrrSvdxBwy
         rBBdtwBinjM9O1G6mQdN1SFYGACcAB4+SRFsRCpSnngCkMS74LxPiyA7anR/iRU1Zdno
         sXBA==
X-Gm-Message-State: AGRZ1gKqwbMKnjyK9Q9uRqDxnNG31cowTopUjpVKS0PGv2glaC8B/mcB
        2JkhX3OpXubZFa9KpVebpXtRkujixvTrhQ==
X-Google-Smtp-Source: AJdET5eLcm79C3j3OruBD6OLPCFbBJzH6V2kJzRRAUGLG12li58a09lNYc7+aOdhE2ZDW7a+SgaDFg==
X-Received: by 2002:a19:9a8c:: with SMTP id c134mr12372536lfe.152.1541434917275;
        Mon, 05 Nov 2018 08:21:57 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id f11sm1956474lfi.12.2018.11.05.08.21.56
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Nov 2018 08:21:57 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id d7-v6so6592440lfi.2
        for <linux-doc@vger.kernel.org>; Mon, 05 Nov 2018 08:21:56 -0800 (PST)
X-Received: by 2002:a19:cb94:: with SMTP id b142mr13364875lfg.117.1541434513299;
 Mon, 05 Nov 2018 08:15:13 -0800 (PST)
MIME-Version: 1.0
References: <20181022105944.GA1411@gmail.com> <CAHk-=whpBiV5sVTvPsWOVx5WYOouxbNG1fWeCdpK4oFiaH0Zqg@mail.gmail.com>
 <29dba7c2-f612-7b35-d665-9939d7e10eb8@virtuozzo.com> <CAHk-=wj2AEQbmhto6FwxaxLEwvh3GG8FD8p8UptOsh5bE7jcuQ@mail.gmail.com>
 <20181105070256.52c6fd8f@mschwideX1> <20181105141535.7394b16d@mschwideX1>
In-Reply-To: <20181105141535.7394b16d@mschwideX1>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 5 Nov 2018 08:14:56 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi6OFJrhN2rmTy7oy2ZghvQb5Nhrq1O1G-+EPuPxdhEMQ@mail.gmail.com>
Message-ID: <CAHk-=wi6OFJrhN2rmTy7oy2ZghvQb5Nhrq1O1G-+EPuPxdhEMQ@mail.gmail.com>
Subject: Re: [GIT PULL] Compiler Attributes for v4.20-rc1
To:     Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc:     Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        dan.carpenter@oracle.com, adilger.kernel@dilger.ca,
        yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        rostedt@goodmis.org, mchehab+samsung@kernel.org, olof@lxom.net,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        David Miller <davem@davemloft.net>,
        Kees Cook <keescook@chromium.org>, tglx@linutronix.de,
        Ingo Molnar <mingo@kernel.org>, paullawrence@google.com,
        sandipan@linux.vnet.ibm.com,
        Andrey Konovalov <andreyknvl@google.com>,
        David Woodhouse <dwmw2@infradead.org>, will.deacon@arm.com,
        Philippe Ombredanne <pombredanne@nexb.com>,
        paul.burton@mips.com, rientjes@google.com, w@1wt.eu,
        msebor@gmail.com, Chris Li <sparse@chrisli.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "Theodore Ts'o" <tytso@mit.edu>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>, joe@perches.com,
        Arnd Bergmann <arnd@arndb.de>, asmadeus@codewreck.org,
        stefan@agner.ch, luc.vanoostenryck@gmail.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-ext4@vger.kernel.org,
        linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 5, 2018 at 5:15 AM Martin Schwidefsky
<schwidefsky@de.ibm.com> wrote:
>
> This patch would work for me:

Thanks, applied,

                 Linus
