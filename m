Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 50B407DE74
	for <lwn-linux-doc@archive.lwn.net>; Tue, 17 Apr 2018 20:35:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752709AbeDQUfa (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 17 Apr 2018 16:35:30 -0400
Received: from mail-wr0-f181.google.com ([209.85.128.181]:40581 "EHLO
        mail-wr0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752327AbeDQUf3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Apr 2018 16:35:29 -0400
Received: by mail-wr0-f181.google.com with SMTP id v60so35129146wrc.7
        for <linux-doc@vger.kernel.org>; Tue, 17 Apr 2018 13:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=bQ8mTzNsEjbdQAwiE/ZQPkZJ76/mrfHnqQZ2DnzkHW8=;
        b=Ot0NPo/w28NQJaAvgtevApcKh7fdhYEwheQMI7lSMffte38JQppSgJ9wisJTe8sEpI
         Y9uv+8HjRYrxqbeonem0DDyYlDj2oR1oDAcR0e6V4F6l7Dooeklfgd5/tRix4/FxzdgW
         +2nQRstyGxIKDTRwdJGp+45wb5xMH3IAgDVY7iyGrKvo7dxY4TvWxH8pq7x231lJMQfC
         pFekCFm4JcvjAuOk/vy9d0Jv7faPxvL74PtAYZYla/8MpU4zsMcMDY5IJ68cp+MCbqws
         9DiGOessD4xv4L4eGj8LlGUN1gt78/CEG+hSQq7ExrEUgOsTLNMCdaQsychIJ6whOq1w
         mZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=bQ8mTzNsEjbdQAwiE/ZQPkZJ76/mrfHnqQZ2DnzkHW8=;
        b=JF6FGkK3LqtA5gkkz/9vAshlRfTPznnhKY9VXI0GqK6DkwVwLDBbzF4YgHSLq7A/+n
         h+evWWkGMDCziVKj8VWTaEaSwotakhEeVWzIEEj0rJC9GvN/jnAXYHYmIRzP5j5zbmms
         WPBJJqRsD0kTFOIqyH8YzxEpudmTbFzyKs22gK5U2vN50bKHpnE6xdgDpSDClIlm/CQ4
         yG8oUxhfuZmE6eQKeDOLjf7uMc/iqgh3P15/YA/AX81dm0ITJmZD1MRZm7zhH2uOAdX7
         3B79yZKn78KX/X1Y1HJgYNoetY5XxKofaMX4qhI8EiwnzKowuF8FilhLIx+GsOeYkHM8
         Xg8w==
X-Gm-Message-State: ALQs6tDiy5hJ3GlcZQ5ABpWZ4tx9otoBORArOh6NO8wOHqQ2iSd85coN
        /nzV+mZ0Xwx3Vexem2KMOZ1FgJlpdVNPDol7XM/r1w==
X-Google-Smtp-Source: AIpwx4+91Sqpdr5fuiADDvLAoNEbgUnYdHmTUanNnhx7s6i9Fj3oycx/Gl9xa5/wCfS24QncByzvexINFSvG6LFA7KI=
X-Received: by 10.28.220.193 with SMTP id t184mr2105419wmg.138.1523997328133;
 Tue, 17 Apr 2018 13:35:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.58.209 with HTTP; Tue, 17 Apr 2018 13:35:27 -0700 (PDT)
In-Reply-To: <1523954340-8708-2-git-send-email-alankao@andestech.com>
References: <1523954340-8708-1-git-send-email-alankao@andestech.com> <1523954340-8708-2-git-send-email-alankao@andestech.com>
From:   Alex Solomatnikov <sols@sifive.com>
Date:   Tue, 17 Apr 2018 13:35:27 -0700
Message-ID: <CAJ2AOiP1-TnSRdrLxowQ7DqzxoBYENfbO1ZR5A0_kwzLJ0WztA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] perf: riscv: preliminary RISC-V support
To:     Alan Kao <alankao@andestech.com>
Cc:     Palmer Dabbelt <palmer@sifive.com>, Albert Ou <albert@sifive.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
        Greentime Hu <greentime@andestech.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 17, 2018 at 1:38 AM, Alan Kao <alankao@andestech.com> wrote:

> +static inline void write_counter(int idx, u64 value)
> +{
> +       /* currently not supported */
> +}

CSR writes can be emulated: https://github.com/riscv/riscv-pk/pull/98

Or at least write_counter() should have BUG() or WARN_ONCE() or
something like that.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
