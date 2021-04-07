Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6EAC433ED
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 14:16:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C13BB61260
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 14:16:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243058AbhDGOQy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Apr 2021 10:16:54 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:9624 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232885AbhDGOQx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Apr 2021 10:16:53 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 137E4uij049287;
        Wed, 7 Apr 2021 10:16:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=klL/07nJVkYFvm9pcMpaTY5y6WEhsDf1E9n90Y9p6TI=;
 b=RY4dkR77HVBQCS4y3td4u+bGOjV19wTLg43gbg1HMG/a42kQqQaHEGIF2ptjvmykRLJs
 hEQczBtEZbBD/bVIrxHfSaV9kq/OqwodXhmbNFjw8n804rvw3nlmeIAEGJIrQWq9pTrY
 OoGMFb6DcBl+P7Fm0gRKXhEGNKaKG6PDS99N2kJO+5nUKwxlxFjGnwMxCBzGonlXfmss
 ylANWlz838egZoHgUhP9Xf5xvusK9p67I7SDtG/xV1URWZxAgzhkcmfJbaB/0YekA21D
 zTGQm1sspk6Qttpg9xSrq5u//H694vhWNo4S0Y6bmrSA3z0qfcGjzOVP8Alimg7kVn4b 1w== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 37rvpuj9tb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 07 Apr 2021 10:16:38 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 137EDmbm030977;
        Wed, 7 Apr 2021 14:16:36 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
        by ppma03ams.nl.ibm.com with ESMTP id 37rvbqgsqs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 07 Apr 2021 14:16:36 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 137EGYub29557028
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 7 Apr 2021 14:16:34 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 39CE3AE055;
        Wed,  7 Apr 2021 14:16:34 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0F71DAE053;
        Wed,  7 Apr 2021 14:16:34 +0000 (GMT)
Received: from [9.145.73.222] (unknown [9.145.73.222])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Wed,  7 Apr 2021 14:16:33 +0000 (GMT)
Subject: Re: [PATCH] docs/gcov: Convert two tags to ref in dev-tools/gov.rst
To:     Wu XiangCheng <bobwxc@email.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20210403113752.GA32236@mipc>
From:   Peter Oberparleiter <oberpar@linux.ibm.com>
Message-ID: <75131ef2-2c6f-3fc4-8a79-bab0d0f7b633@linux.ibm.com>
Date:   Wed, 7 Apr 2021 16:16:33 +0200
MIME-Version: 1.0
In-Reply-To: <20210403113752.GA32236@mipc>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xkoYE45RcC8RfbzzAc-YZY37Y0pUr-Ur
X-Proofpoint-GUID: xkoYE45RcC8RfbzzAc-YZY37Y0pUr-Ur
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-07_08:2021-04-07,2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 malwarescore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104070099
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 03.04.2021 13:37, Wu XiangCheng wrote:
> Htmldocs does not display the chapter number, convert the two manual
> chapter number tags to ref tags.
> 
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>

Looks sane to me.

Acked-by: Peter Oberparleiter <oberpar@linux.ibm.com>

Unfortunately I don't know how documentation updates such as this one
are typically handled...

> ---
>  Documentation/dev-tools/gcov.rst | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/dev-tools/gcov.rst b/Documentation/dev-tools/gcov.rst
> index 9e989baae154..5fce2b06f229 100644
> --- a/Documentation/dev-tools/gcov.rst
> +++ b/Documentation/dev-tools/gcov.rst
> @@ -124,6 +124,8 @@ box for setups where kernels are built and run on the same machine. In
>  cases where the kernel runs on a separate machine, special preparations
>  must be made, depending on where the gcov tool is used:
>  
> +.. _gcov-test:
> +
>  a) gcov is run on the TEST machine
>  
>      The gcov tool version on the test machine must be compatible with the
> @@ -143,6 +145,8 @@ a) gcov is run on the TEST machine
>      machine. If any of the path components is symbolic link, the actual
>      directory needs to be used instead (due to make's CURDIR handling).
>  
> +.. _gcov-build:
> +
>  b) gcov is run on the BUILD machine
>  
>      The following files need to be copied after each test case from test
> @@ -211,7 +215,7 @@ Appendix A: gather_on_build.sh
>  ------------------------------
>  
>  Sample script to gather coverage meta files on the build machine
> -(see 6a):
> +(see :ref:`Separated build and test machines a. <gcov-test>`):
>  
>  .. code-block:: sh
>  
> @@ -244,7 +248,7 @@ Appendix B: gather_on_test.sh
>  -----------------------------
>  
>  Sample script to gather coverage data files on the test machine
> -(see 6b):
> +(see :ref:`Separated build and test machines b. <gcov-build>`):
>  
>  .. code-block:: sh
>  
> 


-- 
Peter Oberparleiter
Linux on Z Development - IBM Germany
