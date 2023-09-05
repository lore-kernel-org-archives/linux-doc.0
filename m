Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF28CA0FFE
	for <linux-doc@archiver.kernel.org>; Tue,  5 Sep 2023 16:24:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350421AbjIEQYp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 5 Sep 2023 12:24:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354793AbjIEOYf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Sep 2023 10:24:35 -0400
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com [IPv6:2607:f8b0:4864:20::a31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 297EA189
        for <linux-doc@vger.kernel.org>; Tue,  5 Sep 2023 07:24:31 -0700 (PDT)
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-49032a0ff13so802598e0c.0
        for <linux-doc@vger.kernel.org>; Tue, 05 Sep 2023 07:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693923870; x=1694528670; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rtg0JV+CO28r/3TvA7CtNqhGLbhNAM/8Tnh4hPoGQnU=;
        b=cIqGumjZaNP51NtJny7H9KFfgslTyyGhR7EUsN9RApU76ixIAcs5j7OaZqR56bxSPI
         N5MamOmm4vbjRo4LJtYhPmYHajNAQD2XKiUs+xnvC/lIzzduxwjJ6L5QNCopZtoJows8
         J7lgSNT51xUrzJkB4L4lZc85wfWDIAx2PCFAkBwfYY81vFejhbqra7j8fBZ1PI0YV6iR
         B5g/PhdTfvMn6OxPTDMtuuCQ7IBpHIIJnIDETUVBnzb/pwx8gPT4YHgPiZNChvFUoSMg
         RUt+Yxn2CV/XUxXO1unRLjVW0089KKiQnigzI6AKCMXkqrzBNRujVQKcYxF64Ez8wD0N
         f6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693923870; x=1694528670;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rtg0JV+CO28r/3TvA7CtNqhGLbhNAM/8Tnh4hPoGQnU=;
        b=QHEGKiK1ntLywYSKnrD7DoaSn+0JwrJh44wFNDD8D0KU5eorvVXTavoSza8BuONq8m
         5gb9agOqsxX355u+X+VqXFLkE8SrNp6BVwvZilcJ1slt8bofxyCu4tkSJguCqsJygHyy
         8okTpWhdwD34jxMaQ2D3knP3CVvv01eZ70/nU7PrZJtOnm9g81xhQHUA784jkgTcJnpN
         bhjADCOWTn9w7vzpcwWss/tXqVjcgn4XdTjFtI6jTAlb/DJ+82uw05fgBacqUpbe86JE
         cCK6FaS804D2N6UhcOW/En3RTFKDqNF5SMQM2SjeTOIoa6nSAaVG1sRSJfjsMPeUKzYN
         NaPQ==
X-Gm-Message-State: AOJu0Yyq7qPNyGGepHEYwlV9fWMBBPHf+SDRNIjGRL7MRtc0mkurxAqs
        E45gEh5rP3+CdCzE0RGgdSMWuSnQ58QyhKAo6SCdwA==
X-Google-Smtp-Source: AGHT+IEWoDhzho+yngW0aCmJ/4l2W7ac9+woo+yuM0ML8a0qrzG+hU+odrwxXpclmNhFqwuK8T1fNq4QgGni4tFlVOA=
X-Received: by 2002:a1f:dfc2:0:b0:48d:3434:fe1a with SMTP id
 w185-20020a1fdfc2000000b0048d3434fe1amr11957524vkg.3.1693923870055; Tue, 05
 Sep 2023 07:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <x49y1i42j1z.fsf@segfault.boston.devel.redhat.com>
In-Reply-To: <x49y1i42j1z.fsf@segfault.boston.devel.redhat.com>
From:   Matteo Rizzo <matteorizzo@google.com>
Date:   Tue, 5 Sep 2023 16:24:17 +0200
Message-ID: <CAHKB1wKh3-9icDXK9_qorJr4DZ61Bt7mZznFT75R99a8LeMi_w@mail.gmail.com>
Subject: Re: [PATCH v5] io_uring: add a sysctl to disable io_uring system-wide
To:     io-uring@vger.kernel.org, axboe@kernel.dk, asml.silence@gmail.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net, akpm@linux-foundation.org, keescook@chromium.org,
        ribalda@chromium.org, rostedt@goodmis.org, jannh@google.com,
        chenhuacai@kernel.org, gpiccoli@igalia.com, ldufour@linux.ibm.com,
        evn@google.com, poprdi@google.com, jordyzomer@google.com,
        krisman@suse.de, andres@anarazel.de, Jeff Moyer <jmoyer@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi all,

Is there still anything that needs to be changed in this patch? As far as
I can tell all the remaining feedback has been addressed.

--
Matteo

On Mon, 21 Aug 2023 at 23:10, Jeff Moyer <jmoyer@redhat.com> wrote:
>
> From: Matteo Rizzo <matteorizzo@google.com>
>
> Introduce a new sysctl (io_uring_disabled) which can be either 0, 1, or
> 2. When 0 (the default), all processes are allowed to create io_uring
> instances, which is the current behavior.  When 1, io_uring creation is
> disabled (io_uring_setup() will fail with -EPERM) for unprivileged
> processes not in the kernel.io_uring_group group.  When 2, calls to
> io_uring_setup() fail with -EPERM regardless of privilege.
>
> Signed-off-by: Matteo Rizzo <matteorizzo@google.com>
> [JEM: modified to add io_uring_group]
> Signed-off-by: Jeff Moyer <jmoyer@redhat.com>
