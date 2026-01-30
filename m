Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8081A278E47
	for <linux-doc@vger.kernel.org>; Fri, 30 Jan 2026 00:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769732546; cv=none; b=hVaBbWex4Fi0tBABmvLfilY8f/vmJDL9UFELikqpJwA0bzRmxDnGMi9ZD1ZDcaURDDdbHH4yqhlU715TZcYcFnH+vGEiKPTRMUws09C0SNqaCEjZPDpiU903bJi4O7hsKmr3UdjF7fo6iqUikua2LYE3KtBPsUIAdSl1DyB9CkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769732546; c=relaxed/simple;
	bh=ONh8Ox0sflnYK+apVyW/Ix8nn3epMvhEIggWmET/cSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=izSue3tnH7LgupB3FRtX2jMc/w2pKNQSsnrruxLVXn/7TiHKynEu1jGSVc1RQl0cnHAwvdLfizUJNxAaCORZK7LeIMAA6PNEPd7qbLLmavAPNvC4+Ruq8gLLR6d8mr32KGaj3qgYNyB8LL61j/6FHZZm1Mz9pBwXMVfN3C9LQ/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MVoPJG8z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b8wvSFoE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MVoPJG8z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b8wvSFoE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60THoO693642956
	for <linux-doc@vger.kernel.org>; Fri, 30 Jan 2026 00:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jjCZQXKJgjZ9Ks+eaKcXCSOamlGnnAHP4v+PpAcUslk=; b=MVoPJG8zmi7s8jFh
	fHUh4YhLEm3/oo6/Mdbf1y1VxBYUV8tfiAKf+97EVM9gqWOueJ/RltXO80A7aHah
	yPVqegw9SuIu8SzVyfiKhHqIR2NeMKAys+MUpWKfWMvD1SX9lHFpSms4tuKqt5OG
	uPuMhDC5PGjw1onmS7l53hNjT2JSm38Bh0olqwAWDXwQizHq3jSKXk1CQGLYerZV
	662F85lZwPsbfGuICalb+EtZPYeDd0OKY4xDdjMN4/GT5EU5IgAMplEmS9WRqPPP
	S2UMvij4qHVzN86wBX4+9/7AtMB+pNHemV2XEJeezF0QZh7mK25NcX0Ip3WbQ/oo
	ZN/kJQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c05sr2hns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 30 Jan 2026 00:22:24 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b738854780so2208061eec.0
        for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 16:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769732543; x=1770337343; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jjCZQXKJgjZ9Ks+eaKcXCSOamlGnnAHP4v+PpAcUslk=;
        b=b8wvSFoEQZh/E00JIcLbJi1ktsa53XtOVod0XZKUm5gOaM97IMrd3cCebGGZKHnV4U
         Ed8FBYBxP3uAxckcwsgyMPECckyAiNV+m1cw/wGO+KSHWhgDz5dciWEZgWtDTn+XyltS
         bJePVtT1DnkqDTqQdn0QQ/ff7Y3ikrjaXWQ6KVU13DYl2upiShEpH4qHYmQtQGw0OIvr
         RreyrwErXpSD0MDmyhtQKsSpT8tzAI7EsImPUimO+896NdueR3s4YSeb1oMt4JWew550
         3khZCdaAEX4W42klK+Vml13IcAZFofTUfdpNYk0uBSRTfpROLfsw6fA2HWeoSVdui6cS
         g6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769732543; x=1770337343;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jjCZQXKJgjZ9Ks+eaKcXCSOamlGnnAHP4v+PpAcUslk=;
        b=LlI+SnJGuCfvrUbyIwTB+jSU0S7bMKFv9LiC1leTl7T/sPdjYNSrvbM74HJ08kTy1x
         E5QI7lybkcY0Paosa4ePyiuLonJywFaRCaLx+XU7BxMrMcrTl3S/IjsWmxG120/c7YI6
         DK9hvl8GDUiEbvDKgAKKgt2OozF+oVOcrS8yQ4u3kRcL7JvzoX9YmIsfDxolx8+MFHlP
         KZr7NL2Hy8jRtqwargU41h2fyb4sov/vviDH8LwM5/WdMb2FluG9NgOXUJHpDHiGiMGq
         528ceGqxLDTaGG+Jt1PgoaJk97s6w1aluLqw+xoUantndSWRZVXVPAtSLWxVgjaPCNHR
         EBNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUtoxSil0U/w3qw7GQbTyJ3LxGnUZteeqLEnKc5JR5KdDNuHvtFOuiBuftDqAZr4Gw4TY9fP5KLVs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWOACqbC+ow/WuRH33AmclsN4ibqubMlL89CvoAYsQfwHSMZ1y
	IOKqmXs6Ao0OKQtEy1hnnXGn8StaXPFVsfYAt/yV38cM6hNY8NkuRkl+FGiCBSvgsyfjiKJAGnF
	7gAplSLmfOOPRBHhAFsPHR+10iHh+0pOFwbMdM56AoSO7E69t6hLxSssIdb1I3pY=
