Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02E42E228D
	for <linux-doc@vger.kernel.org>; Wed, 20 Aug 2025 23:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755733149; cv=none; b=GrtZnNON73AncQ60i5fcLl53aBdz/sNjhu9A1tMQ5ePpiM5BNozF/6JzaJIrxvzZBdt8TNqI2gP0HSfbSjl9081CSQz/sUKctW51JSUII0U1XaciUXKVN83j+i4w5XNzmZzMMK744eCuHhFyX1vRPXZsRuBA3/I0tHgqZnDUYZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755733149; c=relaxed/simple;
	bh=8TSbhEgUPN9kdxwy9KCMFyUVP58G/S0fhvuvLlT55sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ts5tpH4gFCIvAbEeibyDCMlZmivuJVcpDmr/rB0q8vQHhxYYn3Vk0x3bFDcqqr6m86OnHXkdsaDAP+6lkSpfCskp09aw7BXjxJa/q00rjOlZn4VZWY/w6+WHXlT60oO7F7IW/W4jEIVqVdita8n3J/n1A6wP+DcCwwAPE8e6hqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UUohvgVA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UUohvgVA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KKGlh5005872
	for <linux-doc@vger.kernel.org>; Wed, 20 Aug 2025 23:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kjXvseb+vxS0ErbDImEwiyaXgCwIyoxRM6Sfo6q8WkU=; b=UUohvgVAC6/xeBx0
	nF9dddAlvTdXBpQPclk9dzrpmCD2+oqqo+Uo67Zyci1m042Roh4vvXjEphIPRCnC
	xBo3E3WdSEXGrSAnumZwrMm7+emvHFW3xNMfV6j9JQcJPlqClFdBpK6OvPohHK6a
	p3BUYaTRLQoC2gkQ2+ZzKP9vU2idHGb5wDD72/7MemqPsjOb8OzD/jwQYWuGiFh5
	wwOFk6XMKScxpgWJGRiUlmOh5RG5DjuU8PQZW43DWCzfULV+1x3OfmTKIxNIRWoS
	71beTJTVz2hNxW8Zx3ixgME44f21ENFxquT8QZa/G8Z6mldeht3oAu7y+EM3sfGD
	8vrEAw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52ckcrj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 20 Aug 2025 23:39:07 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76e2e8bb2d2so399262b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 20 Aug 2025 16:39:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755733146; x=1756337946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kjXvseb+vxS0ErbDImEwiyaXgCwIyoxRM6Sfo6q8WkU=;
        b=JDvY1PyE745q8PB7lqBTj55Jk8D2jww0cAKlOV6dMU0Wr9Dz6YBT6zhop2J2J2Ph4l
         sMm1Ra1jv28/8GN9jXmC5R5EZhA73k7LnJBIVFLrZZ7DZWxNoFkKXsJnJEufuXXIjgRT
         MuOKzBEGRPLmzabVdpc9ggQBTN/uUIHa2IXurYK4ZfHr/93d+DxZPQaS+b5SaVntO4WA
         U4sCLxKA54rDDog1QeSfX3vrnjfJU1abpbhlWT85qmaV61JeR6t1DNaHkgg7GaiVkSmR
         fIZQOF7+8pft7a0DOvx1488ctp9TkPhHfANd05wCHAox7h+Ye9UeHZxyu58Pky5Q+T7A
         XPzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUcGMG4xV4sbpMUZ7rWip4Fd3S4FcBPPvNOaut+JFzQx1TLaJ8oFFCmyaGT36dEYaQcnW/kViG5ZM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQW/OSr+e04yUlyIYlWD2aQeCW8xuMhyBNfPjAi04EKCxWcisf
	4abnbCQ3ACjXMoUn0j/7V0Ha1Iw0EL2qbsZVEtMqoZkZiJnnIhvOZX3W+YVqKpbDnbFlU/NaoVp
	EdMy5+qDBu7TKbi3q76//4c/v71CD15BRuZ1M2rT0MkJXMqqtf/YjIPnYWC5vkg==
X-Gm-Gg: ASbGncvnXyV70qAPNGn6UEGMDsXcqFwYxPfOvd4R3950wqje1gfC+KQGWPyynG5dohf
	N3l325nkKqvIYHh5Tx7VFVS5ZYG3bwtljV7cbYEdpN7vjIpxiLyImJKt/bBBM1JQrsOH05PYYho
	0u8qyoSgkSfMBW98G+ZptiPQzhcAEPm/HONutvb6kdheDC4w3swxQN9duWOyBVzMPHsjbtasszl
	PJ8cAws+/X6QJiTLduRVSNdRP8keVOBTIoKT1c5jzIsA3VWyYwUioeAUa2uKZSmh52hchKAOzXO
	PyUwpZio+gc9c1x7HR184lSopAGetzGsW7fXJk2qdY8b6cMEb2riOCzF9p98j7FnwGQdkmBlVT6
	t/kCn7vcV/SniwU0mdE4liTI=
X-Received: by 2002:a05:6a20:3d88:b0:243:78a:827f with SMTP id adf61e73a8af0-24330b8dcbamr357834637.55.1755733146270;
        Wed, 20 Aug 2025 16:39:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEW+KaAV/nBrLnv/qlXOwf4dct+JxrcsmBBWHr84rfokHUyeJCKYtrKukW6uPfBBauTFRM8aw==
X-Received: by 2002:a05:6a20:3d88:b0:243:78a:827f with SMTP id adf61e73a8af0-24330b8dcbamr357794637.55.1755733145802;
        Wed, 20 Aug 2025 16:39:05 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4763fbc711sm3233028a12.2.2025.08.20.16.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 16:39:05 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 16:38:49 -0700
Subject: [PATCH v8 02/11] tee: add close_context to TEE driver operation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-2-7066680f138a@oss.qualcomm.com>
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
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: d8c1RJR7Ij1J000zvFgjroxj8aL3mR8L
X-Proofpoint-ORIG-GUID: d8c1RJR7Ij1J000zvFgjroxj8aL3mR8L
X-Authority-Analysis: v=2.4 cv=Xpij+VF9 c=1 sm=1 tr=0 ts=68a65c9b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=0l_YNDiMcOfTHwIteTYA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXyd2k2dN+ZqqQ
 AVElFNmIluS2P5xnvdgxgigR88089xhVSFQVtcZv58DskqhSLrQKAXDkEKTiV1fzGPrtMyq/DJ5
 iPIb9GrVp5lolt/3RE8zBd6z3dYtKb0+A6REiA2GFPGbiOZPqAG9cS0eCEjajx8Fsy6+tZjM62W
 NEKCINciNQOgsH1HKeo52/2JOlJ0PVOllJ/ftl0V/4Jo5yGOVO/IgIqtwEON9NkWKG3m/xf7UMk
 QAsB8uiLSdYs/lOifE1Lw3NvTWz44FheqXvw72fIllRg5Pq1Mt4rCXvuJgSdI15kn8KO2/svzqM
 eYbBBfvtrWMMuCeA2L7p4/hG4O+svuceEGDFuzGUwwVPWOpfPm1QCyPqbGbiq2U2t4+9wRYSWFq
 ngyMBkXDRSGTpGdHyUCcGbuHvJ2aGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

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

