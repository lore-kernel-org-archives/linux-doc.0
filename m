Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E619C7DD32
	for <lwn-linux-doc@archive.lwn.net>; Wed,  4 Apr 2018 08:29:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751314AbeDDI3X (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 4 Apr 2018 04:29:23 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43066 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751555AbeDDI3W (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 Apr 2018 04:29:22 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w348TIL5093748
        for <linux-doc@vger.kernel.org>; Wed, 4 Apr 2018 04:29:21 -0400
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2h4s8en9fj-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Wed, 04 Apr 2018 04:29:21 -0400
Received: from localhost
        by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <ravi.bangoria@linux.vnet.ibm.com>;
        Wed, 4 Apr 2018 09:29:05 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
        by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Wed, 4 Apr 2018 09:28:56 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w348SuLR57540710;
        Wed, 4 Apr 2018 08:28:56 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 92F6611C054;
        Wed,  4 Apr 2018 09:21:11 +0100 (BST)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0444E11C052;
        Wed,  4 Apr 2018 09:21:07 +0100 (BST)
Received: from bangoria.in.ibm.com (unknown [9.124.31.24])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Wed,  4 Apr 2018 09:21:06 +0100 (BST)
From:   Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
To:     mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org,
        srikar@linux.vnet.ibm.com, rostedt@goodmis.org
Cc:     acme@kernel.org, ananth@linux.vnet.ibm.com,
        akpm@linux-foundation.org, alexander.shishkin@linux.intel.com,
        alexis.berlemont@gmail.com, corbet@lwn.net,
        dan.j.williams@intel.com, jolsa@redhat.com, kan.liang@intel.com,
        kjlx@templeofstupid.com, kstewart@linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, milian.wolff@kdab.com, mingo@redhat.com,
        namhyung@kernel.org, naveen.n.rao@linux.vnet.ibm.com,
        pc@us.ibm.com, tglx@linutronix.de, yao.jin@linux.intel.com,
        fengguang.wu@intel.com, jglisse@redhat.com,
        Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
Subject: [PATCH v2 4/9] Uprobe: Rename map_info to uprobe_map_info
Date:   Wed,  4 Apr 2018 14:01:05 +0530
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180404083110.18647-1-ravi.bangoria@linux.vnet.ibm.com>
References: <20180404083110.18647-1-ravi.bangoria@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 18040408-0008-0000-0000-000004E68850
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18040408-0009-0000-0000-00001E799638
Message-Id: <20180404083110.18647-5-ravi.bangoria@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:,, definitions=2018-04-04_02:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804040090
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

map_info is very generic name, rename it to uprobe_map_info.
Renaming will help to export this structure outside of the
file.

Also rename free_map_info() to uprobe_free_map_info() and
build_map_info() to uprobe_build_map_info().

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
Reviewed-by: Jérôme Glisse <jglisse@redhat.com>
---
 kernel/events/uprobes.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index 1d439c7..477dc42 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -695,28 +695,30 @@ static void delete_uprobe(struct uprobe *uprobe)
 	put_uprobe(uprobe);
 }
 
-struct map_info {
-	struct map_info *next;
+struct uprobe_map_info {
+	struct uprobe_map_info *next;
 	struct mm_struct *mm;
 	unsigned long vaddr;
 };
 
-static inline struct map_info *free_map_info(struct map_info *info)
+static inline struct uprobe_map_info *
+uprobe_free_map_info(struct uprobe_map_info *info)
 {
-	struct map_info *next = info->next;
+	struct uprobe_map_info *next = info->next;
 	mmput(info->mm);
 	kfree(info);
 	return next;
 }
 
-static struct map_info *
-build_map_info(struct address_space *mapping, loff_t offset, bool is_register)
+static struct uprobe_map_info *
+uprobe_build_map_info(struct address_space *mapping, loff_t offset,
+		      bool is_register)
 {
 	unsigned long pgoff = offset >> PAGE_SHIFT;
 	struct vm_area_struct *vma;
-	struct map_info *curr = NULL;
-	struct map_info *prev = NULL;
-	struct map_info *info;
+	struct uprobe_map_info *curr = NULL;
+	struct uprobe_map_info *prev = NULL;
+	struct uprobe_map_info *info;
 	int more = 0;
 
  again:
@@ -730,7 +732,7 @@ static inline struct map_info *free_map_info(struct map_info *info)
 			 * Needs GFP_NOWAIT to avoid i_mmap_rwsem recursion through
 			 * reclaim. This is optimistic, no harm done if it fails.
 			 */
-			prev = kmalloc(sizeof(struct map_info),
+			prev = kmalloc(sizeof(struct uprobe_map_info),
 					GFP_NOWAIT | __GFP_NOMEMALLOC | __GFP_NOWARN);
 			if (prev)
 				prev->next = NULL;
@@ -763,7 +765,7 @@ static inline struct map_info *free_map_info(struct map_info *info)
 	}
 
 	do {
-		info = kmalloc(sizeof(struct map_info), GFP_KERNEL);
+		info = kmalloc(sizeof(struct uprobe_map_info), GFP_KERNEL);
 		if (!info) {
 			curr = ERR_PTR(-ENOMEM);
 			goto out;
@@ -786,11 +788,11 @@ static inline struct map_info *free_map_info(struct map_info *info)
 register_for_each_vma(struct uprobe *uprobe, struct uprobe_consumer *new)
 {
 	bool is_register = !!new;
-	struct map_info *info;
+	struct uprobe_map_info *info;
 	int err = 0;
 
 	percpu_down_write(&dup_mmap_sem);
-	info = build_map_info(uprobe->inode->i_mapping,
+	info = uprobe_build_map_info(uprobe->inode->i_mapping,
 					uprobe->offset, is_register);
 	if (IS_ERR(info)) {
 		err = PTR_ERR(info);
@@ -828,7 +830,7 @@ static inline struct map_info *free_map_info(struct map_info *info)
  unlock:
 		up_write(&mm->mmap_sem);
  free:
-		info = free_map_info(info);
+		info = uprobe_free_map_info(info);
 	}
  out:
 	percpu_up_write(&dup_mmap_sem);
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
