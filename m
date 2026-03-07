Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB1A358378
	for <linux-doc@vger.kernel.org>; Sat,  7 Mar 2026 11:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883760; cv=none; b=svGvi9UX0WY1xiosKP5eutbFAYgNJ2D9v5TQOa13ehdBvwvYrz/hdwMB4in7rMVF8DzD/gieHJmFzeVr+qBZ9G8GMRFQ+x+JigjfrT5Z3qHFfaNIsj3xlMTbM1tm3HpKv0AtsRmHvZ1tW2k1NvqtY7QMxVznWqXWmZ5Iz26XCCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883760; c=relaxed/simple;
	bh=PYlMjATY4SM1+jaLjbUMOn336QEIJpGFcRpjUcyzz/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iit8oEr2JFhExaicJMwwGbQQXKYYzY8y3iXPK/Lu1Qi7mzEeJb+ZqqGosRkrsKEu5Bw1yBVI91TFObwxIoJkswk+ogr0C5uIWu4sIjnTr7xHZZqMQfUstIubSG0izCAvs6PSvYYjXR3X9APVT7bIyaHdKGhJgmnyjO1Krutw5Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MMLBSZCE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eyGgpbJR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MMLBSZCE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eyGgpbJR"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 627BUsRG4012651
	for <linux-doc@vger.kernel.org>; Sat, 7 Mar 2026 11:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AhZtQR443/E19GewAj1186Zwj+uyAl6zxJPtQ9r8Toc=; b=MMLBSZCEODmf65KM
	WTGAu6cSZXV8zO7KcZdu1QYppchEuMAjFw9PsZaPDSObGoHSV298OjX4rRlxS31a
	ShLIjSX4e/Il5ULFHLHHdpiOO+0YTvtxszMTTF1v2IotkKKKuueLpqbJcE9pbAHW
	q0N93E2L1djGKr7yNLzYkdDgPwJYxGhSmlWn5sn9PVfOxXZFxK5bSrYiEd1sxYy4
	DvO8k2StvOjyipliFk/crY/2v/2jFHO/RTy3khQm23o8EdGHwQR5hMVfo7SoQ5vx
	+KAs/2nqUXTLOUyCE9CoL8u0YM91zUF3WkeOZi14dDXrqs8XwuLS1HFM2utOrtN/
	N7KKvA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc3v8pyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sat, 07 Mar 2026 11:42:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae47b3adacso63908595ad.3
        for <linux-doc@vger.kernel.org>; Sat, 07 Mar 2026 03:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772883756; x=1773488556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhZtQR443/E19GewAj1186Zwj+uyAl6zxJPtQ9r8Toc=;
        b=eyGgpbJRMN0YyZHmmhVq2edKK1PvfrGXZ1cw81wOijSv/chc8/X/QUh/O6PyQRAGlc
         WKK/8HSynN9BxHImaQtW+AjZjNdYtazUriEkFutJOeYH2VBLe1KAtTisndzOwfGweWNn
         kkxEKz2JmAqfWrP1QVzzI1k46SsSb36Of+ONwxCq2U8/QeUXt63/iyi8B7cU441JoY4M
         izi/efQPWlBxfZBraCs3Yl739Xv6sJ4CTIVk1cPNUZFf9t+WUYgdjUOZm2GrqvhwEu5u
         h0WPXtXgNLFpEr7QJ1OHgoBHN57KPk5cVaLLWwb+4KFs+4BOl/MgZ459Nblj1/zIb5z0
         BhdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883756; x=1773488556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AhZtQR443/E19GewAj1186Zwj+uyAl6zxJPtQ9r8Toc=;
        b=DT53LALJ5hG53xzjczYykrpOh9QAz5IfKS4P/eYzsyKKnYp1BOQklyw+rd5kqG/WJB
         S3OmcDjCPHmjtQiotG8Bg1DK18Ds+6TwrCUwW3kTMDRMIXFS3L8DYcDqRsTDQmWHE7xc
         omiUtMHCd4bZsCmTzlDfEd2ukge1K+uXAw/Eeg0JIqEKTqWaZnMKjQRpnvYzd1b9MgnA
         wFtRACqa1cHqUVAqNWB8xVyanrqcFQqmCkj44bfxHef2/dH0Zi+DsvmFbMcmiyiXXVCc
         yYR7f8uzlk7f/im7BbDL92YFI15hK/jR3T09+yAEfoTBf9Gj5wfqJCtRUFz855lFCHjN
         6xUA==
