Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_DKIMWL_WL_MED,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AA6DC7D2EE
	for <lwn-linux-doc@archive.lwn.net>; Mon, 20 Aug 2018 20:25:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbeHTXmr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 20 Aug 2018 19:42:47 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43644 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbeHTXmn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Aug 2018 19:42:43 -0400
Received: by mail-pg1-f194.google.com with SMTP id v66-v6so5997837pgb.10
        for <linux-doc@vger.kernel.org>; Mon, 20 Aug 2018 13:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s+ZAQzVfVhWeLceyKWn+FK+VYYwausDp5pofcIxzenc=;
        b=bBbOvdTKxeRm20RfobfEHZyzp+3MTkk4yyKUaXM4P0EvrAJ/q6GtuV/lja2iy4kQin
         hXE4giAH7oOFd/AYMiKN/mMh5ovO41gNSFl/xk2XvY+Wb63i/YbBXWfskbWyQ18pAKug
         +O1MisPzUKDDLkAQH+85AYPpI+gHgJVCZGP9uyyRB1fOIYDG36ou6RY5VwQQZOsEl6wq
         EArjjQ5aK0ZJCnIstxzkQ8ITfc+EqCzbbCotY91PSEXLfyDnTSlVOhIlJasQgMWIv9U3
         foaDtYAl0C9Mzk3EiYjtN+Vi586XZFTsp4Vg+DA1BrelA4px5t9Cw5C6gpMLh30pY0HO
         7DUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s+ZAQzVfVhWeLceyKWn+FK+VYYwausDp5pofcIxzenc=;
        b=VRiSNbUBz0iY36KAwpbFggen368WqhBUJqs2QibGRVHM3uOk5Z6ruoGLSCMH1FZpQn
         O/d/M29YKwFYMWZKZ3nJEnOOHEgKRH6hAs/nEak3M+6I7NaKapKZi3uYJGZ9EGR1dBPX
         Dcn/A1j2rgjW2L3FoU7QNACcVdtCCC/n2wvfMB0WmyJbTZMHMGsa5sLChSmns8VOkO3g
         GC/cy8m9M4Aal7TdXXbpjXblsJhGPhMZhanYy5RoXSrZ+wO+6BBtPc9mb7ys06ekq/nz
         YzxBYtdDGkdtTkHs06v0KvL6RWir1aZVSecjby/k2pplNQYrRRggj2KBMdj1polluc2J
         Qvzg==
X-Gm-Message-State: AOUpUlGJcyh2I7+WntiL7sEiu4NYb3GR97CnoJ/sBpmTP43rlOgvaq2H
        9MPP8v3Y3hXf9I7yoDIWRZtsWxB2lfa4jU4u7ItvUA==
X-Google-Smtp-Source: AA+uWPxIQKC1fD4/GS3B9eOEDeHHBnT6YKIYdZrX/UG+F1LIWhdyhet4889Z6NzO2K/E1f+NzQeVjjrCZ8mkqOSzgBc=
X-Received: by 2002:a63:190e:: with SMTP id z14-v6mr8188048pgl.302.1534796739959;
 Mon, 20 Aug 2018 13:25:39 -0700 (PDT)
MIME-Version: 1.0
References: <da5620dc7a2b9d33f2a0dd7f4dc3afdab5a66f26.1534795606.git.joe@perches.com>
In-Reply-To: <da5620dc7a2b9d33f2a0dd7f4dc3afdab5a66f26.1534795606.git.joe@perches.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 20 Aug 2018 13:25:28 -0700
Message-ID: <CAKwvOdmaABwZhZ0YCPBhuiq+hMrSF=Ad_sOD04d8+ab5QLLXhA@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum required gcc version to 4.6
To:     joe@perches.com
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        dave.hansen@intel.com, efault@gmx.de,
        Guenter Roeck <linux@roeck-us.net>, riel@surriel.com,
        Kees Cook <keescook@chromium.org>, corbet@lwn.net,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Aug 20, 2018 at 1:15 PM Joe Perches <joe@perches.com> wrote:
>
> Various architectures fail to build properly with older versions
> of the gcc compiler.

Just curious if certain arch's require older versions of gcc?  Surely
that's not the case, but hopefully this patch wont surprise anyone.

It might be worthwhile to see where else in the kernel has
/gcc\s+[0-9]/g as I'm sure there's other old-gcc workarounds that can
go too (in follow up patches).

Thanks for sending.  This helps us ship newer compiler features for
which older compiler support is difficult/impossible.
-- 
Thanks,
~Nick Desaulniers
