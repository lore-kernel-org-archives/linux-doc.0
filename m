Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4820919D083
	for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 00:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757463102; cv=none; b=bSqhKSjtXcliSktB536od0LSZgf5P6kFm8vdUtvtw80MMX+9TjNs9NWyQ/JvaCG0eoBb3UJv+WIB/8Uf/IR9Qx3lATQN9d1QSJjdxNlu6Hs4/HQSZUMpsRU7zC7Y4GafQKtymua1x2/hASILWkvfTIfrGatX67bwTALDhKn8tnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757463102; c=relaxed/simple;
	bh=696U7/FWwaaFIGlzeZRWykn9zjUkr8pce7ma6fekJEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pGVyo75gwY5hKd8fH+QiPqOgaOBRsSnsMCSz0PXGOWtdLOeKvGhtORlWU4FsMHs8RwnG8VbdR0Ku+fTNLD2ZPuZez1qfoVQJUjyamUzJUQfey/fllNgEpUa8l6sdGECFkM2hEOT+724TXVsrJcwyB6JEaryh9LsY25AODjBO0cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I+XGAoiS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I+XGAoiS"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589HCNBT029368
	for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 00:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4C5VhC/4pFCnYsmQJ5EmNbV8HXu0TRSksgnPURzlR3I=; b=I+XGAoiSsp98TQ5x
	6e41NhkRmZ6L5Kid75CcmVKFH9YO7mxf/7QjQ6Z7AYipA+hINDWTRIigDW2guaUT
	TtSi0Rop725hS7g0+80aIzm5HF2sLYvIOdJSr+EJz690Wyf+p/65yGgXm42N0XZK
	DN2I4MKDUxQugIw77lqLYw/b2k+9uKo2M1bEEIAZJwdvoF94JVFuFSn5IKTxxu22
	PaRxo9J7SDEa4DRe9AHR9Vzrd2ZPYbLcl20a5vb8ncbU2W10oTuEdn5iOzu5quC3
	TaoIRVh+tawxZq2JLVqXf+6KQ8dXW8lXXdXjYEd3py/b5hgV88wWltWEN1AOA6Zq
	LGYeFQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8j1mk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 00:11:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-329e1e3b25bso5707432a91.2
        for <linux-doc@vger.kernel.org>; Tue, 09 Sep 2025 17:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757463097; x=1758067897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4C5VhC/4pFCnYsmQJ5EmNbV8HXu0TRSksgnPURzlR3I=;
        b=P1Uwiwz2G4Ft34OH9PhjOUFnGUYG4M9mhmD6BFBPo45/FfuhhHC/A5G/n2VGbLj+8V
         wVgficRwsHlI6lcsvwsB/n31ZFim03/VJIANyTJdmeUCzEAggkli96cUkLqb8zots1gj
         YtKkHc98DnN/JpxiIqTKj7tDEmRp1VOcUcj33pzLEWXAl0hXaxpD9ENt9TZ8gOy69w+W
         PlSfFG27tRetdQ65dAmn8xIUGx1XdNZNk9iVdMt4xWcJ4IUxJMbYlysJR4I4226CU16b
         EVAI9JON6F5nf3lE8s8tB2/sanXaom/w+UngzzGs1J2NCgz/Q1Koldq7AhW5nXgHn8dW
         +mdw==
X-Forwarded-Encrypted: i=1; AJvYcCWWsPMGFHwEIvBHbUL19aWpwKLc1bl/NStuREaVaVIM5o69x5pWUE5hYPBsvUJbsiPT7uVeVu6Y3lM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO1KVUJwWCi8Y9DozUr403C5HiW+g0zES67EOpo+M/t8GF1+ZP
	x1Egm9NHrZFQtZtcZ8p2zYF6maZvYj2YOpN5W1F489SU5aN4AfMwEEH9gB+BZ7vDfG1teaUlKAB
	fjp2lgwaiglto2ocOqF/+DLWvuKKIAU49kFqlPM1oP2lHYKATlUyU+nDeODmffQ==
