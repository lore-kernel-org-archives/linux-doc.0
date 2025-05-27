Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777B61FE44D
	for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 06:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748329048; cv=none; b=ccoTI15MdxXTI+K0r2bvDel17Vq/Z4y/c8BDA93p53McDwJpK5hRgnXqcrbsBKnOKyOg7G6r917YOdbNKTUF15hLjr8Sx+jImwSjrK9qamoiRKzQbyBYyHjSdkkB9kGuIYID/0kdlsdyWXXl07p6ers21K3zd21hOQHVo4t6K7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748329048; c=relaxed/simple;
	bh=6ti6WK3uD8rSgx1+MJL0OTBiXFAh+a7/YuzQpoRdCak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qmKh9E3nadN8Nm6xhveOzSb1Y+akvhSYq3ZWdsetu/D3sb2dNX2ibpu2pMst2+KPLqpCiqfXX5o0suO8EH4QJhdxyLXHZb4+2sfknLV+CGJjOyPKB3/pcX2ypxAGvef/Qzwz3uriz75k1h4cijAfG22qmnG6yF525320tq35DNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XffPuxZX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XffPuxZX"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R1xPK1008303
	for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 06:57:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jRajMmtFgaOC/UV0OjMPo2r2V0kfVealm1KPcyRc9Q0=; b=XffPuxZXV5ikZ74Y
	FE0lmCxHjo5s/ON9M906LHyjYA91qSos6chagS5LD9bgRB62zl3yWYtEcImewnz/
	S4wlFc/vLAnvfOVapph/himlXO/RPYFV4xg00rsR8xX9nFAK0yA6u6jCNKdwkYbX
	Yhp7AR3r/ijo4s7UNRRWSiCTi92E1iNwcAVtTgC9k6o4fseGGBVXhggt43xCn2or
	xrg2hSAQBwBmWXkJ4SwxkLqUF51hEJ4m9k7nQ4EnhpP9vQrrKYJGaGmCASfVmume
	QaHERKsVyXxFNQVJW49QLABQFu4wlSb2Z2w4MjHj4SyBZO5RV2JVtudl5MY1K5Le
	UqcMog==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u7dc60xa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 06:57:17 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-742951722b3so2469678b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 26 May 2025 23:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748329037; x=1748933837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRajMmtFgaOC/UV0OjMPo2r2V0kfVealm1KPcyRc9Q0=;
        b=Oo2CeVzLLbLp80MvSn1lSYkioBRqLO1QsPc4jMuEmGw+GZd90wjuC4EZDZtEd9FGt3
         tym5W2cNbKQ+gbvdAL55wrhKVo61gyypNIoSAbft6N01VXNtgpBees6QaJHv6jTy+bYO
         OPyXTs7FB3aVcA1dyX1+fx3yusT1hpXnpaZ7FPXBYoHtxoBOIZtJKGqssM1+MJqsGCS7
         ZPRLyjY0x9PysV2YshFvrtfa3HKZaWrNhAaJ38CnNJ76Y2uTTG1vHiM787e0r4Nfl53R
         HrAwFzfI5vtMcq9fkD1ngEw9dpUEZoFPsGU3CK02rp7m8+FyObLax4UJZ4+e9LNFv6ym
         QROA==
X-Forwarded-Encrypted: i=1; AJvYcCWsP5HXP04LjY6NbYeulpBDHdEXgvnfUPlnElZMGDkh9LVKmxVFxER4/0S8ayNB6IqvCy4mkhnyx4U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwToXTmiFKwYrMJaUXboFVAwW7og7YIkhwTS2FR3VLpr35fyWW6
	qGEtdX0Z/8YqCI/LPmBeq2zYFZpxvSWCsI0G+V0nCH7OekOfzqdHRy4hrpKMowyFdtckEblYF3A
	Mkmnq7m2oUDJdNfHeDGUgPNjBjq70xDl5sYRRHH14dz3Y2CCaWJGsZb9S70WnwA==
