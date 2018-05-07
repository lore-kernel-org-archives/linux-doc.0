Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 832537DE74
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 May 2018 17:37:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752721AbeEGRho (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 13:37:44 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50228 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752708AbeEGRho (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 May 2018 13:37:44 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w47HYRce044765
        for <linux-doc@vger.kernel.org>; Mon, 7 May 2018 13:37:43 -0400
Received: from e06smtp15.uk.ibm.com (e06smtp15.uk.ibm.com [195.75.94.111])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2htsmfcjpg-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Mon, 07 May 2018 13:37:42 -0400
Received: from localhost
        by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <fbarrat@linux.ibm.com>;
        Mon, 7 May 2018 18:37:41 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
        by e06smtp15.uk.ibm.com (192.168.101.145) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Mon, 7 May 2018 18:37:37 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w47HbaJf8192400;
        Mon, 7 May 2018 17:37:36 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B52024C04E;
        Mon,  7 May 2018 18:29:38 +0100 (BST)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 92DE94C044;
        Mon,  7 May 2018 18:29:36 +0100 (BST)
Received: from [9.167.245.55] (unknown [9.167.245.55])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Mon,  7 May 2018 18:29:36 +0100 (BST)
Subject: Re: [PATCH v2 3/7] powerpc: use task_pid_nr() for TID allocation
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
References: <20180417020950.21446-1-alastair@au1.ibm.com>
 <20180418010810.30937-1-alastair@au1.ibm.com>
 <20180418010810.30937-4-alastair@au1.ibm.com>
From:   Frederic Barrat <fbarrat@linux.ibm.com>
Date:   Mon, 7 May 2018 19:37:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180418010810.30937-4-alastair@au1.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 18050717-0020-0000-0000-0000041A0C3C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18050717-0021-0000-0000-000042AF40E1
Message-Id: <b8aa28c4-9171-cb7f-9a43-22f2f15657b0@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-05-07_08:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805070177
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



Le 18/04/2018 à 03:08, Alastair D'Silva a écrit :
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> The current implementation of TID allocation, using a global IDR, may
> result in an errant process starving the system of available TIDs.
> Instead, use task_pid_nr(), as mentioned by the original author. The
> scenario described which prevented it's use is not applicable, as
> set_thread_tidr can only be called after the task struct has been
> populated.


Here is how I understand what's going to happen if 2 threads are using 
the same TIDR value, which is possible with this patch (if unlikely):

1. waking up the wrong thread is not really a problem, as threads have 
to handle spurious wake up from the 'wait' instruction anyway, and must 
be using some other condition to know when to loop around the 'wait' 
instruction.

2. missing the right thread: if the wrong thread is on a CPU, and a 
wake_host_thread/as_notify is sent, the core will see a matching thread 
and will accept the command. The (open)capi adapter won't send an 
interrupt. The wrong thread is awaken, which is not a problem as 
discussed above. As the right thread to notify is not running, no harm 
is done either: as soon as the thread runs, it's supposed to check its 
condition (which will be met) or call 'wait', but 'wait' immediately 
returns when called the first time after a thread is scheduled.

So I believe we are ok. But I think it requires a huge comment with the 
above (at the minimum) :-)

With a comment:
Reviewed-by: Frederic Barrat <fbarrat@linux.vnet.ibm.com>

   Fred



> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
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
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
