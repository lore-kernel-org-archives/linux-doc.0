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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57CAFC6379F
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 03:11:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED4E82145D
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 03:11:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g3r94oz0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727366AbgKTDKf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 Nov 2020 22:10:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727364AbgKTDKe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Nov 2020 22:10:34 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18C09C061A04
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2020 19:10:33 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id i19so10869801ejx.9
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2020 19:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eUfE7C8uSYsq1jDdQ+F2fB6YPrXtnZerneXItzJY/94=;
        b=g3r94oz06VUs8DX9vKbCAQpTO3TwkaLGfrLi/5MlgFQS4kV5935NMw6Pw/39dHUUmW
         VTNxBWyVCISQAoa0c5QxREPtJEc2Is0PGtGo7KJjmNf5g2r5gUhcetU8U+7hineERSmu
         672wa2JzGxN14vkk4mUt8wO174RSmF2oH6Ar23ngI9tUL0jB+k4Sm1bDbQ97WPjNi/6r
         VRGPHDvKCOL+dKnpb7ed6oZhf9USK6POpE7St9g1qrTmEOAywHOZLmroTcbX5FNKHiLc
         IoNe/w5FOVjgNTnMxRelQo8hfy1rhmDu7ufcByHaib1jZZNuI2iT1AUU7HgbxoZFktqL
         iSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eUfE7C8uSYsq1jDdQ+F2fB6YPrXtnZerneXItzJY/94=;
        b=iOQ41zfZnZpGspJODqQWeRUQwkrb5xcmIfPoO6SN1/PZui8qdLpsKWZZX+FGkuxSFA
         PIt9PAmWa9l2BkCqldnW/QW24Vc00S5+mJw72PRnJFrvObejnHPO6KaHQOhKxy+RnTIj
         SHBNOIOd/gO0csOtpQDJzg6aHdSrXrbftm1Sf3Bu7B8CwGjs6sakfEQqhZHtCuBXfvO+
         ap9G4/LikjXcDPjeaj4cr56wmKkfER9GnpRTgNeAsj3kMDeq0KP+7LciER1UTspqiets
         guhkm6RUZ/EPifwezOUYxJqGk3tx2c6AZqjS/6XEEOVaomK11cOZQ2+5ZgZFtZLfkvBc
         mBiw==
X-Gm-Message-State: AOAM5308GGke5Bcxs3DxwUiXLterbY9/65TNLhnMbUZDffCOZ1LO6IME
        zpbSCSRWiYD3N69Qbdo7TuZCAhjwbAUrLZRODqNFjA==
X-Google-Smtp-Source: ABdhPJzgq/aERbeM1xKirsVcdEPVVKlH3kowdPx+apHmrmJn/Q9UIgbYin/OoVyKJbxwtQiJQlSbZm2sTdsvaqf/H8k=
X-Received: by 2002:a17:906:c312:: with SMTP id s18mr30924739ejz.185.1605841831524;
 Thu, 19 Nov 2020 19:10:31 -0800 (PST)
MIME-Version: 1.0
References: <20201120030411.2690816-1-lokeshgidra@google.com> <20201120030411.2690816-3-lokeshgidra@google.com>
In-Reply-To: <20201120030411.2690816-3-lokeshgidra@google.com>
From:   Lokesh Gidra <lokeshgidra@google.com>
Date:   Thu, 19 Nov 2020 19:10:20 -0800
Message-ID: <CA+EESO74RWq+FxV5H8BS6vb0E+icbzU6fYMEAbiFBB79FHiHVg@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] Add user-mode only option to unprivileged_userfaultfd
 sysctl knob
To:     Kees Cook <keescook@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>, Peter Xu <peterx@redhat.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Daniel Colascione <dancol@dancol.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Linux FS Devel <linux-fsdevel@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org, Kalesh Singh <kaleshsingh@google.com>,
        Calin Juravle <calin@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Jeffrey Vander Stoep <jeffv@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Shaohua Li <shli@fb.com>, Jerome Glisse <jglisse@redhat.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Mel Gorman <mgorman@techsingularity.net>,
        Nitin Gupta <nigupta@nvidia.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Iurii Zaikin <yzaikin@google.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 19, 2020 at 7:04 PM Lokesh Gidra <lokeshgidra@google.com> wrote:
