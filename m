Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970F01B6D08
	for <linux-doc@vger.kernel.org>; Tue, 26 Aug 2025 21:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756244981; cv=none; b=QAQWKTsPXZ0z2YqRZ5ll6lL4Yoi3M+LVj+6pynxF6oFCl33iL5x12XZOakhqV+qOUdQ3ja8EXCAq8oN/oc4VZWixTMBjne/7xRg7ytDDim/X4p0u6sgK5XkPykPYwcSCj7huqhu+cBMjUIeK3k19gh/3T3xEAXsi2Z66YEy8eMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756244981; c=relaxed/simple;
	bh=m0WVLtEMOLSm9zDk1d3O6jTHTPnftcVbrMs10BE0Kzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K0l2SsvwUY0H5bf/2L5+qqrAaJyOAbDn/kQCW7ff3P1iWgPGtSj3vHqNK8S9ZkEoxPt31c1vuZ7+KwBYbntbIjCNTQJ59ROMoRxYjYaD1FBLoKQn7s4864JOsrqa3Cf1YuipgRhSghnuZmSfnbd10AzKIqucGCWrlXPF8ZBvcjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GW7uBFTf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GW7uBFTf"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QDfB8V031557
	for <linux-doc@vger.kernel.org>; Tue, 26 Aug 2025 21:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ovwcz/UMx+Ei1EUDipzRJAkdj5/vHnIo3oFAfjDRoTY=; b=GW7uBFTfEjLK1VD+
	jvcelJdkc9D6ELm3oQep1HEk63GXjAQGze8wezUoodAtkr4xi+hm1vjmixN0eaoo
	ZMdPJozGh+tGniRlZKtVl1AlZMYsRqESV39zfdp1M7UVc6BAF/suWs0gP1ub7YkE
	np1pOHkTc03QgmcyS7QXDEDKdem4JpdwM2KBuaXvGuMZ2qw5gZWnIjcAIGJKrLNt
	HcWp8bTgc+WvN+ghBCrIIMgeZuUh+pgZkyxL/b9Ta1rHtyYYrb4IqkyvIG3grCN2
	HnEpw+GWEEP+WBzz3K4tDfZmphSbo8b4397190wUll7OR044RLWLhULiGcQ1ItOT
	koFGAA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48se16sg5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 26 Aug 2025 21:49:39 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b49ddcdd5e9so4159554a12.3
        for <linux-doc@vger.kernel.org>; Tue, 26 Aug 2025 14:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756244979; x=1756849779;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ovwcz/UMx+Ei1EUDipzRJAkdj5/vHnIo3oFAfjDRoTY=;
        b=R2Ex91t8XxsCMyjzZIWYreSoH85VPdnCYCrWVq8WKgz784p46TlA4t6M60nZvKsciS
         aSBqreLXYaKaaBiwWP6bJfyg9OaOfqc8oKrL6r8vx1ewstOQYfvnt/tC4WC+zxXhg1Zu
         n0KxSG+6nM7Dc/MQk6+7XvWO3haiaIBfg1IKu04t8xT1nUP+/d1wGhosVnWPiFdklIxz
         MkW4hyue+2+airineSsJ0ySZ3JjLrQFaaKzxrelWmCrLqeQTH5yelwQYUJYAmWD0nzCb
         Kfot/UoxHicASemPkMd3nJxt3JjSGka3Ju3vjTxZlv6j7gmOHztGSbEXOgJpB2YM0z7H
         SRBg==
X-Forwarded-Encrypted: i=1; AJvYcCWMIsKcAa3xFipNRxf5bFGh3kL6AIM0pMK2tDiuJc3J8/bfvU/zlRL+8ue7z7tnipDzOW/MCPVFRVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvHYC268VazcerDAyJpTzldGhyAEIm7D4DfMrQoStoEbQ3CnkI
	bT0FRxT91aCmnbOT8B1RjBD3hhLAAHk09ibRC5nsXAIrvCZnTB20r/uFlIhncKrXKOyGsr6pWl3
	XlFW0ID0iA8m+xoKUoNg3wWyg1TG3qrMv3ed1ra5IWZAcoefzJ3Whs4sqlM07yl8=
