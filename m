Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39EF2F39CE
	for <linux-doc@vger.kernel.org>; Mon,  2 Feb 2026 18:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770058188; cv=none; b=uWxU9N5f7q9iD5yNVfpFyv8k9PHEdw0z5tCz9dc5v+9vjPfu6fvl5h/wSiU5O0re72klxm+Gm7UKnmSsh1Qt8Qi9WhtPO3AxfY10gpeUiNdRfi0Em7PO/vw+7vcEGJwLyqKOrAeIHFAvO+bFDLvpLmbFCDICW/P1NgLp+TsBXuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770058188; c=relaxed/simple;
	bh=+BB3oprmF3IwDJYflvgD/wWi1jKg30NUMwTP70etfhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KAimlCRnfFsyxZUo0/nVPDZPKp1CM5hmpVaQ56NO6K6DsnRf+SXvMuf3PMxMOCgWtuJb/Gte5nHODDdyFUWdHu2IF366bJ4rRt/D09H7Yv5UnJucne4eHUbA4NRWbYeo8Vpl/tNIuGs3fyOPhjZW/bsrGLNjWnQofAT/KbAuyik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pEOj7a3s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O7YjFebL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pEOj7a3s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O7YjFebL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612B5Kv43459105
	for <linux-doc@vger.kernel.org>; Mon, 2 Feb 2026 18:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=McETLnO4ta1TDAPHSx5gBrjB
	YMKIltkUc/cMr5/3QjA=; b=pEOj7a3sf+dmUCl/aWskVTC4TWNe/fNIOQypPRIo
	e28VblZNK1hcy9oPpaREDKlCBo0PDx5kjgDeA1JNgSiZcTvUtSg8NjB1iVg5PNAN
	BH48HLIsizSGBTcH+5I3zm3DoMOICpFQd1HisiSjjCjPEU81G7jD+zzlty+XFhhj
	frUxmqlXUAz7L6oW9pcbVQih9DQck7mNrgrns0yu3/q6L9o9wLGOCHv+qUu6Q5nt
	Ntma4/lTxvzlklcvsFEHKhYLk4XyOIW8EDfu2zr/Q+5YI2jDiP8KROCAA48rngKh
	FkRGWXHSYlpSKdInO4O+pnsS6jFUMhFuC9nR551/ZA/tFA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2trbhdb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 02 Feb 2026 18:49:44 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-124a2d3d1b7so5903300c88.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Feb 2026 10:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770058184; x=1770662984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=McETLnO4ta1TDAPHSx5gBrjBYMKIltkUc/cMr5/3QjA=;
        b=O7YjFebLtI0J6ZteCc2JsWoqGYBKqkiJQ8Lnq3/r3pctHWtrgAb4RuCiNitrMYzOL4
         cOF5lIg2dHwiNCCv8NawAwA29oJN3nBeMFYhOSkQf/yySkYSaxjG16PSaO+X/T9jDGzb
         GmL3Yrgb4UP7ZpqY2JGrtXUP+0SKHEAbRautGHva3R+Bl1s2N+tT9FDYz1ccZtD5C5QO
         5a6GOkXol11JOkBE+Kxk9kUFH+pgQMuwPXO6nR4LoctBv12/A2xtHSlFcy2IQY4xbi9w
         Q5pg7PeCgDQ36qyCS8lnnRn5Anfout7Oz3xOGLIUWMipSXsYhSABTztazoii2/edfv53
         4HXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770058184; x=1770662984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=McETLnO4ta1TDAPHSx5gBrjBYMKIltkUc/cMr5/3QjA=;
        b=YffIwMWFdJ7FJ+kZ/Tog64RcMKaQWenm8MCsSxf6W63ixlWM+gpSJU+ttgvxRH+4eM
         NJIQ6k3aMV8BU79a4eu+TTD4QMk9tKbUot3a9QVZOgj3yY/F2ehogkpY31law3U0xFn6
         EVJTbQ1oLW1V0futpTNwPYsDJ4GDDw4Yy0Oh93YK5hu935SfLtRnClPbtr3VoM88UvyS
         9y3lf/j+YgxEsGy/z0brcj+3BDCfibCwwDRcRvzaW5MY3k0b+tbnILSCxZxfzCcjxUqq
         lXT+FGamcZJFvPvUYB1SwtAJNxYzOu+V7o0s2GsT6elIQn+WvMBCtyL8y9k+M/V5MxnZ
         zJ4w==
