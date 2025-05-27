Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2ACC1FCFEF
	for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 06:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748329044; cv=none; b=AKJKTsDODJzeO4DloBXGwJ+okWsbVn1EZ+cMxU/zWLvMrghafxHw571SLq1j6XhBRarqNbN+flLXi4mVc05IpUYLMRnTZZK8ObhxxAnNpgz9JCSZTokcKQc8waAOU24kUrJS6SXhXgzS43Zc/8M+vUDI9B/uHL86ssitnQQvgP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748329044; c=relaxed/simple;
	bh=/fg15wlLU9a84mP63LDo8vODKQ+G4sm9S8cVwXoIm/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cNwJvyxaqIReJ7+ylc+4LuLV6qo/bfZoJDV3JxmtBo2X1aKQBWAKQPgCTmZ+jEyGr+b03hp2TwmGdUkNmKuk3TtQcMyfeMdruebhDAH/yAQjCRSD3WSpbnxDPdUAeoccg+k3oqVdH4fiI5g+uzaAjXZ1B+i/7xKXAkxF0mpmxEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HAtgwKhm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HAtgwKhm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R4P3rL001212
	for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 06:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WLqeGWvU8zfMS74T60G8T+WzEG6/RvlK78WHTc8M8/0=; b=HAtgwKhmT4F8C1N6
	Uk5eE5hCFmmFOguSbZpLA2RYG0qdEQwuBoLUUhWM7d1jz0udYGg9daX+zKL3OktW
	RmdYT43EpYfYw7MLwKtxpHIqXxoeB52SnipFVHA5kUbjVlPdRUGq/rj+0kbI3KGu
	IWuky6VFsOuDZ6L87nSEZ1SYlo9g4qiBJAzWlPkk7PY6Hn1QgxiSs0k09TaZ8/8a
	uGkDXxy7j8LNqnfZmq4DkdYGgbTFO7vHvBKtpTc+++ZSlJUCmNiGuk2fZDWVR2CZ
	nD1+8NTrLNYc6aN3MhFa30ymqJxOG3eP/oeEeYes5IlLvHzXZVyFu2WzbsE8igls
	dkSJnA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fq643k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 06:57:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b2c37558eccso929594a12.1
        for <linux-doc@vger.kernel.org>; Mon, 26 May 2025 23:57:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748329040; x=1748933840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WLqeGWvU8zfMS74T60G8T+WzEG6/RvlK78WHTc8M8/0=;
        b=H5cIUbGXtlUFsrh/88ZBneaowvUbOH96eL3bmx7dXSo9BdLQ2pAYfyjt1PU5fGq2Wd
         nXICIXRpYxHWMNhLnkP5NNcqDG1tH8ly9xvlqTB7MxVkPe+39gNip54/l5aM/1G+JQPn
         1JV250ky50xBycD9Iv/vjA2+75Th8CiqECcmmvwWMQ2YCt3Q1LCnmcy8RUgfKW05Wzrh
         QS30Lw4ZG97YHDx0iPKDkZTBjNTa/ddS1ogd6qTYAewu1D2UV1ae42A4s5EKtGwoSLyB
         xTe2IWi1AupTED5JWKhjd3y9fkDty4RY38KvzRRHjGgjlL8k25odLVoML6TqpNUVAN9L
         pIKg==
X-Forwarded-Encrypted: i=1; AJvYcCUjp6me7jmVRRIxpRl/X3JT++SCEVhZI6nRJwwNYj/CNyWnLOTUFfV+ZolHnKwXxVG5XkFM8a/gAoE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf+flRPP5OvEAKLmlgLYwz+K9KOnmUPaGqrVjMSSPwx487rnNr
	dMhZnHeLenfHKYuJPpOZYoXw2F2Jo0QlfbjLSXuZmipfKQFh7R1tA7Hspqov17qSM+Vp4qrvhY1
	KUCqzJwT/FMi/dgj4DqSmFD4iug/q7mfLhcTz1EhyCzedVJlJvVMNO5uAnAYTaA==
