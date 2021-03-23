Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21465C433DB
	for <linux-doc@archiver.kernel.org>; Tue, 23 Mar 2021 07:29:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2AD5619B7
	for <linux-doc@archiver.kernel.org>; Tue, 23 Mar 2021 07:29:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbhCWH2d (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 23 Mar 2021 03:28:33 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:29660 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230057AbhCWH2L (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Mar 2021 03:28:11 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12N73Dq4094904;
        Tue, 23 Mar 2021 03:28:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=WigqkApthflOhPGbdX7hlPZnmpXI7miKImgdp9ft/6k=;
 b=mxr2AoPMXknycFcPfM7FU3/oF4oYzvj+fdeZUEOgx3qjUc2Q9ApDr4yvRoOULt2L3YBn
 IWD9WPoiyWNMOXOFAjJldvA5y0SZM1EqftNvYZcrxJNuEjXoIEIASWf7/Qz2NAPLD3Fn
 mGF2YBic3pQ/QwNRyHJQ2pqH5FljwsjLYc6LQfCxYh7RwGEwX/lBZ//+Qqq4pqSKaWWu
 EoBAdJNTpt2sDkuoJ4eX5+HUjOMwrErmH+uh2s9zDalgj6Gs5A09IbCeKRFGt7FwiSzB
 wL0TPFHOgY9pXQhhILBwtJBBbGuYEUEIWzjj21B8FVONOOQSoRW7jL2tle0J6e79kBFj MQ== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
        by mx0a-001b2d01.pphosted.com with ESMTP id 37dx9y9svw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 23 Mar 2021 03:28:03 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
        by ppma04fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12N7N5QA027433;
        Tue, 23 Mar 2021 07:28:02 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
        by ppma04fra.de.ibm.com with ESMTP id 37d9by9knv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 23 Mar 2021 07:28:01 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 12N7RxNY35913994
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 23 Mar 2021 07:27:59 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A28AFAE053;
        Tue, 23 Mar 2021 07:27:59 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id EE499AE045;
        Tue, 23 Mar 2021 07:27:58 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.165.64])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue, 23 Mar 2021 07:27:58 +0000 (GMT)
Date:   Tue, 23 Mar 2021 09:27:57 +0200
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc:     linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        linux-doc@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 2/4] mm/doc: Fix page_maybe_dma_pinned kerneldoc
Message-ID: <YFmYfcCvKTiudwgh@linux.ibm.com>
References: <20210322195022.2143603-1-willy@infradead.org>
 <20210322195022.2143603-2-willy@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210322195022.2143603-2-willy@infradead.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-23_02:2021-03-22,2021-03-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 mlxlogscore=959 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103230048
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 22, 2021 at 07:50:20PM +0000, Matthew Wilcox (Oracle) wrote:
> make htmldocs reports:
> 
> ./include/linux/mm.h:1341: warning: Excess function parameter 'Return' description in 'page_maybe_dma_pinned'
> 
> Fix a few other formatting nits while I'm editing this description.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Acked-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
>  include/linux/mm.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 9c149e945bf9..96e5ceffce09 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1273,10 +1273,11 @@ void unpin_user_page_range_dirty_lock(struct page *page, unsigned long npages,
>  void unpin_user_pages(struct page **pages, unsigned long npages);
>  
>  /**
> - * page_maybe_dma_pinned() - report if a page is pinned for DMA.
> + * page_maybe_dma_pinned - Report if a page is pinned for DMA.
> + * @page: The page.
>   *
>   * This function checks if a page has been pinned via a call to
> - * pin_user_pages*().
> + * a function in the pin_user_pages() family.
>   *
>   * For non-huge pages, the return value is partially fuzzy: false is not fuzzy,
>   * because it means "definitely not pinned for DMA", but true means "probably
> @@ -1294,9 +1295,8 @@ void unpin_user_pages(struct page **pages, unsigned long npages);
>   *
>   * For more information, please see Documentation/core-api/pin_user_pages.rst.
>   *
> - * @page:	pointer to page to be queried.
> - * @Return:	True, if it is likely that the page has been "dma-pinned".
> - *		False, if the page is definitely not dma-pinned.
> + * Return: True, if it is likely that the page has been "dma-pinned".
> + * False, if the page is definitely not dma-pinned.
>   */
>  static inline bool page_maybe_dma_pinned(struct page *page)
>  {
> -- 
> 2.30.2
> 

-- 
Sincerely yours,
Mike.
