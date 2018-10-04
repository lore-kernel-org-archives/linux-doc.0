Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A92257D082
	for <lwn-linux-doc@archive.lwn.net>; Thu,  4 Oct 2018 22:11:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726113AbeJEFGu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 5 Oct 2018 01:06:50 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39138 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725758AbeJEFGu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Oct 2018 01:06:50 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w94M9GLN124239
        for <linux-doc@vger.kernel.org>; Thu, 4 Oct 2018 18:11:23 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2mwrs9g1qc-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Thu, 04 Oct 2018 18:11:23 -0400
Received: from localhost
        by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.vnet.ibm.com>;
        Thu, 4 Oct 2018 23:11:20 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
        by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Thu, 4 Oct 2018 23:11:17 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w94MBGqS65273894
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 4 Oct 2018 22:11:16 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 25422A4053;
        Fri,  5 Oct 2018 01:10:53 +0100 (BST)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id AE787A4051;
        Fri,  5 Oct 2018 01:10:51 +0100 (BST)
Received: from rapoport-lnx (unknown [9.148.204.110])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Fri,  5 Oct 2018 01:10:51 +0100 (BST)
Received: by rapoport-lnx (sSMTP sendmail emulation); Fri, 05 Oct 2018 01:11:14 +0300
From:   Mike Rapoport <rppt@linux.vnet.ibm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-mm@kvack.org,
        Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: [PATCH 2/2] docs/vm: split memory hotplug notifier description to Documentation/core-api
Date:   Fri,  5 Oct 2018 01:11:01 +0300
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1538691061-31289-1-git-send-email-rppt@linux.vnet.ibm.com>
References: <1538691061-31289-1-git-send-email-rppt@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18100422-0020-0000-0000-000002CFAB38
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18100422-0021-0000-0000-0000211DFC79
Message-Id: <1538691061-31289-3-git-send-email-rppt@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-10-04_09:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1810040199
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The memory hotplug notifier description is about kernel internals rather
than admin/user visible API. Place it appropriately.

Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
---
 Documentation/admin-guide/mm/memory-hotplug.rst    | 83 ---------------------
 Documentation/core-api/index.rst                   |  2 +
 Documentation/core-api/memory-hotplug-notifier.rst | 84 ++++++++++++++++++++++
 3 files changed, 86 insertions(+), 83 deletions(-)
 create mode 100644 Documentation/core-api/memory-hotplug-notifier.rst

diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
index a33090c..0b9c83e 100644
--- a/Documentation/admin-guide/mm/memory-hotplug.rst
+++ b/Documentation/admin-guide/mm/memory-hotplug.rst
@@ -31,7 +31,6 @@ be changed often.
     6.1 Memory offline and ZONE_MOVABLE
     6.2. How to offline memory
   7. Physical memory remove
-  8. Memory hotplug event notifier
   9. Future Work List
 
 
@@ -414,88 +413,6 @@ Need more implementation yet....
  - Notification completion of remove works by OS to firmware.
  - Guard from remove if not yet.
 
-Memory hotplug event notifier
-=============================
-
-Hotplugging events are sent to a notification queue.
-
-There are six types of notification defined in ``include/linux/memory.h``:
-
-MEM_GOING_ONLINE
-  Generated before new memory becomes available in order to be able to
-  prepare subsystems to handle memory. The page allocator is still unable
-  to allocate from the new memory.
-
-MEM_CANCEL_ONLINE
-  Generated if MEMORY_GOING_ONLINE fails.
-
-MEM_ONLINE
-  Generated when memory has successfully brought online. The callback may
-  allocate pages from the new memory.
-
-MEM_GOING_OFFLINE
-  Generated to begin the process of offlining memory. Allocations are no
-  longer possible from the memory but some of the memory to be offlined
-  is still in use. The callback can be used to free memory known to a
-  subsystem from the indicated memory block.
-
-MEM_CANCEL_OFFLINE
-  Generated if MEMORY_GOING_OFFLINE fails. Memory is available again from
-  the memory block that we attempted to offline.
-
-MEM_OFFLINE
-  Generated after offlining memory is complete.
-
-A callback routine can be registered by calling::
-
-  hotplug_memory_notifier(callback_func, priority)
-
-Callback functions with higher values of priority are called before callback
-functions with lower values.
-
-A callback function must have the following prototype::
-
-  int callback_func(
-    struct notifier_block *self, unsigned long action, void *arg);
-
-The first argument of the callback function (self) is a pointer to the block
-of the notifier chain that points to the callback function itself.
-The second argument (action) is one of the event types described above.
-The third argument (arg) passes a pointer of struct memory_notify::
-
-	struct memory_notify {
-		unsigned long start_pfn;
-		unsigned long nr_pages;
-		int status_change_nid_normal;
-		int status_change_nid_high;
-		int status_change_nid;
-	}
-
-- start_pfn is start_pfn of online/offline memory.
-- nr_pages is # of pages of online/offline memory.
-- status_change_nid_normal is set node id when N_NORMAL_MEMORY of nodemask
-  is (will be) set/clear, if this is -1, then nodemask status is not changed.
-- status_change_nid_high is set node id when N_HIGH_MEMORY of nodemask
-  is (will be) set/clear, if this is -1, then nodemask status is not changed.
-- status_change_nid is set node id when N_MEMORY of nodemask is (will be)
-  set/clear. It means a new(memoryless) node gets new memory by online and a
-  node loses all memory. If this is -1, then nodemask status is not changed.
-
-  If status_changed_nid* >= 0, callback should create/discard structures for the
-  node if necessary.
-
-The callback routine shall return one of the values
-NOTIFY_DONE, NOTIFY_OK, NOTIFY_BAD, NOTIFY_STOP
-defined in ``include/linux/notifier.h``
-
-NOTIFY_DONE and NOTIFY_OK have no effect on the further processing.
-
-NOTIFY_BAD is used as response to the MEM_GOING_ONLINE, MEM_GOING_OFFLINE,
-MEM_ONLINE, or MEM_OFFLINE action to cancel hotplugging. It stops
-further processing of the notification queue.
-
-NOTIFY_STOP stops further processing of the notification queue.
-
 Future Work
 ===========
 
diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
index 165d7688..4f8a426 100644
--- a/Documentation/core-api/index.rst
+++ b/Documentation/core-api/index.rst
@@ -32,6 +32,8 @@ Core utilities
    gfp_mask-from-fs-io
    timekeeping
    boot-time-mm
+   memory-hotplug-notifier
+
 
 Interfaces for kernel debugging
 ===============================
diff --git a/Documentation/core-api/memory-hotplug-notifier.rst b/Documentation/core-api/memory-hotplug-notifier.rst
new file mode 100644
index 0000000..35347cc
--- /dev/null
+++ b/Documentation/core-api/memory-hotplug-notifier.rst
@@ -0,0 +1,84 @@
+.. _memory_hotplug_notifier:
+
+=============================
+Memory hotplug event notifier
+=============================
+
+Hotplugging events are sent to a notification queue.
+
+There are six types of notification defined in ``include/linux/memory.h``:
+
+MEM_GOING_ONLINE
+  Generated before new memory becomes available in order to be able to
+  prepare subsystems to handle memory. The page allocator is still unable
+  to allocate from the new memory.
+
+MEM_CANCEL_ONLINE
+  Generated if MEM_GOING_ONLINE fails.
+
+MEM_ONLINE
+  Generated when memory has successfully brought online. The callback may
+  allocate pages from the new memory.
+
+MEM_GOING_OFFLINE
+  Generated to begin the process of offlining memory. Allocations are no
+  longer possible from the memory but some of the memory to be offlined
+  is still in use. The callback can be used to free memory known to a
+  subsystem from the indicated memory block.
+
+MEM_CANCEL_OFFLINE
+  Generated if MEM_GOING_OFFLINE fails. Memory is available again from
+  the memory block that we attempted to offline.
+
+MEM_OFFLINE
+  Generated after offlining memory is complete.
+
+A callback routine can be registered by calling::
+
+  hotplug_memory_notifier(callback_func, priority)
+
+Callback functions with higher values of priority are called before callback
+functions with lower values.
+
+A callback function must have the following prototype::
+
+  int callback_func(
+    struct notifier_block *self, unsigned long action, void *arg);
+
+The first argument of the callback function (self) is a pointer to the block
+of the notifier chain that points to the callback function itself.
+The second argument (action) is one of the event types described above.
+The third argument (arg) passes a pointer of struct memory_notify::
+
+	struct memory_notify {
+		unsigned long start_pfn;
+		unsigned long nr_pages;
+		int status_change_nid_normal;
+		int status_change_nid_high;
+		int status_change_nid;
+	}
+
+- start_pfn is start_pfn of online/offline memory.
+- nr_pages is # of pages of online/offline memory.
+- status_change_nid_normal is set node id when N_NORMAL_MEMORY of nodemask
+  is (will be) set/clear, if this is -1, then nodemask status is not changed.
+- status_change_nid_high is set node id when N_HIGH_MEMORY of nodemask
+  is (will be) set/clear, if this is -1, then nodemask status is not changed.
+- status_change_nid is set node id when N_MEMORY of nodemask is (will be)
+  set/clear. It means a new(memoryless) node gets new memory by online and a
+  node loses all memory. If this is -1, then nodemask status is not changed.
+
+  If status_changed_nid* >= 0, callback should create/discard structures for the
+  node if necessary.
+
+The callback routine shall return one of the values
+NOTIFY_DONE, NOTIFY_OK, NOTIFY_BAD, NOTIFY_STOP
+defined in ``include/linux/notifier.h``
+
+NOTIFY_DONE and NOTIFY_OK have no effect on the further processing.
+
+NOTIFY_BAD is used as response to the MEM_GOING_ONLINE, MEM_GOING_OFFLINE,
+MEM_ONLINE, or MEM_OFFLINE action to cancel hotplugging. It stops
+further processing of the notification queue.
+
+NOTIFY_STOP stops further processing of the notification queue.
-- 
2.7.4

