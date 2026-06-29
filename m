Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA053FFAA4
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 10:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727309; cv=none; b=EbLzC1cq89VoRKA8573czbJP8KEivb3nJ71wgUBM35mCnPOGuCZhsBhtG4HxCLTJNhS0vpf3Kf5yVO1FuJTDwg5QJNbKS27/vkPPgoW0JP7eGct+kIyTOCNKDOCHO22Hwr/o1HBCm2++9GuLO3X5PUZpRC+XO5G9C2x2sO+9LQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727309; c=relaxed/simple;
	bh=zHIuoWgA0JNzB45qmsTvX1DiRfFAkkbG2L0hbAcWpaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FSylVxEGbz0xHh2TZOP2Z9BQOBKSVrjAU0f79dZ1DriG8xdzfZylGwwZQnse/Y6k+jz+MY+pB0lWOqILRApH/iMtgVQiycp+04s2hQPFIetxnOidJGMNHq9B/PVTQnrJZwF0iUWE0+sdRtuYo5HOgzsBX5XixIwGHhntkvTlBQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UI0gMh7G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jXeKhS/5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UI0gMh7G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jXeKhS/5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8O9WY2348351
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 10:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=; b=UI0gMh7G9/BxQuDe
	2oTQhN1GZDkR6J5JyO18ZkYYzav5oG8XdQ1ND4iD6FZLwMWX7yZOjvm1YKH3Yp2F
	KDFjFFILjqtmeVTt4IREZyzipndGDH/C8Okw+I/7+x2Ql6SoPVJmDwttWkB2CPKJ
	o61luCPpFMqS7ci2GBmcupRtpLgeq8H+bpqX5TOFIk7mq2EDKrS7oApu0mpz86YZ
	t1wuXOgcNYDT+PB0bA3z9YbgAm1OkDgg2jx9XSHVW0zsk6L4h9dCTNnqEaRVhjvP
	qHKJav34vUz42UIX9BOue67rLI9j56XA9yPMkgazCVXFxoQoN+bqd41BUZY+Hg++
	bOZ80Q==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s0e32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 10:01:47 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9692731af28so1075359241.3
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 03:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727306; x=1783332106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=;
        b=jXeKhS/5QW+mBko0/pnob92w2ZzlJ8wfkGTgjAS/5z7XtgeRpWm9W//Uu1ZszYhjzd
         TJDTWSrB7RabPdfhd++4LRgqm7hcDkB5h593SL16/IvXg4hH+jJxPg7ntZ1mlxqI/Aq3
         VW0FwWmpJUzmshaV4BB18P6c9fR/Q5scaixvfDcYsh0itp1rIltMMWjbpBZqCuqaX3fJ
         C7pkw0qHNqDCKKSKxCQvM98A92oX7nwFelJOrReKBG9GdalRBQWR+g+/Ji7GDK13tqFw
         J41W86aa5DDMA6tnFQLvhOPOBEQNb+v5LA/nUf/CnQTYaWw5Y5VYrl6UbJVdVCJx5TlZ
         1nzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727306; x=1783332106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=;
        b=iuFdCZTSsrWwYS3WLyovDE4i33yMBnjeHZxyENWb/y1tFNed64EhmgWkuH+jJFqcig
         NavsI0E54/aBsMftbkbpol1ecTO34sIECWr24fO+CnUbQy+ZUcSlWVBV9FaD+UmDQgj8
         NsjCA0CnVVyyeidcXzjKHAHW7rL/tSq7R0z8bCXePYlNlt3VReqaa+//Hr7H4Uw8mzmb
         gKN/X5miop5ox4jG8vy4qgfiqpvmAGD6JI4fC5x/oQEE8UTT42VF8aN+RrDk0PZpwee9
         FjHQTs56rGA8sET3PWftesLFTm4PS/9bISHAnslK23a6ah1HHP41b8hHrU3CcE2Gousj
         dgFg==
X-Forwarded-Encrypted: i=1; AHgh+RpQU6KH7cWc+PxYVWe3KRFAsR1lc8Am1aE0D1wLvtnmbb3lVsUB35TdLvmCroiqz9pWKnuqcgymqD8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvl8ZcZJp09Tk8/Eudj88BhWanTshHFddLFPYmqYT0dzsmekWn
	weinQlXHuBhp6Kn/LGLEYnNuNq4weZIBWH29bDygvRrOKPV55PCMDt4AuBrYbjqRt7xLiu6CUxy
	iGOP4GpIJS4SVLUxxHv5pFe4azfcKmW8vo+37rlpzEfFaLWx1oQ/Wf6mIFzLccZg=
X-Gm-Gg: AfdE7cl9CdlgmJIby3PdfZZLfKkzRD1mjpOUgDK7ZCDYvDM11jb5PggDdmmy2+ye4Mo
	MPBHhsHwuspV/uKOic2HUfWGvq8Wl5NZgrHjjesakel8h+W0hZt4YZQK7svfh1lnQs2TnPEhMtm
	/Z3PDFi77RbtJ0GMJzLdOPAKzE+V/3oWrRt6x1yVXyM52ecOPhioiIv7QTM+xQ48M4KLkUORrpJ
	J0OvP2xzUPbenDl8FIiOWakQgPpMaKqWJqE0OJNxwvf69Mo0VroePv/AGgxLkpFbvPBSFr32+Eb
	XcG6awYC+MWVnny0OoYREcP561Gm7Hyq6j6UMTtZFkQxqEGVRkLW0ojl9QNN1Vg7L1bXv5B5XRa
	xqh1gxA8LP/0BzNo10wLvZNQsw1HOopMM8DgiZSRr
