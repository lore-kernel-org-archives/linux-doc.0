Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894652E0B48
	for <linux-doc@vger.kernel.org>; Wed, 20 Aug 2025 23:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755733149; cv=none; b=o2sGUPp9MVIVqzEoFRwPDE5jpxc4PZqcmf+RqEUduEvONBM+ezooz81iw4yqkA234i8zc9ac2XoHjNC2npGgXDSaie6MnpDsiWe+x2cun8gV4JkA2HSzi6h8/CZ9R9T2XgHOqlnkV1g3SEch423DHBKyxjsTdRe01n8AtC6PzlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755733149; c=relaxed/simple;
	bh=Yh85rlS4nql62j6YKEnNgls3TAgynSOKcaoqO7FHo1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lPmcnaiWaU5W0pATXQmVpjtJ6wAz3y/vQQi9abABzBZtGr/zPXlUXpGB9K1TrK+xXQUWNFzlKOf/9KG1mZeGpaIFWSSrenLjD1QSIJXtZgR6gdmUWALsZQWpwD2I2rWl4qSEL9Ta9JEdLNDQxkpjZCX2LJ4qHZ+1L1b9aunh1Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l+aSTJlp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l+aSTJlp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KJpwBi028414
	for <linux-doc@vger.kernel.org>; Wed, 20 Aug 2025 23:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2mg5AWjqaghC/mvjk6kLruWQ/snXAYnJwKVQhGg0+qs=; b=l+aSTJlpcqgFB47O
	XttTZfcw5KAmMiF4b6ifSUAAqIkzDy8gWM+qyIseFIQJsuRHF3Wp+hMQig1S/1V6
	tAjEOYDFxWdMbCD6fhpE6N/02Litm6JmFE5Tg4DOHz59S5216XsvTNcmCgrUQiOD
	qulZlIwmt7shhq7fD9btxdjYnsxEwk67PwI03fWFLWSYf8e9AFCHXj/6SHxyjvyi
	JsWVHGUIz1IfVHzbj49X15EQFPPyou+F5TGsiR1TH3jtMJXtP1tGhhAwH9CbMtBE
	aBJOFdc0kw+6kgQ0zqq1qZNnmrHkHDIkTFdMgPBu9pyuMt3qzxRJJQu6Zegw1JDP
	UawdiQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52au8yv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 20 Aug 2025 23:39:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-324e41e946eso824967a91.0
        for <linux-doc@vger.kernel.org>; Wed, 20 Aug 2025 16:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755733145; x=1756337945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2mg5AWjqaghC/mvjk6kLruWQ/snXAYnJwKVQhGg0+qs=;
        b=H/RR/NRGEgG+v8LxYihM4ru50THX7RoWfyDGDs2gB9OAoXQIVOWR3Y0QzY37L42kWt
         77CKEFc+hird3N+BTaDrZwZzLu+CQ2zwUlcRfJO0/rs8wsuE1i8ay8FqkRvYtvOIvI3a
         04YGluDMIbGsSYQrOWgbZzXbQOUyBYz77C+cjofMy0/fWqboa+lctkvsd5IpeLoq9doI
         Z3cjDG++u5j3ETBfp3mAY9rrRu+Yg5u1a2a46yZjTSz1SsCACgfcqQMIJZAfLuONmTZ2
         rKJZaKznPJJX4g3E98S9Nx6xtEd7H/Ccj9l+xDGCWFVgWnB9S+4+whVHKoLa1iNLcpCR
         V/1w==
X-Forwarded-Encrypted: i=1; AJvYcCVoVZbNEzpMoMXWZbrtpzcG3YxZIHlsw8b1J1wLN6nhKqlu0qfndxfDMQSNE2M7wk0mDzIqs+lYu5g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwViflq7cR3QF9OaJB63DGwk+6sQmmmLLC/UlC2jxssedkIuX6S
	FMBolV7p5zhf/IURyMyoneAXYmCwQkxgmDGcWRReaizKGXCJ02dGkIQPv4V0uLNkxA6Vlrl/JGb
	qHU2mfTZ7SOVLHqPKj9zumYLCN//7sgTAq3em0WAqgDvc6FmAJGl5CFfsbBgHHw==
