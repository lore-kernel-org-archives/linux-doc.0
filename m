Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4EFA07DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 May 2018 00:46:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933356AbeEIAp4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 8 May 2018 20:45:56 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:40736 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S933486AbeEIAnN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 May 2018 20:43:13 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w490dUEt079603
        for <linux-doc@vger.kernel.org>; Tue, 8 May 2018 20:43:13 -0400
Received: from e06smtp14.uk.ibm.com (e06smtp14.uk.ibm.com [195.75.94.110])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2huknnqas8-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Tue, 08 May 2018 20:43:12 -0400
Received: from localhost
        by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <alastair@au1.ibm.com>;
        Wed, 9 May 2018 01:43:10 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
        by e06smtp14.uk.ibm.com (192.168.101.144) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Wed, 9 May 2018 01:43:06 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w490h5Gg8782084;
        Wed, 9 May 2018 00:43:05 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 423A84204C;
        Wed,  9 May 2018 01:34:08 +0100 (BST)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9E3F74205C;
        Wed,  9 May 2018 01:34:07 +0100 (BST)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Wed,  9 May 2018 01:34:07 +0100 (BST)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6F59EA030E;
        Wed,  9 May 2018 10:43:03 +1000 (AEST)
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
Subject: [PATCH v3 3/7] powerpc: use task_pid_nr() for TID allocation
Date:   Wed,  9 May 2018 10:42:08 +1000
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180509004212.4506-1-alastair@au1.ibm.com>
References: <20180417020950.21446-1-alastair@au1.ibm.com>
 <20180509004212.4506-1-alastair@au1.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18050900-0044-0000-0000-000005508D36
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18050900-0045-0000-0000-00002891D182
Message-Id: <20180509004212.4506-4-alastair@au1.ibm.com>
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-05-08_08:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805090005
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Alastair D'Silva <alastair@d-silva.org>

The current implementation of TID allocation, using a global IDR, may
result in an errant process starving the system of available TIDs.
Instead, use task_pid_nr(), as mentioned by the original author. The
scenario described which prevented it's use is not applicable, as
set_thread_tidr can only be called after the task struct has been
populated.

In the unlikely event that 2 threads share the TID and are waiting,
one of the following cases will happen:

1. The correct thread is running, the wrong thread is not
In this situation, the correct thread is woken and proceeds to pass it's
condition check.

2. Neither threads are running
In this situation, neither thread will be woken. When scheduled, the waiting
threads will execute either a wait, which will return immediately, followed
by a condition check, which will pass for the correct thread and fail
for the wrong thread, or they will execute the condition check immediately.

3. The wrong thread is running, the correct thread is not
The wrong thread will be woken, but will fail it's condition check and
re-execute wait. The correct thread, when scheduled, will execute either
it's condition check (which will pass), or wait, which returns immediately
when called the first time after the thread is scheduled, followed by it's
condition check (which will pass).

4. Both threads are running
Both threads will be woken. The wrong thread will fail it's condition check
and execute another wait, while the correct thread will pass it's condition
check.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 arch/powerpc/include/asm/switch_to.h |  1 -
 arch/powerpc/kernel/process.c        | 97 +-----------------------------------
 2 files changed, 1 insertion(+), 97 deletions(-)

diff --git a/arch/powerpc/include/asm/switch_to.h b/arch/powerpc/include/asm/switch_to.h
index be8c9fa23983..5b03d8a82409 100644
--- a/arch/powerpc/include/asm/switch_to.h
+++ b/arch/powerpc/include/asm/switch_to.h
@@ -94,6 +94,5 @@ static inline void clear_task_ebb(struct task_struct *t)
 extern int set_thread_uses_vas(void);
 
 extern int set_thread_tidr(struct task_struct *t);
-extern void clear_thread_tidr(struct task_struct *t);
 
 #endif /* _ASM_POWERPC_SWITCH_TO_H */
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 3b00da47699b..87f047fd2762 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1496,103 +1496,12 @@ int set_thread_uses_vas(void)
 }
 
 #ifdef CONFIG_PPC64
