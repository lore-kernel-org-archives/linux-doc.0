Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9B9270EDE
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 03:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757562106; cv=none; b=fAw0EdRoitlAoFaTkrSPuK8dHz0aJIsYvdOqG060EugYlT2QLaduMaT0nUlxOTGAG6Ps+zVpj87v7+lFUwMk5tYdbOMUtC/eze1f/jh9dNbGartkiNUhH+N7+HA5gLHDyXtTxY8/IYczWIubp90mzCFxtkDIeLGWxxL3yKMx+i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757562106; c=relaxed/simple;
	bh=RN0nKuxToKAQ9VOhyNYte58FvHuKeDhMEOShy3rUoJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kKAH9vdmv4ChuMy02gjgJZbUdmzD9H5tJa0pr1p3h1BUz2UoZdQVwdHocT3JvVdNIwRxH53p6xnwNOBy55Td1KdZKFOTHa4cm7HTpoVKVC3ZRwWjU6HFnhaDjCvdYoXRPzOBmkjX+it/MMBbcKFcVfJ82g5OjTRz8PvDAMTqv+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KZ3JPY7d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KZ3JPY7d"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2IeLp006675
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 03:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OdVTKF925ssMm3cQuiq+O1uNYUiJEhXOdcH2WTZnulA=; b=KZ3JPY7dAs5KGUTq
	HFUFea0XTIvJXWVY1Q7H74X0N+OosjBE4pxWKXcpJEMGJobLna+RmCS+VAAMe3Re
	fJxsMZmoXjDwkVeQorNjFAFklvxhRt6n5xzyqM2TUE1XieTmRnI1zT0RaUuntbhG
	iQoj5Q6AzwCRT0kjJUq9atRUqT+/R2UTWwoM0vFgFcpEZYOYgU+OUATZthZw6zps
	xDEaOu4LmRnGtPsYhC+IJ9gTX/iUqzqh0hjIdncQ6jj/1s0j1q4MryROkmM68SFW
	aaJKpoZAH/CkoRL9AefPCL9pSBnSvervqrh+GgbqTfMQQOXrXxBMJuNb7EWEALkH
	ar9Tiw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8ae3fn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 03:41:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24afab6d4a7so6043815ad.1
        for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 20:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757562103; x=1758166903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OdVTKF925ssMm3cQuiq+O1uNYUiJEhXOdcH2WTZnulA=;
        b=wbTLwussnY8zAAIRfI13fy9DMHoXfoXi+c86n6faNuNJqskecYNpL6chILolISjl5m
         mnuMX+pcCKxoQxicBu8Vn/xczREPFn5Rqym6aVr9cOJbb2gH0qfsrql3y6HOK1lUZKEK
         dWH11uJZa78iSNOeggJwnhLHaJPNFiwm4Rl0FspcE2E7G33W2n9t1FmeP/+VjYUO7MK2
         2PxMlZ4adaLfVbKRTHTR0niQhVfFTbG7yAKG60Xoxsd80thz4LFccaUwalwTKrrT9E+P
         NsuDwTYG+X4c0z6P/O2xrSp1nZqq1+DWHT9lxFVMLrhGtX4wTpraWwVqIPg/9fF7bg3w
         EZ7g==
X-Forwarded-Encrypted: i=1; AJvYcCVe7nLIW1w1pMhFwExDWroQ6s+9ksPGw6id7gZvG+d+EgTobP0/a+mkFc4TxuakTW9Ue7tNTAoR77k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV7I9NDJ3bubOhYJCOZ3wOUcxXQaVr5ZSlVhw9GA73QknkBVKk
	3gJ4NeQw5QyQAqdftNPyXn/azJmt/KcZnY8gAB6VwupoHMFbXHfAdLt+H9DcKQMD+zd2Js0E6Ou
	Oz9rBl5e94EDBDor+i2MrvdNkV4HghPHCWhuMLxKQeiF4kar5tQ3Q/AhUoLlWyQ==
