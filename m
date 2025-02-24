Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C7E1DDC18
	for <linux-doc@vger.kernel.org>; Mon, 24 Feb 2025 21:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740432928; cv=none; b=QR7OudF/+NZvHoyhMIg6g9P7+c1smXlnyHoZ31zA3ROObazfowb3RNRUTFzZWjSd26SnfRQc3tbfzQxLYj2GdjEL0OU6V2V2EWD4IWlAlYw36e3rKBiPTi4Foduz8i6xJonTYIdTaWpvLwQDWAFuTHgABROFfp2NdkMc7ZyCaOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740432928; c=relaxed/simple;
	bh=CklY92L/luBbyXKHUyxRozag9ZBDMc/0NOvwGO8rZRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OionDXTWMMh4vkv9fvOPGxoK8eXv6RrKi/HTaOZj8RLpJoJFbRwlhWAwax9I/vv5BtwffVAi9shC8D45aLYtPBmUNPWI75tWspHkOOuZkZTCEbgrXQjzEj0oHPsKinP1DpZMzUjqNixoSiQCcA2oKCM+2vCa9FNJcTByNqaDz8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yIo4sNmB; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yIo4sNmB"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22117c396baso12625ad.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Feb 2025 13:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740432926; x=1741037726; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B6MDLYjLn+ocuz7r4vs09MXpA233UNWx/xCnRJqXepo=;
        b=yIo4sNmBhoj13Cj4WSyFIsmJiJDR5FV6ogljpf0d/N8bR30aVMl9Ch0r5JP19BE3XJ
         IbuMWX61NRAuB/09oCK2Bc6dYlMB9k5EIX/rY0cxh3BM7DFIN3D7zvHIMG5/Hk5wPwx9
         dro926fQ1y5OaywNdOpCV9uzzpHjBlK78cCO/qzP30OTeplObvliCVAIAOzbFaPqIh17
         tQaXrmZixHfDKnJ6pHo6c0E17Y0VWgx6sL4dmhKvTkh9Le17Kic/mjY86LhTPbKGDLea
         Z49eSwUIx1w1q2xqKKkDpA2QbKpccGOvfCnAUOJPnqpq6LJ/cxv3NCr8Rly7C41Nj4XP
         JgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740432926; x=1741037726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B6MDLYjLn+ocuz7r4vs09MXpA233UNWx/xCnRJqXepo=;
        b=YBR4zaNQtJk2GrbixqIbL8bJzoQVKykp74UgxB4e6uW5MB5KAFjqMqpVqrl5K1MSWe
         r2HWESR5d6hmMQ88LFQjjicLraugh3JxyTDpu1QJFVKdffyZOWCkZ8nnKP+ipx2RlHVu
         mBjQc/OuGXG0wLjEPcvySOdshQKm1oGtg+LZjtTPn1nQgkwRSjNH7j2y2RVszhVG123A
         Zve4eETTw1hRqQloXK+lL7weV32grLDl/Qv894FHd/uTowlecKutCt0lPAHYJ0OJc3Q1
         M9czqGQ2HcIU17fTPfyTGBxauyqG6pP76z5fguUEBiMZlKi3tyCV7319VKjEW1Bi4ioM
         wSNA==
X-Forwarded-Encrypted: i=1; AJvYcCXvwX3yV1EuUXqtuXxJ9KJLVlLEevfwFNXz5ny7N5/KJQIy2lWVm9Kio0bTTSpzVBa2deBpAnnREsg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+Syf3Kc0ixOZCnZa9zn1gOqd2MASRltYswjE6qoPq9MbmKVjw
	LknWAX1NYxbwA/jsuvsaN594SVd5NrnPqqmwSmZadswvBNo0Vb0hw3pWr2s+GQ==
X-Gm-Gg: ASbGncu6qi+MfWRFWm/lypEA8eLK0hXh3lJIDI8lp+V2WgPNpwZ5eP1Z5lCEb1uza8K
	XvMibQ1J4fBhVpFVPCIwTXmf4kDfwiet15S1nzVNzdg9oSMN33wUdZ0wRhGKhx54MD0H8ntyl6t
	i108J44rpKqhOGiKwR5Q634wFPeadE4YkgYjSSL8aRbLbmbYmxLRmxn4grzgxIGSuolMVvU8Qoz
	NhZPL6n7IxgQYC/mVh0yfpFcUnsvTvsoju+N+AX3A4GKQxCuAKMtmoh0juQO0iea72vJXGGNQBU
	0B5TsTEmF6/J+Pq7O5V0ipiapdj5pbY1YG3HNTOAf1L2Usq7tas38kttVbQOdJs=