X-Gm-Gg: ASbGncu+2f2fdQ6u4qyXlT3GUb9hZmcQRIZ/ddCgcAFjNcfJRZ9AHx0LCGmWdt4z3A6
	R2Mjky3ZnmyqS2sYBliR4KtP4QHiObN/Dov2tUKB1QeA9apWri5OJse7Jk8jlYdD2fZdrQxN3Bo
	W/U5Fs2AK/+RsT90O5o3Ko1oPmNGowj9hHUnzx0YscMcuJYkeia3wOHAs6Gnc/eQSgCF/1k0Lv7
	8hg4tmxlQffQkvXSZQkEd4dI/NSM5Sy5bxLBJOD2iOdOlD0DqKWj753PYgn/kqP9iccddWIzO41
	kirxyWa/YE0yJrgwwqu9RX75l5ElWBzSs8Gnm9I9KESA/AhNukv3VvhIzn88q5daPV45dM8=
X-Received: by 2002:a05:6a00:a94:b0:736:5f75:4a44 with SMTP id d2e1a72fcca58-745fe0589e6mr14944430b3a.22.1748329036988;
        Mon, 26 May 2025 23:57:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuN5nvo50ha0rqfJNyLS1nF/5MRTlYqa+OqS281BYZkxySrFxKujXSx05vTLcA79D9Jnj30g==
X-Received: by 2002:a05:6a00:a94:b0:736:5f75:4a44 with SMTP id d2e1a72fcca58-745fe0589e6mr14944391b3a.22.1748329036568;
        Mon, 26 May 2025 23:57:16 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm18037286b3a.46.2025.05.26.23.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 23:57:15 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 26 May 2025 23:56:46 -0700
Subject: [PATCH v5 01/12] tee: allow a driver to allocate a tee_device
 without a pool
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-1-024e3221b0b9@oss.qualcomm.com>
References: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
In-Reply-To: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
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
X-Proofpoint-GUID: E5PUp-2uY_ZhGJ2e9OSsXRPoM-lOtBz6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA1NCBTYWx0ZWRfX769J5pa2iE2I
 HN7iIhnyRjyAQAIcz5nEmY/zAGcZz0mRMcIgzGtZG6MOvbFItMgTXdmsarO4GeV4TGa+Db5GImX
 DU79RyftTEhx54a0Zhr6dFJYrBGOkVQ4/AOfXj3urFRbkM9dZZUWYNJr7VqowVUdedOGienpOaO
 e2PzI5xIcdfDD8iKMmHb8FXxgvClLJq1N97jp2xoJMddjLXkLDWoI/yvq3lsLf/hHrhTEXaFTiQ
 wiUI5Bhy0I/8vRpKh1JL1qAV2GcHSpOb4A6odpOVzgCtVKGg9XJINl7ptxbCwjyBeyPS0laRCUE
 r6pYHKbni5T2TmpIHYC1cvse2zxLI9NDtMLTDRDFgHRgXE219/jWONkv5W+nlbhV88SfTeuwxfG
 qU2Q/pNdsGVdbqIAiqvc+J+KuIeUzz9MbAH1tF8EELocbIAbv3aqPDQumYKurc5CGeZH07gT
X-Proofpoint-ORIG-GUID: E5PUp-2uY_ZhGJ2e9OSsXRPoM-lOtBz6
X-Authority-Analysis: v=2.4 cv=Mq5S63ae c=1 sm=1 tr=0 ts=6835624d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=1atmPuGhRQHGwWkYLZIA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_03,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270054

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
index acc7998758ad..133447f25065 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -889,7 +889,7 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
 
 	if (!teedesc || !teedesc->name || !teedesc->ops ||
 	    !teedesc->ops->get_version || !teedesc->ops->open ||
-	    !teedesc->ops->release || !pool)
+	    !teedesc->ops->release)
 		return ERR_PTR(-EINVAL);
 
 	teedev = kzalloc(sizeof(*teedev), GFP_KERNEL);

-- 
2.34.1

