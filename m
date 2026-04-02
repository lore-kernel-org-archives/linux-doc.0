Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4197732AAB2
	for <linux-doc@vger.kernel.org>; Thu,  2 Apr 2026 18:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775153013; cv=none; b=fuIh0cAMDk4cjIZ2eTzNHtMrsKyy2F6UImTyYFxC024IsUZiLlreJzMXdMDehVGKdLa5CtLUOrbROV6tDPhkVE8pyRZKAmDtPGXzWjP2PcOJx01pkDoADHdYODvopoiysz/xxOl9ISmm7/h3NyzQBNoiOQhQtIOlgukbYCO9wRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775153013; c=relaxed/simple;
	bh=zslShsm+LS4wiFK9zoZ9vJ4mO499VFjmlCodvm7M0z4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=mgKfbU45ffOYeG2vGPNu/4qRVmQnCg2vbIGYQntzz4BDrwzUiL0mCAWjtN8q6PSsPCYoKRZAuS4E7W7jem6pjnnksDtcsjKzENl2AGvfc3J4F0B5KrpsSovRD48ZVHM+CQnqvlV/qMPhxjtf/32ny4adLAYsd/yZakmmZzHxaQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=baEI5sjF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kdBm+ciy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="baEI5sjF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kdBm+ciy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632G4YrH1562154
	for <linux-doc@vger.kernel.org>; Thu, 2 Apr 2026 18:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lYQtuyJBlPg9nIy8rieYc5p+WTM4wC63ZTZ5EXpCsbs=; b=baEI5sjFaoyiOmwJ
	6mC9I/vBqJCuVOKeeG8RAV8t+T/tQcSPKl4zMsKt/k7zM4s13o8KipNtBQDhNaWY
	w1XaAgPmtXEOxXd9Wr5XDjiEZ0QtQYWmodYntrfe1tGDBe+fEB0VWaF0L/2n9ANW
	YP8q2uW/bQpa3Ximk1y2kuzn8KE3Gro4M0Px1yoTyuBHcfMEaAFFP/wpDJNqabDE
	DUeRYabbiNjQ2fP7b0He/m35pi1ZD3Bi/CfpqdoV0D9ti9ajN38NaNaz1LyGjjY8
	qnSrGDmZeJsqGJIZbtGLrnPDH5qqeGkt9JXxOL+FfK1fb3uXI69ks+tGb8W6kRCV
	QKr0xw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9um70f6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 02 Apr 2026 18:03:31 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6057cbb45a2so141545137.3
        for <linux-doc@vger.kernel.org>; Thu, 02 Apr 2026 11:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775153010; x=1775757810; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYQtuyJBlPg9nIy8rieYc5p+WTM4wC63ZTZ5EXpCsbs=;
        b=kdBm+ciyWcsN5jM9HN5CobVG5Yl8k0cUsQfHkE6kmy1O1/txcNtsGir9g7XuIyY4aW
         Np3Kv/oxJeEFdfmBaf6L6sxZ1wRhUfE7NF4I+BO8htnGoAmD8oIHBaiJb9gItyZfMPJJ
         r+WYztcg60poq8JH2AtuGd8zg4hCUZgV3fMTf5n4iLn8xo2EzSV2ZrP/kcRRmq/xQTWE
         x1m+pGIHrrRPj5F8lJrBo2LY2N7/iQa1M26VcbgVpOla5M9EKxWn2PP5FU2XrN7En/ic
         rexz9/c45gnBDT8nzv5otJD6G3YSAHN9U7MnB6Knr+e23ss13NSgSja5PMd/GSfkDxEn
         F2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775153010; x=1775757810;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lYQtuyJBlPg9nIy8rieYc5p+WTM4wC63ZTZ5EXpCsbs=;
        b=d6qETXIi8hDc3XxW9XCDPQAWi26sAFPaSyj7VnzsF80ymL9MDFen9k7omPjLuR5yGg
         nePuwU9RjADk6BlTZFzTBrk9bijQsyaZwUOnLglZP9wHMNHCgI70OqENfcGHZfPGz+c5
         FhSkSW7npUaVZ/5sUROM8bdoHA1+q6SnHNxY+lXViZs0u/IJJUm7ZtDP8WeTLLU4PxdN
         PBeFU0Ikc14mHclxAPqkHxGnoYKUsSyxR5Wk0Sg01MMFLUCG96SHTGlWaGHKctOIRPVV
         T6DK/jsV2E2YPeaZQl3sh38cJFo74u4XBGrNSZ+em7zrPHeAL/EljeRowVs3WMrL/2K+
         Hfpg==
X-Forwarded-Encrypted: i=1; AJvYcCUhKUtGqUGdnaZe+nNBVnISEh6Y5FU3Vo/R1KQGDPkFChx9pqh8O6R/fO8dRwF5UWuzbp0oECwKLXc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPqI1MzBEoS7tjBegZYugF4kjaRugIph6fBh+0m+Fl7Zzgl7ht
	3yx/yRSsraoY0SqWerAbCd06YCQRlKQg7ev97p2Zbdgn+7PuwkC5Q4MZAcoUlM6Jp2EU8FdL0Ug
	VrhIPbw5pooSeWStDnKu26AbKyer42+sSCnPjBntXHoMG8CsJ1OVbOzh3LWuBSXc=
