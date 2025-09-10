Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17ABC170A37
	for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 00:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757463092; cv=none; b=fGK2g4P7cTsTYLrgwpBGiKXdsubKugeloGq1NJmY60i9jnyNO7n9QO+s+lJr8GTLPwuA7QZhdp0pbiKX1jcgJD4SKPpDhQs/enw7fBvvFAGenp+i91I+fYXY9gckwuZokGcV1fZLPQ6TT37rC60KEUFefxzkjZclReShUDQzrB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757463092; c=relaxed/simple;
	bh=sh07O4YZIr6OH/f9rqWASPPFkuLSDXmilsOY1U6tBTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ACPGdlto2w7g6RGZ17ZjLI9OL2RDScMZVpO3NwFnrdf3uAglx7SjvUkfu8FH91wUpEU7SSXDoPuOn1LVx08Oc8VIhe2tYXWT8DdbzIRyS4fTGoX53lIuqR99Irxkmf2aDVytKs9INc2hEpbLFFjbQsIWZxEYpfI1WEE2iZG79KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dLIlzMND; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dLIlzMND"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589IOFEL011213
	for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 00:11:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	exB8k5oMv8UirS+TCY7pH521pSkqtyclXWflYWec7IY=; b=dLIlzMNDYMfw44u0
	bCyKNp/VtMMkS7y9zBKLVjNvnj/66Qa2wWsRhbY3XBdrW69vWH1iRDWzuKlutlTE
	nnEA00VW9fAyDo5Pb9wBErftHOU9mZAthFOpXrCIph1DVWApyn2hhmPb46RZiN7v
	Luej5cb54EX6Lo0QdgHwIwAPGHMaGESqhf0VaknsuxwteDjPF84jW4uML6Gyp4xW
	a79hXYGkz/xdUpcjYaS3c7tXFAP/IPKy//o2MmVl9t1RqXS/Az6X1vkVWO2pf/c1
	6MkkoRp7zUop3RsHj8qrLFUm4QMdQzw/7aA5FGUfXNaqWapDdF4OA+8OZISO7B/d
	T7dR7w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0t0re-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 00:11:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24caf28cce0so146345355ad.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Sep 2025 17:11:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757463085; x=1758067885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=exB8k5oMv8UirS+TCY7pH521pSkqtyclXWflYWec7IY=;
        b=N1B3huLEDgwa1QiuINFj6jcrFpPykJgo+K3ffTmCo20dBQaVG/Dm7LGGFUp//zE13u
         fQs0uzPe8OQCvFfU9hTUdBOwqqgx+5/XUp3gBDRneW9OxNRp4jOz8Ir5tgswp0/ufsS4
         boioPrBpsqPABIsWEas+fd2gWNGfvxtTAEJZf2ewJ0itFsGZ9MdXChHPJXVZaeH/fqif
         wGZ3uPkUwSk69XHWPkRRGxUJc/btV8XP/m+h9GI00JfRXOEFwdVLYlYpeUwxlX15Wozw
         d1br6iytipjo3oiOdMA+I+xIu5MHJur2T5BxupBppSUqjD1Oes/Trj7nG0yOAH/VA5t8
         umAg==
X-Forwarded-Encrypted: i=1; AJvYcCWexrH+3V+312iCMTKEbSOCMeM5PSTEfmtMWTb5MY/n92DdIpaD0Nw8C0u7QMV98drKk4iXxyxwPuM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaCsfC+ZuYOfjseXjnDbAKGSoxiSvapCh2eGL6JOXD9k2OJlm/
	fvGjVRvq6YWTX3XJkaLUxkgmI1aiG3z3cSxuhOSe1w8X/orPBK8U26lNwBf3s6mJHBVQwnQSyRj
	P3rxhzMe+iBPLB3KziysX3lgIpftSZ/5OZobbaN7/EK7t86xF5TC+0UYue+Bo+3bFSxCNHBdw
X-Gm-Gg: ASbGnctDsERSZs+XXWKqB3NffzMx4P4XiqSBHJj3uM8CLJ5iuwDqHOt1GPEdGItEHrr
	fjCkK2GBYwVrKkFXVOg9wpfoprMgdjzF/MdrtNlicAGIOYTXrk/dW+7tZInTfxBvkcznwyi2VOz
	wn2KrYy1YDeAebJ46KNO2w92fNIpPqXXzLeq8+pLD3Lhxpu3kKI+JSVfLAqNge4YtxeR0MHy2dg
	R83H25cglg1HvqTzChLtEopux2QsFb+KLguKEIIWyYl2o0EJD/4f8YMTq6byUKBmXwgwwPNoUTC
	P56Fm22aa4tcmDSQzH6ZtCXlZ1J1lg8S2iPkNHaem3XxNLwBbumXc+cizLMu4KGt84I2xApvslV
	DG4CkQHQC1HO97Zhm0oWFbl4=