X-Gm-Gg: ASbGncuNqzHtR51hNT9Va/o7hEIfXZZs/kKTa0zmsXsEHaxephb3wU7iLDUqq3gNBMi
	8jvPVb1SAzSDEZxwJY8vW7w57LyZUXk0qhrlqGfpxUYc0s6oBoMEEs7XWRQ43MlygxO1BY/GjXU
	9bz1pMoPMX1lnTXXb9+aduNKRMsMOh6e/0e/T73RY3ATBUNAQA05oJhV/KPRu1LCoCZDl2TAfcD
	W3Yqh1pCdvVliJOuKtjjx/onOWjqHxzFNutrno1EaJxRktxhtvGZv44iWaJHIjfVQb+P5ezjScL
	achGn/T+uO2AGYhqRSo8S5ZCAVUPKa5aFlYLHLVyVOoHdm+gGZ1VC8ZaiFW0Vk/vwlDCpQrQUms
	BiJdybcWochnZSuUBKFZG9Os=
X-Received: by 2002:a17:90b:3e83:b0:32b:dfd4:95c9 with SMTP id 98e67ed59e1d1-32d43f65178mr18315522a91.23.1757463097224;
        Tue, 09 Sep 2025 17:11:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpzGJa3zoFNB42rtvfjajYvfcc9erQFUhwdKHNTg2RVQc2elCXFRJ+X/Uvoa7tYLTxRWAgEw==
X-Received: by 2002:a17:90b:3e83:b0:32b:dfd4:95c9 with SMTP id 98e67ed59e1d1-32d43f65178mr18315479a91.23.1757463096596;
        Tue, 09 Sep 2025 17:11:36 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dab6bb655sm1285672a91.10.2025.09.09.17.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 17:11:35 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:11:13 -0700
Subject: [PATCH v10 11/11] Documentation: tee: Add Qualcomm TEE driver
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-qcom-tee-using-tee-ss-without-mem-obj-v10-11-20b17855ef31@oss.qualcomm.com>
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
        Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX+rQKfWiLqGau
 iFzAm4i73WCkiQtcOYD7L/aUXK0S2oj9o5MJagdTzy40OJJCGhCZKLvK1DswR8VYE97dpUYvZQT
 TgHKJb69dZBpojhFXfHR3tSXVacg8nScFJboYHKSyh7LcYXMIoyYm3nMUAeSoATXKMso6so62m9
 abLFQ3jTIOfFiunBi43WbxLfaxosovAlufq2PUkC/yspYSVVsoYN2fDBwr11aca7Ynv9/hkEoxc
 ZnhLtW1KoNzQRv32kxoyW7qCS/H6bT0nJvZnzRGocINKZciTXyx/ubiD2I3wEQwmMaoNvalcrkm
 fdpYNtKWQmzE2DRZrgdgqBY2ZdzQzT7elVtk9eEgtMUtbBFp70SfBDfRWNyK5cpGv1F3D1hgS2I
 L6VHq4/t
X-Proofpoint-ORIG-GUID: 37GIG2KOKiBVw6eLjo7jejZp7oSb4rjr
X-Proofpoint-GUID: 37GIG2KOKiBVw6eLjo7jejZp7oSb4rjr
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c0c23a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=vCTlBN6rBY5pDr9NrAkA:9 a=QEXdDO2ut3YA:10
 a=M0EVDjxxv-UA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

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
index 5086db700aeb..bac9436f65c7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20984,6 +20984,7 @@ QUALCOMM TEE (QCOMTEE) DRIVER
 M:	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
+F:	Documentation/tee/qtee.rst
 F:	drivers/tee/qcomtee/
 
 QUALCOMM TRUST ZONE MEMORY ALLOCATOR

-- 
2.34.1

