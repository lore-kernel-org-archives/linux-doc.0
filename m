Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7413002A6
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 10:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138913; cv=none; b=JZwJMv076j7Vn5DSmRqvDdXFQaj0xtAmDAH9lN5dWAX583LX4VUwbE0wcwU5b67X2uyzBVezYlPoTPodeofRkWCVUGwZNyOScw4pUlnsf8caJa5RkW9bQefxfR8kxfxzKBdCp/bsZ/zZuL39A71Vo7//SaSYFnmGROe//KJZQn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138913; c=relaxed/simple;
	bh=G5POXs/vmCuxytxBEpXeNh/KhnNJeaEjpo9IIV9F9Kc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KJ9KeBPzR5689cXm67ZEHJUX7q9h6cykhrVXfrGtl5dSUXeSdPbyV8tntBT6B9qGt14UXvcQqut0k86NLN3RDdv4cqFnLjGjfWwX28sOAapb3Kut8jqW3sx2xeEF9nJeKbUOYZ6ZbnKXUIBR1uyiPfzkJ7453BCgXtZnYLwz7gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jd6Hp6Wh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z3Inks9r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jd6Hp6Wh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z3Inks9r"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4c9EC3319083
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 10:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qUi2FQ0POg3ZPyPYs1Y5KADOpwaRNzFjWQw8TsUhgY0=; b=jd6Hp6WhE3UlmcHK
	HzTMUChSk2rNI2LyJTgeW9ia1gxsPgjwRQsZdUBKYYc4ZuIHFILrmq/6Hq0ljhbp
	K6oggkqDJK6sVtMjCFmcNzm4+9IxipdU5AIUxt4lh/tZYhs9F5wYUSD/b1MMQC+Y
	FqETxxazPIzaiAJiqaLuCP2vk5Yp5tM/6n9Zx/yAYiz44vvOKNoTcFlpRkin6WWN
	7eN8KLDsoCmRtFfgawveAbpejmtlwaGPtOKJySEosvVmWoE9fQruAGzXSDJXDh6D
	T6ARJhVx4mjp+6eG9iqG+ToAx/O422cEYEU3HYqnOsuvKtzPNCcUG+ZVuqs4AcNH
	VM4xTg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2et7c9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 10:08:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b8738fb141so622437085a.0
        for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 02:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138908; x=1766743708; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qUi2FQ0POg3ZPyPYs1Y5KADOpwaRNzFjWQw8TsUhgY0=;
        b=Z3Inks9roIKpUBVD28BaJojygltJWf3C1EXfGscrH1ymZ18HSdg66V1ldxyWtqdsZ8
         +Jr2PWYKphjwkIVUi/Bh1qfAAoAa4JQTZjNvBjMeD1f+WtC3Bndo40903Uf6sbLrfYNA
         nQhYEK2fe3sLj0Q/tmdFzxXGQMv0AYY/8m411UNVNDx2/Saqvh6siT5c+ZfYG8O0SBvn
         uQcKlRPtI94SbdBTIVK3a8dr9oVXTYjo5FuiZZqg8PBHYl39YpK+HQutcUwnhoJKRTkI
         CTfdCyF3yAPGpX96Dtog2lk/Lbv14axHTEz7KfWlCjHVlm/t+BoIQ1Dji8xAfzZNB0MU
         dhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138908; x=1766743708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qUi2FQ0POg3ZPyPYs1Y5KADOpwaRNzFjWQw8TsUhgY0=;
        b=bN6HUpxDhYnHyiicHVqQ/ALBtk/cIVd0SY+pXHUhS9IkQOCPqBVtxpJYIKz9ww+zrl
         PUAceyNwBqqLYX8+o76TNcVgW6DERCv8MAQwZ1JBaUS+iThoSYdj1TkpAK+CE3F42pKe
         BTwxSxusK9UHauEQgba039s4GBM8mUMVCs4ll1W1/1mF8sHEjFe+nRKeYcmwtbRdRfy0
         +VYb3HRTTB9SnufkawGy+0Q+F2OYXkeWjrmkkK3OrjhP4r9xOGv+lsWp89TiqYVGN5PS
         Z9FhonrC+JJ5IVVs+zJGpfLA8v8WvlPZsfVYSu2IHRn07US04tZO1CMc0otHXz1Vlvac
         DQxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsT4ADJ8PWQUPaC0lchXDWMHxwB8NDruEYf+ftLiLzSMQAB11Dv94NAXmLbxXnOyl0a2wDbQ1fiho=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNosR0gnFzRhiPQ3wU+m3H9/c9oP4QXLVgNOtthOGXns8+LLPM
	1kR6+nn03ej+eHf3J9QKU6fBf6kPuaGxaDLb3k5YFKQHUB42v3yIZQqqQKLpqcLRZZxdhTmXChi
	0VR30/n/MHWtoEdd50d7+6tmuAOia7yyS/BmAaFXN00zUf1s9FKDxpJBgGdvQBW8=