-static DEFINE_SPINLOCK(vas_thread_id_lock);
-static DEFINE_IDA(vas_thread_ida);
-
-/*
- * We need to assign a unique thread id to each thread in a process.
- *
- * This thread id, referred to as TIDR, and separate from the Linux's tgid,
- * is intended to be used to direct an ASB_Notify from the hardware to the
- * thread, when a suitable event occurs in the system.
- *
- * One such event is a "paste" instruction in the context of Fast Thread
- * Wakeup (aka Core-to-core wake up in the Virtual Accelerator Switchboard
- * (VAS) in POWER9.
- *
- * To get a unique TIDR per process we could simply reuse task_pid_nr() but
- * the problem is that task_pid_nr() is not yet available copy_thread() is
- * called. Fixing that would require changing more intrusive arch-neutral
- * code in code path in copy_process()?.
- *
- * Further, to assign unique TIDRs within each process, we need an atomic
- * field (or an IDR) in task_struct, which again intrudes into the arch-
- * neutral code. So try to assign globally unique TIDRs for now.
- *
- * NOTE: TIDR 0 indicates that the thread does not need a TIDR value.
- *	 For now, only threads that expect to be notified by the VAS
- *	 hardware need a TIDR value and we assign values > 0 for those.
- */
-#define MAX_THREAD_CONTEXT	((1 << 16) - 1)
-static int assign_thread_tidr(void)
-{
-	int index;
-	int err;
-	unsigned long flags;
-
-again:
-	if (!ida_pre_get(&vas_thread_ida, GFP_KERNEL))
-		return -ENOMEM;
-
-	spin_lock_irqsave(&vas_thread_id_lock, flags);
-	err = ida_get_new_above(&vas_thread_ida, 1, &index);
-	spin_unlock_irqrestore(&vas_thread_id_lock, flags);
-
-	if (err == -EAGAIN)
-		goto again;
-	else if (err)
-		return err;
-
-	if (index > MAX_THREAD_CONTEXT) {
-		spin_lock_irqsave(&vas_thread_id_lock, flags);
-		ida_remove(&vas_thread_ida, index);
-		spin_unlock_irqrestore(&vas_thread_id_lock, flags);
-		return -ENOMEM;
-	}
-
-	return index;
-}
-
-static void free_thread_tidr(int id)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&vas_thread_id_lock, flags);
-	ida_remove(&vas_thread_ida, id);
-	spin_unlock_irqrestore(&vas_thread_id_lock, flags);
-}
-
-/*
- * Clear any TIDR value assigned to this thread.
- */
-void clear_thread_tidr(struct task_struct *t)
-{
-	if (!t->thread.tidr)
-		return;
-
-	if (!cpu_has_feature(CPU_FTR_P9_TIDR)) {
-		WARN_ON_ONCE(1);
-		return;
-	}
-
-	mtspr(SPRN_TIDR, 0);
-	free_thread_tidr(t->thread.tidr);
-	t->thread.tidr = 0;
-}
-
-void arch_release_task_struct(struct task_struct *t)
-{
-	clear_thread_tidr(t);
-}
-
 /*
  * Assign a unique TIDR (thread id) for task @t and set it in the thread
  * structure. For now, we only support setting TIDR for 'current' task.
  */
 int set_thread_tidr(struct task_struct *t)
 {
-	int rc;
-
 	if (!cpu_has_feature(CPU_FTR_P9_TIDR))
 		return -EINVAL;
 
@@ -1602,11 +1511,7 @@ int set_thread_tidr(struct task_struct *t)
 	if (t->thread.tidr)
 		return 0;
 
-	rc = assign_thread_tidr();
-	if (rc < 0)
-		return rc;
-
-	t->thread.tidr = rc;
+	t->thread.tidr = (u16)task_pid_nr(t);
 	mtspr(SPRN_TIDR, t->thread.tidr);
 
 	return 0;
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
