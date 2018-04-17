Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 482EA7DE74
	for <lwn-linux-doc@archive.lwn.net>; Tue, 17 Apr 2018 02:12:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752532AbeDQCMm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 16 Apr 2018 22:12:42 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45918 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752848AbeDQCLM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Apr 2018 22:11:12 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w3H2A0ZO125861
        for <linux-doc@vger.kernel.org>; Mon, 16 Apr 2018 22:11:11 -0400
Received: from e06smtp11.uk.ibm.com (e06smtp11.uk.ibm.com [195.75.94.107])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2hd5eewa2s-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Mon, 16 Apr 2018 22:11:11 -0400
Received: from localhost
        by e06smtp11.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <alastair@au1.ibm.com>;
        Tue, 17 Apr 2018 03:11:09 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp11.uk.ibm.com (192.168.101.141) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Tue, 17 Apr 2018 03:11:07 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w3H2B6jO10944770;
        Tue, 17 Apr 2018 02:11:06 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 8FC214204D;
        Tue, 17 Apr 2018 03:02:40 +0100 (BST)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id EDDF44203F;
        Tue, 17 Apr 2018 03:02:39 +0100 (BST)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Tue, 17 Apr 2018 03:02:39 +0100 (BST)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 73E82A02A1;
        Tue, 17 Apr 2018 12:11:04 +1000 (AEST)
From:   "Alastair D'Silva" <alastair@au1.ibm.com>
To:     linuxppc-dev@lists.ozlabs.org
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        mikey@neuling.org, vaibhav@linux.vnet.ibm.com,
        aneesh.kumar@linux.vnet.ibm.com, malat@debian.org,
        felix@linux.vnet.ibm.com, pombredanne@nexb.com,
        sukadev@linux.vnet.ibm.com, npiggin@gmail.com,
        gregkh@linuxfoundation.org, arnd@arndb.de,
        andrew.donnellan@au1.ibm.com, fbarrat@linux.vnet.ibm.com,
        corbet@lwn.net, "Alastair D'Silva" <alastair@d-silva.org>
Subject: [PATCH 5/7] ocxl: Expose the thread_id needed for wait on p9
Date:   Tue, 17 Apr 2018 12:09:48 +1000
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180417020950.21446-1-alastair@au1.ibm.com>
References: <20180417020950.21446-1-alastair@au1.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18041702-0040-0000-0000-0000044E4B85
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18041702-0041-0000-0000-000020F2902A
Message-Id: <20180417020950.21446-6-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-04-17_01:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=4 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804170020
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Alastair D'Silva <alastair@d-silva.org>

In order to successfully issue as_notify, an AFU needs to know the TID
to notify, which in turn means that this information should be
available in userspace so it can be communicated to the AFU.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/misc/ocxl/context.c       |  5 +++-
 drivers/misc/ocxl/file.c          | 53 +++++++++++++++++++++++++++++++++++++++
 drivers/misc/ocxl/link.c          | 36 ++++++++++++++++++++++++++
 drivers/misc/ocxl/ocxl_internal.h |  1 +
 include/misc/ocxl.h               |  9 +++++++
 include/uapi/misc/ocxl.h          | 10 ++++++++
 6 files changed, 113 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/ocxl/context.c b/drivers/misc/ocxl/context.c
