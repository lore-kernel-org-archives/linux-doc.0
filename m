Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95662C433DB
	for <linux-doc@archiver.kernel.org>; Tue, 23 Mar 2021 07:29:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CF4B619BF
	for <linux-doc@archiver.kernel.org>; Tue, 23 Mar 2021 07:29:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbhCWH3E (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 23 Mar 2021 03:29:04 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39092 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229504AbhCWH2z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Mar 2021 03:28:55 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12N74H6M071657;
        Tue, 23 Mar 2021 03:28:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=rMJpCxQKw8/4V6+wKPYztSGEMzlKMY1b68mbB5ExdS4=;
 b=Kaypqzp9HiDm6JrlpA47MN1FiNfxaN8YLN2hRwXNLbpLC9XVP5iEwee6oWBrDMCL7jnC
 wIULqLk6XTw+8f4Cr0Xalas0a/qLxfHyijyQEWgGUk1S5kTf5u4NvylNBeBn8TjuSGd+
 rqmvFeAb6lo0qMZSsTQNZVgeTY6J0l81FT4CM5TT4B8nulsxCV6YhBJsn1rKZc3OZV18
 La6yr1Bfp2E5jq5lmYvBp+2jjKO9eYvLDVgu1FVabD5ISxDO5Ud0NhAO3LB5t56OrtQ3
 f6oNBror2r1bMZIjzlB/HGVAV90YhSQWxtRijTBn/hq0WMIzNJihWdCGTh9CcK/q30Z8 tQ== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
        by mx0a-001b2d01.pphosted.com with ESMTP id 37dx4arsat-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 23 Mar 2021 03:28:45 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
        by ppma04fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12N7N4J5027411;
        Tue, 23 Mar 2021 07:28:41 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
        by ppma04fra.de.ibm.com with ESMTP id 37d9by9kp3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 23 Mar 2021 07:28:40 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 12N7ScFg46072188
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 23 Mar 2021 07:28:38 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A433CAE04D;
        Tue, 23 Mar 2021 07:28:38 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id F227DAE056;
        Tue, 23 Mar 2021 07:28:37 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.165.64])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue, 23 Mar 2021 07:28:37 +0000 (GMT)
Date:   Tue, 23 Mar 2021 09:28:36 +0200
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc:     linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        linux-doc@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 4/4] mm/doc: Add mm.h and mm_types.h to the mm-api
 document
Message-ID: <YFmYpGJhcDUXteat@linux.ibm.com>
References: <20210322195022.2143603-1-willy@infradead.org>
 <20210322195022.2143603-4-willy@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210322195022.2143603-4-willy@infradead.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-23_02:2021-03-22,2021-03-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 spamscore=0 suspectscore=0 mlxlogscore=770 priorityscore=1501 mlxscore=0
 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103230044
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 22, 2021 at 07:50:22PM +0000, Matthew Wilcox (Oracle) wrote:
> kerneldoc in include/linux/mm.h and include/linux/mm_types.h wasn't
> being included in the html build.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Acked-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
>  Documentation/core-api/mm-api.rst | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/core-api/mm-api.rst b/Documentation/core-api/mm-api.rst
> index 874ae1250258..34f46df91a8b 100644
> --- a/Documentation/core-api/mm-api.rst
> +++ b/Documentation/core-api/mm-api.rst
> @@ -93,3 +93,7 @@ More Memory Management Functions
>  
>  .. kernel-doc:: mm/page_alloc.c
>  .. kernel-doc:: mm/mempolicy.c
> +.. kernel-doc:: include/linux/mm_types.h
> +   :internal:
> +.. kernel-doc:: include/linux/mm.h
> +   :internal:
> -- 
> 2.30.2
> 

-- 
Sincerely yours,
Mike.
