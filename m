Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEF92D738F
	for <linux-doc@vger.kernel.org>; Wed,  4 Feb 2026 15:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770219135; cv=none; b=Cg9cJW6m+tjwHesrwpz/oBz1ONdG6a2LGvMaL3LrfORmUJfDJ/4oCwp4Dbpdvx85TciiR3YeLrPBkHc+lF0hzAkgK6iDOuH5btp492iFJToqBezK9enscMl9CcGGRXeeNVKN6nbNm4aE7CUxPZAczVcc1k3+M8mO+6AOZGFmmpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770219135; c=relaxed/simple;
	bh=jQ/H+uFlXQoG+y9fBq7/d6vFWT2gHX2YV0WdQx3ii8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PbeZmGKLhdxcMAGX9g8+U9SVG3ZfT46kFX5x60BOxEiBiVuHYWpdDvcr6Z4MLiYXIkU+7WC41jPd0ygLLfJVFYDxETdWnL2n9KLHsoDnrht3bNDz112+Zxc+VxLazpEnBJCeHkXd8Y/1czildJOQe00LJVsN/iODMhp7Z4lvQb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U94BpjJS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=COaDX+4x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U94BpjJS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="COaDX+4x"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIOQF1032392
	for <linux-doc@vger.kernel.org>; Wed, 4 Feb 2026 15:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bi4g99czQrt2gJHSucwRU9Ng
	jJmZN0TE+9w+nsNMdA4=; b=U94BpjJSBKk18ZTtVDUHRaUn1pI65boZWx5o8lUP
	bI0SpeiXzNAsbpv6LuAeNh58LThBHrP2KPOz/tnpTAQhWUb5MYTO0HHlNnaI/zKY
	+bCuPdaSLYQjt8UBYbT5SLWv6bxVcWd0oU8Z4DQ+IHx4ATCbLDfdKUzua7IJlIBq
	oPCYyq77dVQaCeQCcoVH8LMPDWJk3VcdnWiGDvvlYJUJ3SGl+CWI5VaB4wetx67d
	DyWWl3qDwrlSKm6IX5GAR/ZCZJj8ptxkIDPMKXj9u4KZGVRCZ9IfwnwuqCS8Xie7
	QBPleBDsSTTuiu11R68/glAKNlPFH0/wW99w5IR2wZuPhA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3ne7ut8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 04 Feb 2026 15:32:14 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-124a95b6f61so27967699c88.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Feb 2026 07:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770219134; x=1770823934; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bi4g99czQrt2gJHSucwRU9NgjJmZN0TE+9w+nsNMdA4=;
        b=COaDX+4xtOL71EkgUBDTXInzt8jX1Ayon9sDulwFlgoRZbX5Be7HIgTkgbvPL1LfGG
         LiF/61rQ6oRdedOT3shCA5G6nBAM7XOu8SP0S8+rseGHEcNIEimQlBJvW79MR/aGSvgO
         IAxrdI1xR0hR9fLbNqGfrHx4IchAVizy0l5JC9scZUnXB7StthTt5pAI2EkkbxSLy95i
         Fajd5zPs4Pj24j1TRZxZAOY0g+CvxEyLNnRaCHi6JwRnwTI6JpMM140xL4fmxbAZZCtp
         UttNj9wZJ+EU4FBjui+t3UH8UZTLmcmVVeEYbs8rpiCbTWAIuelmNExztCFmF+GOvb/q
         B3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770219134; x=1770823934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bi4g99czQrt2gJHSucwRU9NgjJmZN0TE+9w+nsNMdA4=;
        b=dNC/8SSXVAReXugT52oieTwsGEaPjNEcK/eneuPig/AhkqF3V5DHIuq0N9+nKVKr5C
         9MhPvfUFy3ofICCAkFn6SfbjhYuO7+ND3+bHY22fyhEeHyncmM51anlcwA2ohycWj54P
         llU7Bia1C9UWw3UtNXTiqsWne9Xc5LtdyTqA4EWtQX2su4BIgkFVVs2yVpkzPwqmnTls
         ZyBpgWZTqKPYVWAF28VfQExhZAI2X6mE+eweSY0qj++1idgesIcejNglz23Q7xAsYFz9
         e4a1TseQeZqW+YNHJWfzn2+6bSQtIEX+ccOCzy/7QBciUAVEtnjwUnzzw4yGlvNiMDpE
         AZUw==
