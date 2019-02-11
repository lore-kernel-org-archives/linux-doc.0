Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4C2B67D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 11 Feb 2019 17:11:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727908AbfBKRL2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 11 Feb 2019 12:11:28 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45810 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727347AbfBKRL2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Feb 2019 12:11:28 -0500
Received: by mail-lf1-f68.google.com with SMTP id b20so8332478lfa.12
        for <linux-doc@vger.kernel.org>; Mon, 11 Feb 2019 09:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s0Ke2D+YQhyUTnHYmCz/UEaq2bJ6aXQCp0Q6/PcRnJc=;
        b=P2U8JPxpfd1ZC1nnCAC7878wfYW5iOSdJ7BZrPQlgP1hmfq9YCb/OQhCjqze+rZ25R
         +PReXxR/RT7BXDLgu2+qyY6oqvA9NK5NQuR/tac2OVjYDMDpiRlaiCuHmkHI6w4eSmQ9
         PXxuoLuXsBXuot/ECFNQF9pZdrrw+0zYXrtZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s0Ke2D+YQhyUTnHYmCz/UEaq2bJ6aXQCp0Q6/PcRnJc=;
        b=nwwwe3q7SZs3MrLjM3C5XSPtN5REgHzIVBa597Ttd1Sh6A/hGreMgK49R1NhA1aHpX
         LNLzAGyQuaquX1wzMibrZyYpJlKV7CQ+iCGwR4PF2oWpzAWAwABJ8Y52+Js8vz0EhkB6
         wakVHF8Tp8GGerD5gsXEdSY/3ys89y69p95m030X2RuD2Bt4lzpKDLYPHqWWWGKNZWZH
         SskURGaQxCPCcrWGeAeMZOX+tkoyBUiaojtvr614qrEODaMphqH+h/nNkMdnq8VO85Sc
         oPj8Su/0Y/CNoGq6LEZviAcABz4wGO6OUIzVfxXEb6bJsVVAL1e1BdSaMrhff6I7wny0
         312w==
X-Gm-Message-State: AHQUAuZEP4XbbMVAl1rixA3MbVOKcNyN/6/A3oNLlthGjbfR1J6OkQKc
        EHz5RIKK3fLLKka2p2adsUid49gKXyY=
X-Google-Smtp-Source: AHgI3IbkOCqofV2wkjpDYkF9HeQMCP/D/0y+s52ksA7bvji/uGEK+Cj9Gs8aS16yJdzLQJgWI+6IcQ==
X-Received: by 2002:a19:2242:: with SMTP id i63mr7642000lfi.39.1549905085463;
        Mon, 11 Feb 2019 09:11:25 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id n12-v6sm2155809ljj.32.2019.02.11.09.11.24
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Feb 2019 09:11:24 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id b20so8332373lfa.12
        for <linux-doc@vger.kernel.org>; Mon, 11 Feb 2019 09:11:24 -0800 (PST)
X-Received: by 2002:a19:9813:: with SMTP id a19mr22653642lfe.103.1549905083849;
 Mon, 11 Feb 2019 09:11:23 -0800 (PST)
MIME-Version: 1.0
References: <1549570542-2471-1-git-send-email-longman@redhat.com> <20190211083911.22f64578@lwn.net>
In-Reply-To: <20190211083911.22f64578@lwn.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 11 Feb 2019 09:11:06 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgvHhe+3HSpLSZEQm5ToJW4AFiynMvYBiqu=2zBVZnt-A@mail.gmail.com>
Message-ID: <CAHk-=wgvHhe+3HSpLSZEQm5ToJW4AFiynMvYBiqu=2zBVZnt-A@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: Fix grammatical error in sysctl/fs.txt
 & clarify negative dentry
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Waiman Long <longman@redhat.com>, linux-doc@vger.kernel.org,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 11, 2019 at 7:39 AM Jonathan Corbet <corbet@lwn.net> wrote:
>
> Linus, perhaps you'd like to take this one directly?

Done.

               Linus
