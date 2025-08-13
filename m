Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25DB1684A4
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 00:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755045427; cv=none; b=X5LMpR0D4mZXdfMeAx8J8c30J0L9Hr6jgLzSzj92bxP9Sc4fAbkNFWNf0aeCllU80uXK7smOP4Dvlgi0YqeYUdHpokDtU7IJDz4005W3VoCDpgKOp68bpTqbRLk7HZcxyW4eUVJ7TzbEuTMyIm1n4yTABYA+bQ/iu3LRE3gyXjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755045427; c=relaxed/simple;
	bh=mt1SY7lqZqYnHX1E1eZtjcGPUdWHsqyRxnqhxA/coPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mtzgypawNYRgoY3I6vyKQdHcvh6qxNjuAeJE9r2MurQ8gd4+X74hhMYQVXZKOHC4J3mopSTvkIjcUJnHsyAyN9N3+R1YuGrCHwH6TRcegk/8Omo6aqY8ClKr5wanclMk4MGT+9B2RRULHbNcGVxhzZI9KVij3n8KASFRfwZJVLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iSrju8JU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iSrju8JU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CKBP26002363
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 00:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dkpk3kW35s+rQ8xADVAl+s3707K3KzYCGbupLzI7XSs=; b=iSrju8JUSKSLlTzi
	i32ZJqSum2kUg6GDGgcVFyJZrUyfoDf7u1dMyiKpHZFKJvOdelWsqzi+1klf80y1
	HzJ1o9eeIlxAMFuXF9xPPxNvGrKCpxMW0fa+CmtKPcEBiMEz9nlGvgcvxowZXZ2b
	5559nNS6vYIinQUdFA0Xj3K97+dZvqck/YBwCAcbrGyFOHVAJERmdb7jyPOmww+u
	fdQ5aUSfGly083os4RzSPtfh3m7LHqwV4YldA4QidIS9aaqLywYD+NzDmC2iMGdF
	8VQFQE+gmJsRXHcYHGXtcfLBi2lQXdQw1IyDZtf/ihab3nQff8BXiRq4pQ8VRsIT
	ocue8Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj49x83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 00:37:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2403c86ff97so88939415ad.1
        for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 17:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755045424; x=1755650224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dkpk3kW35s+rQ8xADVAl+s3707K3KzYCGbupLzI7XSs=;
        b=vwP/tSjWIoKlNaju5jvfKNyJnl/wKRr4z1nEXzjXGnmbrE94QUQ3Lil12D8abSBK7/
         p4wWe7b93+38/63EB6232rT24RH5WGfAE0MimgIDzVYGTOLNPm/GVzShQCwGWtLIcLUy
         oMrXsxBKDyWLjDClwv9Mg/pHh/pSscGcbp+kXHrt+Y12niLPejAFn/5eVvWe7aPqv+DY
         srGxkIAesXq9fFKMKXQgFv2VwtWYjzXsGC9Qr4NzBi9GzUvGsxQn56SacSTxZXlmnFnl
         DNQELM0x5f8+22D/Sbng+6XTd9XSKsNnJwe5u8EvpBvDQsyCSnrkHFzXxBR4DSn/jAPm
         Wjeg==
X-Forwarded-Encrypted: i=1; AJvYcCXcfkmEGuN8qw1DnhE5M4e/hRrKrC9dsZUaN7gGvLtMH0FTbXi+zaTRz/v29P3aUYMoZmEZfH4HqjM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFwdIpsmKHvWm3LKXMr4XTYB9PKiePiH0Vr4VYFACPn4LehcwL
	3mAwqxpelJPv5BQw59vr6p2GViJZTUyXXXgJo+JZAIpuSkTSL/MIUSpHM2SGJhQzo26qnxCgyy2
	gWXYmzoaLyyaz21LaL4iiXoha80ByKW7O2sqi46E/eH4462pmWisMVr9jfXIpPA==
X-Gm-Gg: ASbGncvVJHTqtrUCat+77ZO+4lAOqoYH3jCCKM4PrIr8K9/P9rUX3qm0029rYOO6wN5
	P3rKFbJ64YC8+sUDwNr+5+hK4TcSgLGJTGhfbpBWvqbhYN1hGzhyweFB+EWBad2Diwv4bKguU3V
	tVoqACtDL3C3rmKutmVnV3IS5kykP+eLxoBmo/N//9OC5mATj93HRMg5uEw6SRRrn+DVxATil3N
	j38uChOFPsz4j6Msb+1KgaKKfg9EVnDL3BuTdH0qty6FFrAciDDBTRw2GSsxFvQ6/CLcsN/swXw
	77jJG+Ph24wO7y+H8fI5Uy+Ik83HT5SLTiDdTdO8UTIcD0MoWLHCw4Z1DzKoES9/1DUZIZAhh+y
	8D4sL6HgUfLgQEMvJ+TvTwsg=
X-Received: by 2002:a17:903:950:b0:240:1850:cb18 with SMTP id d9443c01a7336-2430d21d9bbmr14926905ad.53.1755045423896;
        Tue, 12 Aug 2025 17:37:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlF2c43SwSVVhWWTZ6CHor0ZMj81pLl/B1nnCfA8wdytLkLOsLfKHZLinf738/FTtKf4T0iw==
X-Received: by 2002:a17:903:950:b0:240:1850:cb18 with SMTP id d9443c01a7336-2430d21d9bbmr14926445ad.53.1755045423391;
        Tue, 12 Aug 2025 17:37:03 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8975c89sm308781585ad.96.2025.08.12.17.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 17:37:02 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 17:35:32 -0700
Subject: [PATCH v7 03/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-3-ce7a1a774803@oss.qualcomm.com>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
In-Reply-To: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfX7X6jzjQgQaEY
 U2CY8MzgXj0xtvM0hLSw/IZ3DbBJ3oeCXul0CPsBNpBgCRplKlLKOKKRuigcC6i0eDNG5ofbmlM
 yO0iPhieG3bjbY3CrWitJ7fUL087bE+i3I4sFezrs07BluomMgR4InbY+04/XlrmPBejgOYk+uJ
 WYpykE7OLTJZPo4VpsiQemfdSk0GcClVI3p78LpYGS25gAUeRLYexJKctFxkPEFP5XvXxMUZQ5J
 3iCWvP90SZOb2Zmxq6J3ThsPOk2syrVBqFhTa9eI4Zo5jxgAiHNXbRBYL8BRy1dZg/PRuBsc0i4
 W4ajGefBzq3onCYjRBH0ENnN4zfl5djs5pel5dcV6G5KgYugZPDVbbV622m7hpa0DdN82Od4CAT
 bxZcET03
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=689bde31 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=nExbU_x0mLWtth5-Sj8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 67KmbRyQIvZy-pyXLJCmqA6g4ZBrI4WZ
X-Proofpoint-GUID: 67KmbRyQIvZy-pyXLJCmqA6g4ZBrI4WZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027

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
index a2b365bcee51..b84655b47256 100644
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

