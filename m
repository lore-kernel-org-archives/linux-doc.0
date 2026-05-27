Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6BD43634F
	for <linux-doc@vger.kernel.org>; Wed, 27 May 2026 15:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779896532; cv=none; b=UqdpkAALiJAgLcpeUHRQXisTu6axITV709eDZRifX504vIgBJsAH6nWYej9miA1aq4bTxACfrEOHj0UPFGjSbsLlWvGVzzxlBJFJYJxFHhHtuvbeqLNscFETtayX9Y8oaltdn9QLSJ7/1gfqcEusgfWUWa9E7RwxvIfe1jCz/j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779896532; c=relaxed/simple;
	bh=l30Sh+8l3R3eLexGTlydQgvg+2LSMsG8ZKeJRgfYqig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uKATRrgtukmgzKQ6+kfznDRmYcDsITWMbJaUGRABq7iU9uvzUrFSSxt5i2Ktra6bybYoHXzE70gjUmOaKjjC5RnPlWoMlLBukFTjpHBDgmMGKlk6M6PSsTGuOCVuk1M5wBLRTqtoBFUsj5zT1heMsoxcilYepH4xYA7THaSeMaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D0jWXAli; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PJQVX4fA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D0jWXAli";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PJQVX4fA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RFNVEL3830810
	for <linux-doc@vger.kernel.org>; Wed, 27 May 2026 15:42:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yrZ7fByGdAG1n0GYJXTMCaPm
	clgKYcrSXuiTG7s2eLg=; b=D0jWXAliEPaG0t86Jlq+EqqrT8IlZcnPgJ4As703
	R9IVbhvNt9posO8KWP+BJtFQ8jY7DAwrZBy2Nq9JgsuddOrHjeQJqswkdTbqJn0s
	bBPvWvxryJZXDM8S3Hyxswk6ZTCLLH7cUzb26Vnx8Adkzm/QyC/0QH9Qp/nnvgjM
	BOyATNxcOn+X2DdOyKAH5N9pofXFXeq0BSi8mOD6oZRDfu6BoZodTjRK8YQdIB9X
	/04kwDyCQDX++TLOwGPSIHtQlsqnYkAVo/cbwZi+M5h9fToOsWdJJzMPO0DH5AmF
	h/d7pa3Ly1iz0H+AHhBrH5wAuU7cI7X3GTeZQUdF9eNb+Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edn17k9ab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 27 May 2026 15:42:10 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdd327d970so7164947eec.1
        for <linux-doc@vger.kernel.org>; Wed, 27 May 2026 08:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779896529; x=1780501329; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yrZ7fByGdAG1n0GYJXTMCaPmclgKYcrSXuiTG7s2eLg=;
        b=PJQVX4fAnFNSvfJz3Lk2wfEglXJpoCbeRVw9y/N2hp0COLP7wDU7trE1CyxvEUelFn
         thlbG4mKUxEsvodpffDozrAbWuoPugpRV4Yg4m8IFGi0hYgrs4Sw0OnNYpXcs/Xnbcx9
         Qipd36h6cLoDq92VDIuIdBQ4ZKgM/f9R1rLHoHZDk/JYFESFMAMw1iYXoSE2rwsa+ox6
         1jMrWEhskA9OXdQZcIncTQzMvXs/V9EW4fEFOM+ZJkxOYHrTEvmfhraXP8tEgAlqXDU+
         dS7Axo0qFvyAPRifBiyriadjJmNBUzGroHNNe3obJuE8gTUWhGH45nc+HTHwYEjj4Ni2
         EQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779896529; x=1780501329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yrZ7fByGdAG1n0GYJXTMCaPmclgKYcrSXuiTG7s2eLg=;
        b=aeAur8cZNNBcSs8tQmjeOOeaWqhryzaXB+I8hJmvuksn1a8OIsOPtGiYOMMXyGvoQ9
         zD/8V9TPqIA5D2nYtgeGVwyrSswtVOxdoAiQWb+wPnpXE2zXe8dAG2cVY921a2hMq+xi
         ZSE8JdeDE/4Q8yOXzn8zqoCcr5WtlKwBhmaFnjZalpqztQCNYCWHh6wnhpWEz3VSPfPy
         FzyZzTQKFYZDtZaAmZu+wWdaLkU/nucQitvG5cdbWLi3MG4/3BJPiGpyVZp3N/Opo82u
         S9wqtAz4NCeE3slr+5dLlfSTATpfYhHjvGJ6UF1A2rShzVbvkkm61Q0MbV0csInQn5Dm
         QTfw==
X-Forwarded-Encrypted: i=1; AFNElJ/Vuy9P5OKDAVFVSL1Au7kmbz4/+u8H8FoyIsXziSp7l/PTlFCZ1oR8T6cIrDenhuLWZU4fMREc0Xk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvb8ZA4jqYHCJTYSC8qcrSPNG4/yqXAlD766Nhp1Zf6JaYaKKz
	PufUd4GLiTXETSZp/PT6qAhk9it2gbLsnrua3Zl/XMhvk4pjchoX3OFSymJyvDm+9f9qojR3U5D
	pJIzuVSkzHHzmlKnA5jjoRn9vHHOvu9rpeqsWP0sKxBrqFjkzNw88jQqkke8VqG4=
