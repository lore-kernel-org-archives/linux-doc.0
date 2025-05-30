Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C8D13635E
	for <linux-doc@vger.kernel.org>; Fri, 30 May 2025 16:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748622963; cv=none; b=OjbYHts7mFh17YVWjpP7wyEuE+eRq4dlT/GhustvOi/RVhocHn/Ks/ZhiJltgGfJInhVVB0P89WwGhjuYpYpVNV9ld/Z+dK1kqJ6EldUDS+DuSas2lzRZFnC8BJ0TIVcO7q3g/IBAbXSiVSUNutu/pMkXIKpdkL7tp6Wl93Hsr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748622963; c=relaxed/simple;
	bh=Ou28K7mPcEkrpg2bOaExpVD2dLuDalrqTtn2WNwNvfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WtdY+q+jJnFoDRjn89vRCQl7A6dwA6MXHbzXg75mThCgQq55Hw0DyHDR9HTwliH20QqfAOQ+ZHnTEyBb33vrkWg1zmqU3Q+R/Dlme5B6n8jV5N6pr3hYiPEqcGqaVYvH5EhFX0d5r02yIFBvMKWwPuVxDzzC+HYR0csQFiWI/MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hS1NY1XC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hS1NY1XC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBGeju004885
	for <linux-doc@vger.kernel.org>; Fri, 30 May 2025 16:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Shoo0tKVIcVl87O2cZuDQQ6KICwG3ajVLpAaOIpSTcE=; b=hS1NY1XCWJaI/L0a
	dJatO4IlRpSEMzQwwY6c+SNFZcYQnB/2uVSktsWPY/evcTwsqeyAoC8RlpC3jRT5
	PwBJxfWcS17aLFb3MyLV2CuDAdNs1tTCeaxyyHtzHnyQLmbFeJdD9x5lNa50Q63o
	tK5NWCrkoAz3Vd+a0iuaQBZe/GiJczyWL5VGp56jwk5No9co1fSOJzDRGdkezfD3
	Fmua1tTrWJBWsx97/dseKpjIUR4Egok5O8OUgpIBEPv+Zyzv0KGRUXjXIuwejRjs
	D13y+FQ5Tm0r0DiJGB+WMLhkIhJWdzZ69i6suJJNMWJ6ViZ9ISgdlRQMbWenOjmT
	+ru2/A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ek9j5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 30 May 2025 16:36:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31202bbaafaso2344543a91.1
        for <linux-doc@vger.kernel.org>; Fri, 30 May 2025 09:36:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748622959; x=1749227759;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Shoo0tKVIcVl87O2cZuDQQ6KICwG3ajVLpAaOIpSTcE=;
        b=FcpWZ6zclS8chqtFcOnx4KwtMrWl63vdb24RmOeSjYUFG1/j6G6+YQQWq2qfNsKLAk
         y1WBBhRfPjDOlh3pJHAs5mPo+QYTrTmc1RbcVR/Q1jSyiBcA7vkxtWTgiynrgtIiazvw
         gFfd04MO6P2xKTtARqpV1BCT08Bk9oEbNrdRNStGQXy1MOeOthw8w7a/lvI9cOvmiZ/N
         sU0E0EqpP7z4QiN+frOQ27rAGqEuiiEApjh6GeRLuA/NqAA54gnpLPPp5K08gBA0TZPc
         r9oGMOhk39sDpH5b4Mfm2hUbDg8f7k1y4RzISKEUM6tasdvE7hHB9+qU89+AUg/S+GLb
         w2EQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYnPsfC52gYyFrBnuDV7lvWUf5W6w9ouRQ/EQLziWsj+eaBk1aWTfVPiu3ucJoIrpzd6Kffvasbz8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyez8eXUSsgX4WfTMkaPwTm6TB6BbdCXNN2IJQ7NpTz1klEs0mE
	D8EXEEIpet5uejeCKwHuNTeoLrvuKIx5RiyJiGb0qPTZ3fuFsPr4exsMTHZt9ICZWTn/EmHm64m
	rXzs4u7cRQr+av4e3NdGGj5JtIJ1opt+1azQEGnYsp6is+/vEDzEJu0ndr2NaEOg=
