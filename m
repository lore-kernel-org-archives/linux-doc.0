Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CA4927D08D
	for <lwn-linux-doc@archive.lwn.net>; Wed,  3 Oct 2018 16:47:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726862AbeJCXgY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 3 Oct 2018 19:36:24 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45515 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726912AbeJCXgY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Oct 2018 19:36:24 -0400
Received: by mail-ot1-f65.google.com with SMTP id u22so6190687ota.12
        for <linux-doc@vger.kernel.org>; Wed, 03 Oct 2018 09:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZCuVAz2UKWZbDQlj+DhBSHMUDTBtXWc3KclL+d5oEp8=;
        b=tWrNoA1AaCshsdvkFKfX3FkMtSN5/EZQqhuCMAnLR22viFAgUpiPNtaAiBvYNTVXoR
         chcjGN1214MorPx4YPkrsbZPCjP2niR1StJp8qmh41wxc3f3IVAwVHw1EobqJAU0pisZ
         NhZjIr5QMUMMZSw3bAe/QTPo4RHY9b0nn1QOl7+0bT6BPaTEsu2uRh+xRqI4wiNoweAk
         pUD0NCZBNDZUr0tp2W4NkJi0uX5A+hRgtZJE3pjMz1QT8lm9U9NrNC4K/HfNFkLscC47
         iw8llBF8lkPbw+/7Dqf28uUFDK+gIylLalusP78BAsJYgWzxzLR0Kysqbw+3fbl/hzzM
         PigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZCuVAz2UKWZbDQlj+DhBSHMUDTBtXWc3KclL+d5oEp8=;
        b=VbkBSGt4SI5A3Z1pq0CS1NuKQZ6lrD6lIQoUgtMTrmper55GusMRim8CGaASWG4jNU
         CXrNHmhP1SvnQVy6vUltFl8sYj8j2TjGg7i5umL/Z2BwEi8Af8eIs6alSTAA/VEWoLg4
         VzOGO4NxM4r+/Rj21wBQbb77zV0jU7BXty6qIXyCnQezIVoOafrjbxydHtYm0v4nW2pr
         mA9ycbf6JD8juMkTb9z4Tq0DE+o9eHEbte9cB54RkGMbwzTTRZnUZ3EduOsPl4Fjh+Du
         BieH8qHoFpoJaFT9flxdJrfrkuCqblpNxPd4IfUFz3NHu3mxY1iqo1kK2OhP83kxiT22
         BzYA==
X-Gm-Message-State: ABuFfogYfMLfjGsHvF3eRlgrdC16PvOCHKEhOLBF+wWP9VGHziPteZx6
        9bBL7RoTk5iOmCIhd7FCw6XdrfpmW3QRRvRn/o8I+w==
X-Google-Smtp-Source: ACcGV62Z7JHuTt9RUhnYpZ2g8IWBg+GokgVag1bb5ESFY4ThDoVCZ81vJGOvqGBtz3bvVcJkRQmnUYl1pvas076eNds=
X-Received: by 2002:a9d:5733:: with SMTP id p48mr1250542oth.292.1538585232481;
 Wed, 03 Oct 2018 09:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <20180921150351.20898-1-yu-cheng.yu@intel.com> <20180921150351.20898-21-yu-cheng.yu@intel.com>
In-Reply-To: <20180921150351.20898-21-yu-cheng.yu@intel.com>
From:   Jann Horn <jannh@google.com>
Date:   Wed, 3 Oct 2018 18:46:46 +0200
Message-ID: <CAG48ez32qC1wfXGROpXxdxD84Ktj6QXNAC=Y0A6TQu=mHF-ekQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 20/27] x86/cet/shstk: Signal handling for shadow stack
To:     yu-cheng.yu@intel.com
Cc:     "the arch/x86 maintainers" <x86@kernel.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@amacapital.net>,
        Balbir Singh <bsingharora@gmail.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Florian Weimer <fweimer@redhat.com>, hjl.tools@gmail.com,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>, rdunlap@infradead.org,
        ravi.v.shankar@intel.com, vedvyas.shanbhogue@intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 21, 2018 at 5:09 PM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
> When setting up a signal, the kernel creates a shadow stack
> restore token at the current SHSTK address and then stores the
> token's address in the signal frame, right after the FPU state.
> Before restoring a signal, the kernel verifies and then uses the
> restore token to set the SHSTK pointer.
[...]
> +#ifdef CONFIG_X86_64
> +static int copy_ext_from_user(struct sc_ext *ext, void __user *fpu)
> +{
> +       void __user *p;
> +
> +       if (!fpu)
> +               return -EINVAL;
> +
> +       p = fpu + fpu_user_xstate_size + FP_XSTATE_MAGIC2_SIZE;
> +       p = (void __user *)ALIGN((unsigned long)p, 8);
> +
> +       if (!access_ok(VERIFY_READ, p, sizeof(*ext)))
> +               return -EFAULT;
> +
> +       if (__copy_from_user(ext, p, sizeof(*ext)))
> +               return -EFAULT;

Why do you first manually call access_ok(), then call
__copy_from_user() with the same size? Just use "if
(copy_from_user(ext, p, sizeof(*ext)))" (without underscores) and get
rid of the access_ok().

> +       if (ext->total_size != sizeof(*ext))
> +               return -EINVAL;
> +       return 0;
> +}
> +
> +static int copy_ext_to_user(void __user *fpu, struct sc_ext *ext)
> +{
> +       void __user *p;
> +
> +       if (!fpu)
> +               return -EINVAL;
> +
> +       if (ext->total_size != sizeof(*ext))
> +               return -EINVAL;
> +
> +       p = fpu + fpu_user_xstate_size + FP_XSTATE_MAGIC2_SIZE;
> +       p = (void __user *)ALIGN((unsigned long)p, 8);
> +
> +       if (!access_ok(VERIFY_WRITE, p, sizeof(*ext)))
> +               return -EFAULT;
> +
> +       if (__copy_to_user(p, ext, sizeof(*ext)))
> +               return -EFAULT;

Same as above.

> +       return 0;
> +}