X-Gm-Gg: ATEYQzw80nE9t3grFV68r64xiwsh+qMcJYAvmXqoK12CMkb8Xiu2DzwCMmvJyWU7gx0
	UBkhLb/qbI87WkYLVxLfmyCaztvyBYfRqO8fSqkHWzz+HBS2wfKKHYLOMU6Mfs91HylJ0RWbrsx
	eJoqZafnP6reGJvWeWIpl01APWZTToKwYTzuMbVvpgRdojwCmT6C49PQytoSieTNNQW5448tgXz
	M3pEKlhArCdkTuQcFNsgq/C3eozxrdewBmF4vg7F8dWOaHIgab1UmvxdWU4ahTMmuTHtl7E/t22
	ixXe//BuNehhfGJSamsRozuExQA6VOEkrOZOQKOTpSfCvAYvU21RAKtGh6h7bUqC6vke5D05MRl
	g9LtgTaR7S0zVVvJ5SN108MnkZiM2rq7prJy8knngHqiMLf4XIswzz1lIL8xe
X-Received: by 2002:a05:6102:80a3:b0:604:f029:2262 with SMTP id ada2fe7eead31-605a4fa98ecmr62654137.17.1775153010441;
        Thu, 02 Apr 2026 11:03:30 -0700 (PDT)
X-Received: by 2002:a05:6102:80a3:b0:604:f029:2262 with SMTP id ada2fe7eead31-605a4fa98ecmr62587137.17.1775153009715;
        Thu, 02 Apr 2026 11:03:29 -0700 (PDT)
Received: from localhost (ip-86-49-249-15.bb.vodafone.cz. [86.49.249.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec5c16sm115340866b.40.2026.04.02.11.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 11:03:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 20:03:27 +0200
Message-Id: <DHIV81G43OJO.2HY4RIYFRD0RL@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/4] RISC-V: KVM: Support runtime configuration for
 per-VM's HGATP mode
Cc: <guoren@kernel.org>, <andrew.jones@oss.qualcomm.com>,
        <linux-doc@vger.kernel.org>, <kvm@vger.kernel.org>,
        <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
To: <fangyu.yu@linux.alibaba.com>, <pbonzini@redhat.com>, <corbet@lwn.net>,
        <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <skhan@linuxfoundation.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20260402132303.6252-1-fangyu.yu@linux.alibaba.com>
 <20260402132303.6252-2-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260402132303.6252-2-fangyu.yu@linux.alibaba.com>
X-Authority-Analysis: v=2.4 cv=U/WfzOru c=1 sm=1 tr=0 ts=69ceaf73 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=fuErIE+P63Icv3tqjtEZBw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8 a=W-_n0kkjAAAA:8 a=VwQbUJbxAAAA:8
 a=yPi4e_CmV_5Q4fPajbcA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-GUID: _tWuFRjCInnessSgArF0w900AN9oa8fe
X-Proofpoint-ORIG-GUID: _tWuFRjCInnessSgArF0w900AN9oa8fe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDE2MiBTYWx0ZWRfX0bpjw+EQSG4e
 tukW0edALt6yte1T6DzJsGTXTqA+KX+cSdeY6FOx0W+EXMcDO8a/Ab3PXkAe9p6m0RGYuvge3UO
 SIcWGwZ+xZHjq5Y2gfOD5udA9B7Q814EF5rytd+P0t1bYDSgArh93pms95kkZYL7fXFSPIxP3M1
 i+VyWLbY3iTnP9NNRUFB+Mr8sI1RLb9vzDbmlW6agMDqySd08syJ1vE3ER9Ie7z8kf0fDRJfUGZ
 QS7xSpltzDC/+NosnmkO06aKld8Ly5vBGjTHfOhQvn1URLMobRnXUeaEWQ/Xbj2Pu/A+xDWsCLZ
 Ke5tkP2ibWaJs9OF2MlpdnIvnZaxNYx0vvRhwkOqaY6qF82ytisPkFE/jlyOrAky23GSoXOUjGb
 hn+oQ+43AZPqSRtlep49yYNp5QlJoGnbrW3uuJF97SUYfDUiHHNq863vF8iEyMHzUPzIE+WDTD9
 fFJ4ZtYqNw9J5RP01yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_03,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1011
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020162

2026-04-02T21:23:00+08:00, <fangyu.yu@linux.alibaba.com>:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>
> Introduces one per-VM architecture-specific fields to support runtime
> configuration of the G-stage page table format:
>
> - kvm->arch.pgd_levels: the corresponding number of page table levels
>   for the selected mode.
>
> These fields replace the previous global variables
> kvm_riscv_gstage_mode and kvm_riscv_gstage_pgd_levels, enabling different
> virtual machines to independently select their G-stage page table format
> instead of being forced to share the maximum mode detected by the kernel
> at boot time.
>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> ---
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> @@ -199,7 +199,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, lon=
g ext)
>  		r =3D KVM_USER_MEM_SLOTS;
>  		break;
>  	case KVM_CAP_VM_GPA_BITS:
> -		r =3D kvm_riscv_gstage_gpa_bits;
> +		r =3D kvm_riscv_gstage_gpa_bits(kvm->arch.pgd_levels);

kvm_vm_ioctl_check_extension() also gets called from with kvm =3D=3D NULL
from kvm_dev_ioctl().  I think we can continue to return
...(kvm_riscv_gstage_max_pgd_levels) in that case.

Thanks.