X-Forwarded-Encrypted: i=1; AJvYcCXlXD/d3nI3drJwHgB1YPZdd5EX9qv+i8isDT1eEz9Tv0JYzx39hX83ikfcWeJXq7QS1Fa+K1ByyJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK5Mo1XlTRn1la4DpVFZssNNCvEbk7iJAeCRVIBlIHS2Fi3R7L
	w/QkpbeORUhLV/hpGruDIFsWXCYF6RpSZqJyH6uiVPCCj1KjV5fBMW3erjCBbQs8baDoH71oW9k
	NgrNem0OMxoZV/7EhC9tr5cNuewOtSEIatsAbbi76v/FqvZNwJ9+UTFa8um73DJY=
X-Gm-Gg: AZuq6aKGTSuvI3mHJGBkCxWWuz96viSRwXfB9A1m4qdj7A674n/vHHXBl7t3mvpttax
	HZtLjWS5L79Y++yQcIy6jemIdhQsunkaCNohTrFWFv6z4rGS4LqSj0lmYns+GFfQMKSUR0yNvMT
	LwrSq/z9zMHatD9xAxcy5q8iKW1KSGzGrwws9zbjHqUjqJorYAHWebdzrPSrXSitX6M/DqeT9G0
	Kg3c9hgBDi1Mw4fBv0CK7Vxrtw1Wr256IPDbYHWJJFub8Dal1yQ/R3Pq7jXx5IgT9wPEjYAIWsP
	p8IZjChlWnRymy0GkatZLvtYf7RyzuDfIW5WItxV87W0y0E7jXygBgR2qvzQKcfzKLliyHPdDbQ
	SSHAsKmQq5m3Ql0KGD94=
X-Received: by 2002:a05:7022:608f:b0:11b:d4a8:d244 with SMTP id a92af1059eb24-125c0f93c6fmr5769711c88.16.1770058183601;
        Mon, 02 Feb 2026 10:49:43 -0800 (PST)
X-Received: by 2002:a05:7022:608f:b0:11b:d4a8:d244 with SMTP id a92af1059eb24-125c0f93c6fmr5769692c88.16.1770058183010;
        Mon, 02 Feb 2026 10:49:43 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1abedcasm20534927eec.21.2026.02.02.10.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 10:49:42 -0800 (PST)
Date: Mon, 2 Feb 2026 12:49:41 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: fangyu.yu@linux.alibaba.com
Cc: pbonzini@redhat.com, corbet@lwn.net, anup@brainfault.org,
        atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, alex@ghiti.fr, guoren@kernel.org,
        ajones@ventanamicro.com, rkrcmar@ventanamicro.com,
        radim.krcmar@oss.qualcomm.com, linux-doc@vger.kernel.org,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE
Message-ID: <73zrxri5snnenmezjxrdorbcsps4dlvtrkvkq3w4ain4ggbxdl@hjw4u73msaro>
References: <20260202140716.34323-1-fangyu.yu@linux.alibaba.com>
 <20260202140716.34323-4-fangyu.yu@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202140716.34323-4-fangyu.yu@linux.alibaba.com>
