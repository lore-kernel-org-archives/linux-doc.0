Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF183FB055
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 13:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779801092; cv=none; b=qErqIZ47sdXpN74eXaenf5pRUIbzepwaa7fphzOEOS3g0+PJqRNktoanjZliQd8c0khMucOx6ONMb68RHusyeg+BWruVuT1aIxwG0UhaHocIn6Ia/CZimT7gOj1aWFpl7igR+BtTZdvq57K14GxqNFEe7KMfZBE+322I5z8/z9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779801092; c=relaxed/simple;
	bh=W1SOKd2RIQ9nozxC+fLn2sIL5/s1so7KiyQzTPwT+38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lFFcA4AHCjDwCKzn+vbs31FWZZXVZgLFkDjSlN0iUAOfMjV/xw98W74v/bL/fmM9JTeXHhw/lLjRjrbI9fpdpF4P6khPoPcbNtClxyJy/DZTJObW5X9fYmFFIFWWPJrrpEfqpOHaY2u7HrE1vWuFrpBwkq+yOo44liCPcD5K1mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EL3VlKhP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UQS/yMJV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EL3VlKhP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UQS/yMJV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QD41OC3693595
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 13:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4MzlzgFENj0SGuc5BtzYXGLVYZCfinPwBm1XxV5rC6I=; b=EL3VlKhPKpTo8VtD
	DLli+tRTMhesH4IaeOloJm2olJfrT+88J4LsNG0YQgypjCEvqbRrc0MUsrUrvVTM
	LtYFwCY5AlRgSyriX7j2kWsROltLk2sP/Xq1zYwduote8gNdS/EsAe10ksAlNcN5
	KBj8qqx+CtWAEnp2mp225Q/FqX8ybuv6D4m+vqljxdvwJQb2+14bSvg+zScYSSqH
	4ezzgQpbBcCVt2q4dlW6DFNHez3WMXtn8VVTzxZZvitom8KobB/aDWZxA8DrvyqK
	9eUJAIbm00iontObpVKfkfCoLWjhwzhBWOYWFjEyrLNS942DMy7SJnJa4D4b6jno
	6S8Qug==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edc2yg1sf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 13:11:30 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6751db2792dso1854752137.3
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 06:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779801089; x=1780405889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MzlzgFENj0SGuc5BtzYXGLVYZCfinPwBm1XxV5rC6I=;
        b=UQS/yMJVR39QJ5wx69UTjVCJCU6jeGlnf0bAngvIk/3TlmG4L1pCqmtmEyaVLCpfNi
         7387NCuDIRT5p5eQJ5IAFSPsEDrfCLcQJF8EYM9mq1K91d0jEMKG/cJc4ut0hZj7PVzO
         daz0kpk4Dc8NjWbUT52/zg4+t5R/Dl7pk5AtdTQn+NL1NY6RyIgy+D8YIKlNiwVAFYTO
         xxeGDuTAn36Gp/D+tYkOKWtSJh/24yfibQ/H4LMO77C0TFmIdl28bHAvTjoydsNH4NmE
         5+RfkJII7TKPRlU/7A/Y/BYiEvJ8Eagdh9OuYR91ObIG++XdlIJiLR1eS0RAERF9H+dn
         Vz7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779801089; x=1780405889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4MzlzgFENj0SGuc5BtzYXGLVYZCfinPwBm1XxV5rC6I=;
        b=ogZcUckfHHPBlrsiIj+85YTZcPrfkgQjo9qo9VB+p2LURaT6PxCyphKutjJzFr8pm3
         zWE6hKf5WIJ/dRtnYQTljXfkyoSSW3EQlQpzkl8cJMz9Fkv+Zxr7vAQ692dXIhEYvflg
         oZYg26tni0eUApA3Cn0beRYfy7quqQNMHWPZoPJgw7oR2Ryp43dieCINL4vDY7lf2gVg
         SSEB4ed/ruhNk4LwtWi1hegbAEmeCagbpXaOkKYxt7uI19nQtW+Pbdt++TbwosxvTgys
         oCthJLxoCJNEXkB8QLNDjWBsRDyYvR0ZD+eZinv95ZbAncix+BLPH5gFkoXNgvr5zg4/
         24nw==
X-Forwarded-Encrypted: i=1; AFNElJ/YpwBl0XkoV08cagNirJJ8feRT++v/sHTzB+twB/PDrin42F8NNSJjTUyPHcIPoiNE+Dw8iVecQCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwqSW4pjH5F/hTedfKjTQbbdai6ojIW9irimyctAo4Hbtwiar8
	8rLwVrVTUa5QGglc9OJE8D4Qt4VrYoam5qfNCBCodn6LetMmxmv2H/n3bwU1wgBVy9Zx1EjoLNi
	BfUWYWoFTmcux1ax9W8r5DCyLp3YA5EgLzliHoSjYXOQ++eJfxWGEPySFsI2b+qHDzOfjBiU=
X-Gm-Gg: Acq92OH690JB5gPbOF8UMeN/ssa7JysNQqas/9LUq6ye9C35Uj1DqEGbSyqUsh6uY9W
	fUfcCDupc1Q2HswPJR88z2PPKb/oaehBJ9jNOwpFiYS9a+N/s4dww1Pu7/6ToxgNlmtq0p6innE
	MLPiMF0vroz5ojwO/54zGkqR742QLs4Pffp1WlHjNW2s5bzN9SYDaom3bqUEFj9nPLoTYkbUjx1
	dD+Vegzgc0GkJdH6rfcSZokSmoHQkgp1OsB2e6WPl4lRLPIq7F9gIA5lYx1q5GDRH1Fw4IEb+ie
	00MQJWufEs1Ls9yeWEnk67K1rYPKQpdfnR6oQsz5nZFhQATrwH/2omBLCDjyBaK/2r6GzdUVQ7A
	2c4GbRsbAyOA+K92h04CiCWJkyAy5lCbzkfgP7pQdf6ZmCZb2VV5AE5gjvdjsOw==
