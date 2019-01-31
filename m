Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EEF887D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 Jan 2019 09:28:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726434AbfAaJ2H (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 Jan 2019 04:28:07 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57966 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725932AbfAaJ2H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 Jan 2019 04:28:07 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x0V9PVQh131383
        for <linux-doc@vger.kernel.org>; Thu, 31 Jan 2019 04:28:06 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2qbur686nh-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Thu, 31 Jan 2019 04:28:06 -0500
Received: from localhost
        by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.ibm.com>;
        Thu, 31 Jan 2019 09:28:03 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Thu, 31 Jan 2019 09:28:00 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x0V9Rxt650069590
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 31 Jan 2019 09:27:59 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A39A8A4040;
        Thu, 31 Jan 2019 09:27:59 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 29EEEA4053;
        Thu, 31 Jan 2019 09:27:59 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.8.84])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Thu, 31 Jan 2019 09:27:59 +0000 (GMT)
Date:   Thu, 31 Jan 2019 11:27:57 +0200
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     "Tobin C. Harding" <me@tobin.cc>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "Tobin C. Harding" <tobin@kernel.org>,
        Christopher Lameter <cl@linux.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/3] docs: Use underscore not hyphen in label
References: <20190131040623.15569-1-me@tobin.cc>
 <20190131040623.15569-4-me@tobin.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190131040623.15569-4-me@tobin.cc>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19013109-0008-0000-0000-000002B939A0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19013109-0009-0000-0000-000022253B73
Message-Id: <20190131092757.GF28876@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-01-31_04:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901310075
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 31, 2019 at 03:06:23PM +1100, Tobin C. Harding wrote:
> From: "Tobin C. Harding" <tobin@kernel.org>
> 
> sphinx emits warning
> 
>        WARNING: undefined label: memory-allocation ...

Weird, for me it works fine. The generated html at kernel.org [1] also
seems to be Ok...

What version of sphinx do you use?

[1] https://www.kernel.org/doc/html/latest/vm/index.html
> 
> This seems to be caused by the use of a hyphen in the label name instead
> of an underscore.  Using an underscore for the label name and the
> reference clears the warning.
> 
> Use underscore not hyphen in label and reference.
> 
> Signed-off-by: Tobin C. Harding <tobin@kernel.org>
> ---
> 
> Not 100% sure this is the correct fix, please review.
> 
> thanks
> 
>  Documentation/core-api/memory-allocation.rst | 2 +-
>  Documentation/vm/index.rst                   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/core-api/memory-allocation.rst b/Documentation/core-api/memory-allocation.rst
> index 8954a88ff..39f35ebdc 100644
> --- a/Documentation/core-api/memory-allocation.rst
> +++ b/Documentation/core-api/memory-allocation.rst
> @@ -1,4 +1,4 @@
> -.. _memory-allocation:
> +.. _memory_allocation:
> 
>  =======================
>  Memory Allocation Guide
> diff --git a/Documentation/vm/index.rst b/Documentation/vm/index.rst
> index 2b3ab3a1c..b58cc3bfe 100644
> --- a/Documentation/vm/index.rst
> +++ b/Documentation/vm/index.rst
> @@ -4,7 +4,7 @@ Linux Memory Management Documentation
> 
>  This is a collection of documents about the Linux memory management (mm)
>  subsystem.  If you are looking for advice on simply allocating memory,
> -see the :ref:`memory-allocation`.
> +see the :ref:`memory_allocation`.
> 
>  User guides for MM features
>  ===========================
> -- 
> 2.20.1
> 

-- 
Sincerely yours,
Mike.

