Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BAE1A0BF3
	for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2026 08:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770256; cv=none; b=mdsBQXqHio8pqIiHeYYoQP5ZhAHe/fy1Mrm+QH2Xm9XcuMmV7ewQjS6rjCZa7sFgzbLyeafNhRGBmm8gkbgxBn9RqEhHLuSFwk6tMXvA8xANZY8eQLmtyk6uhqkR8oJef7NmA8USOwKfGT7uhWzGGQIBgDsp7v143rzgdglF4e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770256; c=relaxed/simple;
	bh=ZWsVLMOWL+WMhMuvkSvFuddvT8uc9TE1ajRBypOQoGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MZ0vPdGsaSuqRp5h0Q2yN9UFmXxiR3fludgKNR08QeFeqSEPb1duu/yBZMVH4APIacSpJsFKs5TOcsWiKrLY2KAd6rva2BDBJzoWO2FfKwFEpr3aX9c+7r5KMbqWQOtbkssukHaLCmIrEsxjclJzA/p39zF9kyTDoeU3CMcNPD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iq1Gv75z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jPtqB5oW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iq1Gv75z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jPtqB5oW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777N1w3352439
	for <linux-doc@vger.kernel.org>; Mon, 7 Sep 2026 08:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UiLTpe1hSry4jJ0vq1E8WMCzQaTotCcSwonEKu/KeF8=; b=Iq1Gv75zAfYJXjvf
	s10KvPqc5wMDWgSeEOGuoTBphKfozoXvnKHJrHEu2BHnXgpU8txGhX3TbbPr6X4O
	GTm2oHpb6waz6pi7Oe1vdxU21Zp7kM6kIHYS1av3s3d+ODRkGloxIMRmsbb0dsqf
	HV9Np66DBMwScpaZ9orpYhnKOZ33nT232ursRdCUPDhRKlLC30qKOK9PIWENkqbO
	t3tUK1F16aLcMXGr4JoNSKktwgsgMc+9b0xeKNFXxJLTq+EakG8d0iwXobALBE5P
	kmGxDUyeZ03Lpx9hOK+3AC8JYIQ4bG2I5795WckePFGtB1XGzqp/ejRAmmxpgKmo
	SVbI0g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66guu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 07 Sep 2026 08:37:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52fb2a46cb5so80025941cf.3
        for <linux-doc@vger.kernel.org>; Mon, 07 Sep 2026 01:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770253; x=1789375053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UiLTpe1hSry4jJ0vq1E8WMCzQaTotCcSwonEKu/KeF8=;
        b=jPtqB5oWvHEQ/HLc61r7cHpB7NwOIAUhYDBkxg+aPOIdbb/9qbmmy4Z9Hb+rNFuC1l
         2vNU9+l+NqzlSlRGMozrd256IzkdVJi6+GLlSkbqPc4chMch4jQTOFDqJ8VKtz2Pon/y
         b5m0M5kbvsS6iVa+cciCvbqkRYelnU+mOivfvwmSyMscmnNgKdgzWJqxUF8pNe01G4k0
         mRK6C5QXcwY8YP8HiCHbp/1Zuddh+RuCHyV5xaQRM29yT5r+Zw8wnbKoSMldrkevXRu+
         8Sv8lpU3kreC4fC0qH8ZdiMz+ROxoGlU5REy54RXAG9MN2lRAVWzC/si/7CE5yw69aQz
         TC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770253; x=1789375053;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UiLTpe1hSry4jJ0vq1E8WMCzQaTotCcSwonEKu/KeF8=;
        b=BxeEqb0pGUyhVyH0pQeNaKU5a0YUoZvH1m1hOEH2c/3NCI4jo0dxG9slEHt1shSUzP
         +cJf0FJohQvzX0djqIRdKqf9hZYEK6zGbI6P0xRcsqYcLQI/9qVEbZDguvNtzCc13Zhb
         AlXWIiSZUxFYuE2KZo4eOBYwR00P8qCcl0FjJ+omdljiH9lkkeQXZ3tnmj6Ukr9PzxsV
         BDnIJUWNzm3MNmCI2m5z+GAfNFhrEIXd2Shp/mcP/OVQSqbTmPr46jvbVrZwhyEmQjvV
         gU3WBBp5ndxFKFuTwNVd2yK6hFZynmloCcp8FJd34NgXh4akuJHCaCIyKjvhFMV+dSxv
         ZqCg==
