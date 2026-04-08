Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC0937F756;
	Wed,  8 Apr 2026 11:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775647965; cv=none; b=NCftSol52olLFkoYnhKVBwzvaXsy1axiPqZ+ElgYH9GM9zrbRbPhJRdNaCdnVCHxmrRg97MGE7mbH2s76stPLxmz6k28e6RJML0VQ9h6KFe7MkB8lNTJ8tFJ3XAHf0oSuikMhJnp8ZYLalFomH9A9vTjixXWdW+pX42yuwEr0io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775647965; c=relaxed/simple;
	bh=pfiEIXLahlFj+XBEYxghZsQA9xdUy9QyBBVz59RovDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nWhJ+2P1u8m9WEDUmIC59O1oYOaGYWl1uilkMT7sxxGrS0m+10IuQwP81ICYevtgnw2LNS2q8zjUd01+8mDJPUD7nsf3eq2G/sJs+cR8Xlk3CYttVzv2Ke+N2N2xfEyRU/2vvTkcg+vwLuBFgsiNGK5mMtIxD6he3JEPc0785fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=CdJS1/UA; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="CdJS1/UA"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6386678R2302243;
	Wed, 8 Apr 2026 11:32:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=mQ6zZp
	xT2qSOtvzZoKaBAI5LQFfgnkXwcNMrFIicLhI=; b=CdJS1/UAA+e7v16JnBcaBi
	FevxVeMbtvPmzRYVrepXAWVnoo68Kfx5It06IaBOm7Bel1G+0JvqN1tl8JURtcOu
	MohUDWThBJvGRTLPQbYU7QAMR3ac72uiEw1jZCj/tJO+rEkSDm35VpO0qQz+Qtav
	rPYBey9cbdzIIRIXHHMdXp0OOukHYc/a++fBAxi39T9Sp6fpcGpE0brdCB9a/SNM
	USoBIB3mqEOShduuPMGo3sNWi9NIA+HEE8n8kntDRZWzANfMTKTscHcty4BjFgrS
	oXIUDCPU+5vgvjRkpcG8o6Mipa3ImB0Mp4FO8moNiXqBhpqGp5TKpgNewenZaehA
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dcn2ffpte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Apr 2026 11:32:21 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 638B3KOv019113;
	Wed, 8 Apr 2026 11:32:20 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4dcme9f70r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Apr 2026 11:32:20 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 638BWIw022217086
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Apr 2026 11:32:18 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E8CD20040;
	Wed,  8 Apr 2026 11:32:18 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3EC0320043;
	Wed,  8 Apr 2026 11:32:16 +0000 (GMT)
Received: from [9.123.14.142] (unknown [9.123.14.142])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Apr 2026 11:32:16 +0000 (GMT)
Message-ID: <9905884d-9af1-476e-9355-c2df733d9c75@linux.ibm.com>
Date: Wed, 8 Apr 2026 17:02:15 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crash: Support high memory reservation for range syntax
To: Youling Tang <youling.tang@linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc: Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
        kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Youling Tang <tangyouling@kylinos.cn>
References: <20260404074103.506793-1-youling.tang@linux.dev>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20260404074103.506793-1-youling.tang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDEwNCBTYWx0ZWRfXw/s5twIwj5ku
 srLl0b8nEiGgrernx/eJbrS5U4u2nfJ+wV/vdVFcd9PO/d7PeKEI1qe9PvY93uCgdkhVCZtknBy
 v6aNhmdlcLb8OmZSanLSpo0UTdbaILS8pS9wWVimCS8sdyB2odToc2hcwRPn4XPavllR0NBbmLe
 aBmW40L8qCD+VADkBqhVqjAea4vaWSNpNPkv6/4h4DV/hGZm0+rqKtxdsehQ+iezJmytHwtksof
 +SXeWMQ1W9UrdZ/kUNeYlY53MJBURGWTJyLh4rgwyypoxbDLnPC21ljx1+bs7y2spU+706vT8lJ
 YczE1HFl2UnljpNkR82aiO8f/ZW5R8H1CkuyxRXEmrEPPIbCF1hYuYtje/UV3ox5pBkVNAEF0PR
 7E1+WfJ+ewJaGRuqwm+m55vqz+6VTYPs4PI14UD7NT8hd3BHSJnGAKfEyWP/zUY4Y1MhFDjIWr/
 5CoR5rsXgwn0JABGV7g==
X-Authority-Analysis: v=2.4 cv=FsY1OWrq c=1 sm=1 tr=0 ts=69d63cc5 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=YjEWhN3Cx0CZYGql71AA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: UBVhWKsi9V-Xe3jkId-8tgitBtDBFFuG
X-Proofpoint-GUID: UBVhWKsi9V-Xe3jkId-8tgitBtDBFFuG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080104