X-Gm-Gg: Acq92OHjBt4DrGEASOURgPfiEUhocgE6Vpjpaf58MFcXWF4nZk9+BOoVxv7HA6Edi/Y
	QdfUfiNluZWZbQkawkvhtElCvFGWh9gsUoI6C1NOKPey1kFvcqq0OHw+u1PlXaExxMY/MaMN+XL
	vx6OHH2cttppQdOypac9YKCkLZeg3EcK9Z0F7d5v5v9uW8pO0YDtGLW5Q3SQm6D5ldFWBcAV9ZE
	A4qT3vutXkAbZNoBHtHpK8l5nDpY80T9ZNH9ecmYCIV1x86eHflTAn1x2nczTDPjHTE9TY2XvUL
	MlKoWTIfuIMpIzh+uWaXeKnXZfHFpc9FWeLRQb+YpatYRb3JFnOmTSa6O6bw6HHcD8PbdQCDQdy
	5KIx/q7LFuoOMUr6GOwhaN9GfXBNKiOsnnbkS26YA4Q==
X-Received: by 2002:a05:7300:2147:b0:2ca:bd22:6102 with SMTP id 5a478bee46e88-30430f5a25cmr11505051eec.14.1779896529208;
        Wed, 27 May 2026 08:42:09 -0700 (PDT)
X-Received: by 2002:a05:7300:2147:b0:2ca:bd22:6102 with SMTP id 5a478bee46e88-30430f5a25cmr11505034eec.14.1779896528627;
        Wed, 27 May 2026 08:42:08 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3045245d6aesm12480494eec.26.2026.05.27.08.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 08:42:08 -0700 (PDT)
Date: Wed, 27 May 2026 10:42:06 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <guodong@riscstar.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>,
        Atish Patra <atish.patra@linux.dev>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>,
        Christian Brauner <brauner@kernel.org>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Samuel Holland <samuel.holland@sifive.com>, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 01/10] riscv: hwprobe.rst: Document EXT_ZICFISS
Message-ID: <7ammujmvz7n6hmaseqns2x6nfypc662i6znvsm26rcxcvntdtg@vn4poummj4vc>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
 <20260511-rva23u64-hwprobe-v2-v2-1-21c5a544f1dc@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-rva23u64-hwprobe-v2-v2-1-21c5a544f1dc@riscstar.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDE1NyBTYWx0ZWRfX39v6AT5wL9Zg
 zeFzyDSvw382tM+pKdtQbrd3jUAl0O1N1MSXSFKc1UP93rithpxq0462mEdEci9P8vNgzfOjThL
 Ff8OHNi6WmvG0ftucun2Lw0x1eHoHHCcJydiq7hluc2Fg28jE1D52AUS0hmYMMfF2a/P0voaQs/
 pMwzW48X4kmsccfbIDcLXjB7PvZpRTkI1bmPV+Drb32VmfSfLhgwNiNufnFMedo7Svb0jH3pYFW
 rSPMv66Q6dnSz1g37ufz9R22zm9iRd8Xmsh7E9j8Xp/9HQ+Uc6DZiYGUN8GJ0lq3DDNcMgavJbB
 dTtG9g/1O6uHskpHbB1HC025EOMDCt78uuEpKj5RxEDeNg0bR8MnK4teB/t5As3iieDUwz0ambv
 M1RrO3W95ExZl2Hk/Dlk6q56Bi43vw==
X-Authority-Analysis: v=2.4 cv=R6Uz39RX c=1 sm=1 tr=0 ts=6a1710d2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=ee_2aqc6AAAA:8 a=MJPy3T5N_tYcTtQqpHkA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-GUID: fvq1VvxA2lNfOWrxtTW8UCbW8kSAnhMb
X-Proofpoint-ORIG-GUID: fvq1VvxA2lNfOWrxtTW8UCbW8kSAnhMb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605270157

On Mon, May 11, 2026 at 09:34:46PM -0400, Guodong Xu wrote:
> Commit 30c3099036a9 ("riscv/hwprobe: add zicfilp / zicfiss
> enumeration in hwprobe") added RISCV_HWPROBE_EXT_ZICFISS as bit 0 of
> RISCV_HWPROBE_KEY_IMA_EXT_1 but did not add a matching entry to
> Documentation/arch/riscv/hwprobe.rst.  Add it now.

We also need to document RISCV_HWPROBE_EXT_ZICFILP

> 
> Fixes: 30c3099036a9 ("riscv/hwprobe: add zicfilp / zicfiss enumeration in hwprobe")
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v2: New patch.
> ---
>  Documentation/arch/riscv/hwprobe.rst | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index c420a8349bc68..b1a84ac06da75 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -391,3 +391,7 @@ The following keys are defined:
>  * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
>    extensions that are compatible with the
>    :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZICFISS`: The Zicfiss extension is supported,
> +       as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
> +       extensions specification, ratified 2024-07.

We have a variety of indentation in this file. Sometimes we align under
'm' as done here, sometimes under the first ':' and sometimes the second.
Not a huge deal, but maybe before documenting more extensions we should
have a patch that makes all the indentation consistent first.

Thanks,
drew
