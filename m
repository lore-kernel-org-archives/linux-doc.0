Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DF9331202
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 23:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768521396; cv=none; b=UFFaHJU69Dp0I5p05AZlyRG3VrVmxVWS+fzkwGRG4RJ/9Uy9DFK6dwoREkqtDEaJa4fzZbGX5XiUxUwi7baWyzWnnlnSudxyNXb0qIvw/3Opi6Ws4wcvZhk2d5ZtSs/3V0D7reIzUQ/IBInmAs/37NVwQei3ESOJcH2bbWBNoRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768521396; c=relaxed/simple;
	bh=QDPfz9ujw/RP1aYpy3CyZsrtxzsxbZGQiCEVPNme1oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VPIlZNGoNLRUyunwH5VWnh5gi19AkFZHr3y0S2osYyYHjyiZIZIb8NgJz1cd4qWbp4CczA94nIGJUR3BDBsoEYqtpMYmCccRkqvPnl95YeIa36zRLOKaSbo/gliXNYk5zWBTvSEBmRH02wBJjT1an0+83GoQQILNnFTNopntIas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gF08ylFA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IP8o4PDW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gF08ylFA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IP8o4PDW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMd2qE4101603
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 23:56:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=irBiMr6CSbVRpYyOwfv82LqW
	psqYNDBdD+tqHLqBSZI=; b=gF08ylFAUxFHsYjFUuZnr3tqhwjYRsGlydrkv9zD
	T9KmNe4vJh1QQrR2XB3754hRbNcmNUgPRPKBjKt7fCkH2Ku+xLQcurfjxmfgbvVc
	uch+M13GWIyx8I+zqAkW3d4RB+Wr3iQ2lcIecrQFTJk8Rg/qv7ocCNt/4pcJKGCW
	oEx9KTImWDV3+otwOk3hGhbbT9aUlBO676aBU3vfqLCd3juPi4w5KToneoMMtvZQ
	1Ab7FOU9ujAcmPWLd9ENyXyg7bKINiWycPyzT6EQqxMZl/Vd8SE0tTTn67Hzi6o3
	4HNvX229swWpxSB9XVcR67SlnlUtNtZpX/xg7C1eh7CVNw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq97504nx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 23:56:34 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1219f27037fso5318474c88.1
        for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 15:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768521394; x=1769126194; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=irBiMr6CSbVRpYyOwfv82LqWpsqYNDBdD+tqHLqBSZI=;
        b=IP8o4PDWQTySB6dylvvCkzmvYLSBIyZeIHHByjD8PNBw6awVbwVZAN+PzkYiUAbZ/4
         urRotl5HhIwL87IFbDERTKDASPHwWxtDeXmQQQrAEre8qJjW+munVNn+2Nyz7yJTQguP
         YdY6o5O3OBUZblX9DBmOjfDWkIEK1lN/5T8sGFapXYVuv0svQQtkdzPzPK6kwwU1+yu+
         EtPBKkhkUltpmyzh0nPUdtao/HEDZHoERRvG7+5cwP22tdNX8w98GoCVi6nmXWEJOH5M
         gD0/JUampyN4kxMM2mZ5eiChIslKctujEj0nMoWv/OscNA1iFdutnnzLdoupr95vlL1g
         vVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768521394; x=1769126194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=irBiMr6CSbVRpYyOwfv82LqWpsqYNDBdD+tqHLqBSZI=;
        b=VGF40H3CEdSozyOL1JmkIbI6CagmxIHJ84b1KRCdKhJyPi8yq52fYzy0fAK8L3X2f0
         x8wacudYK6SgUqkvFu4K3U66pVFFbVx/4dol+C785d3bg90PB3sCUNxsWLdgkHGP/JFX
         ejaixIxf4MPGMhWlGNERnw58V0pO/JvogGzwETWj5/R97dGro/B8hW7CoefnmF/lMFy8
         gSdIGUMy2fDEm7lXr4MLeYnyzm7pPSyB3wPYWiew8OeGqnIlJWDuVqioEuvCmH1qTwA7
         wW4ej3brZVlSNAX7P9duXiSmqHWXoIjs1nxcvREPk4e6g750L7xXDcFctA4WfwwVNMmo
         kJgA==
