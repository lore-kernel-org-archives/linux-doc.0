Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA222FFDFA
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 10:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138912; cv=none; b=SpSaN9yhNoyaq5r6rO1f0Q0R26O3pEW6oyfndpeleMarAIGIh0jtAZw4L392nd5RhyfeGpUsGTE/+PSPpLmku2aHZTobwk5JF7XiZdXv0J4XK04TKOK5Fy6pDKL/W8G4QllHORBFPa2AI6B7vPksgIS05NgZjW7xiqFYo/GEPfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138912; c=relaxed/simple;
	bh=+yW7g724zkTvi6c2Y4D2hyvIoUGp0kLpwcBoXePSCu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rv7+Gyzho7kWngOuaHCDAmd1JsNC7y/2B573DKlHylAbDYFpQELopCJCtN0yWn8SmglNkMQJQnknWoH94h2Fo2xhg6GlTdL94YMB9bzCpnjDa6mFH0iyFzViWwnqL6PKPZ9JDmN4gk4Z0M9CnUa9rfHKPaUzRRdjHKcfJpT+WWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=owLOZ6PV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PC1VnIu1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="owLOZ6PV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PC1VnIu1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cJrr3700755
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 10:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7KsmdZ4x76VsS5fxr1ctBlIdVxj1CBW4LZiVMfMrgUc=; b=owLOZ6PVkqobpWoy
	2YnJ5PHAAAu0NsHXzctawY2nmaC99xDHV3sr82d3vjC9NO7Qa5A+EI7KYeLUp39T
	JDieAYDU4slBSYkp7opowKOKqJBzCOKqZ4x+D3co93m3dfMZwcagjwXVTsKu7tfR
	JyAOShRQjDj2YRUpIMAIsMGc6tLRJq1z95oWKr948+v9DOxyJixkgVMrF6q1Hp/3
	TS4/0eYERadIHWIwSTfPj664yEyvNXLed9kHG2eZZIuYLLtc+crd4vysxiQbylvA
	NXW5j85Cq3pl6DcFx82XH8QiOWg3L/YrnyMd1yotx4EwL1Kq9GfawfYBNdXw+wBp
	n+fCAg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ej6x9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 10:08:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1d60f037bso32406661cf.0
        for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 02:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138907; x=1766743707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7KsmdZ4x76VsS5fxr1ctBlIdVxj1CBW4LZiVMfMrgUc=;
        b=PC1VnIu1n2XD4d8vXJyA1VECFTXywyMW0j7+7AV0A6ToTqNjjURSStOAau3bCF7HZm
         g7kw9Wn1cC+H6vD+YaP7Did3vlX8cSgTJ/Tc8LvoIC41Nw9tav5KEC9xpeRNglDZAqEZ
         NLFj5BX84M1GDSolzXkJGfouit+7AOepNnTahVpIq3l3R+pzPQjWHPwtL71iymuk+/lc
         iHZVbYZnyO0+2QlIA9oLlTQtyaxYXyj1a6nA1Su6/QZDzkWhLlASEoHsUEVNtrXm+F9z
         gIOiJHjGnegn/YTbaRf67pzadBCO8q+RaWP4ObgMhFW0Ldf/ZE+6nEMw4UjL55FBLOyQ
         0Rew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138907; x=1766743707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7KsmdZ4x76VsS5fxr1ctBlIdVxj1CBW4LZiVMfMrgUc=;
        b=l8FGfNNCfYLnWZMMv4iw6AQjlf6tWxhFAye0J/TSggmNvv/gP4i9DdohKZB8/pFFbt
         9an8W0ah1LxIWwv2sGAFHdZ5VzvUvSvvLfpFuESGHQjKdSbm+jp2Kl3DOMApag3nSFt0
         OAtJ4kX5t9NmJ/zkdW9/w1PkIEQ53vVLsMNtZGGgJEBsoiXGiqTXiC/oodxqrPK727j5
         oPJHMQwAS8akLICRpxnOA6s0W0MFhDk8zyfgF4Gm8JQOgs+MX3zybH0eOH7M6Rz5C1xh
         pQ9l20PePLehLOaEcSxDRunbNKI540q2Bw9182RIb8NwErFX+BtgxHRxoRAAywf4c8/2
         w5fw==