X-Forwarded-Encrypted: i=1; AJvYcCVG17GgcFkHTCG5dmdaJyndeMKm7XGiPMX7gRuWQY3ThrRlGPvOXf5qOa5rM0jIVns0neyLXZgOty4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqHFzHan38YtjGRW0PfFYzOiOZBgDy0MqW/5Slmc1T73rXmhvB
	GgfceQPChf6HQRRweDTZ4vxta3vrsg3LAz7wo1Ku5KfrUmwHlve7TIXUosak9cv1Q2DhgWU9Nnt
	RMXYVVf8AubYb68mz+9lWwEqiE5mt+G2vPX7muj26mQbjkXYEx7frAeL+OIKhf9s=
X-Gm-Gg: AZuq6aLCGoJIzv1xOfM9pju9O0KGFscBxD8u1req/bqUYK4q1VTcM2pPCpjn6NxyJ9I
	HJ6f7XD8wpgNVBzbyLN5rKPBj3B4h8EyiCqMmVEU1LQvl0hyPifQanIUnzTILF1ephmy7bD9TBS
	kxCAPQTHJmM9r+t56GEofsOMitCkRKAF0BrHOr9X0ZVYo/Iu6X4dRG4qZVAKrGVOAV2VJE/SVdI
	CMZPEpBh79HulS6dMoCZpVkV760Z9JhMzWrB3iP9BW0fjVWivtiWfhMbm2iCxfUcg3TByPLhIq4
	XFTOe/3sOAS/NR9+9RlCvQZkpl7nJuFTw1l/vnG1HWRcfGLyq2twTQ4wlAVC6eT+lFz16eTX3ye
	yC3FaDuKq7S41oH0lj+E=
X-Received: by 2002:a05:7022:41a5:b0:119:e56b:c74d with SMTP id a92af1059eb24-126f477ec7dmr1578531c88.18.1770219133737;
        Wed, 04 Feb 2026 07:32:13 -0800 (PST)
X-Received: by 2002:a05:7022:41a5:b0:119:e56b:c74d with SMTP id a92af1059eb24-126f477ec7dmr1578502c88.18.1770219133062;
        Wed, 04 Feb 2026 07:32:13 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b832faea55sm1748208eec.23.2026.02.04.07.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 07:32:12 -0800 (PST)
Date: Wed, 4 Feb 2026 09:32:10 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: fangyu.yu@linux.alibaba.com
Cc: pbonzini@redhat.com, corbet@lwn.net, anup@brainfault.org,
        atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, alex@ghiti.fr, guoren@kernel.org,
        radim.krcmar@oss.qualcomm.com, linux-doc@vger.kernel.org,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE
Message-ID: <ocfqo4zpsg6yyaz6kd65jrvudtb35uerdsueazqdk6w7c5lvdf@wvwzhc57gxez>
References: <20260204134507.33912-1-fangyu.yu@linux.alibaba.com>
 <20260204134507.33912-4-fangyu.yu@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204134507.33912-4-fangyu.yu@linux.alibaba.com>
X-Proofpoint-ORIG-GUID: SI7iC9WGOFo2bSU3awIdO7G-wJbU-19H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDExOCBTYWx0ZWRfX3tnGHXIaEMni
 erAdaizCcQv4N6WRPGw3SeXmcakXKr30I+lU0SBIKtVRrwvSc0RJ6YBnj2BSm8JChhqt5nKeD22
 CQ8b395TLpT2kP3qc7NxkI7feFxdt9eqp92oxIxyd9+ehXLhz4rf0er6AXj/7bQic3GxDcjhkBv
 lrqfQ6teVa4fFoQSPtSh840fgdxPby1HzPjoFkrHMVM+Mb1jgrrqmh2mMCmkbRtXSiUksdgSFzB
 XDKfCyD+RNVqTlDJ6vGEjbJzgHRgIsT/So94wwcAxsXPJKpaUddImQbRGjxcVm3FfvXEIv7rxt5
 koVVZ4YzvrS805/ZZPT75WLyeWjfRzYjNE2J+eqkL/Tf1ehSiVma1t+DJM01sKokiPGRnYtxCeY
 nh9YAsC3BJtzZct0ANJ+pp2g3pmJ4EPrhXvtXfuI6kldMeNe3EcV67iq6ZYvjRoW6z7IVv2CXzS
 5NpxXaJr6WO821kEMRg==
X-Authority-Analysis: v=2.4 cv=TZmbdBQh c=1 sm=1 tr=0 ts=6983667e cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SRrdq9N9AAAA:8 a=JHdZcz8r7pWqP9VHEEMA:9
 a=CjuIK1q_8ugA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: SI7iC9WGOFo2bSU3awIdO7G-wJbU-19H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_04,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040118