On 04/04/26 13:11, Youling Tang wrote:
> From: Youling Tang <tangyouling@kylinos.cn>
>
> The crashkernel range syntax (range1:size1[,range2:size2,...]) allows
> automatic size selection based on system RAM, but it always reserves
> from low memory. When a large crashkernel is selected, this can
> consume most of the low memory, causing subsequent hardware
> hotplug or drivers requiring low memory to fail due to allocation
> failures.
>
> Add a new optional conditional suffix ",>boundary" to the crashkernel
> range syntax. When the selected crashkernel size exceeds the specified
> boundary, the kernel will automatically apply the same reservation
> policy as "crashkernel=size,high" - preferring high memory first
> and reserving the default low memory area.
>
> Syntax:
>      crashkernel=<range1>:<size1>[,<range2>:<size2>,...][@offset],>boundary
>
> Example:
>      crashkernel=2G-16G:512M,16G-:1G,>512M
>
> This means:
>    - For 2G-16G RAM: reserve 512M normally
>    - For >16G RAM: reserve 1G with high memory preference (since 1G > 512M)
>
> For systems with >16G RAM, 1G is selected which exceeds 512M, so it
> will be reserved from high memory instead of consuming 1G of
> precious low memory.
>
> Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
> ---
>   Documentation/admin-guide/kdump/kdump.rst     | 25 ++++++++-
>   .../admin-guide/kernel-parameters.txt         |  2 +-
>   kernel/crash_reserve.c                        | 56 ++++++++++++++++---
>   3 files changed, 73 insertions(+), 10 deletions(-)
>
> diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
> index 7587caadbae1..b5ae4556e9ca 100644
> --- a/Documentation/admin-guide/kdump/kdump.rst
> +++ b/Documentation/admin-guide/kdump/kdump.rst
> @@ -293,7 +293,28 @@ crashkernel syntax
>          2) if the RAM size is between 512M and 2G (exclusive), then reserve 64M
>          3) if the RAM size is larger than 2G, then reserve 128M
>   
> -3) crashkernel=size,high and crashkernel=size,low
> +3) range1:size1[,range2:size2,...][@offset],>boundary
> +   Optionally, the range list can be followed by a conditional suffix
> +   `,>boundary`. When the selected crashkernel size matches the
> +   condition, the kernel will reserve memory using the same policy as
> +   `crashkernel=size,high` (i.e. prefer high memory first and reserve the
> +   default low memory area).

Since we are mentioning that this follows same policy as 
crashkernel=size,high
in certain cases I think it is good to mention crashkernel=size,low is 
ignored here.

