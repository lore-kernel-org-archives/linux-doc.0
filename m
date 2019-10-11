Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 121F27D90D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 11 Oct 2019 17:52:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728603AbfJKRwQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 11 Oct 2019 13:52:16 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:44593 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728470AbfJKRwQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Oct 2019 13:52:16 -0400
Received: by mail-lf1-f67.google.com with SMTP id q12so7617903lfc.11
        for <linux-doc@vger.kernel.org>; Fri, 11 Oct 2019 10:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LgOWyC4KuQvhExdqsSsy/AfsFX2Dxg7AbZdsgfAmHWQ=;
        b=Q2UkfBZSP0S9e/7OB3SF+XNURSwl+NMXpb0vpdXJQjsdW/6qutIw5uECnuvQSRhIfS
         ceZtY1Swy2zbGPAzUqBps7PsUDeS/0EuPPnU0Fy92rdos/7lz0dqKIiPx08pFFvzsTUD
         k3cf62WY2m182EbDTriMmjsXhjGoXoDCawAIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LgOWyC4KuQvhExdqsSsy/AfsFX2Dxg7AbZdsgfAmHWQ=;
        b=sY/W4WLeVWFBj7WBW8mp7c5UdAlQGJJgdfroMAMkzr1ZoJUFkNPC5oYgfZj34TEgPV
         ggW7cbVP0132D+Y4+1tsVDMgd4vRUHMRMpZmDFOGiRz/o1Q81BVqU3pG9f0NEbVv47gw
         MRlzLKdBYEZ5BgxeiZLcALBlT1Q9keMqw0sGWhTtQBnOKmF/fwIypBjk1Umb0LsXfG9H
         1101pdiq0JbyyVsJr6/N5bx/7PYrMqGJ0nXg8aseRlILCud/OpPhpDDHJxdC4UyPT6FL
         Vo81XT4MeB7KWtfVrbv1y7hWT1/Svt6V3s8LdqTYO700ZoXvppziGrsHY8lDO0PYbXx2
         UcAw==
X-Gm-Message-State: APjAAAXjfmwghVKySWIOkhHyMcdxQzZeAATVqlhd62tjwQXik3JCMtyP
        FVkvoROqsBZQP8746kYuJLxiGOtWhvw=
X-Google-Smtp-Source: APXvYqzGlJ6BY5SMIaZDTKWrgw/vCrbjeXJt4HFrMD3L+8bxPAeq4CPcbB2R1+ibHDn/cM5Ig7xPOw==
X-Received: by 2002:ac2:5629:: with SMTP id b9mr10192153lff.32.1570816334069;
        Fri, 11 Oct 2019 10:52:14 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 126sm3002542lfh.45.2019.10.11.10.52.13
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2019 10:52:13 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id j19so10692955lja.1
        for <linux-doc@vger.kernel.org>; Fri, 11 Oct 2019 10:52:13 -0700 (PDT)
X-Received: by 2002:a2e:6a04:: with SMTP id f4mr9892356ljc.97.1570816006661;
 Fri, 11 Oct 2019 10:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1570292505.git.joe@perches.com> <CAHk-=whOF8heTGz5tfzYUBp_UQQzSWNJ_50M7-ECXkfFRDQWFA@mail.gmail.com>
 <9fe980f7e28242c2835ffae34914c5f68e8268a7.camel@perches.com>
In-Reply-To: <9fe980f7e28242c2835ffae34914c5f68e8268a7.camel@perches.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 11 Oct 2019 10:46:30 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi1T1m-su8zK5LeESoz_Pgf1-4hnjr516NiDLNyb4USug@mail.gmail.com>
Message-ID: <CAHk-=wi1T1m-su8zK5LeESoz_Pgf1-4hnjr516NiDLNyb4USug@mail.gmail.com>
Subject: Re: [PATCH 0/4] treewide: Add 'fallthrough' pseudo-keyword
To:     Joe Perches <joe@perches.com>
Cc:     linux-sctp@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Pavel Machek <pavel@ucw.cz>,
        "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Kan Liang <kan.liang@linux.intel.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Jiri Olsa <jolsa@redhat.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Shawn Landden <shawn@git.icu>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Miller <davem@davemloft.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Vlad Yasevich <vyasevich@gmail.com>,
        Neil Horman <nhorman@tuxdriver.com>,
        Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Netdev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 11, 2019 at 10:43 AM Joe Perches <joe@perches.com> wrote:
>
> Shouldn't a conversion script be public somewhere?

I feel the ones that might want to do the conversion on their own are
the ones that don't necessarily trust the script.

But I don't even know if anybody does want to, I just feel it's an option.

              Linus
