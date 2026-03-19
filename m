Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAEA1DDC2B
	for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 06:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773901946; cv=none; b=XrTLlMSvZ6LUQDvpyKz2pzcLGiZT1CpaR74U6P69GLzPF2waVmMYiL8m4wx1kcca/6b/3hCD0Zi8o6q8kRBRVdlkMDp6UhvcwU9xBCHN4wFCLTBPiGqTFUnfUoykDuf6kQj3YhfOP1+rJoQqKe1UGGFp+IWdFtR9bve4A6bi4E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773901946; c=relaxed/simple;
	bh=zLHdxvYlh3SgJM3zwdFzuQdChe4Q/8MyqXYe5cHG93o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hh1vrozpQU8T5EVOPoyEorE1vnNMDZiaADQtZ7DCJoTW9fy3yClrSNFK6PrppzC8TjXTrz6fdgeZCA0rWgWwgYajzfc1EBV0CEcejTX53bNtVbyruPZJutZxJHgwNA4Uc8vyte3aaIcNjBUeljlWEtdrm65wSg29S5MMQElgVIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YsLNHs4E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ADrZ42HO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YsLNHs4E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ADrZ42HO"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5XoUO2470046
	for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 06:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iiXrCv65t5Cfe7JS9CAoM+yCgarvykPh0XYvrPKdD3o=; b=YsLNHs4ESlAlVBun
	SQlyjD5zscJyYzZ7SvkeNmzOkYaKxSikbLg1ELzJJZTBiU+CnRu0Dx9bOa+N2KnG
	nCil+AlRj/yvaGwbkgjj6glQdR3T1c4k462uSVSibHHPGdCdcfmabwlZDOOYxMO7
	39pj0Y8ztpK4W/badPXfvDZxs2VxverZt2Mw4BmjpoztOT4e0GyUK+bsQl5QwmtM
	KwDA+Yl6es15EM1RIIkpRVffWm+vHCLZS6HzUpx/Er8VHY5Toq/KgqDVsnl+ZYDo
	G9fVCXHqEVcK7L+RjRr/lD9sG72Ov3sMYc4KH9xPW6m068gobAecuggJq98q07TV
	Whm45w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj53ms6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 06:32:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae3badc00dso6696585ad.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 23:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773901942; x=1774506742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iiXrCv65t5Cfe7JS9CAoM+yCgarvykPh0XYvrPKdD3o=;
        b=ADrZ42HOJabjta4ZEQgi4Fu7uy02LXKrd0n8kJHF30hoUObXNHcn3oqwhDReNZsq01
         i5M3EYEmsrFh265xI37g9yRmX41rD4ikxWxDDC7irJB6RlFHUSbhQScv8o+btIDJBamE
         NqHwIppceUdyHWhKUWqmwd4DBDyS/NFjGpybhYDqyAWY2Q/UTGPn2yRoWkNed3YjGbtU
         w+ilV1H475mVVl+MkrWAYWUoVm3miaHZkDAYdKOwxWLFsTSXJyp7X05uV61SMIfr3vvb
         5iIGIcMppQkNR5ymDryByy3mRnMp5CkwdV7obiYbH/LxIpxOCFpH65hhGMemW/KF6SA0
         6Mpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773901942; x=1774506742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iiXrCv65t5Cfe7JS9CAoM+yCgarvykPh0XYvrPKdD3o=;
        b=QT9CYmG82Vw4I2IkQ97J+wNCTU1PanNaCwf0qOlsBPSF/UyO1PrTsExgdz/oOcZj9Y
         MD/wJdsLgeNk1AobIDWvFlChyqXPBClmLbQBQ7LM9eH66umJ7jxl/3tr3Zkhkm9kdWr1
         k2qVe5M6w6aQyI2ZEPejHJizw8cD7sAFxISGhOv6g1J5YS7n2Wu2AcmOl4gBSKaPNNtJ
         NOVDz+MNCFHGSKFt/dwNDM2zbSz8WR+kYL6ibNzSiRw+jBj+Awr7N8iONaNfFT5zy035
         MOrVX9OPzGXS1FaCiAwCYlrMk0lVTr356ay3VQdE8SUmYFJ9IPh/Jzhsw1nMTZ6LMhgr
         WBDA==
