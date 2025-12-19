Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EB4308F28
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 10:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138926; cv=none; b=keWe75lKyKyM8EjJ+3vcImYTxLCUA3zZ0wCBe91d7DE7eVBEMVX1OvFvxKCnRr/BAadZYpS/NC2sZqG/1KQSEQ//Z9kys31j7PAE/TddbduvnpImZqnHYFRmSQtrfwf/E7xymKOzV2i1EIEmOKSBn/9I6DSCBr6BmYRVQ28Y2lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138926; c=relaxed/simple;
	bh=P9G/XM66hhWIjOFw9n0h55XNqJdzX7mEFBNxYddp5xY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=La3+tx6fubjw76eMhLlkz8tAK0Mf4UXCJ/vRCdOxfOcCnHL+a4XBqFiyQlG4OoIl+kRbjByKbVF3NaW88sGVxlXuF+JPf0cu91DSVwr6NCbPKGO4lu/1QDkOOVBQtxePjAtOZqT8bpaDik/VIPKZuMqMovt7qJgFNP7+oJ9Yo5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TFDeXbjr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RSY/Rca6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TFDeXbjr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RSY/Rca6"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cCac4101209
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 10:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AsfR0Ng+trtCxWXr8RJfsUoS0vYwVZ8Rep8jGuwkJXE=; b=TFDeXbjrFrYgpgLQ
	kK3ETByF+XbgHvp/3dLKBWVjxW3fH82gF1t+lmI53Pr5Agcbtq+N9wq2Wwb0RmfI
	vqZh9sYkrEzaIPNNmBH7vSGypn4na/+f14Nvsf78mtYHIsqlTYAH5YX8ioYNVGVW
	fTVWUmitFXyDtuZtS8ow7tJfvaegetHjjjALTn3sVgd0dD91rb9tJDLJrZKEFoSW
	oon0J3WKd/v2l4cosJq9e1wIy9Zpd0YXK+G3Kg/4aWUQJlQHUH89i5V28jaxD+Wi
	HIbFak5aOAfH29Su5+1+WYJtUTwZbsX8akWvcMGju2zjF0x5Ydq7eaXfeai5UCtj
	NFKrog==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c28qx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 10:08:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed79dd4a47so30836471cf.3
        for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 02:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138921; x=1766743721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AsfR0Ng+trtCxWXr8RJfsUoS0vYwVZ8Rep8jGuwkJXE=;
        b=RSY/Rca6dE+/4UM+TcljecSNEusDRjfhRUymCQr9k8lpb4a8GQLi6gK7ZqS/WwGYCD
         cEVKonrABzANf2ZPEWlCZwlhgcPCEHLU2STG2IWmnqn183OWiETaqnZZGACvybEJIdvQ
         OVroMaJ+20XeVXMJ4Iet2dKztv+uvCv9799ePVK6fhP/ZjmyyJ+ZCY9OcMOjzYjJWzom
         HoQxrLuVaTeE1XBnGVVHupCAxTkUs9tubuXR3AeDpKMhyjJmXgCROs4suJe1nIbzJeRc
         oZyww7VOIM6mPCbUZVUr+ThH3X16DM/cCBDgfhfS2GRNc/4iE5nrGsppuQETDzFYJc+N
         rwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138921; x=1766743721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AsfR0Ng+trtCxWXr8RJfsUoS0vYwVZ8Rep8jGuwkJXE=;
        b=AEm1TFsFaNz34kEUqzZlhhBD33B53ixfuBWh5LqGWX0oB51vK4UqeMEM4JoxtEhonS
         MTSvdTIc33JpNwqWDy3tUCcwXvzrLRqdcX4f42y5QJ140oWxYoJRI2iA+rdbPTH123ai
         HnrUqEFSREwrt1c/sE/are+XZVjZOwk8m2q1faCdYygK+fpkhM8+pTipeEVEXOBXkRs+
         dBV7LSQ77F51VTc4t3umqG9gArFrbhTPQlKjeVo5RflkCGgFAyaxpU4v1xI2U0WC5mI2
         SW+bsVIlsRaT6qr9gREz/PBvQYdPPvm01KYLn1rgOCK73sSe0afvfUHUxRQfCYvL1B4I
         NbKg==
X-Forwarded-Encrypted: i=1; AJvYcCVXix7bZ3P4lehmFjVPoDVSrthDiNEZumkQ2TDkLsBRWd6AhorAoOgIE2vHH3iNl8PPmxEE4wtHTnY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu7UaWOp6VIPv74nd2P5GWSsAUCc4racwwpu/4LQWrFp5SU6z4
	chPOXQsJ7EpXcqoPZzgqxakK75kWn0ZJ7ZZGNbu6MzpqT5Kcy2Ib6vHfhwVVyc3Nvm9+nioUFGo
	NyKLSwxgGCXULggjbHAfFULR5v0wC9piKw9FK9k8iOrUeg3bOtoDV4orVTcOOyng=
