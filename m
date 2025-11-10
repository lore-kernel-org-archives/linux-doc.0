Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDDB33859A
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 18:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762800905; cv=none; b=OoydAUA9224MCzmhKYMtzXnCD3AVZlT7icOiyD9sJRPMMiOAjnIoDaJxvDamF0rqzuZCla+dBoDCX3TJ8LFRbGirTgRmceFxNLROBkIYYL7fgR1nwdoeBjs3McFLuLFtnbrhlEU5jxN66XPR/kBolQGwp8vqsDWmcbYSd0IRSsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762800905; c=relaxed/simple;
	bh=fhQYXLG6Hlm+sBQoct4GncbxI25NofSYErr+AmzeIA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VdKrRDhZSHoWMJWyqsdDdJButrUk+jDEOjjOVF7KUJKZl9Jfnos8A9WQHNIZqesYQhbC1eyKEKPTwMBRPfPJ3p0vUkIFdKrzyOGp3S9Os9uOJRxlPxx0YbYpcWSZNuNfAGdompr+gSFwF1wvWCKCuS72ZSOZc5/78QniB0jbbkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DoxmVHy8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i0m+MXPB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DoxmVHy8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i0m+MXPB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AACMu2C3306787
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 18:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i31Jkdbc6ZwQdMs/k5lp51vN+i0JVQZ2SD2eDZUB7bI=; b=DoxmVHy8sHUsyfXl
	x16aTRAi8QkOU/MwP65F9EIWy/DHQ9ggCxUp444rIxeY5jMHj5o/DloMJVLLEAmf
	kUhqg5zzq4jLbnorwH1/9JcYc1D6TRcRUyoK3g+/ISBDP+t99jDgt1zRLO5riNb2
	DOtgWgr5vIUKtgrRR5Q4gIMr2buMb6AzA2K34rtU+9s3VmAew6sx9jfejHy7SuTf
	N5DZKoF0eZSYdsVoSA0wdDB/P9g3HQZhUf6BFpo0HrreZcp903611NPStd1QwfHu
	xJ5/cAVkVHyxiKysqSrLl7fe1UlbUtZMrhEgph1jhr54M/F/EFqhvG64uy3tzk3f
	eiGB4g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abg0q96hp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 18:55:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2954d676f9dso29437315ad.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 10:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762800902; x=1763405702; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i31Jkdbc6ZwQdMs/k5lp51vN+i0JVQZ2SD2eDZUB7bI=;
        b=i0m+MXPBE5pSSoBswKab4ogQ6Yab3KXS+whWVEcYdYBBs68yKxkuDwe8FLUOMagCWt
         lK64SwkwdLhjth+vuhcg4wyYhU7utr0Wk9tShp/Y+6HG+SdHxrbqA9ZrllbroMfVt+q2
         Ng6G6/6S2NXbHf1P++Zm5oWYJ7+e58LDx3DDG1t216O6jERv4nTxDmwSMiOsqRbQdK7+
         9cywy/22NQD23X4R/X/8nO7MwurrGtWMEaul1V6Aw5VhnIamxhZ49XLexUCkFKNw0IwK
         ba4V86Jknwi81wWHSZ2H6tpso+okMlurvuNxhwPq+xdBh+5tqvOd5BqU0Hn7Q2mbjD6z
         kw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762800902; x=1763405702;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i31Jkdbc6ZwQdMs/k5lp51vN+i0JVQZ2SD2eDZUB7bI=;
        b=KbzlokS32i4zzSDti0MQH2uKiAsBCFg5lbFDoNvoo+H4/oP7Uxbz5Hv68Nm2eafjnb
         oR6LlBRJXvKD0ehGX956TmCwKhuaMflRu04oY5ux+3WikLMQ1V0B8pYoN3qG0rQrbAbS
         6CtCrU5FyMPKaXIDQTYl1kybvus2gl8nlEKM854imP3rdJb1VAvxelj2f9m8G8pUt0s3
         nkZRl33FLmxJyfvITavoJXRncWRH2RI9+RJNTOvBkK2zkephLcm67tfq04zhKfxmpVRe
         NaUjmDqnI0F+fwq++wy8w7pBoR3ncOIhCYHb5yt8IIoDknebvNw4i830igL7CUqT35OD
         BB0w==
X-Forwarded-Encrypted: i=1; AJvYcCXdbDFcTt/OmVq6/QuYpMKrABKDfNBWCiInaV/A2tuuJAr7azy4BcqQH1HVJ/BBdZqTlN+tUMu+jok=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5csMrqTAy43IkT354/vwolBwkzqhRMI8qVxg4qc4MtYHrL8HW
	O50MepSAja2d4CoOpK3jZk+w+mpoPKymT6967bVATlKhRC4gUDAJPvAJry3iBX5Q69m0uifGHCt
	nMto7cmcZV4F2F4DZZPO/okEHRdKgjaE0JQE0HE7n0Dkkzd6IppU+CKOiBPprQw0=
