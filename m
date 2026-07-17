Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76A13E866C
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 08:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784277435; cv=none; b=F00EL14kEIXw33h1Co9PcUn/QTOkq0T3FwEnunORo60xovPW32ii0EbBKhqpqI1fohv9t05NUOo8HAPajI0cLtXsN423akXOUJ3FC8lA0S989bxPRFTOgfRXDDKe4vhaAcjPaNKSCQEgK9qpDm5ADD1KAFhE78PaFrL/ZKfdcjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784277435; c=relaxed/simple;
	bh=vpDVf/b6zHPEUgtVCAl2sRJELM4MLJc6gtP24/up104=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lFSnFdVSDlLUDJiDZji+IZ0cJ115S0LoPqYqovD4DaqN8K8auqZlTQJ10hf0F+lMa6f2+OR9F13XIe2wV/hadU5AEYJXludvR1gkZ2SlCW5rHqUD+mg+5IeKy/c6jBrFTIH0cW1QTAHGRFktPy14IcSjKm3hGYqzi5X+kM4ckaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OSgaqMl0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VOnMyi9C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OSgaqMl0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VOnMyi9C"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cQWM951330
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 08:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=; b=OSgaqMl0aKmYC9ET
	UbqKG9pNbuwso9D3mvZDHBxo2m7qGmHqLgImz+Sqgv3GXyOUSROtsPOpM4mi9Oeg
	BYKlwl8JcTwRLUEJi8InijrIUFRjfMYNxD3V3D0M0DwMMmezMsCmc+sL3KIZNb82
	JrOITn0dr+g3UIu0+8WCT7K2xg+z126ncS25QzmCit2/ap5sM2Z+NFLc7I3/vAsd
	2osiJEwYvCe7lXSNO90bw2ZuOvmjZ9OV9ebuT3WOYdseBs9TMCHcJW69EsZJay+o
	t4QOlBO8AHBTiJIq1YRM8m6gAQdb3QjwOyWk27BXEsLGpLdIjYR9Ns1C+5ii7XD0
	7MXYoQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff2f2uber-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 08:37:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51e4ba1cfabso66654481cf.1
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 01:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784277432; x=1784882232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=;
        b=VOnMyi9COEGlVPT1SSDr9joN4znBfoi5I91AXrofM9tmuftHR8yZ2YFdZhgufAfNrY
         AytG0ohuIJZfycADKiGQkmLmsyh1q2VQTODTDYhpGuBWTp5fj24FpO/anii9O5kK0qwi
         6wt1asr5Z9ZwvblcJysZfjdkk7AZVPffP30i0lxGteOLxoRwnj+k8qEvs1qnh6p5e6XB
         GsPMA2uiEYskYkTKKWm3C2Ns5l36wouOmSKaZ/Ah28vsWdJkU+VbF+m6C0s0yOGUZFC1
         uEcD/pDogFuNh/RIB4SSV4u/3/WM0zGqCIn6wX2H+LGPcHYUDKPjvNEfADwV1c0VaasN
         UboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277432; x=1784882232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=;
        b=TLq2yJlgvDN4YeQTESc27glJ3sXwbgpPh7KvbLQAx10zL/KOpYsNVYSVVttdz+MD2w
         gFuxebTgWApdWheQwF5NiCWojorpf0otPhcZ4+WRaY5dVQIwdC30fqKnzjmolxnuGk09
         hk8QiRZhYaxqC8Siyp6i3mC/EefwjSNldIRhb86volQySIUif1OTKY/RAlyvFw0pdulS
         8ORrhw8yaSxpjXyM4mgYwfYHkE5nAbuf6IG5hqZ2bu1aAHq7kNKks+EAENkeI/xhSVZx
         5aN2wQJlfVSweFgR/8arIn62Ci76fdJk8stivutLoYSXV7AMsqsJ9wAW1XImPSmX3VCr
         5VBA==
