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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C912C433E6
	for <linux-doc@archiver.kernel.org>; Thu, 18 Feb 2021 20:02:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FE7A64E28
	for <linux-doc@archiver.kernel.org>; Thu, 18 Feb 2021 20:02:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231548AbhBRUBw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Feb 2021 15:01:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232291AbhBRT7W (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Feb 2021 14:59:22 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75D36C0617AA
        for <linux-doc@vger.kernel.org>; Thu, 18 Feb 2021 11:56:18 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id p136so3941821ybc.21
        for <linux-doc@vger.kernel.org>; Thu, 18 Feb 2021 11:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=zhEDZA4JbZSAj5/ePKSx+KCgThTXAMSnv6lc/wPfgfs=;
        b=QME2l0CHS+bmS8ezIa3F+1hGntliqb4UvifKWFGGVmp9YGFOfca7qXz9i8ZsYCofh+
         EK03WC0fEogRlgwusm44pcfMBH8OdNwALCgg3nfK0N0tJOfpJgAUxPkQIU8L+Q4gG8/z
         T908c5y4ixfiOlGrrd6mIqKVNKP8e3DD+Bke1tA8smqaO2/JBRHz1VVjI3YtPhRjDldf
         Vz2jceBvzK/fv98k17OAfxq06E6qx++CgjKm4j2r3bMbpl7Kx/YlXa8nsd54Ny7QnNpK
         CdvaAtKU6AEcA91VHbO3K2/+LMKEu1mBCBGGUQXPee1G7nMamaiDjeT3mksBSdcn/1Wr
         51Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=zhEDZA4JbZSAj5/ePKSx+KCgThTXAMSnv6lc/wPfgfs=;
        b=tLIuHIS0Pm8qcptEIPfmRRwozk4JbkdnS8YYQulWGMhlnHOcmlnbddviMbZr6aIiwO
         oeT777tsIe8vTIX5IwVGFnpB+f1Qi+YWGkuW32MlH5Zorpdcti3/6IunZpmACam8ofDJ
         DhMZdHB1+Cl31j0xXn1GQL4Cl8mQNAR7w/laziuK+1GusjHmJ6D6NpcsXXW/CEnSWhVr
         5tTSpRpv1XeGFgcYjxSem1Kufod2whzQsz8ecG61XdwdL2TGO8BHLvtk7WJej/M7Ggn7
         HCw916u5VMhBnRHKjvrdx8Av5X3AF3XZlzINZknO4G9wHPa0bMO19dB9hw8nvK8AXGXc
         /w2Q==
X-Gm-Message-State: AOAM530GRyncZqoMERmW6+D8HFk8ra/Vzb70pNZp5TvPTjH06DgTcQ+7
        Ak2TsYvFpWiZjK/ADHHxg+B9pfKZ3nYo
X-Google-Smtp-Source: ABdhPJxlLzfcvaG6UiGLb/A8n8lgC3FBoqtt2XP9SFO3BanNkp0ndOPvc9Y7ml9fisxFfjC7C188z0a5mDwF
Sender: "vipinsh via sendgmr" <vipinsh@vipinsh.kir.corp.google.com>
X-Received: from vipinsh.kir.corp.google.com ([2620:0:1008:10:580f:a4a0:74ce:b3b4])
 (user=vipinsh job=sendgmr) by 2002:a25:3104:: with SMTP id
 x4mr8725771ybx.141.1613678177550; Thu, 18 Feb 2021 11:56:17 -0800 (PST)
Date:   Thu, 18 Feb 2021 11:55:49 -0800
In-Reply-To: <20210218195549.1696769-1-vipinsh@google.com>
Message-Id: <20210218195549.1696769-3-vipinsh@google.com>
Mime-Version: 1.0
References: <20210218195549.1696769-1-vipinsh@google.com>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
Subject: [RFC 2/2] cgroup: sev: Miscellaneous cgroup documentation.
From:   Vipin Sharma <vipinsh@google.com>
To:     tj@kernel.org, thomas.lendacky@amd.com, brijesh.singh@amd.com,
        jon.grimm@amd.com, eric.vantassell@amd.com, pbonzini@redhat.com,
        hannes@cmpxchg.org, frankja@linux.ibm.com, borntraeger@de.ibm.com
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
used to track and limit usage of scalar resources.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
Reviewed-by: David Rientjes <rientjes@google.com>
---
 Documentation/admin-guide/cgroup-v1/misc.rst |  1 +
 Documentation/admin-guide/cgroup-v2.rst      | 64 +++++++++++++++++++-
 2 files changed, 63 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/admin-guide/cgroup-v1/misc.rst

diff --git a/Documentation/admin-guide/cgroup-v1/misc.rst b/Documentation/admin-guide/cgroup-v1/misc.rst
new file mode 100644
index 000000000000..8e9e9311daeb
--- /dev/null
+++ b/Documentation/admin-guide/cgroup-v1/misc.rst
@@ -0,0 +1 @@
+/Documentation/admin-guide/cgroup-v2.rst
diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 1de8695c264b..1a41a3623b9b 100644
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
@@ -2161,6 +2164,63 @@ HugeTLB Interface Files
 	generated on this file reflects only the local events.
 
 Misc
+--------------
+
+The Miscellaneous cgroup provides the resource allocation and tracking
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
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Miscellaneous controller provides 3 interface files:
+
+  misc.capacity
+        A read-only flat-keyed file shown only in the root cgroup.  It shows
+        miscellaneous scalar resources available on the platform along with
+        their quantities::
+	  $ cat misc.capacity
+	  sev 50
+	  sev_es 10
+
+  misc.current
+        A read-only flat-keyed file shown in the non-root cgroups.  It shows
+        the current usage of the resources in the cgroup and its children.::
+	  $ cat misc.current
+	  sev 3
+	  sev_es 0
+
+  misc.max
+        A read-write flat-keyed file shown in the non root cgroups. Allowed
+        maximum usage of the resources in the cgroup and its children.::
+	  $ cat misc.max
+	  sev max
+	  sev_es 4
+
+	Limit can be set by::
+	  # echo sev 1 > misc.max
+
+	Limit can be set to max by::
+	  # echo sev max > misc.max
+
+        Limits can be set more than the capacity value in the misc.capacity
+        file.
+
+Migration and Ownership
+~~~~~~~~~~~~~~~~~~~~~~~
+
+A miscellaneous scalar resource is charged to the cgroup in which it is used
+first, and stays charged to that cgroup until that resource is freed. Migrating
+a process to a different cgroup do not move the charge to the destination
+cgroup where the process has moved.
+
+Others
 ----
 
 perf_event
-- 
2.30.0.617.g56c4b15f3c-goog

