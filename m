Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9C53E7D581
	for <lwn-linux-doc@archive.lwn.net>; Tue, 11 Sep 2018 16:24:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbeIKVYk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 11 Sep 2018 17:24:40 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54462 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726782AbeIKVYk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Sep 2018 17:24:40 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w8BGOWda052546
        for <linux-doc@vger.kernel.org>; Tue, 11 Sep 2018 12:24:37 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2mef5xp2vk-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Tue, 11 Sep 2018 12:24:34 -0400
Received: from localhost
        by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.vnet.ibm.com>;
        Tue, 11 Sep 2018 17:24:17 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
        by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Tue, 11 Sep 2018 17:24:14 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w8BGOEu565863730
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 11 Sep 2018 16:24:14 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E6749AE045;
        Tue, 11 Sep 2018 19:23:29 +0100 (BST)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 740CDAE053;
        Tue, 11 Sep 2018 19:23:29 +0100 (BST)
Received: from rapoport-lnx (unknown [9.148.206.72])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue, 11 Sep 2018 19:23:29 +0100 (BST)
Date:   Tue, 11 Sep 2018 19:24:11 +0300
From:   Mike Rapoport <rppt@linux.vnet.ibm.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: nodocs in 4.19-rcX
References: <ace3eeb9-0a15-a4ff-cf2d-af9335fd9810@infradead.org>
 <20180911092522.7a335ce8@lwn.net>
 <e1ae3f3f-5cd0-6542-9f95-69ea7e5ecafa@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1ae3f3f-5cd0-6542-9f95-69ea7e5ecafa@infradead.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 18091116-4275-0000-0000-000002B8C68E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18091116-4276-0000-0000-000037C1F7FC
Message-Id: <20180911162410.GB30245@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-09-11_08:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1809110163
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 11, 2018 at 08:35:18AM -0700, Randy Dunlap wrote:
> On 9/11/18 8:25 AM, Jonathan Corbet wrote:
> > On Mon, 10 Sep 2018 15:51:20 -0700
> > Randy Dunlap <rdunlap@infradead.org> wrote:
> > 
> >> 4.19-rc contains some users of :nodocs: but that is not recognized yet,
> >> so we get:
> >>
> >> lnx-419-rc3/Documentation/core-api/boot-time-mm.rst:78: ERROR: Error in "kernel-doc" directive:
> >> unknown option: "nodocs".
> >>
> >> .. kernel-doc:: mm/bootmem.c
> >>    :nodocs:
> >>
> >> lnx-419-rc3/Documentation/core-api/boot-time-mm.rst:91: ERROR: Error in "kernel-doc" directive:
> >> unknown option: "nodocs".
> >>
> >> .. kernel-doc:: mm/memblock.c
> >>    :nodocs:
> >>
> >>
> >> Do you plan to merge the patch(es) for :nodocs: ?
> > 
> > :nodocs" was v1 of the patch set:
> > 
> >   https://lwn.net/ml/linux-doc/1529328996-16247-1-git-send-email-rppt%40linux.vnet.ibm.com/
> > 
> > In the end, I merged v3, which changed things (and did not contain
> > the :nodocs: directive:
> > 
> >   https://lwn.net/ml/linux-doc/1530306311-10510-1-git-send-email-rppt%40linux.vnet.ibm.com/
> 
> Yes, I found that later.
> 
> which uses (for the record)
>    :functions:
> with an empty functions list -- to exclude "DOC:" sections.
> 
> > So I'm guessing that anything that snuck in with :nodocs: didn't get
> > updated.  Somehow I missed that.  Adding CC: Mike, since his
> > fingerprints are on all aspects of this...:)

Yeah, right. I've also missed that back then.
The fix is below.

> thanks.
> 
> -- 
> ~Randy
> 

From 1d7ab80e5388d993b7b262b24da1f3e55f30f508 Mon Sep 17 00:00:00 2001
From: Mike Rapoport <rppt@linux.vnet.ibm.com>
Date: Tue, 11 Sep 2018 19:16:36 +0300
Subject: [PATCH] docs/boot-time-mm: fix kernel-doc directive for including all
 but DOC:

There were several rounds of the patches that enabled "functions" directive
with no parameters in kerneldoc.py to allow including all the kernel-doc
comments except the DOC: sections.

Yet, the boot-time-mm.rst sneaked in with the older version of that
directive and was not updated. Update it now.

Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
---
 Documentation/core-api/boot-time-mm.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/core-api/boot-time-mm.rst b/Documentation/core-api/boot-time-mm.rst
index 03cb164..6e12e89 100644
--- a/Documentation/core-api/boot-time-mm.rst
+++ b/Documentation/core-api/boot-time-mm.rst
@@ -76,7 +76,7 @@ These interfaces available only with bootmem, i.e when ``CONFIG_NO_BOOTMEM=n``
 
 .. kernel-doc:: include/linux/bootmem.h
 .. kernel-doc:: mm/bootmem.c
-   :nodocs:
+   :functions:
 
 Memblock specific API
 ---------------------
@@ -89,4 +89,4 @@ really happens under the hood.
 
 .. kernel-doc:: include/linux/memblock.h
 .. kernel-doc:: mm/memblock.c
-   :nodocs:
+   :functions:
-- 
2.7.4

-- 
Sincerely yours,
Mike.