X-Gm-Gg: ASbGncvGObbMxg1HoV1iy5kR5cXSvsKT09HfaT57MqHB5rvGHotoEU0ZN2cisXRVR5E
	pptQmoHoyz1zUA6nAeyqp5Oceh7dzNX/6LvYEQ1AdGroVho7AAuftMtYtAnqXeGtaJAuI+vUk5E
	qr/At9vgJcdu9Am8J3CNGLETR670lygdB44EeawMDhUp4oWofK7ncTEM6qXJhQVozs53T3UIXpl
	B0BEPR1ixfUeLAai2dQYPcVMSspOeE5cPAqDxSrqOgW3gcwdd4FykkvkOHJS+KFMvxJGTxjFAA2
	b2NK8sfQNmhb8O/36dz318T4ui8GX5FWpRBFRu62Z/mbN9QZLUSEzFTKVAoFzYBH/baDDC7DZ0E
	nWo0h9jqoOkadopx9t0Iw+etogC2iwreO6hhDPDwyqBro6phLcYkI
X-Received: by 2002:a17:903:244a:b0:295:bba8:3c4d with SMTP id d9443c01a7336-297e56ada4fmr110965745ad.35.1762800902129;
        Mon, 10 Nov 2025 10:55:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnoi8L/6S2oVVbU1pOEwmq5eJK/vJw958G/hYadl9mjrBUKeaV27bhmZWcoacrQdwz6Pv+FQ==
X-Received: by 2002:a17:903:244a:b0:295:bba8:3c4d with SMTP id d9443c01a7336-297e56ada4fmr110965415ad.35.1762800901552;
        Mon, 10 Nov 2025 10:55:01 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650968602sm157045745ad.9.2025.11.10.10.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 10:55:01 -0800 (PST)
Message-ID: <e44c8f40-b6ff-4369-8d86-ded225b41544@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 11:54:59 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] accel/qaic documentation fixes
To: Bagas Sanjaya <bagasdotme@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Documentation <linux-doc@vger.kernel.org>,
        Linux ARM MSM <linux-arm-msm@vger.kernel.org>,
        Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
        Aswin Venkatesan <aswivenk@qti.qualcomm.com>
References: <20251110035952.25778-2-bagasdotme@gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251110035952.25778-2-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D6JK6/Rj c=1 sm=1 tr=0 ts=69123506 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8
 a=wQdz1tM6fslYZEmrDPIA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=MP9ZtiD8KjrkvI0BhSjB:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE2MCBTYWx0ZWRfXwczkI4h+QeZr
 l8aFCBZcbPPpRys73OA+4YvQayNzi8x2fnyrTyyxdIVYsnR8+TU99+G3Qs3LOOmV+gi+ND98HpE
 Vg6DgNfecw21IOLdTuX+MQinbAwxvOLgOYiz7tyjmwrtFBVr71peqOgQsUDpGBcXjYNgQePAEjx
 ymETVuJGP96uZ9K+Qcr6FRVLnuyke71mtgfJa5V0O4dlJz+N4668xRTKEohKut5KAZ9ZtjJ+0yG
 ewQ8RBQ6b1Lrih0W/2e+5kmDCDn8OCrzoDEGT+AjcsCwcsZah+njH19ZDPMbHFPVNdb8Z04SAXe
 +mCjwsrevRhqZ6BgmuWa70dzprcTPHKQNHh5d7RvZWzAKyu2ELK/IXIyc+b+jJb+ERxHiW3zm39
 ZKFtc7o8Rjb+XfEEb62cpajQQ1DDWw==
X-Proofpoint-GUID: evmeogqHgiXrQ4jnDhSsoRb5m7v2l7z8
X-Proofpoint-ORIG-GUID: evmeogqHgiXrQ4jnDhSsoRb5m7v2l7z8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_07,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100160

On 11/9/2025 8:59 PM, Bagas Sanjaya wrote:
> Hi,
> 
> Here are two documentation (indentation) fixes for accel/qaic as reported in
> linux-next ([1], [2]).
> 
> Enjoy!
> 
> [1]: https://lore.kernel.org/linux-next/20251110132401.200d88bd@canb.auug.org.au/
> [2]: https://lore.kernel.org/linux-next/20251110135038.29e96051@canb.auug.org.au/
> 
> Bagas Sanjaya (2):
>    accel/qaic: Separate DBC_STATE_* definition list
>    accel/qaic: Format DBC states table in sysfs ABI documentation
> 
>   Documentation/ABI/stable/sysfs-driver-qaic | 17 ++++++++++-------
>   Documentation/accel/qaic/aic100.rst        |  1 +
>   2 files changed, 11 insertions(+), 7 deletions(-)
> 
> 
> base-commit: a2b0c33e9423cd06133304e2f81c713849059b10


Thank you for the fixes. Yet again I am impressed by having your fixes 
in my inbox before I even see the reports.

I'll get these merged to drm-misc-next where the offending issues 
currently reside.  I anticipate getting that done later today.

-Jeff