X-Received: by 2002:a05:6102:2b84:b0:720:7e04:b306 with SMTP id ada2fe7eead31-73434037ba5mr5559997137.5.1782727303094;
        Mon, 29 Jun 2026 03:01:43 -0700 (PDT)
X-Received: by 2002:a05:6102:2b84:b0:720:7e04:b306 with SMTP id ada2fe7eead31-73434037ba5mr5559506137.5.1782727297785;
        Mon, 29 Jun 2026 03:01:37 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm24729405f8f.0.2026.06.29.03.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:37 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:01:07 +0200
Subject: [PATCH v20 05/14] dmaengine: qcom: bam_dma: Add
 pipe_lock_supported flag support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-qce-cmd-descr-v20-5-56f67da84c05@oss.qualcomm.com>
References: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1807;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8sCOVL39BX2AFiqeGpscXeG1puX7rtAOjEFEhJGJOUQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQkJsmv/o1deas2zWEHYrq8lFB74FXE5e17jFN
 KDp7w5BZ2eJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJCbAAKCRAFnS7L/zaE
 w5mDD/0dvYsn8wcOxoenL45TBXSA8eIJDIl3WnXKcembWmr26XchibGSAHvzgZJctIVAo5xCnMx
 7+Edz2oy35G5iWFqChbqYmOWOPtmX9/67YoQ4FoEfxLgbcfupubEkvaWaVMECA3Pwp1Gb+x+zlC
 +1zjrfZdDGt7rQXLiDf/Wn/drI4XdP83uvvKckIMshgyANpYJg30TNf4BqDWW5RYbfJgkODHDH/
 /Tn4M76WYCpM4yAvguy9VyuN0mwwf0h3snS/klxm7ak95iUvTwT5ajSzSA1OZq1inYpL2zlOfgu
 1ZSPMczAbt/yJHNeW0+qk3SAbOEL41DKRu07/fjNy/6ppBp8hLc3tG+SRBGSMKyjAUEvHyJntCP
 u0EwNeEhCdATHfccGu6mHCdzz6XPiwEAOwMyo7H3x+oExfaJCA7A+TSid8quk13UvJ/WfWcvDfb
 1HISaclIm7oHGQlkGofN2HBon2I7yRTDV2PH6Oymxq3K+Z4Hb4cnq86zLu8ObzLpi0/hCxxHDYJ
 L+P5FXXnPZ+xnHgDczHNHX6J4w84Ql3lDpLPtlLQgRaiRO6kTD50G1a8V6AuBB7Toq4tW0gNKlA
 7/jLfL748dBJy/CncsCWcE/ZsVAmFY6e3Bn5Bb8ttFurbl4Hq+78K5JWaDhH0ecbY/N4oCWll4M
 ijiy6x8iosCX4sg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfXxwqBfzLzVY6c
 zKZxcuK2knKYwF5sjTVsJAbq4OpFH6aKsH+hCKKonnB/itvJdZ/fPOkm+XKqYaqYRk6CKn9m/Q/
 ZTh1WXsRnXR8v7yTdVI5D6nHecMcbJE=
X-Proofpoint-ORIG-GUID: 4lrBm-KUC9wyR2yZj-89LBVxZggbF_ZR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfXwAAoC0kFJNxF
 AR243sXwKUjPQmta56QdB68XS1mC7g9NTZV3aSmaCEAb/Ctpkfdmue/6a8GeTfogkToBsKsE4HW
 leEK93R9YXhriHAuK4DA2b06P8CvTUg+pcRnBv4aBsIEDKOcXPDnNVYdnWteU/ECVvcNkWNZDO6
 5mJiCHnjnPFsZDJ/CJAHcdvSQEXes6ATYjsR8tZ0vpCiV3Q+2gHL0Sn930gmowmGsklzsUCH3zj
 WtbtQfv7OUZc4vKnOFFe/vXpc7SIVYGgAd/ElIyH/8CB8gbY2qCGs0XLx+PCTSXHXsVvMcGhOFv
 z9wuGDateZmOyzqLof3Ux8sPpRty2pDKw+qZMYfOMyR2lcdhTg8r84VwxGhSnX0glik0UQ4c7IO
 6Tdx1lGpx9fOzxYlDnC16f/LLF9M/cbN5Xmgx8qXXqdItXIkr0Gc6zPiEGoBQ/ukwa4DmM+3A5l
 u5YQz097sXksyD4cObg==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a42428b cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ZSnkYuKn9ZpO9KHknGoA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 4lrBm-KUC9wyR2yZj-89LBVxZggbF_ZR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290080

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
 drivers/dma/qcom/bam_dma.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 8ce0fe085c5fea6cc614edd692b5cfd264b94d5a..f3e713a5259c2c7c24cfdcec094814eb1202971a 100644
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
 
 static const struct reg_offset_data bam_v2_0_reg_info[] = {
@@ -247,6 +250,7 @@ static const struct reg_offset_data bam_v2_0_reg_info[] = {
 
 static const struct bam_device_data bam_v2_0_data = {
 	.reg_info = bam_v2_0_reg_info,
+	.pipe_lock_supported = true,
 };
 
 /* BAM CTRL */

-- 
2.47.3

