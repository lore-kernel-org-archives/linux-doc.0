Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BFA4F7D082
	for <lwn-linux-doc@archive.lwn.net>; Sun,  7 Oct 2018 16:32:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727365AbeJGXkl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 7 Oct 2018 19:40:41 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:45028 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726986AbeJGXkl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 7 Oct 2018 19:40:41 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w97GUnna056907
        for <linux-doc@vger.kernel.org>; Sun, 7 Oct 2018 12:32:53 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2mynqug224-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Sun, 07 Oct 2018 12:32:52 -0400
Received: from localhost
        by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.vnet.ibm.com>;
        Sun, 7 Oct 2018 17:32:50 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
        by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Sun, 7 Oct 2018 17:32:47 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w97GWkBo10092736
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 7 Oct 2018 16:32:46 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4398152051;
        Sun,  7 Oct 2018 19:32:21 +0100 (BST)
Received: from rapoport-lnx (unknown [9.148.207.134])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id CD11952050;
        Sun,  7 Oct 2018 19:32:20 +0100 (BST)
Date:   Sun, 7 Oct 2018 19:32:44 +0300
From:   Mike Rapoport <rppt@linux.vnet.ibm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 2/2] docs/vm: split memory hotplug notifier description
 to Documentation/core-api
References: <1538691061-31289-1-git-send-email-rppt@linux.vnet.ibm.com>
 <1538691061-31289-3-git-send-email-rppt@linux.vnet.ibm.com>
 <20181007084640.76cd08c8@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181007084640.76cd08c8@lwn.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 18100716-4275-0000-0000-000002C62FB3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18100716-4276-0000-0000-000037D15218
Message-Id: <20181007163243.GA1128@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-10-07_09:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1810070168
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Oct 07, 2018 at 08:46:40AM -0600, Jonathan Corbet wrote:
> On Fri,  5 Oct 2018 01:11:01 +0300
> Mike Rapoport <rppt@linux.vnet.ibm.com> wrote:
> 
> > The memory hotplug notifier description is about kernel internals rather
> > than admin/user visible API. Place it appropriately.
> > 
> > Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
> 
> One little nit...
> 
> >  Documentation/admin-guide/mm/memory-hotplug.rst    | 83 ---------------------
> >  Documentation/core-api/index.rst                   |  2 +
> >  Documentation/core-api/memory-hotplug-notifier.rst | 84 ++++++++++++++++++++++
> >  3 files changed, 86 insertions(+), 83 deletions(-)
> >  create mode 100644 Documentation/core-api/memory-hotplug-notifier.rst
> > 
> > diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
> > index a33090c..0b9c83e 100644
> > --- a/Documentation/admin-guide/mm/memory-hotplug.rst
> > +++ b/Documentation/admin-guide/mm/memory-hotplug.rst
> > @@ -31,7 +31,6 @@ be changed often.
> >      6.1 Memory offline and ZONE_MOVABLE
> >      6.2. How to offline memory
> >    7. Physical memory remove
> > -  8. Memory hotplug event notifier
> >    9. Future Work List
> 
> That leaves a gap in the numbering here.
> 
> In general, the best solution to this sort of issue is to take the TOC out
> entirely and let Sphinx worry about generating it.  People tend not to
> think about updating the TOC when they make changes elsewhere, so it often
> goes out of sync with the rest of the document anyway.
> 
> I'll apply these, but please feel free to send a patch to fix this up.

Sure, below
 
> Thanks,
> 
> jon
> 

From 45ef951bd04e9d440a0158f991a188fc8ca6e7d4 Mon Sep 17 00:00:00 2001
From: Mike Rapoport <rppt@linux.vnet.ibm.com>
Date: Sun, 7 Oct 2018 19:29:00 +0300
Subject: [PATCH] docs/admin-guide: memory-hotplug: remove table of contents

Remove "manual" table of contents and leave only the ReST tag so that
Sphinx will take care of TOC generation.

Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
---
 Documentation/admin-guide/mm/memory-hotplug.rst | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
index 0b9c83e..25157ae 100644
--- a/Documentation/admin-guide/mm/memory-hotplug.rst
+++ b/Documentation/admin-guide/mm/memory-hotplug.rst
@@ -13,27 +13,6 @@ be changed often.
 
 .. contents:: :local:
 
-.. CONTENTS
-
-  1. Introduction
-    1.1 Purpose of memory hotplug
-    1.2. Phases of memory hotplug
-    1.3. Unit of Memory online/offline operation
-  2. Kernel Configuration
-  3. sysfs files for memory hotplug
-  4. Physical memory hot-add phase
-    4.1 Hardware(Firmware) Support
-    4.2 Notify memory hot-add event by hand
-  5. Logical Memory hot-add phase
-    5.1. State of memory
-    5.2. How to online memory
-  6. Logical memory remove
-    6.1 Memory offline and ZONE_MOVABLE
-    6.2. How to offline memory
-  7. Physical memory remove
-  9. Future Work List
-
-
 .. note::
 
     (1) x86_64's has special implementation for memory hotplug.
-- 
2.7.4