X-Gm-Gg: AY/fxX4eDCXRCqiDyl8EC1GIlxA2Z+6lgoiA0aOwcHBKeNxFHrdy+rRfqDXnueanX44
	q0gcRJ3dsiLb1vL9XcFk6M3IJphI2ucRbWA3gbU0icRMY0+kujLhdP33ZarJnbvgpmQkr/g3qFR
	yaMBj91+jyVwz/lj/aaRMrWEqebQks97bxt1eEIkN5hQ6T9h4wC+nsti11MbSyi4MsLtm57TK6f
	oMyNyN+i533KHunhfyBYrS9nKHxYuRqsJroCFMMzp1nBi6Mo0kGzxg1Tt/fiEDq93mrxrXrNEOO
	dparZva4+MMcKH9UW/6r7oG+GXV3w48qxBBDMpOJqIQgTRBJKlxDxcWzxs3+zvrDHJvsN26bLUh
	bOpR+fetoLMCgh1zjqKTN8ETOWKNjIFUubY2A4Q==
X-Received: by 2002:a05:622a:110e:b0:4f1:dddb:db6c with SMTP id d75a77b69052e-4f4abcd2b29mr28277851cf.17.1766138921216;
        Fri, 19 Dec 2025 02:08:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLWIIZH6dn2g0LJ7sXhg7c9rCUSr4NrjHFbJy6f9ZZtbiONrsZjv0bkNSmQnx+9j6jPiwdXA==
X-Received: by 2002:a05:622a:110e:b0:4f1:dddb:db6c with SMTP id d75a77b69052e-4f4abcd2b29mr28277501cf.17.1766138920762;
        Fri, 19 Dec 2025 02:08:40 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:a48:678b:dad2:b2eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm4209571f8f.27.2025.12.19.02.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:08:40 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:07:49 +0100
Subject: [PATCH v10 10/12] crypto: qce - Add BAM DMA support for crypto
 register I/O
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-qcom-qce-cmd-descr-v10-10-ff7e4bf7dad4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6295;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/pYNdX79IsEIfqFLc24whwQ5VhyXqWC/xkdLuNIvPWk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRSQWWy6tmDN6lEKJplrycxbz3c3ipqiwC7uVN
 C4G4SJfw0SJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUUkFgAKCRAFnS7L/zaE
 w+O8D/4sEb2NQwa5xHp1gAD5kXSpQRLSDjZtPoAONLsTSMLr3gDDE6XsCixHEZh0P1rp44AY5BP
 QOXs5KuYSdM20vviONmVFZ4vzvf0iuUwYaaJgaSl8ajE8XX6DSkSYU/BBUz8OXoYpaVgOxhbUvV
 7dJan1tMesdNmlH0ZM6pHhLta31CzNDwvrXIrdUQJ5Dy5cSbcL5IKipKBVGbsHreb8qHOh0SASP
 nC8/3x5KMPUgrWHcNIXq8pTiTnttaESioP6AZ7sZmISo0OqI6MlU3GGJBbR3rOHbhYPH+mUFykk
 Dmwt9tNPAwGYHgtWWlCvN83RhFdWhI4yf+4j0N0X02xQoIZgqDEaRtvRGc3H+C3SNJtJ2tnIe/f
 FBAhqW6cLgyWJPve7N+rLw2JakryNZIFPMMX5hlSZ7PlJbRG0qu+6ulsVxE31Oyxkbg5OBuRC4j
 wKpVsz55WilzEHK8VGHFljMynKI+gEPQo5xxTNFS2ko/4tNgPRe3doq+t8qAO73RvbkK9HY+SG9
 Uenf1KXuYj6t5Npd/a1oh9/JAfWO1A8fCQXQMlRWQMoJGBtYLudKdsw1akwVY0DkuYAGzTtblhq
 VRh7pPUMmfjI94YjUsskfxXExOTf5/A24F2r7Tal26r+3sDSv9aYAvS6/kL30t3D08uP5dnP7y8
 Y9X72FCrnKj5Kuw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MyBTYWx0ZWRfX+gwF4oq7DGDc
 RixiOm7jYc+Ju3pmcJTBSpNYC3pEP6b/Lbx4CfY7O32mM74YskMazAX7QqS12x6FqxxFR6OQ5ND
 uK/m1NYHU39mPC75YO2699g6bEdnBwCrjLXJXhXanLxsfnb9BBBFzxWavOsW6DHrTwjDA9V7azX
 cCm1r00crybFSu0NfOi+7wV9wO8dMZ5JgJry1g+pNE5HOHK74rmwwJeq7Q/SyY5KVzHsLBgWP1v
 N+4YSYr75OS+s+LXS7JHzT3bDUz/NJd+EqUgrtpSCP3JOZCDLo0QP+o3wWtkt4WAbGUmVedfIyR
 fjKUc9ssfrfRRoDFsRsmS5hgEkSLwtdMM3APRZ8CtaCX40UA5k+pbFiCJfVgKE0gcOmd8If7eQ4
 x1eK8Pis2zFzJZPVRCinSDWG1RAwew+4xK49o5rHrHT40tdQbyC1ELTGyxCD4HqPpqhnexmWLJu
 3QSEXIzq5ZGhZyNkIzg==
