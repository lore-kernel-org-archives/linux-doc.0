Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473D62033A
	for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 00:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757463081; cv=none; b=q6g8zgeQ/RggHDXMyCn88YQWqVR1JAaMbEXt4/9dGOAqRr2CxzJGDV7sggK62FbGKV3N04//6JOq893goNfLM72nvvfAD3lMgNChdjopDZz/HR32SWaB7Gzd9WhXMr4c2cohERiho4hln+lqUrEHZxEWe3i1xRBcsKn5URl1qCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757463081; c=relaxed/simple;
	bh=ONUj9YuvVgtL/osizZ1m5+rfDER5Pg6/BX9ljc3V5eU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WQ3HMFxN6QnWLO0Rf4siDFsNglMUQ0yjTVhVMJhoUfBM3+WStwsapJZHUCTyw/bOFZNrdjiaIaBIDi0MPbio78d8vh++be/3NE2XdCHiiZV4IWkaCtpG/o4i86NBV/5AZa+LR90h95FCyYkg6X+bzEnrLO/qdEkjCDyLyd5xWHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XI1T7lHy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XI1T7lHy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589HqjuB003672
	for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 00:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jFpVoHgd0Kv1eDQsqTgiYA
	sqE3K27Ovfdi+4AyDrDPc=; b=XI1T7lHyTAWs8BzJdvkRrP8RHC3k6im8O+2ho+
	vNMfna8i+sWzy+UHW/m8yOLVXbgjOGR8KpVcgdoDYMh9lu4NP7b3oX0gSq+2xXiz
	GeqztB/JUAhHEnXvEov5e081xBG3egn096/mz+r7JyZpqsBmJEdPuHzLGoacjAS7
	dfyY2Ojl2aQI3kQC1Db+uagYrgZQjVn7oGKNoGEkwvUdpmSiMv8toUaZP4ftB6v1
	3VXRsqEYIe8Xg65lGJ8eNU97fp5gyLdNXDW4ci0wkCiVh1ZaJu9Durhf4bpAZrKo
	rop9vkpj5MPt3oJYrRDFO92lPPtbqGYqJMYkZa5oFlqMVhzA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapjag2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 00:11:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24cda4063easo83835575ad.2
        for <linux-doc@vger.kernel.org>; Tue, 09 Sep 2025 17:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757463076; x=1758067876;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jFpVoHgd0Kv1eDQsqTgiYAsqE3K27Ovfdi+4AyDrDPc=;
        b=xDnx8R9lVVCcVvTWT7L1QPei0wc+kZIKi80lyZjhPIl9pTxbE6g8T1n7XTyc97aQZJ
         vbhBmFLqj2Po5zfZsNpZBJvOjkMki8UdMjLvtt7xZnrtpsejdAyLx58/+nHfskTgvu1s
         +wWRJVAK/dqtSE9wM8robZ++Fhsen0IjTTxe4z2Ajp2TKqQ7L6PtQ4vLVa3S0pZdy+mU
         kXzFjBIVzuSFbe5lfN5L7/lK43G+iv/mMZ5195j25CsF4TAW144Ud8T375A8PP6Uwb3i
         T24BqkCFJFB4L4sTw4kxXog0nbThNIlkhaJ41KbE5fpyIed4IyYj8YK6C02HMp9ZOb28
         kakA==
X-Forwarded-Encrypted: i=1; AJvYcCWuwjAgAT4AmYcvx0RKxcF2T5rGP7SHXJvhE1czcLlJiSkhiX8Dp3ehiq0zVTpA3HwpsscGCOpKF4s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/16JMStrA1gO6T9ezRvmbR3H7CEwCwLLvHJLwuJhTeoaSNg/w
	f7VIAFjltCNaKZBQT0mZ/vmT5EUMbv4xitzbAW1vddtryutpEdh+JZ00bBGhth5J8VrXh4gcJR3
	x4AMErNG9Se4/jsEiGIlmBR1RFd2uAkWze5bDT9gIlk4mmlyXcaZB9btIqpHN6w==
X-Gm-Gg: ASbGncvShes2n9A7DipQrkAP5QbwMdo6CHThlHSu+jreSBzNGv3dycjQTZyIU7ZOtuL
	zmx7zQ3czMz1BCj8pr15LiAz1WkYyV9PmGx4vUi3k6QaIB14cCs9hThUO9Oc3DC6c7kWRpN45Ji
	+6jzu8hq+xGp5aNr0tVI2Dr4+cXNYfAgjvNtm+2GkwTouMmLlpfO2Cim2lGRXU5ZWNpl5XhTX+v
	Ot74Fq3g3/as6/dfRm9jKYlaTz5zjYamsRa4rzXzsQ3E0RwR5eUFKOeX7Z/26fH7v1enrqhuYGh
	DI4xprg7VzERR9jSi6Ge0Sx1RYgVjF5JFdNYwgl7Fjd3es6XIdOXKO8wXBekTGg8XYUMLXsQCHx
	84fhi9YmRrkaxgNDyHHx6EKI=
