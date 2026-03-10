Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875B73E8C5B
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 07:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773127372; cv=none; b=rYzPJ/Pi6lwYZTfppcmC7MLDgSHhUAHmlCy8SBJnK/iKuiaRpAO5kAwaX92WWowl5gVXbmACnayDk4MxCtWlcyKa0+MOQb1Ebvysz/Z9xke57P3fatsqg2eViawdxyn4u13LBFsSfMcEg/CEaCpfWDf3kL5Ear7zt24Q1L52+3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773127372; c=relaxed/simple;
	bh=PYlMjATY4SM1+jaLjbUMOn336QEIJpGFcRpjUcyzz/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tDWFZlXD4DfTsK8PE4kRdepRwNoJJBbC/0wXYh9X9g1I0zd9VfvHjzwopeAAkZG/zE3ZOouwgZzRepcdU+OiRgbdse2FfE9j4I9ai4DEGBbfzLlEbKKVNtrHj71sfLlUHIEscTSNiO/UvqU0Lw9K99JP6LdAzV64Xmlyv+cqHow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OSQUoMBa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aoIVQuo/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OSQUoMBa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aoIVQuo/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EdN93587453
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 07:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AhZtQR443/E19GewAj1186Zwj+uyAl6zxJPtQ9r8Toc=; b=OSQUoMBakbHD4hGg
	hdEEZESxYnrKgEiNiGZF9XYy6J7UY0NiX8arF6UUes3B04tI4z439vt9YTljux8Z
	uhRy3tfLRjLA0tZOLflDX0Rc20zO8/pYDIqD59X01yk/zY51ov6dATB6WQREYciM
	WsntOdOthV9ni3EuJyVt4J56Tkn7jUVCnjq32UDMeJXRkvgkopgC/tmJ9IWVG+Wf
	tJpi5uGyx4GjJgYSMVF8BACx48dl4pqe7ZtCtdcfZltevIiy23eXyS0pNknN7M/M
	hkxcAWT93Cdo9L7FBQjBZrZRRwnN4Lg4xeLfcK7GmWysLZy21XJo8Y4n+G/pBhM3
	aa6Shw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1ektptp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 07:22:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae4cdfc468so88618315ad.2
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 00:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773127369; x=1773732169; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhZtQR443/E19GewAj1186Zwj+uyAl6zxJPtQ9r8Toc=;
        b=aoIVQuo/NVgwsjEXYNZkTsXj5mEe7CJbtj65DoJml4ZT/UmDmDVHQGkd2Z6x23PtH4
         g3Lf2YXUeki41cjg3DT8+rR+kgPlR55IooDSNl+u0pMN6B/6at47SjgF0BKIslSBqgs8
         hL06siIzWUpAPjCLsBRMur3hfXciYajBAU7a4PcfPzgHM4C/dTg9YxzawVlXNjxeCIMO
         XOR6NTeMBQWSrpA7YGl0I69hppkEBwNz5AJSMQLxVM6IVxxdTPxtsxpUElLOqNayk50j
         kKxHzQnX58hk6hCEPrr9bPe2s0G4ePVD37BWEfyON6pAzQYo582v+iLDC0Sa86R1Dnki
         7iqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773127369; x=1773732169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AhZtQR443/E19GewAj1186Zwj+uyAl6zxJPtQ9r8Toc=;
        b=e9gW+gzSw8Ei7Y5PzTR+trV4KDhPSYcPSOuf3AGSj3Yw0h31VUORXV2jPchWmyZsnC
         YO6hdI92GXlKgiXW84jc2aZLpgPkZRvwfKtuRFVwP6EWq6jve7ZTvEGljEVCqxQna31L
         caEcQNWwNz10WVYxv4sCxPSS96YKrMHktyfYfo38XrY4v0AUHgerYHrFHo8JZP47JgK/
         qtl7f0O1T6a6ZRVRQvb+zaVUbslPBvkJ2EU9O316+S2UWvjPOQBuVK2ISkrUsVxrzV5G
         eNdPbUoa1i/qDYHyypeB5ujMtHWWAq+FealmntSR8ErF5ahJUnW8M63WvsO5Dw/i9wlM
         oo2A==
X-Gm-Message-State: AOJu0Ywdpz+nGSrWy7VsU7oCgphVg7/Dnh8HyaonDmljy11Kj3oiWb4x
	N2zknIPQxzLW8f23YCZ1xpC2YnBnPrUAhlhfSb5PWfTDg0iQPJppDVqLd2LoleVfD81l5mY9CAM
	ZTHtJQHKY7Z1SEeWBIZd/iNRPP4M9HQsMvkWHVD4qN3+DRrD96VvmHGoRdvf3ZLl3Ff1HpMQ=
