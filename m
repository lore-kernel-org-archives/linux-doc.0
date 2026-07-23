Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFE14DD6E6
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 17:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784826597; cv=none; b=oOG2VsVYk6XUrhaSAdMqs150lCSijaycvVnJ8IeRTf1xnIK+E31oJ10mHvbzPfJfE7Q1Opm4hkgvxm2sCCICVu70X+i0a7ZTKb4f92/CxuPgvpm/bYJWNsqgEX2hG2O1cOLUPWjLHGUOtSnE2xeDQoUCTqQXzcDsh+y3nFnWJso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784826597; c=relaxed/simple;
	bh=1Q+aPsoEc8W4PfEahFbzsFEdkzT9tiwxUCi1Nvr+Dts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qd95N7ToB4nfR5R89jZZumiznvjB6ovcPeWm9kOjrJMN+HVuT1suGUFMyNaHN66jR0Zjsw/XWt+KGE7KzXzSztNYgnyDOBL2ABMuSdrICWuYdmplRF3GtbJ8+hWvfShQd4b2wDpXJuFw4dt5Jl0Qh82Lc/qk0ugFSytcQLNN3w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M3Cyl69c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iNqBJ5Cy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M3Cyl69c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iNqBJ5Cy"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvnHj011774
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 17:09:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=; b=M3Cyl69cXgWU+3dl
	7bZAy7BvT8ATtm3EmclgD+SEr2bQw8cSOVLhtaJhn7ZSSkX73hw1dOnFW1crM8v6
	HSzMrM0ZOVdDwOA1cewEqzMubBtGJ5VRXHFeQ4XWK9udOO+vobgj1+UwA0d8zRX8
	1XpLlV4R0vPns/pv2z0LPcGynJHMdUfXSvbkET7ky71A0qo517tubAsyBzPKsx9P
	Sb0EnIocFF2dkj/BeCWNvyqWaTm+zMzBtff/RLNuFwF0f1KY5mU30UwfLLKcHR0g
	mdoIqiKel7XyGsl0UJ49GBj+W8wcvMICOwvW3jHmjT4DP3DrrRZlv9zsUUsMUZeE
	3rRtLA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkayhbcst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 17:09:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5283df62d68so17270111cf.0
        for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 10:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784826586; x=1785431386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=;
        b=iNqBJ5CywxaTX5mY4NanqqB7TIT/0OY2hCsYoCOkkuToprTMoBrl8a3lZ5lo3cIEwx
         TBx3HWG8MKQEC7BoFBj1ltW8NPPCAg0eJq4gH89+WwORGID4fOiQXZybXvgJDjPHfFxd
         s7+MCo0G0hdUZ6DwP3WPUzAN3wU2oe/6uEESv/US3lIjS4B2ieb7r3Jk8BHMxRfwcsnM
         Nvb2STTtJo7TWiMSEvaxAbh81S3gF8mB2d9rTPx2Ac4TEVXyYlNX7yyxz0mOQATXHq71
         RGgWP3ItNhgawwkOUX6UGmYu9dEjwsXlckq59EMJ7GdXryVSpLaP8298pMSTG3I+nlPA
         MGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826586; x=1785431386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=;
        b=Tj5WpbA5Cm1H2j07Q6sh5QEYHbGwivosB7D51VhwcxFiuYidP02S9rw5EGXmgS8VOt
         K61tdq/TocOBWq55Rx/2JeMEFk7x0yrOVhJmnmIYz3TnwA0giojzCCI4E4gSPY143dvF
         iR6iRD+2A7jKg3tEBLYTIteeqWyzFR6p/16BJqjCcLaV0nemf6Cp5nAywziZmkyv1Yvc
         t9tgNSjRAXRKvaiCFolw0NJKraQ2hvtJHiheH7QU4JdVqS7fQzWiW01u2DV/xvMFc0Ry
         NuiawnoGsi2w70dE72d+Ca8H/hOFfliQPseqB80XUEF3GGWm6xZ1+6/GFyHjT7fbMRTQ
         /VJQ==
X-Forwarded-Encrypted: i=1; AHgh+RocZlTv7gZ2Dnt6D10moJAsAnA77puib8GjVlt6pDTa6PZuHVdcFPKGFTkVzFX/XECPvF4dbHGGDqY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwHwXuupdVGobDXm+psU/mmaBI8d5+GZaheG9KrzoPCl03TOau
	SvtddGOd12RLOT2EWUzqVMDmJfAPvFNdA2aGodjpP5puBNyYwGc+w6FIaoHgTvl8G+fLAg8prtE
	SpFtZ9QBMSrP8gYgIuAvAuPiSukeOvN/axmN6G/VcFSHFpbuzBQT1cW+wjyfSWQw=