X-Received: by 2002:a17:903:19e5:b0:24d:6f65:7a91 with SMTP id d9443c01a7336-25171cbfe5emr195303865ad.29.1757463076245;
        Tue, 09 Sep 2025 17:11:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiBOCGrjDfaQx3eQmuWGjbM8k6kUSKqmsXf9ORqS92+AWuiEPW/gTySpMQGnWREBEdVe36gA==
X-Received: by 2002:a17:903:19e5:b0:24d:6f65:7a91 with SMTP id d9443c01a7336-25171cbfe5emr195303465ad.29.1757463075571;
        Tue, 09 Sep 2025 17:11:15 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dab6bb655sm1285672a91.10.2025.09.09.17.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 17:11:15 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Subject: [PATCH v10 00/11] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
Date: Tue, 09 Sep 2025 17:11:02 -0700
Message-Id: <20250909-qcom-tee-using-tee-ss-without-mem-obj-v10-0-20b17855ef31@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABfCwGgC/5XRwWrEIBAG4FdZcq7LOBo1Pe17lB6M0V1LkzQxS
 VuWffdOFkoKbcBexBmc7xfmWiQ/Rp+Kx8O1GP0SU+w7Kjg8HAp3sd3Zs9hQo0BAyelgg+tbNnn
 P5hS78/2WEnuP06WfJ9b6lvX1CxMKnVJCQom6IOtt9CF+3IOenqm+xDT14+c9d+Fr978JC2fAQ
 gnoA3APXJ2GObrYuSONF2vGgt8uvcp3kVystLeugUbI8NsVmytQ57qCXB1kqUELNNic+pSOw2x
 fabzdcLnhEk0uLglXlkuhJFjl6h283PASVS5eEk7L8QKR11BXO7jacM1FLq7Wn1c61LqR3Am1g
 +sNNzx7l5pw57XlVmtpQOzg5geOkIubdaGglDIQuDB2B682vAKei1eEW7QBBdnYlH/gt9vtC5g
 lmYzAAwAA
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
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuldeep Singh <quic_kuldsing@quicinc.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c0c225 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=hlSAHII3iifkWu_GNqkA:9
 a=D8jLBtTEXUNSpw3P:21 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: qT2BD6ffrvRi7CXxOOrzHH-AtAzw_z_k
X-Proofpoint-ORIG-GUID: qT2BD6ffrvRi7CXxOOrzHH-AtAzw_z_k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfXxIK+l1RGIKnX
 NekC0+JuGUA3uArTauKTUkweAdKX3gUfevZZkaY/+vPOhcwOHVyB0aQrFYoDGr7BrRKIGrvgoAo
 ruWroArvrXYWvVsbGz+fDciTNf8Kr5tsMKsleBKEDAOl0INNbHRgMWwIRJwPZ6iD+JLYByq7Zhk
 AaM4DDHgFYA9XNlg2nyNRXqCMLPs5WLkNuy6pF+SbyGiY+VsCJl7HX+JtRfFWGEHHF6j/27s4Dv
 0uunAFMg/UDFSaoqfA1oeEFMJ9xMa8DxhmvlT4NBJ410mh7MqZ6SYuwgjjRxd5jhAEbMFi8vCsH
 Dbmo0qSb8KafVnWNeU4jUvHfNJ8zcA2T8UhZ29jtMFTbcpAE1+Axi9NqpcJEyov+0Ll0SOROIkP
 ZNCD3f1E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000

This patch series introduces a Trusted Execution Environment (TEE)
driver for Qualcomm TEE (QTEE). QTEE enables Trusted Applications (TAs)
and services to run securely. It uses an object-based interface, where
each service is an object with sets of operations. Clients can invoke
these operations on objects, which can generate results, including other
objects. For example, an object can load a TA and return another object
that represents the loaded TA, allowing access to its services.

Kernel and userspace services are also available to QTEE through a
similar approach. QTEE makes callback requests that are converted into
object invocations. These objects can represent services within the
kernel or userspace process.

Note: This patch series focuses on QTEE objects and userspace services.

Linux already provides a TEE subsystem, which is described in [1]. The
tee subsystem provides a generic ioctl interface, TEE_IOC_INVOKE, which
can be used by userspace to talk to a TEE backend driver. We extend the
Linux TEE subsystem to understand object parameters and an ioctl call so
client can invoke objects in QTEE:

  - TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_*
  - TEE_IOC_OBJECT_INVOKE

