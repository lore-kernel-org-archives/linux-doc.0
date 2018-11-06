Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3C5367D089
	for <lwn-linux-doc@archive.lwn.net>; Tue,  6 Nov 2018 08:20:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729160AbeKFRoU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 6 Nov 2018 12:44:20 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53882 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728133AbeKFRoU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Nov 2018 12:44:20 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wA68EBOh044490
        for <linux-doc@vger.kernel.org>; Tue, 6 Nov 2018 03:20:17 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2nk5t6bc6h-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Tue, 06 Nov 2018 03:20:16 -0500
Received: from localhost
        by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.ibm.com>;
        Tue, 6 Nov 2018 08:20:15 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Tue, 6 Nov 2018 08:20:13 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id wA68KC5H50200648
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 6 Nov 2018 08:20:12 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 31B7B42042;
        Tue,  6 Nov 2018 08:20:12 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 926874204D;
        Tue,  6 Nov 2018 08:20:11 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.204.36])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue,  6 Nov 2018 08:20:11 +0000 (GMT)
Date:   Tue, 6 Nov 2018 10:20:09 +0200
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: Re: [PATCH] docs/admin-guide/mm/concepts.rst: grammar fixups
References: <1541447895-14996-1-git-send-email-rppt@linux.ibm.com>
 <20181105211240.GA3074@bombadil.infradead.org>
 <20181106063511.GC4499@rapoport-lnx>
 <19eb9ca8-d285-3ea9-faa5-f996a462f138@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19eb9ca8-d285-3ea9-faa5-f996a462f138@infradead.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 18110608-0008-0000-0000-0000028BF1F9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18110608-0009-0000-0000-000021F62A57
Message-Id: <20181106082009.GA28505@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-11-06_03:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1811060074
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 05, 2018 at 11:29:27PM -0800, Randy Dunlap wrote:
> On 11/5/18 10:35 PM, Mike Rapoport wrote:
> > On Mon, Nov 05, 2018 at 01:12:40PM -0800, Matthew Wilcox wrote:
> >> On Mon, Nov 05, 2018 at 09:58:15PM +0200, Mike Rapoport wrote:
> >>> @@ -21,10 +21,10 @@ Virtual Memory Primer
> >>>  The physical memory in a computer system is a limited resource and
> >>>  even for systems that support memory hotplug there is a hard limit on
> >>>  the amount of memory that can be installed. The physical memory is not
> >>> -necessary contiguous, it might be accessible as a set of distinct
> >>> +necessary contiguous; it might be accessible as a set of distinct
> >>
> >> necessarily
> >>
> >>>  address ranges. Besides, different CPU architectures, and even
> >>> -different implementations of the same architecture have different view
> >>> -how these address ranges defined.
> >>> +different implementations of the same architecture have different views
> >>> +of how these address ranges defined.
> >>
> >> "are defined"?
> >>
> >>>  Each physical memory page can be mapped as one or more virtual
> >>>  pages. These mappings are described by page tables that allow
> >>> -translation from virtual address used by programs to real address in
> >>> -the physical memory. The page tables organized hierarchically.
> >>> +translation from a virtual address used by programs to the real
> >>> +address in the physical memory. The page tables are organized
> >>> +hierarchically.
> >>
> >> I don't like the term "real address".  Can we say "physical address in memory" here, or "address of physical memory" or something?
> >  
> > I didn't really like it as well, but I couldn't think of any better
> > adjective to emphasize that address in the physical memory is "the real
> > thing".
> > 
> > Maybe the best would be to drop "real" and make it 
> > 
> > "translation from a virtual address used by programs to the 
> > address in the physical memory"
> 
> physical memory address ?

Works for me, thanks!
 
> 
> -- 
> ~Randy
> 

-- 
Sincerely yours,
Mike.