X-Forwarded-Encrypted: i=1; AKwUvByYUAtbEy5dgKx5kzJ/wwPhHtOYwOaw9FyDTk3z1IdxhhzGwLyUgU+XQxKAybSQmAxRNLKLqZo/vCs=@vger.kernel.org
X-Gm-Message-State: AFuF++lR/cNsWpIIDoqVpVL7gtO1fF1h0xbzLHahKnMVKW005uxUCQhg
	f4JM4Vgk0/ish6CC7PHmJ4D4i4TpSsZQ4zEY44aEuM12gAPgBR1aeNebW7zHnefjLmunPDe4s6s
	daAZa6vMFxE22BAq/9BvkoF5onxsSl/rWlYn9ZINIPt4TmsJ2Wwr+X3drqiG7hdN9XL4kngg=
X-Gm-Gg: AYBFou2xgj/9mq/v2SenpzxOhkPIFFvwaQKflDRn/5XG3JIMUvSBURhO4BJq5iwPPkF
	cpYKfQ7tiPu5ouH2uIPu9C2uqs/pmemlBr3Xi3egztX2IRJTsc7A+oxvw0J7cqYe4kTJV1kvIsb
	ZBXb0DfJRbjFY+v2Ba0P9312+3bOYAVkJI7umd9SZvZ/A8E6xRBNCF3k5SnIWes1B1UeSCCFTaJ
	1b08Fpc4G3X0BfxwW7aoZfejVpl16S9CCKIQKXoDL4EBUUf6iQxe8DaLPTU/XJRJyYMCF2YPAmI
	kk0Ib5J7ejgZXzWBCXANjqebSvyM1iWHv3+noJhlICQCK0hs02hDYh4Amjf8bTYwDYV8T1OBZdY
	vgMuhk5Qjbk1OgXQQG+zMRWz+Ng==
X-Received: by 2002:a05:622a:1b24:b0:52f:aaa8:7eab with SMTP id d75a77b69052e-5305481059dmr266168351cf.17.1788770252700;
        Mon, 07 Sep 2026 01:37:32 -0700 (PDT)
X-Received: by 2002:a05:622a:1b24:b0:52f:aaa8:7eab with SMTP id d75a77b69052e-5305481059dmr266168121cf.17.1788770252317;
        Mon, 07 Sep 2026 01:37:32 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:48dd:b57:9236:95f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf755c22esm292239345e9.0.2026.09.07.01.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:37:31 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: gpio: Fix bracket
Date: Mon,  7 Sep 2026 10:37:29 +0200
Message-ID: <178877024677.8391.10693598419369758510.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260903155345.733244-2-manuelebnerli@mailbox.org>
References: <20260903155345.733244-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9e77cd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dcql3xp4XYDMActl_T0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: HZEfprjntpln1mxSwDW8IA9WkdZ33Q9V
X-Proofpoint-ORIG-GUID: HZEfprjntpln1mxSwDW8IA9WkdZ33Q9V
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfXx/iKSa1ZoqFt
 tDQsudkUsu3hGj1pjUXi1mCz7Ol+jpcejnbJwXeR1Sz9MF7iAhI0a4P6ngAsW44rPcWbNSI2UI3
 K8ksQNpSHnYkxXQRRhVonxT1X0CDG14=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX0zDMyLVhGf8m
 rVKlWJpXKYvu786ine1DLpuQSx8QghqVj5U/OZ8bqZ+tYD3YQOVy3T2ezbqro7CfIj+YpnEuPpz
 qyKMthaTjvweNSEYz1D5DTpJ6yQItld9a/aZjFP2aNIvtKWZOmS80Q8zHrYCcyYKn8ZGtd/AYLy
 XfmY9I4QPeesUhSKF6vUegvBbWHCN9A6V88GMvj2RgwAR4Q+S3oHg6f8XntEIwrtb/TAmPNsgQA
 SQEMfi/KhGGdA3HL7fSBuwW/H8tCMTEUymhhA4kzIn2E7BDhWi7Ns3V9FmGnXc0J2hHSPGNDlMk
 Dlvejh7/XoiiunbufERk3IlsZNicJAVSrazUzFtJ+f/Y6SCK+wK3IJ0m7L5BcfBJWYIwB6/UaqY
 tJ7iceqRlYk5N2J7m5QPQkL8T0WLetrUdrvzHdeM1ufyBzsyoueHU1hl0b+W2dGi5p6zK7SkfUx
 BJE4W0bmnbwismvfJgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070093


On Thu, 03 Sep 2026 17:53:44 +0200, Manuel Ebner wrote:
> Balance parentheses.
> 
> 

Applied, thanks!

[1/1] Documentation: gpio: Fix bracket
      https://git.kernel.org/brgl/c/31e7eb7e38978f6edb6523e43f3d8738e1837d3f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