X-Gm-Message-State: AOJu0YxIRXEm1Tus+Wv0Q8EjsYjpHlosy1qUxYN6Xknr7x+/7gMl+zzl
	bAmOBwCsxOGfeCbWndipq3CcEKECXG9V/9okdh84AzpevO3LhQ7cQ2HnRtdWJX/5S/Gpi85yhQ9
	lJgOR3LaxIG+uKeM4Cxqqm4gCdLjQm0hU0iLZ9MFttxozNW53t3IIB4ZQlSSK4ZE=
X-Gm-Gg: ATEYQzzbtyA+tGVOgFTeggagUGQWM4UoB62TnWq2kztVAvcEE+dMkfSypC6m1kutORS
	N6eFd1Uim2y3gg7K9+Fcyuhl0frFWouokxFVVeY9kl5xMBe2kTjRKP5u0Y/rd5Md5i3wOn84pGQ
	VxNkHxCKnKf8boAi4EeYrhsX4/r6GfyCoVrUTm0bTqAasoHlncoXvQ/rtF+hugBQ2h5fjI3jqtB
	sWf3+Vg6q/aTz1cDoW/xCLvrraXAqALtwB+049qhwSRBN+0ExP5v7P6jJJsDzdmkT+E19+yBDL0
	UxDSAdDOhGXvR8gKakc6mpQcb495lnyyz5BM5uxaCdDBCzaWI+yJnALLZO7q2L6umjPK8l2bmzj
	4/1rXwygycqBOz1lLthKaI8g35YFAas6Pagqc8jStC9Ckuviqnf4=
X-Received: by 2002:a17:902:e549:b0:2ae:5848:baf0 with SMTP id d9443c01a7336-2ae8241685bmr59503405ad.2.1772883756452;
        Sat, 07 Mar 2026 03:42:36 -0800 (PST)
X-Received: by 2002:a17:902:e549:b0:2ae:5848:baf0 with SMTP id d9443c01a7336-2ae8241685bmr59503205ad.2.1772883755994;
        Sat, 07 Mar 2026 03:42:35 -0800 (PST)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f8c713sm47996145ad.66.2026.03.07.03.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 03:42:35 -0800 (PST)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Sat, 07 Mar 2026 17:11:30 +0530
Subject: [PATCH v2 9/9] Documentation: ABI: Add sysfs ABI documentation for
 DDR training data
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-sahara_protocol_new_v2-v2-9-29dc748b5e9c@oss.qualcomm.com>
References: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
In-Reply-To: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772883713; l=1903;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=PYlMjATY4SM1+jaLjbUMOn336QEIJpGFcRpjUcyzz/4=;
 b=w+aHsVXwaMyLhL8Goe7uM28s40e002IzrEGaReObHvVofLk2hwgKkxUc87dYK5Uy5uT4SJ0v/
 IsfocM9Rc+BB12kavhO74NwlBai980rYUSUPMwBcVaAgD/rMcxEMAB+
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-ORIG-GUID: V7bHHUzE6cuykCVQrc4otRfdAtWBXGFT
X-Proofpoint-GUID: V7bHHUzE6cuykCVQrc4otRfdAtWBXGFT
X-Authority-Analysis: v=2.4 cv=OOQqHCaB c=1 sm=1 tr=0 ts=69ac0f2d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=dkV1H7vRkoxx0F9zaYgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwOSBTYWx0ZWRfX2qC5CQdXAwLY
 SlC17TTn//0xaWyWNkvHV/Mdo1sTgBjb+WVpZMZAq1/K3ochiuosz+YQ+hb+wAhwujVdh4YY21V
 B61waFKGbHb+2DtL0ZTcOu8NWZ7DYgBZuvCgFv4rPLkob48899UaHVLmJ7nsSocEAH4hTvcvN+I
 +EjLsMf2Kih8dD2hKcTkmHnkY5ASjCLzGrSLID2cDUZIIK6C/NR0bcJ37cdZ3lKApZRx5NYTqj8
 gUMM9zXnlhG3iALgpe0cUrfq7z7zFgdpBVG+02+j0IWV4Y9AbEr+PyIJN/cLVQcMOF5K8imP05t
 7ALnAuO+50PJildG8ZTfDcj6Lkz5DnUpbnw1qSrxsIYOxnzmNPzY/ENLXMI3/ab0hR+FR9vERSk
 RF31j5PwgIZvpMVP3a0Tq11Ptwm76RFwIZ8PjgwApP+E8TCW/1KW0Tn/L4xPGWDWco6bySQQItI
 mjas+aQFgb2dGfrUoFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070109

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

