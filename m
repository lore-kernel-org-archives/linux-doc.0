Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D703367F39
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 13:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640822; cv=none; b=jwamV0CYo4LrIUw4LUp24LugwGaSIG6IO2+8IlGtdjAUctMngK2MQTAocIhdXAhQJE7JlAGWvktBklams6B8IPoPlmbePiIMpmgdaw2z+/tywMfU+DityWIB4emcZmt1Y+0wBjiAya2wG3iJ1d7bOZxiojEIsnAGdl2UlrLnb70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640822; c=relaxed/simple;
	bh=T0ZAEoPGlcD+MBsHOs7IR7iXvbxs2FRnDbpOdt9CWCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YueeXNDC7w0ZxWx3L3PVxVe3ho5EyL6UxS5sskTJj0HqnW9njEX1vYVo4MdP5qFnO9j/bTgM+781WRSGboXXFaCWOZ2CHRaublUB976LjAejqM1GMCcq6YJJi3cc/zP/HlYnp3eNU42RLDaG7vaXKR5ZXSkrS+H0qGRBpUCjB6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LKSOAghC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jc6OlpvC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LKSOAghC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jc6OlpvC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDMJeD1910571
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 13:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=; b=LKSOAghC2HImilNA
	Lf96SOlBGnNH3Eadxcr1JMPYg82Osus+TgkjqKIhp41d3SfA6/igmFKOuqmG+oEz
	Kn/7QPM+V2m2qpvkOIkxVWEFcae0YGAkuKYlAWk5/C76lXqMpZcv/8w+6KK8hHzt
	KRPb04jo6MOfFdIB9ujmDbbAEHJEIQ7JCqVxpccYRlrlUwdLHgfX8rQfQNGC8+7Z
	tNXtaiaelSEPIEvGN6Zm7YUKm3ROFrjEEIhc/r7YDnXdGyCxLx5IAsgzQbKKWxZx
	JKgpljcxBjbUbYY+uylULjaxIA/HJwbZ7ALNrvTPpL99kbIc5NXLCReJPypMDuKf
	+npuwQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1bvtm15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 13:33:38 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f000e221d7so169731986d6.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 06:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640818; x=1785245618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=;
        b=jc6OlpvCv/9s7cxjbZtRkWX9HCOcg+xkvPgh6cMns3N1zKPmVmVcMCvqBii8+ffs8I
         yRmUjQYY9EYxpazmcYN5inOm1aSKhgkCqNa4uuqV4IALt9pTbKDck7ybRNuy8PZk9KRS
         OPskE28KWH8THPl+Pr4ucJh3vgx0FjF08Y1zUoXbhqcHUCX+JrmSXdYv+54si9uR0pXw
         M+HcppE7eClreVZfcQn19w9lmZ8P+uPDvc9GQFFkSgN8dnQVUQ7uWdYqfUxEd3Y/KMp6
         OuQQNnczE+vuCLlJftxTMGH9QlRN5G1YemcRLgDWi3jOL2r3xcRYayALRq8pLF4I//Fy
         YqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640818; x=1785245618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=;
        b=U0QIhj8S5I2I7QLhB1DqPNKWwnNvzISorYsGEA3fVR30G6vbyGgoqYidn6Ij4hO9lq
         D9vk3cPBWIIl/eIb8QpqBIM35dhbhXyj9cklThFrUE6+z0/qdwXC8DeCgimUebIYjThR
         h4rPMZwOsnMZTJELKIP70LJC2IiZk2GHsTyHEzHi25j1lhpEFeFYFJdasi6G0kd2mFBW
         k5KT3gwTs4PSmzbKqNO3YiPRV0kZbraUaEqas9qG1tWN7iwFKxuwptInvZXRfvM5wEK4
         vnyNf9hLDkHDkxjUOOAr8d0OvirDRQwSf2v1c35neWKyNchGzNwgH/AXpKo2u4uNc9zw
         xXkw==
X-Forwarded-Encrypted: i=1; AHgh+RocWcA+e1SgLdk6Sg3oqlqz9x4UxAaz+X40jSf9i2aopo+k3Ab6DUukVQZ0P4abmJyhhHQ4HVhjf9E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbMC+kFtNbvmgS+O6Tq2zs8pdcinRkf/70uXBNo+1UTCwMPY2g
	fdhx888RHkJYqzA+PpORBB2RjQO5BFIO/ZJ706BEXjX6F5Qe1+0WxUFPf7SSC2+sD+sEqkqXEZE
	IvfW5tYKECpqJ4peKiVKtXj/ARKzN57+jISqxK/Zo/eTzYaeuPDaCF7lZ2Vr/Uag=
X-Gm-Gg: AfdE7clJJyXMqJOvIKMumPYgtf/RMUgcojoUOtDVtqBpmISayK0zlYp5CkFEMK4ngE5
	rBIiDsfIX60sFR8GmRL1bmj3uvGV3+Ibnzr+vz7ftGX/b6X3KCueKo8AHetC8zYXG87q6RKJ/vB
	gVEyrFs67nJSYmbxVFbHDrywiNdm+SNII7yJdNjUXhOkSc5JRt9ZjW2HKtPjXLDAGlTvx8JjQBQ
	Wy2+BofNhXTnzsOAVq4YfzYsnsD6fVfgekHnFvnvv720gIGxGfWWT1sLhs8FVJ0JJWs1EB6mFQx
	cs+hMscnU66cKO90X6LMyMTLxipwG59Esh/86e2CrbYO8Lu8ImJEk1jFeMN6imcs0MBTTu2zRt4
	RFhyZ1ZKHcPoFgDBar7Ay8xQ8z9pARw==