The existing ioctl calls TEE_IOC_SUPPL_RECV and TEE_IOC_SUPPL_SEND are
used for invoking services in the userspace process by QTEE.

The TEE backend driver uses the QTEE Transport Message to communicate
with QTEE. Interactions through the object INVOKE interface are
translated into QTEE messages. Likewise, object invocations from QTEE
for userspace objects are converted into SEND/RECV ioctl calls to
supplicants.

The details of QTEE Transport Message to communicate with QTEE is
available in [PATCH 12/12] Documentation: tee: Add Qualcomm TEE driver.

You can run basic tests with following steps:
git clone https://github.com/quic/quic-teec.git
cd quic-teec
mkdir build
cmake .. -DCMAKE_TOOLCHAIN_FILE=CMakeToolchain.txt -DBUILD_UNITTEST=ON

https://github.com/quic/quic-teec/blob/main/README.md lists dependencies
needed to build the above.

More comprehensive tests are availabe at
https://github.com/qualcomm/minkipc.

root@qcom-armv8a:~# qtee_supplicant &
root@qcom-armv8a:~# qtee_supplicant: process entry PPID = 378
Total listener services to start = 4
Opening CRequestTABuffer_open
Path /data/
register_service ::Opening CRegisterTABufCBO_UID
Calling TAbufCBO Register
QTEE_SUPPLICANT RUNNING
 
root@qcom-armv8a:~# smcinvoke_client -c /data 1
Run callback obj test...
Load /data/tzecotestapp.mbn, size 52192, buf 0x1e44ba0.
System Time: 2024-02-27 17:26:31
PASSED - Callback tests with Buffer inputs.
PASSED - Callback tests with Remote and Callback object inputs.
PASSED - Callback tests with Memory Object inputs.
TEST PASSED!
root@qcom-armv8a:~#
root@qcom-armv8a:~# smcinvoke_client -m /data 1
Run memory obj test...
Load /data/tzecotestapp.mbn, size 52192, buf 0x26cafba0.
System Time: 2024-02-27 17:26:39
PASSED - Single Memory Object access Test.
PASSED - Two Memory Object access Test.
TEST PASSED!

This series has been tested for QTEE object invocations, including
loading a TA, requesting services from the TA, memory sharing, and
handling callback requests to a supplicant.

Tested platforms: sm8650-mtp, sm8550-qrd, sm8650-qrd, sm8650-hdk

[1] https://www.kernel.org/doc/Documentation/tee.txt

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

Changes in v10:
- Remove all loggings in qcom_scm_qtee_init().
- Reorder patches.
- Link to v9:
  https://lore.kernel.org/r/20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-0-a2af23f132d5@oss.qualcomm.com

Changes in v9:
- Remove unnecessary logging in qcom_scm_probe().
- Replace the platform_device_alloc()/add() sequence with
  platform_device_register_data().
- Fixed sparse warning.
- Fixed documentation typo.
- Link to v8:
  https://lore.kernel.org/r/20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-0-7066680f138a@oss.qualcomm.com

Changes in v8:
- Check if arguments to qcom_scm_qtee_invoke_smc() and
  qcom_scm_qtee_callback_response() are NULL.
- Add CPU_BIG_ENDIAN as a dependency to Kconfig.
- Fixed kernel bot errors.
- Link to v7:
  https://lore.kernel.org/r/20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com

Changes in v7:
- Updated copyrights.
- Updated Acked-by: tags.
- Fixed kernel bot errors.
- Link to v6:
  https://lore.kernel.org/r/20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-0-697fb7d41c36@oss.qualcomm.com

Changes in v6:
- Relocate QTEE version into the driver's main service structure.
- Simplfies qcomtee_objref_to_arg() and qcomtee_objref_from_arg().
- Enhanced the return logic of qcomtee_object_do_invoke_internal().
- Improve comments and remove redundant checks.
- Improve helpers in qcomtee_msh.h to use GENMASK() and FIELD_GET().
- updated Tested-by:, Acked-by:, and Reviewed-by: tags
- Link to v5:
  https://lore.kernel.org/r/20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com

Changes in v5:
- Remove references to kernel services and public APIs.
- Support auto detection for failing devices (e.g., RB1, RB4).
- Add helpers for obtaining client environment and service objects.
- Query the QTEE version and print it.
- Move remaining static variables, including the object table, to struct
  qcomtee.
