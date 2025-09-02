Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F42A2DF13E
	for <linux-doc@vger.kernel.org>; Tue,  2 Sep 2025 04:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756788976; cv=none; b=NxySDxJnkBGKIwsJPUAnioNtyQBGQ/y6Rk70+xIITvILYm9PnRm59x7bZQFZJMpFfDvjymLy14KfAfYFWJ9xaxwhlJjgsn0Q8WP7DGp9pohxWwM5i44fzOGlqj4Lbf/Rx4k5jym9wNcEk/u1IV0Ej0H6xjiHw6gL0a3J46r6lbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756788976; c=relaxed/simple;
	bh=Yh85rlS4nql62j6YKEnNgls3TAgynSOKcaoqO7FHo1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dq17VKDzXOk53jsfmpxerLp7LTKKLkCJVfRz4MUUYFMaJ+KFk/ZYC7qFdSoC/WSmLZv2uMphojIXQDqXsyKNLYuhWrhGcemVSGVjdAUGzym8czb6SZQA0iWlyr5+LpyIxNKN5MWspkkwbl6FZt6TWGPNSpodKTL6pkiRqVbT+wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QqOKYmKe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QqOKYmKe"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822SCeG022315
	for <linux-doc@vger.kernel.org>; Tue, 2 Sep 2025 04:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2mg5AWjqaghC/mvjk6kLruWQ/snXAYnJwKVQhGg0+qs=; b=QqOKYmKe0XQ+cJer
	S7yxq/GR/a8nz2SpXqpPS7AHVNwRYITkRQoGmkfvB/adUqPOkFq+yQCKXN/giXly
	8ExalnQXrlVApG7T/ZJ+3YQl9jeCmpe0EEx4pUZkjk9uAIexpTBlq2IW05Ld27GU
	7GEHAfKwBSnzfaOd0hofr9x7tam5xHVceVvAaEBO/aDzXc/QxR7qkLjQkYCrv1cu
	wd6xto8mmM1dLy9UV9y+ZNpS7meuP5zX2gKpulzdYyXWAsz4UQLPl+f+bFRIiJtF
	QnVcOIAXlZwX5QpuYE+a04Od7X/cexzX/sN94rYVgs+HNDv4IB7+bauLgSw1OnIv
	+Htl1Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp6pam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 02 Sep 2025 04:56:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24919af9fc7so24682855ad.3
        for <linux-doc@vger.kernel.org>; Mon, 01 Sep 2025 21:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756788973; x=1757393773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2mg5AWjqaghC/mvjk6kLruWQ/snXAYnJwKVQhGg0+qs=;
        b=NjxxgQEn58xhRVuKZFFI5r2BxDnCcp3X6KZEjjnDSSg4kKnRdxe94XPIMDlWackRyV
         6DV3LS+yXjcjClA1u9GxhBNxW8xQbsxwD14Q8OupNs9Ci+8jPPO4UahmrvXM65PZSmwp
         UiG8YLoBs3J3+OFj2F3p4xvB7kRWNDWuF2lSK1gDtICeKh6Ah3B8HByV+Gj+efaJSyxB
         lHSFzTzFVmgAeTwaiTMnbof9bnTKtQPSxYm4Vvtjyv/H3WUyZJPo/uOyDZ8aW2nuvDv9
         qODfHcd1LY/dgGTElTuclj3UjrEkyvTyviM9H5wWENbv1DM8ZnZN0FhFWRCH4JnPQIXn
         /qdw==
X-Forwarded-Encrypted: i=1; AJvYcCV/iKykvOJ57tbnBiksRWKbXDrF9vy0L3LfeTDiQyqY5JTs7037ISl2dEChFNqeSEJtBkxtQhg1L/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKyB+kItH86AJy/JUNqIr1rARwkSZFn8bbm0301oKYZIqAlh53
	NdhwsTU3seW075a+7q8lzJtQBeq1EsN3Kuw5yg8yxv5D4ETOLiVsVh2wxZc/ka2vW0Y+Y9XgY1B
	wuMwzQeR5dFSq9QIwGVi/q/NyLK3Dq6S3r+2C0f61xAjEVpzdc4snd2D6syOycQ==
X-Gm-Gg: ASbGncsQ08eX0lWElkqBO5hZzDTOz55skan08nCA65foV+P5OjhBxR2Z2ilxRTV8O0F
	OjVF0uyU9upKC5SigIJPPWvIo6cMtxeqfRqQTh9uM2IVm1vaukxSsaszZ+WLp5AKvfGj2guaRYJ
	YqzFM4YS+8ojo6yMg2yJ6KVed1DLZ7nOtG0IXFxVBtXBNIm+UBfoFL9D8BSygJoIjo83dHRxEmt
	ugtOU0byzyATVwrYRSHsvsbYS3+IvEii1xN4br3eDO6sr899nLVQAFNbgWQa0MsnA1Qm6plWcFb
	ZB2vo8vfjBA/nZvoslYTYJ6A6vT6AdfqFEEAg9nu996zwC/nlC6OmyPQuLGmDYAtNwVDzCuhQvz
	59WlcHRlbOy5GhBnUclo4nJ8=
X-Received: by 2002:a17:903:384b:b0:245:f7f3:6760 with SMTP id d9443c01a7336-24944b20cbdmr121474805ad.55.1756788972839;
        Mon, 01 Sep 2025 21:56:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvJn27s/WB6VKXSdt4GGDpr0OsZic3u0pMEKyv76QDPWFnyOWUl96Fri/gUJz77+TBs2FX6w==
X-Received: by 2002:a17:903:384b:b0:245:f7f3:6760 with SMTP id d9443c01a7336-24944b20cbdmr121474415ad.55.1756788972346;
        Mon, 01 Sep 2025 21:56:12 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b1f30a63asm1795345ad.66.2025.09.01.21.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 21:56:11 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 01 Sep 2025 21:55:48 -0700
Subject: [PATCH v9 01/11] tee: allow a driver to allocate a tee_device
 without a pool
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-1-a2af23f132d5@oss.qualcomm.com>
References: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-0-a2af23f132d5@oss.qualcomm.com>
In-Reply-To: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-0-a2af23f132d5@oss.qualcomm.com>
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
X-Proofpoint-GUID: F-7T3U-kURSPGqw_6CTKnb32ZPANnP0G
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b678ee cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=1atmPuGhRQHGwWkYLZIA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: F-7T3U-kURSPGqw_6CTKnb32ZPANnP0G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX219cvzabW2q8
 qGjY1ML677Zd8r74T3r2fgtvenNcYvHSYn4wEj2JtyQaTs1xn890DnO28ywsLgJv4p+dR99JsuG
 Ww2IIqhA7jl2Q3MZDT3jz2ko0N5NqnUwTow9X2ruetjM2nFDtV9jo172W0SZ1VTnD4EpVgzvDxA
 w5cVnnNiTqYU4vujy+nvtwyg1nX6mLSpCRviEGutJg7BQgj0Y0/us8t3/Ar16sLkt0GwhpEhAoq
 x8SWAGiK4Dn0y9QsBN1DiGmEVpWrHqv/60Txpp1kJAWRgOBfrsPvS0ZXhKt8X3cAXgUbhZaOMR+
 GEe8jokONzEuvOERkqiapBvbhB6UJHZO2twQAREbTg2jTRZEH29/YZJ9ONhjhsAMA9H3l3i6ElB
 WHKxHcyu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

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

