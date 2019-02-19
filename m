Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E8D3F7D2EF
	for <lwn-linux-doc@archive.lwn.net>; Tue, 19 Feb 2019 03:23:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725770AbfBSDXQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Feb 2019 22:23:16 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:42299 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726142AbfBSDXQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Feb 2019 22:23:16 -0500
Received: by mail-qt1-f195.google.com with SMTP id b8so21564668qtr.9
        for <linux-doc@vger.kernel.org>; Mon, 18 Feb 2019 19:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :reply-to:organization;
        bh=NgDDGgZtb97xAaWPnHFCZOrz79R3I48yY4vXuOvjxZs=;
        b=Fr7UaGSfRl+I3w0IjyatRp37OuF2l9801kc+foEg5wRAY5R10D2FQCXyj9IeBtMAfl
         4IhNj0ucs+s9cDmnGj6YMGClGBz5q6EPRWpr9mCfxmfJ4OERDIacp/zEmhYp6L2JcpLS
         UzSUU9KXB01rlLbxokFvELXUYCr6drdQxbrR3cgUfMXC17rjtQIkbVefGmzpQqOFijBj
         rJZyitQOJMkBluXBPaBz93vUn3xo3O1kLhcHpkXqsd7G47iGcJnZRHV2jr/UsmLn267t
         //c0bKEsu/I7OnpiApOaN+2jQFdBHVEhsm6CHjQmLoQhqsQL+KkAs3PQ9Rl4hvEKbQV3
         u4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:reply-to:organization;
        bh=NgDDGgZtb97xAaWPnHFCZOrz79R3I48yY4vXuOvjxZs=;
        b=ALj/uvyFalIvi/qHTBRqLSE2kRyiIRV8tWrhCzy688EaDYYIaXe1VUtmKmiOnekpz7
         UOWAajyygNm6jU+Uz5Mi7ZLCX//MlZOYNlpNXKwc5CyE/NyiHYbPAhIYvsrLjUCSfdJq
         cKzgxCcw4iG+o9RCjQx6HBdHcobsXRFtOpwJLR+DfquKArIZ7oWMnloc9/VoutUoAtO/
         /Pnrsixcj5CLZScfDiXdj01/Vkkxm4R5ZKUzLAFWdsql6pQ7J3pfPq7cLBjFz2XLWoks
         fnrXe6obOI+y5flfDvUhmX29TEGJPof8zY+J7E4YITeDph0IYgiwrqe05ltUQMj4M19R
         sbsA==
X-Gm-Message-State: AHQUAubixA5E8U7ANe7kq1DTN+NqouYkgQmgWw1esYXj2AD5f9COLtcJ
        +NNfs3XrFBFjxN4+CdK9j0LTJm0y
X-Google-Smtp-Source: AHgI3IYXUNIs1dCE5Kgv//nolH0OLj/yhikmDfsXlr+/WJNLVcRPEt/drmJYNSz4zCauZV3CFDionQ==
X-Received: by 2002:a0c:9ad4:: with SMTP id k20mr18752981qvf.220.1550546595430;
        Mon, 18 Feb 2019 19:23:15 -0800 (PST)
Received: from kbl.fios-router.home (pool-96-233-42-17.bstnma.fios.verizon.net. [96.233.42.17])
        by smtp.gmail.com with ESMTPSA id l31sm205282qtb.20.2019.02.18.19.23.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Feb 2019 19:23:14 -0800 (PST)
From:   Len Brown <lenb@kernel.org>
X-Google-Original-From: Len Brown <len.brown@intel.com>
To:     linux-drivers-review@linux.intel.com
Cc:     linux-doc@vger.kernel.org
Subject: [PATCH 04/11] cpu topology: export die_id
Date:   Mon, 18 Feb 2019 22:22:52 -0500
Message-Id: <a1faeb72345227a49aae0475abf910421dc40a1c.1550545163.git.len.brown@intel.com>
X-Mailer: git-send-email 2.18.0-rc0
In-Reply-To: <635b2bf8b1151a191cd9299276b75791a818c0c2.1550545163.git.len.brown@intel.com>
References: <635b2bf8b1151a191cd9299276b75791a818c0c2.1550545163.git.len.brown@intel.com>
Reply-To: Len Brown <lenb@kernel.org>
Organization: Intel Open Source Technology Center
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Export die_id in cpu topology, for the benefit of hardware that
has multiple die per package.  die_id is quite similar to core_id,
in that it holds multiple CPUs, but is inside a package.

