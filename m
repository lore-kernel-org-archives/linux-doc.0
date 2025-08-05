Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A160200127
	for <linux-doc@vger.kernel.org>; Tue,  5 Aug 2025 22:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754431732; cv=none; b=uq7xJjVBPCskDQLpkY0EXFd++ZKSG6sCyUHTXKozJ9pof1K2RcnhA4NucQUfFSNtSQKLChmmYvge2Sn+4ov+qgHWLydMnHAawvhGq1oeyaCCDfT5tqH21TP/9E1ONKSZ5pLSAv+eqiYaomNEpnuapJdA6wh8kMlC0pyd3V0fxC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754431732; c=relaxed/simple;
	bh=C4aF0jhnSDNzgCpC/9MJ35IS2P6qdTHutz5MBfw8VPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SVbaVjtMPjED8BFPIZANcg1rLwI0ItCkHDxKoLjh7V7J+0tax9Jv7Ld2I0Sk2nwaYNoZM3Lc3QeQv5GidZgCHEnSOHxHB5yv4nHlqsFHfcm6B1f9Oe4PxWp4PfYy2NE8H5FZ2Pf3ZMGaMFE2bfNWLcthFSowIHCcNVYjq0+5k5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L90XrZQf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L90XrZQf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575I3cvV023149
	for <linux-doc@vger.kernel.org>; Tue, 5 Aug 2025 22:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NPGNwiXRp88kNPj5T9C7eKWaHt3n1T+xdGhFfZ8qfi8=; b=L90XrZQfg0e/SVV5
	hnJOKrC93kx5V44KikYr3CH8RJsRDp4v9t6jNOV9v6ig0dEbvn/BQhiIHm6Nuqv5
	8B/nWVhfNdJHAL7p6iw5uncWCNh25Oo5KdaloshaBt+u52upFL7Fg1M0+NWwIqWs
	wS6Cdj0usjPaNQdJYeWr7Z/P+f856S2ghV0/OdSAgQ14rtDPGreGLFREZZXmKD3+
	zTxxDAzBRoixo8InXokNVTnS8l/q+EVa5NM+pMe+s20BZu05Q6i+lVC0KQJLUVA5
	m98cd/jZUUyRz99QBiVQ1N4OfyqlQBbdiEMOIJVflcUD9kkRsTuWrZYbEtu6866d
	raJO+w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw30jx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 05 Aug 2025 22:08:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b423dcff27aso7226554a12.0
        for <linux-doc@vger.kernel.org>; Tue, 05 Aug 2025 15:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754431728; x=1755036528;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NPGNwiXRp88kNPj5T9C7eKWaHt3n1T+xdGhFfZ8qfi8=;
        b=wPtIta3tFNRyEHPrZyMgP9K0mfxtjilYUUDtIMsKispUbvI/2K3S09MZSyCK+xAH/m
         X/6VFxBm3PHoDFLe0E+pwjmFdK1VKkH3EejRfvvVQPxBSQ99UC792le7i6bMVQwbZDlV
         9qhaPrgL3RFs9xj06xxwG+3JSywAL+utocuM6RNhJ0criZNA/MwN9J58MIFwZCf1QCaG
         hGw1URuqAW4vCD+mQm+BvRA3lg4akpJKRNOmKIUvEWdGHHVcdTw0+05PUpyq9Us4Pbm6
         ptMDFK7XXV4Q00H8tC1GhL3740nZM6sEhN3NUaatqyVzpyhlycONrhGtePXs5fZz/yZA
         JPtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHGGlr4S/+zVueQh5yIkY34TwBNVjhY8LFKPW2mxJz2wxYFYU6sGl/0+jp4361myrXl4TFvKQXiJM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj+1qtLLaJ1hKgLeIJReTRsTK5rvuurhLsuKlymxnvBpuxKx6p
	vqUXM5ZhlwQJ5gd4rSwpx+B4wRh8Bjhqd1lXmFoF6k7MUVc/wTEjNOFNfTK8BJQSHrm4xADYuUb
	seRFVA9INN37my954vT7tcwx//sadlxc8J8fzgRiHgXiKtzVYfRApre0GuNK0uAc=
X-Gm-Gg: ASbGncs0fObdl4WzLy0rLKNggY8d/yp7KxwMBXe5yD0fb8eybfqQIRJiByyum2BFAG4
	S3BNJTQXf2qGqgh60WOYlf7e8NJ/ZagzgFXHQo2e/NvmTzGieqqniELHH7q4q+iw2kweMKxkNFM
	VZafD8ddMWnuUSuhgE62zJhRUQ1CSuvBTxHlo6W77QlFpcOd8qqbaNAcOoYb3mqgJRtmdYMEGyc
	JAxWw09qN0crHlnGIjqhA4vAWDLtfCMBjE2CfRym1AOMSFIZvc7YXrOVqTullSULMqyvsgsft4c
	nlAQ5c+SdeAj4sLcFI433EfDjAFMmbjVS5OgzvGjnurEnPKcN8HQPQn+RcKFFM7ogWHPTRG9tg+
	q/y5JbuIQXoAUdx2SZGsLIjmUXaeQi3gJ
X-Received: by 2002:a17:902:ce83:b0:23d:d2d2:b511 with SMTP id d9443c01a7336-242a0ac1ecfmr3280065ad.19.1754431727842;
        Tue, 05 Aug 2025 15:08:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0Kul0H2qbAtCnTZWaSV2/tYAXzYWabMFDcnnTPF71+z9fGCHROeCrM/g1vJAXwk5dY+X+Wg==
