Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF4B7C4332B
	for <linux-doc@archiver.kernel.org>; Tue,  2 Mar 2021 18:08:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0E1D60241
	for <linux-doc@archiver.kernel.org>; Tue,  2 Mar 2021 18:08:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1580348AbhCBSBt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 Mar 2021 13:01:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377335AbhCBISv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Mar 2021 03:18:51 -0500
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A76C2C06121D
        for <linux-doc@vger.kernel.org>; Tue,  2 Mar 2021 00:17:18 -0800 (PST)
Received: by mail-pl1-x64a.google.com with SMTP id f10so2480719plt.6
        for <linux-doc@vger.kernel.org>; Tue, 02 Mar 2021 00:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=9IvSzdbIQqhRyiLJGvOnZfh3hjug63Y1v74jXsaZzZ4=;
        b=vjq0i7utFQfq/ROgloM8fVCwD3GgQjSjJzxE39PPfoolW/2BTnmUwVxfnbfg/xE8xf
         nurEyFcMwK9nSlqkfz+TWWrBExl5stjBN3maC6gC31KMD3tBteKgPHUq12s7UUgkwI9M
         vp0ePmNo9Ra+e+AbeLvDNxW6QBHsadhycldlmZuWH02z7uHsyD1QYqllyYU3eT01p+fk
         N2vJPKSArl7dvqr7FyBPla3CszX6Ce2ByDzrrm12jXWuSi0kZ2yktEAiVYRWZrBI7lA/
         KBQ/BHPJUdBBRMuJLk+UJD/X8LruP9bdJ6Fiw9PV3Pmud28l2jlck5kQNw4n2qMFnBC6
         lbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=9IvSzdbIQqhRyiLJGvOnZfh3hjug63Y1v74jXsaZzZ4=;
        b=PzSY0yWnqXSUkuxam6EeNDzlyBGOzuHkHuojY+i4QHAND2zvdu1+zrK6etg4PsoE+a
         jR10l+MGGUCEcloVedZCU4ku55d9tEV3+B/NVkHhBNAVgmbgdo/Hw4fIrDFT/c7lZ57i
         FzeBRplvYz87n53XtLVXPGnom3DX2w7DjOaayThJudHnsL09Gj0jArsAPvyy/hSJuOp7
         hjLm2RxfTRToRnHqkPSq57OJsvcmw3Qj2zAPAnuI61AQsJjXHWc7vI1jofihAX5/9zVw
         SQwdkv1hNl3M++QNqkpyBOcw2esIuUwLv36z0a4vV4gAci3L2jE2tH3W7z6ElpmLuoaZ
         UQ+A==
X-Gm-Message-State: AOAM530lLVjSQYjlJY5IwItL1/NhL9YdfZwyiSg51nHZrgQ4aYRx85J1
        vzAHfDJYdSbpZMXnR7/l5BwIHUJTVryZ
X-Google-Smtp-Source: ABdhPJyCXCm/dfyyzcTbG52l5hOFatdhe7phOhVOcb2mXZhlI38K9zFUo51+s70nURdhIGdIur5gyGdzY6gm
Sender: "vipinsh via sendgmr" <vipinsh@vipinsh.kir.corp.google.com>
X-Received: from vipinsh.kir.corp.google.com ([2620:0:1008:10:e829:dc2a:968a:1370])
 (user=vipinsh job=sendgmr) by 2002:a05:6a00:23c5:b029:1e6:2f2e:a438 with SMTP
 id g5-20020a056a0023c5b02901e62f2ea438mr19154226pfc.75.1614673038114; Tue, 02
 Mar 2021 00:17:18 -0800 (PST)
Date:   Tue,  2 Mar 2021 00:17:05 -0800
In-Reply-To: <20210302081705.1990283-1-vipinsh@google.com>
Message-Id: <20210302081705.1990283-3-vipinsh@google.com>
Mime-Version: 1.0
References: <20210302081705.1990283-1-vipinsh@google.com>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
Subject: [RFC v2 2/2] cgroup: sev: Miscellaneous cgroup documentation.
From:   Vipin Sharma <vipinsh@google.com>
To:     tj@kernel.org, mkoutny@suse.com, rdunlap@infradead.org,
        thomas.lendacky@amd.com, brijesh.singh@amd.com, jon.grimm@amd.com,
        eric.vantassell@amd.com, pbonzini@redhat.com, hannes@cmpxchg.org,
        frankja@linux.ibm.com, borntraeger@de.ibm.com
