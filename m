Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F54C433E0
	for <linux-doc@archiver.kernel.org>; Tue, 23 Mar 2021 07:29:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E017619BA
	for <linux-doc@archiver.kernel.org>; Tue, 23 Mar 2021 07:29:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbhCWH3E (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 23 Mar 2021 03:29:04 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36714 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229854AbhCWH2j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Mar 2021 03:28:39 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12N74NR0052388;
        Tue, 23 Mar 2021 03:28:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=fv6hQ+k70fKNyIaI2tLkGDFieveL56IT9nj1U6Rqcz0=;
 b=oPhD6lM0Eav7jz92ZwlyI4icBWfNbrctqehI/GSPTGFfbxJ9NkDekAF++MVXePBducXZ
 Mm3GCSdNDvVbF9Di0LDzldKgxXgv9dCmzgFGMopbSciX6VOQNTg9Fc00c/Zkk0XAUAHI
 AJbUYrpGVZ/g1u0XOOWSusQITMc7oHCQiLlzexBjQ78ACc3F2zdXPTdD6tkHY9ah4FX6
 uBMZsJJUE67j8Mk6JKNhGyw0fuKEXgDn31O8b0wx1RT2CQ3+rB2YkBG9TIsOg03M1Vwz
 orwIYq4cTVajYOtkjvNhzbKA/DdDSr7kVuxozxDA6pVZbXgz3U+8HfxKz747FtsbYEN1 6g== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
        by mx0b-001b2d01.pphosted.com with ESMTP id 37e0248bs0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 23 Mar 2021 03:28:31 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
        by ppma06fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12N7NTxK013856;
        Tue, 23 Mar 2021 07:28:29 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
        by ppma06fra.de.ibm.com with ESMTP id 37d9a61kxt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 23 Mar 2021 07:28:29 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 12N7SRGw38142342
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 23 Mar 2021 07:28:27 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5217AAE061;
        Tue, 23 Mar 2021 07:28:27 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 95663AE04D;
        Tue, 23 Mar 2021 07:28:26 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.165.64])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue, 23 Mar 2021 07:28:26 +0000 (GMT)
Date:   Tue, 23 Mar 2021 09:28:24 +0200
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc:     linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        linux-doc@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 3/4] mm/doc: Turn fault flags into an enum
Message-ID: <YFmYmMOp2ZE0C4gw@linux.ibm.com>
References: <20210322195022.2143603-1-willy@infradead.org>
 <20210322195022.2143603-3-willy@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210322195022.2143603-3-willy@infradead.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-23_02:2021-03-22,2021-03-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 mlxscore=0 mlxlogscore=613 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103230044
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 22, 2021 at 07:50:21PM +0000, Matthew Wilcox (Oracle) wrote:
> The kernel-doc script complains about
> ./include/linux/mm.h:425: warning: wrong kernel-doc identifier on line:
>  * Fault flag definitions.
> 
> I don't know how to document a series of #defines, so turn these
> definitions into an enum and document that instead.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Acked-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
>  include/linux/mm.h | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 96e5ceffce09..58df4027dd4d 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -429,8 +429,7 @@ extern unsigned int kobjsize(const void *objp);
>  extern pgprot_t protection_map[16];
>  
>  /**
> - * Fault flag definitions.
> - *
> + * enum fault_flag - Fault flag definitions.
>   * @FAULT_FLAG_WRITE: Fault was a write fault.
>   * @FAULT_FLAG_MKWRITE: Fault was mkwrite of existing PTE.
>   * @FAULT_FLAG_ALLOW_RETRY: Allow to retry the fault if blocked.
> @@ -461,16 +460,18 @@ extern pgprot_t protection_map[16];
>   * signals before a retry to make sure the continuous page faults can still be
>   * interrupted if necessary.
>   */
> -#define FAULT_FLAG_WRITE			0x01
> -#define FAULT_FLAG_MKWRITE			0x02
> -#define FAULT_FLAG_ALLOW_RETRY			0x04
> -#define FAULT_FLAG_RETRY_NOWAIT			0x08
> -#define FAULT_FLAG_KILLABLE			0x10
> -#define FAULT_FLAG_TRIED			0x20
> -#define FAULT_FLAG_USER				0x40
> -#define FAULT_FLAG_REMOTE			0x80
> -#define FAULT_FLAG_INSTRUCTION  		0x100
> -#define FAULT_FLAG_INTERRUPTIBLE		0x200
> +enum fault_flag {
> +	FAULT_FLAG_WRITE =		1 << 0,
> +	FAULT_FLAG_MKWRITE =		1 << 1,
> +	FAULT_FLAG_ALLOW_RETRY =	1 << 2,
> +	FAULT_FLAG_RETRY_NOWAIT = 	1 << 3,
> +	FAULT_FLAG_KILLABLE =		1 << 4,
> +	FAULT_FLAG_TRIED = 		1 << 5,
> +	FAULT_FLAG_USER =		1 << 6,
> +	FAULT_FLAG_REMOTE =		1 << 7,
> +	FAULT_FLAG_INSTRUCTION =	1 << 8,
> +	FAULT_FLAG_INTERRUPTIBLE =	1 << 9,
> +};
>  
>  /*
>   * The default fault flags that should be used by most of the
> @@ -493,7 +494,7 @@ extern pgprot_t protection_map[16];
>   * Return: true if the page fault allows retry and this is the first
>   * attempt of the fault handling; false otherwise.
>   */
> -static inline bool fault_flag_allow_retry_first(unsigned int flags)
> +static inline bool fault_flag_allow_retry_first(enum fault_flag flags)
>  {
>  	return (flags & FAULT_FLAG_ALLOW_RETRY) &&
>  	    (!(flags & FAULT_FLAG_TRIED));
> @@ -528,7 +529,7 @@ struct vm_fault {
>  		pgoff_t pgoff;			/* Logical page offset based on vma */
>  		unsigned long address;		/* Faulting virtual address */
>  	};
> -	unsigned int flags;		/* FAULT_FLAG_xxx flags
> +	enum fault_flag flags;		/* FAULT_FLAG_xxx flags
>  					 * XXX: should really be 'const' */
>  	pmd_t *pmd;			/* Pointer to pmd entry matching
>  					 * the 'address' */
> -- 
> 2.30.2
> 

-- 
Sincerely yours,
Mike.
