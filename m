Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 105887D089
	for <lwn-linux-doc@archive.lwn.net>; Thu,  6 Dec 2018 01:11:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728799AbeLFBLF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Dec 2018 20:11:05 -0500
Received: from mail-yb1-f195.google.com ([209.85.219.195]:44529 "EHLO
        mail-yb1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728648AbeLFBLE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Dec 2018 20:11:04 -0500
Received: by mail-yb1-f195.google.com with SMTP id j145so4913738ybg.11
        for <linux-doc@vger.kernel.org>; Wed, 05 Dec 2018 17:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YMsFPOwp+HYuQfKFu9COzZPdWHtGKQJMtECRPLEDAaA=;
        b=iOFoDPQesDyogJo9GYnMT/IyfMDQgqUjVHWcy41ovY8oNDgtNmemTGH69m+iRtz4/G
         n4m/kY9MPmq3/J9ow86qmMllfTIvd3Ko8NrJnfyajL6nMtRw4q5ss1qqJmVFDouhKAIJ
         pdAStRLIaEwQwBhmXubejRWGccZwkQfgwOXEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YMsFPOwp+HYuQfKFu9COzZPdWHtGKQJMtECRPLEDAaA=;
        b=B4zXyt4PNUbmDn0p+5ZwsPaRVONDd3DvuWOcr+4iyF8UyTjFe2Dw04HA3fqjRgCUyZ
         jlMKwzToJ0X06KNiXDYUZnIx6Bj9mtgSX5cq+CjZvHL8PqbR9KfaZcmS/OJby+BlnBfs
         cjShTHI9/Sk9kl/7R4vZqtmo/vdL62vS8zicbioDnZaz+S+f/hOLqVbszy1xHkSODXZ+
         ALIA1/PFxDm5S46cihycfimrpexSuVDnzUGnZsOQeYR9AKhQFEy4y8qzHw/JyUPCA62n
         ExzvNT9IXeySamvWw392s4M6sgdpdf2QtgQI0qv8hrq+QK6mRfAV09STnNBBFwqqyh4J
         rnNA==
X-Gm-Message-State: AA+aEWZJR635cwfehCeU9M+bzyG/lsG2iUTH2yC9CtHIHLdJxTdUdp6Z
        SuLFjGcbwJerLmKRPZvOo5VVuNq+4qk=
X-Google-Smtp-Source: AFSGD/XPgk6cvVuTaDUsHZ/Ewc3PhPSN5lNrcmRmgwTtWkt0HuX4vdekczKG+3VwNQSoSJ33jDeDFA==
X-Received: by 2002:a0d:ea8e:: with SMTP id t136mr27267100ywe.376.1544058662544;
        Wed, 05 Dec 2018 17:11:02 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id u2sm8129284ywe.84.2018.12.05.17.11.00
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Dec 2018 17:11:01 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id f125so5084014ybc.0
        for <linux-doc@vger.kernel.org>; Wed, 05 Dec 2018 17:11:00 -0800 (PST)
X-Received: by 2002:a81:98e:: with SMTP id 136mr26259370ywj.47.1544058660007;
 Wed, 05 Dec 2018 17:11:00 -0800 (PST)
MIME-Version: 1.0
References: <feac7efa-df6f-cca1-e321-28d220bf0411@linux.intel.com> <b1a4fa08-482d-0fcc-c798-efb9a9894a47@linux.intel.com>
In-Reply-To: <b1a4fa08-482d-0fcc-c798-efb9a9894a47@linux.intel.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Wed, 5 Dec 2018 17:10:48 -0800
X-Gmail-Original-Message-ID: <CAGXu5jJ_CyE5A2VUSyyi-uj4webfZM9ZOACp523p5xFhv1KCAQ@mail.gmail.com>
Message-ID: <CAGXu5jJ_CyE5A2VUSyyi-uj4webfZM9ZOACp523p5xFhv1KCAQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] Documentation/admin-guide: introduce
 perf-security.rst file
