Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1D6B87D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 Jan 2019 09:30:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726221AbfAaJao (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 Jan 2019 04:30:44 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:42254 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725932AbfAaJao (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 Jan 2019 04:30:44 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x0V9Pk58057767
        for <linux-doc@vger.kernel.org>; Thu, 31 Jan 2019 04:30:43 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2qbutefq3q-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Thu, 31 Jan 2019 04:30:43 -0500
Received: from localhost
        by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.ibm.com>;
        Thu, 31 Jan 2019 09:30:40 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
        by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Thu, 31 Jan 2019 09:30:38 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x0V9Ubfk56295534
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 31 Jan 2019 09:30:37 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B046BA407C;
        Thu, 31 Jan 2019 09:30:35 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4565FA4073;
        Thu, 31 Jan 2019 09:30:35 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.8.84])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Thu, 31 Jan 2019 09:30:35 +0000 (GMT)
Date:   Thu, 31 Jan 2019 11:30:33 +0200
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     "Tobin C. Harding" <me@tobin.cc>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "Tobin C. Harding" <tobin@kernel.org>,
        Christopher Lameter <cl@linux.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/3] docs: Add missing colon
References: <20190131040623.15569-1-me@tobin.cc>
 <20190131040623.15569-3-me@tobin.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190131040623.15569-3-me@tobin.cc>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19013109-4275-0000-0000-000003083D71
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19013109-4276-0000-0000-000038164623
Message-Id: <20190131093033.GG28876@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-01-31_04:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=967 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901310075
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 31, 2019 at 03:06:22PM +1100, Tobin C. Harding wrote:
> From: "Tobin C. Harding" <tobin@kernel.org>
> 
> sphinx emits warning
> 
>        WARNING: Inline emphasis start-string without end-string.
> 
> This is caused by a missing colon.
> 
> Add missing colon, clearing shpinx build warning.
> 
> Signed-off-by: Tobin C. Harding <tobin@kernel.org>

Acked-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
>  Documentation/vm/slub.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/vm/slub.rst b/Documentation/vm/slub.rst
> index 0871c5849..933ada436 100644
> --- a/Documentation/vm/slub.rst
> +++ b/Documentation/vm/slub.rst
> @@ -66,7 +66,7 @@ Trying to find an issue in the dentry cache? Try::
>  to only enable debugging on the dentry cache.  You may use an asterisk at the
>  end of the slab name, in order to cover all slabs with the same prefix.  For
>  example, here's how you can poison the dentry cache as well as all kmalloc
> -slabs:
> +slabs::
> 
>  	slub_debug=P,kmalloc-*,dentry
> 
> -- 
> 2.20.1
> 

-- 
Sincerely yours,
Mike.

