Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6E13559F1
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 20:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768423077; cv=none; b=I9O+RX5f3gSMPh0U/7KAczPRwwQYvUBajkcpFLvcSgkKk2402/BbjJKNu4aUnJP24yy1ybTWyhE7J8a0hTr6qUzIj3icuXiXv0DSCSqcbOZ9VIjDDNNCQU8E+jPvlt/d30eandpMDO5rGE/dycf9q54I3QqCyFnZKM4muRF0GHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768423077; c=relaxed/simple;
	bh=1kIN8We2UHs0J53YuayUgbn7SOAw7VTEyjP8z26RwvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XNglAij0jdZDsESFJO7MD5C23y7PuXFShfZhso1O2WlNfPkax1QSZrRjiecFyaE6uSqFqa3CQ4VGvMvHgKBosva9m/KSqp0ERVMbfAuJl1YVCsWkqBhgnaZQgAsQqz8EAG22DieiNMhI8/c36BFphF7immY7fiy4AiEENXwwr98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CENarPmW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HlzKIMUP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CENarPmW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HlzKIMUP"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EKGVVv4136107
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 20:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3pQ6gPl8aCDqFfTg18W2RcJTuakekfy8nn8ain90wQ=; b=CENarPmW+LDu7sLU
	SlMog1LkZ+o93A2F6nGh/TPKxoGKY5YSb2/Y2CIuPQFD+IE6A5xTWltYHLq5VtlH
	po6KZ3rGDbCuODu+VkeOmQiQyhmZHq9E5TdOFMU8W9CSS2PLQE2SVO+E4xZm/cKG
	B2tUlKOrCkcq95Ss/Z5a4QuYAfaDHYrZlL4RncAfnv2DjnZbDpmhGpQkFFVyBXKu
	tTJJc8nZJhJ0Cq53Zfe+05qiJYAeCRwy+iKoQmRHbqhuTEvOLQ8EkkyHkwT/wRmT
	9H6dGLD8gZuyLFTOeowbb2uMT0Rx0nElt4V43dpAbGmgyyI3zws7m0MmOuI+wdti
	1KFj5Q==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpj1pr1fr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 20:37:55 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12339e20b66so239962c88.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 12:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768423075; x=1769027875; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t3pQ6gPl8aCDqFfTg18W2RcJTuakekfy8nn8ain90wQ=;
        b=HlzKIMUPCW6NFBUE5nXH9PdD3Mhpy2KMRPxN+NErz0axOmlj4SXUWaewfFUbcWHUVU
         HdyB1VPtwC+8QMi/fKE0QH4G2Jf7Eh5iS/RqteVtNB+zYGga/IKN1MN4NVJELDjmwBrT
         OOHXjyzwabHgU1Ymgku7zjOPFr5EvWtPQBcPJozTUb9bbQoLWkH6Vrc1lx9/u0pL556K
         xLCXFkoWLb4Q++Bj1Tp4R+7FYaeuQa82H6+4d20/FMjonlk0PbUUNyBACmKR0vf5Qe61
         9p8PMNLPU0SON1mJU0TvNXrtKC2/ZxCYyhu08/t2M7/sMOjDMAsDD8fqyr6UYHztjLe7
         0h4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768423075; x=1769027875;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t3pQ6gPl8aCDqFfTg18W2RcJTuakekfy8nn8ain90wQ=;
        b=S8bWomqDLTEFmopwCSY4o76VJhjh8xs3XN9GwyfW2TCMkWX5NtcPLdjV5AfErl082Q
         aU5BKXF6uDvWJJOdgnyu3u+B9Doot+aruB6LXEJZAHELsfMBniE7qgpcaVZP60tZq46K
         ljVP8b/5ekLN7Y95kjPBI7fUFeWoprue4WeyQg/JdKlzV75DGNxhTg/aW6LpV3rqL4eL
         8AHdj055VnDryXlmpIDxRvCAoUMsm8H6FFds+mmzKr/VSWLbXxTFaV9goSEnGvlacWi5
         Kl9lEEwUx9h/PUw2hjjQSQ0978a7QqwOBTh3TbXy8ftrkgV8TWc17cK0Mx8OV0JUs2J8
         3jyg==
X-Forwarded-Encrypted: i=1; AJvYcCWcXg/MCe7qYTHamae9MeVDhXnKBF14rgYa78uZlHXdbKv9x/4uVaaghruAfSWIAmSFEx9DYn0G6zc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvSGpZfynboZeqXaKKGt32vju5DgMt1B6Dx6E7RBGoVHrySxxD
	MZ48uj9w6z++eC3ImBASVIBLG3OTy7ouSYgEmSpVIMH1AC8zvYi6clDZRMcOISSFiGgBM1+MkKT
	KtFJewmci2+HRsaB+rhKP/cLHuQyL+5vJDazBR3fBtqC5vLGmwygHm14GWQzXGjY=
