Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2407126D4DD
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 04:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757650074; cv=none; b=uV9NQRe/WZj57r8MWRViitsv43cVBKlUvfK5Rw91tUzji8ZAhAVNlpK+bXQVT/zRKgIbtCk7/71M0znoFAPUyfzWagtzMhlfEYTQVX0QObdG+i+xL0RDkSbf/Sm2rBMXFpu+cBL1zhiaOaO59l16PLx8z5LCEBlEexXqijCObVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757650074; c=relaxed/simple;
	bh=PlNtUBn1m92e6j1roGLFXzYvk2/0ghYLEgBgH8NcnDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PSFfmuQjG3DHXg8MCHgNitsNYTJP+WLjFVceTVHpU6FrcJ9NSB7I0qN87yImy1YG0WFa7qso7sW+ykJmj7Au6Q4h3wK0ifzBZglwLjB/SfkiEH04UMhT0qCvaggImc/FiXzFd370zVR12D/3zgwuUvR7BPWoKP93p8TGxfSyCS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TqMrXJvD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TqMrXJvD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BIp0Sq016304
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 04:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0cy7zuNmWldsjxlDI+hNSLQe922ofh0kNWkW6uU0Hx8=; b=TqMrXJvDnndTHE8V
	cdwpRbB7NMB0Uza1PdVqtA1sHoldiQ07zAcyYHo3s7661dkj8pj1MPfX+eDE79oj
	tsvYh/G0xeJJnhUxmHuCLO4hzWvP8BgITilhMfSL5Q/23TfwqWXKjZngNcSnYsCH
	azw2ZMTjSeDkWvbef0COzDWFwVFYpBTPumj5KpxRetgAGkBGsu+Fsgh1pNp6BwLZ
	yo8jLYDSOMR5VSMPnQnKDWhhd64PgQIdlduHN6P1KyBgdR9jv7XBH012MgKg/X+w
	90f6jtIBkn+JwuF/KEs8/JbZ/NefXQvm1XNbs2I4wCPYfM6akRUAZW1TRIZJ4zZw
	szBOpA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t386jw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 04:07:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-25d449089e8so8337725ad.1
        for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 21:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757650071; x=1758254871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0cy7zuNmWldsjxlDI+hNSLQe922ofh0kNWkW6uU0Hx8=;
        b=teVOfRdsUfsVctsWT/+wZYna2hs76wNy7lC4BcDYQiYI2whPx3vGsbkOucfYuv6Jsq
         u0VxvkefkFUc/0MDyUBi9/i2XFO6GpviCaQsO9g/TKfGNlYEZHd03lz13s06Aq5ot8BP
         ScIMu1BHZ+wd6ZwqrSOGhQ1i1L7ke777eFhw3HVYTBAasxogq5DC1iC74hdX3dqE5Bs2
         kgxMFFb7sesfYx2vFrp1Rrs9lZdsaAR6FzQiDNe3JvvJx/2qXveFEtyTEtnJ06SlJ6vp
         e3AhrxWHAcOMh9m9yP1BzaD0snORqJDcLyTq2idOD7sGNPHPPEmKqowDTH089Y9w77hv
         Fgqg==
X-Forwarded-Encrypted: i=1; AJvYcCXRNoNCy0vpLfWw0K+ibu2UpXLqdQs37IMN2AwGfVyDVX+jxBrRLFZ+8rM1Sg9NzRbS26/Z8NLYoZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTx4uoaN634j9uycrC4cCiKAaJ/UiJikLBgGNeCf0UACStuGsu
	k8sYUOMO/naZrQO+eL8ddGe7ARJRNHK6UFtQoU2k2Qv+eHI96XMDKLuZsOcQ0Wy4HSKpqHD26kY
	ui22o7+fFgvS6hvI09crPn4HjTQndZUn5Qz1hY/zfZ+nP6UFYfOEsKG9rTYC1gg==
X-Gm-Gg: ASbGncvwnHIp+bfmxh1IFz8wSoq55o0AJZzbyq/42kwuuBsSYZn/Gf224Zn3e8l6KWE
	kHiDtZ7efLXZIQnQu8/rw1RXpw6qjFWQBdQMO+W5sLuuuqj9UGq3YfoKB77Si93WQMG3q62u9Kv
	w/8iqN8eGJIVxD+bconc4Lyct5GFiQdu7aRKaQoxzk312md2+/uJhe2fY5PR1PwsKD9FJdlDo2y
	XDHrdWnibSzPSB2XM+aKuo5AQ9btkIr98kmoXYj052ilkpSIpq4Yoa6XW2KV6rlhwAWMQlN+4u2
	EQSWHhZg5arRor32QDaWZJzmxhbmyfDm+odJhHK/EItRk/QDPipyk1ZomJqefJJzgwRwFbgr7mp
	zFM6biAjHR+LEddbnsEIdcIg=
X-Received: by 2002:a17:903:2ecf:b0:24f:5447:2197 with SMTP id d9443c01a7336-25d2587d2c9mr17317645ad.14.1757650071306;
        Thu, 11 Sep 2025 21:07:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoqJc1O/uAlEAxgaKcABrHUnAHQ+NKSR7AY913bzR8AUunHyu+K06+VfdNdepa7qcmVz579A==
X-Received: by 2002:a17:903:2ecf:b0:24f:5447:2197 with SMTP id d9443c01a7336-25d2587d2c9mr17317345ad.14.1757650070858;
        Thu, 11 Sep 2025 21:07:50 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ad5e168fsm690960a12.13.2025.09.11.21.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 21:07:50 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 21:07:42 -0700
Subject: [PATCH v12 03/11] tee: allow a driver to allocate a tee_device
 without a pool
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-3-17f07a942b8d@oss.qualcomm.com>
References: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com>
In-Reply-To: <20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: QfqUD2IrEM1Iod7LV300bFNPFMNKlk8T
X-Proofpoint-GUID: QfqUD2IrEM1Iod7LV300bFNPFMNKlk8T
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c39c98 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=1atmPuGhRQHGwWkYLZIA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfXybGlta3CTtMI
 mu69pkr7TKNaFXYpPhPXi4cjIZqLBOSHOt8k4BxHh4kKptBM4A3693M2CoXyQV+6alrAQiJG1Me
 RGWfHjavLEKDnlGv1qyDn6Xg0rnUF57cDAwi/wg/xL6MM72pC8tvy9PAL/8jY1dUjFLDbyjQh9H
 YjFag50Ep+grx8gNV6gZcuieoL2vn63c9z4F5hM4sp8+wBnoxbE1MhNo/ANQrN6OwQmVn594yql
 Bs6UV0mNrUxnntl4fYuZg1Xr27yD0kMP5guCtuA6we/8wjAV3KHPgZeDgfVjOrgB/AXydKNVVlE
 7FicZzyxu6r5qSJw5LqxjuBIn4+N8pOBGjlcQxhb/s/Yu2oamH/HZqv75nQdjJB6guQO2BycVv6
 7IhHc2oV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066

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
index 807317d7b3c5..9fa042d80622 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -926,7 +926,7 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
 
 	if (!teedesc || !teedesc->name || !teedesc->ops ||
 	    !teedesc->ops->get_version || !teedesc->ops->open ||
-	    !teedesc->ops->release || !pool)
+	    !teedesc->ops->release)
 		return ERR_PTR(-EINVAL);
 
 	teedev = kzalloc(sizeof(*teedev), GFP_KERNEL);

-- 
2.34.1