X-Forwarded-Encrypted: i=1; AJvYcCUv0hH2GiIKglbBNewEXbppKUAH3A8+0E8vWB9Z/BLdsn9VThqgEyoWwosgSmuNk9zahQB5UyvkcfE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhahzBEVnjDb7lFiFWojWQ+xf8nY5PTtkw31//LpcnyjJBhNa/
	dwhMl5olpOPPwaHw5trxf5xVV9QBwQrZQcZ30UGzJj1qodmuoxsvOyFUQ1eBzGL6QHVyUbG6A1b
	6wZ4eKJpgGB0hNOJtR24Fs/XD/l8GpCWRTTUVgDv9et9Uh7e8Pvthv7uTx3FY5kw=
X-Gm-Gg: AY/fxX6SglYtiBAkWuUDbWq6M+Aa6LyNDF3U4qmENA9fL4dL2c8kDTXP+YNnaR7eMBB
	Zy0g88vhUbnWgFNfbR1Ff9KsiCJ3IZFPRddtgM0jbNJxLz+z6OawAGl5mlG6TsSBwO+vTFwosLR
	qap7W8ekQi9ZXpJkKoJJRJFgmjZGYXD3MtfbG/56QuiIC3bMDtlQkUIAFcGZfpq0MgxImMBwb7k
	Lss37YxPFC6KCzRGsA1qX1xNCqz9BpCqzdRIBf20shUg5Cz9MkBbWd0oECi3PZ6kE82O4n+zRaf
	zZVYKrdXDK8zAlM9yKgEx8yw3KR5Pe6CPgPFz2b76+xJW44aUiR5UG+g8TWUssvHEJFiU3D9Wdy
	FnBw+f7NTyZ9knDgFKEJ1LMEQnYjo4OAao52UXg==
X-Received: by 2002:ac8:5dcb:0:b0:4f1:b9c7:18e7 with SMTP id d75a77b69052e-4f4abccf5c6mr34585661cf.4.1766138907171;
        Fri, 19 Dec 2025 02:08:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVRhXji1ckLD/m55ts+YyuKwNuhTK57fef/BjMCO+TpK2cXQDnhsPIAXLhF6EwDS4P7T8fHw==
X-Received: by 2002:ac8:5dcb:0:b0:4f1:b9c7:18e7 with SMTP id d75a77b69052e-4f4abccf5c6mr34585431cf.4.1766138906730;
        Fri, 19 Dec 2025 02:08:26 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:a48:678b:dad2:b2eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm4209571f8f.27.2025.12.19.02.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:08:26 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:07:40 +0100