X-Received: by 2002:a05:622a:5812:b0:51c:ecf:4eb3 with SMTP id d75a77b69052e-5213c9e3801mr151088291cf.44.1784640818307;
        Tue, 21 Jul 2026 06:33:38 -0700 (PDT)
X-Received: by 2002:a05:622a:5812:b0:51c:ecf:4eb3 with SMTP id d75a77b69052e-5213c9e3801mr151087911cf.44.1784640817721;
        Tue, 21 Jul 2026 06:33:37 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9dcf:9ab8:bffb:ec35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm237901185e9.2.2026.07.21.06.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:33:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:33:06 +0200
Subject: [PATCH v23 01/14] dmaengine: constify struct
 dma_descriptor_metadata_ops
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-qce-cmd-descr-v23-1-1be02deffda9@oss.qualcomm.com>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2359;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=T0ZAEoPGlcD+MBsHOs7IR7iXvbxs2FRnDbpOdt9CWCM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqX3UdE56w2Il7jRT6FRLwWC7FQ2qm1Nq+0Av+/
 2hf/Q9hzPyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal91HQAKCRAFnS7L/zaE
 wwHdEAC2F3MLYx0wjHZ8HaEGIrCSvI/zuYuUmsa2XRVR0dQHmGhJr0dBsit8yKEB9ukD2zh4FHb
 1VBJ2G79OlRyID2BNCTe113ahVUOymmJ7xRPMqS8d5vwCR9G3S0RLeiFzG+4RITX8ZnrQr/643b
 rsoyuf9H1PsagPrwJiOyw/WBWiP7wISuEXD+VhhglJQHrctc1aOAX65HZHEi6DZhJgwXDC9/wRO
 xttNtToOx7K76Dxv+PWpSoeSynRBsXkhgzE/FuCetUJt+OV2snZu2tgkrPbCNL16dfujQe7W0D2
 lqV92UnR0FSusawVaMDisWWEEsAU0828NP22C6mQkRZbBTbcJDV/rF1ZKuVMdlOK6ZDth6h1C2m
 gOSY3sV198Bb4A2ObPkzJ6nMh+92WsJp8crOzpnKE8p1ii6ijhEdvOA4FY8RBbeAzQqYjfirB02
 Rlzg3fEbrcgmiza/j9SaPBaIm8Ib60Il7hzaby9ho6VRdifwrSjukCwUmazyYY+5DUZeBvYhyy0
 7k7rrCAlSA2Bmy4p+6eNkUoGWk/fLa17MuG0vAe4rrLXdqm0Ei4wD3zwTgAQBCOaBvpThKpuqiu
 dY2fSoF2YvD0PiNi3T/uKql2eq9J7KRrk1CDlvSkDp5p9hmBTr1roP2iTeqzSqr4W6SMZpuVgSY
 BmrWspmX3eRNM3g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: LZyzZ561jmfzfiSEA1-pdSmHJ8Y0mEB-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfXyYDYNqv9yW3v
 1xcmS+Ta/n5vmXDCyRBWNsz/Y6I66BA7i8tmLVIxgntNnZHii3vHKRGxGDOQci5mWF6NbkhDvYf
 WRLgHW99Yjjj2aSv+J2kzvVKJuhTBJw=
X-Proofpoint-GUID: LZyzZ561jmfzfiSEA1-pdSmHJ8Y0mEB-
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a5f7533 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=zd2uoN0lAAAA:8 a=EUspDBNiAAAA:8 a=XeVHrwws4l7kqE2Ex6IA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX36c05rlQUZIO
 xgZOlCbOVA5bMrWV/C1P+JdGKa3kVYwWbrYhmPxmpZzBjLQDxjzJji8qvSi5y45/E/yfUTXG6HT
 UO9qzD8O2w1b+2XoTJ/Rifd5b2wHm2P616b52cWnPcZYCNLLmsmW72Jp3NGIpJIvVdVpRxSwRz5
 z2H+H//iLe/rnL2YwsX2hQvzU8eyaDu1UV5UeiPz3zWp9E7ilOogScj/PB12mfTk9cDAlABc6vp
 jpwPcWCmLL5w6xKJZyzhqPXCjJUTyna7nAAZzXanYSE948dTyyGdDJfJ2fMT8VUqFzE62Tbv+5E
 3FYvN9WL/mFhgnxeNrSaoeVnkF6y9UawG9xHOV+4/wg5sm1qfsbgmOmSArB9WEY831upWbtXf6U
 t5B2TffrPmhbvrZ8pTKIdvP2PLzdGP3mWyDUR7Xvyu6FrSNRZxlORpE0L/MUyGS67dYKoqJ2R52
 8KR81HHLmGzU9AYv3Qw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210144

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