X-Gm-Gg: AY/fxX77Ll26+eD65m6VREPcipqwq3wg8uxMjAOnIWPj8potAOrfeupWRwsFljgMUVA
	n3bllJfT5ebZqGw+2UtIsRoXy8irqoJ3YI2t2qpsBRRnGLMiGMhN66ftMWmZSywkkguXM8JRyZH
	nhWKKeyHZiFd00/3X3WnJlqhztdbl8/er/YvuBdZ00JMxkZ39I+Nh11BH6vdJePxvd1hs0cXEMU
	MvHDPhecxn90uNhsAxbWFV4qvE+sWTjJOGDKgMvKX4e/vz33feiCKW1WayZCcmNiMWzJp0jR2O9
	1LR245GSo8GBW/0lrarWf/Lk6ia5mpYP8NqhQz+NopAImlPGPbDPB54JodM+lvRJ5G8E5cyNGcr
	+I5avQuPANtTpB5phT/u3N9U/PAPmox/mL2wofA==
X-Received: by 2002:a05:622a:2d2:b0:4ed:a2dc:9e51 with SMTP id d75a77b69052e-4f35f43ab71mr92918191cf.21.1766138908638;
        Fri, 19 Dec 2025 02:08:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGz6+WKg+YwIiNzLJ451ZJSOu/OTYaBgWs6+96xyhrnxrwNi9jy/UBoEDUkTvnuMA9bYoq31w==
X-Received: by 2002:a05:622a:2d2:b0:4ed:a2dc:9e51 with SMTP id d75a77b69052e-4f35f43ab71mr92917841cf.21.1766138908079;
        Fri, 19 Dec 2025 02:08:28 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:a48:678b:dad2:b2eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm4209571f8f.27.2025.12.19.02.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:08:27 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:07:41 +0100
Subject: [PATCH v10 02/12] dmaengine: qcom: bam_dma: Extend the driver's
 device match data
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-qcom-qce-cmd-descr-v10-2-ff7e4bf7dad4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3724;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Cish+IZ6k1Kr37VBYYJJceEuRFx5HxqYDHdJLoUXgek=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRSQOb7JCxb2znk7wfYadyLw5C5qwSHaSTqGkw
 scWaM7eeWKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUUkDgAKCRAFnS7L/zaE
 wxigEACO/BiPI5H9SUk7l3COIH8tDoPvMLrMkacXgtDoEIMSBbbc1i/uow7FEymqd1yGaoUEEps
 OMDTt9ckdjaddXCL5bJMdGIyMRIEsNRNpNO49UKik34nYhXVIBpRrimwgphvbjsuzup/iy6oWWk
 KjRjWHxTjFXwkOc9PjE7hhtIpyAD3wxfP3A2Kdvhk68thyhMDJBcYIOWa2w77aAyzrFmlYTIaAF
 eQEjsBTF2kXpI5PdgseGXw3XyFhLxSHGsvt7nr4obsUA7fwe5yMy3yqq3pc7qSIc47z3mN53zV1
 zrZZZQIlv1QGPkzMckoPvWhwZwxRGgomZqAyU273Y0CPz2LRGjGy50ViiwAf7c5JDqOhS0fMYHM
 36Jka4f8DQXhc+51uS6E1fYRgwJSVkiUMUI2PTZokoy+K/15b5PuN/OaLaPmakGPnKCxAox2OVg
 PXAJJDHNrZbbbcuWIRZ4EjRVVUh+dq1GFBc/KQ1ax5JcfEIST1edBMpKDiq9BjdOwTqnTpolYGA
 rD0f/wKILt3VdEmQ5aCBQb0P4Jt3D8j3olhIPIUQ+q8NeLTm6qtmoPOztP8FDWX4AvdZin7altq
 nM9Geg9NGYds3dZWIaqTUXgIeu9wVhrL4b/ZA+wL2dgA93T9vn/idn7PgE+3vEtzhJevIsh9YtG
 Bgmzk3N46I4+NGg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: A1tegtCV6A3lASRy59CBaehJ5HWOfIQ1
