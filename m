Return-Path: <SRS0=A0dr=DB=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36D67C4346E
	for <linux-doc@archiver.kernel.org>; Thu, 24 Sep 2020 06:56:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB96A20758
	for <linux-doc@archiver.kernel.org>; Thu, 24 Sep 2020 06:56:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A6fOq1HO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbgIXG4L (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Sep 2020 02:56:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727076AbgIXG4L (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Sep 2020 02:56:11 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDFD6C0613CE
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2020 23:56:10 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id y7so1307999pjt.1
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2020 23:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=FX0p/GcmPpR3We5nTHUDyc9BUTZhvYJ9+N0VF4ja3D0=;
        b=A6fOq1HOlUuYS2ejjODUD35m8TFnAilniB8q/he/79yXRI6J7NI/5Ni7kHBCvEkC2m
         lcXuePvKeAjjCDD7fCMEPX38aVIXcuUWP+W4OMSy0zBk2sxHJx8ra7LETRsT0HIRDyye
         xSwf61KUpd7wPrXq18JauwkfZwXsMB8awli9ljDrb5XWJlKwH3mlcV56ZLOVPibIG4Ic
         o/eVdv/JTMLjilq0gn9LEnIdeugRCiuR9+nExc8TyYrfq2ju1CexD/xlhgumusLgQp7o
         XRzmYIJmWMncSaLiHbfMQfFKTa0htqvMutDnKpI3x/vLO5QTmvQvgoeB0YAL5ijGpOW3
         0CmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=FX0p/GcmPpR3We5nTHUDyc9BUTZhvYJ9+N0VF4ja3D0=;
        b=VGlRBP4umCnNKNNddwOlX4brZMi8okgD+IE8H74zw1N53wf4C6jRIaXWa4jGPAGHma
         VvwmIVlGG9F+Kyqn4bPc9P08IQVETNWpDXfGbRf2CBlTF71zi350b8rTRGXpkNxXy6mP
         +i92fw1hJU62KSodU+b46d5GH8UFZlaH5bMCLRidq/27I2CrpVTSFHCSoz56+bHBsa37
         9COiDe/dS8VKv3DJl+/O6TVPCJUPARjOYWy5Ml8enrGRvoBYUXK+90TxkGgfpXFkRrvr
         4SgzUkeWBDm+++f0jbPqP+kj6Ydf10O44F8zPBXIZZLo6Bi5j4OWRzRjrDkiTNnDdz2E
         80rQ==
X-Gm-Message-State: AOAM532I/CwAGSaHY8vfaMA9hykzdfoxU1CO7LG20dRWqX3xO6J23gfI
        GbdvLigP/y/0ibfI1oeZwIPp1OeUZ4FKVV1etQ==
X-Google-Smtp-Source: ABdhPJwhRa38PHwfQdB4AKI0fOgdNDJYzEpWP8u7QkJdKT8QhABjPf/lE453ktfsBvnzt0vFPv5CAiF1JPyJRhzdTA==
Sender: "lokeshgidra via sendgmr" <lokeshgidra@lg.mtv.corp.google.com>
X-Received: from lg.mtv.corp.google.com ([2620:15c:211:202:f693:9fff:fef4:29dd])
 (user=lokeshgidra job=sendgmr) by 2002:a17:902:82c2:b029:d1:f36a:ab97 with
 SMTP id u2-20020a17090282c2b02900d1f36aab97mr3356719plz.64.1600930570089;
 Wed, 23 Sep 2020 23:56:10 -0700 (PDT)
Date:   Wed, 23 Sep 2020 23:56:04 -0700
Message-Id: <20200924065606.3351177-1-lokeshgidra@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
Subject: [PATCH v4 0/2] Control over userfaultfd kernel-fault handling
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
 fs/userfaultfd.c                        | 12 +++++++++---
 include/uapi/linux/userfaultfd.h        |  9 +++++++++
 3 files changed, 28 insertions(+), 8 deletions(-)

-- 
2.28.0.681.g6f77f65b4e-goog