X-Received: by 2002:a17:903:4b4e:b0:246:2b29:71c7 with SMTP id d9443c01a7336-2517076dbf6mr186157475ad.25.1757463085166;
        Tue, 09 Sep 2025 17:11:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZ54oL9cjzUzS9diW9LH0ekE8ynSMup+FS5e6hprfN+E8ItijM0s3AepbqZRGXsMgGRrJ9xw==
X-Received: by 2002:a17:903:4b4e:b0:246:2b29:71c7 with SMTP id d9443c01a7336-2517076dbf6mr186157005ad.25.1757463084656;
        Tue, 09 Sep 2025 17:11:24 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dab6bb655sm1285672a91.10.2025.09.09.17.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 17:11:23 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:11:07 -0700
Subject: [PATCH v10 05/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-qcom-tee-using-tee-ss-without-mem-obj-v10-5-20b17855ef31@oss.qualcomm.com>
References: <20250909-qcom-tee-using-tee-ss-without-mem-obj-v10-0-20b17855ef31@oss.qualcomm.com>
In-Reply-To: <20250909-qcom-tee-using-tee-ss-without-mem-obj-v10-0-20b17855ef31@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: PuovsyCk0WcAsXc37zcMnWlNPRnzyaqc
X-Proofpoint-GUID: PuovsyCk0WcAsXc37zcMnWlNPRnzyaqc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfXzMrKq8Wyfm0S
 vk/x8IkS5bbQSCiMUoQO0Egoik5yYobDTs5v2gaUSn1fqp1CwicdKChsK4B7icW3uEtfb4KqjhB
 Que7Ep5Jrdcd+a7dEQjXXnWiiOdA15kyNLXvADSuD5TVW0m/l/MkacLBXh+rWI2z5pZZSIxZeCD
 e4j6curJ4CbX6b0d1I9ydXKyBKrwHzoSKx2YA6BH3pRb6JGztl96eNNrOFFo9HWgOzNeWnfNcTa
 fLXVadQPIDAnbXjVUCg5K9K7sLvnhs95epnjjPVGHqAVu6577paBBpFJQcLIjLvzxL7VJQPh0T7
 TKqfvFmy/IB424d0LjW8qFgfUUr8LVgpj89OGwBhDA51MtiyG/nxM/NrecVTXvRYbLSWrp4fNsf
 wWoO/Gud
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c0c22e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=nExbU_x0mLWtth5-Sj8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

For drivers that can transfer data to the TEE without using shared
memory from client, it is necessary to receive the user address
directly, bypassing any processing by the TEE subsystem. Introduce
TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT/OUTPUT/INOUT to represent
userspace buffers.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Harshal Dev <quic_hdev@quicinc.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c   | 33 +++++++++++++++++++++++++++++++++
 include/linux/tee_drv.h  |  6 ++++++
 include/uapi/linux/tee.h | 22 ++++++++++++++++------
 3 files changed, 55 insertions(+), 6 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 0b4c65dc14cc..c21f1909ed17 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -350,6 +350,17 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
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
@@ -418,6 +429,11 @@ static int params_to_user(struct tee_ioctl_param __user *uparams,
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
@@ -618,6 +634,13 @@ static int params_to_supp(struct tee_context *ctx,
 			ip.b = p->u.value.b;
 			ip.c = p->u.value.c;
 			break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
+			ip.a = (__force u64)p->u.ubuf.uaddr;
+			ip.b = p->u.ubuf.size;
+			ip.c = 0;
+			break;
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
@@ -720,6 +743,16 @@ static int params_from_supp(struct tee_param *params, size_t num_params,
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
index a54c203000ed..bec9a918b950 100644
--- a/include/linux/tee_drv.h
+++ b/include/linux/tee_drv.h
@@ -82,6 +82,11 @@ struct tee_param_memref {
 	struct tee_shm *shm;
 };
 
+struct tee_param_ubuf {
+	void __user *uaddr;
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

