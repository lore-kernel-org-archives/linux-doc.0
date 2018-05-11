Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6F93D7DE79
	for <lwn-linux-doc@archive.lwn.net>; Fri, 11 May 2018 09:25:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752663AbeEKJZf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 11 May 2018 05:25:35 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:44892 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752647AbeEKJZd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 May 2018 05:25:33 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w4B9Kdm5108024
        for <linux-doc@vger.kernel.org>; Fri, 11 May 2018 05:25:33 -0400
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2hw7bm34nc-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Fri, 11 May 2018 05:25:33 -0400
Received: from localhost
        by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <fbarrat@linux.ibm.com>;
        Fri, 11 May 2018 10:25:31 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
        by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Fri, 11 May 2018 10:25:27 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w4B9PQ2Z8323504;
        Fri, 11 May 2018 09:25:26 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 674ACA4057;
        Fri, 11 May 2018 10:17:03 +0100 (BST)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7FC1FA4040;
        Fri, 11 May 2018 10:17:01 +0100 (BST)
Received: from [9.164.157.79] (unknown [9.164.157.79])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Fri, 11 May 2018 10:17:01 +0100 (BST)
Subject: Re: [PATCH v5 5/7] ocxl: Expose the thread_id needed for wait on
 POWER9
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
 <20180511061303.10728-6-alastair@au1.ibm.com>
From:   Frederic Barrat <fbarrat@linux.ibm.com>
Date:   Fri, 11 May 2018 11:25:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180511061303.10728-6-alastair@au1.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 18051109-0008-0000-0000-000004F57B6F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18051109-0009-0000-0000-00001E89CC71
Message-Id: <9656b063-eafd-a882-c678-a1c4d504cd54@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-05-11_03:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805110091
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



Le 11/05/2018 à 08:13, Alastair D'Silva a écrit :
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> In order to successfully issue as_notify, an AFU needs to know the TID
> to notify, which in turn means that this information should be
> available in userspace so it can be communicated to the AFU.
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---

Ok, so we keep the limitation of having only one thread per context able 
to call 'wait', even though we don't have to worry about depleting the 
pool of TIDs any more. I think that's acceptable, though we don't really 
have a reason to justify it any more. Any reason you want to keep it 
that way?

   Fred