X-Gm-Gg: AR+sD12HMWDCcIa0LSzUwgIa4f1+WZXx9VsR6IhVKobrIyXdOS3e16qkAjgwONNH5Cw
	huekxbUEZc/qtyyO8NoyC04Aw6Pf7B7BZLzbw6cSaTG/B1FIDNnv390KZSdiprr5Q+XAX+cZUUu
	EuJnToFKJx48la1w8Al1UTiGf4jdkDc9UREEsqulMQU900g/nDH8/NwDb6CB7fOLp6MFBcCgyjA
	VYFBzgW9KKAskHtNzHpxlt4Yeu9s4DTvNSntqHrLQNXerujYzNPuExkxxUVeGZw3t7mal1Nizsp
	mrOjDtVKrN/5JBoDL+UG60tfvenYVqrZhfwv/7WZL6FSGmKqRuaQ52DjWX8y7/XPE2DDT9oK+Bs
	0Bt7iFBaoRlgO70dQpQpKTCeMp400
X-Received: by 2002:ac8:580d:0:b0:51a:f94e:ce51 with SMTP id d75a77b69052e-5283ded5b72mr32348601cf.50.1784826585682;
        Thu, 23 Jul 2026 10:09:45 -0700 (PDT)
X-Received: by 2002:ac8:580d:0:b0:51a:f94e:ce51 with SMTP id d75a77b69052e-5283ded5b72mr32348161cf.50.1784826584952;
        Thu, 23 Jul 2026 10:09:44 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:cd9c:212:1357:7832])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm18472999f8f.1.2026.07.23.10.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:09:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:09:10 +0200
Subject: [PATCH v24 04/14] dmaengine: qcom: bam_dma: Extend the driver's
 device match data
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-qcom-qce-cmd-descr-v24-4-4f87bb4d9938@oss.qualcomm.com>
References: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
In-Reply-To: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
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
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4322;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=HGeQqzQf8+DrUa/4bzOvLohFWS/bDVC1MPHUwVaBFAE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqYkrCvDnscYF5kUf6Mp/2eDen/yDbwikQKtft1
 KTtqtdDMMiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamJKwgAKCRAFnS7L/zaE
 w6OuD/4zPA74drmfeqhUyo1KEaxXhhhdfBx0+mCETQAaXZVxinzUTtMU+cYKtozIiJYUIMZKNyB
 1ZsCFc/FE+fv1NUvXZ9a4yxkzuvG0Ec//565pchVrOHrPbjOs0yiM3JpMYVVumzriF2lREehVEj
 Ia7f91E5ODhFX6Yccp2hApR/40AM27icIGK9J+2fbozO4SyXtiVPv9aV5sUtVYLfm5tEjvz4Ghc
 yxvd5wJnqscNrNy02SUj4U1doUnv798meLMxu+uHqa/ai9BB70qToYFzK8dlMiLdn8GgDD5KlPA
 8HCHp1pmWtZZjXrVTtYxOvJzUNyeH7aDieBtPxWhUzbwX518OFObCqa2lLcdQSbWDVPUbhsNZUI
 1M9SBkpgVDrCeKWEcMU8baGVJhZq4wTjR11ZveOQZSueF8lwVvJkTqDjlURRM8gxdqaraZFHhQ0
 IA8QA+VGg0Pge0nSFjOaOCrjGwnP4r/ueMLWWXj2oB4Qh4xRtCtDJJhcceohh0Ntz8QerbEIKfw
 0ebYD7qKfqPMJMrvf2Vy9b6xfTY7ScWG/523eJsfdpDYYQB5tMVMFTBBc/CbIA54zGmq760eEoQ
 lywH38YJ2y34AkORmBVzyQQup/qNHWjGED4lBcETXH3GG9ycdgNS8E1y6j0bB34yCPvGQ5DuuMU
 sgMmdCddSoiSchQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=HZgkiCE8 c=1 sm=1 tr=0 ts=6a624ada cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ioP1PY9e4_dTeLeN8ycA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: WM58TAcbPo4rD8ipiv6uT1bOO1mE5qCw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX50xDSqW3dY5I
 WgDVv53F+zELv5AOXoFaTj4phHNQ6IBnzP2zXuCKdZV2vDePkFbr9b1xDxYNXibjX9lFkIwTFg7
 4OxcxdiG8vi1IzX+QTPFQ0KtKwXft/ZxhLdZ6/utWmFkksRiefk4OU76ZAWsZXSDnW9lK/LNbdm
 VE6KP/F2wEAQBC1Jxb69eAN81Ue8UU9x9yEi6hYrRJXcjM+chz4Zlv/XcPGTEvtepw59ZwJ6ZOb
 I5tBeNqYT88yljhG39vELrGtBHsectEmXk4KYZ3tiLcGplg5RCAeGx69HdfE9/C+zVUsUpTXmXq
 feytQMSEpOIygZFnoUsZNrr4op5FCbPusaUyJffL5o01oU0eaL0f0AlJA+4flKtfpFc+T7W6IyA
 fAvSEWHagxadyN7YD6tQ0jWGQvN7cMdJLyOTIZ9Lt7CbU9FYr01N5er8YNXlsuUg4bH5e8/v4Vy
 rrks9yabD0fXLFYMmHg==
