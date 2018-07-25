Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E4E657D071
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Jul 2018 13:30:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728547AbeGYOmA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Jul 2018 10:42:00 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37798 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728529AbeGYOmA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Jul 2018 10:42:00 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w6PDSllx023296
        for <linux-doc@vger.kernel.org>; Wed, 25 Jul 2018 09:30:18 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2kersqwkbf-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Wed, 25 Jul 2018 09:30:17 -0400
Received: from localhost
        by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.vnet.ibm.com>;
        Wed, 25 Jul 2018 14:30:14 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 25 Jul 2018 14:30:11 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w6PDUAwm42401924
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 25 Jul 2018 13:30:10 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id AC6E0A4040;
        Wed, 25 Jul 2018 16:30:24 +0100 (BST)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 32A44A4051;
        Wed, 25 Jul 2018 16:30:24 +0100 (BST)
Received: from rapoport-lnx (unknown [9.148.8.110])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Wed, 25 Jul 2018 16:30:24 +0100 (BST)
Date:   Wed, 25 Jul 2018 16:30:08 +0300
From:   Mike Rapoport <rppt@linux.vnet.ibm.com>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] docs/core-api: split memory management API to a
 separate file
References: <1532517970-16409-1-git-send-email-rppt@linux.vnet.ibm.com>
 <1532517970-16409-6-git-send-email-rppt@linux.vnet.ibm.com>
 <20180725120500.GA9352@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180725120500.GA9352@bombadil.infradead.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 18072513-0028-0000-0000-000002E010BC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18072513-0029-0000-0000-00002397FCEE
Message-Id: <20180725133007.GB25188@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-07-25_03:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=922 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1806210000 definitions=main-1807250146
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 25, 2018 at 05:05:00AM -0700, Matthew Wilcox wrote:
> On Wed, Jul 25, 2018 at 02:26:08PM +0300, Mike Rapoport wrote:
> > +User Space Memory Access
> > +========================
> > +
> > +.. kernel-doc:: arch/x86/include/asm/uaccess.h
> > +   :internal:
> > +
> > +.. kernel-doc:: arch/x86/lib/usercopy_32.c
> > +   :export:
> > +
> > +The Slab Cache
> > +==============
> > +
> > +.. kernel-doc:: include/linux/slab.h
> > +   :internal:
> > +
> > +.. kernel-doc:: mm/slab.c
> > +   :export:
> > +
> > +.. kernel-doc:: mm/util.c
> > +   :functions: kfree_const kvmalloc_node kvfree get_user_pages_fast
> 
> get_user_pages_fast would fit better in the previous 'User Space Memory
> Access' section.

Yeah, it's somewhat "backward compatible" version :)

Will fix.
 
-- 
Sincerely yours,
Mike.

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