X-Gm-Gg: ASbGncsbB82u3QIfRUP/Gj8QzmyZv65/pUgpzCbHLZ1fDACL9RLSgwAl/hOtac4igcV
	G5hXOJhRp85/1DmWLv/yaaHMYIWqW7SfHvefyZTd/D219KQblrm52BjLav7/nT1kLUk4jmsRYjp
	HAXWVSnhaALpPBUSaPuw+nEtSFE6N2K8D56vi4Oo6IGEgGr6RZhm7W3F47Rv6I27WD0k1Xyp1YG
	z+ymG1UDUSVcRcKFkICcf2CqYjAR6+IsZPDTaTeCEtmz+vXtiWYYV8R28cvG1SWdTnNOJ7AI7BX
	GO3df4ObHPSFu+SCKEaQ6AT6Mc/wq9IEX2BrT8lGkw5bUYzLD2zlihrnfJrMzFzJqg1uttU=
X-Received: by 2002:a05:6a21:8cc4:b0:215:eac9:1ab5 with SMTP id adf61e73a8af0-2188c233917mr15033563637.20.1748329040355;
        Mon, 26 May 2025 23:57:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1QjggcZf+rHuRKaXDNKUPHHlDjlhKRm0s+i6usFb3ovjby2oYt3vFxPnI/HBsiyPMMW1UEg==
X-Received: by 2002:a05:6a21:8cc4:b0:215:eac9:1ab5 with SMTP id adf61e73a8af0-2188c233917mr15033538637.20.1748329039905;
        Mon, 26 May 2025 23:57:19 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm18037286b3a.46.2025.05.26.23.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 23:57:19 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 26 May 2025 23:56:48 -0700
Subject: [PATCH v5 03/12] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-3-024e3221b0b9@oss.qualcomm.com>
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
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: 1BNqLlvavePgxrhXg9DIL7hBrEVRaubL
X-Proofpoint-ORIG-GUID: 1BNqLlvavePgxrhXg9DIL7hBrEVRaubL
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=68356251 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=nExbU_x0mLWtth5-Sj8A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA1NCBTYWx0ZWRfXzNeRQaSo2cYJ
 NIiDO7DAx6ayNLljSI1RkD6+YBl6eOU6oqSNOXNJl0TXfmxuanAj7+uZIBAt9jwfYamgrViy69x
 IfIGYWlGJ99RLTGrEcnFKXVhaWglsMC6JLWu3/+SZcgJ8DnBmPzuHYO+Dr6GQgPcZaFDa9db4rB
 iPSJ4eOECxl8+opibxzrTim2dL6wLSb2KlI3m+XmfCjpfdWUiYlcm5tiLIXyoUcihubokYek4As
 yxoD+wKNh9Mg8eGgx4PVkl/vUbsrMSOlMcyrTlQkYZSP0IDJOuQ3vcug21HjU7ggak4t8tVbOIZ
 FUBTMixKQRYiLyshK/GeWBfPDkxHaJmDDmXPc4MIXbRUBkfxtDKwgUpWMc9VKYp0EL4j4iCZiiH
 7icBcTbYdfEWra+fs+fzPeDZjjyUlV7IDEQR5P7y4+J57/uCgZpLpqj5kB8rfeqorQrmmLxW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_03,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270054

For drivers that can transfer data to the TEE without using shared
memory from client, it is necessary to receive the user address
directly, bypassing any processing by the TEE subsystem. Introduce
TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT/OUTPUT/INOUT to represent
userspace buffers.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c   | 33 +++++++++++++++++++++++++++++++++
 include/linux/tee_drv.h  |  6 ++++++
 include/uapi/linux/tee.h | 22 ++++++++++++++++------
 3 files changed, 55 insertions(+), 6 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index b9ea5a85278c..74e40ed83fa7 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -387,6 +387,17 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
 			params[n].u.value.b = ip.b;
 			params[n].u.value.c = ip.c;
 			break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