X-Proofpoint-GUID: WM58TAcbPo4rD8ipiv6uT1bOO1mE5qCw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX3ZwYb0Q3moUi
 FuoCutdBs6CNhHnf0h++DheEOBc3EeFwgzn9SRdfqC7XvR1TDfx3S6UMFmeaxnMjrKrB40wubUd
 QYXBXdCcrj6ctk5cCEVzQFF7oU8/2hg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230167

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In preparation for supporting the pipe locking feature flag, extend the
amount of information we can carry in device match data: create a
separate structure and make the register information one of its fields.
This way, in subsequent patches, it will be just a matter of adding a
new field to the device data.

Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index ea3df28e777f99c0532761b6aee6807ab23ab4ca..8ce0fe085c5fea6cc614edd692b5cfd264b94d5a 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -113,6 +113,10 @@ struct reg_offset_data {
 	unsigned int pipe_mult, evnt_mult, ee_mult;
 };
 
+struct bam_device_data {
+	const struct reg_offset_data *reg_info;
+};
+
 static const struct reg_offset_data bam_v1_3_reg_info[] = {
 	[BAM_CTRL]		= { 0x0F80, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x0F84, 0x00, 0x00, 0x00 },
@@ -142,6 +146,10 @@ static const struct reg_offset_data bam_v1_3_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x1020, 0x00, 0x40, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_3_data = {
+	.reg_info = bam_v1_3_reg_info,
+};
+
 static const struct reg_offset_data bam_v1_4_reg_info[] = {
 	[BAM_CTRL]		= { 0x0000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x0004, 0x00, 0x00, 0x00 },
@@ -171,6 +179,10 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x1820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_4_data = {
+	.reg_info = bam_v1_4_reg_info,
+};
+
 static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_CTRL]		= { 0x00000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x01000, 0x00, 0x00, 0x00 },
@@ -200,6 +212,10 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x13820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_7_data = {
+	.reg_info = bam_v1_7_reg_info,
+};
+
 static const struct reg_offset_data bam_v2_0_reg_info[] = {
 	[BAM_CTRL]		= { 0x0000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x1000, 0x00, 0x00, 0x00 },
@@ -229,6 +245,10 @@ static const struct reg_offset_data bam_v2_0_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0xC820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v2_0_data = {
+	.reg_info = bam_v2_0_reg_info,
+};
+
 /* BAM CTRL */
 #define BAM_SW_RST			BIT(0)
 #define BAM_EN				BIT(1)
@@ -422,7 +442,7 @@ struct bam_device {
 	bool powered_remotely;
 	u32 active_channels;
 
-	const struct reg_offset_data *layout;
+	const struct bam_device_data *dev_data;
 
 	struct clk *bamclk;
 	int irq;
@@ -440,7 +460,7 @@ struct bam_device {
 static inline void __iomem *bam_addr(struct bam_device *bdev, u32 pipe,
 		enum bam_reg reg)
 {
-	const struct reg_offset_data r = bdev->layout[reg];
+	const struct reg_offset_data r = bdev->dev_data->reg_info[reg];
 
 	return bdev->regs + r.base_offset +
 		r.pipe_mult * pipe +
@@ -1234,10 +1254,10 @@ static void bam_channel_init(struct bam_device *bdev, struct bam_chan *bchan,
 }
 
 static const struct of_device_id bam_of_match[] = {
-	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_reg_info },
-	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_reg_info },
-	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_reg_info },
-	{ .compatible = "qcom,bam-v2.0.0", .data = &bam_v2_0_reg_info },
+	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_data },
+	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_data },
+	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_data },
+	{ .compatible = "qcom,bam-v2.0.0", .data = &bam_v2_0_data },
 	{}
 };
 
@@ -1261,7 +1281,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	bdev->layout = match->data;
+	bdev->dev_data = match->data;
 
 	bdev->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bdev->regs))

-- 
2.47.3