X-Gm-Message-State: AOJu0Yw/6tzEaj3n51dTMsWTa597YwRuDUB+3cjvC5qabq5DElq3HQId
	0cv/D+wZtvbi2CIq600p7Iof8ZVz+Bj45zkF9rsFTsDLwe/uPW0cOjiae3eh8KcId3w1bGrgpr9
	HNe/+w9j8Px4K3w2Ykn9YU9oD6X0bRHHuWZ6+B8829LM9GUcMzOiVNvTTrPeNVB0=
X-Gm-Gg: ATEYQzxKyxjXaj5z5tqb7Eu0GGbAdIF9OPcEJ1Fsnv06jdz0o7qtWQT/eWlFN11p7nv
	HjDCPGVDiEOQUu3ytgM3q4id49qXRcsgpTHHOkQPo/T4x1tXBr9aecwvvgEKB3TDP8hP6Pm8dZU
	WtOHpJYTTiCLGncnwptIAfboIlhA/tnowDBDaM1QYX1ZquvZNMEKgg6EcNCosK6U+t/PIq08VyN
	rWZLHpICAn6UXDi/yHyptfKUrp931qt/m9X6FS+9jz64bXaY0B+wYIpZRsEKzeb1yCPSHhOvk/7
	7o+QpIhRMYxVqsLveEknx3fpccotQdsogunpTukUvXjKKwmTCOTYjHWg+OPhUhLx+NQn08Qn532
	SgFwXCv7mt71yyBh3i60FKnthl6dJHWcTalKhzkphBT6tELcF8/M=
X-Received: by 2002:a17:903:1a67:b0:2b0:5a4c:726a with SMTP id d9443c01a7336-2b06e41afc9mr57939985ad.43.1773901942222;
        Wed, 18 Mar 2026 23:32:22 -0700 (PDT)
X-Received: by 2002:a17:903:1a67:b0:2b0:5a4c:726a with SMTP id d9443c01a7336-2b06e41afc9mr57939835ad.43.1773901941736;
        Wed, 18 Mar 2026 23:32:21 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e603937sm48572485ad.57.2026.03.18.23.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 23:32:21 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 12:01:48 +0530
Subject: [PATCH v4 8/9] bus: mhi: Expose DDR training data via controller
 sysfs
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-sahara_protocol_new_v2-v4-8-47ad79308762@oss.qualcomm.com>
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773901902; l=3311;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=zLHdxvYlh3SgJM3zwdFzuQdChe4Q/8MyqXYe5cHG93o=;
 b=E912BIRgk2tIUK4/M4i8++DPEcAM8x+0kS4yuwICPrM81yr9VdRFAzP87se9p2qP1rqiZUxb4
 9ZzAK2xR+g5DkO5ycJfNGU8vhWZhLd/M+V0j9MwRw2DwL6pPFoJCvz0
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0OSBTYWx0ZWRfX4YgjLegItEyM
 H1sOoAIBOi/D7S+rT1XKtlPj4K4FgkCS/M5a718T/vhdZmDROYb//HdehPXrktclXGRC5WnyG20
 YBh8hJqWpTytIP4XJfM7ooxe/bXTKdPGNMLztgxsjvlGTobX++zmHspCJOA/Z0o74S+HzZ2hBDK
 /Rx5i5cmi9ovEjQa2ikRnmrlKFK4RSmJgpkw777lGEQc1V4a+uBJPaozVkj2hMI+ctNgK8v0IY3
 9HmeboR1o9HtXWtItBal/iKVkBmHizGXoRuEfbvRf4SdkOz9wZJVQVzjBWDeyNijT0/7teUbNDH
 DKOm8qhB1OBo0LlK5tKH27zBL8E7R7wGByeAovE1wcaohH2nhGas0VT4YL52F+TsdIG/Rp3KQYi
 Qit1TsMDMWWk+ZKPL+0Rookp3bZpe4A1qTKPWiL6uiTrUw5dpcqsYwpmIhgf+8W4sHMONj3K9wP
 /PuJxnVjm9qXn65ClRA==
