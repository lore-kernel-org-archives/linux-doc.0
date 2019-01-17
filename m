Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B5BBC7D099
	for <lwn-linux-doc@archive.lwn.net>; Thu, 17 Jan 2019 00:06:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727716AbfAQAG1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 16 Jan 2019 19:06:27 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:49520 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725385AbfAQAG0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Jan 2019 19:06:26 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id x0H04Rjo079260
        for <linux-doc@vger.kernel.org>; Wed, 16 Jan 2019 19:06:25 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2q2bdrq3nj-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Wed, 16 Jan 2019 19:06:25 -0500
Received: from localhost
        by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.ibm.com>;
        Thu, 17 Jan 2019 00:06:23 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
        by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Thu, 17 Jan 2019 00:06:20 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x0H06JZE1638766
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 17 Jan 2019 00:06:19 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 67D97A4055;
        Thu, 17 Jan 2019 00:06:19 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 65491A4040;
        Thu, 17 Jan 2019 00:06:18 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.207.84])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Thu, 17 Jan 2019 00:06:18 +0000 (GMT)
Date:   Thu, 17 Jan 2019 02:06:16 +0200
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Joel Nider <JOELN@il.ibm.com>, Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Leon Romanovsky <leon@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v2 2/2] docs-rst: userspace: update verbs API details
References: <1547547991-5314-1-git-send-email-joeln@il.ibm.com>
 <1547547991-5314-3-git-send-email-joeln@il.ibm.com>
 <20190115153128.GA6310@bombadil.infradead.org>
 <OF64BB6EB2.8999493B-ONC2258383.0058B5B7-C2258383.005AA2FD@notes.na.collabserv.com>
 <20190115110854.63200119@lwn.net>
 <OF76A381CC.2F8183CE-ONC2258383.006FEA4D-C2258383.007140CB@notes.na.collabserv.com>
 <20190115143859.4cbd5d9c@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190115143859.4cbd5d9c@lwn.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19011700-0008-0000-0000-000002B207F8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19011700-0009-0000-0000-0000221E2315
Message-Id: <20190117000615.GA18089@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-01-16_09:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=671 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901160191
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jon,

On Tue, Jan 15, 2019 at 02:38:59PM -0700, Jonathan Corbet wrote:
> On Tue, 15 Jan 2019 22:37:01 +0200
> 
> I'd rather see you put the new stuff under Documentation/driver-api, either
> in a standalone file or in a new subdirectory.
> 
> Thanks for your patience with this!  We really do want people to contribute
> more documentation, and I feel bad when it seems like I'm making it
> harder.  My hope is that it will pay off in the long run; I think there are
> signs already that this is happening.

I believe its worth adding Documentation/doc-guide/where-to-put-stuff.rst
with at least basic guidelines for the desired organization of
Documentation/.

> Thanks,
> 
> jon
> 

-- 
Sincerely yours,
Mike.

