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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C4C6C433E0
	for <linux-doc@archiver.kernel.org>; Sat, 16 Jan 2021 02:34:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A843238D6
	for <linux-doc@archiver.kernel.org>; Sat, 16 Jan 2021 02:34:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729186AbhAPCdr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 15 Jan 2021 21:33:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729056AbhAPCdq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Jan 2021 21:33:46 -0500
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EFB7C06179B
        for <linux-doc@vger.kernel.org>; Fri, 15 Jan 2021 18:32:20 -0800 (PST)
Received: by mail-pf1-x44a.google.com with SMTP id e28so7279738pfl.19
        for <linux-doc@vger.kernel.org>; Fri, 15 Jan 2021 18:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=nNIw9PreN3FBfGgYbh7zpha0dJbvtaxE6HZ4WAMEo70=;
        b=O2uE/OuqpEgZiCwyZa5o+HdAhsN+xhoaafd3x8Ye33wpF65KEC4fEPn100XRq87CH/
         Q2TJeQS138EUddLPqEtboMXaAo8XB5S558db63b4I7kxn9pR+9yJfam6xtNXxm5+CIFT
         YSIHfBEmlnhmHOOtJozrakoHbWmwUu0OjBYiQTOlTde/CEsfKsHf0Cwl1oE1waBDCHzb
         z9MXupmatS1uObwaN8PBkcTeWtxQpRramyrqJr3x4qElSlo3VfWl8c8tE3DBCqQ70OJJ
         5q4IoBV6ZvGpg1is4EuVWByB2HJplNZ0tSs4Nqq6iBx8vxkHtGw9dCiBRiR+TefON/JC
         Wuhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=nNIw9PreN3FBfGgYbh7zpha0dJbvtaxE6HZ4WAMEo70=;
        b=fTF3Oo6OwxXzh1HRt1i0TcGdDnko9y83+mw9+qbYrOJqpepwlKhMicD2ikCTD1ZNUH
         3p4xnhBhSWdvQHXlWRMdy+Y8E16zvn1fPvghD+jnvcuEuAtnb1h7bvlyF7i+p7fWkkx1
         JFXhj/5i95bo7rDozysZaWtmF2o5Yog5CSwXrZIU32WzqbFHQELnjcJb+mDcs8Ocl13U
         s2gkuaEZoQuAErPC99zSo4b29YPOU0yzfMk24z/hWUXL79jiWByPNp3X40KGVKTE8C17
         mqrgfnNTXL9BOhziPWAK56tRl4OjM/xDEs7dJzZde20j7/sm16ote3cFC/YDIU547r1y
         kGLA==
X-Gm-Message-State: AOAM533RuPN5FgR2uwQjrlwqg0sBv2xUN52VDxXYjoBLbyrPUj58QOYB
        U4TvDfQYeTVr23gGWhIGQPAmsTwv9cKz
X-Google-Smtp-Source: ABdhPJyPbsL0ayho+9eVZ/KhllIdkk8tTvjRQi5kWGKN5nQ91U/PCSTcaVRQJaJbKbT6VHeFkSM/iQmRvNMm
Sender: "vipinsh via sendgmr" <vipinsh@vipinsh.kir.corp.google.com>
X-Received: from vipinsh.kir.corp.google.com ([2620:0:1008:10:1ea0:b8ff:fe75:b885])
 (user=vipinsh job=sendgmr) by 2002:a17:90a:bb8c:: with SMTP id
 v12mr13853839pjr.227.1610764339965; Fri, 15 Jan 2021 18:32:19 -0800 (PST)
Date:   Fri, 15 Jan 2021 18:32:04 -0800
In-Reply-To: <20210116023204.670834-1-vipinsh@google.com>
Message-Id: <20210116023204.670834-3-vipinsh@google.com>
Mime-Version: 1.0
References: <20210116023204.670834-1-vipinsh@google.com>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
Subject: [Patch v5 2/2] cgroup: svm: Encryption IDs cgroup documentation.
From:   Vipin Sharma <vipinsh@google.com>
To:     thomas.lendacky@amd.com, brijesh.singh@amd.com, jon.grimm@amd.com,
        eric.vantassell@amd.com, pbonzini@redhat.com, seanjc@google.com,
        tj@kernel.org, hannes@cmpxchg.org, frankja@linux.ibm.com,
        borntraeger@de.ibm.com, corbet@lwn.net
