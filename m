Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBF93B3881
	for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 09:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777281368; cv=none; b=hvp/BjZDrHz4aPc4D6TgHTtP7beLOxCcm8M3fXrmgsakOJhT2D25YkmWxqdoSWnqdn1tg8JarzRDgxHzKR/hsXw1wYSxCIJgbbmJqvUvDDuk0tvZHKlIL4yZwmkjvqiuG9sFDP6zduljBI0vqu42IZ/UQaXHghOxGt48l961lnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777281368; c=relaxed/simple;
	bh=aFvWQ0r/9MeZDMiHp0RHPM2rE3l+aKHR+uxUux2PIyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IiWGYjCxYTUKvVJV2pL2GlcsR3d9XTMzo3DexpWQG8ks5vXobeOMA6XAkK7YDfBgvPBJidUtn/Sk/cqKckAHl5yacLCjR8GoxNDUL+40MPcvGvkh5NJvWTqN6iwCufavsoKUQ1h3vsokQq2SssFmEaR2IqLwck6PS4BmZh0CH2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ORXSPtIW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WGwqLeZW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ORXSPtIW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WGwqLeZW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TBSh665666
	for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 09:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j+gmvqmnx6Mc+rqdGbk0x4TnThgU7BC6K13sY2POFME=; b=ORXSPtIWxJV7IuuJ
	/RRTnqugcNIN6TfABsZ0eTWgz1GdCVAMpekbsDv2QMnobomjUyUhOqTRo38nNjIn
	Pm2AvdMdZOd7meNsxahcKAKq1Xm0OCa4MgrNG72038cAsIYxOyLmz6tPMtf1ahJU
	2+HLizCcSglVxJtqJ2AjmqIhxm+V7h7Rwo/7JhS0SWShf8DE7E1gGdhIv9aj94sw
	qEXzGUo9asd3/GcoANP1u/tar1ntkgdklHXi2AWaBoT5LB/7PUaoWNq6w3E2pbqJ
	elAfu1/hnCl7EQjww8TQCbA2P8bzRR+cBuEbsswN6AqiA/KF0d/c3gf8k2JZTz/S
	Yje/Dg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt30n0kvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 09:16:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50eb8bad331so42429541cf.0
        for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 02:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777281365; x=1777886165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+gmvqmnx6Mc+rqdGbk0x4TnThgU7BC6K13sY2POFME=;
        b=WGwqLeZWcP7wXbjRYRy11AsCRE3w7RrrsQT9NwYonS3tMlb50z7JeEOhYvdB65UyO+
         oHW+/6mukQVHSVtj46I+GvaODLXvy8uKAkFhDZdU0PX9eZSht+xrrMzXohqoPXsUtmiz
         FCBYuXvf04bTxeG4FE6F1gx/PYFbPQE0X919zMkYDrQGZFI9V6yF/9gyaNV3tWNFMotW
         r65zLAGh5L7QWCEW9gv+tX2/sQL0Hb50ezg0qIXx26r9N8TgfQjN6kwkM0Q3XLU61+6t
         aZdR0yIwLQFpd4ZAEgX8oW4yTAqH7lBrGVP7mcaFC9BD6pON+lmNuWuf/wOtr0uL8SSx
         zsPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777281365; x=1777886165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j+gmvqmnx6Mc+rqdGbk0x4TnThgU7BC6K13sY2POFME=;
        b=jEKxxYuL7HObeaOI2q5MuMwrFl9LywKvkAdDi69FYM+D3Egxm47QrmxkbgwOz9Q44E
         v6A3b+1cq0wm5OTfXTKRJnrItx8o04/WyGKpqMrlOejxdlPK2zdf6eit4qlOYlO3Zl9c
         H5AJP5SKfaQXb9omHrMNdxjPS5RxLphVyWacDI+3B+5r0LUjvPUGHF2nSm/uh0r9HGV5
         n3HTMc2CyfcUznd4aEUTccmZApFwT9br3RVJdmIto5+gGosri3jljwPqRQ1D04JM0HHI
         PT3bXidA0DbD/3bzATmaMmUG9rYeGdRjQtz+J5cLH2I8gUdH8vXU7tZzLFXMjdKJOa4D
         jIxg==
X-Forwarded-Encrypted: i=1; AFNElJ82mGwGI+3PVmr7gLMTh5GmmHRNWr7sH1R7OhF7/83fzdfhJf69VrJXiyYLyvOrCgcfPQ7KnsAjMbE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLNJybgk26Sezib6StS8XaNDKsGz9yB4ZkH5E4ob4szJ4OKa7Y
	D5pGcWhW5AFBecZD1j944JgPweaafOXO++PCob3ZYycbXpShZEXznKGX0zsQ9D5iT6bIgCEKeZ6
	VBcUaT4q6IdebdYdPAT9ydWi+YHGyQTE4T8Eb5y+4E7WwMY8L12nObMURrA2/09Q=
