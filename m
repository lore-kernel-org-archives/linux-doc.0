Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5D5107DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri, 13 Apr 2018 15:39:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751789AbeDMPja (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 13 Apr 2018 11:39:30 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46312 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751775AbeDMPja (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Apr 2018 11:39:30 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w3DFXfrn077686
        for <linux-doc@vger.kernel.org>; Fri, 13 Apr 2018 11:39:30 -0400
Received: from e06smtp14.uk.ibm.com (e06smtp14.uk.ibm.com [195.75.94.110])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2hawgf6crv-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Fri, 13 Apr 2018 11:39:29 -0400
Received: from localhost
        by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <maier@linux.ibm.com>;
        Fri, 13 Apr 2018 16:39:28 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
        by e06smtp14.uk.ibm.com (192.168.101.144) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Fri, 13 Apr 2018 16:39:25 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w3DFdPDd59572262;
        Fri, 13 Apr 2018 15:39:25 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 57A6BAE053;
        Fri, 13 Apr 2018 16:29:19 +0100 (BST)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 28201AE051;
        Fri, 13 Apr 2018 16:29:19 +0100 (BST)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Fri, 13 Apr 2018 16:29:19 +0100 (BST)
From:   Steffen Maier <maier@linux.ibm.com>
To:     linux-doc@vger.kernel.org
Cc:     Steffen Maier <maier@linux.ibm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2] Documentation: ftrace: clarify filters with dynamic ftrace and graph
Date:   Fri, 13 Apr 2018 17:39:15 +0200
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20180413095745.4662eb8f@gandalf.local.home>
References: <20180413095745.4662eb8f@gandalf.local.home>
X-TM-AS-GCONF: 00
x-cbid: 18041315-0044-0000-0000-00000546FD57
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18041315-0045-0000-0000-000028873DCC
Message-Id: <20180413153915.26931-1-maier@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-04-13_08:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804130143
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I fell into the trap of having set up function tracer with a very
limited filter and then switched over to function_graph and was
erroneously wondering why the latter did not trace what I expected,
which was the full unabridged graph recursion.

Signed-off-by: Steffen Maier <maier@linux.ibm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---

Changes since v1:
Integrated review comments by Steven Rostedt
* less emotional phrasing
* also mention function profiling with set_ftrace_filter
  (hopefully I got that right as I don't have experience with it)

 Documentation/trace/ftrace.rst | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
index e45f0786f3f9..9bbd3aefadb2 100644
--- a/Documentation/trace/ftrace.rst
+++ b/Documentation/trace/ftrace.rst
@@ -224,6 +224,8 @@ of ftrace. Here is a list of some of the key files:
 	has a side effect of enabling or disabling specific functions
 	to be traced. Echoing names of functions into this file
 	will limit the trace to only those functions.
+	This influences the tracers "function" and "function_graph"
+	and thus also function profiling (see "function_profile_enabled").
 
 	The functions listed in "available_filter_functions" are what
 	can be written into this file.
@@ -265,6 +267,8 @@ of ftrace. Here is a list of some of the key files:
 	Functions listed in this file will cause the function graph
 	tracer to only trace these functions and the functions that
 	they call. (See the section "dynamic ftrace" for more details).
+	Note, set_ftrace_filter and set_ftrace_notrace still affects
+	what functions are being traced.
 
   set_graph_notrace:
 
@@ -277,7 +281,8 @@ of ftrace. Here is a list of some of the key files:
 
 	This lists the functions that ftrace has processed and can trace.
 	These are the function names that you can pass to
-	"set_ftrace_filter" or "set_ftrace_notrace".
+	"set_ftrace_filter", "set_ftrace_notrace",
+	"set_graph_function", or "set_graph_notrace".
 	(See the section "dynamic ftrace" below for more details.)
 
   dyn_ftrace_total_info:
-- 
2.13.5

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
