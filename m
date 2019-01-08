Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5337A7D099
	for <lwn-linux-doc@archive.lwn.net>; Tue,  8 Jan 2019 17:33:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727484AbfAHRda (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 8 Jan 2019 12:33:30 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45032 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728446AbfAHRd3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Jan 2019 12:33:29 -0500
Received: by mail-lj1-f193.google.com with SMTP id k19-v6so4078288lji.11
        for <linux-doc@vger.kernel.org>; Tue, 08 Jan 2019 09:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jfv87pSQ5LVZE74bOZwZ8D7JulJow6i/PnPfHwK+beY=;
        b=Ff5zqWtvBaoawRAIyfaAccJMtP0gD6XI3rNud/64ERuZvWLhDJGp1ZhDEz6k4MyKQz
         zl96KtWn8r9He2n6EF6CCs9eydPR9vXh0lkXoocD3+8xeKMI5XOsyRdq6YyFRLlwtH86
         TBsmVdBas62E0jXz0ABg5ddG9IA3IAetBAYM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jfv87pSQ5LVZE74bOZwZ8D7JulJow6i/PnPfHwK+beY=;
        b=T6Z0oSJvj2lwhBMTHR50xpytOrTyyWSqtJ5BSagwPjWnjOPLqH2qXYw1PGV3v0sIF+
         qepUJvc1t3JiPxkKbByC1p783Ob1xXoMdo26WxJZmRWx/0Q1dwTl8G7iqBg9Mi0ez25d
         rtnInS2t/P2F2xTOZTWoXaapOrmNjdkvlUq5wo7/fg2HVELEaHpJTdtYMH5n0m/B21Ja
         pEVelZm8U0RcQeTD+upnFukGvkErHcD2NXKiQ5EGp5tfWi44t5g/c1eUlMzTpig3+hJP
         SgVLS+9jLk0mJVXoGOfvdM2TvO+2mhEboVt1/0xORMk0nJj2PDFpaJ3M1w3PlKukGGff
         QTkQ==
X-Gm-Message-State: AJcUukdm92FVyo3YJTY+rRiSWbYew1wSTEgwtYYZwFSRUOaNygeslm/7
        xgby5uNe21VvKPLi8U8vMtbR5xbMw0Y=
X-Google-Smtp-Source: ALg8bN6pWzF9Hu33FUT0Ac0ajIWsfAn/IGH8fqYfGtDPB+zO6Sh74m9JFTiWDNx/pqzrUiXpcdbtfg==
X-Received: by 2002:a2e:58b:: with SMTP id 133-v6mr1708345ljf.127.1546968806507;
        Tue, 08 Jan 2019 09:33:26 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id d5sm13180547lfi.65.2019.01.08.09.33.25
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jan 2019 09:33:25 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id e26so3557542lfc.2
        for <linux-doc@vger.kernel.org>; Tue, 08 Jan 2019 09:33:25 -0800 (PST)
X-Received: by 2002:a19:3fcf:: with SMTP id m198mr1519595lfa.106.1546968805166;
 Tue, 08 Jan 2019 09:33:25 -0800 (PST)
MIME-Version: 1.0
References: <1546964798-30067-1-git-send-email-guoren@kernel.org> <1546964798-30067-4-git-send-email-guoren@kernel.org>
In-Reply-To: <1546964798-30067-4-git-send-email-guoren@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 8 Jan 2019 09:33:09 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh0H6_Vh3XNQ0EKWa96UFkr7j=v-++2L4kraSLR-RVciQ@mail.gmail.com>
Message-ID: <CAHk-=wh0H6_Vh3XNQ0EKWa96UFkr7j=v-++2L4kraSLR-RVciQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] csky: fixup compile error with pte_alloc
To:     Guo Ren <guoren@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, marc.zyngier@arm.com,
        Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Michal Hocko <mhocko@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Guo Ren <ren_guo@c-sky.com>,
        Joel Fernandes <joel@joelfernandes.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 8, 2019 at 8:27 AM <guoren@kernel.org> wrote:
>
> +       for (i = 0; i < PAGE_SIZE/sizeof(pte_t); i++)
> +               (pte + i)->pte_low = _PAGE_GLOBAL;

When I first read this, I went "hmm. pte_high is not initialized".

But csky doesn't have a pte_high, and it seems that csky and SH both
decided to call their (single-word) pte member 'pte_low'.

Which is a bit odd, but whatever.

Other than that oddity, it looks fine to me. I assume I'll get a pull
request sooner or later,

              Linus