> +
> +   The syntax is::
> +
> +        crashkernel=<range1>:<size1>[,<range2>:<size2>,...][@offset],>boundary
> +        range=start-[end]
> +
> +   For example::
> +
> +        crashkernel=2G-16G:512M,16G-:1G,>512M
> +
> +   This would mean:
> +       1) if the RAM size is between 2G and 16G (exclusive), then reserve 512M.
> +       2) if the RAM size is larger than 16G, allocation will behave like
> +          `crashkernel=1G,high`.
> +
> +4) crashkernel=size,high and crashkernel=size,low
>   
>      If memory above 4G is preferred, crashkernel=size,high can be used to
>      fulfill that. With it, physical memory is allowed to be allocated from top,
> @@ -311,7 +332,7 @@ crashkernel syntax
>   
>               crashkernel=0,low
>   
> -4) crashkernel=size,cma
> +5) crashkernel=size,cma
>   
>   	Reserve additional crash kernel memory from CMA. This reservation is
>   	usable by the first system's userspace memory and kernel movable
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 03a550630644..b2e1892ab4d8 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1087,7 +1087,7 @@ Kernel parameters
>   			4G when '@offset' hasn't been specified.
>   			See Documentation/admin-guide/kdump/kdump.rst for further details.
>   
> -	crashkernel=range1:size1[,range2:size2,...][@offset]
> +	crashkernel=range1:size1[,range2:size2,...][@offset][,>boundary]
>   			[KNL] Same as above, but depends on the memory
>   			in the running system. The syntax of range is
>   			start-[end] where start and end are both
> diff --git a/kernel/crash_reserve.c b/kernel/crash_reserve.c
> index 62e60e0223cf..917738412390 100644
> --- a/kernel/crash_reserve.c
> +++ b/kernel/crash_reserve.c
> @@ -254,15 +254,47 @@ static __init char *get_last_crashkernel(char *cmdline,
>   	return ck_cmdline;
>   }
>   
> +/*
> + * This function parses command lines in the format
> + *
> + *   crashkernel=ramsize-range:size[,...][@offset],>boundary
> + */
> +static void __init parse_crashkernel_boundary(char *ck_cmdline,
> +					unsigned long long *boundary)
> +{
> +	char *cur = ck_cmdline, *next;
> +	char *first_gt = false;

false to char *? We don't even need to initialize.

> +
> +	first_gt = strchr(cur, '>');
> +	if (!first_gt)
> +		return;
> +
> +	cur = first_gt + 1;
> +	if (*cur == '\0' || *cur == ' ' || *cur == ',') {
> +		pr_warn("crashkernel: '>' specified without boundary size, ignoring\n");
> +		return;
> +	}
> +
> +	*boundary = memparse(cur, &next);
> +	if (cur == next) {
> +		pr_warn("crashkernel: invalid boundary size after '>'\n");
> +		return;
> +	}
> +}
> +
>   static int __init __parse_crashkernel(char *cmdline,
>   			     unsigned long long system_ram,
>   			     unsigned long long *crash_size,
>   			     unsigned long long *crash_base,
> -			     const char *suffix)
> +			     const char *suffix,
> +			     bool *high,
> +			     unsigned long long *low_size)
>   {
>   	char *first_colon, *first_space;
>   	char *ck_cmdline;
>   	char *name = "crashkernel=";
> +	unsigned long long boundary = 0;
> +	int ret;
>   
>   	BUG_ON(!crash_size || !crash_base);
>   	*crash_size = 0;
> @@ -283,10 +315,20 @@ static int __init __parse_crashkernel(char *cmdline,
>   	 */
>   	first_colon = strchr(ck_cmdline, ':');
>   	first_space = strchr(ck_cmdline, ' ');
> -	if (first_colon && (!first_space || first_colon < first_space))
> -		return parse_crashkernel_mem(ck_cmdline, system_ram,
> +	if (first_colon && (!first_space || first_colon < first_space)) {
> +		ret = parse_crashkernel_mem(ck_cmdline, system_ram,
>   				crash_size, crash_base);
>   
> +		/* Handle optional ',>boundary' condition for range ':' syntax only. */
> +		parse_crashkernel_boundary(ck_cmdline, &boundary);
> +		if (!ret && *crash_size > boundary) {
> +			*high = true;
> +			*low_size = DEFAULT_CRASH_KERNEL_LOW_SIZE;

Not all architectures support high crashkernel reservation. So high and 
low_size
can be NULL.

I think we should just skip parse_crashkernel_boundary() call if high is 
NULL. - Sourabh Jain
> +		}
> +
> +		return ret;
> +	}
> +
>   	return parse_crashkernel_simple(ck_cmdline, crash_size, crash_base);
>   }
>   
> @@ -310,7 +352,7 @@ int __init parse_crashkernel(char *cmdline,
>   
>   	/* crashkernel=X[@offset] */
>   	ret = __parse_crashkernel(cmdline, system_ram, crash_size,
> -				crash_base, NULL);
> +				crash_base, NULL, high, low_size);
>   #ifdef CONFIG_ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
>   	/*
>   	 * If non-NULL 'high' passed in and no normal crashkernel
> @@ -318,7 +360,7 @@ int __init parse_crashkernel(char *cmdline,
>   	 */
>   	if (high && ret == -ENOENT) {
>   		ret = __parse_crashkernel(cmdline, 0, crash_size,
> -				crash_base, suffix_tbl[SUFFIX_HIGH]);
> +				crash_base, suffix_tbl[SUFFIX_HIGH], high, low_size);
>   		if (ret || !*crash_size)
>   			return -EINVAL;
>   
> @@ -327,7 +369,7 @@ int __init parse_crashkernel(char *cmdline,
>   		 * is not allowed.
>   		 */
>   		ret = __parse_crashkernel(cmdline, 0, low_size,
> -				crash_base, suffix_tbl[SUFFIX_LOW]);
> +				crash_base, suffix_tbl[SUFFIX_LOW], high, low_size);
>   		if (ret == -ENOENT) {
>   			*low_size = DEFAULT_CRASH_KERNEL_LOW_SIZE;
>   			ret = 0;
> @@ -344,7 +386,7 @@ int __init parse_crashkernel(char *cmdline,
>   	 */
>   	if (cma_size)
>   		__parse_crashkernel(cmdline, 0, cma_size,
> -			&cma_base, suffix_tbl[SUFFIX_CMA]);
> +			&cma_base, suffix_tbl[SUFFIX_CMA], high, low_size);
>   #endif
>   	if (!*crash_size)
>   		ret = -EINVAL;

