Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1AC9E7D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Feb 2019 15:31:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbfBGPbG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Feb 2019 10:31:06 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:35656 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726171AbfBGPbG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Feb 2019 10:31:06 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x17FS4BI008644
        for <linux-doc@vger.kernel.org>; Thu, 7 Feb 2019 10:31:05 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2qgngp6518-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Thu, 07 Feb 2019 10:31:05 -0500
Received: from localhost
        by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.ibm.com>;
        Thu, 7 Feb 2019 15:31:03 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
        by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Thu, 7 Feb 2019 15:30:59 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x17FUxWQ9044244
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 7 Feb 2019 15:30:59 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E1E5252052;
        Thu,  7 Feb 2019 15:30:58 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.8.84])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 9523D52059;
        Thu,  7 Feb 2019 15:30:58 +0000 (GMT)
Date:   Thu, 7 Feb 2019 17:30:56 +0200
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Joe Perches <joe@perches.com>, linux-doc@vger.kernel.org
Subject: Re: Return: vs Returns:
References: <20190207135924.GV21860@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190207135924.GV21860@bombadil.infradead.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19020715-4275-0000-0000-0000030CB0E9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19020715-4276-0000-0000-0000381ABA24
Message-Id: <20190207153056.GB9120@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-02-07_11:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902070118
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 07, 2019 at 05:59:24AM -0800, Matthew Wilcox wrote:
> 
> This seems to be an extremely common mistake to make (indeed, almost
> 3000 occurrences of 'Returns:' vs 5300 occurrences of 'Return:').
 
Add to that ~1000 '@return:'. 

But scripts/kernel-doc does not really care:

	} elsif ($newsection =~ m/^return?$/i) {
	    $newsection = $section_return;
	} elsif ($newsection =~ m/^\@return$/) {
	    # special: @return is a section, not a param description
	    $newsection = $section_return;
	}

> Could we have a checkpatch warning for it?

Does checkpatch checks the kernel-doc parts at all?

> ----- Forwarded message from Matthew Wilcox <willy@infradead.org> -----
> 
> On Wed, Jan 16, 2019 at 04:59:27PM +0000, Christophe Leroy wrote:
> >  v3: Moved 'Returns:" comment after description.
> >      Explained in the commit log why the function is defined static inline
> > 
> >  v2: Added "Returns:" comment and removed probe_user_address()
> 
> The correct spelling is 'Return:', not 'Returns:':
> 
> Return values
> ~~~~~~~~~~~~
> 
> The return value, if any, should be described in a dedicated section
> named ``Return``.
> 
> ----- End forwarded message -----
> 

-- 
Sincerely yours,
Mike.