Cc:     joro@8bytes.org, vkuznets@redhat.com, wanpengli@tencent.com,
        jmattson@google.com, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, hpa@zytor.com, gingell@google.com,
        rientjes@google.com, dionnaglaze@google.com, kvm@vger.kernel.org,
        x86@kernel.org, cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Documentation of Encryption IDs controller. This new controller is used
to track and limit usage of hardware memory encryption capabilities on
the CPUs.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
Reviewed-by: David Rientjes <rientjes@google.com>
Reviewed-by: Dionna Glaze <dionnaglaze@google.com>
---
 .../admin-guide/cgroup-v1/encryption_ids.rst  |  1 +
 Documentation/admin-guide/cgroup-v2.rst       | 78 ++++++++++++++++++-
 2 files changed, 77 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/admin-guide/cgroup-v1/encryption_ids.rst

diff --git a/Documentation/admin-guide/cgroup-v1/encryption_ids.rst b/Documentation/admin-guide/cgroup-v1/encryption_ids.rst
new file mode 100644
index 000000000000..8e9e9311daeb
--- /dev/null
+++ b/Documentation/admin-guide/cgroup-v1/encryption_ids.rst
@@ -0,0 +1 @@
+/Documentation/admin-guide/cgroup-v2.rst
diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 63521cd36ce5..72993571de2e 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -63,8 +63,11 @@ v1 is available under :ref:`Documentation/admin-guide/cgroup-v1/index.rst <cgrou
        5-7-1. RDMA Interface Files
      5-8. HugeTLB
        5.8-1. HugeTLB Interface Files
-     5-8. Misc
-       5-8-1. perf_event
+     5-9. Encryption IDs
+       5.9-1 Encryption IDs Interface Files
+       5.9-2 Migration and Ownership
+     5-10. Misc
+       5-10-1. perf_event
      5-N. Non-normative information
        5-N-1. CPU controller root cgroup process behaviour
        5-N-2. IO controller root cgroup process behaviour
@@ -2160,6 +2163,77 @@ HugeTLB Interface Files
 	are local to the cgroup i.e. not hierarchical. The file modified event
 	generated on this file reflects only the local events.
 
+Encryption IDs
+--------------
+
+There are multiple hardware memory encryption capabilities provided by the
+hardware vendors, like Secure Encrypted Virtualization (SEV) and SEV Encrypted
+State (SEV-ES) from AMD.
+
+These features are being used in encrypting virtual machines (VMs) and user
+space programs. However, only a small number of keys/IDs can be used
+simultaneously.
+
+This limited availability of these IDs requires system admin to optimize
+allocation, control, and track the usage of the resources in the cloud
+infrastructure. This resource also needs to be protected from getting exhausted
+by some malicious program and causing starvation for other programs.
+
+Encryption IDs controller provides capability to register the resource for
+controlling and tracking through the cgroups.
+
+Encryption IDs Interface Files
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Each encryption ID type have their own interface files,
+encids.[ID TYPE].{max, current, stat}, where "ID TYPE" can be sev and
+sev-es.
+
+  encids.[ID TYPE].stat
+        A read-only flat-keyed single value file. This file exists only in the
+        root cgroup.
+
+        It shows the total number of encryption IDs available and currently in
+        use on the platform::
+          # cat encids.sev.stat
+          total 509
+          used 0
+
+  encids.[ID TYPE].max
+        A read-write file which exists on the non-root cgroups. File is used to
+        set maximum count of "[ID TYPE]" which can be used in the cgroup.
+
+        Limit can be set to max by::
+          # echo max > encids.sev.max
+
+        Limit can be set by::
+          # echo 100 > encids.sev.max
+
+        This file shows the max limit of the encryption ID in the cgroup::
+          # cat encids.sev.max
+          max
+
+        OR::
+          # cat encids.sev.max
+          100
+
+        Limits can be set more than the "total" capacity value in the
+        encids.[ID TYPE].stat file, however, the controller ensures
+        that the usage never exceeds the "total" and the max limit.
+
+  encids.[ID TYPE].current
+        A read-only single value file which exists on non-root cgroups.
+
+        Shows the total number of encrypted IDs being used in the cgroup.
+
+Migration and Ownership
+~~~~~~~~~~~~~~~~~~~~~~~
+
+An encryption ID is charged to the cgroup in which it is used first, and
+stays charged to that cgroup until that ID is freed. Migrating a process
+to a different cgroup do not move the charge to the destination cgroup
+where the process has moved.
+
 Misc
 ----
 
-- 
2.30.0.284.gd98b1dd5eaa7-goog

