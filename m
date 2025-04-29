Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D042749D8
	for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 06:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745906824; cv=none; b=AfpRcYnCOvkGZC2YBPkKiW7jAYq9sSow+m5nRp1Xn+fwQdP6HrPPjeoI0hBKPRFhUA1qEnMWWOvP9Kv4RZ3Aa/sBUL+jal2MNpAMlLd3Cf/rqzb6HCyQhruaRJAjJawIQBhZJcboDSdRiMiR/2KczbiWwofJ0fguLYDQkIFdsfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745906824; c=relaxed/simple;
	bh=lm0UWskH7d1rtZJ/T+nzuR9G55DCPo2TN73ybskHlbQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mr9XxzZP1/kxBPEeRz/TZxZZiGWRVaPsYB7dJbS7InztJo36iyGFUbyeHSH6PW/hkv67MBWJof5+Gz/LvgUGjsd2dKZC3peL4hLPl5hx9mpiQm95MrI55bhDzPMpZrHIEYDnhfALEBEax2/PxxWzOEQWYKxsNszFjKFsJifiktc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJJolMfa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJJolMfa"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNqDWg004051
	for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 06:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sxprD47J1ns4+472DQayzeIlGvHftXTVadqiV/NL7Ig=; b=jJJolMfaE1pMIhbU
	peLzegYcWzF6XcdzV73llv3xnqmOWgsgWKvCQC8HsXPd+/adfvmW6/mAXoWrJCEX
	zTYgvXCihU3pEEZ3B9ZAXNlH3ZghHpbGJzbxJUJ4h2Pg6no7oHgqny/YPScxxakZ
	KRktGzZcsfLzgsEkafpC2n8x+uJCMreOwLowD8XDYA3wdBIGQv8VwTUr6JGIBwE4
	/G0eK3NwkII+O9uAU6/E+Ii55d1c9P8Ilhcgq3SzzrzxP0duGvmEaZCTcYFYFtAO
	/FhJ66gjHfRf3+AKLuj4RLAeRRybtg2jS3v0Z1y8DNDE3ra2BKBu6KEs8Lim+O++
	s41UgQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rsbadcu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 06:07:01 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736cb72efd5so4208920b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 28 Apr 2025 23:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745906820; x=1746511620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sxprD47J1ns4+472DQayzeIlGvHftXTVadqiV/NL7Ig=;
        b=Qm9tFbXDCDQndXvRwZLCClBDLChMkhxmf8hfgDW7/9JgzyQL2azdIAz7giGLPlF6v0
         Y/cboZrNVeinnlszTHemEtfaKroG+JWvMO08472iT8vDIxCGO8k/sJSKG+lt7tctGQii
         T+pC4E3zpH6rhcpFUXp7r0IDwzO9r3OKmly9VRrOR0IBbtrovIP8OSXKSSYAM4m/TZNL
         mTJK6KvIe7Cqj+ACVtAUwjcUpn4UPzIsBvAq3+hOr0E5iunA93qemMsmQKq6DWBEPr/D
         SWLopZH4k85DXybUSpeKekyiUXtoKbaiYEP3HZnntqeKbGtCEbRXQWyFW63nUzUCORi9
         CSFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPWEFSpp/WRRFn52+T9FOIwfs/DoVxHzOL6rw/qGByYeFX6e/Prwt2hzMip0+my79qddT8JAlkhQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYyaYFLbKzXxHD5b/7uOQmLG0AutyttEApY5gEyeh7Hp4ggfks
	OxQpX5f1+D/XWbc5GjY7BIwLbyKBIofaYHASm0HqFkVSk3M6lC6rvFPoMrB0zUVMptr+3CCI7M8
	nP2H0BSRojxlFXDRaUR9aelGXIjcfjmCFUyzehBOgYNm4zWdCtGM8Hgwkd1n5s0KY4ZIm