>
> With this change, when the knob is set to 0, it allows unprivileged
> users to call userfaultfd, like when it is set to 1, but with the
> restriction that page faults from only user-mode can be handled.
> In this mode, an unprivileged user (without SYS_CAP_PTRACE capability)
> must pass UFFD_USER_MODE_ONLY to userfaultd or the API will fail with
> EPERM.
>
> This enables administrators to reduce the likelihood that an attacker
> with access to userfaultfd can delay faulting kernel code to widen
> timing windows for other exploits.
>
> The default value of this knob is changed to 0. This is required for
> correct functioning of pipe mutex. However, this will fail postcopy
> live migration, which will be unnoticeable to the VM guests. To avoid
> this, set 'vm.userfault = 1' in /sys/sysctl.conf.
>
> The main reason this change is desirable as in the short term is that
> the Android userland will behave as with the sysctl set to zero. So
> without this commit, any Linux binary using userfaultfd to manage its
> memory would behave differently if run within the Android userland.
> For more details, refer to Andrea's reply [1].
>
> [1] https://lore.kernel.org/lkml/20200904033438.GI9411@redhat.com/
>
> Signed-off-by: Lokesh Gidra <lokeshgidra@google.com>
> Reviewed-by: Andrea Arcangeli <aarcange@redhat.com>
> ---
>  Documentation/admin-guide/sysctl/vm.rst | 15 ++++++++++-----
>  fs/userfaultfd.c                        | 10 ++++++++--
>  2 files changed, 18 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
> index f455fa00c00f..d06a98b2a4e7 100644
> --- a/Documentation/admin-guide/sysctl/vm.rst
> +++ b/Documentation/admin-guide/sysctl/vm.rst
> @@ -873,12 +873,17 @@ file-backed pages is less than the high watermark in a zone.
>  unprivileged_userfaultfd
>  ========================
>
> -This flag controls whether unprivileged users can use the userfaultfd
> -system calls.  Set this to 1 to allow unprivileged users to use the
> -userfaultfd system calls, or set this to 0 to restrict userfaultfd to only
> -privileged users (with SYS_CAP_PTRACE capability).
> +This flag controls the mode in which unprivileged users can use the
> +userfaultfd system calls. Set this to 0 to restrict unprivileged users
> +to handle page faults in user mode only. In this case, users without
> +SYS_CAP_PTRACE must pass UFFD_USER_MODE_ONLY in order for userfaultfd to
> +succeed. Prohibiting use of userfaultfd for handling faults from kernel
> +mode may make certain vulnerabilities more difficult to exploit.
>
> -The default value is 1.
> +Set this to 1 to allow unprivileged users to use the userfaultfd system
> +calls without any restrictions.
> +
> +The default value is 0.
>
>
>  user_reserve_kbytes
> diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
> index 605599fde015..894cc28142e7 100644
> --- a/fs/userfaultfd.c
> +++ b/fs/userfaultfd.c
> @@ -28,7 +28,7 @@
>  #include <linux/security.h>
>  #include <linux/hugetlb.h>
>
> -int sysctl_unprivileged_userfaultfd __read_mostly = 1;
> +int sysctl_unprivileged_userfaultfd __read_mostly;
>
>  static struct kmem_cache *userfaultfd_ctx_cachep __read_mostly;
>
> @@ -1966,8 +1966,14 @@ SYSCALL_DEFINE1(userfaultfd, int, flags)
>         struct userfaultfd_ctx *ctx;
>         int fd;
>
> -       if (!sysctl_unprivileged_userfaultfd && !capable(CAP_SYS_PTRACE))
> +       if (!sysctl_unprivileged_userfaultfd &&
> +           (flags & UFFD_USER_MODE_ONLY) == 0 &&
> +           !capable(CAP_SYS_PTRACE)) {
> +               printk_once(KERN_WARNING "uffd: Set unprivileged_userfaultfd "
> +                       "sysctl knob to 1 if kernel faults must be handled "
> +                       "without obtaining CAP_SYS_PTRACE capability\n");
>                 return -EPERM;
> +       }
>
>         BUG_ON(!current->mm);
>
> --
> 2.29.0.rc1.297.gfa9743e501-goog
>
Adding linux-mm@kvack.org list