X-Received: by 2002:a17:902:ce83:b0:23d:d2d2:b511 with SMTP id d9443c01a7336-242a0ac1ecfmr3279765ad.19.1754431727402;
        Tue, 05 Aug 2025 15:08:47 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f21c65sm143695185ad.73.2025.08.05.15.08.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 15:08:46 -0700 (PDT)
Message-ID: <771aef93-df3e-4a9b-b6d9-3a5057f77ddb@oss.qualcomm.com>
Date: Tue, 5 Aug 2025 15:08:45 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] agents: add legal requirements and agent attribution
 guidelines
To: Sasha Levin <sashal@kernel.org>, corbet@lwn.net, linux-doc@vger.kernel.org,
        workflows@vger.kernel.org
Cc: josh@joshtriplett.org, kees@kernel.org, konstantin@linuxfoundation.org,
        linux-kernel@vger.kernel.org, rostedt@goodmis.org
References: <20250727195802.2222764-1-sashal@kernel.org>
 <20250727195802.2222764-5-sashal@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250727195802.2222764-5-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDE1NyBTYWx0ZWRfX2wOXTqrvmziR
 l94nk1ikSIXO+/lqVm3WW1+JM0cLFS9GGfQtpC3zYZv/zk2EUSaNboK1dBq+i4QOFC24vQ6PFE/
 CHOosZvTL9hqS4YU/nc3xDM1hi8otHw4v9V3OtAWaeWaaaGJvcInoa6NYvpaqmx+QAGag5EcXJJ
 oPAoKxi29poicd/f3elpWUpN/08RG9ft0MVYLfbjAHdk6kqvMbKZ/FMMpac1ipv9MufqHqcpRuD
 qg46YEQbF6rVzToU3+/E5OrycTILFgxG3MAWhpx0GTqRfRK5WiiIDKYQoA3ZGMR5BEIUV7UA5IK
 TkWfY0AxoMUae8x8zKaV+LAqDdvsVHiYjj8lbulMTMf5jWtouSbeRIartnAGIQ6R9TH2EQLqSp1
 R9/qOd7giv+7hPQ3oLZUMtziq2Z/XQA1CB3Xwqcbf9MLKVjZ8dLjUmvyldt8sR+KxfDGji4/
X-Authority-Analysis: v=2.4 cv=J8Cq7BnS c=1 sm=1 tr=0 ts=689280f1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KGwrKJCAF6cQJkUQTlQA:9
 a=QEXdDO2ut3YA:10 a=mLIokOBbMDMA:10 a=W1xJO3YbG5cA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: y1NZY5EvPNWKHzUbrwkgQkB2BPo4fmbT
X-Proofpoint-ORIG-GUID: y1NZY5EvPNWKHzUbrwkgQkB2BPo4fmbT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=862 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2508050157

On 7/27/2025 12:58 PM, Sasha Levin wrote:
> And below is the first test of this scheme:
> 
> Co-developed-by: Claude claude-opus-4-20250514
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  Documentation/agents/index.rst |  3 ++-
>  Documentation/agents/legal.rst | 42 ++++++++++++++++++++++++++++++++++
>  Documentation/agents/main.rst  |  5 ++++
>  3 files changed, 49 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/agents/legal.rst
> 
> diff --git a/Documentation/agents/index.rst b/Documentation/agents/index.rst
> index 354af3f025e5..982602db3349 100644
> --- a/Documentation/agents/index.rst
> +++ b/Documentation/agents/index.rst
> @@ -9,4 +9,5 @@ Agents
>  
>     main
>     core
> -   coding-style
> \ No newline at end of file
> +   coding-style
> +   legal
> \ No newline at end of file
> diff --git a/Documentation/agents/legal.rst b/Documentation/agents/legal.rst
> new file mode 100644
> index 000000000000..67e6b2cdff9d
> --- /dev/null
> +++ b/Documentation/agents/legal.rst
> @@ -0,0 +1,42 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +===============================
> +Legal Requirements for Agents
> +===============================
> +
> +This document outlines critical legal requirements that coding agents must follow when working with the Linux kernel codebase.
> +
> +Licensing Requirements
> +----------------------
> +
> +**GPL-2.0 License**
> +  The Linux kernel is licensed under GPL-2.0 only with a syscall exception. Coding agents MUST follow this licensing rule with no exceptions. Any code contributed must be compatible with this license.
> +
> +**SPDX License Identifiers**
> +  All files must have proper SPDX license identifiers. For most kernel source files, this should be the first line of the file in the appropriate comment format:
> +
> +  - For C source/header files: ``// SPDX-License-Identifier: GPL-2.0``
> +  - For scripts: ``# SPDX-License-Identifier: GPL-2.0``
> +  - For documentation: ``.. SPDX-License-Identifier: GPL-2.0``

I believe the agent has not processed the following correctly:
https://www.kernel.org/doc/html/latest/process/license-rules.html

1) C header files use /* SPDX-License-Identifier: <expression> */
2) Contributions need not be GPL-2.0, "individual files can be provided under
a dual license, e.g. one of the compatible GPL variants and alternatively
under a permissive license like BSD, MIT etc."

These two issues jumped out at me...

/jeff
