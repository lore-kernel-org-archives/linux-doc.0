Return-Path: <SRS0=65L0=DS=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A0AFC433E7
	for <linux-doc@archiver.kernel.org>; Sun, 11 Oct 2020 06:25:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CDA0B2083B
	for <linux-doc@archiver.kernel.org>; Sun, 11 Oct 2020 06:25:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sWYTJbGO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbgJKGZB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 11 Oct 2020 02:25:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726694AbgJKGZB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 11 Oct 2020 02:25:01 -0400
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCF36C0613D0
        for <linux-doc@vger.kernel.org>; Sat, 10 Oct 2020 23:25:00 -0700 (PDT)
Received: by mail-qv1-xf4a.google.com with SMTP id eh4so4870431qvb.12
        for <linux-doc@vger.kernel.org>; Sat, 10 Oct 2020 23:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=UJx97gIPGIXFXkRks4Wo0vV6Q6PxKBpX120vcE6WJsg=;
        b=sWYTJbGOpsmE70syYCNzGsAplxbAsaDGvmNcakNaECKP+Ez8bD3Rdi6wI3rU59lXC9
         6gfqTcuW9qjebxjGoE/SlnfNpby5Lx9LohoeIR0wNuoONARjym5sepDDSAAzRvXJTOvh
         jWgsUd7YnS0HYTD/FqQ5fTCIc4Egy70KtDZFi4GTlSgAJR+du+MoKKkmnVxmYz+VjXsm
         /LRCyixeYm3wQkxoj7oL5e4ruFzoYKC/W4hO6hQ+Fby9VjHr2ghxh2G+ODkOMtdkOl2L
         n/3z5bO46TzAHYpXmxMlyLX3xSV5i+mcGQEM8lPmKs5wXtRt8EL6d6bXbmBDWTELZFnI
         Xcjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=UJx97gIPGIXFXkRks4Wo0vV6Q6PxKBpX120vcE6WJsg=;
        b=EfPoy5y+/ioWY8Pak9AirfnRoWhejmuVztPjZXGhnjPpFkgVmG1JE7uy2+XMoNxJ0L
         8HNfdkBW0AiEpZvNfpzhMuQViodvkRYipHl779P0Pie11WvZHHOFe0W3VtT/BKB/1tUq
         rEOIFm21Pr4K70SRMyWlBpwYa6xG8lmBIwEaVSBJJuBDp8XDTrq3ekVFk2jmksNbnMg5
         8PG/IxiID4krDL4MBP3JTOOw0IZo2J5G46sXU6f3ItNv35lzek5mcDBn25X/Peg7wmvS
         IcsZfdSGUNCILL6i3rR9VRmPbF7xY7+ev5etaav3MmAeCZp7O/AnEmlO3mp5PiMb48lK
         MGnQ==
X-Gm-Message-State: AOAM533i+sa9vQ6gOumds6HhVYeGJskwa721lQ2JDppQQAv/bSJIVosZ
        efEEO9FfDTK3304qPxWUD2RCOVssG2TaW3YT4A==
X-Google-Smtp-Source: ABdhPJwwuHEwTJas51CDs0CXwMgtZ6GF8BpLVVQwMWpZxEVKux8CKK116qNPOrQYZazm9+cW7Nre45/LrKMgXOFtEA==
Sender: "lokeshgidra via sendgmr" <lokeshgidra@lg.mtv.corp.google.com>
X-Received: from lg.mtv.corp.google.com ([2620:15c:211:202:f693:9fff:fef4:29dd])
 (user=lokeshgidra job=sendgmr) by 2002:a0c:a203:: with SMTP id
 f3mr20270612qva.33.1602397499810; Sat, 10 Oct 2020 23:24:59 -0700 (PDT)
Date:   Sat, 10 Oct 2020 23:24:54 -0700
Message-Id: <20201011062456.4065576-1-lokeshgidra@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
Subject: [PATCH v5 0/2] Control over userfaultfd kernel-fault handling
From:   Lokesh Gidra <lokeshgidra@google.com>
To:     Kees Cook <keescook@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>, Peter Xu <peterx@redhat.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Lokesh Gidra <lokeshgidra@google.com>,
        Daniel Colascione <dancol@dancol.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kaleshsingh@google.com,
        calin@google.com, surenb@google.com, nnk@google.com,
        jeffv@google.com, kernel-team@android.com,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Shaohua Li <shli@fb.com>, Jerome Glisse <jglisse@redhat.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Mel Gorman <mgorman@techsingularity.net>,
        Nitin Gupta <nigupta@nvidia.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Iurii Zaikin <yzaikin@google.com>,
        Luis Chamberlain <mcgrof@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch series is split from [1]. The other series enables SELinux
support for userfaultfd file descriptors so that its creation and
movement can be controlled.

It has been demonstrated on various occasions that suspending kernel
code execution for an arbitrary amount of time at any access to
userspace memory (copy_from_user()/copy_to_user()/...) can be exploited
to change the intended behavior of the kernel. For instance, handling
page faults in kernel-mode using userfaultfd has been exploited in [2, 3].
Likewise, FUSE, which is similar to userfaultfd in this respect, has been
exploited in [4, 5] for similar outcome.

This small patch series adds a new flag to userfaultfd(2) that allows
callers to give up the ability to handle kernel-mode faults with the
resulting UFFD file object. It then adds a 'user-mode only' option to
the unprivileged_userfaultfd sysctl knob to require unprivileged
callers to use this new flag.

The purpose of this new interface is to decrease the chance of an
unprivileged userfaultfd user taking advantage of userfaultfd to
enhance security vulnerabilities by lengthening the race window in
kernel code.

[1] https://lore.kernel.org/lkml/20200211225547.235083-1-dancol@google.com/
[2] https://duasynt.com/blog/linux-kernel-heap-spray
[3] https://duasynt.com/blog/cve-2016-6187-heap-off-by-one-exploit
[4] https://googleprojectzero.blogspot.com/2016/06/exploiting-recursion-in-linux-kernel_20.html
[5] https://bugs.chromium.org/p/project-zero/issues/detail?id=808

Changes since v4:

  - Added warning when bailing out from handling kernel fault.

Changes since v3:

  - Modified the meaning of value '0' of unprivileged_userfaultfd
    sysctl knob. Setting this knob to '0' now allows unprivileged users
    to use userfaultfd, but can handle page faults in user-mode only.
  - The default value of unprivileged_userfaultfd sysctl knob is changed
    to '0'.

Changes since v2:

  - Removed 'uffd_flags' and directly used 'UFFD_USER_MODE_ONLY' in
    userfaultfd().

Changes since v1:

  - Added external references to the threats from allowing unprivileged
    users to handle page faults from kernel-mode.
  - Removed the new sysctl knob restricting handling of page
    faults from kernel-mode, and added an option for the same
    in the existing 'unprivileged_userfaultfd' knob.

Lokesh Gidra (2):
  Add UFFD_USER_MODE_ONLY
  Add user-mode only option to unprivileged_userfaultfd sysctl knob

 Documentation/admin-guide/sysctl/vm.rst | 15 ++++++++++-----
 fs/userfaultfd.c                        | 16 +++++++++++++---
 include/uapi/linux/userfaultfd.h        |  9 +++++++++
 3 files changed, 32 insertions(+), 8 deletions(-)

-- 
2.28.0.1011.ga647a8990f-goog

