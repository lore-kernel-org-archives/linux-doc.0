Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820862E11B6
	for <linux-doc@vger.kernel.org>; Tue,  2 Sep 2025 04:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756788979; cv=none; b=b/xsHNt+imnKXOpNXxq8Hd53G9k0yyfa3mhWhWabonJBYxQmOtx9BFBN6cvuSlkAYhfpofl3WNkOF6Lai6OjZ1RWWlgThSw4SSV85iw0lBMduzxsb2BNHGfPCx7caw5Aa0p4mhUp9JckpLaCXZaWMH5SfdEDPIQT6+Z2D7xOdjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756788979; c=relaxed/simple;
	bh=8TSbhEgUPN9kdxwy9KCMFyUVP58G/S0fhvuvLlT55sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mO++ncG1Pipp6eZcvdb8LUiwoMbSWGriyiBeCdI5tXe+mFumvDxvkxvGSntI1sGYpmH6InyIcwMIe+KCvDxLCgWlG3euc9YaEhjjBhzN3nICQY6LXuY3gHNFVZ5tKv4EVEUDupBUyffU2sgo+jXe3Br/7OVNkVWUYG2yxPsYWOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iIfFW0I3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iIfFW0I3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822Rtft015204
	for <linux-doc@vger.kernel.org>; Tue, 2 Sep 2025 04:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kjXvseb+vxS0ErbDImEwiyaXgCwIyoxRM6Sfo6q8WkU=; b=iIfFW0I32F92zUsI
	ILJcSCTxOouSkhrRJRtciOCFo+pa9+ynYfOrU/YFKKBXVqSjskCGgGmnqfVgZ1vw
	WOp9aMSHyyEUjG7uiWJ9oomm9Me1CEcig5uhb/jbEZY+5EsS0nz/uy+/52npY7GA
	EPQ8PfQs7HUfCAzs/MOZejO/VJfhqMAH0M4j9cqJBV03saN9bGCetvmPvy3TQOHz
	rlrFYwS3oGlJD2E0kIeD9+6KoeRZ3jtPFR2g3c69XwiScq9AGnh9/GVz3Vkg009v
	OrJ8tBCyT+6KDYybgECBw4sUZzb/9HzFeA0zISw2h/ARoL3fgzkVFv83O8jgrD12
	3K/3yQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urvyxhpy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 02 Sep 2025 04:56:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2445806b18aso57274825ad.1
        for <linux-doc@vger.kernel.org>; Mon, 01 Sep 2025 21:56:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756788975; x=1757393775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kjXvseb+vxS0ErbDImEwiyaXgCwIyoxRM6Sfo6q8WkU=;
        b=HD5zHsJlZoYZ/dP6y9TXfhiKcnm6nLaELcjjZ4XnaASDpaCN41H1HBRCIUyfoRGk0Q
         pctUF18WUT5+dpEwrjDunRRVBnuAr4t85I4+2TnhRH3hp+GC0pb1s54x5Zs8u4SP6kG/
         UJlVMQWUINyJiosbRa/2BYEXKSYH3iGK8k0vIUELEKzjaOriujgOYmgHPp5wJxqzSS6z
         9cHlNvoT8sLkfz7GTAdUEJ0QI9FwEmcl4w6guGPwWSclMdV2nGzoB7gkqQrsSCroEyWk
         INX+0dKaH7oT6uF2H9pcb3hyXYLu7V7WeRrXwmFX3VBWynXAer47gY9CRF3sU73GZh2o
         LJPA==
X-Forwarded-Encrypted: i=1; AJvYcCWdbugz4dd88zqNf/mbcug/7VYBQVla1OeIIvhr4/cebGZQa8h1IhoA0BKTqT3qiAKsWAjfz3ATP7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTwNWdBeUcwTEomd86IO6Bq5GXd460eacBkmPl/PxlQytevdnU
	hvtAHZkzw0EIkpLtLuFnF4lQ6gcaFPCF0PHGpJ+SlMU0380ZM5Xu/sx/C1XPkstyssL+UCu6614
	NQ2TlXPja9wQ9jY3IJBWDuzBc9XJYi5luIn5R263mQCI0NEOMFMQbBEeHZiwPQQ==