index 909e8807824a..95f74623113e 100644
--- a/drivers/misc/ocxl/context.c
+++ b/drivers/misc/ocxl/context.c
@@ -34,6 +34,8 @@ int ocxl_context_init(struct ocxl_context *ctx, struct ocxl_afu *afu,
 	mutex_init(&ctx->xsl_error_lock);
 	mutex_init(&ctx->irq_lock);
 	idr_init(&ctx->irq_idr);
+	ctx->tidr = 0;
+
 	/*
 	 * Keep a reference on the AFU to make sure it's valid for the
 	 * duration of the life of the context
@@ -65,6 +67,7 @@ int ocxl_context_attach(struct ocxl_context *ctx, u64 amr)
 {
 	int rc;
 
+	// Locks both status & tidr
 	mutex_lock(&ctx->status_mutex);
 	if (ctx->status != OPENED) {
 		rc = -EIO;
@@ -72,7 +75,7 @@ int ocxl_context_attach(struct ocxl_context *ctx, u64 amr)
 	}
 
 	rc = ocxl_link_add_pe(ctx->afu->fn->link, ctx->pasid,
-			current->mm->context.id, 0, amr, current->mm,
+			current->mm->context.id, ctx->tidr, amr, current->mm,
 			xsl_fault_error, ctx);
 	if (rc)
 		goto out;
diff --git a/drivers/misc/ocxl/file.c b/drivers/misc/ocxl/file.c
index 038509e5d031..eb409a469f21 100644
--- a/drivers/misc/ocxl/file.c
+++ b/drivers/misc/ocxl/file.c
@@ -5,6 +5,8 @@
 #include <linux/sched/signal.h>
 #include <linux/uaccess.h>
 #include <uapi/misc/ocxl.h>
+#include <asm/reg.h>
+#include <asm/switch_to.h>
 #include "ocxl_internal.h"
 
 
@@ -123,11 +125,55 @@ static long afu_ioctl_get_metadata(struct ocxl_context *ctx,
 	return 0;
 }
 
+#ifdef CONFIG_PPC64
+static long afu_ioctl_enable_p9_wait(struct ocxl_context *ctx,
+		struct ocxl_ioctl_p9_wait __user *uarg)
+{
+	struct ocxl_ioctl_p9_wait arg;
+
+	memset(&arg, 0, sizeof(arg));
+
+	if (cpu_has_feature(CPU_FTR_P9_TIDR)) {
+		enum ocxl_context_status status;
+
+		// Locks both status & tidr
+		mutex_lock(&ctx->status_mutex);
+		if (!ctx->tidr) {
+			if (set_thread_tidr(current))
+				return -ENOENT;
+
+			ctx->tidr = current->thread.tidr;
+		}
+
+		status = ctx->status;
+		mutex_unlock(&ctx->status_mutex);
+
+		if (status == ATTACHED) {
+			int rc;
+			struct link *link = ctx->afu->fn->link;
+
+			rc = ocxl_link_update_pe(link, ctx->pasid, ctx->tidr);
+			if (rc)
+				return rc;
+		}
+
+		arg.thread_id = ctx->tidr;
+	} else
+		return -ENOENT;
+
+	if (copy_to_user(uarg, &arg, sizeof(arg)))
+		return -EFAULT;
+
+	return 0;
+}
+#endif
+
 #define CMD_STR(x) (x == OCXL_IOCTL_ATTACH ? "ATTACH" :			\
 			x == OCXL_IOCTL_IRQ_ALLOC ? "IRQ_ALLOC" :	\
 			x == OCXL_IOCTL_IRQ_FREE ? "IRQ_FREE" :		\
 			x == OCXL_IOCTL_IRQ_SET_FD ? "IRQ_SET_FD" :	\
 			x == OCXL_IOCTL_GET_METADATA ? "GET_METADATA" :	\
+			x == OCXL_IOCTL_ENABLE_P9_WAIT ? "ENABLE_P9_WAIT" :	\
 			"UNKNOWN")
 
 static long afu_ioctl(struct file *file, unsigned int cmd,
@@ -186,6 +232,13 @@ static long afu_ioctl(struct file *file, unsigned int cmd,
 				(struct ocxl_ioctl_metadata __user *) args);
 		break;
 
+#ifdef CONFIG_PPC64
+	case OCXL_IOCTL_ENABLE_P9_WAIT:
+		rc = afu_ioctl_enable_p9_wait(ctx,
+				(struct ocxl_ioctl_p9_wait __user *) args);
+		break;
+#endif
+
 	default:
 		rc = -EINVAL;
 	}
diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
index 656e8610eec2..88876ae8f330 100644
--- a/drivers/misc/ocxl/link.c
+++ b/drivers/misc/ocxl/link.c
@@ -544,6 +544,42 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
 }
 EXPORT_SYMBOL_GPL(ocxl_link_add_pe);
 
+int ocxl_link_update_pe(void *link_handle, int pasid, __u16 tid)
+{
+	struct link *link = (struct link *) link_handle;
+	struct spa *spa = link->spa;
+	struct ocxl_process_element *pe;
+	int pe_handle, rc;
+
+	if (pasid > SPA_PASID_MAX)
+		return -EINVAL;
+
+	pe_handle = pasid & SPA_PE_MASK;
+	pe = spa->spa_mem + pe_handle;
+
+	mutex_lock(&spa->spa_lock);
+
+	pe->tid = tid;
+
+	/*
+	 * The barrier makes sure the PE is updated
+	 * before we clear the NPU context cache below, so that the
+	 * old PE cannot be reloaded erroneously.
+	 */
+	mb();
+
+	/*
+	 * hook to platform code
+	 * On powerpc, the entry needs to be cleared from the context
+	 * cache of the NPU.
+	 */
+	rc = pnv_ocxl_spa_remove_pe_from_cache(link->platform_data, pe_handle);
+	WARN_ON(rc);
+
+	mutex_unlock(&spa->spa_lock);
+	return rc;
+}
+
 int ocxl_link_remove_pe(void *link_handle, int pasid)
 {
 	struct link *link = (struct link *) link_handle;
diff --git a/drivers/misc/ocxl/ocxl_internal.h b/drivers/misc/ocxl/ocxl_internal.h
index 5d421824afd9..6c6d4e61888e 100644
--- a/drivers/misc/ocxl/ocxl_internal.h
+++ b/drivers/misc/ocxl/ocxl_internal.h
@@ -77,6 +77,7 @@ struct ocxl_context {
 	struct ocxl_xsl_error xsl_error;
 	struct mutex irq_lock;
 	struct idr irq_idr;
+	__u16 tidr; // Thread ID used for P9 wait implementation
 };
 
 struct ocxl_process_element {
diff --git a/include/misc/ocxl.h b/include/misc/ocxl.h
index 51ccf76db293..9ff6ddc28e22 100644
--- a/include/misc/ocxl.h
+++ b/include/misc/ocxl.h
@@ -188,6 +188,15 @@ extern int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
 		void (*xsl_err_cb)(void *data, u64 addr, u64 dsisr),
 		void *xsl_err_data);
 
+/**
+ * Update values within a Process Element
+ *
+ * link_handle: the link handle associated with the process element
+ * pasid: the PASID for the AFU context
+ * tid: the new thread id for the process element
+ */
+extern int ocxl_link_update_pe(void *link_handle, int pasid, __u16 tid);
+
 /*
  * Remove a Process Element from the Shared Process Area for a link
  */
diff --git a/include/uapi/misc/ocxl.h b/include/uapi/misc/ocxl.h
index 0af83d80fb3e..8d2748e69c84 100644
--- a/include/uapi/misc/ocxl.h
+++ b/include/uapi/misc/ocxl.h
@@ -48,6 +48,15 @@ struct ocxl_ioctl_metadata {
 	__u64 reserved[13]; // Total of 16*u64
 };
 
+struct ocxl_ioctl_p9_wait {
+	__u16 thread_id; // The thread ID required to wake this thread
+	__u16 reserved1;
+	__u32 reserved2;
+	__u64 reserved3[3];
+};
+
+};
+
 struct ocxl_ioctl_irq_fd {
 	__u64 irq_offset;
 	__s32 eventfd;
@@ -62,5 +71,6 @@ struct ocxl_ioctl_irq_fd {
 #define OCXL_IOCTL_IRQ_FREE	_IOW(OCXL_MAGIC, 0x12, __u64)
 #define OCXL_IOCTL_IRQ_SET_FD	_IOW(OCXL_MAGIC, 0x13, struct ocxl_ioctl_irq_fd)
 #define OCXL_IOCTL_GET_METADATA _IOR(OCXL_MAGIC, 0x14, struct ocxl_ioctl_metadata)
+#define OCXL_IOCTL_ENABLE_P9_WAIT	_IOR(OCXL_MAGIC, 0x15, struct ocxl_ioctl_p9_wait)
 
 #endif /* _UAPI_MISC_OCXL_H */
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