X-Gm-Gg: AeBDiest8ofrFKalQYScLV34OY2bFDZV2uCvWdVM42JvUdigYoFqzo0m1yEIsjfusCj
	imxPwhDQp4laQ+sx58fIQZYIJpf269CugqA7T0oq0HzsohIV+FsgGVzS4fTzZ7bCazbN9/6YD8k
	4hNpmI87GacQ/niLArgC95Hv4mbK5PXslKqV1C3yKeMtIsFQeUBrfXFpv/2ZOf+ptjhCjU5CR5u
	XsMGeVw47WgXKVLcwfdXe5rEKiVR0MV+XULI4LJTExnaOdjgcEpytPxMmn+ehvS6hSF98RjySmf
	nU87LlKq8Osmk0irddSfOIP+hL9CFD8SrS0+vDMKVeMn49NYaYXKGT8oNCHPKNCUfmWkFc5/XsF
	TD1dY9TdL1rudZqCwSTrhQYhv2X/B0QKk44OF9rf1Le2qndcPzpq+DdnnWcnp6g==
X-Received: by 2002:a05:622a:5a0d:b0:50d:6baa:9e8c with SMTP id d75a77b69052e-50e36827a5emr609405581cf.12.1777281365179;
        Mon, 27 Apr 2026 02:16:05 -0700 (PDT)
X-Received: by 2002:a05:622a:5a0d:b0:50d:6baa:9e8c with SMTP id d75a77b69052e-50e36827a5emr609405011cf.12.1777281364712;
        Mon, 27 Apr 2026 02:16:04 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a6dbfd4b5sm40559365e9.28.2026.04.27.02.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:16:03 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 11:15:37 +0200
Subject: [PATCH v16 04/12] dmaengine: qcom: bam_dma: Add
 pipe_lock_supported flag support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-qcom-qce-cmd-descr-v16-4-945fd1cafbbc@oss.qualcomm.com>
References: <20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com>
In-Reply-To: <20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com>
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
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1476;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=EVDb1irXK/80h7Y6DY4Kfs/+E6/12M9d/9hBrF4TLTs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7ylANBJgsPFoqyh8BK2lOX3d/GhX6IZh5Fnni
 RkwFP5Yyc+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae8pQAAKCRAFnS7L/zaE
 w0qLD/9vNJV15ERL/9ppPG0E99fiIcwIaLtLXqsMIq4NvWtdsmtkMHAwukRVXIx38tz1piI1hzk
 7Wm4eTe6kHd+9of+2g655fstzBkPxb6w8ra10bE54ed03ePaaaIJL1GjSkwZ0Gq36ETnXQbSAp1
 xD1O4zbz25K45kiu3pSH31JhLAncNo+kY5xPK5k1BPFoHSvJSol4+eb9NH/bWf0wdRxjQXlX/4q
 DJcRTib3kaVCabGNdM7nwzLm8MFqGn3cECYDh4JIovIbEPjyezqeXNYLa81zAsD08E90wCSQe2N
 mZFA1+Ad660XMnd1RTSxBqJ8P8fG9MxSWuNIRlCO4V5VK7YN1zeUFVBvc37LYVlgCp1AooMqyRn
 V91Bwx9eytmDvVeLTMj+T97f1uyfhnBTfhdUhehFoMrHF1AlVU0PRqfGlJPDa0crQHD/q1DEXWb
 Uj86aAQaNZJqxLKJ5Fnm8sG13xa2LePKEO8LF/9V4rxItDbXhCTa0Yjwa9FLfY/RSS3idqULspX
 4P2zkwtPOGkmBzw1XY0uA8wLa3LJgPCo+tarAA9O4FqhXgNd1Duh3iRPELSXuLNl5dxqwa6Tc9Y
 U8TL6Wn7Q2/BQi/ISa7NDRIcktBGqEMLVoBmVpmLea8W/AM41PC1IXAwNm1UD9+D0qEjZxoCDJJ
 5u1Ei6vYPi1Qj4g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA5OCBTYWx0ZWRfX/xS6yQ7hHTQi
 SqbRoFpvOPS4YWoR0vBeDVX6SZlQPpOA+La7kBH6MA9T5X+ZDf+YXbBDlVbbyBiwfrjl8nkZCCN
 YuEtEDT0oJSvAfQHvwBj7OsG6HF15Lsjy3GP+xP/padhxOz3toOLbRvdxwBd1lG5nUwoCwdC614
 p6KCT7OcE1Q6row6CxaA8sHhC4RY4//6oBEv25e9CIXmJgXdHoHzRvah7S903qsBaZUO24CYWU2
 ZLjq8s+L4PQPFpL6rrHa0i7ozMjgc7MNK+wtrQ8xvBr2cuwheKDsbiGQ+yWsxnoPNrGH3TRO/8k
 oRm17WeuDDLNSG8KFPbYyG5i/pohijvJL37xph+7X9d7ZAU8y3ocxhMdu9s4OL6lHR0hqq1ozsZ
 LWZFUsp6e9lZT+rkzNFxUdYv5qoPsbGN4oGhfDBVD5W8bQ4+DMHOxeDWkfqvm0Qt0ha0RkHqRlx
 +79aDFvJxq1m3uRTWjQ==
X-Proofpoint-GUID: LK8ss_DNnG0bstHgAWALgRtXxJIjt083
X-Authority-Analysis: v=2.4 cv=efANubEH c=1 sm=1 tr=0 ts=69ef2956 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ZSnkYuKn9ZpO9KHknGoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: LK8ss_DNnG0bstHgAWALgRtXxJIjt083
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270098

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the device match data with a flag indicating whether the IP
supports the BAM lock/unlock feature. Set it to true on BAM IP versions
1.4.0 and above.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 8f6d03f6c673b57ed13aeca6c8331c71596d077b..83491e7c2f17d8c9d12a1a055baea7e3a0a75a53 100644
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

