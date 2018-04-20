Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2EBA87DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri, 20 Apr 2018 08:44:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754035AbeDTIoG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 20 Apr 2018 04:44:06 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58454 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753957AbeDTIoF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Apr 2018 04:44:05 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w3K8gZYA140159
        for <linux-doc@vger.kernel.org>; Fri, 20 Apr 2018 04:44:04 -0400
Received: from e06smtp14.uk.ibm.com (e06smtp14.uk.ibm.com [195.75.94.110])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2hfafxeprf-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Fri, 20 Apr 2018 04:44:04 -0400
Received: from localhost
        by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <andrew.donnellan@au1.ibm.com>;
        Fri, 20 Apr 2018 09:44:02 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
        by e06smtp14.uk.ibm.com (192.168.101.144) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Fri, 20 Apr 2018 09:43:58 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w3K8hvWL56033282;
        Fri, 20 Apr 2018 08:43:57 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D82B2A4055;
        Fri, 20 Apr 2018 09:36:02 +0100 (BST)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3E62BA4040;
        Fri, 20 Apr 2018 09:36:02 +0100 (BST)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Fri, 20 Apr 2018 09:36:02 +0100 (BST)
Received: from [10.61.2.125] (haven.au.ibm.com [9.192.254.114])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 806B4A00F7;
        Fri, 20 Apr 2018 18:43:55 +1000 (AEST)
Subject: Re: [PATCH v2 3/7] powerpc: use task_pid_nr() for TID allocation
To:     "Alastair D'Silva" <alastair@au1.ibm.com>,
        linuxppc-dev@lists.ozlabs.org
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        mikey@neuling.org, vaibhav@linux.vnet.ibm.com,
        aneesh.kumar@linux.vnet.ibm.com, malat@debian.org,
        felix@linux.vnet.ibm.com, pombredanne@nexb.com,
        sukadev@linux.vnet.ibm.com, npiggin@gmail.com,
        gregkh@linuxfoundation.org, arnd@arndb.de,
        fbarrat@linux.vnet.ibm.com, corbet@lwn.net,
        "Alastair D'Silva" <alastair@d-silva.org>,
        Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
        Christophe Lombard <clombard@linux.vnet.ibm.com>
References: <20180417020950.21446-1-alastair@au1.ibm.com>
 <20180418010810.30937-1-alastair@au1.ibm.com>
 <20180418010810.30937-4-alastair@au1.ibm.com>
From:   Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Date:   Fri, 20 Apr 2018 18:43:55 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180418010810.30937-4-alastair@au1.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18042008-0044-0000-0000-0000054A4DB5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18042008-0045-0000-0000-0000288A6E4E
Message-Id: <b088d063-058a-2557-812c-6d5659f9d67b@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-04-20_03:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804200087
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

[+ Sukadev, Christophe]

On 18/04/18 11:08, Alastair D'Silva wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> The current implementation of TID allocation, using a global IDR, may
> result in an errant process starving the system of available TIDs.
> Instead, use task_pid_nr(), as mentioned by the original author. The
> scenario described which prevented it's use is not applicable, as
> set_thread_tidr can only be called after the task struct has been
> populated.
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>

So it's too late in the evening for me to completely get my head around 
what's going on here enough to give my Reviewed-by:, but my current 
thinking is:

- In the first version of the patch to add TIDR support 
(https://patchwork.ozlabs.org/patch/799494/), it was originally proposed 
to call assign_thread_id() (as it was then called) from copy_thread()

- The comment block documents the reason why we can't use task_pid_nr() 
but assumes that we're trying to assign a TIDR from within copy_thread()

- The final patch that was accepted 
(https://patchwork.ozlabs.org/patch/835552/, 
ec233ede4c8654894610ea54f4dae7adc954ac62) instead sets the TIDR to 0 
from copy_thread(), so the original reasoning regarding not using 
task_pid_nr() within copy_thread() is no longer applicable.

Sukadev: does this sound right?


Andrew


> ---
>   arch/powerpc/include/asm/switch_to.h |  1 -
>   arch/powerpc/kernel/process.c        | 97 +-----------------------------------
>   2 files changed, 1 insertion(+), 97 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/switch_to.h b/arch/powerpc/include/asm/switch_to.h
> index be8c9fa23983..5b03d8a82409 100644
> --- a/arch/powerpc/include/asm/switch_to.h
> +++ b/arch/powerpc/include/asm/switch_to.h
> @@ -94,6 +94,5 @@ static inline void clear_task_ebb(struct task_struct *t)
>   extern int set_thread_uses_vas(void);
>   
>   extern int set_thread_tidr(struct task_struct *t);
> -extern void clear_thread_tidr(struct task_struct *t);
>   
>   #endif /* _ASM_POWERPC_SWITCH_TO_H */
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index 3b00da47699b..87f047fd2762 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -1496,103 +1496,12 @@ int set_thread_uses_vas(void)
>   }
>   
>   #ifdef CONFIG_PPC64
> -static DEFINE_SPINLOCK(vas_thread_id_lock);
> -static DEFINE_IDA(vas_thread_ida);
> -
> -/*
> - * We need to assign a unique thread id to each thread in a process.
> - *
> - * This thread id, referred to as TIDR, and separate from the Linux's tgid,
> - * is intended to be used to direct an ASB_Notify from the hardware to the
> - * thread, when a suitable event occurs in the system.
> - *
> - * One such event is a "paste" instruction in the context of Fast Thread
> - * Wakeup (aka Core-to-core wake up in the Virtual Accelerator Switchboard
> - * (VAS) in POWER9.
> - *
> - * To get a unique TIDR per process we could simply reuse task_pid_nr() but
> - * the problem is that task_pid_nr() is not yet available copy_thread() is
> - * called. Fixing that would require changing more intrusive arch-neutral
> - * code in code path in copy_process()?.
> - *
> - * Further, to assign unique TIDRs within each process, we need an atomic
> - * field (or an IDR) in task_struct, which again intrudes into the arch-
> - * neutral code. So try to assign globally unique TIDRs for now.
> - *
> - * NOTE: TIDR 0 indicates that the thread does not need a TIDR value.
> - *	 For now, only threads that expect to be notified by the VAS
> - *	 hardware need a TIDR value and we assign values > 0 for those.
> - */
> -#define MAX_THREAD_CONTEXT	((1 << 16) - 1)
> -static int assign_thread_tidr(void)
> -{
> -	int index;
> -	int err;
> -	unsigned long flags;
> -
> -again:
> -	if (!ida_pre_get(&vas_thread_ida, GFP_KERNEL))
> -		return -ENOMEM;
> -
> -	spin_lock_irqsave(&vas_thread_id_lock, flags);
> -	err = ida_get_new_above(&vas_thread_ida, 1, &index);
> -	spin_unlock_irqrestore(&vas_thread_id_lock, flags);
> -
> -	if (err == -EAGAIN)
> -		goto again;
> -	else if (err)
> -		return err;
> -
> -	if (index > MAX_THREAD_CONTEXT) {
> -		spin_lock_irqsave(&vas_thread_id_lock, flags);
> -		ida_remove(&vas_thread_ida, index);
> -		spin_unlock_irqrestore(&vas_thread_id_lock, flags);
> -		return -ENOMEM;
> -	}
> -
> -	return index;
> -}
> -
> -static void free_thread_tidr(int id)
> -{
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&vas_thread_id_lock, flags);
> -	ida_remove(&vas_thread_ida, id);
> -	spin_unlock_irqrestore(&vas_thread_id_lock, flags);
> -}
> -
> -/*
> - * Clear any TIDR value assigned to this thread.
> - */
> -void clear_thread_tidr(struct task_struct *t)
> -{
> -	if (!t->thread.tidr)
> -		return;
> -
> -	if (!cpu_has_feature(CPU_FTR_P9_TIDR)) {
> -		WARN_ON_ONCE(1);
> -		return;
> -	}
> -
> -	mtspr(SPRN_TIDR, 0);
> -	free_thread_tidr(t->thread.tidr);
> -	t->thread.tidr = 0;
> -}
> -
> -void arch_release_task_struct(struct task_struct *t)
> -{
> -	clear_thread_tidr(t);
> -}
> -
>   /*
>    * Assign a unique TIDR (thread id) for task @t and set it in the thread
>    * structure. For now, we only support setting TIDR for 'current' task.
>    */
>   int set_thread_tidr(struct task_struct *t)
>   {
> -	int rc;
> -
>   	if (!cpu_has_feature(CPU_FTR_P9_TIDR))
>   		return -EINVAL;
>   
> @@ -1602,11 +1511,7 @@ int set_thread_tidr(struct task_struct *t)
>   	if (t->thread.tidr)
>   		return 0;
>   
> -	rc = assign_thread_tidr();
> -	if (rc < 0)
> -		return rc;
> -
> -	t->thread.tidr = rc;
> +	t->thread.tidr = (u16)task_pid_nr(t);
>   	mtspr(SPRN_TIDR, t->thread.tidr);
>   
>   	return 0;
> 

-- 
Andrew Donnellan              OzLabs, ADL Canberra
andrew.donnellan@au1.ibm.com  IBM Australia Limited

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