+			params[n].u.ubuf.uaddr = u64_to_user_ptr(ip.a);
+			params[n].u.ubuf.size = ip.b;
+
+			if (!access_ok(params[n].u.ubuf.uaddr,
+				       params[n].u.ubuf.size))
+				return -EFAULT;
+
+			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
@@ -455,6 +466,11 @@ static int params_to_user(struct tee_ioctl_param __user *uparams,
 			    put_user(p->u.value.c, &up->c))
 				return -EFAULT;
 			break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
+			if (put_user((u64)p->u.ubuf.size, &up->b))
+				return -EFAULT;
+			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
 			if (put_user((u64)p->u.memref.size, &up->b))
@@ -655,6 +671,13 @@ static int params_to_supp(struct tee_context *ctx,
 			ip.b = p->u.value.b;
 			ip.c = p->u.value.c;
 			break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
+			ip.a = (u64)p->u.ubuf.uaddr;
+			ip.b = p->u.ubuf.size;
+			ip.c = 0;
+			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
@@ -757,6 +780,16 @@ static int params_from_supp(struct tee_param *params, size_t num_params,
 			p->u.value.b = ip.b;
 			p->u.value.c = ip.c;
 			break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
+			p->u.ubuf.uaddr = u64_to_user_ptr(ip.a);
+			p->u.ubuf.size = ip.b;
+
+			if (!access_ok(params[n].u.ubuf.uaddr,
+				       params[n].u.ubuf.size))
+				return -EFAULT;
+
+			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
 			/*
diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
index a54c203000ed..78bbf12f02f0 100644
--- a/include/linux/tee_drv.h
+++ b/include/linux/tee_drv.h
@@ -82,6 +82,11 @@ struct tee_param_memref {
 	struct tee_shm *shm;
 };
 
+struct tee_param_ubuf {
+	void * __user uaddr;
+	size_t size;
+};
+
 struct tee_param_value {
 	u64 a;
 	u64 b;
@@ -92,6 +97,7 @@ struct tee_param {
 	u64 attr;
 	union {
 		struct tee_param_memref memref;
+		struct tee_param_ubuf ubuf;
 		struct tee_param_value value;
 	} u;
 };
diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
index d0430bee8292..3e9b1ec5dfde 100644
--- a/include/uapi/linux/tee.h
+++ b/include/uapi/linux/tee.h
@@ -151,6 +151,13 @@ struct tee_ioctl_buf_data {
 #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT	6
 #define TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT	7	/* input and output */
 
+/*
+ * These defines userspace buffer parameters.
+ */
+#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT	8
+#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT	9
+#define TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT	10	/* input and output */
+
 /*
  * Mask for the type part of the attribute, leaves room for more types
  */
@@ -186,14 +193,17 @@ struct tee_ioctl_buf_data {
 /**
  * struct tee_ioctl_param - parameter
  * @attr: attributes
- * @a: if a memref, offset into the shared memory object, else a value parameter
- * @b: if a memref, size of the buffer, else a value parameter
+ * @a: if a memref, offset into the shared memory object,
+ *     else if a ubuf, address of the user buffer,
+ *     else a value parameter
+ * @b: if a memref or ubuf, size of the buffer, else a value parameter
  * @c: if a memref, shared memory identifier, else a value parameter
  *
- * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref or value is used in
- * the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value and
- * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref. TEE_PARAM_ATTR_TYPE_NONE
- * indicates that none of the members are used.
+ * @attr & TEE_PARAM_ATTR_TYPE_MASK indicates if memref, ubuf, or value is
+ * used in the union. TEE_PARAM_ATTR_TYPE_VALUE_* indicates value,
+ * TEE_PARAM_ATTR_TYPE_MEMREF_* indicates memref, and TEE_PARAM_ATTR_TYPE_UBUF_*
+ * indicates ubuf. TEE_PARAM_ATTR_TYPE_NONE indicates that none of the members
+ * are used.
  *
  * Shared memory is allocated with TEE_IOC_SHM_ALLOC which returns an
  * identifier representing the shared memory object. A memref can reference

-- 
2.34.1