>   drivers/misc/ocxl/context.c       |  5 ++-
>   drivers/misc/ocxl/file.c          | 53 +++++++++++++++++++++++++++++++
>   drivers/misc/ocxl/link.c          | 36 +++++++++++++++++++++
>   drivers/misc/ocxl/ocxl_internal.h |  1 +
>   include/misc/ocxl.h               |  9 ++++++
>   include/uapi/misc/ocxl.h          |  8 +++++
>   6 files changed, 111 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/ocxl/context.c b/drivers/misc/ocxl/context.c
> index 909e8807824a..95f74623113e 100644
> --- a/drivers/misc/ocxl/context.c
> +++ b/drivers/misc/ocxl/context.c
> @@ -34,6 +34,8 @@ int ocxl_context_init(struct ocxl_context *ctx, struct ocxl_afu *afu,
>   	mutex_init(&ctx->xsl_error_lock);
>   	mutex_init(&ctx->irq_lock);
>   	idr_init(&ctx->irq_idr);
> +	ctx->tidr = 0;
> +
>   	/*
>   	 * Keep a reference on the AFU to make sure it's valid for the
>   	 * duration of the life of the context
> @@ -65,6 +67,7 @@ int ocxl_context_attach(struct ocxl_context *ctx, u64 amr)
>   {
>   	int rc;
> 
> +	// Locks both status & tidr
>   	mutex_lock(&ctx->status_mutex);
>   	if (ctx->status != OPENED) {
>   		rc = -EIO;
> @@ -72,7 +75,7 @@ int ocxl_context_attach(struct ocxl_context *ctx, u64 amr)
>   	}
> 
>   	rc = ocxl_link_add_pe(ctx->afu->fn->link, ctx->pasid,
> -			current->mm->context.id, 0, amr, current->mm,
> +			current->mm->context.id, ctx->tidr, amr, current->mm,
>   			xsl_fault_error, ctx);
>   	if (rc)
>   		goto out;
> diff --git a/drivers/misc/ocxl/file.c b/drivers/misc/ocxl/file.c
> index 038509e5d031..eb409a469f21 100644
> --- a/drivers/misc/ocxl/file.c
> +++ b/drivers/misc/ocxl/file.c
> @@ -5,6 +5,8 @@
>   #include <linux/sched/signal.h>
>   #include <linux/uaccess.h>
>   #include <uapi/misc/ocxl.h>
> +#include <asm/reg.h>
> +#include <asm/switch_to.h>
>   #include "ocxl_internal.h"
> 
> 
> @@ -123,11 +125,55 @@ static long afu_ioctl_get_metadata(struct ocxl_context *ctx,
>   	return 0;
>   }
> 
> +#ifdef CONFIG_PPC64
> +static long afu_ioctl_enable_p9_wait(struct ocxl_context *ctx,
> +		struct ocxl_ioctl_p9_wait __user *uarg)
> +{
> +	struct ocxl_ioctl_p9_wait arg;
> +
> +	memset(&arg, 0, sizeof(arg));
> +
> +	if (cpu_has_feature(CPU_FTR_P9_TIDR)) {
> +		enum ocxl_context_status status;
> +
> +		// Locks both status & tidr
> +		mutex_lock(&ctx->status_mutex);
> +		if (!ctx->tidr) {
> +			if (set_thread_tidr(current))
> +				return -ENOENT;
> +
> +			ctx->tidr = current->thread.tidr;
> +		}
> +
> +		status = ctx->status;
> +		mutex_unlock(&ctx->status_mutex);
> +
> +		if (status == ATTACHED) {
> +			int rc;
> +			struct link *link = ctx->afu->fn->link;
> +
> +			rc = ocxl_link_update_pe(link, ctx->pasid, ctx->tidr);
> +			if (rc)
> +				return rc;
> +		}
> +
> +		arg.thread_id = ctx->tidr;
> +	} else
> +		return -ENOENT;
> +
> +	if (copy_to_user(uarg, &arg, sizeof(arg)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +#endif
> +
>   #define CMD_STR(x) (x == OCXL_IOCTL_ATTACH ? "ATTACH" :			\
>   			x == OCXL_IOCTL_IRQ_ALLOC ? "IRQ_ALLOC" :	\
>   			x == OCXL_IOCTL_IRQ_FREE ? "IRQ_FREE" :		\
>   			x == OCXL_IOCTL_IRQ_SET_FD ? "IRQ_SET_FD" :	\
>   			x == OCXL_IOCTL_GET_METADATA ? "GET_METADATA" :	\
> +			x == OCXL_IOCTL_ENABLE_P9_WAIT ? "ENABLE_P9_WAIT" :	\
>   			"UNKNOWN")
> 
>   static long afu_ioctl(struct file *file, unsigned int cmd,
> @@ -186,6 +232,13 @@ static long afu_ioctl(struct file *file, unsigned int cmd,
>   				(struct ocxl_ioctl_metadata __user *) args);
>   		break;
> 
> +#ifdef CONFIG_PPC64
> +	case OCXL_IOCTL_ENABLE_P9_WAIT:
> +		rc = afu_ioctl_enable_p9_wait(ctx,
> +				(struct ocxl_ioctl_p9_wait __user *) args);
> +		break;
> +#endif
> +
>   	default:
>   		rc = -EINVAL;
>   	}
> diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
> index 656e8610eec2..88876ae8f330 100644
> --- a/drivers/misc/ocxl/link.c
> +++ b/drivers/misc/ocxl/link.c
> @@ -544,6 +544,42 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
>   }
>   EXPORT_SYMBOL_GPL(ocxl_link_add_pe);
> 
> +int ocxl_link_update_pe(void *link_handle, int pasid, __u16 tid)
> +{
> +	struct link *link = (struct link *) link_handle;
> +	struct spa *spa = link->spa;
> +	struct ocxl_process_element *pe;
> +	int pe_handle, rc;
> +
> +	if (pasid > SPA_PASID_MAX)
> +		return -EINVAL;
> +
> +	pe_handle = pasid & SPA_PE_MASK;
> +	pe = spa->spa_mem + pe_handle;
> +
> +	mutex_lock(&spa->spa_lock);
> +
> +	pe->tid = tid;
> +
> +	/*
> +	 * The barrier makes sure the PE is updated
> +	 * before we clear the NPU context cache below, so that the
> +	 * old PE cannot be reloaded erroneously.
> +	 */
> +	mb();
> +
> +	/*
> +	 * hook to platform code
> +	 * On powerpc, the entry needs to be cleared from the context
> +	 * cache of the NPU.
> +	 */
> +	rc = pnv_ocxl_spa_remove_pe_from_cache(link->platform_data, pe_handle);
> +	WARN_ON(rc);
> +
> +	mutex_unlock(&spa->spa_lock);
> +	return rc;
> +}
> +
>   int ocxl_link_remove_pe(void *link_handle, int pasid)
>   {
>   	struct link *link = (struct link *) link_handle;
> diff --git a/drivers/misc/ocxl/ocxl_internal.h b/drivers/misc/ocxl/ocxl_internal.h
> index 5d421824afd9..a32f2151029f 100644
> --- a/drivers/misc/ocxl/ocxl_internal.h
> +++ b/drivers/misc/ocxl/ocxl_internal.h
> @@ -77,6 +77,7 @@ struct ocxl_context {
>   	struct ocxl_xsl_error xsl_error;
>   	struct mutex irq_lock;
>   	struct idr irq_idr;
> +	u16 tidr; // Thread ID used for P9 wait implementation
>   };
> 
>   struct ocxl_process_element {
> diff --git a/include/misc/ocxl.h b/include/misc/ocxl.h
> index 51ccf76db293..9ff6ddc28e22 100644
> --- a/include/misc/ocxl.h
> +++ b/include/misc/ocxl.h
> @@ -188,6 +188,15 @@ extern int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
>   		void (*xsl_err_cb)(void *data, u64 addr, u64 dsisr),
>   		void *xsl_err_data);
> 
> +/**
> + * Update values within a Process Element
> + *
> + * link_handle: the link handle associated with the process element
> + * pasid: the PASID for the AFU context
> + * tid: the new thread id for the process element
> + */
> +extern int ocxl_link_update_pe(void *link_handle, int pasid, __u16 tid);
> +
>   /*
>    * Remove a Process Element from the Shared Process Area for a link
>    */
> diff --git a/include/uapi/misc/ocxl.h b/include/uapi/misc/ocxl.h
> index 0af83d80fb3e..561e6f0dfcb7 100644
> --- a/include/uapi/misc/ocxl.h
> +++ b/include/uapi/misc/ocxl.h
> @@ -48,6 +48,13 @@ struct ocxl_ioctl_metadata {
>   	__u64 reserved[13]; // Total of 16*u64
>   };
> 
> +struct ocxl_ioctl_p9_wait {
> +	__u16 thread_id; // The thread ID required to wake this thread
> +	__u16 reserved1;
> +	__u32 reserved2;
> +	__u64 reserved3[3];
> +};
> +
>   struct ocxl_ioctl_irq_fd {
>   	__u64 irq_offset;
>   	__s32 eventfd;
> @@ -62,5 +69,6 @@ struct ocxl_ioctl_irq_fd {
>   #define OCXL_IOCTL_IRQ_FREE	_IOW(OCXL_MAGIC, 0x12, __u64)
>   #define OCXL_IOCTL_IRQ_SET_FD	_IOW(OCXL_MAGIC, 0x13, struct ocxl_ioctl_irq_fd)
>   #define OCXL_IOCTL_GET_METADATA _IOR(OCXL_MAGIC, 0x14, struct ocxl_ioctl_metadata)
> +#define OCXL_IOCTL_ENABLE_P9_WAIT	_IOR(OCXL_MAGIC, 0x15, struct ocxl_ioctl_p9_wait)
> 
>   #endif /* _UAPI_MISC_OCXL_H */
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