This needed by topology-aware user-space.  In particular,
an application, such as turbostat(8), which needs to know
the actual scope of "package-scope" MSRs.

Signed-off-by: Len Brown <len.brown@intel.com>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Len Brown <len.brown@intel.com>
---
 Documentation/cputopology.txt   | 10 ++++++++--
 arch/x86/include/asm/topology.h |  1 +
 drivers/base/topology.c         |  4 ++++
 include/linux/topology.h        |  3 +++
 4 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/cputopology.txt b/Documentation/cputopology.txt
index 2698da7e4f49..287213b4517b 100644
--- a/Documentation/cputopology.txt
+++ b/Documentation/cputopology.txt
@@ -12,6 +12,12 @@ physical_package_id:
 	socket number, but the actual value is architecture and platform
 	dependent.
 
+die_id:
+
+	the CPU die ID of cpuX. Typically it is the hardware platform's
+	identifier (rather than the kernel's).  The actual value is
+	architecture and platform dependent.
+
 core_id:
 
 	the CPU core ID of cpuX. Typically it is the hardware platform's
@@ -43,12 +49,12 @@ thread_siblings_list:
 core_siblings:
 
 	internal kernel map of cpuX's hardware threads within the same
-	physical_package_id.
+	die_id.
 
 core_siblings_list:
 
 	human-readable list of cpuX's hardware threads within the same
-	physical_package_id.
+	die_id.
 
 book_siblings:
 
diff --git a/arch/x86/include/asm/topology.h b/arch/x86/include/asm/topology.h
index 453cf38a1c33..281be6bbc80d 100644
--- a/arch/x86/include/asm/topology.h
+++ b/arch/x86/include/asm/topology.h
@@ -106,6 +106,7 @@ extern const struct cpumask *cpu_coregroup_mask(int cpu);
 
 #define topology_logical_package_id(cpu)	(cpu_data(cpu).logical_proc_id)
 #define topology_physical_package_id(cpu)	(cpu_data(cpu).phys_proc_id)
+#define topology_die_id(cpu)			(cpu_data(cpu).cpu_die_id)
 #define topology_core_id(cpu)			(cpu_data(cpu).cpu_core_id)
 
 #ifdef CONFIG_SMP
diff --git a/drivers/base/topology.c b/drivers/base/topology.c
index 5fd9f167ecc1..50352cf96f85 100644
--- a/drivers/base/topology.c
+++ b/drivers/base/topology.c
@@ -43,6 +43,9 @@ static ssize_t name##_list_show(struct device *dev,			\
 define_id_show_func(physical_package_id);
 static DEVICE_ATTR_RO(physical_package_id);
 
+define_id_show_func(die_id);
+static DEVICE_ATTR_RO(die_id);
+
 define_id_show_func(core_id);
 static DEVICE_ATTR_RO(core_id);
 
@@ -72,6 +75,7 @@ static DEVICE_ATTR_RO(drawer_siblings_list);
 
 static struct attribute *default_attrs[] = {
 	&dev_attr_physical_package_id.attr,
+	&dev_attr_die_id.attr,
 	&dev_attr_core_id.attr,
 	&dev_attr_thread_siblings.attr,
 	&dev_attr_thread_siblings_list.attr,
diff --git a/include/linux/topology.h b/include/linux/topology.h
index cb0775e1ee4b..5cc8595dd0e4 100644
--- a/include/linux/topology.h
+++ b/include/linux/topology.h
@@ -184,6 +184,9 @@ static inline int cpu_to_mem(int cpu)
 #ifndef topology_physical_package_id
 #define topology_physical_package_id(cpu)	((void)(cpu), -1)
 #endif
+#ifndef topology_die_id
+#define topology_die_id(cpu)			((void)(cpu), -1)
+#endif
 #ifndef topology_core_id
 #define topology_core_id(cpu)			((void)(cpu), 0)
 #endif
-- 
2.18.0-rc0

