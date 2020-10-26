Return-Path: <SRS0=Bwbi=EB=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C40C4363A
	for <linux-doc@archiver.kernel.org>; Mon, 26 Oct 2020 21:00:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C92E21D42
	for <linux-doc@archiver.kernel.org>; Mon, 26 Oct 2020 21:00:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Pxi/eqHu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729074AbgJZVA5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Oct 2020 17:00:57 -0400
Received: from mail-pj1-f73.google.com ([209.85.216.73]:56186 "EHLO
        mail-pj1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729066AbgJZVA5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Oct 2020 17:00:57 -0400
Received: by mail-pj1-f73.google.com with SMTP id r1so3581397pjp.5
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2020 14:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=8XFAGaMnZpaYT0ztE4+ED+zm8jGUSJs5c4zzKttTIPI=;
        b=Pxi/eqHudvziXWScDyXkpvDK2QiIuvHS43rBVL+Xc70/Q5dzLbbxPT40atX3PLqd6o
         dt9KJrBnICKVwr2NPng1LbI91rutUvaFzl1aozHG4HWDaRt7KhMYDAMmF6aDpxi7XDOk
         QT2H3OusQXLTq3dTB30XF2gqpXpXBdHCpNyaj577OVJMu9CSNnnppB2U1z1+o6lHcOvZ
         hWqD7IR8U14Mb86Cp4dMZKfsJ6/lDq6Ysaa7GKnVsTghUKku11fCzFnBpox4cDb6ReLG
         Q6NUHNqunaSvXXK+IKxly7q+I5MTyAjJHGABlKn21sCz5g4Sn/TxGU86GcXbDF26gmpN
         eHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=8XFAGaMnZpaYT0ztE4+ED+zm8jGUSJs5c4zzKttTIPI=;
        b=T4bqeAkHCZ6rxlyS+gcfq6WMgE0/D8cEGtDeiusxmrLAF6I/X0umbfSa3JkqXoQKgx
         3euib79My+YHZs7KhiSE5P/v2VmBTJq1JSEq7+7ufMQuiPV/cl6xmmsYzB161dW3utI5
         VTTTpk4ANCLSPESy9eEqCXSbLX1TaKTt0gb1eLMiIK4iCoM8yf4THnT4HCREZh3ESaiA
         QsXdHf935oNllEjGmV0z4h3OG3BSGEYsoy/VDGMFzkm3+cDbjXfrpVNlvljSUPuO3HU2
         UKusDKx6Mi+OBPPU7ZR7G0ldszCU4mpSl7W25O0jWc+aqaOi/3Nc3Npp0ArKugeabIpZ
         RG6g==
X-Gm-Message-State: AOAM532W3twgztD47uhHXhoU57j6Aq8Qpu6u1/SsN4wneb1dGbsVf+D7
        Z2NnJupDEc0yTl4zKySTb0Tcb9t9FjXL2xkm2Q==
X-Google-Smtp-Source: ABdhPJzoCc1eQDlxMsW2Ajct/JrdoHj+uuvNDeZHvYEyQxfSbIe9/4p6t0jstELt4ujFjAMh69PODMXwUc1F7f+XtA==
Sender: "lokeshgidra via sendgmr" <lokeshgidra@lg.mtv.corp.google.com>
X-Received: from lg.mtv.corp.google.com ([2620:15c:211:202:f693:9fff:fef4:29dd])
 (user=lokeshgidra job=sendgmr) by 2002:a17:90a:2e05:: with SMTP id
 q5mr1854369pjd.0.1603746056083; Mon, 26 Oct 2020 14:00:56 -0700 (PDT)
Date:   Mon, 26 Oct 2020 14:00:50 -0700
Message-Id: <20201026210052.3775167-1-lokeshgidra@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
Subject: [PATCH v6 0/2] Control over userfaultfd kernel-fault handling
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

Changes since v5:

  - Added printk_once when unprivileged_userfaultfd is set to 0 and
    userfaultfd syscall is called without UFFD_USER_MODE_ONLY in the
    absence of CAP_SYS_PTRACE capability.

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
 fs/userfaultfd.c                        | 20 +++++++++++++++++---
 include/uapi/linux/userfaultfd.h        |  9 +++++++++
 3 files changed, 36 insertions(+), 8 deletions(-)

-- 
2.29.0.rc1.297.gfa9743e501-goog