X-Gm-Gg: AZuq6aKVd8ja8xK2H8BllgqT4vPE9M9XRFyPBz1FFBgE9k8Ziz0O4BnCJdXdNbrxYOn
	pt3CYq8f6n4zd/1zoJxnfeVjy+AESXIEBpE+lgP5v+oj8Q6tyABVJeC2kwqSF/zUQSOa+wrXjj1
	63kOwmjKw2podjlbd7TwfEBKyokcFJYsi5DMF3qKzxLb8nI5nInax+gILjv42ItlVHSUkr+UESO
	DJCfqeU0c0c1/qaWnmnqAZpVjw33Hw58sUzYVsaBZdupSSG12rOE+sph17OvljcknJiz9LTkihU
	eBhIRzsW+cRy8Xfcr2w9rFQiffQRZ60fzSC0eHS3erxUu08imLSqcKl9ptyA9nYY5FRKsaAWBI2
	ISYSzuxZmvR4vbrrjaXuBRY0Kl4ajYXImddo5FU4Vq1y/5ZGHp5KUlJMD9KIQm58=
X-Received: by 2002:a05:7300:8ca2:b0:2b7:befe:3743 with SMTP id 5a478bee46e88-2b7c866cf6fmr563457eec.18.1769732542857;
        Thu, 29 Jan 2026 16:22:22 -0800 (PST)
X-Received: by 2002:a05:7300:8ca2:b0:2b7:befe:3743 with SMTP id 5a478bee46e88-2b7c866cf6fmr563439eec.18.1769732542165;
        Thu, 29 Jan 2026 16:22:22 -0800 (PST)
Received: from hu-clew-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16ef40asm8798357eec.13.2026.01.29.16.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 16:22:21 -0800 (PST)
Date: Thu, 29 Jan 2026 16:22:20 -0800
From: Chris Lew <christopher.lew@oss.qualcomm.com>
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, corbet@lwn.net,
        rusty@rustcorp.com.au, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/5] rpmsg: char: Fix typo in comment
Message-ID: <aXv5vErz5I2AFmb1@hu-clew-lv.qualcomm.com>
References: <20251217065112.18392-1-zhongqiu.han@oss.qualcomm.com>
 <20251217065112.18392-4-zhongqiu.han@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251217065112.18392-4-zhongqiu.han@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAwMCBTYWx0ZWRfX3BfdFdRDTbu3
 eoigswzTc3Gu4cViPdOIrAtAvgFymDqghGDrjdqDIUYHrpuIiN3gtesoUirlTpTxgCKnxnLJbH5
 ugNgUeivf9GmJSSF8V7zsUctLQixAg4Wd/qIiEGiKK9hizolrs49E86+O1rmlErvEZvncfe60/U
 iE2QK9LjXf1Cb5g/JmxLCROnQn3rE9Vxr1UHLoocGR334bOVm6OY2dg/2jn/wemFEUsF2pGVaSL
 ueBMxC+dMaWn/eQWOA5UrHs3RslAvm3A3W2z5KAgeReGco88tC0HGAz0DSBhUWt2qc99RfaDLQ2
 nA5lAoEiDc98HEpq3fGelGXf5CjBm3j942SsB4qhn2ccnebQmSv2/7TMoqF39lfmMgopjVD2ZPw
 gKWDPuEd1t684ZjCzQ3xisigz8soFMfy7rBq8bZ9gPRdvZn+p5oBv9HbbDKw8L2S0Lyj6m20FRE
 X86W/f4/0K9oxkWk02g==
X-Proofpoint-ORIG-GUID: a0gx6YuYs1uFG55y4a-b3TTEwGZfzNbV
X-Authority-Analysis: v=2.4 cv=UsJu9uwB c=1 sm=1 tr=0 ts=697bf9c0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=sgd4GuN26VHFCRKVnZMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: a0gx6YuYs1uFG55y4a-b3TTEwGZfzNbV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300000

On Wed, Dec 17, 2025 at 02:51:10PM +0800, Zhongqiu Han wrote:
> Correct a spelling mistake in a comment: "Storedit" → "Stored it".
> 
> Signed-off-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Chris Lew <christopher.lew@oss.qualcomm.com>

