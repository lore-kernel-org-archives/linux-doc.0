Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423BE2E63C
	for <linux-doc@vger.kernel.org>; Thu,  9 Apr 2026 21:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775770220; cv=none; b=X5JpgDDo7Br/RiYXZtmfkNwCI5hGVbKH94sib3rMgourFqPKFGjbhaFJZKNtm2N8siF6YKVOeSHvDoHYkL7hICHwQBk5xKJT1PyDFQBTXfwukpe5Xcd84EWucRmKEnca8VIqowPxMWFkomnGfT+GeBFFYeT2QPZckTFV1sSlWT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775770220; c=relaxed/simple;
	bh=j9h19QOrv8PK1vNFujX5jiDuQ+LX5W8uUSmisFX6Pqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QlqGcDNeP5Xm56xb5ictBZrcD+nM5yq/RHUyNpKXxA211H5oVEpceCiG5mVJdo9SeSQo/+/5LJWIzkKECi/2dXerIfn3UF9dUl7sF9kHK7ix9YqeR1QiunKl/ZtNi/dkd5QDC4f01Shs41KtGTFeVKl+Zg18W5p6kt8rX5Ymlvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LQsTYY9Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CgTAWMXZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LQsTYY9Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CgTAWMXZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639DdWtD2812278
	for <linux-doc@vger.kernel.org>; Thu, 9 Apr 2026 21:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yJUSlPXdrskJ2du69cuI9T1hyf/JLg2i3zoHSaY314E=; b=LQsTYY9YG1LiN2f6
	AcYXaYl40pc02NldjZy1HjUy84wgOVHriWiW1lPzmSIFiimB0ngLTW3mJYj3VvYX
	jtTc72gyhi/ljCR9XtIIjH9/XDqVIqS+yfa7lSgAWKpbthWfeo+YgiDFa5ftI/pN
	jKJKrZjSaaysm5bt53/sfHoLCQe8i4N9hee8XdkKERSxzXQFbrTi3mT+3lCTS8y2
	ZQKI9FZXSZ9E0+g1y9NexJEk/Vr+7hhlZQWNOQdTMowEIp66bQFBz+3wJwHouwE7
	U/BmcwEVg89X70bpDzoA2df1RQ2Ji/iIjbsJAAuvaQdPTtZTHj2lDjMlb/TujzB7
	7W+YnA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded6h9js6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 09 Apr 2026 21:30:18 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2d443c3b094so1889211eec.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Apr 2026 14:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775770218; x=1776375018; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yJUSlPXdrskJ2du69cuI9T1hyf/JLg2i3zoHSaY314E=;
        b=CgTAWMXZowgTYncLWqq63DQfeq5Q1gfD1R4euSTvIa6Qa/0AvDpA2rUw+bukX18CTb
         2AvGFXJQqY2t8JtZvTuQJ++W7IPwTDvnA/XxDcQm0QlxMv1YunTo+8EpY1WXnYtiujPM
         VWi6b5Pz4vDIhOVzpbYPlP0TBFwCSAL6BVHhnW4JvKEGP+/GJ6fMo0e9dVjG4y9L22y0
         qW53KPPqUTfjOdT8Mz9oZ8pXJV4YJ9kyumIpk0wc3cmoUjkIU3atmuBySm5e2DpLE2w4
         kFv9tMmP7irgPMYDZdmTl/YiBl85tn9nduCl6X6QdKlmn6Z0UmPiKAAnMyru1/dUXcuT
         nfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775770218; x=1776375018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yJUSlPXdrskJ2du69cuI9T1hyf/JLg2i3zoHSaY314E=;
        b=k40HGCf1/5Yuu5gMmojuWJotmPl5wQCRoq7tgHOw7A/MhXHZjTfI+4URofNleJSO2k
         tPw32dTFPmJaQOS+inzd/bm5ZrFAXH2zJ+sg4OtAtggznhII02M+eUbI6J6Hee4WNT2A
         CSZUB9htUxmSHLZxnHGlhtA3rrD6r3hi+lNUx5mBw+u2iRMUYswGwF74I2VF3hVX2XUe
         crwXA+R2imidmvR0a8zh+cvmqTPjDGtetv3Jp6G5r7ZuzSTFkPijmc2m0URQdfY2OAzJ
         1TkzryPdiUNTSc/j2zMJLSPx9Hb/9ArPtLWQ7m1GpijTcZt6K8PGdHKRD7wfvSL0ReHL
         /O0Q==