X-Gm-Gg: AY/fxX4P4vIWiOAzOFM0/HtokgQQqHBSz5kSQdES/kKSfUHSZuLeKT375sttxqsBurv
	FyuIgNaLaC+AG5JTNpk5PXL2nMQEx6SHd0PzPacHzD9TNaOTjPx4tKGdIFFFDB7c9EF8KYY/L3a
	YeYAAcyPe3HEA9ZTLbFfLRqjweKP+hU7nZvEC7FeRfUs6hbNCv5sQqj6xVD0qS/ZEOfVUalDWhD
	UfrnzkQl5mqBSJg0EAgA+vgaDTYvNVPTz+4DAdCmHUFRM1Hz1AfhfNm9qoInYarWkkfq0JhXmyK
	ArtveNRnFmy5O9tRt514UnG8uJSzvvFXNH+Z5nliBcXg1sEpihSrZR/Sww6Mu9rL3eHyal0JxWe
	0i9b2vO5IbgAkmFhhgMk=
X-Received: by 2002:a05:7022:f8e:b0:11b:9386:826a with SMTP id a92af1059eb24-12336ad6fc6mr4063617c88.47.1768423074377;
        Wed, 14 Jan 2026 12:37:54 -0800 (PST)
X-Received: by 2002:a05:7022:f8e:b0:11b:9386:826a with SMTP id a92af1059eb24-12336ad6fc6mr4063577c88.47.1768423073673;
        Wed, 14 Jan 2026 12:37:53 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f2434abesm31939310c88.4.2026.01.14.12.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 12:37:53 -0800 (PST)
Date: Wed, 14 Jan 2026 14:37:51 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr,
        aou@eecs.berkeley.edu, bagasdotme@gmail.com, catalin.marinas@arm.com,
        conor+dt@kernel.org, corbet@lwn.net, dan.j.williams@intel.com,
        davidmcerdeira@osyx.tech, devicetree@vger.kernel.org, dev@kael-k.io,
        gregkh@linuxfoundation.org, haren@linux.ibm.com, heiko@sntech.de,
        jose@osyx.tech, kever.yang@rock-chips.com, krzk+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
        nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
        pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        robh@kernel.org, will@kernel.org
Subject: Re: [PATCH 2/6] virt: bao: Add Bao IPC shared memory driver
Message-ID: <lpocmy3nmdcudoewe6uxal4srnd2acvb4fi73fthbruyb3wpo6@ky5cpwirm2vm>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-3-joaopeixoto@osyx.tech>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260107162829.416885-3-joaopeixoto@osyx.tech>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE2OSBTYWx0ZWRfX6ykXa19Fy9nJ
 BkpzWVIVm+kTlpK1AkMVrAKIGGATPxM/TKYOskOqGQU6lkDgGtJtD5O9Kh6Q//A89Dg4WPy7sFO
 QNij3moO+8TEutCMoIJsqzuoWwBV4MtAPzjm1E8fJWrDsHiatOvqt8Bq55bavl+I1RHkjo4c27b
 cFDZjtrlI/cd69YbRpJ/nZSUqE8sQpvfgJCreHWYO34B2ExqxfWSdWxfSWJYBIjKdq6xICd4ccU
 0P2OJw0d8uroy36fhzv7Jn8nkWmKYxL8lbOejSuR9Xr+XIIJ07EVEqmN2msPw86S/YupjoZX8OP
 aT/nnS+NLm2UoL0/XMRdLOdXNvP0lZpLuTSAyIgzoIfI2eldmYwhmhaKNwFvHArNS24xZ5DJF1Q
 Hif/Y/0prge/DhfqZ54XR2BC74B57x8xJNMzBTbt42+TnBadurNDt5Atd9CeGIBy0iYz9nu3IZa
 LyfKII/jkY7ewG+s/3g==
X-Authority-Analysis: v=2.4 cv=J+KnLQnS c=1 sm=1 tr=0 ts=6967fea3 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=8nJEP1OIZ-IA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=U1-EPvYjQXF-sRXeHicA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: dH_4UNXQKGjKAYgnIDu3E05eVSQeHs0T
X-Proofpoint-ORIG-GUID: dH_4UNXQKGjKAYgnIDu3E05eVSQeHs0T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1011 suspectscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140169

On Wed, Jan 07, 2026 at 04:28:25PM +0000, joaopeixoto@osyx.tech wrote:
...
> diff --git a/arch/riscv/include/asm/bao.h b/arch/riscv/include/asm/bao.h
> new file mode 100644
> index 000000000000..35658f37e1bd
> --- /dev/null
> +++ b/arch/riscv/include/asm/bao.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Bao Hypervisor Hypercall Interface
> + *
> + * Copyright (c) Bao Project and Contributors. All rights reserved.
> + *
> + * Authors:
> + *	João Peixoto <joaopeixoto@osyx.tech>
> + *	José Martins <jose@osyx.tech>
> + *	David Cerdeira <davidmcerdeira@osyx.tech>
> + */
> +
> +#ifndef __ASM_RISCV_BAO_H
> +#define __ASM_RISCV_BAO_H
> +
> +#include <asm/sbi.h>
> +
> +#define BAO_SBI_EXT_ID 0x08000ba0
> +
> +static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
> +						   unsigned long ipcshmem_id)
> +{
> +	struct sbiret ret;
> +
> +	ret = sbi_ecall(BAO_SBI_EXT_ID, hypercall_id, ipcshmem_id, 0, 0, 0, 0,
> +			0);

Just let lines like these stick out. We have up to 100 chars and these
types of few-char wraps are the most annoying.

Thanks,
drew