X-Proofpoint-ORIG-GUID: QXDdJRgffjUWMYm5AYgYbJiHySy8iPVN
X-Authority-Analysis: v=2.4 cv=dcmNHHXe c=1 sm=1 tr=0 ts=6980f1c8 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SRrdq9N9AAAA:8 a=Y8ST6Fl8U4FUF0grvJQA:9
 a=CjuIK1q_8ugA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: QXDdJRgffjUWMYm5AYgYbJiHySy8iPVN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE0NyBTYWx0ZWRfX0Ogqj7QG0DW9
 EZ6a0gno8e+A/Quj4wpVjmyo3s6OVuYjiQeBYdKZuDBwfsLzIZXgXARyA9GyO/UY9/JnyLuDfQ7
 6MvOoL8GZ16/zM60vQh0iI4inav66i6TejGX1WI5OAV0/w41AWNK4S5hBk9O0U/weB6vmQ896s9
 Hd2/XEdnUB7U06ZzLAjolQISWW71pw+er10wEGbyLvDymtg/wVohRCx4yK9tp8SbyBsa9PaEQjl
 FSJopFE2ycoRbRNj8mQNkDTqsa+WrYBW91x8tR0EgKXyQS/ryCC4rHlD46pIN5KEeDVZctq9+4N
 HR//Fh02mhrzqlcc0Det2Sduc3omqtGEZ/ooVlTeC6Oe3Rw+/cG0dmCxTneo/IlnrUich2Bf3D9
 4jrWGH8Xtckg9x4DmGKwSbniFislvt+jU+p3WIUAkVJta94QS1wJuhzFvTlPSfbG45iVxnv5cpk
 rL+Cxpkl7gEvcHvxF8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020147

On Mon, Feb 02, 2026 at 10:07:15PM +0800, fangyu.yu@linux.alibaba.com wrote:
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
>  arch/riscv/kvm/vm.c            | 20 ++++++++++++++++++--
>  include/uapi/linux/kvm.h       |  1 +
>  3 files changed, 46 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 01a3abef8abb..1a0c5ddacae8 100644
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

If we only want this to work for rv64, then we should write riscv64 here,
but, as I said in the last patch, I think we can just support rv32 too
by supporting its one and only mode.

> +:Type: VM
> +:Parameters: args[0] contains the requested HGATP mode
> +:Returns:
> +  - 0 on success.
> +  - -EINVAL if args[0] is outside the range of HGATP modes supported by the
> +    hardware.
> +  - -EBUSY if vCPUs have already been created for the VM, if the VM has any
> +    non-empty memslots.
> +
> +This capability allows userspace to explicitly select the HGATP mode for
> +the VM. The selected mode must be supported by both KVM and hardware. This
> +capability must be enabled before creating any vCPUs or memslots.

We should write what happens if the capability (setting the mode) is not
done, i.e. what's the default mode.

> +
> +``KVM_CHECK_EXTENSION(KVM_CAP_RISCV_SET_HGATP_MODE)`` returns a bitmask of
> +HGATP.MODE values supported by the host. A return value of 0 indicates that
> +the capability is not supported.
> +
> +The returned bitmask uses the following bit positions::
> +
> +  bit 0: HGATP.MODE = SV39X4
> +  bit 1: HGATP.MODE = SV48X4
> +  bit 2: HGATP.MODE = SV57X4

Could write something along the lines of the UAPI having the bit
definitions rather than duplicating that information here.

> +
>  8. Other capabilities.
>  ======================
>  
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> index 4b2156df40fc..3bbbcb6a17a6 100644
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
> @@ -212,12 +215,25 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
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
> +#ifdef CONFIG_64BIT
> +		if (!kvm_riscv_hgatp_mode_is_valid(cap->args[0]))
> +			return -EINVAL;
> +
> +		if (kvm->created_vcpus || !kvm_are_all_memslots_empty(kvm))
> +			return -EBUSY;
> +
> +		kvm->arch.kvm_riscv_gstage_pgd_levels =
> +				3 + cap->args[0] - HGATP_MODE_SV39X4;
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
