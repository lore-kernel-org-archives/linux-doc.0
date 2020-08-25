Return-Path: <SRS0=V56H=CD=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAED9C433DF
	for <linux-doc@archiver.kernel.org>; Tue, 25 Aug 2020 00:36:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB957206EB
	for <linux-doc@archiver.kernel.org>; Tue, 25 Aug 2020 00:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598315777;
	bh=rGvi9MthtY3Zm6e8LjprXXopxA9y4zSlrOEw0NKum+4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=zBOJhHpPHIHDEe/wTTW1iIuxTIPvePwVtMj+6E2jGMtLhYVYepq4aGxNBt8Xb/Zx+
	 9Kd18ORJ7QkjnHK5RtNemxk9oOn2N+Bb8knrPEg4oS/Pc5wo4J7DmneqO8W4gtyerQ
	 cS5nKROHWL8NIe9VsmJFFHjJRMoBkB6OS3WY/hLs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbgHYAgQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 24 Aug 2020 20:36:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:47770 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727846AbgHYAgO (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 24 Aug 2020 20:36:14 -0400
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 33FBF22B43
        for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2020 00:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598315773;
        bh=rGvi9MthtY3Zm6e8LjprXXopxA9y4zSlrOEw0NKum+4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=B6Wx3Ta6WhVMQKKzGweK4EThUhgXM6QWLkS94KXmCxlmle+2iB0Dv09wyhNA8aRbN
         dsQ53FpEURe72/ch7xsfDwPS91aaJSasia0EbG688D9gOu1Hx5x7lX3qZHeTOZW6D8
         4wSVwPTFbnEboYBj+ztOR0WlttNyXQD1wqIUFjiw=
Received: by mail-wr1-f52.google.com with SMTP id d16so10946985wrq.9
        for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2020 17:36:13 -0700 (PDT)
X-Gm-Message-State: AOAM533WI17GvVzE4OfrLV2kXTgSRH5e1HtD/lpPD7HvS/Ah8F+wfbEU
        lkGuTnYb9PvHW2loPwItt/odNMXSVmiQmsLHTpvksw==
X-Google-Smtp-Source: ABdhPJycfFTryYvqMmogFZ4f07fwtEQYtW9RheeU7iIaKlRW/yfrBCrffVk+TftqJezyfeIoiX/ikLMCzBNMBUeOh9k=
X-Received: by 2002:adf:9283:: with SMTP id 3mr7902213wrn.70.1598315771751;
 Mon, 24 Aug 2020 17:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200825002540.3351-1-yu-cheng.yu@intel.com> <20200825002540.3351-26-yu-cheng.yu@intel.com>
In-Reply-To: <20200825002540.3351-26-yu-cheng.yu@intel.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Mon, 24 Aug 2020 17:36:00 -0700
X-Gmail-Original-Message-ID: <CALCETrVpLnZGfWWLpJO+aZ9aBbx5KGaCskejXiCXF1GtsFFoPg@mail.gmail.com>
Message-ID: <CALCETrVpLnZGfWWLpJO+aZ9aBbx5KGaCskejXiCXF1GtsFFoPg@mail.gmail.com>
Subject: Re: [PATCH v11 25/25] x86/cet/shstk: Add arch_prctl functions for
 shadow stack
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
        Andy Lutomirski <luto@kernel.org>,
        Balbir Singh <bsingharora@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Weijiang Yang <weijiang.yang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Aug 24, 2020 at 5:30 PM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:

> arch_prctl(ARCH_X86_CET_MMAP_SHSTK, u64 *args)
>     Allocate a new shadow stack.
>
>     The parameter 'args' is a pointer to a user buffer.
>
>     *args = desired size
>     *(args + 1) = MAP_32BIT or MAP_POPULATE
>
>     On returning, *args is the allocated shadow stack address.

This is hideous.  Would this be better as a new syscall?

--Andy
