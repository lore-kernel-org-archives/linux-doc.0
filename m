Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E114E7D08E
	for <lwn-linux-doc@archive.lwn.net>; Sat, 29 Dec 2018 19:24:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727524AbeL2TYz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 29 Dec 2018 14:24:55 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:38878 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727768AbeL2TYz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 29 Dec 2018 14:24:55 -0500
Received: by mail-lf1-f67.google.com with SMTP id p86so16389846lfg.5
        for <linux-doc@vger.kernel.org>; Sat, 29 Dec 2018 11:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2s0jvY7V1c2xkkOGGUxGrsCBJJpkkgmr0GmxT5GXqiA=;
        b=PTW5HKGwKEtLgaK0c6lNxT16mStDszF0dZ5qmTC3mp+aNRPFhpwef93ScBYj/IeBry
         3JrHzr68wXlznBPr6Uf7tvjx6JJLE6+SKhm42noMQ4feDKA7A1Lj7oUrYBxcusIEuj/g
         I/gYVJXj56ght1gexi+W1W2tMowmlPfCDlKec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2s0jvY7V1c2xkkOGGUxGrsCBJJpkkgmr0GmxT5GXqiA=;
        b=gp0KosAWw7nMt7TbEceBI6yILv4GtJY/CLTS41IAUsTv2YcI8E9+qEpmmNXAXlIk3L
         eOo6Snw9rdW0Aom5bXuGM/Ve+3Azu3EuYaV5AHVTZI4dJBvP9lGeVQK79cqVmF6RaXxa
         JjNxTO6utoS6OXeZstTb/ZNXHSYt0HZzMBUqjCAo6nAGhSpljV0i0imsoMyuXwR3Mf0K
         kliwfVIo7TTE6IFtSaqrGkiiV+yscaCujIiUHVWko3RCFDSe6QTNBD2w50nQJVVPKchD
         q8JPHnHlY3/205tuIYykSWhIlMyu+EPVHUs6+Xkbm+Hz0fQ3nQGhCNF1uZcUu4IRAGfW
         c2MA==
X-Gm-Message-State: AA+aEWao7A0XFGW3rrEagDpB1QlH4gH12yWvfx16yCH4pt4lxb1enA3s
        sO07H3nC4bMQHeu80PpmBNylgqmanTk=
X-Google-Smtp-Source: AFSGD/XcHYI78ByRGZ9u4OsswOurpfOqPpdbSjOYgGKo9hxc1GFVVsGLiihdd6ZzA+PZxW6mPK1YxA==
X-Received: by 2002:a19:4e59:: with SMTP id c86mr17072667lfb.132.1546111492391;
        Sat, 29 Dec 2018 11:24:52 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 67-v6sm9246661ljc.26.2018.12.29.11.24.51
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 29 Dec 2018 11:24:51 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id t18-v6so21143884ljd.4
        for <linux-doc@vger.kernel.org>; Sat, 29 Dec 2018 11:24:51 -0800 (PST)
X-Received: by 2002:a2e:9c7:: with SMTP id 190-v6mr13061961ljj.120.1546111490627;
 Sat, 29 Dec 2018 11:24:50 -0800 (PST)
MIME-Version: 1.0
References: <20181228090622.4c210228@lwn.net>
In-Reply-To: <20181228090622.4c210228@lwn.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 29 Dec 2018 11:24:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj8=xoaS=QJXRMo70Si0E5xvJmdyA2-cu99_MA_FjhHTA@mail.gmail.com>
Message-ID: <CAHk-=wj8=xoaS=QJXRMo70Si0E5xvJmdyA2-cu99_MA_FjhHTA@mail.gmail.com>
Subject: Re: [GIT PULL] Documentation for 5.0
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Dec 28, 2018 at 8:06 AM Jonathan Corbet <corbet@lwn.net> wrote:
>
>   git://git.lwn.net/linux.git tags/docs-5.0

New signing key? And one that you forgot to push out to keyservers?

                Linus
