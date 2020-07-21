Return-Path: <SRS0=huOA=BA=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 291ADC433E4
	for <linux-doc@archiver.kernel.org>; Tue, 21 Jul 2020 10:49:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B55820674
	for <linux-doc@archiver.kernel.org>; Tue, 21 Jul 2020 10:49:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729208AbgGUKtV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Jul 2020 06:49:21 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:29826 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729387AbgGUKtV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Jul 2020 06:49:21 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06LA4M24136103;
        Tue, 21 Jul 2020 06:49:19 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 32d5pfmkxu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 21 Jul 2020 06:49:19 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06LA4Vow137276;
        Tue, 21 Jul 2020 06:49:19 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
        by mx0a-001b2d01.pphosted.com with ESMTP id 32d5pfmkwx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 21 Jul 2020 06:49:18 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
        by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06LAaA7v011777;
        Tue, 21 Jul 2020 10:49:17 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
        by ppma02fra.de.ibm.com with ESMTP id 32brq7uv39-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 21 Jul 2020 10:49:16 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 06LAlxFd60621284
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 21 Jul 2020 10:47:59 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6BFA3A405B;
        Tue, 21 Jul 2020 10:47:59 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 77BD7A4054;
        Tue, 21 Jul 2020 10:47:58 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.148.205.118])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue, 21 Jul 2020 10:47:58 +0000 (GMT)
Date:   Tue, 21 Jul 2020 13:47:54 +0300
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     rppt@linux.vnet.ibm.com, corbet@lwn.net, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Made single word change in fourth paragraph for right
 sentence construction
Message-ID: <20200721104754.GG802087@linux.ibm.com>
References: <20200721101933.32500-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721101933.32500-1-unixbhaskar@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-21_03:2020-07-21,2020-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=1 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007210070
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Tue, Jul 21, 2020 at 03:49:34PM +0530, Bhaskar Chowdhury wrote:
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
> Mike/Jon,
>  it is nit ...but catch my eyes while reading...so the patch.

That's the right approach! :)

It would be great if you could update the patch subject to better
describe the context and the actual change, e.g:

docs/mm: concepts.rst: remove unnecessary article
 
>  Documentation/admin-guide/mm/concepts.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/mm/concepts.rst b/Documentation/admin-guide/mm/concepts.rst
> index c2531b14bf46..fa0974fbeae7 100644
> --- a/Documentation/admin-guide/mm/concepts.rst
> +++ b/Documentation/admin-guide/mm/concepts.rst
> @@ -35,7 +35,7 @@ physical memory (demand paging) and provides a mechanism for the
>  protection and controlled sharing of data between processes.
> 
>  With virtual memory, each and every memory access uses a virtual
> -address. When the CPU decodes the an instruction that reads (or
> +address. When the CPU decodes an instruction that reads (or
>  writes) from (or to) the system memory, it translates the `virtual`
>  address encoded in that instruction to a `physical` address that the
>  memory controller can understand.
> -- 
> 2.26.2
> 

-- 
Sincerely yours,
Mike.
