Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F9C471253
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 18:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784657797; cv=none; b=Rex07J49r3b/8XmqNcGN8KLtYAIOCqBJ/ovS+cUg5DESXmKAhqK1RE1zQdP02hZCUD0CIW8rSaw14BWLggkJXWyvIl1Ly7qmr1zIsQn89j/tz1oNIl6tGQ3bxaha31T80HRSRVVf2JDG2vCu2Z4m+4AYI26ePXNdXreXDs6nF4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784657797; c=relaxed/simple;
	bh=MmlXlxhp9jw6V64J1P8Fgez6/QyKKCBLRfu34RXe5Ek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZXEdzBkjM9HOG3DKsyXnfqlZkvswMnLMiyUgkRXoDU8NL0Br5tP3/igSmN6eTBeYKMQORzkAb8VVQyP7WWwGdZw/XPFfCPpvEjzxA/mvhkNIzWbjZQRgFxCvWJ8r6LU1cdeVVLYAHc0yUbU97lpMEtmMvsjgp/GctzYRn9LXQhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H1suFNFx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fk19x53h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H1suFNFx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fk19x53h"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2dVx2280235
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 18:16:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pxHJZKOUJ+mwEArxOGlqaPjUgMrI0m93hIaUp+NfhUE=; b=H1suFNFxOBwIeGth
	OA8vRhizIXFBG4CAe1KjeDlL7ay/+2XMOOc0F7TEF8C7Eqma16aRP5EBvZPitNxZ
	sNBI0PXkyhhpB94gUV+lE2bcEUeW4KzGPQqqUbuho5CiMErC7770aACl9taRh0I6
	X/JqfsjO7i3eUeghy84mlZ9nazJmN82A1rfMAtbxriyh5tYvYgMyBUNxE+VfaOjI
	j5IfcThdptWyZaxM5I92+8KGknTHRfOmp0L5mHc3K5W0ksIzFNa1kHCOn/KpBDrH
	WbV1xrc2wcb8xzURaa+SWghP23Msj57Twv3SPSd7k+FMMuLz699o1p5VyZls/Hex
	bHK3mQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6paabkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 18:16:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc5faecf01so229268055ad.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 11:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784657793; x=1785262593; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pxHJZKOUJ+mwEArxOGlqaPjUgMrI0m93hIaUp+NfhUE=;
        b=fk19x53hOa3r4MaWBiK3/lBFNJUPrpuXnQPefXGqQn+8hz83IIMZK/MRz7lf0uJQYY
         sU4C0LySNOeTgYpeV4ONkm+Z4dJpPFAqJO1mkWgp/H4+l39U6JJFo6uGPjdur5BBYbyu
         0yxg/myTSlsWJqIlJH1FesohF3l4523lujFtTQT0njzBxBACux+g1zvanZ2TzwPM6R3d
         3puH6t7YMbnkxdIPbk46ayoxIYKdQ6SCO9k0bB44OVRcvZTb5qmOCluM0HxbOyBSWyIe
         lLHd0Tp/b0eF+XT6cVVXylbHptOd7GBnnvh8R3KWc9+1zP68nVLVeZj4jP3+f19S4zvV
         MRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784657793; x=1785262593;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxHJZKOUJ+mwEArxOGlqaPjUgMrI0m93hIaUp+NfhUE=;
        b=nyiCWOxv/KG9gUknTn/AyTZHntorg2qV2OoMk9+sUIrEq7igZDd0ZbZcJj3lIYf7y3
         BhOznjuKG0WYH8Q9q3USMPAOSBG6RKhg5no9Rxw+/uYD2q929WEKjZT/R/DxVKjj6SmX
         XosT3L41TMMEJ6xSMGAjZ/eQNfovldgFyudxNSsWPiwNG+OnMI1mqwGSqVktdqCQRMVN
         xnZzDhleZbdnQnS8jsIWAMBPStvyy9dBna297qMy1bpJJvPPzv2ImBBvh7VWwM3YeGsj
         2aJ4JXz19ZOl9/wyf9cFvzL1XYCJOeErwkGAaQzrkoPXKzuvIM0OOWNRb2YZDoOQ8z1e
         Hr9A==
