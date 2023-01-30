Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C14D8C54EAA
	for <linux-doc@archiver.kernel.org>; Mon, 30 Jan 2023 20:16:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbjA3UQJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Jan 2023 15:16:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjA3UQJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Jan 2023 15:16:09 -0500
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 363F934C27
        for <linux-doc@vger.kernel.org>; Mon, 30 Jan 2023 12:16:07 -0800 (PST)
Received: by mail-il1-x131.google.com with SMTP id l7so3771488ilf.0
        for <linux-doc@vger.kernel.org>; Mon, 30 Jan 2023 12:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4eXu+jCcimRhhwZE4jUuYTcHZvv/qVsf+cVU9nJDDVE=;
        b=IbarBvZp/PTHo0ndaS0Luk+j8lTgZ36nfRwHV3I83r12yZDaE6lLHgbnjVV0Bsbden
         /9tDgbls8LztVBI4ZLUU7Ktw5DN/sGwy1VrnvUNX8wyIP6kH+mTZuGaeZoWhzTbc0TIY
         pKg/NDK1yPXVmYZbpnNdFIioZYQeUOsbjRT7JUkEDLV+eXiZZ0UbfVk73s6hF0ERd/8Z
         6SrIFeMjWnQ05T+SHTF7DeMZT9Q7+TY4h+9mnJwnNGBlKpKYiceTNtsswX3zgeAUhVoc
         X6oHJAKt7+sg7qMnLdF3R6W9MC2GJFnLqvc3lb0ZDamdIvoQIw1sdBz3/gTOQozGL2z2
         B22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4eXu+jCcimRhhwZE4jUuYTcHZvv/qVsf+cVU9nJDDVE=;
        b=6YWp+1Zse4+naQe5UrGPU+BLA2c1Y9IsLuqzJT8NjM7ls8b4OpTFPFy6vz41aXTDDZ
         6l9wX0irFus4Ggb2OlECpUiUja0M8laVp8QepW3KNsCU9el5doHvJ7nFnC8x97LEGOlB
         FvDD3bP3bYG12r65yBEc56SClieJOj/Y4HQ6aF1ZA0c8L+9MZl7+xLhtRaQKo1i2oEFl
         Xm3Qbn1WZfahjkCrWPu2vYa4rX8rN9pLYfFV19PGMdmwm6siMGd7p/KE6hxOUvgdIscq
         gsQ/8E/CSKnl0mfHuXFVX9pPL1dUXAoogouFeMWUY3dfTveud4KN7KbWHS06vmsVMwnn
         4o8w==
X-Gm-Message-State: AO0yUKXEDGC7v/UCRq1lvtoeD7NdUmwe7xTaoSgqeKnaY84+vatpI7WQ
        9sC/r0o9GNlC/5/n64bP9ES08saEUnG/u7zhy66m8Q==
X-Google-Smtp-Source: AK7set8gBbFtRo8dKJFsa1xtqoX+VGuMj2YLv9v5HZyiXu157OnIhFVb0Ius/x+2MpHc6VOqfJ7Nwg0wYrPDNxL7HdU=
X-Received: by 2002:a92:2610:0:b0:310:a9aa:3b74 with SMTP id
 n16-20020a922610000000b00310a9aa3b74mr2838060ile.31.1675109766287; Mon, 30
 Jan 2023 12:16:06 -0800 (PST)
MIME-Version: 1.0
References: <20230128074918.1180523-1-davidgow@google.com>
In-Reply-To: <20230128074918.1180523-1-davidgow@google.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Mon, 30 Jan 2023 15:15:54 -0500
Message-ID: <CAFd5g47G23c-FuPjiy_NVsep2juvcwgWh-6bY7uuVmx+fZgFJA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kunit: Expose 'static stub' API to redirect functions
To:     David Gow <davidgow@google.com>
Cc:     Brendan Higgins <brendan.higgins@linux.dev>,
        Kees Cook <keescook@chromium.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Daniel Latypov <dlatypov@google.com>,
        Rae Moar <rmoar@google.com>,
        Sadiya Kazi <sadiyakazi@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joe Fradley <joefradley@google.com>,
        Steve Muckle <smuckle@google.com>,
        Jonathan Corbet <corbet@lwn.net>, kunit-dev@googlegroups.com,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jan 28, 2023 at 2:49 AM David Gow <davidgow@google.com> wrote:
