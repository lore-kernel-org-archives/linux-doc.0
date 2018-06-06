Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DATE_IN_PAST_03_06,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CBD747D048
	for <lwn-linux-doc@archive.lwn.net>; Wed,  6 Jun 2018 12:32:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751884AbeFFMcn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 6 Jun 2018 08:32:43 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53950 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751714AbeFFMcn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Jun 2018 08:32:43 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w56CSlWb086201
        for <linux-doc@vger.kernel.org>; Wed, 6 Jun 2018 08:32:42 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2jef0dj3k6-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Wed, 06 Jun 2018 08:32:42 -0400
Received: from localhost
        by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Wed, 6 Jun 2018 08:32:41 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
        by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Wed, 6 Jun 2018 08:32:39 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
        by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w56CWcZ315991214
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 6 Jun 2018 12:32:38 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 89A96B2068;
        Wed,  6 Jun 2018 09:34:10 -0400 (EDT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 616D8B2064;
        Wed,  6 Jun 2018 09:34:10 -0400 (EDT)
Received: from paulmck-ThinkPad-W541 (unknown [9.85.138.115])
        by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
        Wed,  6 Jun 2018 09:34:10 -0400 (EDT)
Received: by paulmck-ThinkPad-W541 (Postfix, from userid 1000)
        id EB63B16C64AF; Wed,  6 Jun 2018 01:07:56 -0700 (PDT)
Date:   Wed, 6 Jun 2018 01:07:56 -0700
From:   "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
To:     Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: atomic_ops: atomic_set is a write (not read)
 operation
Reply-To: paulmck@linux.vnet.ibm.com
References: <20180605194326.23596-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180605194326.23596-1-j.neuschaefer@gmx.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 18060612-0068-0000-0000-0000030434A0
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009139; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000265; SDB=6.01043027; UDB=6.00534142; IPR=6.00822157;
 MB=3.00021491; MTD=3.00000008; XFM=3.00000015; UTC=2018-06-06 12:32:40
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18060612-0069-0000-0000-00004496BE33
Message-Id: <20180606080756.GU3593@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-06-06_05:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1805220000 definitions=main-1806060145
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 05, 2018 at 09:43:23PM +0200, Jonathan Neuschäfer wrote:
> Describe it as such.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>

I have queued this, but if someone else would prefer to take it:

Reviewed-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

> ---
>  Documentation/core-api/atomic_ops.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/core-api/atomic_ops.rst b/Documentation/core-api/atomic_ops.rst
> index 2e7165f86f55..724583453e1f 100644
> --- a/Documentation/core-api/atomic_ops.rst
> +++ b/Documentation/core-api/atomic_ops.rst
> @@ -29,7 +29,7 @@ updated by one CPU, local_t is probably more appropriate. Please see
>  local_t.
> 
>  The first operations to implement for atomic_t's are the initializers and
> -plain reads. ::
> +plain writes. ::
> 
>  	#define ATOMIC_INIT(i)		{ (i) }
>  	#define atomic_set(v, i)	((v)->counter = (i))
> -- 
> 2.17.1
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
