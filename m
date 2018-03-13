Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 99C487E686
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Mar 2018 12:54:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752254AbeCMMy7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Mar 2018 08:54:59 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40874 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752240AbeCMMy6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Mar 2018 08:54:58 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w2DCsbha099613
        for <linux-doc@vger.kernel.org>; Tue, 13 Mar 2018 08:54:58 -0400
Received: from e06smtp14.uk.ibm.com (e06smtp14.uk.ibm.com [195.75.94.110])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2gpeft9t80-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Tue, 13 Mar 2018 08:54:57 -0400
Received: from localhost
        by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <ravi.bangoria@linux.vnet.ibm.com>;
        Tue, 13 Mar 2018 12:54:54 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp14.uk.ibm.com (192.168.101.144) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Tue, 13 Mar 2018 12:54:46 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w2DCskbn65929280;
        Tue, 13 Mar 2018 12:54:46 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id EDB2811C052;
        Tue, 13 Mar 2018 12:47:25 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7692311C04C;
        Tue, 13 Mar 2018 12:47:14 +0000 (GMT)
Received: from bangoria.in.ibm.com (unknown [9.124.221.140])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Tue, 13 Mar 2018 12:47:14 +0000 (GMT)
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
Subject: [PATCH 4/8] Uprobe: Export uprobe_map_info along with uprobe_{build/free}_map_info()
Date:   Tue, 13 Mar 2018 18:25:59 +0530
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180313125603.19819-1-ravi.bangoria@linux.vnet.ibm.com>
References: <20180313125603.19819-1-ravi.bangoria@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18031312-0016-0000-0000-00000530FAD7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18031312-0017-0000-0000-0000286E2CB6
Message-Id: <20180313125603.19819-5-ravi.bangoria@linux.vnet.ibm.com>
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

These exported data structure and functions will be used by other
files in later patches.

No functionality changes.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
---
 include/linux/uprobes.h |  9 +++++++++
 kernel/events/uprobes.c | 14 +++-----------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/include/linux/uprobes.h b/include/linux/uprobes.h
index 0a294e9..7bd2760 100644
--- a/include/linux/uprobes.h
+++ b/include/linux/uprobes.h
@@ -109,12 +109,19 @@ enum rp_check {
 	RP_CHECK_RET,
 };
 
+struct address_space;
 struct xol_area;
 
 struct uprobes_state {
 	struct xol_area		*xol_area;
 };
 
+struct uprobe_map_info {
+	struct uprobe_map_info *next;
+	struct mm_struct *mm;
+	unsigned long vaddr;
+};
+
 extern int set_swbp(struct arch_uprobe *aup, struct mm_struct *mm, unsigned long vaddr);
 extern int set_orig_insn(struct arch_uprobe *aup, struct mm_struct *mm, unsigned long vaddr);
 extern bool is_swbp_insn(uprobe_opcode_t *insn);
@@ -149,6 +156,8 @@ struct uprobes_state {
 extern bool arch_uprobe_ignore(struct arch_uprobe *aup, struct pt_regs *regs);
 extern void arch_uprobe_copy_ixol(struct page *page, unsigned long vaddr,
 					 void *src, unsigned long len);
+extern struct uprobe_map_info *uprobe_free_map_info(struct uprobe_map_info *info);
+extern struct uprobe_map_info *uprobe_build_map_info(struct address_space *mapping, loff_t offset, bool is_register);
 #else /* !CONFIG_UPROBES */
 struct uprobes_state {
 };
diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index 081b88c1..e7830b8 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -695,23 +695,15 @@ static void delete_uprobe(struct uprobe *uprobe)
 	put_uprobe(uprobe);
 }
 
-struct uprobe_map_info {
-	struct uprobe_map_info *next;
-	struct mm_struct *mm;
-	unsigned long vaddr;
-};
-
-static inline struct uprobe_map_info *
-uprobe_free_map_info(struct uprobe_map_info *info)
+struct uprobe_map_info *uprobe_free_map_info(struct uprobe_map_info *info)
 {
 	struct uprobe_map_info *next = info->next;
 	kfree(info);
 	return next;
 }
 
-static struct uprobe_map_info *
-uprobe_build_map_info(struct address_space *mapping, loff_t offset,
-		      bool is_register)
+struct uprobe_map_info *uprobe_build_map_info(struct address_space *mapping,
+					      loff_t offset, bool is_register)
 {
 	unsigned long pgoff = offset >> PAGE_SHIFT;
 	struct vm_area_struct *vma;
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