X-Gm-Gg: ASbGncvmwpI7kWpOzI0+v57dO1EusCsfWGfDQ6ZMpDNgCig3HkP7scjKMQuxCNGThhT
	7D/UuFpqSKzZIwtJRz41wlG+QMYxz51UV215RHlF7057INCe17d6RyYDQa0kAB9LqXsh0kVVhqk
	OiXtzkXE7HpiYDm9o+ceJ6XbdtOFi6OrFK6fQAViWm05IYlmzFHPaMs44xcFZU/cgFGTnsC9SfX
	f5nAPuzDjmkk08zp/Cmb8KZSjs9IpWpBmunfWgela7puqSAMpQxwBrkqCbqoc4YuO1VHzqbNMqG
	kk+C4S/QGycz/e30YJn9gegV/DU0R5NT3i0DuZqh/jqzWO8AYmi/8e6+H9QLrk8QljRfruovVNv
	qT932iAvNnbkL/WkqnOqMMdo=
X-Received: by 2002:a17:902:e751:b0:246:b467:eea9 with SMTP id d9443c01a7336-249448f7469mr129860555ad.21.1756788974339;
        Mon, 01 Sep 2025 21:56:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH77S9mvbvLIaovZEBD4/4yt6zu0c+XmESSaejKdDoCP87UwUTgmY3MMpN0CUVuhTsR1O0bwQ==
X-Received: by 2002:a17:902:e751:b0:246:b467:eea9 with SMTP id d9443c01a7336-249448f7469mr129860145ad.21.1756788973822;
        Mon, 01 Sep 2025 21:56:13 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b1f30a63asm1795345ad.66.2025.09.01.21.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 21:56:13 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 01 Sep 2025 21:55:49 -0700
Subject: [PATCH v9 02/11] tee: add close_context to TEE driver operation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-2-a2af23f132d5@oss.qualcomm.com>
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
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: JcmF_rMOYf4hcNj09RlP1orn471PsM6g
X-Proofpoint-ORIG-GUID: JcmF_rMOYf4hcNj09RlP1orn471PsM6g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX5SmFujTcfQyd
 ll/I9Q/i+wTxsF87+2loESQp2vQ/7EVbQBet7Zgct5bp0N3dyceSJMwKm7cjpRvCwGel0g40uCv
 +b1ozY04mWLtVHL9y3aX5wg28XPyG/UXQKbldLiCHG2Wpw7PgChxo3mTZLgIMlIFlO+LqUeNENV
 VUjKsJMFIFX+Dtqc70cHsKh2RkIukK4Y0ThIVzwnN0hd9/BOFBj56cHfQ5qffRERyvwYArgQ8Gx
 oMeh7EQA6mSWf1MJavivHqWI9F1VTDFoPoTAW1aUI8ppz5TFCNFHmjfcAbM/B6EzMoHZ4X6bb9H
 WzoRTH5NXmQD8KornlJpofhsx+nIRGCLb+vJ9jM7LQkQrn7e63H2EreiBQ7C+bCmKmtAWojSHjz
 5CYN/UPh
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b678f0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=0l_YNDiMcOfTHwIteTYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

The tee_context can be used to manage TEE user resources, including
those allocated by the driver for the TEE on behalf of the user.
The release() callback is invoked only when all resources, such as
tee_shm, are released and there are no references to the tee_context.

When a user closes the device file, the driver should notify the
TEE to release any resources it may hold and drop the context
references. To achieve this, a close_context() callback is
introduced to initiate resource release in the TEE driver when
the device file is closed.

Relocate teedev_ctx_get, teedev_ctx_put, tee_device_get, and
tee_device_get functions to tee_core.h to make them accessible
outside the TEE subsystem.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Harshal Dev <quic_hdev@quicinc.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c    |  7 +++++++
 drivers/tee/tee_private.h |  6 ------
 include/linux/tee_core.h  | 50 +++++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 55 insertions(+), 8 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 33091aa21be0..0b4c65dc14cc 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -79,6 +79,7 @@ void teedev_ctx_get(struct tee_context *ctx)
 
 	kref_get(&ctx->refcount);
 }
+EXPORT_SYMBOL_GPL(teedev_ctx_get);
 
 static void teedev_ctx_release(struct kref *ref)
 {
@@ -96,11 +97,15 @@ void teedev_ctx_put(struct tee_context *ctx)
 
 	kref_put(&ctx->refcount, teedev_ctx_release);
 }
+EXPORT_SYMBOL_GPL(teedev_ctx_put);
 
 void teedev_close_context(struct tee_context *ctx)
 {
 	struct tee_device *teedev = ctx->teedev;
 
+	if (teedev->desc->ops->close_context)
+		teedev->desc->ops->close_context(ctx);
+
 	teedev_ctx_put(ctx);
 	tee_device_put(teedev);
 }
@@ -1001,6 +1006,7 @@ void tee_device_put(struct tee_device *teedev)
 	}
 	mutex_unlock(&teedev->mutex);
 }
