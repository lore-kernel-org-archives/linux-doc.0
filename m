Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 927E77D923
	for <lwn-linux-doc@archive.lwn.net>; Wed, 24 Apr 2019 18:02:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389270AbfDXSCZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 24 Apr 2019 14:02:25 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33742 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388720AbfDXSCZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Apr 2019 14:02:25 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x3OHrm2s056320
        for <linux-doc@vger.kernel.org>; Wed, 24 Apr 2019 14:02:24 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2s2vh9gj5p-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Wed, 24 Apr 2019 14:02:23 -0400
Received: from localhost
        by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.ibm.com>;
        Wed, 24 Apr 2019 19:02:21 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
        by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 24 Apr 2019 19:02:19 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x3OI2Iad44957784
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 24 Apr 2019 18:02:18 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2AE31A405B;
        Wed, 24 Apr 2019 18:02:18 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9BFE1A405C;
        Wed, 24 Apr 2019 18:02:17 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.205.22])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Wed, 24 Apr 2019 18:02:17 +0000 (GMT)
Date:   Wed, 24 Apr 2019 21:02:15 +0300
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/vm: add documentation of memory models
References: <1556101715-31966-1-git-send-email-rppt@linux.ibm.com>
 <20190424101455.12cd407e@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190424101455.12cd407e@lwn.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19042418-0020-0000-0000-0000033460D5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19042418-0021-0000-0000-00002186C7BB
Message-Id: <20190424180215.GA13535@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-04-24_11:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904240131
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 24, 2019 at 10:14:55AM -0600, Jonathan Corbet wrote:
> On Wed, 24 Apr 2019 13:28:35 +0300
> Mike Rapoport <rppt@linux.ibm.com> wrote:
> 
> > Describe what {FLAT,DISCONTIG,SPARSE}MEM are and how they manage to
> > maintain pfn <-> struct page correspondence.
> 
> Quick question: should this document perhaps mention that DISCONTIGMEM
> appears to be on its way out?

I suspect it'll take a while until then, but I'll add a sentence about it
being deprecated.
Which reminds me that mm/Kconfig also begs for the corresponding update.
 
> Thanks,
> 
> jon
> 

-- 
Sincerely yours,
Mike.

