Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id ADD8C7DE78
	for <lwn-linux-doc@archive.lwn.net>; Wed,  4 Apr 2018 15:04:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751532AbeDDPEA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 4 Apr 2018 11:04:00 -0400
Received: from mga01.intel.com ([192.55.52.88]:56383 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751518AbeDDPDz (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 4 Apr 2018 11:03:55 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Apr 2018 08:03:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,406,1517904000"; 
   d="scan'208";a="40642549"
Received: from bee.sh.intel.com (HELO bee) ([10.239.97.14])
  by orsmga003.jf.intel.com with ESMTP; 04 Apr 2018 08:03:48 -0700
Received: from kbuild by bee with local (Exim 4.84_2)
        (envelope-from <fengguang.wu@intel.com>)
        id 1f3jwv-00064V-19; Wed, 04 Apr 2018 23:03:45 +0800
Date:   Wed, 4 Apr 2018 23:03:39 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
Cc:     kbuild-all@01.org, mhiramat@kernel.org, oleg@redhat.com,
        peterz@infradead.org, srikar@linux.vnet.ibm.com,
        rostedt@goodmis.org, acme@kernel.org, ananth@linux.vnet.ibm.com,
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
Subject: [RFC PATCH] trace_uprobe: trace_uprobe_mmap() can be static
Message-ID: <20180404150339.GA48831@ivb43>
References: <20180404083110.18647-7-ravi.bangoria@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180404083110.18647-7-ravi.bangoria@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: fengguang.wu@intel.com
X-SA-Exim-Scanned: No (on bee); SAEximRunCond expanded to false
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Fixes: d8d4d3603b92 ("trace_uprobe: Support SDT markers having reference count (semaphore)")
Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
---
 trace_uprobe.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace_uprobe.c b/kernel/trace/trace_uprobe.c
index 2502bd7..49a8673 100644
--- a/kernel/trace/trace_uprobe.c
+++ b/kernel/trace/trace_uprobe.c
@@ -998,7 +998,7 @@ static void sdt_increment_ref_ctr(struct trace_uprobe *tu)
 }
 
 /* Called with down_write(&vma->vm_mm->mmap_sem) */
-void trace_uprobe_mmap(struct vm_area_struct *vma)
+static void trace_uprobe_mmap(struct vm_area_struct *vma)
 {
 	struct trace_uprobe *tu;
 	unsigned long vaddr;
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