X-Forwarded-Encrypted: i=1; AHgh+Rpy/MZDwgeC++M07BnhDDswJAqzCTm02QAOoQLqOZi/NbX6MhjOFQfDcRSbJX3k0WdAT+/ZMP6cN64=@vger.kernel.org
X-Gm-Message-State: AOJu0YyknipGZr+hTF5xxbDrhBLAbJ1zETrNWNkKLMFknVaOYVaCzciI
	VNrEJuF+fx/hZ7OChNfOEjr6f+4En1USen5xjf6yiMws7p+TTlRpSokIeceuGKp5VfKMQsmJO+B
	qwadDpGdFZHKgax6kq4w8Ay3tbpJiJWxUPbyOtxEsDVMBO6nOTeXqofc/NBvMsS0=
X-Gm-Gg: AfdE7cmiPGfK22U0FgNdpoQDE8WR07HfneS4GBGYn2DTRYBNJAIevBfY3dlSTbsZASC
	hXHmKPCtWL28R4z9tleYPYwo433dOAdlHXaUCTqb1zy33Q00qLhRcWlrg8Be781Ci2YNZNIvzeV
	UFIbiJnti4ax/ly+FLRkCgg1MDU0qsIUIU7pIF/mNdYO7OJNAfAg6ia/AhQuW87pCjirA7liM2h
	eqVBiJknOxNPE+8cE6bpGB1IRpQmeHtiEFXRifAwPvH27obLP7rMpygMGAm0rhgqY3mEA9SpF7H
	qBnt6fmZ2udNlR6LLm3iX9KyHgqkL0DRef8HHc0hWfN88UA2IZioyE3D7GkwQ0+2CckqsvG8S6r
	zwDKUBBk1gzE8jRsIBbWp7b/q5NfgWw==
X-Received: by 2002:a05:622a:418b:b0:51c:4fba:5b12 with SMTP id d75a77b69052e-5213daa1d9bmr13282031cf.46.1784277431701;
        Fri, 17 Jul 2026 01:37:11 -0700 (PDT)
X-Received: by 2002:a05:622a:418b:b0:51c:4fba:5b12 with SMTP id d75a77b69052e-5213daa1d9bmr13281651cf.46.1784277431284;
        Fri, 17 Jul 2026 01:37:11 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b893dsm31268205e9.8.2026.07.17.01.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:37:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:36:35 +0200