X-Received: by 2002:a05:6102:3e15:b0:631:2472:e832 with SMTP id ada2fe7eead31-67c7fff41dbmr8318243137.8.1779801089262;
        Tue, 26 May 2026 06:11:29 -0700 (PDT)
X-Received: by 2002:a05:6102:3e15:b0:631:2472:e832 with SMTP id ada2fe7eead31-67c7fff41dbmr8318181137.8.1779801088719;
        Tue, 26 May 2026 06:11:28 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:15ba:1d70:65ea:9578])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5e484sm34259426f8f.30.2026.05.26.06.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:11:28 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:10:53 +0200
Subject: [PATCH v19 05/14] dmaengine: qcom: bam_dma: Add
 pipe_lock_supported flag support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-qcom-qce-cmd-descr-v19-5-08472fdcbf4a@oss.qualcomm.com>
References: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
In-Reply-To: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1530;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=XWQU2M8GNJi1hTXicUIAjauPbHJI4z5KvicdSabu0NQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqFZvsBil2ok+w4T6U//UrDGniLgPdz7SgFTDmi
 XqSwfkI+kCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahWb7AAKCRAFnS7L/zaE
 wy2XEACuFrcK2feOu+lrKAd8U6HtwFQlksXURX5scLbVJhJwrkfs+36Nm1ElbTghc/YDaixxI0t
 qTcdKbkQNAY1Lj0H4hwEMCVdQcclcPofcTtvt94EuA24riGm3o4z/kU0hOi0kMMftMSq02uJlS5
 CxMy9RaV5m4P3e3+OgX7e5ikeGIM/vmLAuo9Fz3pBtsSI+OqRNbhFEYm7XO27Up90UfUl/ul99/
 Qtj137V3CbapUiQUVCVKarbJ9+BvPMQD8xiwv/+4Cefb89tQmWvWFFJVarRYuU0l18ZJio1As/V
 csVRhBEeplMDqc9pbunOnfPUBZITMbOMcfIYv6y3g9VjjPpw8NzYRthGKf/1ygyPKzGHgThLYH4
 GNV/KrIZeZQztPmz0opQ+L11t5SRu3ua+jIs7QwWkcS+YEwMgA0lEfn3mEFGQOe/iqT51Dtbvuc
 GuO8bxp95l8fyY9N5MUaDhG/HE7IqertdXFEqw3Nv5P+RVfmeHwclBS9kJ/t647/Atq9nR4WK0U
 EX3eTxE+sl9lCyID2eYPB8me3Usaix0I2km7PtvZlLFHdCMUqSEMBPDKKcbaE3j6nvYNWAx5ta9
 YuRzKQmNzJvbXRMsNpX4CBReFikdaUvHy2TXG/WIbTVxZybsDRXb3sKfTC5SbDA9qGweBHpS9mD
 QFqiM05R4l5US/A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 7w0n6rZwNnJEn81-uCXU1qHhSpiV1Wv5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExNCBTYWx0ZWRfXzg1BM1z3ffZe
 ZCVZDvCKMcpxUqOWyWyrykOYgW8woVbO2keNx7gLNkwqdkozHPecFvdEZ0JTSNz/nGRDzwr21R2
 /4IFzt4QwNLVkc2umYk5P1ldTb+pTvbHynhy65wsIyfil8zp1HSZKg+z24MBrrvsaJyrxIEc9ul
 I+6ViegZgJ/jnjLhoagzQj20K25XUo4SlmOLKSUkBoM8B7tRwFk9UPOPOuSJzlvurovespmxnpZ
 cELXls3Hn42s7VwUFMdrjhe7Mmc40QRNq5XcBdvEwKJlUTvpJJn1atdu7QNgmhxErFh3cc1tAsF
 urrIeQud3T74wkcbZFGEGwaWSgc2/S22b2AKUza4umsC3PDPk6f4cmFrXo2HV8ZW3hE+0R9iwkM
 KpV4+1GTrDVKq7LVE40s6vDoFgnnnPB0D/NpWQfq1PeREENaePg/dy46Bazkx/dVGTYyoWd8eh+
 DoVOmikgWChyYBKYz4g==
X-Authority-Analysis: v=2.4 cv=CYg4Irrl c=1 sm=1 tr=0 ts=6a159c02 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ZSnkYuKn9ZpO9KHknGoA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 7w0n6rZwNnJEn81-uCXU1qHhSpiV1Wv5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260114

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the device match data with a flag indicating whether the IP
supports the BAM lock/unlock feature. Set it to true on BAM IP versions
1.4.0 and above.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 2129ff5261571581a2c086c13dd657dc63e16f90..04fe1d546be73f074c66c4a5712ad65717e10929 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -115,6 +115,7 @@ struct reg_offset_data {
 
 struct bam_device_data {
 	const struct reg_offset_data *reg_info;
+	bool pipe_lock_supported;
 };
 
 static const struct reg_offset_data bam_v1_3_reg_info[] = {
@@ -181,6 +182,7 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
 
 static const struct bam_device_data bam_v1_4_data = {
 	.reg_info = bam_v1_4_reg_info,
+	.pipe_lock_supported = true,
 };
 
 static const struct reg_offset_data bam_v1_7_reg_info[] = {
@@ -214,6 +216,7 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 
 static const struct bam_device_data bam_v1_7_data = {
 	.reg_info = bam_v1_7_reg_info,
+	.pipe_lock_supported = true,
 };
 
 /* BAM CTRL */

-- 
2.47.3

