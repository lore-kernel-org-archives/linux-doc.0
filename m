Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA444C8F
	for <linux-doc@vger.kernel.org>; Thu, 24 Jul 2025 01:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753321738; cv=none; b=leEsCyEeqF1q+vyJxqdPuFN1pzQuwAujkQrhCHC+PW/hAzOA9nUk1JdHnKVOU4l39yp7JlPEFXy8PovDFFjS4EFzpvBCrpgYbzrVQ5K2l2/crKnFrX6wbyQGZopqCQjU2jwl9/1iwDDW2h0bHT8yD5beXb7JlyqTXG/V0zAgRKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753321738; c=relaxed/simple;
	bh=yOckcSAWN3jOQjyFGoNTRs2pUdHiS6imQniYsYlRySI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s13vI0eOxCv3YKViUOj4HWOICX26dzEoFOC0bTRZBnJzwG5F+PprXwB+kj5weHOAHskv8z/URu9d8E85FQ+db1f+xMS5X4yCMyjFbw+hq/XhRIKlLGnWAghtYK6pfo303Eqch3hY/EDBp9d3UC0tdHDf9zgfIntn0iWxWSKqsE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QErbye8l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QErbye8l"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NMXOHJ012697
	for <linux-doc@vger.kernel.org>; Thu, 24 Jul 2025 01:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pONdAv4XuSeyzdXX1wuMYXUvcdht/3V8RKEwqG7m+YQ=; b=QErbye8lY2wArw4u
	nLa/nxC9JhoJBrDbHVmlNrLz2iPeVfvpHjk2sLHotBBSVHL3ek+B/04oX43Ltbv7
	0+tzjX+Q9YebaDDNbbvCwNHi0x3mlu6VrsRxxs1Fd93eeakTkNeMSQbclJLd1FLB
	qHdgB67vOlhCX94MxY8XAESIeRo7qE1wM3xBg/8lNiM1aIsx3xT7w3KDzD7bVxFR
	ucuxEch898Czh7RZ0tSOXONw4im7sK4XxoTIP1ct+CJmKIIh4V1rZy4L6WNa6KIR
	AORgCqkHOsKhwjttNv2I1yv+hFIhi7A6VU8p3qjv49ZH1lCi9tNcD4XqGEmRgHTL
	w5s20Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3hw2gc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 24 Jul 2025 01:48:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74d15d8dcd1so470108b3a.2
        for <linux-doc@vger.kernel.org>; Wed, 23 Jul 2025 18:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753321735; x=1753926535;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pONdAv4XuSeyzdXX1wuMYXUvcdht/3V8RKEwqG7m+YQ=;
        b=sFxB2xy9H2uE2APiBR7tRXFBnmDC9dKRNUpf74hU4W74Mq2LyhzBvpAOryAtBzTZbj
         LXkXl3UGZ++4Wgw60UUQ7sKk9lLdhNUOC/o1SYtu1XjfQqDE1a+QFSJgS6YFy+vEPwb8
         HCP2BIUnN1jLJQxdfhPZM1KOeJitEiwxd5ut96RKv7q4LgAmyPQ3nH4yxXLhMQyo3dG0
         WDRzynANWe2oXKG9/wmwiusRghi7nAMKBwLEdA8DUSfeyrhGIghfl38iGwetUGHIz3hO
         jgf+tyzr6norq66ukUWrWCMz1gpMhVa16aiTWOnkLTjWPSQfUb1X6PTPz4R8Yrrq0OR0
         I0ug==
X-Forwarded-Encrypted: i=1; AJvYcCULcsPzeIxuRxHZiQGvx2gfn1p7iAzCOCK5ZS10t2HnKnmbYdIltcE9jP6yvNw4a7Rk3HU6TVAnzvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo5xQaqhUovqnaiq7QPGgQugKYaycqvMt4e5Wr3YeX+K2I15/D
	EPbGgDitG7h47Yj/hYh6DY3ODr8KOZh9ikhhJG15RyY0QY2HNWzoSgYBNq+X6XqhfyAuBtoR/XW
	GwYEoo4N96ZmGq/ha968mVRgHunvA1gQmJlsUGTDOWZ44z+FaYA6ZJkw3BFMXeic=
