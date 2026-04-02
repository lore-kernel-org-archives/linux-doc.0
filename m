Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AD037A494
	for <linux-doc@vger.kernel.org>; Thu,  2 Apr 2026 18:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775154460; cv=none; b=AoSoJoIN1D9cXqFXD8ZVyCSAHyX7eEpSHjxZ1SWcWHxaa9MmnuU+LKDwoy/+E+mnxud9bHoPDsxLp+S0UnHMGVO925Fj6+yvWJ/dQwCtbVzwzYYv4oFuyMH6Xd3E8x60EincrvDOx5KmHS3FD6GNg4ooXOaewI5aOvr9k9sfH9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775154460; c=relaxed/simple;
	bh=Kc5nPAesQEnFTyCErFuAe3jrPRrIL3MBJ2kSSzTGSFg=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=U8LnwQClsNhrBN8lCPqGT2QSi4UorF0COZDOYZ9br5dy6wKZdl8uLrZDANd6kG81xI/PcEdF9owGtngAHUikN2C19IfZl3ZlgzPP9m6Jv+ehstqBLf0+89DoMOObnU1soSwniPLERfQPNepGodjVxJbvXcbMCL9jNPrT+sS6NS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lIx2Etkh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e6TD9/fd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lIx2Etkh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e6TD9/fd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632G4T1X462651
	for <linux-doc@vger.kernel.org>; Thu, 2 Apr 2026 18:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TU8QdhgxiCPZ6ep8IVIJN8LEHXfbUR2Kb96nB47jKKM=; b=lIx2EtkhreUt/UB8
	TcY4yytliO4NobIg6t5Web89r/EuGQJD0W+TOYbx/0zqiBGnYZhjcTYORLrFUcD0
	CQ22tk0nHZDuW6ArbPcr2JjmsgUZsP/FKJ1ch1dJN3nvxgiSYtSQP4qs3S23u5Li
	y5rxkGDmTD/JDnPxxbp1aPOxqHKGBZA/nzxnvEyDK9Uxzz94QYwWtvt1auGNQP9H
	gSSWo3Ph083pXVrIr7q8EkdHbX/vks9hqlkBzadws5X26MR+qekYnRchKF4/XgWN
	1yDMjOvziZ4/RyLbnZLN/57PySHYG+W7hbHSPHq0Uvy/7inQ6fTsrYCp0Z1Wxh8G
	+LGErA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9b9h4je4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 02 Apr 2026 18:27:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-509219f94b0so34104121cf.3
        for <linux-doc@vger.kernel.org>; Thu, 02 Apr 2026 11:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775154458; x=1775759258; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TU8QdhgxiCPZ6ep8IVIJN8LEHXfbUR2Kb96nB47jKKM=;
        b=e6TD9/fdFIUpLPNsJnwgdWjoyja67yJcPeo7uLhxCwvIwZkw8np/GuBnMaQV5z9Vcr
         hG68lxIKlPTgP1SEDfGaY13twOujYjLWhh2KmWDD0KGrBA34a5rurhipEp+rRkEZ7mPv
         h4I4oa0XZmZZ5qqBFg32mUJLaergTqrTKQJvt32m1256ji7O/cWg081IKg4F2lHEcEZZ
         lW/WvalFIF7Br4weRUa+T7get3fZG20CwzONFtcouQXwXVALgP9+t9qs3oHFDbnNoqUz
         1yUFT0HgknISUd+Ot8YCozzE9ZqGpirNOWG3h7Yfxyxdh7qHNraL24/L9QaWuZWWwHLT
         ZQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775154458; x=1775759258;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TU8QdhgxiCPZ6ep8IVIJN8LEHXfbUR2Kb96nB47jKKM=;
        b=nIgn7IN6tDRF5BA1xuP8y1rhoYl+Oy/fughauX/3bI/92eheso/VlGhBZDlNE/aAgH
         +/7tHOA9Gljs5bkDiNwuiGaTA08/hvHVPqhR3G8OWlb4VW09+xUddv4UrdPa3bXjhjls
         VklhpTTGatRONj0CdSZLZxJoSHIzj1mOZ2564fdHZc0owEWyXwCWleNuQSwPXFqoH3W0
         QN3LB0TYB0tBWo+q6Dm+zSYPygbOr7IOyLIq6ZDbEqiClEL9asOC/NeCI4TIp4eJ1RsH
         CAYauwMR95lZrkBnZolURKTqsuFgoud+Z2/GyVS1x05v1UvXY2YluPXgbizaYE+6ToaD
         BJgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOre/mxYQVhieIdU2sJXemEfWbEZaok0tEYVYfYRtSXS6lzUXXRWc18351O0n9nXfksigGMQ0ztLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YySnHhQscCc1ETLWiP/8BGq9+GUvrjNwkDs8jUQS0+kuIz40lgo
	3LI5OV7b19p5yt50JFPdKa7mlxmaiCvyCKbyXFuK5f3RIja7IVJWWIkt6/Sq3HjR3rEeGlq+uN0
	FxrNnNF84+4bHnFp8RjQNPi+H++UJhNNtRRVWpmRUC6wUWr2veGEyFfynsg4P9FI=
