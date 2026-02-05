Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A84E2D46A2
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 14:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770303333; cv=none; b=AYiJUEMrEEaf1hIUOqQGXkvSYDcPV1vgY/sqSjznpOfr+KZCZdSIsj0hKzWBseAja4Mb4gCP4vF+O9r6gxHn66qkM3ZDvBWfIQDKXacaGmZBD1EVHC9Y86RUr2RHgCJzOCK69WEjq4uP/F1j/Mt7z17OnS2AklISBVQ+0xHpWfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770303333; c=relaxed/simple;
	bh=l0yRuRF97EIOXhnfoKAAWF006czZECBbbCfStBD8MwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CI/a0bH8DsEiDxd8MXFXYCY389147D3St3hcoGTsO6I8C9x69iGcCLyRJB2dReHC5gVDGf7qR6t1h1o8dmrbIXWq9w7EDxhqOqFaTV1GxmfZPB2dg+aqw3PmlU307IpXZQR9AVpXMMrsz52aaVNVzzXioI1AaGNam97rGG51Z04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WdK8KA6b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gwg4k4Q3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WdK8KA6b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gwg4k4Q3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615B3xVJ176899
	for <linux-doc@vger.kernel.org>; Thu, 5 Feb 2026 14:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sQsqX44DUNzihTZKDnTdc2J2
	cKiScOMC8GyFnzDeQdU=; b=WdK8KA6baec4m76KEECT2zVxe8SZ7JvZaJ9yFrOn
	fmV2o8AhuMaDKJwSADpXWAMWTO106dSvfkOc7ylxlQubQECRAQZGkOClpfhjJ5Qa
	5iFSLMpiTYdGiXDdXAC4hEz599HV/KYvluRTUApNmJRMUs+Txf3DoV3khYtphzUJ
	rz3PHkl8IzsCXguF4Rcnpl9Re98FEicdKMSFArN1gDOUsXUJ6kItIM7v9UGAcprv
	AmqkTVbq1nKFohXIql0YD4qWU3rTw65Ll/dL+GU6cN9h8xFn6uuCpPOAFEWUp06x
	7HBS9yOSxwDJISL5oM9ipVK+Z90XL1AxvLBOTVyD5lPvEg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4t0p0nwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 14:55:32 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-45ca5b0a968so3706364b6e.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 06:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770303331; x=1770908131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sQsqX44DUNzihTZKDnTdc2J2cKiScOMC8GyFnzDeQdU=;
        b=Gwg4k4Q3JVNPSu0csslTWTpu0hLjaILewhaU1AvJl6lFUpt3fGJ5QBCCzOmFsBeJ7E
         ZhQ2fbzdKDyvQ+uyWho0x3WbNmE8t5f/UdDd7iQd35b14wOliBb6uP7sqjfoSC1qcGTZ
         h/6iX5fI4psSM5EbVd4mDX0yqA6dHgLHZuOZ2l8147dyDzJxUM5/9mo8ruLhZ9owmyAO
         ke3/t5CxfpSmAjBd1GU3SD9zQSXj7qzcsEgPfawkMxhykG/p7T7eT5NWViB0nimci9Wv
         DQ8yuZS6v318zQKXmRWN2WnESUlDlucubG/LVgg2tXIoq6D5vlWXKsUWOkV+uHXeK1Co
         PFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770303331; x=1770908131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sQsqX44DUNzihTZKDnTdc2J2cKiScOMC8GyFnzDeQdU=;
        b=N52zfgVrXJ4rM9tj2ClKZXeEiz/SXh2BUH3ydML0hUR91OO8RAaZ97X+vop8/UnW3E
         17ZYrVc0Lw9sJ5EiAG4zQzTz4Wat6aM0q3bBcOgIcAkx3xLh7OOvXm4jHYh8EHzZAMSb
         6ESLzDxrxsPV9Si/UpZPNLdJrBsiecCOnpFDzViJ68V5NAS4YEyLq6fm0yvijXfwsDie
         KiU/lmNk8kBMNSmSFKJuhfblYzcQjKJT6On2wdCmwfT+3uubcHNVYP1lTprSXQbiqqfF
         hXrKHd0wzI9vIDEYf1+PGucAzfeH9sKo/xgJPYN3yWKc118cBcMab4YRXwTh+KGT3p6M
         Fmpw==
