Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D50587D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 11 Feb 2019 07:35:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726025AbfBKHfs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 11 Feb 2019 02:35:48 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:39690 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726015AbfBKHfs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Feb 2019 02:35:48 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x1B7ZA5A191252
        for <linux-doc@vger.kernel.org>; Mon, 11 Feb 2019 02:35:47 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2qk24anvrt-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Mon, 11 Feb 2019 02:35:46 -0500
Received: from localhost
        by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.ibm.com>;
        Mon, 11 Feb 2019 07:35:45 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
        by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Mon, 11 Feb 2019 07:35:41 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x1B7Zegn15270082
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 11 Feb 2019 07:35:40 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6337911C050;
        Mon, 11 Feb 2019 07:35:40 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 8C03811C05C;
        Mon, 11 Feb 2019 07:35:39 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.207.104])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Mon, 11 Feb 2019 07:35:39 +0000 (GMT)
Date:   Mon, 11 Feb 2019 09:35:37 +0200
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Christoph Lameter <cl@linux.com>,
        Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: [PATCH] Documentation: fix vm/slub.rst warning
References: <1e992162-c4ac-fe4e-f1b0-d8a16a51d5e7@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e992162-c4ac-fe4e-f1b0-d8a16a51d5e7@infradead.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19021107-0008-0000-0000-000002BEE963
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19021107-0009-0000-0000-0000222AFCCA
Message-Id: <20190211073537.GA25868@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-02-11_06:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=981 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902110058
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Feb 10, 2019 at 10:34:11PM -0800, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix markup warning by quoting the '*' character with a backslash.
> 
> Documentation/vm/slub.rst:71: WARNING: Inline emphasis start-string without end-string.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Christoph Lameter <cl@linux.com>
> Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>

Acked-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  Documentation/vm/slub.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- lnx-50-rc6.orig/Documentation/vm/slub.rst
> +++ lnx-50-rc6/Documentation/vm/slub.rst
> @@ -68,7 +68,7 @@ end of the slab name, in order to cover
>  example, here's how you can poison the dentry cache as well as all kmalloc
>  slabs:
> 
> -	slub_debug=P,kmalloc-*,dentry
> +	slub_debug=P,kmalloc-\*,dentry
> 
>  Red zoning and tracking may realign the slab.  We can just apply sanity checks
>  to the dentry cache with::
> 
> 

-- 
Sincerely yours,
Mike.