X-Google-Smtp-Source: AGHT+IEvbtSCavbWzJzTUhgymYrP41u+KdaH4TpPZexQDV04gmMsaPcW7ZdSgqeE7hyABwizrzsr3A==
X-Received: by 2002:a17:903:234c:b0:21f:2ded:bfc5 with SMTP id d9443c01a7336-22307aab886mr1036055ad.28.1740432925555;
        Mon, 24 Feb 2025 13:35:25 -0800 (PST)
Received: from google.com (169.224.198.35.bc.googleusercontent.com. [35.198.224.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a0a3ca8sm730145ad.169.2025.02.24.13.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 13:35:25 -0800 (PST)
Date: Mon, 24 Feb 2025 21:35:14 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	joro@8bytes.org, suravee.suthikulpanit@amd.com,
	robin.murphy@arm.com, dwmw2@infradead.org, baolu.lu@linux.intel.com,
	shuah@kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
	smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
	patches@lists.linux.dev
Subject: Re: [PATCH v7 13/14] iommu/arm-smmu-v3: Report events that belong to
 devices attached to vIOMMU
Message-ID: <Z7zmErar4YvQSSxw@google.com>
References: <cover.1740238876.git.nicolinc@nvidia.com>
 <b1930038cf828dc13c080e2b46b3003a8c98ef24.1740238876.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1930038cf828dc13c080e2b46b3003a8c98ef24.1740238876.git.nicolinc@nvidia.com>

On Sat, Feb 22, 2025 at 07:54:10AM -0800, Nicolin Chen wrote:
> Aside from the IOPF framework, iommufd provides an additional pathway to
> report hardware events, via the vEVENTQ of vIOMMU infrastructure.
> 
> Define an iommu_vevent_arm_smmuv3 uAPI structure, and report stage-1 events
> in the threaded IRQ handler. Also, add another four event record types that
> can be forwarded to a VM.
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  7 +++
>  include/uapi/linux/iommufd.h                  | 23 +++++++
>  .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 17 ++++++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 60 +++++++++++--------
>  4 files changed, 82 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 85352504343b..c8574969e700 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -1067,6 +1067,7 @@ int arm_smmu_attach_prepare_vmaster(struct arm_smmu_attach_state *state,
>  				    struct iommu_domain *domain);
>  void arm_smmu_attach_commit_vmaster(struct arm_smmu_attach_state *state);
>  void arm_smmu_master_clear_vmaster(struct arm_smmu_master *master);
> +int arm_vmaster_report_event(struct arm_smmu_vmaster *vmaster, u64 *evt);
>  #else
>  #define arm_smmu_hw_info NULL
>  #define arm_vsmmu_alloc NULL
> @@ -1085,6 +1086,12 @@ arm_smmu_attach_commit_vmaster(struct arm_smmu_attach_state *state)
>  static inline void arm_smmu_master_clear_vmaster(struct arm_smmu_master *master)
>  {
>  }
> +
> +static inline int arm_vmaster_report_event(struct arm_smmu_vmaster *vmaster,
> +					   u64 *evt)
> +{
> +	return -EOPNOTSUPP;
> +}
>  #endif /* CONFIG_ARM_SMMU_V3_IOMMUFD */
>  
>  #endif /* _ARM_SMMU_V3_H */
> diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
> index 2ade4839880d..5fc7e27804b7 100644
> --- a/include/uapi/linux/iommufd.h
> +++ b/include/uapi/linux/iommufd.h
> @@ -1054,9 +1054,32 @@ struct iommufd_vevent_header {
>  /**
>   * enum iommu_veventq_type - Virtual Event Queue Type
>   * @IOMMU_VEVENTQ_TYPE_DEFAULT: Reserved for future use
> + * @IOMMU_VEVENTQ_TYPE_ARM_SMMUV3: ARM SMMUv3 Virtual Event Queue
>   */
>  enum iommu_veventq_type {
>  	IOMMU_VEVENTQ_TYPE_DEFAULT = 0,
> +	IOMMU_VEVENTQ_TYPE_ARM_SMMUV3 = 1,
> +};
> +
> +/**
> + * struct iommu_vevent_arm_smmuv3 - ARM SMMUv3 Virtual Event
> + *                                  (IOMMU_VEVENTQ_TYPE_ARM_SMMUV3)
> + * @evt: 256-bit ARM SMMUv3 Event record, little-endian.
> + *       Reported event records: (Refer to "7.3 Event records" in SMMUv3 HW Spec)
> + *       - 0x04 C_BAD_STE
> + *       - 0x06 F_STREAM_DISABLED
> + *       - 0x08 C_BAD_SUBSTREAMID
> + *       - 0x0a C_BAD_CD
> + *       - 0x10 F_TRANSLATION
> + *       - 0x11 F_ADDR_SIZE
> + *       - 0x12 F_ACCESS
> + *       - 0x13 F_PERMISSION
> + *
> + * StreamID field reports a virtual device ID. To receive a virtual event for a
> + * device, a vDEVICE must be allocated via IOMMU_VDEVICE_ALLOC.
> + */
> +struct iommu_vevent_arm_smmuv3 {
> +	__aligned_le64 evt[4];
>  };
>  
>  /**
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> index 364d8469a480..42c7daf4c8c7 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -445,4 +445,21 @@ struct iommufd_viommu *arm_vsmmu_alloc(struct device *dev,
>  	return &vsmmu->core;
>  }
>  
> +int arm_vmaster_report_event(struct arm_smmu_vmaster *vmaster, u64 *evt)
> +{
> +	struct iommu_vevent_arm_smmuv3 vevt;
> +	int i;
> +
> +	lockdep_assert_held(&vmaster->vsmmu->smmu->streams_mutex);
> +
> +	vevt.evt[0] = cpu_to_le64((evt[0] & ~EVTQ_0_SID) |
> +				  FIELD_PREP(EVTQ_0_SID, vmaster->vsid));
> +	for (i = 1; i < EVTQ_ENT_DWORDS; i++)
> +		vevt.evt[i] = cpu_to_le64(evt[i]);

Just thinking out loud here:
I understand the goal here is to "emulate" an IOMMU. But I'm just
wondering if we could report struct events instead of the raw event?

For example, can't we have something like arm_smmu_event here with the
sid changed to vsid? 

Are we taking the raw event since we want to keep the `u64 event_data[]`
field within `struct iommufd_vevent` generic to all architectures?

> +
> +	return iommufd_viommu_report_event(&vmaster->vsmmu->core,
> +					   IOMMU_VEVENTQ_TYPE_ARM_SMMUV3, &vevt,
> +					   sizeof(vevt));
> +}
> +
>  MODULE_IMPORT_NS("IOMMUFD");
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 9e50bcee69d1..fdf8bba14303 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -1813,8 +1813,8 @@ static void arm_smmu_decode_event(struct arm_smmu_device *smmu, u64 *raw,
>  	mutex_unlock(&smmu->streams_mutex);
>  }
>  
> -static int arm_smmu_handle_event(struct arm_smmu_device *smmu,
> -			       struct arm_smmu_event *event)
> +static int arm_smmu_handle_event(struct arm_smmu_device *smmu, u64 *evt,
> +				 struct arm_smmu_event *event)
>  {
>  	int ret = 0;
>  	u32 perm = 0;
> @@ -1823,6 +1823,10 @@ static int arm_smmu_handle_event(struct arm_smmu_device *smmu,
>  	struct iommu_fault *flt = &fault_evt.fault;
>  
>  	switch (event->id) {
> +	case EVT_ID_BAD_STE_CONFIG:
> +	case EVT_ID_STREAM_DISABLED_FAULT:
> +	case EVT_ID_BAD_SUBSTREAMID_CONFIG:
> +	case EVT_ID_BAD_CD_CONFIG:
>  	case EVT_ID_TRANSLATION_FAULT:
>  	case EVT_ID_ADDR_SIZE_FAULT:
>  	case EVT_ID_ACCESS_FAULT:
> @@ -1832,31 +1836,30 @@ static int arm_smmu_handle_event(struct arm_smmu_device *smmu,
>  		return -EOPNOTSUPP;
>  	}
>  
> -	if (!event->stall)
> -		return -EOPNOTSUPP;
> -
> -	if (event->read)
> -		perm |= IOMMU_FAULT_PERM_READ;
> -	else
> -		perm |= IOMMU_FAULT_PERM_WRITE;
> +	if (event->stall) {
> +		if (event->read)
> +			perm |= IOMMU_FAULT_PERM_READ;
> +		else
> +			perm |= IOMMU_FAULT_PERM_WRITE;
>  
> -	if (event->instruction)
> -		perm |= IOMMU_FAULT_PERM_EXEC;
> +		if (event->instruction)
> +			perm |= IOMMU_FAULT_PERM_EXEC;
>  
> -	if (event->privileged)
> -		perm |= IOMMU_FAULT_PERM_PRIV;
> +		if (event->privileged)
> +			perm |= IOMMU_FAULT_PERM_PRIV;
>  
> -	flt->type = IOMMU_FAULT_PAGE_REQ;
> -	flt->prm = (struct iommu_fault_page_request) {
> -		.flags = IOMMU_FAULT_PAGE_REQUEST_LAST_PAGE,
> -		.grpid = event->stag,
> -		.perm = perm,
> -		.addr = event->iova,
> -	};
> +		flt->type = IOMMU_FAULT_PAGE_REQ;
> +		flt->prm = (struct iommu_fault_page_request){
> +			.flags = IOMMU_FAULT_PAGE_REQUEST_LAST_PAGE,
> +			.grpid = event->stag,
> +			.perm = perm,
> +			.addr = event->iova,
> +		};
>  
> -	if (event->ssv) {
> -		flt->prm.flags |= IOMMU_FAULT_PAGE_REQUEST_PASID_VALID;
> -		flt->prm.pasid = event->ssid;
> +		if (event->ssv) {
> +			flt->prm.flags |= IOMMU_FAULT_PAGE_REQUEST_PASID_VALID;
> +			flt->prm.pasid = event->ssid;
> +		}
>  	}
>  
>  	mutex_lock(&smmu->streams_mutex);
> @@ -1866,7 +1869,14 @@ static int arm_smmu_handle_event(struct arm_smmu_device *smmu,
>  		goto out_unlock;
>  	}
>  
> -	ret = iommu_report_device_fault(master->dev, &fault_evt);
> +	if (event->stall) {
> +		ret = iommu_report_device_fault(master->dev, &fault_evt);
> +	} else {
> +		if (master->vmaster && !event->s2)
> +			ret = arm_vmaster_report_event(master->vmaster, evt);
> +		else
> +			ret = -EFAULT; /* Unhandled events should be pinned */
> +	}

Nit:
I don't see the `arm_smmu_handle_event` being called elsewhere, is there
a reason to return -EFAULT instead of -EOPNOTSUPP here?

I think the current behavior here is to return -EOPNOTSUPP if (!event->stall).
Whereas, what we're doing here is:
	if (event->stall) {
	...
	/* do legacy stuff */
	...
	}

	else {
		if (master->vmaster && !event->s2)
			arm_vmaster_report_event(vmaster, evt);
		else
			ret = -EFAULT
	}

	mutex_unlock(&smmu->streams_mutex);
	return ret;

Thus, we end up returning -EFAULT instead of -EOPNOTSUPP in case
event->stall == false. I agree that we aren't really checking the return
value in the evtq_thread handler, but I'm wondering if we should ensure
that we end up retaining the same behaviour as we have right now?

>  out_unlock:
>  	mutex_unlock(&smmu->streams_mutex);
>  	return ret;
> @@ -1944,7 +1954,7 @@ static irqreturn_t arm_smmu_evtq_thread(int irq, void *dev)
>  	do {
>  		while (!queue_remove_raw(q, evt)) {
>  			arm_smmu_decode_event(smmu, evt, &event);
> -			if (arm_smmu_handle_event(smmu, &event))
> +			if (arm_smmu_handle_event(smmu, evt, &event))
>  				arm_smmu_dump_event(smmu, evt, &event, &rs);
>  
>  			put_device(event.dev);
> -- 
> 2.43.0
> 

Thanks,
Praan