X-Forwarded-Encrypted: i=1; AJvYcCX+wOMMfW+WBMqvnmb1IJ5gUSzwIcLbU+SycWEoljVmz3N3MahLbl6FE2haH1hh6G3KeJbGUkUxuz8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEH+/XCoLjhXQd20BI9jBHunEXavV7tv8AUB/WM9IVPBh1nGQ2
	dv0OyGL6x9Ucdtg12qaOCZFRCkXUr68B1ZHf1P2I0zzsrqPqvTM3FhJZNCrx69mN57VStASxgt/
	m0Dmzo2aCJmWVY3RzGDoaHKbS4f8SkCXcFKCzSkBujb1OIKs11lBn36BCjgRUkSs=
X-Gm-Gg: AZuq6aLH+MFRKTTHlfMGFvGlGoPUu61On9wlV1g2gYPtjdL44Dowh/gU7ScKAxYF5z2
	WZWgWpmJVd4AzdqPZe7n1CnNFRH0tY9wlBr7XqZC9YZ2gBpqxU/PCMsWfHAN7+Zejhkycz2M8LZ
	c5qO8Vd/oJjflz+kxv6XQIaAELtf4MIc1lKS4Mv861IFBnsNACOazvcln6Y7gjapNZJ9WUdvjeT
	mOWn+uQcBirzaSlkJW0blRISL53Ucj+GxJf1W7jw7ELT59m8n+c6hXQqTvEaOtkcdgpxkb66uH+
	cvsZrCO1Yb75iXu8ePs3doaBd1QEcieddPxQseey0KPbZUXEfpdySzXA2YTsAVmSxMVJmZMWKoW
	4mTtOZryBrp0HrhJxDv4=
X-Received: by 2002:a05:6808:4f64:b0:450:ca65:ef60 with SMTP id 5614622812f47-462d5a2ea64mr3150888b6e.39.1770303331600;
        Thu, 05 Feb 2026 06:55:31 -0800 (PST)
X-Received: by 2002:a05:6808:4f64:b0:450:ca65:ef60 with SMTP id 5614622812f47-462d5a2ea64mr3150874b6e.39.1770303331218;
        Thu, 05 Feb 2026 06:55:31 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-462d67cf83esm3226817b6e.16.2026.02.05.06.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 06:55:30 -0800 (PST)
Date: Thu, 5 Feb 2026 08:55:29 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: fangyu.yu@linux.alibaba.com
Cc: alex@ghiti.fr, anup@brainfault.org, aou@eecs.berkeley.edu,
        atish.patra@linux.dev, corbet@lwn.net, guoren@kernel.org,
        kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, palmer@dabbelt.com,
        pbonzini@redhat.com, pjw@kernel.org, radim.krcmar@oss.qualcomm.com
Subject: Re: [PATCH v5 3/3] RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE
Message-ID: <uqklo2bxvs6v7kg2yotmzbba7x4r3evmqlj3gubwiptrimy2es@dtl3rtmclwso>
References: <ocfqo4zpsg6yyaz6kd65jrvudtb35uerdsueazqdk6w7c5lvdf@wvwzhc57gxez>
 <20260205012808.98973-1-fangyu.yu@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205012808.98973-1-fangyu.yu@linux.alibaba.com>
