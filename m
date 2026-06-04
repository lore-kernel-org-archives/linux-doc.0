Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C13E30C62D
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 16:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780588914; cv=none; b=HiR1pWv1U9RQohJkyO0hxoNhn+y5iyKoaRB+M2HlyY4cu3LyYVr0hVnbjp4QU9x1tN8RgCzpv3k9OE4WRjt6lWDsP6ko4cYok1CTfft6yv25kHbWjrexdp/acB4vVbHxgmzLyfV/N6qbc461qWUq4dVULK1stLkb1GwSAxdt/7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780588914; c=relaxed/simple;
	bh=Bb5mTrgyt2h5wH9/ID4zexvhJBt+QMk4O3GE6dK3YOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sNUl6ObEpfrrYlmvcqjX5DEhseI1W1tMGJB6YVV7XLvUtv6SbiLb8SunV2ygtV0FpRjJ1cM+ktgbBaeeU5dOPyF4zKeFqEx24JFBMIpPIWH4AUTCGFjiYU6eZD8vXBshVnJ4Jl4ehBAzDyko0JTzd/Zh/vjYvUnziTnDMT34IS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OF+XSvRY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MiYgp1sV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OF+XSvRY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MiYgp1sV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654ED70X598077
	for <linux-doc@vger.kernel.org>; Thu, 4 Jun 2026 16:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yt4gW85Y9LMlMB5+VVL9pvf/
	wye7kF75DN7q+ptOBr4=; b=OF+XSvRYiLrTH54S9+jd0MNLNy21hVd6XdRt8wwZ
	0pjMiHCqOMO+rMsINhJw6L7neH6unjvY+9GUSK/2X88fKg9XOTBb19AnBXn1LSoG
	ou19z3e2t6MIjiBwOFCbQ3TSgGV8rxh1DVzmFwuS66BCG915tom3yAXcjdtUTsgW
	j80safQqLSn+NuNnDb8Sltf82fX8mRFpErJcWSRgngpurvuc0LmzRv0Qe/vY1qzt
	hhHsiPH/x2iTyAkULmj29aMqSZuAm05syng1M0Oit8Mgkp+PF4oHJ72dZ9KVspxZ
	tGNduT1zRurOxBDDs2NtuTwW61/n5BBkmdLzzpBVW31+mQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy8m3arj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2026 16:01:52 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-137fe4a3640so1370062c88.0
        for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2026 09:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780588912; x=1781193712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yt4gW85Y9LMlMB5+VVL9pvf/wye7kF75DN7q+ptOBr4=;
        b=MiYgp1sVYYfSG/LwjzCN/hm92Mo1l7GJPFfl/+F1cYDCCkCS9ApSuqwafqEMKoX+JH
         cjzahU83Ti8w6M4RsR2GrMoFwBsJdDce5XDnot6QPomdvdIp0+6hewXytRNpyOTuBR38
         dg/6dVuvGHIBU1HPWWMm53rTjFMhIjTD6YgQdRN2BpTRGtl9s2pvYLRMiv6asdqgG51a
         rqlDTODx26OOqw481OsOwDDPgjp+fNVVd7Y4/trINA2URybd+cL2gunpS5QXt3Y06yS+
         6A6wYlMecuFHzVJd32Y1wyoxwzoCETG/sgxsIuJzDn2nY6w7yPa/V+lcFdWPwDUVbITR
         4h6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780588912; x=1781193712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yt4gW85Y9LMlMB5+VVL9pvf/wye7kF75DN7q+ptOBr4=;
        b=bEqBcCqaBG3ZKRYp1d1lbV7DoQvowidDD/tIpoPUuAJkScSogSMgA9sDSTZ+6ma7Cf
         D9WxUKx9bdU5c9ybdZ8fUX2Nin9z5FfvTpCGB8/uxrH8MoSpUNZnjNInLU2F+ismO+je
         jsgBeIFbrAbbOjKr2K5lT0RB+EBsF5RpjpczbHhmdlHGfX+Zf6VakvFVUL7n4Y5SrLto
         ocuP9rUn5HV2DpILbRfEItdM781LT98gP4Gq2qthfpU37avyfLqz7/xmdJ73K/f7nPhe
         lHzaX4eoVA25NVm36lcJ9sRcSRTG3pZc9/X93dwF8jHXYLv7jAWK5ThERAmzHXEkaqEp
         KgPQ==
X-Forwarded-Encrypted: i=1; AFNElJ/KGF2NSzhymN0qRDrf/ah1A6HzMYuLvvknRbaS16VgrPldSxQ4q8tFCe/GJbKYYgpYuZNqvPNKOfM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3aEykhx87e7XaNte0yZNzc+6SWsBcfogKdzWh00lsYngmVI/d
	Ysnounx++8LOsBqIYpeMW6moj84DB4rWC6AzCRmtQ8tlOMYc94O+gn+V+dg4aX37fIFYh8i2oej
	QowXnzIA93E+qywgIiuEXOf4WhcZrQM7bMXUwF6OHMdRc2J+QHxAG5s36ot1nQUU=