X-Gm-Gg: ASbGncuJfiWIpXQmO+ahM0ueZYlAkoP2+fr/i3Uaw1z/WxVHKcIXD78V+4GEyf/FjJ6
	axylFQjFVgX9WSa7jjwT2dFWy1vVq3cowN+DSZvRQ5CFZv0CJuvmWRAq/RSxGlsrL4tQTQmYyrh
	qC0dNa3NpiudMz8SgndmbFrrRSBh+XOAEAZF2Gqw8aTmKcIUHqF0DemJytaqZ5Yk+WnoHeW9fIl
	z3IpMBTXiDcq339JP0AnNAoRJ9/7j/LP+TTlRie8h5Ml8nDT9B601AU94LyR3oJTBW1kZNv/tzs
	Tlk/++7+meHzWMjJZ0EIGguGJPiGx4yonWpvllaDcRsfMz/v3k3BJVOZ32cSqL39h1oaWJJmp36
	sqq+lMix6S+tzM3mkooiu5eE=
X-Received: by 2002:a17:90b:33c5:b0:31e:7410:a4d7 with SMTP id 98e67ed59e1d1-324ed17a46amr814670a91.33.1755733144759;
        Wed, 20 Aug 2025 16:39:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXK18UdIY44KcNM7aaFlARIr1CMW3Y1H8zVdLrdvIntoDG55CLQtOdtAX1cQDdnrcWsR0qBw==
X-Received: by 2002:a17:90b:33c5:b0:31e:7410:a4d7 with SMTP id 98e67ed59e1d1-324ed17a46amr814631a91.33.1755733144241;
        Wed, 20 Aug 2025 16:39:04 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4763fbc711sm3233028a12.2.2025.08.20.16.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 16:39:03 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 16:38:48 -0700
Subject: [PATCH v8 01/11] tee: allow a driver to allocate a tee_device
 without a pool
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-1-7066680f138a@oss.qualcomm.com>
References: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-0-7066680f138a@oss.qualcomm.com>
In-Reply-To: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-0-7066680f138a@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX92KUbaQ9qtn3
 PQ6TyRgJhb50WJe5Mo/diG6YaDsKFCtmY53Mx74VXXspsT081Eaoa/MQ6+CgOcfKRv/NnxqO5j6
 rJqX5bnRzTp6RCMzABKcvxnS4AjV55U3LiGbYb4v19kD86IvRGeXHqke1OvLiVxloc81qqCkCho
 VgfY/TzUwop4bKiu+wnH0yGvO7ZN3x+9lIej9TZ9bdIdaMOxZNfqYAFkXRuZYC3VslU5IKQgGpw
 xI2sRb5KRQDlAXmsD7QEZgZKbg87lfXjVunKSaKnSog5/UQbrtRUrk+RypxweXqZst4u7xkkUqK
 hiIEX19v8D/tXcaU7qFfe3KDJMpXe+c2SluKLBSpykvXGRwS4jEluooyt96MjHOXppF1leBAa1F
 UfC7XXZkzJkV6e3gcr0LVD3Yqoz8mg==
X-Authority-Analysis: v=2.4 cv=TIIci1la c=1 sm=1 tr=0 ts=68a65c9a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=1atmPuGhRQHGwWkYLZIA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: Aidxre9ZboRpwuF2mwG761Udgiz8KvA6
X-Proofpoint-GUID: Aidxre9ZboRpwuF2mwG761Udgiz8KvA6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

A TEE driver doesn't always need to provide a pool if it doesn't
support memory sharing ioctls and can allocate memory for TEE
messages in another way. Although this is mentioned in the
documentation for tee_device_alloc(), it is not handled correctly.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index dcd40c26a538..33091aa21be0 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -852,7 +852,7 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
 
 	if (!teedesc || !teedesc->name || !teedesc->ops ||
 	    !teedesc->ops->get_version || !teedesc->ops->open ||
-	    !teedesc->ops->release || !pool)
+	    !teedesc->ops->release)
 		return ERR_PTR(-EINVAL);
 
 	teedev = kzalloc(sizeof(*teedev), GFP_KERNEL);

-- 
2.34.1