To:     Alexey Budankov <alexey.budankov@linux.intel.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jann Horn <jannh@google.com>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Andi Kleen <ak@linux.intel.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        LKML <linux-kernel@vger.kernel.org>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 27, 2018 at 12:15 AM Alexey Budankov
<alexey.budankov@linux.intel.com> wrote:
>
>
> Implement initial version of perf-security.rst documentation file
> covering security concerns of perf_event_paranoid settings.
>
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Alexey Budankov <alexey.budankov@linux.intel.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
> Changes in v4:
> - added docs for perf_event related capabilities
> Changes in v3:
> - toning down of the markup for "scope, access and resource"
> - adding definite article for "Linux implementation"
> Changes in v2:
> - reverted patches order in the set to avoid CI issue
> - replaced old PCL referencing by PE (Perf Events)
> - skipped >=3 setting documentation at the moment
> ---
>  Documentation/admin-guide/perf-security.rst | 97 +++++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/admin-guide/perf-security.rst
>
> diff --git a/Documentation/admin-guide/perf-security.rst b/Documentation/admin-guide/perf-security.rst
> new file mode 100644
> index 000000000000..f73ebfe9bfe2
> --- /dev/null
> +++ b/Documentation/admin-guide/perf-security.rst
> @@ -0,0 +1,97 @@
> +.. _perf_security:
> +
> +Perf Events and tool security
> +=============================
> +
> +Overview
> +--------
> +
> +Usage of Performance Counters for Linux (perf_events) [1]_ , [2]_ , [3]_ can
> +impose a considerable risk of leaking sensitive data accessed by monitored
> +processes. The data leakage is possible both in scenarios of direct usage of
> +perf_events system call API [2]_ and over data files generated by Perf tool user
> +mode utility (Perf) [3]_ , [4]_ . The risk depends on the nature of data that
> +perf_events performance monitoring units (PMU) [2]_ collect and expose for
> +performance analysis. Having that said perf_events/Perf performance monitoring
> +is the subject for security access control management [5]_ .
> +
> +perf_events/Perf access control
> +-------------------------------
> +
> +To perform security checks, the Linux implementation splits processes into two
> +categories [6]_ : a) privileged processes (whose effective user ID is 0, referred
> +to as superuser or root), and b) unprivileged processes (whose effective UID is
> +nonzero). Privileged processes bypass all kernel security permission checks so
> +perf_events performance monitoring is fully available to privileged processes
> +without access, scope and resource restrictions.
> +
> +Unprivileged processes are subject to a full security permission check based on
> +the process's credentials [5]_ (usually: effective UID, effective GID, and
> +supplementary group list).
> +
> +Linux divides the privileges traditionally associated with superuser into
> +distinct units, known as capabilities [6]_ , which can be independently enabled
> +and disabled on per-thread basis for processes and files of unprivileged users.
> +
> +Unprivileged processes with enabled CAP_SYS_ADMIN capability are treated as
> +privileged processes with respect to perf_events performance monitoring and
> +bypass *scope* permissions checks in the kernel.
> +
> +Unprivileged processes using perf_events system call API is also subject for
> +PTRACE_MODE_READ_REALCREDS ptrace access mode check [7]_ , whose outcome
> +determines whether monitoring is permitted. So unprivileged processes provided
> +with CAP_SYS_PTRACE capability are effectively permitted to pass the check.
> +
> +Other capabilities being granted to unprivileged processes can effectively
> +enable capturing of additional data required for later performance analysis of
> +monitored processes or a system. For example, CAP_SYSLOG capability permits
> +reading kernel space memory addresses from /proc/kallsyms file.
> +
> +perf_events/Perf unprivileged users
> +-----------------------------------
> +
> +perf_events/Perf *scope* and *access* control for unprivileged processes is
> +governed by perf_event_paranoid [2]_ setting:
> +
> +-1:
> +     Impose no *scope* and *access* restrictions on using perf_events performance
> +     monitoring. Per-user per-cpu perf_event_mlock_kb [2]_ locking limit is
> +     ignored when allocating memory buffers for storing performance data.
> +     This is the least secure mode since allowed monitored *scope* is
> +     maximized and no perf_events specific limits are imposed on *resources*
> +     allocated for performance monitoring.
> +
> +>=0:
> +     *scope* includes per-process and system wide performance monitoring
> +     but excludes raw tracepoints and ftrace function tracepoints monitoring.
> +     CPU and system events happened when executing either in user or
> +     in kernel space can be monitored and captured for later analysis.
> +     Per-user per-cpu perf_event_mlock_kb locking limit is imposed but
> +     ignored for unprivileged processes with CAP_IPC_LOCK [6]_ capability.
> +
> +>=1:
> +     *scope* includes per-process performance monitoring only and excludes
> +     system wide performance monitoring. CPU and system events happened when
> +     executing either in user or in kernel space can be monitored and
> +     captured for later analysis. Per-user per-cpu perf_event_mlock_kb
> +     locking limit is imposed but ignored for unprivileged processes with
> +     CAP_IPC_LOCK capability.
> +
> +>=2:
> +     *scope* includes per-process performance monitoring only. CPU and system
> +     events happened when executing in user space only can be monitored and
> +     captured for later analysis. Per-user per-cpu perf_event_mlock_kb
> +     locking limit is imposed but ignored for unprivileged processes with
> +     CAP_IPC_LOCK capability.
> +
> +Bibliography
> +------------
> +
> +.. [1] `<https://lwn.net/Articles/337493/>`_
> +.. [2] `<http://man7.org/linux/man-pages/man2/perf_event_open.2.html>`_
> +.. [3] `<http://web.eece.maine.edu/~vweaver/projects/perf_events/>`_
> +.. [4] `<https://perf.wiki.kernel.org/index.php/Main_Page>`_
> +.. [5] `<https://www.kernel.org/doc/html/latest/security/credentials.html>`_
> +.. [6] `<http://man7.org/linux/man-pages/man7/capabilities.7.html>`_
> +.. [7] `<http://man7.org/linux/man-pages/man2/ptrace.2.html>`_
> +



-- 
Kees Cook