X-Gm-Gg: ASbGncsfpCfleyXmADJ6mxgeAo6jyU+Y0eXpwZ8w5vbiOKDudhLgbfCnQI4WL1H3eNV
	KxeGQDpQIC5MmefiStzu82exHAj7SO2d0aWW3L3VqdelKg/cgTRLRM/J3XmJ1PGLY21i3yEXLpS
	n+Zxe5kgmknAdnf3oUUTFPvvUiFtxxHyD7gDYIfsImH3w0xYMcYCnHYBL8V+eyqsGS/aXRqo4za
	ZIlwqn198Ct3n0ulR/ik1rLNtokUBshBR2zfmKGpcpkizhiOkD5hT6M5RtJF9os5XdGJJULYYzM
	1gJ9cgnNjqGYJUmMeIFaWzOdr+zbryC4LM0HORdbDDkRXij55rAmJ5kFREYompCfBaytOrS3/y+
	Zeyd/LmSpUDAYQjf2LqdrlSQ=
X-Received: by 2002:a17:903:138a:b0:24c:9e2d:9a13 with SMTP id d9443c01a7336-25170772b3amr227810515ad.27.1757562103030;
        Wed, 10 Sep 2025 20:41:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtd17Vhg+RzVHZGU8BB/FT8CYxosIKHklKDWfs0WsmhvNxis8G3SdePgjppVkj5JOpI57GYA==
X-Received: by 2002:a17:903:138a:b0:24c:9e2d:9a13 with SMTP id d9443c01a7336-25170772b3amr227810115ad.27.1757562102478;
        Wed, 10 Sep 2025 20:41:42 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3b304f76sm2962275ad.130.2025.09.10.20.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 20:41:41 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 20:41:24 -0700
Subject: [PATCH v11 11/11] Documentation: tee: Add Qualcomm TEE driver
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-11-520e867b3d74@oss.qualcomm.com>
References: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-0-520e867b3d74@oss.qualcomm.com>
In-Reply-To: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-0-520e867b3d74@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c244f8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=vCTlBN6rBY5pDr9NrAkA:9 a=QEXdDO2ut3YA:10
 a=M0EVDjxxv-UA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: ClPZwdBh_-55g743ml5r1YTO6cfjlvRn
X-Proofpoint-ORIG-GUID: ClPZwdBh_-55g743ml5r1YTO6cfjlvRn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX+YwbAVOAKcE9
 xD/0HNLdeXbL4ZaoLXk7oEob2EMwcjdB/BM+pFr1862h1mrr+BKQ8bADQQLvBB6HULmAFyWPbCP
 5mQ2F159HWL7dxMdSY08kN6AL+/EtDNsavpDEvIldzfznrVYo0lpMaLOfLFlkpnF3modREWA9eD
 VlpP3Sk1xqet+9T84o2iNEwI+9Z8aCYfJ1R8S0Y/+j1hTNw94ulgYSVJLEa67fHreWc9cq0MFO9
 hZKThcvvIkQYt0RyuuZp7JDt/ewZyy+FZj7h/ujC9qV5tCfZkNbdn7rcjYCbMTsAbvlEKJwppGQ
 mK6Chd2fRnobliMXSLNbkbM/kD24t/Jct+HUVLX+zfUZ2ZEJu9+5Gb1HEZbkgak5RWFB7IaaL1m
 8IchZQhi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039

Add documentation for the Qualcomm TEE driver.

Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 Documentation/tee/index.rst |  1 +
 Documentation/tee/qtee.rst  | 96 +++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                 |  1 +
 3 files changed, 98 insertions(+)

diff --git a/Documentation/tee/index.rst b/Documentation/tee/index.rst
index 4be6e69d7837..62afb7ee9b52 100644
--- a/Documentation/tee/index.rst
+++ b/Documentation/tee/index.rst
@@ -11,6 +11,7 @@ TEE Subsystem
    op-tee
    amd-tee
    ts-tee
+   qtee
 
 .. only::  subproject and html
 