X-Gm-Gg: ASbGnctxygjuYbUTwdNlomwpyRDlB5cikOMF+5ZOmKOYb5CsyZ4dBijq02YbSQFTpoC
	DBM19wApu+8YUCR8GV1kWBS3nqFSfTFCqEpO7tr+uiEgeXn1/93OXrGWs+MAbKHMDY8Ll349het
	QGanncXQOlVTZvFYqjAf1A367Evkz/f6UrCnDkgcL+gykH3whDYNNzDjgiNUD1B34sA5A7B30tC
	0Z70Rrg6yJTSg4C3AviDAg/sMGp4YtkXzLid/1REPBnjlDEa97Xdzux+Unfyca91G+k8wL+Ur7A
	6uM1YlF8O/zbq2pJ1+RN3NmFtPnBZxrgVZQxYrwefhjfziL0GkwDKigK7TfaV5FQJFzGH3zEruL
	86a3luTcKQ2PyOhjDERieVWM5V0RvrMU0
X-Received: by 2002:a05:6a20:3947:b0:23d:5691:df51 with SMTP id adf61e73a8af0-24340b01b9emr23163085637.1.1756244979113;
        Tue, 26 Aug 2025 14:49:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvW96AUyv4NFuLjcj/uDmOR3GBBgYMnkq5H/IYhcNWvdPPtmf37a1KlGOYrRmV7mrjTboe3Q==
X-Received: by 2002:a05:6a20:3947:b0:23d:5691:df51 with SMTP id adf61e73a8af0-24340b01b9emr23163064637.1.1756244978686;
        Tue, 26 Aug 2025 14:49:38 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4c1b2f5a3csm5860905a12.4.2025.08.26.14.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 14:49:38 -0700 (PDT)
Message-ID: <e43ffda6-4d25-4874-99b0-6a65fea4a261@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 14:49:36 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
To: Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@outflux.net>, Sami Tolvanen <samitolvanen@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland
 <mark.rutland@arm.com>,
        Puranjay Mohan <puranjay@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Nathan Chancellor <nathan@kernel.org>, x86@kernel.org,
        linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
References: <20250825141316.work.967-kees@kernel.org>
 <20250825142603.1907143-5-kees@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250825142603.1907143-5-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Vwrj7E-9saQHIoUOxyrZZMX97N-rpUCX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDEyMCBTYWx0ZWRfX98NX9ofhr6oH
 s43FoXOxgxUdeL3So2yksKCkPnPWLfaVQsZvwPzihSzo4opNgyLyUAIndFF1xpokES7UoTDAcAK
 j19BgU+D/4vU8NFhY5lOikPTWVO1H0tfswtUaNV8DuCE5qtH4vDM26SMorjVpgtLLHTJCJn7Rht
 7FZcPyC0fOT/4h9ybARYHNriWO4PQCgGyT2nUS2l3NDbmnWC5I2CfpaD4IsOIjI/Jjz3C9NWTTT
 jnoQGMkDL7x8P10EZz5AMdoJiOXG84gOw/Ziei2Z0iesYcm3KNJUGOXbTkHxdDco+vChue++HD5
 ioR4WWJblogRsT0WyAtytZz84i6V1JbI+ysUfTrqjU8GNMYi74yW/EblK5NUb2sh6kMOsvIcc1z
 jejvVkQD
X-Proofpoint-ORIG-GUID: Vwrj7E-9saQHIoUOxyrZZMX97N-rpUCX
X-Authority-Analysis: v=2.4 cv=CNYqXQrD c=1 sm=1 tr=0 ts=68ae2bf4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=ZGSs6mt8D-bwwmi9yLIA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508260120

On 8/25/2025 7:25 AM, Kees Cook wrote:
...
> -config ARCH_SUPPORTS_CFI_CLANG
> +config ARCH_SUPPORTS_CFI
>  	bool
>  	help
>  	  An architecture should select this option if it can support Clang's

nit: Do you want to replace the mention of Clang in the help text?


