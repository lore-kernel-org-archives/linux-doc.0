Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 441F27D089
	for <lwn-linux-doc@archive.lwn.net>; Tue,  6 Nov 2018 06:35:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387397AbeKFP7B (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 6 Nov 2018 10:59:01 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45926 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387393AbeKFP7B (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Nov 2018 10:59:01 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wA66XhJh024092
        for <linux-doc@vger.kernel.org>; Tue, 6 Nov 2018 01:35:20 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2nk0kk26u7-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Tue, 06 Nov 2018 01:35:20 -0500
Received: from localhost
        by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.ibm.com>;
        Tue, 6 Nov 2018 06:35:18 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
        by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Tue, 6 Nov 2018 06:35:16 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id wA66ZFsg9306534
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 6 Nov 2018 06:35:15 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0C1A952052;
        Tue,  6 Nov 2018 06:35:15 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.207.135])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 6DA0A52057;
        Tue,  6 Nov 2018 06:35:14 +0000 (GMT)
Date:   Tue, 6 Nov 2018 08:35:12 +0200
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] docs/admin-guide/mm/concepts.rst: grammar fixups
References: <1541447895-14996-1-git-send-email-rppt@linux.ibm.com>
 <20181105211240.GA3074@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181105211240.GA3074@bombadil.infradead.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 18110606-0020-0000-0000-000002E06C32
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18110606-0021-0000-0000-0000212FDF12
Message-Id: <20181106063511.GC4499@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-11-06_02:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1811060057
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 05, 2018 at 01:12:40PM -0800, Matthew Wilcox wrote:
> On Mon, Nov 05, 2018 at 09:58:15PM +0200, Mike Rapoport wrote:
> > @@ -21,10 +21,10 @@ Virtual Memory Primer
> >  The physical memory in a computer system is a limited resource and
> >  even for systems that support memory hotplug there is a hard limit on
> >  the amount of memory that can be installed. The physical memory is not
> > -necessary contiguous, it might be accessible as a set of distinct
> > +necessary contiguous; it might be accessible as a set of distinct
> 
> necessarily
> 
> >  address ranges. Besides, different CPU architectures, and even
> > -different implementations of the same architecture have different view
> > -how these address ranges defined.
> > +different implementations of the same architecture have different views
> > +of how these address ranges defined.
> 
> "are defined"?
> 
> >  Each physical memory page can be mapped as one or more virtual
> >  pages. These mappings are described by page tables that allow
> > -translation from virtual address used by programs to real address in
> > -the physical memory. The page tables organized hierarchically.
> > +translation from a virtual address used by programs to the real
> > +address in the physical memory. The page tables are organized
> > +hierarchically.
> 
> I don't like the term "real address".  Can we say "physical address in memory" here, or "address of physical memory" or something?
 
I didn't really like it as well, but I couldn't think of any better
adjective to emphasize that address in the physical memory is "the real
thing".

Maybe the best would be to drop "real" and make it 

"translation from a virtual address used by programs to the 
address in the physical memory"


> > -page filled with zeroes. When the program performs a write, regular
> > +page filled with zeroes. When the program performs a write, a regular
> >  physical page will be allocated to hold the written data. The page
> >  will be marked dirty and if the kernel will decide to repurpose it,
> >  the dirty page will be swapped out.
> 
> "if the kernel will decide to repurpose it" is awkward.  How about
> 
> if the kernel decides to repurpose it"?
> 
> >  OOM killer
> >  ==========
> >  
> > -It may happen, that on a loaded machine memory will be exhausted. When
> > +It may happen that on a loaded machine memory will be exhausted. When
> >  the kernel detects that the system runs out of memory (OOM) it invokes
> >  `OOM killer`.
> > Its mission is simple: all it has to do is to select a
> >  task to sacrifice for the sake of the overall system health. The
> 
> It is possible for the kernel to be unable to reclaim enough memory to
> continue to operate.  In order to save the rest of the system, it invokes
> the `OOM killer` to sacrifice one task.

How about:

It is possible that on a loaded machine memory will be exhausted and the
kernel will be unable to reclaim enough memory to continue to operate. In
order to save the rest of the system, it invokes the `OOM killer`.

The `OOM killer` selects a task to sacrifice for the sake of the overall
system health. The selected task is killed in a hope that after it exits
enough memory will be freed to continue normal operation.


-- 
Sincerely yours, Mike.