X-Proofpoint-ORIG-GUID: 29HEn2M1pB7gDegPqCqWVbAu9ByonAFN
X-Proofpoint-GUID: 29HEn2M1pB7gDegPqCqWVbAu9ByonAFN
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69bb9877 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=9mPLix8uEUeM4unapbcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190049

DDR training data captured during Sahara command mode needs to be
accessible to userspace so it can be persisted and reused on subsequent
boots. Currently, the training data is stored internally in the driver
but has no external visibility once the sahara channel is torn down.

Expose the captured DDR training data via a read-only binary sysfs
attribute on the MHI controller device. The sysfs file is created under
the controller node, allowing userspace to read the training data even
after the sahara channel device has been removed.

The sysfs attribute reads directly from controller-scoped storage and
relies on device managed resources for cleanup when the controller
device is destroyed. No explicit sysfs removal is required, avoiding
lifetime dependencies on the Sahara channel device.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/sahara/sahara.c | 69 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index c88f1220199ac4373d3552167870c19a0d5f23b9..b7208738df10fc3c3895acd46873412818dc1730 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -415,6 +415,73 @@ static struct sahara_ctrl_trng_data *sahara_ctrl_trng_get(struct device *dev)
 	return ct;
 }
 
+static ssize_t ddr_training_data_read(struct file *filp, struct kobject *kobj,
+				      const struct bin_attribute *attr, char *buf,
+				      loff_t offset, size_t count)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct sahara_ctrl_trng_data *ct;
+	size_t available;
+
+	ct = sahara_ctrl_trng_get(dev);
+	if (!ct)
+		return -ENODEV;
+
+	mutex_lock(&ct->lock);
+
+	/* No data yet or offset past end */
+	if (!ct->data || offset >= ct->size) {
+		mutex_unlock(&ct->lock);
+		return 0;
+	}
+
+	available = ct->size - offset;
+	count = min(count, available);
+	memcpy(buf, (u8 *)ct->data + offset, count);
+
+	mutex_unlock(&ct->lock);
+
+	return count;
+}
+
+static const struct bin_attribute ddr_training_data_attr = {
+	.attr = {
+		.name = "ddr_training_data",
+		.mode = 0444,
+	},
+	.read = ddr_training_data_read,
+};
+
+static void sahara_sysfs_devres_release(struct device *dev, void *res)
+{
+	device_remove_bin_file(dev, &ddr_training_data_attr);
+}
+
+static void sahara_sysfs_create(struct mhi_device *mhi_dev)
+{
+	struct device *dev = &mhi_dev->mhi_cntrl->mhi_dev->dev;
+	void *cookie;
+	int ret;
+
+	if (devres_find(dev, sahara_sysfs_devres_release, NULL, NULL))
+		return;
+
+	ret = device_create_bin_file(dev, &ddr_training_data_attr);
+	if (ret) {
+		dev_warn(&mhi_dev->dev,
+			 "Failed to create DDR training sysfs node (%d)\n", ret);
+		return;
+	}
+
+	cookie = devres_alloc(sahara_sysfs_devres_release, 1, GFP_KERNEL);
+	if (!cookie) {
+		device_remove_bin_file(dev, &ddr_training_data_attr);
+		return;
+	}
+
+	devres_add(dev, cookie);
+}
+
 static int sahara_find_image(struct sahara_context *context, u32 image_id)
 {
 	char *fw_path;
@@ -1272,6 +1339,8 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
 		return ret;
 	}
 
+	sahara_sysfs_create(mhi_dev);
+
 	return 0;
 }
 

-- 
2.34.1

