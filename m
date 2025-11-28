Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46271327C0E
	for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 12:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764331743; cv=none; b=MTJYQpnd37Fnh440AU4pHA/XHJV7pYGXMVA5QVGY4Ya08N5Ng4paeY0eUe5STwmaKPEL8iLuPO63/oZjo+OYxNmhZxvZsEWDepyUaAeisf+33dIEBMdkEw4goL/aC0mk2GA6F1BgZ2p2GSYrUksAT0T8hvXTMqCRQv42kOQI/9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764331743; c=relaxed/simple;
	bh=ueLyq46JDjBihegO9qj7nvGBPhhfHALgUnFEM90Acb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sQrcyFThRnd535w2zvZQ6hv4z5ibD2XgcnqIDGgm2VThypf9kkFY8+vF6I0ixrvLKMHQh08+jdsBkA82mnoS+ur0/Hs3kUIXKMav4gcaeBpKUTXT8roc6gNV02Dd6lPMOKsUbbP6FWHHtfCwL4yVpFuZZKIA7X82lEdkofEJhJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wl6wxasr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RLyRGSjE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wl6wxasr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RLyRGSjE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8rmid3989819
	for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 12:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/AMvgGr+A3VUPf83LfDwUwYIePu0GXYwS7q7hJotv5M=; b=Wl6wxasr5uWhH+yp
	XGPWcbtqtx3qebtX19hT3w1qs3t9v0S3K3pr1tjIk7DLXghxMbb9Eg1vsYLa6esK
	mmY+61Y+msMzPumjPb6Jy96QxhIRl63IaVlVgh8WKtB+XiQVVz7Me6qM8cORra/J
	aNWsWRn59rYFGsiPiF7oDUrRkpBSkJuUtIhfkXbBGqsW33EahkMOsumFfgqa7sjh
	YVZXzdOoNbiz6yM+JnTqYZHifIe30h7Uq816FA6vuca9wxj+gibSle85lB6R2MxU
	W0Toc8vZiTvE83l1WPTAV43193Zdf2fDHx3uit/kfDy52d99UtcBgX+EABLPElvO
	oOoM+g==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aq8mm8h9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 12:08:56 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5dfadf913a8so166543137.3
        for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 04:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764331736; x=1764936536; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/AMvgGr+A3VUPf83LfDwUwYIePu0GXYwS7q7hJotv5M=;
        b=RLyRGSjEn9LnHZondWLGZmFvMqoTL9Lq+pc8K7OGAcIrpgrVNIRgJRUyyWPrt6KVvq
         xCoyebtmopiNZWl/z0spIBKZApJSYOD1h6fHmZdBv76A6q7mS5vKl4KUeyLSf50AQJ0z
         acEAVfKU3FHxH1S7+9HtVcp99EoBpUa8D/uY7yVQZSuSRx0dr3qDEkVSutapWQznMH2G
         x7708Pe/5cq2w4J4YYAzsYEAWbFFEhq9R71KS4jpAjwUqjD0H8vq9uYLdpaoaoHZSqga
         AhrGi9F8Ms1kF+eSIpnGh5V/4X1R8RWa3Z+JS/Zg2TNnzc0vQfRYgRQ8op5QkN/JfH8w
         o9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764331736; x=1764936536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/AMvgGr+A3VUPf83LfDwUwYIePu0GXYwS7q7hJotv5M=;
        b=DBviWLdyvB67oXT9prGa+ndSe4JkVFS6Ss/8EMUUeNDLBHM/ePjhFSgkFFiCuA+9Li
         cDJORk1i6V6aW3fu+PYKTkgFS4SCDpGkd1neLt99JtEabc3u17I0/TWRRbmpjD1TaLmr
         gp838F+jbrH8YTnvQW9lpPNpYJccfp768kG9Hilt5xs68IG1dHwbKFs8ILTnYBTYxrlE
         bhnKq0MSBVge7V2/bfB4IFQWl2cliBU+PwcZWU2bvOEahwkWqIXH74X9NWmvW3E48n/T
         FOgoCu2UmW//WWLkSpYe/lJVgxa2/4r2MG7OgmUHi7F/O2fF0StEVuLHW2+CIS/bb8R2
         erag==
X-Forwarded-Encrypted: i=1; AJvYcCVlNz/cNcvgIXFSKMmFEnt7cppy/1Bpqg1faEt6axldSF1SX57MEeZEHtaudIs+sNge4wedQuGwhc8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq8X72WBX/e5nWGdfxixObpTPoKyQdIzLP4u2yav5sWdjbaGwk
	mOienJx5mEFZlbbbh91xjsuUhp2aab15dJnYfCjQmkxM7bh1uOC5aI/YCYvaWaEOG/5hXvX2O69
	NO8aX+cNIu06mtZviKi8g9q+i6QGav0cFb0hy0Z5MRcm7jrM2vyu/VGesBojtNF4=