X-Authority-Analysis: v=2.4 cv=ItITsb/g c=1 sm=1 tr=0 ts=6984af64 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SRrdq9N9AAAA:8 a=YnUHmWYE1xSIxKmkA7UA:9
 a=CjuIK1q_8ugA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-ORIG-GUID: AenbjuLoTPCO_wOpzzlQYDFUPw5IThsk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDExMiBTYWx0ZWRfXyJl48jSiATOr
 c/wYUI/m9+ARMxWsYcADDzxyJFpmVsBmi6xWExGB3HkTnFSleHw45FUipzdRmKFxmTghRwOtbgd
 UwZaZalEoiPOv5W7qIBA/fQIeVcydje2Ce3JYCE254pldwUn6eAYilt6zuz1z7ogZ5VnRPPlDcp
 cX2juiRfFrMV8tPEUnuM+7bEx1fbEJcn9ygVAvpxhoHoZJGvkIM0mK+TNGUvdv3R8cj6yFJ9XGb
 5HMEfJpUzPEI1mi1LQRuXoJ85H5K5GD1U8HOXtlBTjSaYeB8aI4YTC+k2SqgO3kOC6vO0Uxj/4K
 m/1Zo7vHTpnVBodX5kfW+zbUcOCyoMgyRhmZsD4YWrRTh9AGRfPfneJzO88J25OgiRNJsSvOlk7
 xh7pxwDp8tZVSZu2Kc1mzB1D/Do0UIvvr2IkMyHtJXrXVy8zNhegBPqolReEVWOHBk6J6h+KJAv
 tTRMt0SlZqfx0Ph3u5w==
X-Proofpoint-GUID: AenbjuLoTPCO_wOpzzlQYDFUPw5IThsk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_03,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050112

On Thu, Feb 05, 2026 at 09:28:08AM +0800, fangyu.yu@linux.alibaba.com wrote:
> >> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> >> 
> >> Add a VM capability that allows userspace to select the G-stage page table
> >> format by setting HGATP.MODE on a per-VM basis.
> >> 
> >> Userspace enables the capability via KVM_ENABLE_CAP, passing the requested
> >> HGATP.MODE in args[0]. The request is rejected with -EINVAL if the mode is
> >> not supported by the host, and with -EBUSY if the VM has already been
> >> committed (e.g. vCPUs have been created or any memslot is populated).
> >> 
> >> KVM_CHECK_EXTENSION(KVM_CAP_RISCV_SET_HGATP_MODE) returns a bitmask of the
> >> HGATP.MODE formats supported by the host.
> >> 
> >> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> >> ---
> >>  Documentation/virt/kvm/api.rst | 27 +++++++++++++++++++++++++++
> >>  arch/riscv/kvm/vm.c            | 19 +++++++++++++++++--
> >>  include/uapi/linux/kvm.h       |  1 +
> >>  3 files changed, 45 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> >> index 01a3abef8abb..62dc120857c1 100644
> >> --- a/Documentation/virt/kvm/api.rst
> >> +++ b/Documentation/virt/kvm/api.rst
> >> @@ -8765,6 +8765,33 @@ helpful if user space wants to emulate instructions which are not
> >>  This capability can be enabled dynamically even if VCPUs were already
> >>  created and are running.
> >>  
> >> +7.47 KVM_CAP_RISCV_SET_HGATP_MODE
> >> +---------------------------------
> >> +
> >> +:Architectures: riscv
> >> +:Type: VM
> >> +:Parameters: args[0] contains the requested HGATP mode
> >> +:Returns:
> >> +  - 0 on success.
> >> +  - -EINVAL if args[0] is outside the range of HGATP modes supported by the
> >> +    hardware.
> >> +  - -EBUSY if vCPUs have already been created for the VM, if the VM has any
> >> +    non-empty memslots.
> >> +
> >
> >Currently the documentation for KVM_SET_ONE_REG has this for EBUSY
> >
> >  EBUSY    (riscv) changing register value not allowed after the vcpu
> >           has run at least once
> >
> >I suggest we update the KVM_SET_ONE_REG EBUSY description to say
> >
> >(riscv) changing register value not allowed. This may occur after the vcpu
> >has run at least once or when other setup has completed which depends on
> >the value of the register.
> 
> Thanks for the suggestion.
> 
> In this series the HGATP mode is configured via KVM_ENABLE_CAP at the VM level
> (kvm_vm_ioctl_enable_cap), not via KVM_SET_ONE_REG. Updating the KVM_SET_ONE_REG
> -EBUSY description might be misleading since it is vCPU one-reg specific and not
> directly related to this series.

Oh, right. I'm so used to adding registers I forgot we're only adding a
cap...

Thanks,
drew