X-Gm-Gg: ASbGncsZs74pgMk12jknx6l9b0eF4FMa20YSwmw8vIX1sAhjKot//wcBqlAoCUI9Pae
	6wy+t/iqn919yKseq+n/yhajj3F70qsRx9uKIX3zzLpIam4NVqaFBuQ1KOMasE5ffirMtB+iX7Z
	AzYUjoUxG2VXoZe7ORaeUxaK1daHg7sCTL4RYjwE5Ki5X6svGZQnAFMlmE74lPYCYBuIohkaEVY
	ljY22pp6hEstCw90HsNohcQMnM/egC0oOPPnp4ZHmDriUp3n8ybXkulr55H5wCUjZwhbTVJp6gP
	hZXzIb+WL6845zvPyTk+C3E287fGsRI8Xh/ZD+8sxdKu2lsLKfoj950i0Wi6S40ZKOi9pdkDbwP
	KtoISL5QhGtRwRgJdIjxwVPzTmKCG/lHD
X-Received: by 2002:a05:6a00:3d4b:b0:75f:9622:4ebb with SMTP id d2e1a72fcca58-76034c4d082mr7493263b3a.7.1753321734696;
        Wed, 23 Jul 2025 18:48:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNF/FxJN8S9VPMYDlqd+zaDnMBYiYx08UeUD4DYOcM/V096FBP/axlaYw4vfyBR6itOiPHtA==
X-Received: by 2002:a05:6a00:3d4b:b0:75f:9622:4ebb with SMTP id d2e1a72fcca58-76034c4d082mr7493236b3a.7.1753321734272;
        Wed, 23 Jul 2025 18:48:54 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761ae158d4bsm380439b3a.49.2025.07.23.18.48.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 18:48:53 -0700 (PDT)
Message-ID: <36da45e3-20e9-4ffd-9ab0-3f3804942eb9@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 18:48:52 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amdgpu: use kmalloc_array() instead of kmalloc()
To: Yunshui Jiang <jiangyunshui@kylinos.cn>, willy@infradead.org
Cc: alexander.deucher@amd.com, chriistian.koenig@amd.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <aE-ML8rLXnLaqHVA@casper.infradead.org>
 <20250724013754.3429608-1-jiangyunshui@kylinos.cn>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250724013754.3429608-1-jiangyunshui@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=68819108 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=otUng5Y2uqA8c-M6AFMA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDAwOSBTYWx0ZWRfXwxuUKJYoBETe
 dCAkz9x0RHnqHe6iGlT7Np518u0aadws7uL/FE2BZ645i3Px2oYT0VCQ3ZHJPMqJl41iWqNLojP
 DURY/9XvebfZkqiCqR1PXhVsQzfvtChg/HPg4CTmRQ4J4SoYV5ACfJIuRpmqWIPPWe+mjg7Yv5U
 PMJJzr/HaMmOZXh1hHbwZbqiiuASsjNLE154GjwpdxmCKiIuwKcyVFAUO/RWebrn/KbUBxrhQ1e
 /XzH8PvV3aDknG50yunSbz2pOF4KULyhr2RE102qbTwJEYJxRST55K0GKPO1J8j95csFlOskMj2
 z7Uxqbp9Ks6uFQ0+fdpTnv4BVPJ+ZdHsd1WrDUr5yP8UPbMpNWtWD1JD3Z1Q6tloNg78CIGqyCs
 xsFUu7LDUI9A9J7n+W+NCmhVu8H58Gvu02SNoGQ/TwqAY93uB1Gh+ybWcXIBqLeoQO6O7vhz
X-Proofpoint-GUID: hIBpiyfSha_wRyHbObb9A6pDC8nRQX9f
X-Proofpoint-ORIG-GUID: hIBpiyfSha_wRyHbObb9A6pDC8nRQX9f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1011
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=686 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240009

On 7/23/2025 6:37 PM, Yunshui Jiang wrote:
> Use kmalloc_array() instead of kmalloc() with multiplication.
> kmalloc_array() is a safer way because of its multiply overflow check.
> 
> Signed-off-by: Yunshui Jiang <jiangyunshui@kylinos.cn>
> ---

1) When you post a new version, you should add a revision history "after the
cut" so that folks know what changed

2) The new version should be sent as a separate thread; don't make the new
version In-Reply-To the previous version