X-Gm-Gg: ATEYQzyYUAiLev8cmCMtBD5Dvoz0uuKOqoJBm8laCxO6Vp+s12vHQtEV//gGBSEv4GD
	DSqFFfpZlAUN5hUmyF9OxBHAIFFOv99JzOxYgfoPixtJLyi3T2lgoqt3CrZ1VPaMmg0DPJRW44V
	QKF1FnEqQf22EGyKASeRhRRg6R8XRm21xKCb/SD5FlAd7hmwKH/GNebEvbuMWh98KlF9q50IhEb
	IrUJkcaWQ+IhkzC3CVVD/uI7+ZpflK7SvV7jD5ByR10C/+lncCJO4B3EvJsisz/tS3vHR0K9icc
	dd39wDFnUig/Z0MpqhEm8JdNLarvNV7zSAdsGZ3mlBsOe5sgnFtckLAv1NU7Xs0Lh3CeSPQP6NJ
	e14tQhPa8edOn6yL4f/COwldP1m5/VCPxpcgM0l64aC5zJwnvNYcyrNTPpNw5
X-Received: by 2002:a05:622a:790c:b0:509:15d8:2c0a with SMTP id d75a77b69052e-50d62a8e346mr5227691cf.32.1775154457656;
        Thu, 02 Apr 2026 11:27:37 -0700 (PDT)
X-Received: by 2002:a05:622a:790c:b0:509:15d8:2c0a with SMTP id d75a77b69052e-50d62a8e346mr5227311cf.32.1775154457216;
        Thu, 02 Apr 2026 11:27:37 -0700 (PDT)
Received: from localhost (ip-86-49-249-15.bb.vodafone.cz. [86.49.249.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff128bsm116569366b.53.2026.04.02.11.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 11:27:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 20:27:33 +0200
Message-Id: <DHIVQI1DY4MK.27YZ2NPDXF5WM@oss.qualcomm.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
Subject: Re: [PATCH v7 4/4] RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE
Cc: <guoren@kernel.org>, <andrew.jones@oss.qualcomm.com>,
        <linux-doc@vger.kernel.org>, <kvm@vger.kernel.org>,
        <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
To: <fangyu.yu@linux.alibaba.com>, <pbonzini@redhat.com>, <corbet@lwn.net>,
        <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <skhan@linuxfoundation.org>
References: <20260402132303.6252-1-fangyu.yu@linux.alibaba.com>
 <20260402132303.6252-5-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260402132303.6252-5-fangyu.yu@linux.alibaba.com>
X-Authority-Analysis: v=2.4 cv=TqLrRTXh c=1 sm=1 tr=0 ts=69ceb51a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=fuErIE+P63Icv3tqjtEZBw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=YvLePRtRmKwuc7oy_z8A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: JsGH9Wl424Ixws3rkes_bPEH5OhCWKrH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDE2NSBTYWx0ZWRfX/OWW+dt29ItM
 kVq6WSYcpsf/sMPnoKcb6qZ2jq7oThgR5atvfkVnjIz1zh/+/bEmVfj8/hsUblkWCB1g4o6gbpY
 am0tqJkbKZpub3oFcN1DE4XRqTSygtfymrCmFWfRvlleskSXcrc9alXcpXS+eAnVVfiYe1y0+55
 C8LZqrza1viD1lICMmqltHMpWLmvngcRcWrQh7ukvzAF9TIS3WnrnqaR8f3enUYW0fzupFCYYHK
 WZOnnXggtHKHfv8dJBohNz2aAxAvjs5dPPrRxMpw0P9ZH5jYz/TSVFMMHCMouSBBjYGBEqERXJK
 dfBLeNA9bAR6MtCnK6DAh9RaLmll1QG3C0bm5GRR14fPjTqyNVasKSGHNEnrsnZE9tEKlM2OYsi
 ABX0OryUXnnj27JPN0RlVWAq1BGW4Ki0xITMlbWH6GYjdhK9zUhhg2f8vx0mZ9CW9XcLIeaICUT
 uXuJmeuq5lbf5y1NVHQ==
X-Proofpoint-GUID: JsGH9Wl424Ixws3rkes_bPEH5OhCWKrH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_03,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020165

2026-04-02T21:23:03+08:00, <fangyu.yu@linux.alibaba.com>:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>
> Add a VM capability that allows userspace to select the G-stage page tabl=
e
> format by setting HGATP.MODE on a per-VM basis.
>
> Userspace enables the capability via KVM_ENABLE_CAP, passing the requeste=
d
> HGATP.MODE in args[0]. The request is rejected with -EINVAL if the mode i=
s
> not supported by the host, and with -EBUSY if the VM has already been
> committed (e.g. vCPUs have been created or any memslot is populated).
>
> KVM_CHECK_EXTENSION(KVM_CAP_RISCV_SET_HGATP_MODE) returns a bitmask of th=
e
> HGATP.MODE formats supported by the host.
>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> ---
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> @@ -211,12 +214,23 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, l=
ong ext)
> =20
>  int kvm_vm_ioctl_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap)
>  {
> +	case KVM_CAP_RISCV_SET_HGATP_MODE:
> +		if (!kvm_riscv_hgatp_mode_is_valid(cap->args[0]))
> +			return -EINVAL;
> +
> +		if (kvm->created_vcpus || !kvm_are_all_memslots_empty(kvm))
> +			return -EBUSY;

Since multiple VM ioctls can execute concurrently, I would protect
created_vcpus by kvm->lock and kvm_are_all_memslots_empty by
kvm->slots_lock.

Thanks.