X-Gm-Message-State: AOJu0YxpXOuokeQIHlyqkJE8WJcFYmQKPXRYO803vMw81zmp+98k4lzQ
	wHvUAci84tf6SUVyrlKCHTNpmnZDXZ3a0ZpGrn0SYBS7voPq4JoN3qBiXzuFWMG9BHFGKyEKWzG
	UXOntJUgBwqlyvplm5/b8aWzg7PdXSTI5LhMJWA35+fQ4uFDBpG6YoxnmKx7qO1s=
X-Gm-Gg: AeBDietYzlijaWOZLuhsjSWFTU+Uh6Rq+4NJ8dzfnbZAAR9FphY/CPMHYoS4YlK1EmN
	tncWA9C5p1+bh7PG8p04R1N+NC47Q2/ACnM8elNR1UEaKsOdZYfEia74os0IPBkm80FuHP57mkb
	sQF3J2y5n4u5rq/u1PBnjnkXRq3Krgth2jn0lRZP1JX57qLqm/f2C+WukOnYjgohYWtt9bbxEar
	tbAcMWFdwjFkxDK5G69Ot3zbMXjN2yUunpfUcal7663ExKmuyHpZ3a5mffDw8VJllw9LkH8CtMY
	1AYHiJr17hqaUW2gyueVyPt3QzOYct063+cQ6nMxSndwc/EXbEDy9LKBZFdldTjsVB7+9kniTMh
	uAoev80dS6ehFsWWuBIBNwCJIiqdMC1SCoLKwtbq6czRzNgzZAJcL8UYplszoydoly1DcD5Fvo4
	o=
X-Received: by 2002:a05:7300:2156:b0:2d1:d434:d022 with SMTP id 5a478bee46e88-2d5832e2f63mr508046eec.0.1775770217729;
        Thu, 09 Apr 2026 14:30:17 -0700 (PDT)
X-Received: by 2002:a05:7300:2156:b0:2d1:d434:d022 with SMTP id 5a478bee46e88-2d5832e2f63mr507940eec.0.1775770215088;
        Thu, 09 Apr 2026 14:30:15 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562db64c4sm1357061eec.27.2026.04.09.14.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 14:30:14 -0700 (PDT)
Message-ID: <4bc1363d-5785-4214-8057-4f2a75e0f8a8@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 15:30:13 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 9/9] Documentation: ABI: Add sysfs ABI documentation
 for DDR training data
To: Kishore Batta <kishore.batta@oss.qualcomm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-9-47ad79308762@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-9-47ad79308762@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RfCgzVtv c=1 sm=1 tr=0 ts=69d81a6a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=DdBerv_ObsJuwx9ejj8A:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: XyYoEngO_iv8o2id9ebsaJtD8LRgm34G
X-Proofpoint-ORIG-GUID: XyYoEngO_iv8o2id9ebsaJtD8LRgm34G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5OCBTYWx0ZWRfX/9qF/h8w7vfS
 8HiwuVBpaTM2tVQKxCmGiyf9h579Kv+ZDO88UBkObiwuobHwttVMdnuRO0JRT5kDQqvAbopELO7
 AJAMOtEr3tuq9mXV0zi85Z2+gB38TP7+HfqhIW7L3TG+YwOA7zyB34QftDNKiOFu48SbK1rzOHs
 ZWc3+F05G5YHGXIYXn9y7YcPQfyuMxUijwwcRYAYaqWXEBywx5vO9s/OVU3v+oR2svhyufdIUVn
 ew6RwEjgJ0pmaebqZ7wnJvxCvSAdak8EPa4ZEiJ9k8dna1n2JS2ZD9jOpMgDrQDXiEXJZ6HXC/8
 VIk7g3u/w48EPpVrZ3TtzzkTH2xrHzgJL5qnJsiZ0lD0N30LjqTVu0axwwQri1+6ZDrltLaa/x9
 KwV251s4zHG3FDfuoEAE4leZucnVlK+mSFmgu5dMNUbbcuLog10YTrE38lzyJI5gKeErSRCncd3
 ykAjirVC0z4OKzXlibg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090198

On 3/19/2026 12:31 AM, Kishore Batta wrote:
> Add ABI documentation for the DDR training data sysfs attribute exposed by
> the sahara MHI driver.

Sahara

Also, this patch should be squashed with the previous patch since that 
is the one that adds this sysfs entry.
