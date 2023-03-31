Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E202DC76196
	for <linux-doc@archiver.kernel.org>; Fri, 31 Mar 2023 14:27:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232800AbjCaO1w (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 31 Mar 2023 10:27:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232827AbjCaO1n (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 31 Mar 2023 10:27:43 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EB0B20C1A
        for <linux-doc@vger.kernel.org>; Fri, 31 Mar 2023 07:27:06 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id g19so21786639qts.9
        for <linux-doc@vger.kernel.org>; Fri, 31 Mar 2023 07:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680272823; x=1682864823;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IgTXkcIiC0h9wm5MLlPl4UB+1jDZi2nsxdXSiSdb80E=;
        b=ZARDdcnIhnzIj1icXHRSJV7Kc/TS7hPtltn5UFpTYpkSHooI8QKmBNdidesBZ+UDt8
         t6ODUQCj24a9pUuw32xWxxf9VTiHQReblirNQJV/ThX9V4PUIWbeV3WGdWpW/2G7tD0z
         bLPn+a8UZOf1tRTtevv/doKSsXtWM5VqXuHv99PA2TT6eonzDo8OM6WIpldnn+7sXLYO
         1SvQ7ouIYXs9hJQcXoSTE6GG/WX+mHhT2P2zd08SOyQ3olTjdaXxW/ccpC4FQDs/cAAb
         0uHKqB9GY4Nu8ZQ3AjtKIZBg3GBuLJR7ROBPz1mvQgEmXJ3+DTLzB+TcJPUw2ivW3IZH
         kiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680272823; x=1682864823;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IgTXkcIiC0h9wm5MLlPl4UB+1jDZi2nsxdXSiSdb80E=;
        b=RY1I7zYA/rgMH/1UjfrOJIMxip5OyruSUVsWWa0ep3P9ryvOv/9lOEfqRaxrti8nYL
         8MmtytKoM2gbHwlSMx37y2IdLXAwipyBZcGKM3umzYB7uLKDKD5hU3/7PuObAsMxat0n
         MSpzyv8r2Dr6uSTzq/TWdfSEFspRBLbFkXNERh/uEjEVAZ5lApRaIQ3XX05p8C2q10xN
         gP866u1KgfLmFBypJypaucblxbvnroFV5OyxTgydQEaJwgHKRrNtKnJso9RYmCLCmpt+
         TJ9c45Cd5I4A6ArZYTYU7rx2D9dq0ZEoSldoTlAST0b5CVxTFHPXPvQ3gCp7uGNmNH8S
         9J2Q==
X-Gm-Message-State: AAQBX9dmx7xjyEoj1Wbwf1q0S2ed921s6IswTqCcaKSdj0lK7h+J26MQ
        evJWNr85RXbsWkGK9isjQnygzA==
X-Google-Smtp-Source: AKy350Zr0W/Swpo+wuuMF5zMYWmZqMgGBl7FFUrAaIRvugwUMnavndzfU0CvNHm9xYeFDEbxmphhPQ==
X-Received: by 2002:ac8:5c49:0:b0:3e6:3861:b1f6 with SMTP id j9-20020ac85c49000000b003e63861b1f6mr7967260qtj.0.1680272823453;
        Fri, 31 Mar 2023 07:27:03 -0700 (PDT)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id c131-20020a379a89000000b007468ed0160csm684172qke.128.2023.03.31.07.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 07:27:03 -0700 (PDT)
Message-ID: <dd56d297-2483-5b7d-4c63-fd103070af5c@linaro.org>
Date:   Fri, 31 Mar 2023 09:27:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From:   Alex Elder <elder@linaro.org>
Subject: Re: [PATCH v11 20/26] virt: gunyah: Add resource tickets
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>
Cc:     Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Will Deacon <will@kernel.org>, Andy Gross <agross@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230304010632.2127470-1-quic_eberman@quicinc.com>
 <20230304010632.2127470-21-quic_eberman@quicinc.com>
Content-Language: en-US
In-Reply-To: <20230304010632.2127470-21-quic_eberman@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 3/3/23 7:06 PM, Elliot Berman wrote:
> Some VM functions need to acquire Gunyah resources. For instance, Gunyah
> vCPUs are exposed to the host as a resource. The Gunyah vCPU function
> will register a resource ticket and be able to interact with the
> hypervisor once the resource ticket is filled.
> 
> Resource tickets are the mechanism for functions to acquire ownership of
> Gunyah resources. Gunyah functions can be created before the VM's
> resources are created and made available to Linux. A resource ticket
> identifies a type of resource and a label of a resource which the ticket
> holder is interested in.
> 
> Resources are created by Gunyah as configured in the VM's devicetree
> configuration. Gunyah doesn't process the label and that makes it
> possible for userspace to create multiple resources with the same label.
> Resource ticket owners need to be prepared for populate to be called
> multiple times if userspace created multiple resources with the same
> label.
> 
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>

One possibly substantive suggestion here, plus a couple suggestions
to add or revise comments.

					-Alex

> ---
>   drivers/virt/gunyah/vm_mgr.c  | 112 +++++++++++++++++++++++++++++++++-
>   drivers/virt/gunyah/vm_mgr.h  |   4 ++
>   include/linux/gunyah_vm_mgr.h |  14 +++++
>   3 files changed, 129 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/virt/gunyah/vm_mgr.c b/drivers/virt/gunyah/vm_mgr.c
> index 88db011395ec..0269bcdaf692 100644
> --- a/drivers/virt/gunyah/vm_mgr.c
> +++ b/drivers/virt/gunyah/vm_mgr.c
> @@ -165,6 +165,74 @@ static long gh_vm_rm_function(struct gh_vm *ghvm, struct gh_fn_desc *f)
>   	return r;
>   }
>   
> +int gh_vm_add_resource_ticket(struct gh_vm *ghvm, struct gh_vm_resource_ticket *ticket)
> +{
> +	struct gh_vm_resource_ticket *iter;
> +	struct gh_resource *ghrsc;
> +	int ret = 0;
> +
> +	mutex_lock(&ghvm->resources_lock);
> +	list_for_each_entry(iter, &ghvm->resource_tickets, list) {
> +		if (iter->resource_type == ticket->resource_type && iter->label == ticket->label) {
> +			ret = -EEXIST;
> +			goto out;
> +		}
> +	}
> +
> +	if (!try_module_get(ticket->owner)) {
> +		ret = -ENODEV;
> +		goto out;
> +	}
> +
> +	list_add(&ticket->list, &ghvm->resource_tickets);
> +	INIT_LIST_HEAD(&ticket->resources);
> +
> +	list_for_each_entry(ghrsc, &ghvm->resources, list) {
> +		if (ghrsc->type == ticket->resource_type && ghrsc->rm_label == ticket->label) {
> +			if (!ticket->populate(ticket, ghrsc))
> +				list_move(&ghrsc->list, &ticket->resources);
> +		}
> +	}
> +out:
> +	mutex_unlock(&ghvm->resources_lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(gh_vm_add_resource_ticket);
> +
> +void gh_vm_remove_resource_ticket(struct gh_vm *ghvm, struct gh_vm_resource_ticket *ticket)
> +{
> +	struct gh_resource *ghrsc, *iter;
> +
> +	mutex_lock(&ghvm->resources_lock);
> +	list_for_each_entry_safe(ghrsc, iter, &ticket->resources, list) {
> +		ticket->unpopulate(ticket, ghrsc);
> +		list_move(&ghrsc->list, &ghvm->resources);
> +	}
> +
> +	module_put(ticket->owner);
> +	list_del(&ticket->list);
> +	mutex_unlock(&ghvm->resources_lock);
> +}
> +EXPORT_SYMBOL_GPL(gh_vm_remove_resource_ticket);
> +
> +static void gh_vm_add_resource(struct gh_vm *ghvm, struct gh_resource *ghrsc)
> +{
> +	struct gh_vm_resource_ticket *ticket;
> +
> +	mutex_lock(&ghvm->resources_lock);
> +	list_for_each_entry(ticket, &ghvm->resource_tickets, list) {
> +		if (ghrsc->type == ticket->resource_type && ghrsc->rm_label == ticket->label) {
> +			if (!ticket->populate(ticket, ghrsc)) {
> +				list_add(&ghrsc->list, &ticket->resources);
> +				goto found;
> +			}

I think the "goto found" belongs here, unconditionally.
You disallow adding more than one ticket of a given type
with the same label.  So you will never match another
ticket once you've matched this one.

The populate function generally shouldn't fail.  I think
it only fails if you find a duplicate, and again, I think
you prevent that from happening.  (But if it does, you
silently ignore it...)

> +		}
> +	}
> +	list_add(&ghrsc->list, &ghvm->resources);
> +found:
> +	mutex_unlock(&ghvm->resources_lock);
> +}
> +
>   static int gh_vm_rm_notification_status(struct gh_vm *ghvm, void *data)
>   {
>   	struct gh_rm_vm_status_payload *payload = data;
> @@ -230,6 +298,8 @@ static void gh_vm_free(struct work_struct *work)
>   {
>   	struct gh_vm *ghvm = container_of(work, struct gh_vm, free_work);
>   	struct gh_vm_function_instance *inst, *iiter;
> +	struct gh_vm_resource_ticket *ticket, *titer;
> +	struct gh_resource *ghrsc, *riter;
>   	struct gh_vm_mem *mapping, *tmp;
>   	int ret;
>   
> @@ -246,6 +316,25 @@ static void gh_vm_free(struct work_struct *work)
>   		}
>   		mutex_unlock(&ghvm->fn_lock);
>   
> +		mutex_lock(&ghvm->resources_lock);
> +		if (!list_empty(&ghvm->resource_tickets)) {
> +			dev_warn(ghvm->parent, "Dangling resource tickets:\n");
> +			list_for_each_entry_safe(ticket, titer, &ghvm->resource_tickets, list) {
> +				dev_warn(ghvm->parent, "  %pS\n", ticket->populate);
> +				gh_vm_remove_resource_ticket(ghvm, ticket);
> +			}
> +		}
> +
> +		list_for_each_entry_safe(ghrsc, riter, &ghvm->resources, list) {
> +			gh_rm_free_resource(ghrsc);
> +		}
> +		mutex_unlock(&ghvm->resources_lock);
> +
> +		ret = gh_rm_vm_reset(ghvm->rm, ghvm->vmid);
> +		if (ret)
> +			dev_err(ghvm->parent, "Failed to reset the vm: %d\n", ret);
> +		wait_event(ghvm->vm_status_wait, ghvm->vm_status == GH_RM_VM_STATUS_RESET);
> +
>   		mutex_lock(&ghvm->mm_lock);
>   		list_for_each_entry_safe(mapping, tmp, &ghvm->memory_mappings, list) {
>   			gh_vm_mem_reclaim(ghvm, mapping);
> @@ -329,6 +418,9 @@ static __must_check struct gh_vm *gh_vm_alloc(struct gh_rm *rm)
>   	init_rwsem(&ghvm->status_lock);
>   	INIT_WORK(&ghvm->free_work, gh_vm_free);
>   	kref_init(&ghvm->kref);
> +	mutex_init(&ghvm->resources_lock);
> +	INIT_LIST_HEAD(&ghvm->resources);
> +	INIT_LIST_HEAD(&ghvm->resource_tickets);
>   	INIT_LIST_HEAD(&ghvm->functions);
>   	ghvm->vm_status = GH_RM_VM_STATUS_LOAD;
>   
> @@ -338,9 +430,11 @@ static __must_check struct gh_vm *gh_vm_alloc(struct gh_rm *rm)
>   static int gh_vm_start(struct gh_vm *ghvm)
>   {
>   	struct gh_vm_mem *mapping;
> +	struct gh_rm_hyp_resources *resources;
> +	struct gh_resource *ghrsc;
>   	u64 dtb_offset;
>   	u32 mem_handle;
> -	int ret;
> +	int ret, i, n;
>   
>   	down_write(&ghvm->status_lock);
>   	if (ghvm->vm_status != GH_RM_VM_STATUS_LOAD) {
> @@ -394,6 +488,22 @@ static int gh_vm_start(struct gh_vm *ghvm)
>   		goto err;
>   	}
>   
> +	ret = gh_rm_get_hyp_resources(ghvm->rm, ghvm->vmid, &resources);
> +	if (ret) {
> +		dev_warn(ghvm->parent, "Failed to get hypervisor resources for VM: %d\n", ret);
> +		goto err;
> +	}
> +
> +	for (i = 0, n = le32_to_cpu(resources->n_entries); i < n; i++) {
> +		ghrsc = gh_rm_alloc_resource(ghvm->rm, &resources->entries[i]);
> +		if (!ghrsc) {
> +			ret = -ENOMEM;
> +			goto err;
> +		}
> +
> +		gh_vm_add_resource(ghvm, ghrsc);
> +	}
> +
>   	ret = gh_rm_vm_start(ghvm->rm, ghvm->vmid);
>   	if (ret) {
>   		dev_warn(ghvm->parent, "Failed to start VM: %d\n", ret);
> diff --git a/drivers/virt/gunyah/vm_mgr.h b/drivers/virt/gunyah/vm_mgr.h
> index 7bd271bad721..18d0e1effd25 100644
> --- a/drivers/virt/gunyah/vm_mgr.h
> +++ b/drivers/virt/gunyah/vm_mgr.h
> @@ -7,6 +7,7 @@
>   #define _GH_PRIV_VM_MGR_H
>   
>   #include <linux/gunyah_rsc_mgr.h>
> +#include <linux/gunyah_vm_mgr.h>
>   #include <linux/list.h>
>   #include <linux/kref.h>
>   #include <linux/miscdevice.h>
> @@ -51,6 +52,9 @@ struct gh_vm {
>   	struct list_head memory_mappings;
>   	struct mutex fn_lock;
>   	struct list_head functions;
> +	struct mutex resources_lock;
> +	struct list_head resources;
> +	struct list_head resource_tickets;
>   };
>   
>   int gh_vm_mem_alloc(struct gh_vm *ghvm, struct gh_userspace_memory_region *region);
> diff --git a/include/linux/gunyah_vm_mgr.h b/include/linux/gunyah_vm_mgr.h
> index 3825c951790a..01b1761b5923 100644
> --- a/include/linux/gunyah_vm_mgr.h
> +++ b/include/linux/gunyah_vm_mgr.h
> @@ -70,4 +70,18 @@ void gh_vm_function_unregister(struct gh_vm_function *f);
>   	DECLARE_GH_VM_FUNCTION(_name, _type, _bind, _unbind);	\
>   	module_gh_vm_function(_name)
>   
> +struct gh_vm_resource_ticket {
> +	struct list_head list; /* for gh_vm's resources list */

Maybe "resource lists" above (it's for the resources list and
resource_tickets list).

> +	struct list_head resources; /* for gh_resources's list */

Maybe:	/* resources associated with this ticket */

> +	enum gh_resource_type resource_type;
> +	u32 label;
> +
> +	struct module *owner;
> +	int (*populate)(struct gh_vm_resource_ticket *ticket, struct gh_resource *ghrsc);
> +	void (*unpopulate)(struct gh_vm_resource_ticket *ticket, struct gh_resource *ghrsc);
> +};
> +
> +int gh_vm_add_resource_ticket(struct gh_vm *ghvm, struct gh_vm_resource_ticket *ticket);
> +void gh_vm_remove_resource_ticket(struct gh_vm *ghvm, struct gh_vm_resource_ticket *ticket);
> +
>   #endif

