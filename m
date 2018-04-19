Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8120B7DD31
	for <lwn-linux-doc@archive.lwn.net>; Thu, 19 Apr 2018 13:54:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752788AbeDSNyl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Apr 2018 09:54:41 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50914 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752733AbeDSNyj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Apr 2018 09:54:39 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w3JDpjY0015483
        for <linux-doc@vger.kernel.org>; Thu, 19 Apr 2018 09:54:38 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2hetj6x7uv-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Thu, 19 Apr 2018 09:54:38 -0400
Received: from localhost
        by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Thu, 19 Apr 2018 09:54:37 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
        by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Thu, 19 Apr 2018 09:54:35 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
        by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w3JDsYeB55836818;
        Thu, 19 Apr 2018 13:54:34 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6DA39B2050;
        Thu, 19 Apr 2018 10:56:38 -0400 (EDT)
Received: from paulmck-ThinkPad-W541 (unknown [9.70.82.108])
        by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id 362A5B204E;
        Thu, 19 Apr 2018 10:56:38 -0400 (EDT)
Received: by paulmck-ThinkPad-W541 (Postfix, from userid 1000)
        id C5C7C16C9086; Thu, 19 Apr 2018 06:55:44 -0700 (PDT)
Date:   Thu, 19 Apr 2018 06:55:44 -0700
From:   "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
To:     SeongJae Park <sj38.park@gmail.com>
Cc:     corbet@lwn.net, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] atomic_ops.rst: Fix wrong example code
Reply-To: paulmck@linux.vnet.ibm.com
References: <20180419084245.17096-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180419084245.17096-1-sj38.park@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 18041913-0052-0000-0000-000002DF1508
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008883; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000257; SDB=6.01020195; UDB=6.00520527; IPR=6.00799433;
 MB=3.00020666; MTD=3.00000008; XFM=3.00000015; UTC=2018-04-19 13:54:37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18041913-0053-0000-0000-00005C6401B7
Message-Id: <20180419135544.GA26088@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-04-19_05:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804190124
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 19, 2018 at 05:42:44PM +0900, SeongJae Park wrote:
> Example code snippets for necessary of READ_ONCE() and WRITE_ONCE() has
> an unnecessary line of code and wrong condition.  This commit fixes
> them.
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Good catch!!!  I queued and pushed both patches for further review,
thank you!

						Thanx, Paul

> ---
>  Documentation/core-api/atomic_ops.rst | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/Documentation/core-api/atomic_ops.rst b/Documentation/core-api/atomic_ops.rst
> index fce929144ccd..4ea4af71e68a 100644
> --- a/Documentation/core-api/atomic_ops.rst
> +++ b/Documentation/core-api/atomic_ops.rst
> @@ -111,7 +111,6 @@ If the compiler can prove that do_something() does not store to the
>  variable a, then the compiler is within its rights transforming this to
>  the following::
> 
> -	tmp = a;
>  	if (a > 0)
>  		for (;;)
>  			do_something();
> @@ -119,7 +118,7 @@ the following::
>  If you don't want the compiler to do this (and you probably don't), then
>  you should use something like the following::
> 
> -	while (READ_ONCE(a) < 0)
> +	while (READ_ONCE(a) > 0)
>  		do_something();
> 
>  Alternatively, you could place a barrier() call in the loop.
> -- 
> 2.13.0
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