Cc:     corbet@lwn.net, seanjc@google.com, vkuznets@redhat.com,
        wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
        gingell@google.com, rientjes@google.com, dionnaglaze@google.com,
        kvm@vger.kernel.org, x86@kernel.org, cgroups@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Documentation of miscellaneous cgroup controller. This new controller is
used to track and limit the usage of scalar resources.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
Reviewed-by: David Rientjes <rientjes@google.com>
---
 Documentation/admin-guide/cgroup-v1/index.rst |  1 +
 Documentation/admin-guide/cgroup-v1/misc.rst  |  4 ++
 Documentation/admin-guide/cgroup-v2.rst       | 69 ++++++++++++++++++-
 3 files changed, 72 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/admin-guide/cgroup-v1/misc.rst

diff --git a/Documentation/admin-guide/cgroup-v1/index.rst b/Documentation/admin-guide/cgroup-v1/index.rst
index 226f64473e8e..99fbc8a64ba9 100644
--- a/Documentation/admin-guide/cgroup-v1/index.rst
+++ b/Documentation/admin-guide/cgroup-v1/index.rst
@@ -17,6 +17,7 @@ Control Groups version 1
     hugetlb
     memcg_test
     memory
+    misc
     net_cls
     net_prio
     pids
diff --git a/Documentation/admin-guide/cgroup-v1/misc.rst b/Documentation/admin-guide/cgroup-v1/misc.rst
new file mode 100644
index 000000000000..661614c24df3
--- /dev/null
+++ b/Documentation/admin-guide/cgroup-v1/misc.rst
@@ -0,0 +1,4 @@
+===============
+Misc controller
+===============
+Please refer "Misc" documentation in Documentation/admin-guide/cgroup-v2.rst
diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 1de8695c264b..74777323b7fd 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -63,8 +63,11 @@ v1 is available under :ref:`Documentation/admin-guide/cgroup-v1/index.rst <cgrou
        5-7-1. RDMA Interface Files
      5-8. HugeTLB
        5.8-1. HugeTLB Interface Files
-     5-8. Misc
-       5-8-1. perf_event
+     5-9. Misc
+       5.9-1 Miscellaneous cgroup Interface Files
+       5.9-2 Migration and Ownership
+     5-10. Others
+       5-10-1. perf_event
      5-N. Non-normative information
        5-N-1. CPU controller root cgroup process behaviour
        5-N-2. IO controller root cgroup process behaviour
@@ -2163,6 +2166,68 @@ HugeTLB Interface Files
 Misc
 ----
 
+The Miscellaneous cgroup provides the resource limiting and tracking
+mechanism for the scalar resources which cannot be abstracted like the other
+cgroup resources. Controller is enabled by the CONFIG_CGROUP_MISC config
+option.
+
+The first two resources added to the miscellaneous controller are Secure
+Encrypted Virtualization (SEV) ASIDs and SEV - Encrypted State (SEV-ES) ASIDs.
+These limited ASIDs are used for encrypting virtual machines memory on the AMD
+platform.
+
+Misc Interface Files
+~~~~~~~~~~~~~~~~~~~~
+
+Miscellaneous controller provides 3 interface files:
+
+  misc.capacity
+        A read-only flat-keyed file shown only in the root cgroup.  It shows
+        miscellaneous scalar resources available on the platform along with
+        their quantities::
+
+	  $ cat misc.capacity
+	  sev 50
+	  sev_es 10
+
+  misc.current
+        A read-only flat-keyed file shown in the non-root cgroups.  It shows
+        the current usage of the resources in the cgroup and its children.::
+
+	  $ cat misc.current
+	  sev 3
+	  sev_es 0
+
+  misc.max
+        A read-write flat-keyed file shown in the non root cgroups. Allowed
+        maximum usage of the resources in the cgroup and its children.::
+
+	  $ cat misc.max
+	  sev max
+	  sev_es 4
+
+	Limit can be set by::
+
+	  # echo sev 1 > misc.max
+
+	Limit can be set to max by::
+
+	  # echo sev max > misc.max
+
+        Limits can be set higher than the capacity value in the misc.capacity
+        file.
+
+Migration and Ownership
+~~~~~~~~~~~~~~~~~~~~~~~
+
+A miscellaneous scalar resource is charged to the cgroup in which it is used
+first, and stays charged to that cgroup until that resource is freed. Migrating
+a process to a different cgroup does not move the charge to the destination
+cgroup where the process has moved.
+
+Others
+------
+
 perf_event
 ~~~~~~~~~~
 
-- 
2.30.1.766.gb4fecdf3b7-goog

