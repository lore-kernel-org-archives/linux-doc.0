Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 491227D8A9
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Nov 2018 22:24:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730580AbeKTIth (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Nov 2018 03:49:37 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51036 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730579AbeKTItc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Nov 2018 03:49:32 -0500
Received: by mail-wm1-f67.google.com with SMTP id 125so291466wmh.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Nov 2018 14:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fjVmBesFxy9LoDjDwVjkC5jCL2KHXfuj0e0USVLR32Q=;
        b=lkoUrEdXqJuRBZuNg8kB4eMPobAA0R7dxzEEswObbnCoOH2cxDrxCwhnk+Q0d34Y0q
         ZzSLivYJgIe/AQwpCDml0M5KIDFRbEvxyU7Ng2cu/O+kAkQR8DzhoYmZrWbYp1nbA4M1
         0L0H04O5RFz91jgFuN8u8vG8q/4NxUhFRIKpO17+K6KlHRGPRhoT+CaytKCPkiQpSKzN
         V7d2QeMnsm2BjgUFzZWwoUmnbpJ3jIDKJadbym6PxD/IYtphbB8N9do+QQe/3VYmjDOK
         zFc5VZ6d87C14G6KmwbxyNil4Zx6NZOmtC7doFNcifHfm9D0HH9MM0b29He0Vr8KSScD
         92og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fjVmBesFxy9LoDjDwVjkC5jCL2KHXfuj0e0USVLR32Q=;
        b=ev2FRlvvrnXmAOy2M9q40JwzMT7hUJrCbWH+NN1cXpDWxscjxZIjtjRH8p+datJs/E
         WSshQnczf+yIvMt39n9YXMtWkFDYuuuO0M3jOky9Dv1Sidt88FfRrJ5NWcpblF2oxmQL
         eDvuSpfl7dUWXEH0McEmE/peOKU4AtIULiDILcu8Pwdy1FuM8sNQgF6pC7BsS2Dxfu6g
         mW8ChrQOH205SJzjGjV4UFrU2xhpOhZtfUmygvbdvQjDk5ldC+82QHjrogCwWGrGYaH2
         j6rAYX3cDcuXuYS8J2n/UNSHi0NESaIyfaalOGGQFtdWB5MZRLDO1e51ZY+JYmm9hFix
         SOGg==
X-Gm-Message-State: AGRZ1gKhYed9d0cbdMqEwsrlodf9oWTqcChFD2lQNnlSbDOEmGWJd205
        wgYkxdf/4dtcR9NhspKwnGUnUTYvev1auIOjtAijAg==
X-Google-Smtp-Source: AJdET5eBygkBBRlIv0dpdk5OTuyErbSB3edwOdQNgboh9HTrU7hkOjWPoBxYu+Q26CnI2SY6Q/5kJ4fNZj1cuu76Z+4=
X-Received: by 2002:a1c:bb42:: with SMTP id l63-v6mr9085525wmf.32.1542666223412;
 Mon, 19 Nov 2018 14:23:43 -0800 (PST)
MIME-Version: 1.0
References: <20181119214934.6174-1-yu-cheng.yu@intel.com> <20181119214934.6174-10-yu-cheng.yu@intel.com>
In-Reply-To: <20181119214934.6174-10-yu-cheng.yu@intel.com>
From:   Andy Lutomirski <luto@amacapital.net>
Date:   Mon, 19 Nov 2018 14:23:32 -0800
Message-ID: <CALCETrUkXMHcwX8u+mGDD9Vj+iQE7CRMHL7jQnfAT6WXV8SBEQ@mail.gmail.com>
Subject: Re: [RFC PATCH v6 09/11] x86/vsyscall/32: Add ENDBR32 to vsyscall
 entry point
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Cc:     X86 ML <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Balbir Singh <bsingharora@gmail.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H. J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        "Shanbhogue, Vedvyas" <vedvyas.shanbhogue@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 19, 2018 at 1:55 PM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
>
> From: "H.J. Lu" <hjl.tools@gmail.com>
>
> Add ENDBR32 to vsyscall entry point.

$SUBJECT should be "x86/vdso/32: Add ENDBR32 to __kernel_vsyscall entry point".

--Andy
