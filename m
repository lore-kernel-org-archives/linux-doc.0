Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B0C6C04FF3
	for <linux-doc@archiver.kernel.org>; Fri, 21 May 2021 22:26:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6EC3E601FD
	for <linux-doc@archiver.kernel.org>; Fri, 21 May 2021 22:26:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbhEUW1t (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 May 2021 18:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbhEUW1t (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 May 2021 18:27:49 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BCABC061574
        for <linux-doc@vger.kernel.org>; Fri, 21 May 2021 15:26:25 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id a8so13548172ioa.12
        for <linux-doc@vger.kernel.org>; Fri, 21 May 2021 15:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/XkWG9p3vuThMnzF5+jHBK0yD8kKyiYj1CsPVcIZG2k=;
        b=NbxYYDnKLkoxAba68BqL9ZpD3lb2ScBJAQcY7Ca85CXetGoTwjl6vkFeBlTcN0YXWC
         cakB/2NABQKb7tNbJ2MKqdWXSJWkXwDc/wdJ8H7ra+iLPE55/qTgRwSHMrd07MrYUY75
         Kgl+MdH4q6qoh3P/D/eA9hwhI9aygyHy6++nMr5XZJFn3YbAGBkxb+ubQgrwI1dJD3OY
         9vRWqUhp82BhFUfhdlge9Gw7weWCJYd2vfR0waS4FJhMBieNYCihC9+e4aQthIz0cPw7
         nPcq/dSyh3TQ2iYZM3164IV6Hk3xNVVeEtw/KweHzEb/39DcVr+NmfeTkJfTD0gaB7bH
         HDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/XkWG9p3vuThMnzF5+jHBK0yD8kKyiYj1CsPVcIZG2k=;
        b=fGT6/XJyrBZbtd3stnA+7A8+YcyTqXCzB1i8cp/ddtrX+9bNt8aicMxflWOLgkHt9V
         ydHyIYVzTDZNUdFqugOynB+kPCP29kOtvLd+HJcuP+0y55xDD29OieaWsarnn/5xadmT
         Vc0PPLCXc7ukn69FyfrvNwJk/Of5eVIkwAU0nXCIMeFHAt0Nil2AYwZq2YXeilSTXSYy
         UGsRBag/DtBajG3t65nzlM2wL2BXWW5sZ1yzOZPa59CF7a9sRoS7Sw7LmpOJO0QEGxB0
         OAv6d5w8vlCu8Ij7pmmb2bhgCEl4z03PucP2dxb2iObHl1k4EljVTOAGcvh2kdhJ/08e
         03+g==
X-Gm-Message-State: AOAM530ZxmMdTx51D/ozelPCSRg4KyGcsgrFetDfLbkwAypYR9Gm6JKx
        mhYYT1CLEJVcf9EIOi+Frgzo39hfGqtKrVV9tolvQw==
X-Google-Smtp-Source: ABdhPJzlwY4snWFXpxBlNWlDJVr5O/yWYAqwfXJReVJK7U77qf3035eHhy3r6Qq2WuRy8RNFs9VDtvKPjIC+Z+H1LKQ=
X-Received: by 2002:a02:aa85:: with SMTP id u5mr7968024jai.75.1621635984233;
 Fri, 21 May 2021 15:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210521221211.29077-1-yu-cheng.yu@intel.com> <20210521221211.29077-14-yu-cheng.yu@intel.com>
In-Reply-To: <20210521221211.29077-14-yu-cheng.yu@intel.com>
From:   Axel Rasmussen <axelrasmussen@google.com>
Date:   Fri, 21 May 2021 15:25:47 -0700
Message-ID: <CAJHvVcjsecq-nOVE1ew1ctG2UpK0F0d0MjNncUgK0L=R4eyDqA@mail.gmail.com>
Subject: Re: [PATCH v27 13/31] mm: Move VM_UFFD_MINOR_BIT from 37 to 38
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Cc:     x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
        Linux MM <linux-mm@kvack.org>, linux-arch@vger.kernel.org,
        linux-api@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
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
        Weijiang Yang <weijiang.yang@intel.com>,
        Pengfei Xu <pengfei.xu@intel.com>,
        Haitao Huang <haitao.huang@intel.com>,
        Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This seems reasonable to me. The particular bit used isn't so
important from my perspective. I can't think of a way this would break
backward compatibility or such. So:

Reviewed-by: Axel Rasmussen <axelrasmussen@google.com>

On Fri, May 21, 2021 at 3:13 PM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
>
> To introduce VM_SHADOW_STACK as VM_HIGH_ARCH_BIT (37), and make all
> VM_HIGH_ARCH_BITs stay together, move VM_UFFD_MINOR_BIT from 37 to 38.
>
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
> Cc: Axel Rasmussen <axelrasmussen@google.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Mike Kravetz <mike.kravetz@oracle.com>
> ---
>  include/linux/mm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index c274f75efcf9..923f89b9f1b5 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -373,7 +373,7 @@ extern unsigned int kobjsize(const void *objp);
>  #endif
>
>  #ifdef CONFIG_HAVE_ARCH_USERFAULTFD_MINOR
> -# define VM_UFFD_MINOR_BIT     37
> +# define VM_UFFD_MINOR_BIT     38
>  # define VM_UFFD_MINOR         BIT(VM_UFFD_MINOR_BIT)  /* UFFD minor faults */
>  #else /* !CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
>  # define VM_UFFD_MINOR         VM_NONE
> --
> 2.21.0
>