- Update TEE_MAX_ARG_SIZE to 4096.
- Add a dependancy to QCOM_TZMEM_MODE_SHMBRIDGE in Kconfig
- Reorganize code by removing release.c and qcom_scm.c.
- Add more error messages and improve comments.
- updated Tested-by:, Acked-by:, and Reviewed-by: tags
- Link to v4: https://lore.kernel.org/r/20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com

Changes in v4:
- Move teedev_ctx_get/put and tee_device_get/put to tee_core.h.
- Rename object to id in struct tee_ioctl_object_invoke_arg.
- Replace spinlock with mutex for qtee_objects_idr.
- Move qcomtee_object_get to qcomtee_user/memobj_param_to_object.
- More code cleanup following the comments.
- Cleanup documentations.
- Update MAINTAINERS file.
- Link to v3: https://lore.kernel.org/r/20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com

Changes in v3:
- Export shm_bridge create/delete APIs.
- Enable support for QTEE memory objects.
- Update the memory management code to use the TEE subsystem for all
  allocations using the pool.
- Move all driver states into the driver's main service struct.
- Add more documentations.
- Link to v2: https://lore.kernel.org/r/20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-0-297eacd0d34f@quicinc.com

Changes in v2:
- Clean up commit messages and comments.
- Use better names such as ubuf instead of membuf or QCOMTEE prefix
  instead of QCOM_TEE, or names that are more consistent with other
  TEE-backend drivers such as qcomtee_context_data instead of
  qcom_tee_context.
- Drop the DTS patch and instantiate the device from the scm driver.
- Use a single structure for all driver's internal states.
- Drop srcu primitives and use the existing mutex for synchronization
  between the supplicant and QTEE.
- Directly use tee_context to track the lifetime of qcomtee_context_data.
- Add close_context() to be called when the user closes the tee_context.
- Link to v1: https://lore.kernel.org/r/20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com

Changes in v1:
- It is a complete rewrite to utilize the TEE subsystem.
- Link to RFC: https://lore.kernel.org/all/20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com

---
Amirreza Zarrabi (11):
      firmware: qcom: tzmem: export shm_bridge create/delete
      firmware: qcom: scm: add support for object invocation
      tee: allow a driver to allocate a tee_device without a pool
      tee: add close_context to TEE driver operation
      tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
      tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
      tee: increase TEE_MAX_ARG_SIZE to 4096
      tee: add Qualcomm TEE driver
      tee: qcom: add primordial object
      tee: qcom: enable TEE_IOC_SHM_ALLOC ioctl
      Documentation: tee: Add Qualcomm TEE driver

 Documentation/tee/index.rst              |   1 +
 Documentation/tee/qtee.rst               |  96 ++++
 MAINTAINERS                              |   7 +
 drivers/firmware/qcom/qcom_scm.c         | 119 ++++
 drivers/firmware/qcom/qcom_scm.h         |   7 +
 drivers/firmware/qcom/qcom_tzmem.c       |  63 ++-
 drivers/tee/Kconfig                      |   1 +
 drivers/tee/Makefile                     |   1 +
 drivers/tee/qcomtee/Kconfig              |  12 +
 drivers/tee/qcomtee/Makefile             |   9 +
 drivers/tee/qcomtee/async.c              | 182 ++++++
 drivers/tee/qcomtee/call.c               | 820 +++++++++++++++++++++++++++
 drivers/tee/qcomtee/core.c               | 915 +++++++++++++++++++++++++++++++
 drivers/tee/qcomtee/mem_obj.c            | 169 ++++++
 drivers/tee/qcomtee/primordial_obj.c     | 113 ++++
 drivers/tee/qcomtee/qcomtee.h            | 185 +++++++
 drivers/tee/qcomtee/qcomtee_msg.h        | 304 ++++++++++
 drivers/tee/qcomtee/qcomtee_object.h     | 316 +++++++++++
 drivers/tee/qcomtee/shm.c                | 150 +++++
 drivers/tee/qcomtee/user_obj.c           | 692 +++++++++++++++++++++++
 drivers/tee/tee_core.c                   | 127 ++++-
 drivers/tee/tee_private.h                |   6 -
 include/linux/firmware/qcom/qcom_scm.h   |   6 +
 include/linux/firmware/qcom/qcom_tzmem.h |  15 +
 include/linux/tee_core.h                 |  54 +-
 include/linux/tee_drv.h                  |  12 +
 include/uapi/linux/tee.h                 |  56 +-
 27 files changed, 4410 insertions(+), 28 deletions(-)
---
base-commit: 33bcf93b9a6b028758105680f8b538a31bc563cf
change-id: 20241202-qcom-tee-using-tee-ss-without-mem-obj-362c66340527

Best regards,
-- 
Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