X-Gm-Gg: Acq92OF712zdxpdIIy2gPQub8WkY2iC9+BonN2FRmX4bkPRXFnATG84Ytu4UckiE2PT
	YalNDGC5jwb0xbUa4O571DYN6bOE12mIrWXpwXyx4lvpzWEuiYt/QUBaEmKqi/6Cy6JrME3TpTY
	PTwYWrmYrxu2JE1qW8XACDq9rgt7tvkSIzbOPwjf50aDTA7uC/NXlQISZGXroAiMnLfkiYIA1en
	Ai5J4apMi0+lF2G/AlIs6mr0KdzCmbMpqOu7h65OU++Jny4fzMjApGHpc2RvI3YN9lBOp5DMncq
	ZP1/gYgfjHSc59sBCldQB9a5MC20+n5HFJXpH70yP7rX+zy8+cirsgbNzpMArawuCb3GMR3zQ7N
	IDVYMrz3ymQ==
X-Received: by 2002:a05:7022:206:b0:137:ea56:358 with SMTP id a92af1059eb24-137f6bd030emr3478922c88.30.1780588910487;
        Thu, 04 Jun 2026 09:01:50 -0700 (PDT)
X-Received: by 2002:a05:7022:206:b0:137:ea56:358 with SMTP id a92af1059eb24-137f6bd030emr3478562c88.30.1780588909024;
        Thu, 04 Jun 2026 09:01:49 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f716017esm5199221c88.15.2026.06.04.09.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 09:01:48 -0700 (PDT)
Date: Thu, 4 Jun 2026 11:01:47 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <docular.xu@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
        devicetree@vger.kernel.org, spacemit@lists.linux.dev,
        sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org,
        Charles Jenkins <thecharlesjenkins@gmail.com>,
        Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v3 02/15] riscv: hwprobe.rst: Document EXT_ZICFISS and
 EXT_ZICFILP
Message-ID: <vazr6kop3pbga22p5wbn3oursuic4thh4aeogkndyuskrncgta@cpk6igb7cr6a>
References: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
 <20260603-rva23u64-hwprobe-v2-v3-2-5529a7b28384@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-rva23u64-hwprobe-v2-v3-2-5529a7b28384@gmail.com>
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a21a170 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=MiYv3HnXQXVWDUVKjRcA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE1NyBTYWx0ZWRfX+RxMIX7WzIhT
 4Gwos0lCntmm0y8hwIqWuZq/nOzUvWbQigJBtOPyIrOSCJwFNmyJJWjv3lE6YbTzGCjEEUVAvCr
 8tPgSy5tjn5i/1H0M0MqjVCKq/V4UndIy2Z9+xu08YPdAJDi59v6woTnnTHM1VbXAvlp8604aSR
 yoLl4qylccBbAHjb0zMO/nJsDtJxWmXayJk+lSIrNR/ZixtOdn0Rc0Jb59hnUQTwHF5i7Nbsca5
 BGHQdTQnvyjWQ4/WkWr1jRPcpsf9np9937e4C/nX+0nfqorn/QWchIiwSAMDJyLHJ+3lGx2yHHz
 BERs1Q63WcRird7Db+MNU14TLWQ2pAw3FyG6zHQzdlBrfkDJFK4zt0DFXoJw+YxAt1jXm2VPyG5
 YLBvDceh4veFucURvHpei+jpMIpiV4INSyS1RND/zCZ/XkUq1aGT35kJWGC66GUVKM87xeTwt5y
 3LpBNE44BD3IIXpC4tg==
X-Proofpoint-GUID: _TZpBA6f8_dEfI7b5Q3xpyGfjARRgD8v
X-Proofpoint-ORIG-GUID: _TZpBA6f8_dEfI7b5Q3xpyGfjARRgD8v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040157

On Wed, Jun 03, 2026 at 07:11:57AM -0400, Guodong Xu wrote:
> Commit 30c3099036a9 ("riscv/hwprobe: add zicfilp / zicfiss
> enumeration in hwprobe") added RISCV_HWPROBE_EXT_ZICFISS and
> RISCV_HWPROBE_EXT_ZICFILP, but did not add matching entries to
> Documentation/arch/riscv/hwprobe.rst.  Add them now.
> 
> Fixes: 30c3099036a9 ("riscv/hwprobe: add zicfilp / zicfiss enumeration in hwprobe")
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>
> ---
> v3:
> - Also document RISCV_HWPROBE_EXT_ZICFILP (bit 63 of IMA_EXT_0), the
>   sibling enumeration added by the same commit (Andrew).
> v2: New patch.
> ---
>  Documentation/arch/riscv/hwprobe.rst | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index a09a8f16bd16f..3cedaaa53f331 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -289,6 +289,11 @@ The following keys are defined:
>      defined in the RISC-V ISA manual starting from commit f88abf1 ("Integrating
>      load/store pair for RV32 with the main manual") of the riscv-isa-manual.
>  
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZICFILP`: The Zicfilp extension is supported,
> +    as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
> +    extensions specification, ratified in commit ff03d8485a04 ("Update to

Can we use commit 302a2d45c243 instead since that one has the v1.0 tag?

> +    ratified state") of riscv-cfi.
> +
>  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
>    :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
>    mistakenly classified as a bitmask rather than a value.
> @@ -391,3 +396,8 @@ The following keys are defined:
>  * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
>    extensions that are compatible with the
>    :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZICFISS`: The Zicfiss extension is supported,
> +    as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
> +    extensions specification, ratified in commit ff03d8485a04 ("Update to
> +    ratified state") of riscv-cfi.
> 
> -- 
> 2.43.0
>

Otherwise,

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