+EXPORT_SYMBOL_GPL(tee_device_put);
 
 bool tee_device_get(struct tee_device *teedev)
 {
@@ -1013,6 +1019,7 @@ bool tee_device_get(struct tee_device *teedev)
 	mutex_unlock(&teedev->mutex);
 	return true;
 }
+EXPORT_SYMBOL_GPL(tee_device_get);
 
 /**
  * tee_device_unregister() - Removes a TEE device
diff --git a/drivers/tee/tee_private.h b/drivers/tee/tee_private.h
index 9bc50605227c..d3f40a03de36 100644
--- a/drivers/tee/tee_private.h
+++ b/drivers/tee/tee_private.h
@@ -14,12 +14,6 @@
 
 int tee_shm_get_fd(struct tee_shm *shm);
 
-bool tee_device_get(struct tee_device *teedev);
-void tee_device_put(struct tee_device *teedev);
-
-void teedev_ctx_get(struct tee_context *ctx);
-void teedev_ctx_put(struct tee_context *ctx);
-
 struct tee_shm *tee_shm_alloc_user_buf(struct tee_context *ctx, size_t size);
 struct tee_shm *tee_shm_register_user_buf(struct tee_context *ctx,
 					  unsigned long addr, size_t length);
diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
index a38494d6b5f4..284ca6b3e03a 100644
--- a/include/linux/tee_core.h
+++ b/include/linux/tee_core.h
@@ -65,8 +65,9 @@ struct tee_device {
 /**
  * struct tee_driver_ops - driver operations vtable
  * @get_version:	returns version of driver
- * @open:		called when the device file is opened
- * @release:		release this open file
+ * @open:		called for a context when the device file is opened
+ * @close_context:	called when the device file is closed
+ * @release:		called to release the context
  * @open_session:	open a new session
  * @close_session:	close a session
  * @system_session:	declare session as a system session
@@ -76,11 +77,17 @@ struct tee_device {
  * @supp_send:		called for supplicant to send a response
  * @shm_register:	register shared memory buffer in TEE
  * @shm_unregister:	unregister shared memory buffer in TEE
+ *
+ * The context given to @open might last longer than the device file if it is
+ * tied to other resources in the TEE driver. @close_context is called when the
+ * client closes the device file, even if there are existing references to the
+ * context. The TEE driver can use @close_context to start cleaning up.
  */
 struct tee_driver_ops {
 	void (*get_version)(struct tee_device *teedev,
 			    struct tee_ioctl_version_data *vers);
 	int (*open)(struct tee_context *ctx);
+	void (*close_context)(struct tee_context *ctx);
 	void (*release)(struct tee_context *ctx);
 	int (*open_session)(struct tee_context *ctx,
 			    struct tee_ioctl_open_session_arg *arg,
@@ -154,6 +161,24 @@ int tee_device_register(struct tee_device *teedev);
  */
 void tee_device_unregister(struct tee_device *teedev);
 
+/**
+ * tee_device_get() - Increment the user count for a tee_device
+ * @teedev: Pointer to the tee_device
+ *
+ * If tee_device_unregister() has been called and the final user of @teedev
+ * has already released the device, this function will fail to prevent new users
+ * from accessing the device during the unregistration process.
+ *
+ * Returns: true if @teedev remains valid, otherwise false
+ */
+bool tee_device_get(struct tee_device *teedev);
+
+/**
+ * tee_device_put() - Decrease the user count for a tee_device
+ * @teedev: pointer to the tee_device
+ */
+void tee_device_put(struct tee_device *teedev);
+
 /**
  * tee_device_set_dev_groups() - Set device attribute groups
  * @teedev:	Device to register
@@ -315,4 +340,25 @@ struct tee_context *teedev_open(struct tee_device *teedev);
  */
 void teedev_close_context(struct tee_context *ctx);
 
+/**
+ * teedev_ctx_get() - Increment the reference count of a context
+ * @ctx: Pointer to the context
+ *
+ * This function increases the refcount of the context, which is tied to
+ * resources shared by the same tee_device. During the unregistration process,
+ * the context may remain valid even after tee_device_unregister() has returned.
+ *
+ * Users should ensure that the context's refcount is properly decreased before
+ * calling tee_device_put(), typically within the context's release() function.
+ * Alternatively, users can call tee_device_get() and teedev_ctx_get() together
+ * and release them simultaneously (see shm_alloc_helper()).
+ */
+void teedev_ctx_get(struct tee_context *ctx);
+
+/**
+ * teedev_ctx_put() - Decrease reference count on a context
+ * @ctx: pointer to the context
+ */
+void teedev_ctx_put(struct tee_context *ctx);
+
 #endif /*__TEE_CORE_H*/

-- 
2.34.1