Subject: [PATCH v10 01/12] dmaengine: constify struct
 dma_descriptor_metadata_ops
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-qcom-qce-cmd-descr-v10-1-ff7e4bf7dad4@oss.qualcomm.com>
References: <20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com>
In-Reply-To: <20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2241;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+yW7g724zkTvi6c2Y4D2hyvIoUGp0kLpwcBoXePSCu4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRSQNfXlXxoKASScjNexD0hZ6xbMQ4AugwhXcJ
 QtIJsvcd2eJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUUkDQAKCRAFnS7L/zaE
 w4nmD/wMOcgJ12ky6dBNZro/3cEdNyVhXZMXROTbJhW5DdAI9vURbsijk+VvT7ztuHXv22Cyn/c
 sZzVeFB8oEPldbm+ZdgeLteCQohv5oUUUntYsOs/J91F3JoeWnl4YdHLo5cajw4RVcWOduQR0F7
 LLm0E6kfE35ed/hIpHIy60TDduWQqvpyU7J40R7VHVm6o2nFPqycgXyo0qOwk6jp5bQD7uW9vV1
 NXbLKCvriJ3PPHRolnomJ6WArmekBtYZmQknlN0IhmOcoDkHlHKi4IBB8SvBL0vEYgeQVhvQfH5
 vIocD81ia6ZyZdTcDXm5eziqMLcWS6brIjc4i1IBd4MVQsSIstmBvQrvhPRwh8Okj27gjbd8525
 uHDLNmoYUkMKpWsUvd93tPcoyz7ksGR75zDIUWsidziGi2Vd3EdIDhZLItlq0SJD4pNIbaMr6oI
 oN7h/B5/RRNSzQxtQx0pLzwq+iKUmQXdiVerrWRx/kZByJZKV0iFrqQ+CVtmD2F/O5FSonQkDKH
 B8ftFXwsko9xknwKX1F9cpQ+tAu42wIUOccTXq/z2n9bAPJ5HjuS6fleF1BI0gF6tXPg9s1TZ3D
 eW0wgb63pVTkHRsCUS80tKAHB50GqUyI8eiPkL5FB3/HqMWJBOoeNG3NEhHgUafYWqIcQV6Rtl/
 rwSQiRrbvpiLrSA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: tUpTfA59AOrujL3Pi7I0vKimsFS3lC7M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MyBTYWx0ZWRfXwycCWn6bMQk9
 KfO2EudMzit/ctD84bJF6qJ3qSY42N+woYK97g/e7jan3NOsohPqDvQhO6s3pOVPG7GPNUPcsS1
 uCT9qxh596melN2LGipHbsHVdf1RBBJWsYY3VGgp+6njEtE6rlxpdOt8e/fq9W2TiIuP8JTBfv8
 jmdWw59cJ0cY2MP5cTBSsTTFML2NnshYzW0vu1P4pZVP8Rz2JdAHEnEwKwOkXnUZqhmu0Z7mNn6
 F8u8BRg1JZ+o8YocgPmJl/jZy2XPIPc81tvO5ALH1SEykVqzCGT2gn0zqNqosHYfoF8v6+Dz/eO
 wGYQt3KttbFWvq+uBI63h1a6uL1vfxMViPS0A2h2el/Yt1SeZn8uNJRYoNXyta1HW6+VBKu6vu1
 bTSWe3CqFZEY7PEr79CN8s6xjGLXoBef1MgVydj/QZvYtGu+8AH58HORAe+8f/aVcZ4yOUB7p5x
 ySrR+uzCrB3QrWbafqw==
X-Proofpoint-ORIG-GUID: tUpTfA59AOrujL3Pi7I0vKimsFS3lC7M
X-Authority-Analysis: v=2.4 cv=EabFgfmC c=1 sm=1 tr=0 ts=6945241b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=XeVHrwws4l7kqE2Ex6IA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190083

There's no reason for the instances of this struct to be modifiable.
Constify the pointer in struct dma_async_tx_descriptor and all drivers
currently using it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/ti/k3-udma.c        | 2 +-
 drivers/dma/xilinx/xilinx_dma.c | 2 +-
 include/linux/dmaengine.h       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index aa2dc762140f6eee334f4506a592e72600ae9834..75c8eed063af8daf68cd68670abba211740dd11e 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -3408,7 +3408,7 @@ static int udma_set_metadata_len(struct dma_async_tx_descriptor *desc,
 	return 0;
 }
 
-static struct dma_descriptor_metadata_ops metadata_ops = {
+static const struct dma_descriptor_metadata_ops metadata_ops = {
 	.attach = udma_attach_metadata,
 	.get_ptr = udma_get_metadata_ptr,
 	.set_len = udma_set_metadata_len,
diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index fabff602065f6cba23cff7bb4f305a3504230a02..e2a40e8dd4b20379f337c1017f8accebeb914645 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -652,7 +652,7 @@ static void *xilinx_dma_get_metadata_ptr(struct dma_async_tx_descriptor *tx,
 	return seg->hw.app;
 }
 
-static struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
+static const struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
 	.get_ptr = xilinx_dma_get_metadata_ptr,
 };
 
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 99efe2b9b4ea9844ca6161208362ef18ef111d96..92566c4c100e98f48750de21249ae3b5de06c763 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -623,7 +623,7 @@ struct dma_async_tx_descriptor {
 	void *callback_param;
 	struct dmaengine_unmap_data *unmap;
 	enum dma_desc_metadata_mode desc_metadata_mode;
-	struct dma_descriptor_metadata_ops *metadata_ops;
+	const struct dma_descriptor_metadata_ops *metadata_ops;
 #ifdef CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH
 	struct dma_async_tx_descriptor *next;
 	struct dma_async_tx_descriptor *parent;

-- 
2.47.3