X-Gm-Gg: ASbGncs9JHsxk/l8ZmCf07e+MPzdUl+9jH3ELX46OHZP4r7QNllp0SXZkZWNM0v5W2/
	BjCeUd8w9V+93E8PUTAH7PQtXwTdGV5Vh1IgpZywvlDcqPV6KS/03bQL76aYpCZBK9jpojqn3tL
	VpnRmJUFry6g7itwb8uAn4UYmK1VqapVd/TWGtwZKqNFl0bl1Lwdc2GC+D1wRzeOGgsKWYKoHBh
	WDCt6+GE4qzYO7RvIRJ1KS1XmbKVsKvcRWrJHhpNKqmxGdlNJ3IQhqYSRzGInd9214g/pIB46+L
	j2n82Dvcr94H0LbhfduqGn1Oy3CrLzO6znxsYHoMPf9y6HnrasOgMzJoXyDhqYz5Oij9M5+0
X-Received: by 2002:a17:90b:55cb:b0:311:e8cc:424e with SMTP id 98e67ed59e1d1-31241e8cb1dmr6395393a91.24.1748622959268;
        Fri, 30 May 2025 09:35:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7gZlETTzuM/nB9i8V58eslnhzSbt76+bQeUPi+dwYMc6LXYsmcqrpPQXpymgaj7IkyAYV1Q==
X-Received: by 2002:a17:90b:55cb:b0:311:e8cc:424e with SMTP id 98e67ed59e1d1-31241e8cb1dmr6395344a91.24.1748622958819;
        Fri, 30 May 2025 09:35:58 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e3c1358sm1544883a91.37.2025.05.30.09.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 09:35:58 -0700 (PDT)
Message-ID: <bf24ba20-dad5-410a-934c-f5963a2769ec@oss.qualcomm.com>
Date: Fri, 30 May 2025 10:35:55 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/10] accel/rocket: Add IOCTLs for synchronizing
 memory accesses
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
 <20250520-6-10-rocket-v5-8-18c9ca0fcb3c@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250520-6-10-rocket-v5-8-18c9ca0fcb3c@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=6839de70 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=DISFzqtZAAAA:8 a=EUspDBNiAAAA:8
 a=CskBsiFdeBhsZAe0Fc8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-ORIG-GUID: yKnqgjhekMcuFEea7vHgDvH9hg1oy7k-
X-Proofpoint-GUID: yKnqgjhekMcuFEea7vHgDvH9hg1oy7k-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE0NyBTYWx0ZWRfX6WIyvoesAVrB
 aWgvlGiww8/qbImxf3GVUhQQqa358Y51oLkX0aOBW1QgOfy6kJmJ1DNnz/98wjOnIoGph+bta2b
 e3mwqQpjZxtvF2Dp7qP2Di9dBfMS0ooSJY67kloowvQSPxbNgKqxQHjRbMeSRFrSb2xVqP0w5eK
 tVrLh2MmlhMsqN9ZTMHZ3tCRTI5BBaJCc3xw4af2wWIVkJx4HScMI0y291/UlHBGooiRosWd06Y
 Ub/i/OdzYBJjIzulQ2UhDk5hMWiTL0clM/egVJyrgNUwqy9kR3syHOj+K1GOusvI+k3vwQco96B
 AWxFyDfZFK3KJKgh7tN36RA+zOZBq1nfaGG9+zhIr3J4aG/9ulL29uYx2Cye02CHvLVqTALkZod
 InymFlkkgPPJqwg1uu8lYkqdBFV8gJNwz0yDwYDkWM6LWmcaKAELFLllww1agdJU01PJYigo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_07,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300147

On 5/20/2025 4:27 AM, Tomeu Vizoso wrote:
> The NPU cores have their own access to the memory bus, and this isn't
> cache coherent with the CPUs.
> 
> Add IOCTLs so userspace can mark when the caches need to be flushed, and
> also when a writer job needs to be waited for before the buffer can be
> accessed from the CPU.
> 
> Initially based on the same IOCTLs from the Etnaviv driver.
> 
> v2:
> - Don't break UABI by reordering the IOCTL IDs (Jeff Hugo)
> 
> v3:
> - Check that padding fields in IOCTLs are zero (Jeff Hugo)
> 
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Assuming what Lucas pointed out is addressed,

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