X-Forwarded-Encrypted: i=1; AJvYcCW6moTIu1sag6rrGXmxAkECdrLEt0PV959Z1uIIy21qIITxNFjTSdwZ42x/pIQECgZEqR1mT1XvSOg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+1in5q7GPt8A0plygFxOBVQs2W8OfOPfQvM5t4qL6/xgAco/i
	gcYeXPRiK13PB2PBbwzCBnIEBtkN6JQDuwdj6gHjcC5ZmFUYpihMCOnO+kLQlcd/k/qp8WaDK+q
	7CoMgx+RHzmYKgrnLcfQueqdEN/Fl8oNWMoGTRjl7WsZ9YYZHQE/+DPQ5XPkbBr0=
X-Gm-Gg: AY/fxX4XpL/26TVpg9nZrogpSK+Pdhppg+rQXZgSs10pGW/yMp3aMaAw8yfRHPEBSwh
	/iYXRJjYKxDZNTwXrQCze7vflvQpQ48Y6ZlebY+RmoqaCxzesu2lk7/bydEyCJEquVHYnuzP1jN
	FINeg9WdFs5QELgUftl9cWTgG08Zc2dkiU5o/Xn0gW6HeY8P9896Tm4jtV/icrErhY5G90Cqq8t
	roXfvyR8Ucn9wj1QWulHA4anzgXx62tscDQ1Y7ZEsyHKEeHtKQHncQfsVdgkB1G+5crxl5Iuz+9
	wseL93jKjmW9UHCh8sy6GdQveeZZhoHl3OPik/aHLl4MOCzoNWq15HAw0/hw+vtdTzHqhnafQ91
	VWzPp9NC9eiqIufIR6Io=
X-Received: by 2002:a05:7022:6286:b0:11d:f44c:afbc with SMTP id a92af1059eb24-1244a74fb80mr1753394c88.37.1768521393917;
        Thu, 15 Jan 2026 15:56:33 -0800 (PST)
X-Received: by 2002:a05:7022:6286:b0:11d:f44c:afbc with SMTP id a92af1059eb24-1244a74fb80mr1753378c88.37.1768521393394;
        Thu, 15 Jan 2026 15:56:33 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10c3csm879911c88.15.2026.01.15.15.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 15:56:32 -0800 (PST)
Date: Thu, 15 Jan 2026 17:56:31 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: fangyu.yu@linux.alibaba.com
Cc: pbonzini@redhat.com, corbet@lwn.net, anup@brainfault.org,
        atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, alex@ghiti.fr, guoren@kernel.org,
        ajones@ventanamicro.com, rkrcmar@ventanamicro.com,
        linux-doc@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE
Message-ID: <dfhacs3uppweqmw5t6gwli2iy3b7l5oj6saykogjb5qkadl4rc@bi7mvnezkd2m>
References: <20260105143232.76715-1-fangyu.yu@linux.alibaba.com>
 <20260105143232.76715-3-fangyu.yu@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105143232.76715-3-fangyu.yu@linux.alibaba.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE5MCBTYWx0ZWRfX1l7ZDU+Wo1C9
 6vQGRtKXU7vg49kNVX2j/lqeu9o9TbrRJI2sAAInQ644yMfLCiI8GwgfQxy8VhEEcqbBkdUIcvb
 5g/MlRP45bcPCsFoHiZMhn0D8Y5IR3U/JcPlU2835SJDSj9m0XX594nxzaSu+89cwrhvQRoaczN
 SrfgQLddhaUdwT85UosYP2xMqKjqnRE98UTEXOVJ9SHJlvIP9F73MzSWuhOj+qk3E4egKgD0KBL
 QeZyt85M7oD8AXvQhKaEK51SdHeto3NgGPFX7S14Ij8Vz8w7dIueJCWWyWV19W4aIE7NXHsnR3y
 ksejwwTp0miswElaWu7ygD9dy6BnrXSIN7rI9pyz1VbtAb2U78DxqRLJagauddYDxcepZiFUrlb
 sVAIdEuSSJ/yb+sAieYEp2c4gw1N+Co0wkWbX64MIPI7X32K79onOxZe2cl62+qtjUIyCecSvn1
 fMIhOChSsVpuX21u92A==
X-Authority-Analysis: v=2.4 cv=Sv6dKfO0 c=1 sm=1 tr=0 ts=69697eb2 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SRrdq9N9AAAA:8 a=SurXiuQvfP0cLrRCYjkA:9
 a=CjuIK1q_8ugA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: s7lETXpax6ujUR4wtJ7ASXZOkXZVtxYp
X-Proofpoint-ORIG-GUID: s7lETXpax6ujUR4wtJ7ASXZOkXZVtxYp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150190