X-Gm-Gg: ASbGncuXfP5ezef7Oshg2mny1ROyJT4eMb/j0zuxlXB9S2OLshEiXCsyQcizIXhBADc
	ptTNk0KhJJiygLYZ+Dgp8o3WkHGVGgJxVpJadG7/F9mJ4SzjRLtTqJu7MkfK/IB5riwvvPpw4Jn
	IPRKqHYvJqi/6IX29PlF9Cm7CVzW/JGx5UKIFK0mVIOSBVhpkbf0elSYmgF1woba8O7ym/Nwotp
	ynloGRHKmMiHZSP3db6q1z3HByweI4NEjshOxsVZ9XPki40w4uWGgGuA3Ql9TN3e5z4olor5XcU
	NsY3Rc1N4Z7lNElFkrAx+gGOYWpt5tkhtLn0maWyVY58ueEOWdkC1kcQHS8p+LDAt1CEn82ee0k
	ZqYRehtLrRZryh/LgtmGng0IDluBaASJrwc+8NK1/8heRWYGOWBDQPZJrbmf0JtOAYfA=
X-Received: by 2002:a05:6102:4420:b0:5df:c33d:6e58 with SMTP id ada2fe7eead31-5e1e617ee0cmr5243512137.0.1764331735639;
        Fri, 28 Nov 2025 04:08:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGcDNhnYB3uQVovzvtUAgWZaPKJAKjhvoad+skVmq1ako0hV88tZALhYbd+C4wBmEePnEEdrQ==
X-Received: by 2002:a05:6102:4420:b0:5df:c33d:6e58 with SMTP id ada2fe7eead31-5e1e617ee0cmr5243461137.0.1764331735249;
        Fri, 28 Nov 2025 04:08:55 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5162088sm432375166b.1.2025.11.28.04.08.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 04:08:53 -0800 (PST)
Message-ID: <afde1841-f809-4eb2-a024-6965539fcb94@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 13:08:50 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 11/11] crypto: qce - Switch to using BAM DMA for crypto
 I/O
To: Bartosz Golaszewski <brgl@bgdev.pl>, Vinod Koul <vkoul@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251128-qcom-qce-cmd-descr-v9-0-9a5f72b89722@linaro.org>
 <20251128-qcom-qce-cmd-descr-v9-11-9a5f72b89722@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251128-qcom-qce-cmd-descr-v9-11-9a5f72b89722@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vR4X0sjIcx1KgiYGsGbsUHPpK8Y2wh10
X-Proofpoint-GUID: vR4X0sjIcx1KgiYGsGbsUHPpK8Y2wh10
X-Authority-Analysis: v=2.4 cv=Cvqys34D c=1 sm=1 tr=0 ts=692990d8 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=wXQIig4NBtMv4ZYXLh4A:9
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA4OCBTYWx0ZWRfXyMKWshI6oA5A
 yBdURL2/jvdtKmEJDIwRUXgDRJL2ro4C7CrT3Rs6BehUy+NqWDPAA9pkp7wR7XyfRIQnrwZaPDT
 B1ADIVVHQ5uBDnrjebANDdgSWui5imgPVQKlTtvtiOdc/7t8d4CTIIT1w36LTJ/inA08yYOTiNI
 YLQKdyq2sfZE2SM8WFNM0U+iKMhmHteknb0kbwKFrHll+v4US02sd+nDL/mOA3VcTGhAlcm1VQW
 Uy6LkcFjcWp6XJJEJ+R1iyHs9wtVSVRsE/SDLugnwGnVgfnuMQTq5t9IcclVIV8urstFKUpi2MP
 HjArrCkcgYeeRlQvBJPLHcIXJ9WYcSaP1WVqCt3LZSxSYJdakL+A3TGgpgd1xFCdxLKamHqlaUJ
 jiuKx2r6w9pvw11rKkW4pC0wQIOEzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280088

On 11/28/25 12:44 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> With everything else in place, we can now switch to actually using the
> BAM DMA for register I/O with DMA engine locking.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

[...]

> @@ -25,7 +26,7 @@ static inline u32 qce_read(struct qce_device *qce, u32 offset)
>  
>  static inline void qce_write(struct qce_device *qce, u32 offset, u32 val)
>  {
> -	writel(val, qce->base + offset);
> +	qce_write_dma(qce, offset, val);
>  }

qce_write() seems no longer useful now

Konrad