X-Gm-Gg: ATEYQzxDZ9d/i5m5kkyr/J+aZbwpr5pEejXnbQS7PV9AugVYBXe+4XxjfeqASF7csNK
	IOK4aTQpa2F5sgAhVgGZH74rizvs1+yl+qkfg3c3pjKGAVNmXjP6MyJTSGekdDpeBk0ut3owm0e
	dbaIiSq0QMNHc2vtRNdFZxS54re5NVvsp3w3aDuDgcYmcc8gf++09Ya8zSJs8pSLDPzDMD8ezW/
	pln9IVJSfMU6E0gXcMQ8R6ApqF6VjA3ONrRpIGHyvXC9yzEnff8H5enQZd5Fu1yMHnkvRszymmp
	Ite9VQ6H2CFTjQ6jWEtIw7C0r6KdV9xiuPYIIyu8maFrPIM4vDaWl/MMy/XuplIGw6dEZb0u69z
	B8o3nK544cDtLGwn0q3DA628vIPb2sbyVZNEjZq+2nGQjXfUD5yQ=
X-Received: by 2002:a17:902:cf05:b0:2ae:829d:3c33 with SMTP id d9443c01a7336-2ae829d3f2emr149862905ad.8.1773127369014;
        Tue, 10 Mar 2026 00:22:49 -0700 (PDT)
X-Received: by 2002:a17:902:cf05:b0:2ae:829d:3c33 with SMTP id d9443c01a7336-2ae829d3f2emr149862565ad.8.1773127368570;
        Tue, 10 Mar 2026 00:22:48 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840b2e9dsm185200325ad.85.2026.03.10.00.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:22:48 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:52:06 +0530
Subject: [PATCH v3 9/9] Documentation: ABI: Add sysfs ABI documentation for
 DDR training data
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-sahara_protocol_new_v2-v3-9-994ea4b0d5ad@oss.qualcomm.com>
References: <20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com>
In-Reply-To: <20260310-sahara_protocol_new_v2-v3-0-994ea4b0d5ad@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773127328; l=1903;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=PYlMjATY4SM1+jaLjbUMOn336QEIJpGFcRpjUcyzz/4=;
 b=A2ngy+Vh6mGbywAacQ1WhpnAXl4OfWSksXvxmtXi88x0yTGDf+9jd2T6SE6lkrsx9nv4dwTSR
 O/grnwx19PsAypGENZxaAsrKGNdaoKkokxmqVFwm6mmcVFtenk5b9bW
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-GUID: BRnpcK15kGy0Gh9-LIaQprqhbPejPQ8p
X-Proofpoint-ORIG-GUID: BRnpcK15kGy0Gh9-LIaQprqhbPejPQ8p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2MSBTYWx0ZWRfX7hNNuwKdZHCh
 L980EqUvkvQiw6ay4NuYqKRGcyd/7lnZPjfJTmzuXh6BFLUM6OzMiQHHqTRFTd7FJsioTBVfxDx
 LHNPP+I8V4s3fp0ZTTW8C5Jn3dR/DJ6kUITLvv4k54RERnlCTAN+yP5sXoW2CaZ6UL29B+Hzk8v
 IcktGZ7gT1/uXqiMQcsehE7ws902g5YI7jmIDywDpCHtocqdkx3MgWYOIr0DDtZijq3Ispk7PQd
 e6t98XtpWEMrb1CKMiUmd4EBSvkLDpAr1p0KXaCVaRc0JKfPaWZPBaSFXBGNLpTA5z7tYop4v8F
 DDdApAPxCiqtE0kzJMcSg2FhfJCPBVfJOV2DjDC9FIh1x/m4NY4j5qxIXeO/AgdJW72+SM7Vx3x
 QGZBF5qbAkQTjbkCQ5NjOye4+EV7wIg+BBAhUNQ9Zz/4VTWBrkgox5BV8BqyxDG2WIKazgm+t6p
 Jj8dcfZCvrrxumWvfJQ==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69afc6c9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dkV1H7vRkoxx0F9zaYgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100061

Add ABI documentation for the DDR training data sysfs attribute exposed by
the sahara MHI driver.

The documented sysfs node provides read-only access to the DDR training
data captured during sahara command mode and exposed via the MHI
controller device. This allows userspace to read the training data and
manage it as needed outside the kernel.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-mhi-ddr_training_data       | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
new file mode 100644
index 0000000000000000000000000000000000000000..810b487b5a5fdba133d81255f9879844e3938a10
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
@@ -0,0 +1,19 @@
+What:                   /sys/bus/mhi/devices/<mhi-cntrl>/ddr_training_data
+
+Date:                   March 2026
+
+Contact:                Kishore Batta <kishore.batta@oss.qualcomm.com>
+
+Description:            Contains the DDR training data for the Qualcomm device
+                        connected. MHI driver populates different controller
+                        nodes for each device. The DDR training data is exposed
+                        to userspace to read and save the training data file to
+                        the filesystem. In the subsequent boot up of the device,
+                        the training data is restored from host to device
+                        optimizing the boot up time of the device.
+
+Usage:                  Example for reading DDR training data:
+                        cat /sys/bus/mhi/devices/mhi0/ddr_training_data
+
+Permissions:            The file permissions are set to 0444 allowing read
+                        access.

-- 
2.34.1