X-Forwarded-Encrypted: i=1; AHgh+Ro1gD2YgL+o2C3xEbM5/7J0Y3HYrxXc+uBq/4xi1Q5d0DB+DE86GQF+KMHVhmOcp0twOyR5joRl0h0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEi7IFT3ImqIazUTrhuyXk7ZhrSVq0Bli51zhwTSnfsPaUEnqR
	HiazzAhYiVw1XvtOiLUcdgJiLzfdIKBoCr6++86oGzCaZ+H+9eTsk0JbQOSqg9aU0pav1/DLkbJ
	EqM0eNq9F0581OZLxfpGT2TAXHizd86YBYKRrTXOJjEMMGn0g7KfDk3f70Y0/1Uk=
X-Gm-Gg: AR+sD10cQfuM0//IHSmPaZiv6KpNO746Fd56/B6TR4ijpbtZQB3xUTytHwFdwL63jG8
	z2Sa9nu6PJ4mu6BKGZQngCjxMfRU68Dw4MrsZ64A/2kAM7GoqF+jSdR7DhcMP2xwK+g2hGvAaTm
	k/XVJ4fiYbWKii0QaNxK4WeH63NbY2lEndRjE7nGVJVXyMmbPDqPmVNJZmNOGnG8iNryTp4nrQs
	nhwwcbEz1Hyer4kuZZKoIjykeAqAGv7xtEuDp+QYPgLBAhtUPeZrFF1hQO/3cPf//rA7b15YMoX
	yBKY1W1di0F0Wtr8jLwGngX+I0lEKXyInlkYbyvjMzgT6zfJ6NB+oYtaXAWqpHJbQCrL9QzFLxP
	K7vokBVw1on0PW54C2/PiOXYUS5GnWRfOW/I=
X-Received: by 2002:a05:6a21:a382:b0:3bf:96c6:78a9 with SMTP id adf61e73a8af0-3c3ad665b3fmr20298006637.2.1784657792876;
        Tue, 21 Jul 2026 11:16:32 -0700 (PDT)
X-Received: by 2002:a05:6a21:a382:b0:3bf:96c6:78a9 with SMTP id adf61e73a8af0-3c3ad665b3fmr20297943637.2.1784657792331;
        Tue, 21 Jul 2026 11:16:32 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.235.145])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e081985sm1059348eec.23.2026.07.21.11.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 11:16:31 -0700 (PDT)
Message-ID: <ebf99b7a-8da5-4974-ab7f-fe26e331b982@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 23:46:22 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 11/14] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-11-1be02deffda9@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-11-1be02deffda9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fzUH3H4JUEB0aj3PiW-_yn1CVBnIS_MB
X-Proofpoint-ORIG-GUID: fzUH3H4JUEB0aj3PiW-_yn1CVBnIS_MB
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a5fb782 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nYgDJefOb7ZtON2RxEtQrg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Kkr9414Gf28UH8S5ubQA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5MSBTYWx0ZWRfX98d7ZeLu3DpX
 oWjLcqmZvWkw5hXw3BGJYsAJzzResn4re87sLAadEKO62UyPGlcPDjWC21yJIbONscDoVRHZcDv
 2gTn/8kl1yWF1weRq1ub0eXKVCyZ4RtX6tRo5qSD3+iIA5mclkZI65HkVH1Cz7et9wn6va7lOWj
 tDHU2gne7EcBGsu7RVut6xglYYpyZ6IVcZQ2hJ/DgRMvhp4b+DCWx7rkkyk6eU5Wf7Uv8KGfUx/
 yx0M/hg0g8VnvVaj+SHcqisjaaDOh76JXLVfHyRBFzbLmAkmiobLqyiWG9STy2ab9UPbB97Uf/I
 U0wfdO9eENbLehaxtMQsIQ4qtL6jC/x3LGG8TaTZQJFrDwI76MCJmIiF/PQkCg7HCuVMiiEty3/
 oYeHHXAkkvUwE2BEnmXATVGEMsHowTHGu6WVvt1ATmFLM2PAuPfRhKEVJ0MvcPKJlkxjZHrUmsw
 9ZJYGqDiOGwpUpDvkGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5MSBTYWx0ZWRfXzuMMdzEclIX8
 1eqharMXHp7uHhZp71DbXDb8LPm41BQY1TN14OGkaqIseP/xronTwlDsQ8rBm8jspzQq7/j1wld
 E0/vfTBoiMs77OGcVgbPKgQi/Rh/FJw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210191



On 7/21/2026 7:03 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Switch to devm_kmalloc() and devm_dma_alloc_chan() in
> devm_qce_dma_request(). This allows us to drop two labels and shrink the
> function.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Acked-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>


