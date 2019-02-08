Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DBD987D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri,  8 Feb 2019 10:56:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbfBHK4H (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 8 Feb 2019 05:56:07 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46434 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726068AbfBHK4H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Feb 2019 05:56:07 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x18AnkHC028201
        for <linux-doc@vger.kernel.org>; Fri, 8 Feb 2019 05:56:05 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2qh6vs477u-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Fri, 08 Feb 2019 05:56:05 -0500
Received: from localhost
        by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.ibm.com>;
        Fri, 8 Feb 2019 10:56:04 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
        by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Fri, 8 Feb 2019 10:56:01 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x18Au0om55246878
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 8 Feb 2019 10:56:00 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A703BA4053;
        Fri,  8 Feb 2019 10:56:00 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 281AEA4040;
        Fri,  8 Feb 2019 10:56:00 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.205.183])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Fri,  8 Feb 2019 10:56:00 +0000 (GMT)
Date:   Fri, 8 Feb 2019 12:55:58 +0200
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Markus Heiser <markus.heiser@darmarit.de>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Joe Perches <joe@perches.com>, linux-doc@vger.kernel.org
Subject: Re: Return: vs Returns:
References: <20190207135924.GV21860@bombadil.infradead.org>
 <20190207153056.GB9120@rapoport-lnx>
 <8cacba6c-32c1-f60b-dfb0-0c74ef09d53c@darmarit.de>
 <20190207161852.GC8040@rapoport-lnx>
 <e038da5e-bc39-59f4-5b7f-c97467563173@darmarit.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e038da5e-bc39-59f4-5b7f-c97467563173@darmarit.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19020810-0028-0000-0000-000003462717
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19020810-0029-0000-0000-000024043B17
Message-Id: <20190208105557.GE11096@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-02-08_07:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902080078
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 07, 2019 at 06:33:34PM +0100, Markus Heiser wrote:
> 
> Am 07.02.19 um 17:18 schrieb Mike Rapoport:
> >>>Does checkpatch checks the kernel-doc parts at all?
> >>No.  I guess there are to many places to fail / to hard to put someone in
> >>charge.  E.g. if you do include a single kernel-doc comment from a source all
> >>kernel-docs in the source will be parsed and may produce (error/warning)
> >>essages.  What we have, are some targets:
> >>
> >>-linkcheckdocs
> >>  check for broken external links (will connect to external hosts)
> >>
> >>- refcheckdocs
> >>   check for references to non-existing files under Documentation
> >Right, but these should be checked explicitly and I doubt many people do it
> >before submitting patches. OTOH, checkpatch is something that's widely used
> >and if it had verified the kernel-doc parts, more comments would be
> >following the convention.
> 
> I'am with you, but I do not have any clue how to solve this Gordian Knot
> faithful and without massive collateral damage / sorry :|
> 
> The only thing I know, we have the -none option:
> 
> $ ./scripts/kernel-doc -none ./include/media/cec.h
> ./include/media/cec.h:51: warning: Function parameter or member 'lock' not
> described in 'cec_devnode'
> 
> But this is nothing more than noise if the patch does not touch cec_devnode.
> And there is another problem I see, if we want to check refs ...

Well, the case when a patch changes function parameters but forgets to
update the kernel-doc part is particularly annoying.
I believe it's possible to match function parameter changes with the
corresponding kernel-doc changes (or lack of them).
 
> >> -linkcheckdocs
> >>   check for broken external links (will connect to external hosts)
> >>
> >> - refcheckdocs
> >>    check for references to non-existing files under Documentation
> 
> The refs are solved late in the sphinx build process when .rst files and
> kernel-doc comments come together .. so we need sphinx for checkpatch,
> I gues this is a no-go (?)
> 
> -- Markus --
> 

-- 
Sincerely yours,
Mike.

