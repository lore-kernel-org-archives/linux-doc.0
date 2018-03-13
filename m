Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0CBD17E686
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Mar 2018 12:56:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752252AbeCMM4R (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Mar 2018 08:56:17 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:50748 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752662AbeCMMz3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Mar 2018 08:55:29 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w2DCsdPS103625
        for <linux-doc@vger.kernel.org>; Tue, 13 Mar 2018 08:55:29 -0400
Received: from e06smtp14.uk.ibm.com (e06smtp14.uk.ibm.com [195.75.94.110])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2gpdf9cv9x-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Tue, 13 Mar 2018 08:55:28 -0400
Received: from localhost
        by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <ravi.bangoria@linux.vnet.ibm.com>;
        Tue, 13 Mar 2018 12:55:22 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
        by e06smtp14.uk.ibm.com (192.168.101.144) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Tue, 13 Mar 2018 12:55:14 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w2DCtDXE54722652;
        Tue, 13 Mar 2018 12:55:13 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3CAE811C04C;
        Tue, 13 Mar 2018 12:47:53 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C61DB11C052;
        Tue, 13 Mar 2018 12:47:40 +0000 (GMT)
Received: from bangoria.in.ibm.com (unknown [9.124.221.140])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Tue, 13 Mar 2018 12:47:40 +0000 (GMT)
From:   Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
To:     mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org,
        srikar@linux.vnet.ibm.com
Cc:     acme@kernel.org, ananth@linux.vnet.ibm.com,
        akpm@linux-foundation.org, alexander.shishkin@linux.intel.com,
        alexis.berlemont@gmail.com, corbet@lwn.net,
        dan.j.williams@intel.com, gregkh@linuxfoundation.org,
        huawei.libin@huawei.com, hughd@google.com, jack@suse.cz,
        jglisse@redhat.com, jolsa@redhat.com, kan.liang@intel.com,
        kirill.shutemov@linux.intel.com, kjlx@templeofstupid.com,
        kstewart@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, mhocko@suse.com,
        milian.wolff@kdab.com, mingo@redhat.com, namhyung@kernel.org,
        naveen.n.rao@linux.vnet.ibm.com, pc@us.ibm.com,
        pombredanne@nexb.com, rostedt@goodmis.org, tglx@linutronix.de,
        tmricht@linux.vnet.ibm.com, willy@infradead.org,
        yao.jin@linux.intel.com, fengguang.wu@intel.com,
        Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
Subject: [PATCH 6/8] trace_uprobe/sdt: Fix multiple update of same reference counter
Date:   Tue, 13 Mar 2018 18:26:01 +0530
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180313125603.19819-1-ravi.bangoria@linux.vnet.ibm.com>
References: <20180313125603.19819-1-ravi.bangoria@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18031312-0016-0000-0000-00000530FAEA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18031312-0017-0000-0000-0000286E2CCD
Message-Id: <20180313125603.19819-7-ravi.bangoria@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:,, definitions=2018-03-13_06:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803130154
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

For tiny binaries/libraries, different mmap regions points to the
same file portion. In such cases, we may increment reference counter
multiple times. But while de-registration, reference counter will get
decremented only by once leaving reference counter > 0 even if no one
is tracing on that marker.

Ensure increment and decrement happens in sync by keeping list of
mms in trace_uprobe. Increment reference counter only if mm is not
present in the list and decrement only if mm is present in the list.

Example

  # echo "p:sdt_tick/loop2 /tmp/tick:0x6e4(0x10036)" > uprobe_events

Before patch:

  # perf stat -a -e sdt_tick:loop2
  # /tmp/tick
  # dd if=/proc/`pgrep tick`/mem bs=1 count=1 skip=$(( 0x10020036 )) 2>/dev/null | xxd
   0000000: 02                                       .

  # pkill perf
  # dd if=/proc/`pgrep tick`/mem bs=1 count=1 skip=$(( 0x10020036 )) 2>/dev/null | xxd
  0000000: 01                                       .

After patch:

  # perf stat -a -e sdt_tick:loop2
  # /tmp/tick
  # dd if=/proc/`pgrep tick`/mem bs=1 count=1 skip=$(( 0x10020036 )) 2>/dev/null | xxd
  0000000: 01                                       .

  # pkill perf
  # dd if=/proc/`pgrep tick`/mem bs=1 count=1 skip=$(( 0x10020036 )) 2>/dev/null | xxd
  0000000: 00                                       .

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
---
 kernel/trace/trace_uprobe.c | 105 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 103 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/trace_uprobe.c b/kernel/trace/trace_uprobe.c
index b6c9b48..9bf3f7a 100644
--- a/kernel/trace/trace_uprobe.c
+++ b/kernel/trace/trace_uprobe.c
@@ -50,6 +50,11 @@ struct trace_uprobe_filter {
 	struct list_head	perf_events;
 };
 
+struct sdt_mm_list {
+	struct mm_struct *mm;
+	struct sdt_mm_list *next;
+};
+
 /*
  * uprobe event core functions
  */
@@ -61,6 +66,8 @@ struct trace_uprobe {
 	char				*filename;
 	unsigned long			offset;
 	unsigned long			ref_ctr_offset;
+	struct sdt_mm_list		*sml;
+	struct rw_semaphore		sml_rw_sem;
 	unsigned long			nhit;
 	struct trace_probe		tp;
 };
@@ -274,6 +281,7 @@ static inline bool is_ret_probe(struct trace_uprobe *tu)
 	if (is_ret)
 		tu->consumer.ret_handler = uretprobe_dispatcher;
 	init_trace_uprobe_filter(&tu->filter);
+	init_rwsem(&tu->sml_rw_sem);
 	return tu;
 
 error:
@@ -921,6 +929,74 @@ static void uretprobe_trace_func(struct trace_uprobe *tu, unsigned long func,
 	return trace_handle_return(s);
 }
 
+static bool sdt_check_mm_list(struct trace_uprobe *tu, struct mm_struct *mm)
+{
+	struct sdt_mm_list *tmp = tu->sml;
+
+	if (!tu->sml || !mm)
+		return false;
+
+	while (tmp) {
+		if (tmp->mm == mm)
+			return true;
+		tmp = tmp->next;
+	}
+
+	return false;
+}
+
+static void sdt_add_mm_list(struct trace_uprobe *tu, struct mm_struct *mm)
+{
+	struct sdt_mm_list *tmp;
+
+	tmp = kzalloc(sizeof(*tmp), GFP_KERNEL);
+	if (!tmp)
+		return;
+
+	tmp->mm = mm;
+	tmp->next = tu->sml;
+	tu->sml = tmp;
+}
+
+static void sdt_del_mm_list(struct trace_uprobe *tu, struct mm_struct *mm)
+{
+	struct sdt_mm_list *prev, *curr;
+
+	if (!tu->sml)
+		return;
+
+	if (tu->sml->mm == mm) {
+		curr = tu->sml;
+		tu->sml = tu->sml->next;
+		kfree(curr);
+		return;
+	}
+
+	prev = tu->sml;
+	curr = tu->sml->next;
+	while (curr) {
+		if (curr->mm == mm) {
+			prev->next = curr->next;
+			kfree(curr);
+			return;
+		}
+		prev = curr;
+		curr = curr->next;
+	}
+}
+
+static void sdt_flush_mm_list(struct trace_uprobe *tu)
+{
+	struct sdt_mm_list *next, *curr = tu->sml;
+
+	while (curr) {
+		next = curr->next;
+		kfree(curr);
+		curr = next;
+	}
+	tu->sml = NULL;
+}
+
 static bool sdt_valid_vma(struct trace_uprobe *tu, struct vm_area_struct *vma)
 {
 	unsigned long vaddr = vma_offset_to_vaddr(vma, tu->ref_ctr_offset);
@@ -989,17 +1065,25 @@ static void sdt_increment_ref_ctr(struct trace_uprobe *tu)
 	if (IS_ERR(info))
 		goto out;
 
+	down_write(&tu->sml_rw_sem);
 	while (info) {
+		if (sdt_check_mm_list(tu, info->mm))
+			goto cont;
+
 		down_write(&info->mm->mmap_sem);
 
 		vma = sdt_find_vma(info->mm, tu);
 		vaddr = vma_offset_to_vaddr(vma, tu->ref_ctr_offset);
-		sdt_update_ref_ctr(info->mm, vaddr, 1);
+		if (!sdt_update_ref_ctr(info->mm, vaddr, 1))
+			sdt_add_mm_list(tu, info->mm);
 
 		up_write(&info->mm->mmap_sem);
+
+cont:
 		mmput(info->mm);
 		info = uprobe_free_map_info(info);
 	}
+	up_write(&tu->sml_rw_sem);
 
 out:
 	uprobe_end_dup_mmap();
@@ -1020,8 +1104,16 @@ void trace_uprobe_mmap_callback(struct vm_area_struct *vma)
 		    !trace_probe_is_enabled(&tu->tp))
 			continue;
 
+		down_write(&tu->sml_rw_sem);
+		if (sdt_check_mm_list(tu, vma->vm_mm))
+			goto cont;
+
 		vaddr = vma_offset_to_vaddr(vma, tu->ref_ctr_offset);
-		sdt_update_ref_ctr(vma->vm_mm, vaddr, 1);
+		if (!sdt_update_ref_ctr(vma->vm_mm, vaddr, 1))
+			sdt_add_mm_list(tu, vma->vm_mm);
+
+cont:
+		up_write(&tu->sml_rw_sem);
 	}
 	mutex_unlock(&uprobe_lock);
 }
@@ -1038,7 +1130,11 @@ static void sdt_decrement_ref_ctr(struct trace_uprobe *tu)
 	if (IS_ERR(info))
 		goto out;
 
+	down_write(&tu->sml_rw_sem);
 	while (info) {
+		if (!sdt_check_mm_list(tu, info->mm))
+			goto cont;
+
 		down_write(&info->mm->mmap_sem);
 
 		vma = sdt_find_vma(info->mm, tu);
@@ -1046,9 +1142,14 @@ static void sdt_decrement_ref_ctr(struct trace_uprobe *tu)
 		sdt_update_ref_ctr(info->mm, vaddr, -1);
 
 		up_write(&info->mm->mmap_sem);
+		sdt_del_mm_list(tu, info->mm);
+
+cont:
 		mmput(info->mm);
 		info = uprobe_free_map_info(info);
 	}
+	sdt_flush_mm_list(tu);
+	up_write(&tu->sml_rw_sem);
 
 out:
 	uprobe_end_dup_mmap();
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