X-Gm-Gg: ASbGncv10ALYOMABbPYAKAje5MMpMHHZ/VQDOvJ4nKsvZ8WIdRlWMLe4Fce3uhLpZaw
	D1lbGFQUrep9DmyL5HhUU3y8ob9SX9qUQwXH0O8sqndnwgg8GiSgDFI5E5xLH5HXI6X8qFbCJIG
	mB/u8GJnVVfO6lQKOSCmX6bLakEr81IKeYXVPFMUXYdVhPEUicMjGfyCvizD/c4oDyB5OAK8ICw
	goWawrb7LqlCRS9IaeiMvSdKMgCKAxBczYhm1iAN6WU7pd64llYTCezu2CquG0ZSCzV3YeIeAwk
	GmrQht7IRdWtPPHc/4tyHKAm3bqLArjRrgMRLItAnQy+Z6WG6kgxVtd0gagAtfl9+TweuF4=
X-Received: by 2002:a05:6a00:21c6:b0:736:6151:c6ca with SMTP id d2e1a72fcca58-7402710658amr3514725b3a.4.1745906819990;
        Mon, 28 Apr 2025 23:06:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBuFacde4OVGB/zgIWhIZTviSUq1luP80t2jNeLYY1HUnZqwFAuegWqGa+YDw1+m78dpky5g==
X-Received: by 2002:a05:6a00:21c6:b0:736:6151:c6ca with SMTP id d2e1a72fcca58-7402710658amr3514682b3a.4.1745906819523;
        Mon, 28 Apr 2025 23:06:59 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25acd9cbsm9353642b3a.174.2025.04.28.23.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:06:58 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:06:24 -0700
Subject: [PATCH v4 03/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-3-6a143640a6cb@oss.qualcomm.com>
References: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
In-Reply-To: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
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
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-doc@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA0NSBTYWx0ZWRfX4Oyrv+dhT11G YU80vn5eoTpERBo9iOvBloqhLUOSHkGZJet41ACmYORw8ROe20aUlCtxrj7esHj2FIu9egQVNQz z6awYziZPBo5HOGUYo1jSHa+JpYN1qNPD5tv+5sLBNTGhnTJDed2U/SNeFpCYt6muoPCU4UT78R
 b1CDAI3KmB40n+nfwXKoa99ucdJlU32qlrL9bTlJTu7uI9l8NNPgWq0sIi4diqEaRDjN2HVBpY4 jzOjyRZYg9MkEsBJp+69d9TDmJHRW0c65ChCMBQxEpcQemgKnjPlIfAD9f05FjPecrB9wVnL2YC P0LPhUSxGDAbDESYWlk3/EBhshUjvrJXysynJHlUMsv/Fl//KbdwDq3FC3NinNjjEDc13qUrc/E
 955t+583qAhI3Il5gjV1vMCJ1g6mfRxsQ8z3gL4c9kpFNvAQEAlj5gZ0IPF9XyDAanCk9lS7
X-Proofpoint-GUID: PEJExBwx2GKN3cdTFIBIeQRROYPL-PLg
X-Proofpoint-ORIG-GUID: PEJExBwx2GKN3cdTFIBIeQRROYPL-PLg
X-Authority-Analysis: v=2.4 cv=I8ZlRMgg c=1 sm=1 tr=0 ts=68106c85 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=nExbU_x0mLWtth5-Sj8A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290045

For drivers that can transfer data to the TEE without using shared
memory from client, it is necessary to receive the user address
directly, bypassing any processing by the TEE subsystem. Introduce
TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT/OUTPUT/INOUT to represent
userspace buffers.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c   | 33 +++++++++++++++++++++++++++++++++
 include/linux/tee_drv.h  |  6 ++++++
 include/uapi/linux/tee.h | 22 ++++++++++++++++------
 3 files changed, 55 insertions(+), 6 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 721522fe5c63..7bf265c4ac65 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -386,6 +386,17 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
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
@@ -454,6 +465,11 @@ static int params_to_user(struct tee_ioctl_param __user *uparams,
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
@@ -654,6 +670,13 @@ static int params_to_supp(struct tee_context *ctx,
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
@@ -756,6 +779,16 @@ static int params_from_supp(struct tee_param *params, size_t num_params,
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

