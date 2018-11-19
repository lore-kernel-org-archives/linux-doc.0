Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9594D7E34D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Nov 2018 16:37:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730381AbeKTC6z (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 19 Nov 2018 21:58:55 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37720 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731471AbeKTC6z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Nov 2018 21:58:55 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wAJGUdmw022463
        for <linux-doc@vger.kernel.org>; Mon, 19 Nov 2018 11:34:46 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2nuy6vw6p9-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Mon, 19 Nov 2018 11:34:45 -0500
Received: from localhost
        by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.ibm.com>;
        Mon, 19 Nov 2018 16:34:42 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
        by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Mon, 19 Nov 2018 16:34:41 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id wAJGYeB464946240
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 19 Nov 2018 16:34:40 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 50F71A406A;
        Mon, 19 Nov 2018 16:34:40 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A61B6A4062;
        Mon, 19 Nov 2018 16:34:38 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.205.9])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Mon, 19 Nov 2018 16:34:38 +0000 (GMT)
Date:   Mon, 19 Nov 2018 08:34:34 -0800
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Link the memory allocation guide from the MM docs
References: <20181119160049.GC394@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181119160049.GC394@bombadil.infradead.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 18111916-0016-0000-0000-000002294BD7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18111916-0017-0000-0000-00003281805D
Message-Id: <20181119163433.GB13200@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-11-19_06:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1811190151
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 19, 2018 at 08:00:49AM -0800, Matthew Wilcox wrote:
> I just went looking for the memory allocation guide in the MM docs instead
> of in the core API.  For the benefit of the next person who makes that
> mistake, link to it from the MM docs.
> 
> Signed-off-by: Matthew Wilcox <willy@infradead.org>

Acked-by: Mike Rapoport <rppt@linux.ibm.com>

> 
> diff --git a/Documentation/core-api/memory-allocation.rst b/Documentation/core-api/memory-allocation.rst
> index f8bb9aa120c4..8954a88ff5b7 100644
> --- a/Documentation/core-api/memory-allocation.rst
> +++ b/Documentation/core-api/memory-allocation.rst
> @@ -1,3 +1,5 @@
> +.. _memory-allocation:
> +
>  =======================
>  Memory Allocation Guide
>  =======================
> diff --git a/Documentation/vm/index.rst b/Documentation/vm/index.rst
> index c4ded22197ca..2b3ab3a1ccf3 100644
> --- a/Documentation/vm/index.rst
> +++ b/Documentation/vm/index.rst
> @@ -2,7 +2,9 @@
>  Linux Memory Management Documentation
>  =====================================
>  
> -This is a collection of documents about Linux memory management (mm) subsystem.
> +This is a collection of documents about the Linux memory management (mm)
> +subsystem.  If you are looking for advice on simply allocating memory,
> +see the :ref:`memory-allocation`.
>  
>  User guides for MM features
>  ===========================
> 

-- 
Sincerely yours,
Mike.