X-Authority-Analysis: v=2.4 cv=dOmrWeZb c=1 sm=1 tr=0 ts=6945242b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qGjQl-v-kXvwofw7MDAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: WMXpvg-cfc4WDjq27VFiK18pQOCKvdL4
X-Proofpoint-GUID: WMXpvg-cfc4WDjq27VFiK18pQOCKvdL4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190083

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Implement the infrastructure for performing register I/O over BAM DMA,
not CPU. No functional change yet.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.h |   4 ++
 drivers/crypto/qce/dma.c  | 109 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/crypto/qce/dma.h  |   5 +++
 3 files changed, 118 insertions(+)

diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index a80e12eac6c87e5321cce16c56a4bf5003474ef0..d238097f834e4605f3825f23d0316d4196439116 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -30,6 +30,8 @@
  * @base_dma: base DMA address
  * @base_phys: base physical address
  * @dma_size: size of memory mapped for DMA
+ * @read_buf: Buffer for DMA to write back to
+ * @read_buf_dma: Mapped address of the read buffer
  * @async_req_enqueue: invoked by every algorithm to enqueue a request
  * @async_req_done: invoked by every algorithm to finish its request
  */
@@ -49,6 +51,8 @@ struct qce_device {
 	dma_addr_t base_dma;
 	phys_addr_t base_phys;
 	size_t dma_size;
+	__le32 *read_buf;
+	dma_addr_t read_buf_dma;
 	int (*async_req_enqueue)(struct qce_device *qce,
 				 struct crypto_async_request *req);
 	void (*async_req_done)(struct qce_device *qce, int ret);
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index a46264735bb895b6199969e83391383ccbbacc5f..ba7a52fd4c6349d59c075c346f75741defeb6034 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -4,6 +4,8 @@
  */
 
 #include <linux/device.h>
+#include <linux/dma/qcom_bam_dma.h>
+#include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
 #include <crypto/scatterwalk.h>
 
@@ -11,6 +13,98 @@
 #include "dma.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
+#define QCE_BAM_CMD_SGL_SIZE		128
+#define QCE_BAM_CMD_ELEMENT_SIZE	128
+#define QCE_MAX_REG_READ		8
+
+struct qce_desc_info {
+	struct dma_async_tx_descriptor *dma_desc;
+	enum dma_data_direction dir;
+};
+
+struct qce_bam_transaction {
+	struct bam_cmd_element bam_ce[QCE_BAM_CMD_ELEMENT_SIZE];
+	struct scatterlist wr_sgl[QCE_BAM_CMD_SGL_SIZE];
+	struct qce_desc_info *desc;
+	u32 bam_ce_idx;
+	u32 pre_bam_ce_idx;
+	u32 wr_sgl_cnt;
+};
+
+void qce_clear_bam_transaction(struct qce_device *qce)
+{
+	struct qce_bam_transaction *bam_txn = qce->dma.bam_txn;
+
+	bam_txn->bam_ce_idx = 0;
+	bam_txn->wr_sgl_cnt = 0;
+	bam_txn->bam_ce_idx = 0;
+	bam_txn->pre_bam_ce_idx = 0;
+}
+
+int qce_submit_cmd_desc(struct qce_device *qce)
+{
+	struct qce_desc_info *qce_desc = qce->dma.bam_txn->desc;
+	struct qce_bam_transaction *bam_txn = qce->dma.bam_txn;
+	struct dma_async_tx_descriptor *dma_desc;
+	struct dma_chan *chan = qce->dma.rxchan;
+	unsigned long attrs = DMA_PREP_CMD;
+	dma_cookie_t cookie;
+	unsigned int mapped;
+	int ret;
+
+	mapped = dma_map_sg_attrs(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt,
+				  DMA_TO_DEVICE, attrs);
+	if (!mapped)
+		return -ENOMEM;
+
+	dma_desc = dmaengine_prep_slave_sg(chan, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt,
+					   DMA_MEM_TO_DEV, attrs);
+	if (!dma_desc) {
+		dma_unmap_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEVICE);
+		return -ENOMEM;
+	}
+
+	qce_desc->dma_desc = dma_desc;
+	cookie = dmaengine_submit(qce_desc->dma_desc);
+
+	ret = dma_submit_error(cookie);
+	if (ret)
+		return ret;
+
+	qce_dma_issue_pending(&qce->dma);
+
+	return 0;
+}
+
+static void qce_prep_dma_cmd_desc(struct qce_device *qce, struct qce_dma_data *dma,
+				  unsigned int addr, void *buf)
+{
+	struct qce_bam_transaction *bam_txn = dma->bam_txn;
+	struct bam_cmd_element *bam_ce_buf;
+	int bam_ce_size, cnt, idx;
+
+	idx = bam_txn->bam_ce_idx;
+	bam_ce_buf = &bam_txn->bam_ce[idx];
+	bam_prep_ce_le32(bam_ce_buf, addr, BAM_WRITE_COMMAND, *((__le32 *)buf));
+
+	bam_ce_buf = &bam_txn->bam_ce[bam_txn->pre_bam_ce_idx];
+	bam_txn->bam_ce_idx++;
+	bam_ce_size = (bam_txn->bam_ce_idx - bam_txn->pre_bam_ce_idx) * sizeof(*bam_ce_buf);
+
+	cnt = bam_txn->wr_sgl_cnt;
+
+	sg_set_buf(&bam_txn->wr_sgl[cnt], bam_ce_buf, bam_ce_size);
+
+	++bam_txn->wr_sgl_cnt;
+	bam_txn->pre_bam_ce_idx = bam_txn->bam_ce_idx;
+}
+
+void qce_write_dma(struct qce_device *qce, unsigned int offset, u32 val)
+{
+	unsigned int reg_addr = ((unsigned int)(qce->base_phys) + offset);
+
+	qce_prep_dma_cmd_desc(qce, &qce->dma, reg_addr, &val);
+}
 
 int devm_qce_dma_request(struct qce_device *qce)
 {
@@ -31,6 +125,21 @@ int devm_qce_dma_request(struct qce_device *qce)
 	if (!dma->result_buf)
 		return -ENOMEM;
 
+	dma->bam_txn = devm_kzalloc(dev, sizeof(*dma->bam_txn), GFP_KERNEL);
+	if (!dma->bam_txn)
+		return -ENOMEM;
+
+	dma->bam_txn->desc = devm_kzalloc(dev, sizeof(*dma->bam_txn->desc), GFP_KERNEL);
+	if (!dma->bam_txn->desc)
+		return -ENOMEM;
+
+	sg_init_table(dma->bam_txn->wr_sgl, QCE_BAM_CMD_SGL_SIZE);
+
+	qce->read_buf = dmam_alloc_coherent(qce->dev, QCE_MAX_REG_READ * sizeof(*qce->read_buf),
+					    &qce->read_buf_dma, GFP_KERNEL);
+	if (!qce->read_buf)
+		return -ENOMEM;
+
 	return 0;
 }
 
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index 483789d9fa98e79d1283de8297bf2fc2a773f3a7..f05dfa9e6b25bd60e32f45079a8bc7e6a4cf81f9 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -8,6 +8,7 @@
 
 #include <linux/dmaengine.h>
 
+struct qce_bam_transaction;
 struct qce_device;
 
 /* maximum data transfer block size between BAM and CE */
@@ -32,6 +33,7 @@ struct qce_dma_data {
 	struct dma_chan *txchan;
 	struct dma_chan *rxchan;
 	struct qce_result_dump *result_buf;
+	struct qce_bam_transaction *bam_txn;
 };
 
 int devm_qce_dma_request(struct qce_device *qce);
@@ -43,5 +45,8 @@ int qce_dma_terminate_all(struct qce_dma_data *dma);
 struct scatterlist *
 qce_sgtable_add(struct sg_table *sgt, struct scatterlist *sg_add,
 		unsigned int max_len);
+void qce_write_dma(struct qce_device *qce, unsigned int offset, u32 val);
+int qce_submit_cmd_desc(struct qce_device *qce);
+void qce_clear_bam_transaction(struct qce_device *qce);
 
 #endif /* _DMA_H_ */

-- 
2.47.3