>
> Add a simple way of redirecting calls to functions by including a
> special prologue in the "real" function which checks to see if the
> replacement function should be called (and, if so, calls it).
>
> To redirect calls to a function, make the first (non-declaration) line
> of the function:
>
>         KUNIT_STATIC_STUB_REDIRECT(function_name, [function arguments]);
>
> (This will compile away to nothing if KUnit is not enabled, otherwise it
> will check if a redirection is active, call the replacement function,
> and return. This check is protected by a static branch, so has very
> little overhead when there are no KUnit tests running.)
>
> Calls to the real function can be redirected to a replacement using:
>
>         kunit_activate_static_stub(test, real_fn, replacement_fn);
>
> The redirection will only affect calls made from within the kthread of
> the current test, and will be automatically disabled when the test
> completes. It can also be manually disabled with
> kunit_deactivate_static_stub().
>
> The 'example' KUnit test suite has a more complete example.
>
> Co-developed-by: Daniel Latypov <dlatypov@google.com>
> Signed-off-by: Daniel Latypov <dlatypov@google.com>
> Signed-off-by: David Gow <davidgow@google.com>
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

Still looks good overall to me, but I see one nit:

> ---
>
> This patch depends upon the 'hooks' implementation in
> https://lore.kernel.org/linux-kselftest/20230128071007.1134942-1-davidgow@google.com/
>
> Note that checkpatch.pl does warn about control flow in the
> KUNIT_STATIC_STUB_REDIRECT() macro. This is an intentional design choice
> (we think it makes the feature easier to use), though if there are
> strong objections, we can of course reconsider.
>
> Changes since v1:
> https://lore.kernel.org/all/20221208061841.2186447-2-davidgow@google.com/
> - Adapted to use the "hooks" mechanism
>   - See: https://lore.kernel.org/linux-kselftest/20230128071007.1134942-1-davidgow@google.com/
>   - Now works when KUnit itself is compiled as a module (CONFIG_KUNIT=m)
>
> Changes since RFC v2:
> https://lore.kernel.org/linux-kselftest/20220910212804.670622-2-davidgow@google.com/
> - Now uses the kunit_get_current_test() function, which uses the static
>   key to reduce overhead.
>   - Thanks Kees for the suggestion.
>   - Note that this does prevent redirections from working when
>     CONFIG_KUNIT=m -- this is a restriction of kunit_get_current_test()
>     which will be removed in a future patch.
> - Several tidy-ups to the inline documentation.
>
> Changes since RFC v1:
> https://lore.kernel.org/lkml/20220318021314.3225240-2-davidgow@google.com/
> - Use typecheck_fn() to fix typechecking in some cases (thanks Brendan)
>
> ---
>  include/kunit/static_stub.h    | 113 ++++++++++++++++++++++++++++++
>  include/kunit/test-bug.h       |   1 +
>  lib/kunit/Makefile             |   1 +
>  lib/kunit/hooks-impl.h         |   2 +
>  lib/kunit/kunit-example-test.c |  38 ++++++++++
>  lib/kunit/static_stub.c        | 123 +++++++++++++++++++++++++++++++++
>  6 files changed, 278 insertions(+)
>  create mode 100644 include/kunit/static_stub.h
>  create mode 100644 lib/kunit/static_stub.c
>
> diff --git a/include/kunit/static_stub.h b/include/kunit/static_stub.h
> new file mode 100644
> index 000000000000..047b68d65f1a
> --- /dev/null
> +++ b/include/kunit/static_stub.h
> @@ -0,0 +1,113 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * KUnit function redirection (static stubbing) API.
> + *
> + * Copyright (C) 2022, Google LLC.
> + * Author: David Gow <davidgow@google.com>
> + */
> +#ifndef _KUNIT_STATIC_STUB_H
> +#define _KUNIT_STATIC_STUB_H
> +
> +#if !IS_ENABLED(CONFIG_KUNIT)
> +
> +/* If CONFIG_KUNIT is not enabled, these stubs quietly disappear. */
> +#define KUNIT_TRIGGER_STATIC_STUB(real_fn_name, args...) do {} while (0)
> +
> +#else
> +
> +#include <kunit/test.h>
> +#include <kunit/test-bug.h>
> +
> +#include <linux/compiler.h> /* for {un,}likely() */
> +#include <linux/sched.h> /* for task_struct */
> +
> +
> +/**
> + * KUNIT_STATIC_STUB_REDIRECT() - call a replacement 'static stub' if one exists
> + * @real_fn_name: The name of this function (as an identifier, not a string)
> + * @args: All of the arguments passed to this function
> + *
> + * This is a function prologue which is used to allow calls to the current
> + * function to be redirected by a KUnit test. KUnit tests can call
> + * kunit_activate_static_stub() to pass a replacement function in. The
> + * replacement function will be called by KUNIT_TRIGGER_STATIC_STUB(), which
> + * will then return from the function. If the caller is not in a KUnit context,
> + * the function will continue execution as normal.
> + *
> + * Example:
> + *
> + * .. code-block:: c
> + *
> + *     int real_func(int n)
> + *     {
> + *             KUNIT_STATIC_STUB_REDIRECT(real_func, n);
> + *             return 0;
> + *     }
> + *
> + *     void replacement_func(int n)

nit: Pretty sure the return type should be `int`

> + *     {
> + *             return 42;
> + *     }
[...]