X-Proofpoint-ORIG-GUID: A1tegtCV6A3lASRy59CBaehJ5HWOfIQ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MyBTYWx0ZWRfXylHi4+qqZ0cm
 oxcep35RxpNy+S2AJWAPP6M8bFP6/6ct+14s6qjW/pCDt23xLIDtgyNvoPO35/Q06IDap1+JHOA
 4fTXi8TF/1pYwX0bSXWOvQEyhe42nNje48jVWFC71swDY3wYSnlehMfNY49RSarUywbOkJtkHvH
 PJamVv8dK7/jN6+UvYhrRfiLDdifWnvXHMGuKisKIJe6LkX5RzrSx+DsbPqrxcJP5uG6TkSEbtZ
 8sbMPzR1itg9rlLkjUstfZeGWfB7v6huhntPJWkgtVQ1eYE2bZGONvnRqeqcdGhpcF+DPrOv4uD
 YrA32eg8urNe4n5MlnQkb6LoeNScdXcgd3UrR4rxLyfkoSvNll48UapltonUrI1NaOYdK9n+/Cw
 Pvd1ljPbpn1c1XLTG0qu6h1QQP5sLSnvT2FS5YM6PqRC3MWc4A11sNZxbzkxFHuzXIfXnyAJ+Wy
 3JHjlpvPR3ittrpVfeg==
X-Authority-Analysis: v=2.4 cv=Tp7rRTXh c=1 sm=1 tr=0 ts=6945241d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Fb6uNmSZeVr-t7npd3wA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190083

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In preparation for supporting the pipe locking feature flag, extend the
amount of information we can carry in device match data: create a
separate structure and make the register information one of its fields.
This way, in subsequent patches, it will be just a matter of adding a
new field to the device data.

Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index bcd8de9a9a12621a36b49c31bff96f474468be06..6f78e6b1674a0ff3deef4c3d1892a978555b3807 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -112,6 +112,10 @@ struct reg_offset_data {
 	unsigned int pipe_mult, evnt_mult, ee_mult;
 };
 
+struct bam_device_data {
+	const struct reg_offset_data *reg_info;
+};
+
 static const struct reg_offset_data bam_v1_3_reg_info[] = {
 	[BAM_CTRL]		= { 0x0F80, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x0F84, 0x00, 0x00, 0x00 },
@@ -141,6 +145,10 @@ static const struct reg_offset_data bam_v1_3_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x1020, 0x00, 0x40, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_3_data = {
+	.reg_info = bam_v1_3_reg_info,
+};
+
 static const struct reg_offset_data bam_v1_4_reg_info[] = {
 	[BAM_CTRL]		= { 0x0000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x0004, 0x00, 0x00, 0x00 },
@@ -170,6 +178,10 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x1820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_4_data = {
+	.reg_info = bam_v1_4_reg_info,
+};
+
 static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_CTRL]		= { 0x00000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x01000, 0x00, 0x00, 0x00 },
@@ -199,6 +211,10 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x13820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_7_data = {
+	.reg_info = bam_v1_7_reg_info,
+};
+
 /* BAM CTRL */
 #define BAM_SW_RST			BIT(0)
 #define BAM_EN				BIT(1)
@@ -392,7 +408,7 @@ struct bam_device {
 	bool powered_remotely;
 	u32 active_channels;
 
-	const struct reg_offset_data *layout;
+	const struct bam_device_data *dev_data;
 
 	struct clk *bamclk;
 	int irq;
@@ -410,7 +426,7 @@ struct bam_device {
 static inline void __iomem *bam_addr(struct bam_device *bdev, u32 pipe,
 		enum bam_reg reg)
 {
-	const struct reg_offset_data r = bdev->layout[reg];
+	const struct reg_offset_data r = bdev->dev_data->reg_info[reg];
 
 	return bdev->regs + r.base_offset +
 		r.pipe_mult * pipe +
@@ -1211,9 +1227,9 @@ static void bam_channel_init(struct bam_device *bdev, struct bam_chan *bchan,
 }
 
 static const struct of_device_id bam_of_match[] = {
-	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_reg_info },
-	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_reg_info },
-	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_reg_info },
+	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_data },
+	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_data },
+	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_data },
 	{}
 };
 
@@ -1237,7 +1253,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	bdev->layout = match->data;
+	bdev->dev_data = match->data;
 
 	bdev->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bdev->regs))

-- 
2.47.3

