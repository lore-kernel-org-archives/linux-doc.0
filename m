Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28EDFC7EE2F
	for <linux-doc@archiver.kernel.org>; Tue,  6 Jun 2023 13:35:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237677AbjFFNfs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Jun 2023 09:35:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234603AbjFFNfr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Jun 2023 09:35:47 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05D83E78
        for <linux-doc@vger.kernel.org>; Tue,  6 Jun 2023 06:35:43 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f7378a75c0so22858415e9.3
        for <linux-doc@vger.kernel.org>; Tue, 06 Jun 2023 06:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686058541; x=1688650541;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p/Ujp/AD9YOOfXlc1eN4uRJawzh0f8+V5Q/m4o75UsQ=;
        b=SYbHTqY3TtaFf59L1qeP+nYcDjJyj7CFSrKUpEYfZjeFhHTjpDNz4fC3h6ywrl3EBz
         IXt3CNqa1bWlEGGteyIrlqBNT7xsezrLu7MeK0dfrRaSdgewTE2XUeJeQYcZitLllZX8
         IFQDaiOGLCWTFs59mZHwMvuDPStFLJkr7L8hwYCuRAZID5bRd+tmZhzjUrZmAWoRBEzn
         d8xR6p6oNCcIOLF5GmIrOql9IMGCiOGVKLKir2F+nxgq3cKzEXf3ebFwebYXB5UWJRlp
         IVzcifIJ3GDlltl9OedXUpcXEbV0vmmmZCe00aGIj+nGM0fplqU2v0DCn0uZriHsRyGI
         16jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686058541; x=1688650541;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p/Ujp/AD9YOOfXlc1eN4uRJawzh0f8+V5Q/m4o75UsQ=;
        b=B3DlzLp8G5tLjQ7QnToEpFZ1WywkbkfY4iK8zngASq5WxHJSKeubJ/A2ESiHxwDH47
         8iCSVigZB3/bO5rpWF5CvbIWgler3WPyKnWf91vwt+cUnmWhMb5Q5qfsbs80SCL0m8+2
         uPZa6K55qHCjjAtoHVIQx53M48g1Qc3QDDRfmjMVMC6uUW4uJl0wSC4qWc/E3RC4hqgp
         q38Y0cAWVwVYOYVYGqKD2zSj1txx6Pl2ZbvkW8B+9mTppMD0u2btWE/V/MdQx2Kvn1iD
         3iEO+foCZC2IY9oxGvrs1af/GKXjZzaTAD7hUP3P7woCRviCgdHm1CLJ8KaR5HrEq9KN
         QGtg==
X-Gm-Message-State: AC+VfDxgYVVzgnbcgN/mdLImYLj0EVbjgmZwivgKhLrm+xkAKhiBG3TB
        YIaPGdNnsLmQ1l62IGPssJ1fyw==
X-Google-Smtp-Source: ACHHUZ6NnQo1KPM2CAhRTl9x2B9+y4SDHlWnPg4f8EEedLSlw/SAk5n3w7vgn0Ak19sAJi1ppNaNNQ==
X-Received: by 2002:a1c:750a:0:b0:3f6:69f:75cd with SMTP id o10-20020a1c750a000000b003f6069f75cdmr2208951wmc.0.1686058541112;
        Tue, 06 Jun 2023 06:35:41 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id c11-20020a05600c0acb00b003f72d7dc66esm10871828wmr.13.2023.06.06.06.35.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 06:35:40 -0700 (PDT)
Message-ID: <3ed018a1-d2fe-d210-158d-c1a13928eab2@linaro.org>
Date:   Tue, 6 Jun 2023 14:35:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v13 09/24] gunyah: rsc_mgr: Add RPC for sharing memory
Content-Language: en-US
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Alex Elder <elder@linaro.org>,
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
References: <20230509204801.2824351-1-quic_eberman@quicinc.com>
 <20230509204801.2824351-10-quic_eberman@quicinc.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230509204801.2824351-10-quic_eberman@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 09/05/2023 21:47, Elliot Berman wrote:
> Gunyah resource manager provides API to manipulate stage 2 page tables.
> Manipulations are represented as a memory parcel. Memory parcels
> describe a list of memory regions (intermediate physical address and
> size), a list of new permissions for VMs, and the memory type (DDR or
> MMIO). Memory parcels are uniquely identified by a handle allocated by
> Gunyah. There are a few types of memory parcel sharing which Gunyah
> supports:
> 
>   - Sharing: the guest and host VM both have access
>   - Lending: only the guest has access; host VM loses access
>   - Donating: Permanently lent (not reclaimed even if guest shuts down)
> 
> Memory parcels that have been shared or lent can be reclaimed by the
> host via an additional call. The reclaim operation restores the original
> access the host VM had to the memory parcel and removes the access to
> other VM.
> 
> One point to note that memory parcels don't describe where in the guest
> VM the memory parcel should reside. The guest VM must accept the memory
> parcel either explicitly via a "gh_rm_mem_accept" call (not introduced
> here) or be configured to accept it automatically at boot. As the guest
> VM accepts the memory parcel, it also mentions the IPA it wants to place
> memory parcel.
> 
> Co-developed-by: Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>
> Signed-off-by: Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---




Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini

>   drivers/virt/gunyah/rsc_mgr_rpc.c | 227 ++++++++++++++++++++++++++++++
>   include/linux/gunyah_rsc_mgr.h    |  48 +++++++
>   2 files changed, 275 insertions(+)
> 
> diff --git a/drivers/virt/gunyah/rsc_mgr_rpc.c b/drivers/virt/gunyah/rsc_mgr_rpc.c
> index a4a9f0ba4e1f..4f25f07400b3 100644
> --- a/drivers/virt/gunyah/rsc_mgr_rpc.c
> +++ b/drivers/virt/gunyah/rsc_mgr_rpc.c
> @@ -6,6 +6,12 @@
>   #include <linux/gunyah_rsc_mgr.h>
>   #include "rsc_mgr.h"
>   
> +/* Message IDs: Memory Management */
> +#define GH_RM_RPC_MEM_LEND			0x51000012
> +#define GH_RM_RPC_MEM_SHARE			0x51000013
> +#define GH_RM_RPC_MEM_RECLAIM			0x51000015
> +#define GH_RM_RPC_MEM_APPEND			0x51000018
> +
>   /* Message IDs: VM Management */
>   #define GH_RM_RPC_VM_ALLOC_VMID			0x56000001
>   #define GH_RM_RPC_VM_DEALLOC_VMID		0x56000002
> @@ -22,6 +28,46 @@ struct gh_rm_vm_common_vmid_req {
>   	__le16 _padding;
>   } __packed;
>   
> +/* Call: MEM_LEND, MEM_SHARE */
> +#define GH_MEM_SHARE_REQ_FLAGS_APPEND		BIT(1)
> +
> +struct gh_rm_mem_share_req_header {
> +	u8 mem_type;
> +	u8 _padding0;
> +	u8 flags;
> +	u8 _padding1;
> +	__le32 label;
> +} __packed;
> +
> +struct gh_rm_mem_share_req_acl_section {
> +	__le32 n_entries;
> +	struct gh_rm_mem_acl_entry entries[];
> +};
> +
> +struct gh_rm_mem_share_req_mem_section {
> +	__le16 n_entries;
> +	__le16 _padding;
> +	struct gh_rm_mem_entry entries[];
> +};
> +
> +/* Call: MEM_RELEASE */
> +struct gh_rm_mem_release_req {
> +	__le32 mem_handle;
> +	u8 flags; /* currently not used */
> +	u8 _padding0;
> +	__le16 _padding1;
> +} __packed;
> +
> +/* Call: MEM_APPEND */
> +#define GH_MEM_APPEND_REQ_FLAGS_END		BIT(0)
> +
> +struct gh_rm_mem_append_req_header {
> +	__le32 mem_handle;
> +	u8 flags;
> +	u8 _padding0;
> +	__le16 _padding1;
> +} __packed;
> +
>   /* Call: VM_ALLOC */
>   struct gh_rm_vm_alloc_vmid_resp {
>   	__le16 vmid;
> @@ -51,6 +97,8 @@ struct gh_rm_vm_config_image_req {
>   	__le64 dtb_size;
>   } __packed;
>   
> +#define GH_RM_MAX_MEM_ENTRIES	512
> +
>   /*
>    * Several RM calls take only a VMID as a parameter and give only standard
>    * response back. Deduplicate boilerplate code by using this common call.
> @@ -64,6 +112,185 @@ static int gh_rm_common_vmid_call(struct gh_rm *rm, u32 message_id, u16 vmid)
>   	return gh_rm_call(rm, message_id, &req_payload, sizeof(req_payload), NULL, NULL);
>   }
>   
> +static int _gh_rm_mem_append(struct gh_rm *rm, u32 mem_handle, bool end_append,
> +			struct gh_rm_mem_entry *mem_entries, size_t n_mem_entries)
> +{
> +	struct gh_rm_mem_share_req_mem_section *mem_section;
> +	struct gh_rm_mem_append_req_header *req_header;
> +	size_t msg_size = 0;
> +	void *msg;
> +	int ret;
> +
> +	msg_size += sizeof(struct gh_rm_mem_append_req_header);
> +	msg_size += struct_size(mem_section, entries, n_mem_entries);
> +
> +	msg = kzalloc(msg_size, GFP_KERNEL);
> +	if (!msg)
> +		return -ENOMEM;
> +
> +	req_header = msg;
> +	mem_section = (void *)req_header + sizeof(struct gh_rm_mem_append_req_header);
> +
> +	req_header->mem_handle = cpu_to_le32(mem_handle);
> +	if (end_append)
> +		req_header->flags |= GH_MEM_APPEND_REQ_FLAGS_END;
> +
> +	mem_section->n_entries = cpu_to_le16(n_mem_entries);
> +	memcpy(mem_section->entries, mem_entries, sizeof(*mem_entries) * n_mem_entries);
> +
> +	ret = gh_rm_call(rm, GH_RM_RPC_MEM_APPEND, msg, msg_size, NULL, NULL);
> +	kfree(msg);
> +
> +	return ret;
> +}
> +
> +static int gh_rm_mem_append(struct gh_rm *rm, u32 mem_handle,
> +			struct gh_rm_mem_entry *mem_entries, size_t n_mem_entries)
> +{
> +	bool end_append;
> +	int ret = 0;
> +	size_t n;
> +
> +	while (n_mem_entries) {
> +		if (n_mem_entries > GH_RM_MAX_MEM_ENTRIES) {
> +			end_append = false;
> +			n = GH_RM_MAX_MEM_ENTRIES;
> +		} else {
> +			end_append = true;
> +			n = n_mem_entries;
> +		}
> +
> +		ret = _gh_rm_mem_append(rm, mem_handle, end_append, mem_entries, n);
> +		if (ret)
> +			break;
> +
> +		mem_entries += n;
> +		n_mem_entries -= n;
> +	}
> +
> +	return ret;
> +}
> +
> +static int gh_rm_mem_lend_common(struct gh_rm *rm, u32 message_id, struct gh_rm_mem_parcel *p)
> +{
> +	size_t msg_size = 0, initial_mem_entries = p->n_mem_entries, resp_size;
> +	size_t acl_section_size, mem_section_size;
> +	struct gh_rm_mem_share_req_acl_section *acl_section;
> +	struct gh_rm_mem_share_req_mem_section *mem_section;
> +	struct gh_rm_mem_share_req_header *req_header;
> +	u32 *attr_section;
> +	__le32 *resp;
> +	void *msg;
> +	int ret;
> +
> +	if (!p->acl_entries || !p->n_acl_entries || !p->mem_entries || !p->n_mem_entries ||
> +	    p->n_acl_entries > U8_MAX || p->mem_handle != GH_MEM_HANDLE_INVAL)
> +		return -EINVAL;
> +
> +	if (initial_mem_entries > GH_RM_MAX_MEM_ENTRIES)
> +		initial_mem_entries = GH_RM_MAX_MEM_ENTRIES;
> +
> +	acl_section_size = struct_size(acl_section, entries, p->n_acl_entries);
> +	mem_section_size = struct_size(mem_section, entries, initial_mem_entries);
> +	/* The format of the message goes:
> +	 * request header
> +	 * ACL entries (which VMs get what kind of access to this memory parcel)
> +	 * Memory entries (list of memory regions to share)
> +	 * Memory attributes (currently unused, we'll hard-code the size to 0)
> +	 */
> +	msg_size += sizeof(struct gh_rm_mem_share_req_header);
> +	msg_size += acl_section_size;
> +	msg_size += mem_section_size;
> +	msg_size += sizeof(u32); /* for memory attributes, currently unused */
> +
> +	msg = kzalloc(msg_size, GFP_KERNEL);
> +	if (!msg)
> +		return -ENOMEM;
> +
> +	req_header = msg;
> +	acl_section = (void *)req_header + sizeof(*req_header);
> +	mem_section = (void *)acl_section + acl_section_size;
> +	attr_section = (void *)mem_section + mem_section_size;
> +
> +	req_header->mem_type = p->mem_type;
> +	if (initial_mem_entries != p->n_mem_entries)
> +		req_header->flags |= GH_MEM_SHARE_REQ_FLAGS_APPEND;
> +	req_header->label = cpu_to_le32(p->label);
> +
> +	acl_section->n_entries = cpu_to_le32(p->n_acl_entries);
> +	memcpy(acl_section->entries, p->acl_entries,
> +		flex_array_size(acl_section, entries, p->n_acl_entries));
> +
> +	mem_section->n_entries = cpu_to_le16(initial_mem_entries);
> +	memcpy(mem_section->entries, p->mem_entries,
> +		flex_array_size(mem_section, entries, initial_mem_entries));
> +
> +	/* Set n_entries for memory attribute section to 0 */
> +	*attr_section = 0;
> +
> +	ret = gh_rm_call(rm, message_id, msg, msg_size, (void **)&resp, &resp_size);
> +	kfree(msg);
> +
> +	if (ret)
> +		return ret;
> +
> +	p->mem_handle = le32_to_cpu(*resp);
> +	kfree(resp);
> +
> +	if (initial_mem_entries != p->n_mem_entries) {
> +		ret = gh_rm_mem_append(rm, p->mem_handle,
> +					&p->mem_entries[initial_mem_entries],
> +					p->n_mem_entries - initial_mem_entries);
> +		if (ret) {
> +			gh_rm_mem_reclaim(rm, p);
> +			p->mem_handle = GH_MEM_HANDLE_INVAL;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * gh_rm_mem_lend() - Lend memory to other virtual machines.
> + * @rm: Handle to a Gunyah resource manager
> + * @parcel: Information about the memory to be lent.
> + *
> + * Lending removes Linux's access to the memory while the memory parcel is lent.
> + */
> +int gh_rm_mem_lend(struct gh_rm *rm, struct gh_rm_mem_parcel *parcel)
> +{
> +	return gh_rm_mem_lend_common(rm, GH_RM_RPC_MEM_LEND, parcel);
> +}
> +
> +
> +/**
> + * gh_rm_mem_share() - Share memory with other virtual machines.
> + * @rm: Handle to a Gunyah resource manager
> + * @parcel: Information about the memory to be shared.
> + *
> + * Sharing keeps Linux's access to the memory while the memory parcel is shared.
> + */
> +int gh_rm_mem_share(struct gh_rm *rm, struct gh_rm_mem_parcel *parcel)
> +{
> +	return gh_rm_mem_lend_common(rm, GH_RM_RPC_MEM_SHARE, parcel);
> +}
> +
> +/**
> + * gh_rm_mem_reclaim() - Reclaim a memory parcel
> + * @rm: Handle to a Gunyah resource manager
> + * @parcel: Information about the memory to be reclaimed.
> + *
> + * RM maps the associated memory back into the stage-2 page tables of the owner VM.
> + */
> +int gh_rm_mem_reclaim(struct gh_rm *rm, struct gh_rm_mem_parcel *parcel)
> +{
> +	struct gh_rm_mem_release_req req = {
> +		.mem_handle = cpu_to_le32(parcel->mem_handle),
> +	};
> +
> +	return gh_rm_call(rm, GH_RM_RPC_MEM_RECLAIM, &req, sizeof(req), NULL, NULL);
> +}
> +
>   /**
>    * gh_rm_alloc_vmid() - Allocate a new VM in Gunyah. Returns the VM identifier.
>    * @rm: Handle to a Gunyah resource manager
> diff --git a/include/linux/gunyah_rsc_mgr.h b/include/linux/gunyah_rsc_mgr.h
> index 1ac66d9004d2..dfac088420bd 100644
> --- a/include/linux/gunyah_rsc_mgr.h
> +++ b/include/linux/gunyah_rsc_mgr.h
> @@ -11,6 +11,7 @@
>   #include <linux/gunyah.h>
>   
>   #define GH_VMID_INVAL		U16_MAX
> +#define GH_MEM_HANDLE_INVAL	U32_MAX
>   
>   struct gh_rm;
>   int gh_rm_notifier_register(struct gh_rm *rm, struct notifier_block *nb);
> @@ -51,7 +52,54 @@ struct gh_rm_vm_status_payload {
>   
>   #define GH_RM_NOTIFICATION_VM_STATUS		 0x56100008
>   
> +#define GH_RM_ACL_X		BIT(0)
> +#define GH_RM_ACL_W		BIT(1)
> +#define GH_RM_ACL_R		BIT(2)
> +
> +struct gh_rm_mem_acl_entry {
> +	__le16 vmid;
> +	u8 perms;
> +	u8 reserved;
> +} __packed;
> +
> +struct gh_rm_mem_entry {
> +	__le64 phys_addr;
> +	__le64 size;
> +} __packed;
> +
> +enum gh_rm_mem_type {
> +	GH_RM_MEM_TYPE_NORMAL	= 0,
> +	GH_RM_MEM_TYPE_IO	= 1,
> +};
> +
> +/*
> + * struct gh_rm_mem_parcel - Info about memory to be lent/shared/donated/reclaimed
> + * @mem_type: The type of memory: normal (DDR) or IO
> + * @label: An client-specified identifier which can be used by the other VMs to identify the purpose
> + *         of the memory parcel.
> + * @n_acl_entries: Count of the number of entries in the @acl_entries array.
> + * @acl_entries: An array of access control entries. Each entry specifies a VM and what access
> + *               is allowed for the memory parcel.
> + * @n_mem_entries: Count of the number of entries in the @mem_entries array.
> + * @mem_entries: An array of regions to be associated with the memory parcel. Addresses should be
> + *               (intermediate) physical addresses from Linux's perspective.
> + * @mem_handle: On success, filled with memory handle that RM allocates for this memory parcel
> + */
> +struct gh_rm_mem_parcel {
> +	enum gh_rm_mem_type mem_type;
> +	u32 label;
> +	size_t n_acl_entries;
> +	struct gh_rm_mem_acl_entry *acl_entries;
> +	size_t n_mem_entries;
> +	struct gh_rm_mem_entry *mem_entries;
> +	u32 mem_handle;
> +};
> +
>   /* RPC Calls */
> +int gh_rm_mem_lend(struct gh_rm *rm, struct gh_rm_mem_parcel *parcel);
> +int gh_rm_mem_share(struct gh_rm *rm, struct gh_rm_mem_parcel *parcel);
> +int gh_rm_mem_reclaim(struct gh_rm *rm, struct gh_rm_mem_parcel *parcel);
> +
>   int gh_rm_alloc_vmid(struct gh_rm *rm, u16 vmid);
>   int gh_rm_dealloc_vmid(struct gh_rm *rm, u16 vmid);
>   int gh_rm_vm_reset(struct gh_rm *rm, u16 vmid);
