Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D411CC433C1
	for <linux-doc@archiver.kernel.org>; Tue, 23 Mar 2021 07:29:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2943619B7
	for <linux-doc@archiver.kernel.org>; Tue, 23 Mar 2021 07:29:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbhCWH2b (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 23 Mar 2021 03:28:31 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37828 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229576AbhCWH2D (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Mar 2021 03:28:03 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12N73mH0138602;
        Tue, 23 Mar 2021 03:27:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=RiU7OaAejRFyLq5g2GXCFoSZkUM9W2r4kcger7vGJt8=;
 b=hY3/0iCYpdAotsHwwrumTSB0SlOMOsYyA9wckTg2QEsWRCKzWhqczIYXY4H2d6kX2SXk
 ove4w4rXc9pSrwfZsR4Hsr7JZ+FW/fFWxTyv4yP2g0KXbJuuN1AAke4a/lFu3CMWoa/P
 gWp0ZB5cGvLTmuzoXiSsKBMmmgTi5tp9JhNk6Zd65n0XGwhx31KTZwd/h4mxQADN5/xA
 FMZYqfzL4p5xMujwRyhGNiC+ruFaAFTe8mnrZw15jlt5efjBp6013Ra8s9TMI6rbbUna
 pHdzneXdGRw20rvvnl6f6mGpNlspPNWqgo3p9F8PZaFoH1G1/YHvHH6w37YqHit7KzDv sw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0b-001b2d01.pphosted.com with ESMTP id 37effma6wb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 23 Mar 2021 03:27:50 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12N7NT45022127;
        Tue, 23 Mar 2021 07:27:48 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
        by ppma03ams.nl.ibm.com with ESMTP id 37df68ap5t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 23 Mar 2021 07:27:48 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 12N7RSDx25690458
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 23 Mar 2021 07:27:28 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0E58EA4054;
        Tue, 23 Mar 2021 07:27:46 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 50181A4060;
        Tue, 23 Mar 2021 07:27:45 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.165.64])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue, 23 Mar 2021 07:27:45 +0000 (GMT)
Date:   Tue, 23 Mar 2021 09:27:43 +0200
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc:     linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        linux-doc@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 1/4] mm/doc: Fix fault_flag_allow_retry_first kerneldoc
Message-ID: <YFmYb+LXqU0CCQbU@linux.ibm.com>
References: <20210322195022.2143603-1-willy@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210322195022.2143603-1-willy@infradead.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-23_02:2021-03-22,2021-03-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=849 spamscore=0 adultscore=0 clxscore=1011
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103230044
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 22, 2021 at 07:50:19PM +0000, Matthew Wilcox (Oracle) wrote:
> make htmldocs reports:
> 
> ./include/linux/mm.h:496: warning: Function parameter or member 'flags' not described in 'fault_flag_allow_retry_first'
> 
> Add a description.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Acked-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
>  include/linux/mm.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index cb1e191da319..9c149e945bf9 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -482,6 +482,7 @@ extern pgprot_t protection_map[16];
>  
>  /**
>   * fault_flag_allow_retry_first - check ALLOW_RETRY the first time
> + * @flags: Fault flags.
>   *
>   * This is mostly used for places where we want to try to avoid taking
>   * the mmap_lock for too long a time when waiting for another condition
> -- 
> 2.30.2
> 

-- 
Sincerely yours,
Mike.
