Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 72A6F7E22E
	for <lwn-linux-doc@archive.lwn.net>; Fri, 11 May 2018 08:46:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752785AbeEKIqy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 11 May 2018 04:46:54 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:32774 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752604AbeEKIqr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 May 2018 04:46:47 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w4B8iCEp040224
        for <linux-doc@vger.kernel.org>; Fri, 11 May 2018 04:46:47 -0400
Received: from e06smtp10.uk.ibm.com (e06smtp10.uk.ibm.com [195.75.94.106])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2hw41w1mau-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Fri, 11 May 2018 04:46:46 -0400
Received: from localhost
        by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <fbarrat@linux.ibm.com>;
        Fri, 11 May 2018 09:46:43 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp10.uk.ibm.com (192.168.101.140) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Fri, 11 May 2018 09:46:38 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w4B8kbN59109792;
        Fri, 11 May 2018 08:46:37 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 14A66A404D;
        Fri, 11 May 2018 09:38:14 +0100 (BST)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 463FFA4051;
        Fri, 11 May 2018 09:38:12 +0100 (BST)
Received: from [9.164.157.79] (unknown [9.164.157.79])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Fri, 11 May 2018 09:38:12 +0100 (BST)
Subject: Re: [PATCH v5 2/7] powerpc: Use TIDR CPU feature to control TIDR
 allocation
To:     "Alastair D'Silva" <alastair@au1.ibm.com>,
        linuxppc-dev@lists.ozlabs.org
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        mikey@neuling.org, vaibhav@linux.vnet.ibm.com,
        aneesh.kumar@linux.vnet.ibm.com, malat@debian.org,
        felix@linux.vnet.ibm.com, pombredanne@nexb.com,
        sukadev@linux.vnet.ibm.com, npiggin@gmail.com,
        gregkh@linuxfoundation.org, arnd@arndb.de,
        andrew.donnellan@au1.ibm.com, fbarrat@linux.vnet.ibm.com,
        corbet@lwn.net, "Alastair D'Silva" <alastair@d-silva.org>
References: <20180511061303.10728-1-alastair@au1.ibm.com>
 <20180511061303.10728-3-alastair@au1.ibm.com>
From:   Frederic Barrat <fbarrat@linux.ibm.com>
Date:   Fri, 11 May 2018 10:46:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180511061303.10728-3-alastair@au1.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 18051108-0040-0000-0000-000004387FC2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18051108-0041-0000-0000-0000263CC7CE
Message-Id: <bde93f43-92b8-d3c8-a5c5-eb1a7495b765@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-05-11_03:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805110084
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



Le 11/05/2018 à 08:12, Alastair D'Silva a écrit :
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> Switch the use of TIDR on it's CPU feature, rather than assuming it
> is available based on architecture.
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---

Reviewed-by: Frederic Barrat <fbarrat@linux.vnet.ibm.com>


>   arch/powerpc/kernel/process.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index 1237f13fed51..3b00da47699b 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -1154,7 +1154,7 @@ static inline void restore_sprs(struct thread_struct *old_thread,
>   			mtspr(SPRN_TAR, new_thread->tar);
>   	}
> 
> -	if (cpu_has_feature(CPU_FTR_ARCH_300) &&
> +	if (cpu_has_feature(CPU_FTR_P9_TIDR) &&
>   	    old_thread->tidr != new_thread->tidr)
>   		mtspr(SPRN_TIDR, new_thread->tidr);
>   #endif
> @@ -1570,7 +1570,7 @@ void clear_thread_tidr(struct task_struct *t)
>   	if (!t->thread.tidr)
>   		return;
> 
> -	if (!cpu_has_feature(CPU_FTR_ARCH_300)) {
> +	if (!cpu_has_feature(CPU_FTR_P9_TIDR)) {
>   		WARN_ON_ONCE(1);
>   		return;
>   	}
> @@ -1593,7 +1593,7 @@ int set_thread_tidr(struct task_struct *t)
>   {
>   	int rc;
> 
> -	if (!cpu_has_feature(CPU_FTR_ARCH_300))
> +	if (!cpu_has_feature(CPU_FTR_P9_TIDR))
>   		return -EINVAL;
> 
>   	if (t != current)
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