On Wed, Feb 04, 2026 at 09:45:07PM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> Add a VM capability that allows userspace to select the G-stage page table
> format by setting HGATP.MODE on a per-VM basis.
> 
> Userspace enables the capability via KVM_ENABLE_CAP, passing the requested
> HGATP.MODE in args[0]. The request is rejected with -EINVAL if the mode is
> not supported by the host, and with -EBUSY if the VM has already been
> committed (e.g. vCPUs have been created or any memslot is populated).
> 
> KVM_CHECK_EXTENSION(KVM_CAP_RISCV_SET_HGATP_MODE) returns a bitmask of the
> HGATP.MODE formats supported by the host.
> 
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>  Documentation/virt/kvm/api.rst | 27 +++++++++++++++++++++++++++
>  arch/riscv/kvm/vm.c            | 19 +++++++++++++++++--
>  include/uapi/linux/kvm.h       |  1 +
>  3 files changed, 45 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 01a3abef8abb..62dc120857c1 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -8765,6 +8765,33 @@ helpful if user space wants to emulate instructions which are not
>  This capability can be enabled dynamically even if VCPUs were already
>  created and are running.
>  
> +7.47 KVM_CAP_RISCV_SET_HGATP_MODE
> +---------------------------------
> +
> +:Architectures: riscv
> +:Type: VM
> +:Parameters: args[0] contains the requested HGATP mode
> +:Returns:
> +  - 0 on success.
> +  - -EINVAL if args[0] is outside the range of HGATP modes supported by the
> +    hardware.
> +  - -EBUSY if vCPUs have already been created for the VM, if the VM has any
> +    non-empty memslots.
> +

Currently the documentation for KVM_SET_ONE_REG has this for EBUSY

  EBUSY    (riscv) changing register value not allowed after the vcpu
           has run at least once

I suggest we update the KVM_SET_ONE_REG EBUSY description to say

(riscv) changing register value not allowed. This may occur after the vcpu
has run at least once or when other setup has completed which depends on
the value of the register.

> +This capability allows userspace to explicitly select the HGATP mode for
> +the VM. The selected mode must be supported by both KVM and hardware. This
> +capability must be enabled before creating any vCPUs or memslots.
> +
> +If this capability is not enabled, KVM will select the default HGATP mode
> +automatically. The default is the highest HGATP.MODE value supported by
> +hardware.
> +
> +``KVM_CHECK_EXTENSION(KVM_CAP_RISCV_SET_HGATP_MODE)`` returns a bitmask of
> +HGATP.MODE values supported by the host. A return value of 0 indicates that
> +the capability is not supported. Supported-mode bitmask use HGATP.MODE
> +encodings as defined by the RISC-V privileged specification, such as Sv39x4
> +corresponds to HGATP.MODE=8, so userspace should test bitmask & BIT(8).
> +
>  8. Other capabilities.
>  ======================
>  
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> index 4b2156df40fc..7d1e1d257df5 100644
> --- a/arch/riscv/kvm/vm.c
> +++ b/arch/riscv/kvm/vm.c
> @@ -202,6 +202,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  	case KVM_CAP_VM_GPA_BITS:
>  		r = kvm_riscv_gstage_gpa_bits(&kvm->arch);
>  		break;
> +	case KVM_CAP_RISCV_SET_HGATP_MODE:
> +		r = kvm_riscv_get_hgatp_mode_mask();
> +		break;
>  	default:
>  		r = 0;
>  		break;
> @@ -212,12 +215,24 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  
>  int kvm_vm_ioctl_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap)
>  {
> +	if (cap->flags)
> +		return -EINVAL;
> +
>  	switch (cap->cap) {
>  	case KVM_CAP_RISCV_MP_STATE_RESET:
> -		if (cap->flags)
> -			return -EINVAL;
>  		kvm->arch.mp_state_reset = true;
>  		return 0;
> +	case KVM_CAP_RISCV_SET_HGATP_MODE:
> +		if (!kvm_riscv_hgatp_mode_is_valid(cap->args[0]))
> +			return -EINVAL;
> +
> +		if (kvm->created_vcpus || !kvm_are_all_memslots_empty(kvm))
> +			return -EBUSY;
> +#ifdef CONFIG_64BIT
> +		kvm->arch.kvm_riscv_gstage_pgd_levels =
> +				3 + cap->args[0] - HGATP_MODE_SV39X4;
> +#endif

 'if (IS_ENABLED(CONFIG_64BIT))' is preferred to the #ifdef.

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
