Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292C241169A
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 13:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947694; cv=none; b=ZewuGOCGorPfqs9B/0VIKyNt05r/BpvJbYWuLoAyGNH0/rxJtm3dXsRWKu82ajz4I2/mKAySvlU6qlQ9s3ZJlkrQeaIpGnpu4ET57uqsXpHYi4s45NvWaC19EQn67AfZSjVwToaTgB4vLANoWFKPVDAAAtl3MexREwoxetNbEgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947694; c=relaxed/simple;
	bh=T0ZAEoPGlcD+MBsHOs7IR7iXvbxs2FRnDbpOdt9CWCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ap1VclrpjsCLOKoui4lBGMaIOYhjnsNcgB5wQEZ9bKJduhGNNLH4Sw9XvuwL/gQEBSd6mSQVFiVYoaARnyaOh653xrOm2vtA4YN+gvYZqZSaljRGLakMCaJVsj/bbQIfR8jmHEAF4mEkWOZoo3Kg0jidVs3sugGdbZrkuj26TlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJFK4Jks; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i5iGQkTW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJFK4Jks";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i5iGQkTW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCEAeq1304580
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 13:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=; b=YJFK4JksueG3kSy8
	CsEOscJBC0OK7MMfArRUpRlNVdIMqiFLSsK8Rxk7/0TdNSPRnBCtCiG0+lhDxu28
	BfamHVNKBqy/hPtjgzzoA+09KlodvXoxi08WlHwwHwuh08qfKmmg4prKnYwRIy7Z
	+Po+aWQwWnfnO3w/IxNsmiY4m5NlC/GAid4Vz5OyPmmoWC8xTtKjFxuJdq0ivwc/
	InSTFrya04EUXnWu5IMjBH3kixlulKAAaIDFFNYFd3lBiGSN9ygLRbNgdzkti7/C
	m6xeANqK3lYQCtkgWlJzZxXOEUZ/brJdM/WHD05dylQ6s3zy824QgqdyWq9tDtRP
	6odF/g==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk9rq5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 13:01:30 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-48f0c5d20c6so5514770b6e.2
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 06:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783947690; x=1784552490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=;
        b=i5iGQkTWPkZGjCwR+DkIV4DjQ0ocfp1Gd1Kl+J4a5C8CtHBKRqoMwDRm7mbXYJsFgB
         vKds43yKhvWgRNiMd9QIxl2glIn4hUsBxFIyjZJu9bQBYThZdSuBJlsNlh4XAChU1ZWR
         l/NBrafJ56vpyO1v2QwdnHX59QgDqx2wHnml9qBRKAIAs0Ltglen1qNLaifvyLsXU6hf
         fIDJfHy89pvUkdi7Y+tmGYIKVlqoS8c5YXhno1/VN8ou6cO//NJh0A/7n1ZDlaopfVBt
         LPWhEePjymPC14O3TZdijNYDYOoG25YGG4Fsuc7RwTMCbKu/goF7d0IugWtodA/UaTSj
         DlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947690; x=1784552490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=;
        b=svTdVhFyN9PHBqt9HQO9TxWh1BVM9Bjnh+EU077LuZN/+vEpcfvAPOM/A6OV808oVk
         nW0dXwcUJNuxWqucWV0CNlpg5HRsrcMYUvc3OnhEVF3lDWHU7ZeWHRQceb3TrCmgBViG
         24M5RHIJvLZrpKSeY6nqZcjVYLVnjbkakXEotGjwtlNLjg7WdXgtUde7E/AGatIPD9fS
         9aybiwbXUWVlQjsV6nCRibOux2cPKNNJISCFL1l+VxQ2PDGLHokVuM2HwetikpB/trOm
         Dd9j0iDVCI/P40gW2Qs0qhHJsqucHm9wx8LxY7HLYgWCRueNIh3tl3cAGFRwRfnwPHqb
         0V1Q==
X-Forwarded-Encrypted: i=1; AFNElJ80FZh+XAqoD0skHl1B95O2iATicssBHNcBjp4irJ/0QMFew0ffOyEfClTbrN0E24WBgqzcHeQ4W+c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7sICm6rFdW6Xgdi/OaTQsTa/QXEppeQtPQlTi5wN2vXZl2v/v
	2QawX4OeGCkM9qWTSdFGfK/YvbXANN8Sr4MkSEYdisyqc6TJYQnOkveOoAdaZ0+Ff53x6Thbjbw
	Mb4fmvsRcBaxDUtpP+lbOODnmU8vc/VQpGdeECssKbz1HxL+TEO3vh75ABSZJYOA=
X-Gm-Gg: AfdE7ck8s42EBYNvgG9I0rxkdGNTNx2od9Jp+2vTES+eeeaUwPYL3gtrHokvn4w0JCh
	KTz5ToiJe29h1yLn57YoYFVtmIWVJ0x99oMezgw+0WPWnpbqxMt7j0kciOBAR0oNafCSDvlvhXe
	Cd+YtdLCNMnL5het6XgSrNIeXWQrdizdKC8/RZi19lYeGJWYGToWqIMNDmlFLVLkyLPZ9MWISWS
	8qgJ+97wvF4jHFNt6XjRa7TLN23kGyRBKRfiSZjTEtiI5aPSle0EGzTBWdAXodkFqSII5ZVsdTt
	76p2NnJLISDYXqGHlMk5fDAoolcuFLs47WQyUwVW/UNp5D+F6XDAJT+P8Lj3O1rMSyCKPM+Drq7
	R/74tjole6Wu1KfN0BHOWn+0rr+HOSfNTgQ/WCWFi