Subject: [PATCH v22 09/14] crypto: qce - Remove unused ignore_buf
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-qcom-qce-cmd-descr-v22-9-ff0d18b27246@oss.qualcomm.com>
References: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
In-Reply-To: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=j6XY4tGbVrzzivRLNBnBuYRESnCKLFI7yXVP5haQkuk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWemdczVwU/9nvIx55Hfh4Ky/83k3YY3NS2RzZ
 cZ4fCqSkwaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalnpnQAKCRAFnS7L/zaE
 w3AxEACbwrBfC7Esgs6dcpgEttXqReVrfPK8KOLqhWJv3vEhN6UF+PBYdph8VDwqqjoxDcmjMyj
 Jbocfq01pM/8TUD8iP9LX/TaZX0g8HhyuYj3elcOWBCo+jGKSVKHxMwhhzyBcLPNsISdUcd3Oev
 5my5qUJ02IKNTio9C0c+oM3jxs2nbnCiEEWUl0FKjHvZI4mHBJetvCxYRcI47CyGyeAvpF/dPir
 6bCpnHS0YARlyHS4INg1iSnB+/znQvoYBa9mPSjagwPCdLOOdH+qTMolHOzfmJt+7L+T5LH6Ta7
 tDBTxFUQU5Ue4Ck61F015+E5/MW7upXQgfDkCGZPJRAcirhKb9ax6y7Ni8c7YcC4YWpVO07f+Et
 1KmrSPdek0+o9pRBF1rYHDkdHgWNvbJ0ZOgOr6nBNJQBw1ioiZsYtcCQ9p3VaXeegEf/DOeYgrR
 KKpZMDIXPRfrkjSoxun5bpQGmaBgVrmz1eDCfZVU5i2Yvex4l4XpvSaYMyOmjFHj1wfAOKjZRoW
 pEKh5QuWS7CYT/I1eONqiua/+kaZkFGKUDkcUn+Kjxsdt4dmqNtMFat1j26LdpgRg0Tckqm3Uzu
 j2JH+Ix9/7G8sj1leK0myV7tX2UCcRSWtXqMaaOGnB29S3HN81ME03rMIPLbHfiAF2kvft5sS7u
 5lX/ZtjrOoUvq4g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: OWq4JIH4kF1k_6HCUp48rlJqhrJTEVLP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX7/r5R9bLWsQY
 cnszYajWHdcE/qyXU4xix1A9DzFYh2r6uxXR0f7KiVPDvx0oq0HWZHTu2VsaBJBcNtZJVagP5no
 f2tZhsxnEQoxsXvLWcAxAggIR6GnfRI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX7CE91Uu5uWyT
 3VqMtE3ECxSaDleQgTDd5S1l2NF7yxcMILLU+/6PAEDTdIvXmfh/MMcOaVFptle6HWkgnJhGaH1
 stZem+bD7brHs5F8UVFJReAuhKRyAF43vENDcqBM7AFkFoAWoLciNWSG495zldEzAOm55TZBucu
 mUEzIQTDDT4SsX8+eLIoZjAK2KamIUFmDy4XLWoii2kqOJRtiRRydPdTMNkweDJtItgryj/skby
 5inarU9vCUNzj4c2QLOep0vkhwGI52xFjOfSJi7n/1usPrQIwGqQpoS45Kw/PZndtS5heT7dJjc
 R1X2BVL3aU0JP5l2P+SnCJNJKWQHKgBOY4lPH6EGJwIP30IOPaXkoEFR/hx7wb85XHoW5pO9/oS
 RQhZfBydcZdWtxjKHOU3hGuNlcYCpKn059XWG8c+IcMVPVOzubK14TvZbqAJFtG7BGYsSEttixu
 bo2I4zvp88zZ+I+1rhA==
X-Authority-Analysis: v=2.4 cv=NcTWEWD4 c=1 sm=1 tr=0 ts=6a59e9b8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tWRRbWwrKX-5tUpmLDIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: OWq4JIH4kF1k_6HCUp48rlJqhrJTEVLP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170084

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

It's unclear what the purpose of this field is. It has been here since
the initial commit but without any explanation. The driver works fine
without it. We still keep allocating more space in the result buffer, we
just don't need to store its address. While at it: move the
QCE_IGNORE_BUF_SZ definition into dma.c as it's not used outside of this
compilation unit.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 4 ++--
 drivers/crypto/qce/dma.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 7ec9d72fd690fb17e03ade7efe3cc522fb47e1ac..d1daa229361aa74da5d3d7bfe1bc8ab189761e38 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -9,6 +9,8 @@
 
 #include "dma.h"
 
+#define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
+
 static void qce_dma_release(void *data)
 {
 	struct qce_dma_data *dma = data;
@@ -43,8 +45,6 @@ int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
 		goto error_nomem;
 	}
 
-	dma->ignore_buf = dma->result_buf + QCE_RESULT_BUF_SZ;
-
 	return devm_add_action_or_reset(dev, qce_dma_release, dma);
 
 error_nomem:
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index 31629185000e12242fa07c2cc08b95fcbd5d4b8c..fc337c435cd14917bdfb99febcf9119275afdeba 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -23,7 +23,6 @@ struct qce_result_dump {
 	u32 status2;
 };
 
-#define QCE_IGNORE_BUF_SZ	(2 * QCE_BAM_BURST_SIZE)
 #define QCE_RESULT_BUF_SZ	\
 		ALIGN(sizeof(struct qce_result_dump), QCE_BAM_BURST_SIZE)
 
@@ -31,7 +30,6 @@ struct qce_dma_data {
 	struct dma_chan *txchan;
 	struct dma_chan *rxchan;
 	struct qce_result_dump *result_buf;
-	void *ignore_buf;
 };
 
 int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);

-- 
2.47.3

