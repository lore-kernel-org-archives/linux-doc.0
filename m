Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_DKIMWL_WL_MED,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D7E3E7D2EE
	for <lwn-linux-doc@archive.lwn.net>; Thu, 30 Aug 2018 16:11:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbeH3UNh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 30 Aug 2018 16:13:37 -0400
Received: from mail-oi0-f65.google.com ([209.85.218.65]:33348 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727208AbeH3UNh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Aug 2018 16:13:37 -0400
Received: by mail-oi0-f65.google.com with SMTP id 8-v6so16435938oip.0
        for <linux-doc@vger.kernel.org>; Thu, 30 Aug 2018 09:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rEnUc164i2YQATkUF5pJh5O66ueEUTaHFCxCD73D8Jg=;
        b=J8ojznWClrn8oTylP5Txwv9bjszqQ8Knvl0cpXwgslSTwBLS2mPofSc8kgD8f5/OC/
         Kl4IyKNNbIp9KXPhFZWt3QWtLRPjZ797GkL82J7IeszItAr68mJYnmush16u6/bdb1kS
         C9uGBRCHt8FahA/8xs9KC6dL9eEMDOjZ7Q84qqEaIzZLYtZ6tLqzsTISgDLLmQ3aNBoq
         oN5alxD/0ADmuqyt/1u10JpZI0P//MLOXlhTuXCIuulk7p/tXcNTbUKXVVPPYgRD+D01
         X+cIRjyRbntk5DSGPRy6QnBoIWJqOHJRSOYQ7yYlDMokHXdUw7zEjfs34QtClT1xbJAQ
         6bWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rEnUc164i2YQATkUF5pJh5O66ueEUTaHFCxCD73D8Jg=;
        b=i4TDwSMyYD3q0gF0OIuIVo1A2ZfRskKDME1ltYvDBvSycHmJGPv9RyIBfvq8kXW9X8
         A2v5Jm9WWnQFUQ0hBs1xq/gfQl4Ori0x9urLBtStVSwwXY1LvuZd/QlVZva4DHPhCUft
         +OLv32GRY2PmE10341ETtk7TJBxc2BLAh85HAl6S8tg/jt75bPiSlKceabdM3HH1yEN/
         KO4aqDc0dSDGbCTWWq1j9b5+5uaMaldDNO0Md7sGppVTlpJNURS5wzv/B6cRK7MBxVI9
         eZIC4zojGcWEdpGrU4/2Kllcl+tqS+NHKxR5WmrtT7bws8OPF4VII2y/gWkFpt4RnxXX
         6N2Q==
X-Gm-Message-State: APzg51CWEweZppIdiq+iR0JXIXcjV0WU+w8xh7z7a+/aLqWDDnpPRAtV
        7yl7qVrLIP1vySqfXvIko0Ic9IWsDUMTWzrhuDA9+A==
X-Google-Smtp-Source: ANB0VdZbACM6vTzySATDxA1muRGssX6eJhuzY9/ax1ixwNqUdDwvp/ouITAoJp4R43xKg+1iIESKkK21Yl19OB97JCI=
X-Received: by 2002:aca:c585:: with SMTP id v127-v6mr3280022oif.348.1535645444133;
 Thu, 30 Aug 2018 09:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <20180830143904.3168-1-yu-cheng.yu@intel.com> <20180830143904.3168-19-yu-cheng.yu@intel.com>
In-Reply-To: <20180830143904.3168-19-yu-cheng.yu@intel.com>
From:   Jann Horn <jannh@google.com>
Date:   Thu, 30 Aug 2018 18:10:17 +0200
Message-ID: <CAG48ez0d8+E_O-9u6ZHZ6dQO55Ui2ydV_kia-EEhyYeB_w4r2g@mail.gmail.com>
Subject: Re: [RFC PATCH v3 18/24] x86/cet/shstk: User-mode shadow stack support
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
        Jonathan Corbet <corbet@lwn.net>, keescook@chromiun.org,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        ravi.v.shankar@intel.com, vedvyas.shanbhogue@intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 30, 2018 at 4:44 PM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
>
> This patch adds basic shadow stack enabling/disabling routines.
> A task's shadow stack is allocated from memory with VM_SHSTK
> flag set and read-only protection.  The shadow stack is
> allocated to a fixed size of RLIMIT_STACK.
>
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
[...]
> +static int set_shstk_ptr(unsigned long addr)
> +{
> +       u64 r;
> +
> +       if (!cpu_feature_enabled(X86_FEATURE_SHSTK))
> +               return -1;
> +
> +       if ((addr >= TASK_SIZE_MAX) || (!IS_ALIGNED(addr, 4)))
> +               return -1;
> +
> +       rdmsrl(MSR_IA32_U_CET, r);
> +       wrmsrl(MSR_IA32_PL3_SSP, addr);
> +       wrmsrl(MSR_IA32_U_CET, r | MSR_IA32_CET_SHSTK_EN);
> +       return 0;
> +}

Here's a really stupid question: Where is the logic for switching
those MSRs on task switch? MSR_IA32_PL3_SSP contains a userspace
pointer, so it has to be switched on task switch, right? I'm sure I'm
missing something obvious, but grepping for places that set
MSR_IA32_PL3_SSP to nonzero values through the entire patchset, I only
see set_shstk_ptr(), which is called from:

 - cet_setup_shstk() (called from arch_setup_features(), which is
called from load_elf_binary())
 - cet_restore_signal() (called on signal handler return)
 - cet_setup_signal() (called from signal handling code)
