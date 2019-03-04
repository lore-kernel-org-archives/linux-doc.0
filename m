Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 78DB87D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon,  4 Mar 2019 20:49:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726311AbfCDUtU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 4 Mar 2019 15:49:20 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:36885 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726172AbfCDUtT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Mar 2019 15:49:19 -0500
Received: by mail-vk1-f196.google.com with SMTP id 17so1446547vkf.4
        for <linux-doc@vger.kernel.org>; Mon, 04 Mar 2019 12:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xlA2vhEQNtJ9ZUUCs09s3p9OCqFDXzj08du8Thhwq+I=;
        b=ghbO/n9kaY3XxPRCcdzSw6tjmmnPAMKdOdNhhi1TN9CA7b0ret9kubbeum48vfqG7E
         uiSqfeDiaxiRzdGt+nZ6nAadWd9G9roTK1kx4epluwgtNtzuN1jmzMss8eIJ90y+bYjS
         z/U2/ykwcySSRK5envOSDOI29HWHb5akaIHXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xlA2vhEQNtJ9ZUUCs09s3p9OCqFDXzj08du8Thhwq+I=;
        b=fXEogVey8l1B66wLvSB9kDLDkHl2XFS8aEkVynrmDpPjskqY/ijt2qYlyq5oCLo8wX
         M54fz+3/ETzr1inyDrrT9GdyM4V3BQJdC6h0lBStG9ap64seXTe3hFuaLzHMwic1nFD2
         zNkunSKTDo3dl7LEg2Sxu5UgokndmfX/5k5vaia08HGhTtQjgLJJPvf7YpCpUMYgSeRa
         DlQkucH2Heo4onOdO3IFxnjUpPBNO/FIMkuck+m0pvWEsFvkG3zziamatCVQHBuuJmRI
         7AWYNMBmYsX0YqVjdM5ClRMM/lxqc+m52Ykiw9ON0GQJYIXZdwvr0ujrZOtzdmuaVobF
         epSQ==
X-Gm-Message-State: APjAAAU9jg+fdHsKIOgQmFv0pemQ0QsO8HIR5/9hzA3SgyTiZRelRooQ
        d05JgtuRG+i9u2bzdvKTxcaD6qj7kR0=
X-Google-Smtp-Source: APXvYqyOJEGCCoX0eES/sZpPbTChvMFLZNb9RMLk0B2B/xZ0pfw0Obhmk5KHWRCkP9dfei0d+1e7qA==
X-Received: by 2002:a1f:1886:: with SMTP id 128mr8154088vky.31.1551732557790;
        Mon, 04 Mar 2019 12:49:17 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id j186sm1516536vsd.21.2019.03.04.12.49.16
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Mar 2019 12:49:17 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id u1so5665517uae.12
        for <linux-doc@vger.kernel.org>; Mon, 04 Mar 2019 12:49:16 -0800 (PST)
X-Received: by 2002:ab0:4a8d:: with SMTP id s13mr661410uae.122.1551732556514;
 Mon, 04 Mar 2019 12:49:16 -0800 (PST)
MIME-Version: 1.0
References: <20190304203152.8236-1-jwilk@jwilk.net>
In-Reply-To: <20190304203152.8236-1-jwilk@jwilk.net>
From:   Kees Cook <keescook@chromium.org>
Date:   Mon, 4 Mar 2019 12:49:05 -0800
X-Gmail-Original-Message-ID: <CAGXu5j+1z7vOb6Xz5=b89a4B3iCU00DAEd0-FyK_J1rvLwpNcg@mail.gmail.com>
Message-ID: <CAGXu5j+1z7vOb6Xz5=b89a4B3iCU00DAEd0-FyK_J1rvLwpNcg@mail.gmail.com>
Subject: Re: [PATCH 1/2] Documentation: seccomp: fix reST markup
To:     Jakub Wilk <jwilk@jwilk.net>
Cc:     "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 4, 2019 at 12:32 PM Jakub Wilk <jwilk@jwilk.net> wrote:
>
> Signed-off-by: Jakub Wilk <jwilk@jwilk.net>

Hah, whoops. Thanks!

Acked-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  Documentation/userspace-api/seccomp_filter.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/userspace-api/seccomp_filter.rst b/Documentation/userspace-api/seccomp_filter.rst
> index b1b846d8a094..0f09a63ea923 100644
> --- a/Documentation/userspace-api/seccomp_filter.rst
> +++ b/Documentation/userspace-api/seccomp_filter.rst
> @@ -133,7 +133,7 @@ In precedence order, they are:
>         call.  If there is no tracer present, ``-ENOSYS`` is returned to
>         userland and the system call is not executed.
>
> -       A tracer will be notified if it requests ``PTRACE_O_TRACESECCOM``P
> +       A tracer will be notified if it requests ``PTRACE_O_TRACESECCOMP``
>         using ``ptrace(PTRACE_SETOPTIONS)``.  The tracer will be notified
>         of a ``PTRACE_EVENT_SECCOMP`` and the ``SECCOMP_RET_DATA`` portion of
>         the BPF program return value will be available to the tracer
> --
> 2.20.1
>


-- 
Kees Cook