On Mon, Jan 05, 2026 at 10:32:32PM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> This capability allows userspace to explicitly select the HGATP mode
> for the VM. The selected mode must be less than or equal to the max
> HGATP mode supported by the hardware. This capability must be enabled
> before creating any vCPUs, and can only be set once per VM.
> 
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>  Documentation/virt/kvm/api.rst | 14 ++++++++++++++
>  arch/riscv/kvm/vm.c            | 26 ++++++++++++++++++++++++--
>  include/uapi/linux/kvm.h       |  1 +
>  3 files changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 01a3abef8abb..9e17788e3a9d 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -8765,6 +8765,20 @@ helpful if user space wants to emulate instructions which are not
>  This capability can be enabled dynamically even if VCPUs were already
>  created and are running.
>  
> +7.47 KVM_CAP_RISCV_SET_HGATP_MODE
> +---------------------------------
> +
> +:Architectures: riscv
> +:Type: VM
> +:Parameters: args[0] contains the requested HGATP mode
> +:Returns: 0 on success, -EINVAL if arg[0] is outside the range of hgatp
> +          modes supported by the hardware.
> +
> +This capability allows userspace to explicitly select the HGATP mode for
> +the VM. The selected mode must be less than or equal to the maximum HGATP
> +mode supported by the hardware. This capability must be enabled before
> +creating any vCPUs, and can only be set once per VM.

I think I would prefer a KVM_CAP_RISCV_SET_MAX_GPA type of capability. The
reason is because, while one of the results of the max-gpa being set will
be to set hgatp, there may be other reasons to track the guest's maximum
physical address too and kvm userspace shouldn't need to think about each
individually.

> +
>  8. Other capabilities.
>  ======================
>  
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> index 4b2156df40fc..e9275023a73a 100644
> --- a/arch/riscv/kvm/vm.c
> +++ b/arch/riscv/kvm/vm.c
> @@ -202,6 +202,13 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  	case KVM_CAP_VM_GPA_BITS:
>  		r = kvm_riscv_gstage_gpa_bits(&kvm->arch);
>  		break;
> +	case KVM_CAP_RISCV_SET_HGATP_MODE:
> +#ifdef CONFIG_64BIT
> +		r = 1;
> +#else/* CONFIG_32BIT */
> +		r = 0;
> +#endif

 r = IS_ENABLED(CONFIG_64BIT) ? 1 : 0;

> +		break;
>  	default:
>  		r = 0;
>  		break;
> @@ -212,12 +219,27 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  
>  int kvm_vm_ioctl_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap)
>  {
> +	if (cap->flags)
> +		return -EINVAL;

add blank line

>  	switch (cap->cap) {
>  	case KVM_CAP_RISCV_MP_STATE_RESET:
> -		if (cap->flags)
> -			return -EINVAL;
>  		kvm->arch.mp_state_reset = true;
>  		return 0;
> +	case KVM_CAP_RISCV_SET_HGATP_MODE:
> +#ifdef CONFIG_64BIT
> +		if (cap->args[0] < HGATP_MODE_SV39X4 ||
> +			cap->args[0] > kvm_riscv_gstage_max_mode)
> +			return -EINVAL;
> +		if (kvm->arch.gstage_mode_initialized)
> +			return 0;

I think we want to return -EBUSY here and it should be documented where it
already states "...can only be set once per VM"

> +		kvm->arch.gstage_mode_initialized = true;

In the previous patch I thought we were missing this, but I see now it
means "user initialized". Let's rename it as such,

 gstage_mode_user_initialized

> +		kvm->arch.kvm_riscv_gstage_mode = cap->args[0];
> +		kvm->arch.kvm_riscv_gstage_pgd_levels = 3 +
> +		    kvm->arch.kvm_riscv_gstage_mode - HGATP_MODE_SV39X4;
> +		kvm_info("using SV%lluX4 G-stage page table format\n",
> +			39 + (cap->args[0] - HGATP_MODE_SV39X4) * 9);
> +#endif
> +		return 0;
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index dddb781b0507..00c02a880518 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -974,6 +974,7 @@ struct kvm_enable_cap {
>  #define KVM_CAP_GUEST_MEMFD_FLAGS 244
>  #define KVM_CAP_ARM_SEA_TO_USER 245
>  #define KVM_CAP_S390_USER_OPEREXEC 246
> +#define KVM_CAP_RISCV_SET_HGATP_MODE 247
>  
>  struct kvm_irq_routing_irqchip {
>  	__u32 irqchip;
> -- 
> 2.50.1
>

Thanks,
drew