X-Received: by 2002:a05:6820:216:b0:69d:fcab:c640 with SMTP id 006d021491bc7-6a39a6cc376mr4848295eaf.42.1783947689684;
        Mon, 13 Jul 2026 06:01:29 -0700 (PDT)
X-Received: by 2002:a05:6820:216:b0:69d:fcab:c640 with SMTP id 006d021491bc7-6a39a6cc376mr4848226eaf.42.1783947688764;
        Mon, 13 Jul 2026 06:01:28 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm306129725e9.2.2026.07.13.06.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:01:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:01:02 +0200
Subject: [PATCH v21 01/14] dmaengine: constify struct
 dma_descriptor_metadata_ops
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-qce-cmd-descr-v21-1-bc2583e18475@oss.qualcomm.com>
References: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
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
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2359;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=T0ZAEoPGlcD+MBsHOs7IR7iXvbxs2FRnDbpOdt9CWCM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOGVtk23j9WMdAK9vTBVzx3ggbDwbf+8TN6Cj
 XQXTvzeETaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalThlQAKCRAFnS7L/zaE
 w6FeD/9JqF+LVP1epiNp5FsiCS3htRKz5PlF4mocU3VrUG0etSCHC1tK4PzMixQZj2Tl7N7Zok1
 j7/LP9ZI6/0xY7u7YuY9behpQ1mex/SKrXXzCId0DC1R40Gmifr67MXasXktEjiBwQNnHeouM3I
 KggDHXo4ccrCjBc9werjgP+GRdbBDWgE4lRaxZjjTOhkqAOgUrvIsv6KL/+nhZFSP4VAOtruUkr
 kJ/nzdGXfU6u1yCW3F0XbJaXqPdvE5rEi/RlO7ux6I7OXN4T7BPztA54Dc/Sv65u8TdxBn0d48q
 RevX3zqSTgmWUbfeb3PuW18MSNd7V/pU2Z2iJgHWX/1oYf0LDfwPIfcb7Pg+GWUD1WtcmVsWd7y
 DfCgRwzhPPnDaIwoeDGYK7OBE/RdtbRR25xC++dDTWSiCVlcIRvCvajQANHjzIO7NbKBNUI0uiX
 QFmbCPLc6SAwmhe1QojBH313wPgkjP9fYsCAoTwYGwW0tvaWaoWZPKrRNlDYJhNEqaSFhZJJs2h
 tesL4V5Kqv481xfqgE+XQdYFht2EAAFxyGQRRlHfzXyNPFesmC0bxRR/KG4FQjI4zOsKmphhDZl
 d6LFkMywLBDJO5nZzwXC4BIorLovMhXH+YyUuLEyqmUDehwLEBuDoPszp1uEOwmzRCUF86VVY+i
 eyex7CGHqOPsVWg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX1B4nhvTLFPqh
 jG6o8HY1E1QZm+As/sC7KG+Qmkkg0yZb7WS/ojwjw+3tAvJAiZ6XuXFl2yK1bGRbO7mKJB2Ju+k
 ZY6AfzfsuzTQU5u90y1N3UrFBbNvraSkFIOxjXJPOcfa6hdQBJl4/okuKyAx5bLo3Pg21jxJS1S
 8KSLk3lZFfJibAdMWIJgKaFzXfkeAyRpye86hzjPxjFRKWfmO3YBlh7iXeb0YR8pQuNOckerL5G
 uIBO5NXbX8DDV5oagSM0h6mj+Fk0/or+Ls6dzUnVCc5xXTg0Mvg3SLqb94URmBQ6p9jMGgIgQv5
 3wkWIsNymruADNnQBHO/PGlPXPBpoihhn2OcXfje06M2U3imn8qtIVUSlB/muA/PGXKal0ypTET
 QRyWRki6EYDmGpjSyt+/A0A2xreapVD1413XpF5hmXF6jJt8k5ulcGgpu2zugVmlI3guO9e61RM
 tSIjVJkmFQLS/UBpxOw==
X-Proofpoint-ORIG-GUID: LpnrXQv10TMSBsgDRRagLw-TieM2q4tR
X-Authority-Analysis: v=2.4 cv=UMHt2ify c=1 sm=1 tr=0 ts=6a54e1aa cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=zd2uoN0lAAAA:8 a=EUspDBNiAAAA:8 a=XeVHrwws4l7kqE2Ex6IA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: LpnrXQv10TMSBsgDRRagLw-TieM2q4tR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX1ZZ3WIcxRXAa
 fgreSDeeERb/QNvebgXcY7RbpUlBtqPPkjeBR5rXzXAVTx4TbxMBV1kPHms4SoUDEVv0eZaK0sh
 SMBqnSd7s32om8p9Wa50sXWmWnXooIo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130135

There's no reason for the instances of this struct to be modifiable.
Constify the pointer in struct dma_async_tx_descriptor and all drivers
currently using it.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/ti/k3-udma.c        | 2 +-
 drivers/dma/xilinx/xilinx_dma.c | 2 +-
 include/linux/dmaengine.h       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 1cf158eb7bdb541c4e7f4f79f65ab70be4311fad..fb21e0df5ab7b20e4e16777b5ff7f61d2ae67b2b 100644
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
index 404235c1735384635597e88edc25c67c7d250647..165b11a7c776abc6a8d66d631e19da669644577d 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -653,7 +653,7 @@ static void *xilinx_dma_get_metadata_ptr(struct dma_async_tx_descriptor *tx,
 	return seg->hw.app;
 }
 
-static struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
+static const struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
 	.get_ptr = xilinx_dma_get_metadata_ptr,
 };
 
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index b3d251c9734e95e1b75cf6763d4d2c3a1c6a9910..5244edb90e7e7510bf4460b6a74ee2a7f91c1ccc 100644
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