diff --git a/Documentation/tee/qtee.rst b/Documentation/tee/qtee.rst
new file mode 100644
index 000000000000..2fa2c1bf6384
--- /dev/null
+++ b/Documentation/tee/qtee.rst
@@ -0,0 +1,96 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=============================================
+QTEE (Qualcomm Trusted Execution Environment)
+=============================================
+
+The QTEE driver handles communication with Qualcomm TEE [1].
+
+The lowest level of communication with QTEE builds on the ARM SMC Calling
+Convention (SMCCC) [2], which is the foundation for QTEE's Secure Channel
+Manager (SCM) [3] used internally by the driver.
+
+In a QTEE-based system, services are represented as objects with a series of
+operations that can be called to produce results, including other objects.
+
+When an object is hosted within QTEE, executing its operations is referred
+to as "direct invocation". QTEE can also invoke objects hosted in the non-secure
+world using a method known as "callback request".
+
+The SCM provides two functions to support direct invocation and callback requests:
+
+- QCOM_SCM_SMCINVOKE_INVOKE: Used for direct invocation. It can return either
+  a result or initiate a callback request.
+- QCOM_SCM_SMCINVOKE_CB_RSP: Used to submit a response to a callback request
+  triggered by a previous direct invocation.
+
+The QTEE Transport Message [4] is stacked on top of the SCM driver functions.
+
+A message consists of two buffers shared with QTEE: inbound and outbound
+buffers. The inbound buffer is used for direct invocation, and the outbound
+buffer is used to make callback requests. This picture shows the contents of
+a QTEE transport message::
+
+                                      +---------------------+
+                                      |                     v
+    +-----------------+-------+-------+------+--------------------------+
+    | qcomtee_msg_    |object | buffer       |                          |
+    |  object_invoke  |  id   | offset, size |                          | (inbound buffer)
+    +-----------------+-------+--------------+--------------------------+
+    <---- header -----><---- arguments ------><- in/out buffer payload ->
+
+                                      +-----------+
+                                      |           v
+    +-----------------+-------+-------+------+----------------------+
+    | qcomtee_msg_    |object | buffer       |                      |
+    |  callback       |  id   | offset, size |                      | (outbound buffer)
+    +-----------------+-------+--------------+----------------------+
+
+Each buffer is started with a header and array of arguments.
+
+QTEE Transport Message supports four types of arguments:
+
+- Input Object (IO) is an object parameter to the current invocation
+  or callback request.
+- Output Object (OO) is an object parameter from the current invocation
+  or callback request.
+- Input Buffer (IB) is (offset, size) pair to the inbound or outbound region
+  to store parameter to the current invocation or callback request.
+- Output Buffer (OB) is (offset, size) pair to the inbound or outbound region
+  to store parameter from the current invocation or callback request.
+
+Picture of the relationship between the different components in the QTEE
+architecture::
+
+         User space               Kernel                     Secure world
+         ~~~~~~~~~~               ~~~~~~                     ~~~~~~~~~~~~
+   +--------+   +----------+                                +--------------+
+   | Client |   |callback  |                                | Trusted      |
+   +--------+   |server    |                                | Application  |
+      /\        +----------+                                +--------------+
+      ||  +----------+ /\                                          /\
+      ||  |callback  | ||                                          ||
+      ||  |server    | ||                                          \/
+      ||  +----------+ ||                                   +--------------+
+      ||       /\      ||                                   | TEE Internal |
+      ||       ||      ||                                   | API          |
+      \/       \/      \/   +--------+--------+             +--------------+
+   +---------------------+  | TEE    | QTEE   |             | QTEE         |
+   |   libqcomtee [5]    |  | subsys | driver |             | Trusted OS   |
+   +-------+-------------+--+----+-------+----+-------------+--------------+
+   |      Generic TEE API        |       |   QTEE MSG                      |
+   |      IOCTL (TEE_IOC_*)      |       |   SMCCC (QCOM_SCM_SMCINVOKE_*)  |
+   +-----------------------------+       +---------------------------------+
+
+References
+==========
+
+[1] https://docs.qualcomm.com/bundle/publicresource/topics/80-70015-11/qualcomm-trusted-execution-environment.html
+
+[2] http://infocenter.arm.com/help/topic/com.arm.doc.den0028a/index.html
+
+[3] drivers/firmware/qcom/qcom_scm.c
+
+[4] drivers/tee/qcomtee/qcomtee_msg.h
+
+[5] https://github.com/quic/quic-teec
diff --git a/MAINTAINERS b/MAINTAINERS
index bde449308736..589f8ea62bcf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20860,6 +20860,7 @@ QUALCOMM TEE (QCOMTEE) DRIVER
 M:	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
+F:	Documentation/tee/qtee.rst
 F:	drivers/tee/qcomtee/
 
 QUALCOMM TRUST ZONE MEMORY ALLOCATOR

-- 
2.34.1

