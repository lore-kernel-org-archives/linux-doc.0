Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACC32E7378
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 10:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727389; cv=none; b=TYLnB44RiIW9mUN296N9UffdU1LHEuxFpzi1X/YFA2DfW0P4Yszyfvaag54n3RCYAurO+fKiIIcrE2e6q0InNj262jEjSyzsjfOT+3KjBO3hBEyvMHImv8CWozEZGQG92SvzPoM9ND9nT72W6hzKi7khI51EgOBvXnjzm4tn1Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727389; c=relaxed/simple;
	bh=wCpLSEqzl6yoBDde9p+VABZfQUJK0dP0DnJmF5kRzKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QNTfGSldJAWIFdpjVrEkXNPDXL7wrnwubZMrWtyMUP2BUNtvWMezNHypRVAudd/TxIcSPqcChOFa0yrPZKkM32QQv9Kd/OyhRauF8UHpeBhIEUPz2F66kXGGd4Crf2F83Dx6qsafcw40DsHC9IHcgB6JvO7ZG2yquuro7jAO3N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lxd+YGM+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nx93eJ1O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lxd+YGM+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nx93eJ1O"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T9n4br2529357
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 10:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=; b=lxd+YGM+KoQxlNeH
	8pH+churOwNbEFL+qWr4HRWHCEr3Uop3Ij5kQnsEWZiTrq9LCMnfYAQFuAJXC0G1
	RvJm3Vvj0mwZVTYEMRq4OZm6aKl1pvMuMPt8/tI70W0Fav+WLUP6sCDOAMeTIkg7
	sYyokkHnxy90WWTH02di6CAtw73PBmkuY5DdzpQAYDz1Ho/8Cjw33prc7DWH2Ug9
	9iTA4r2rLsp5dPiCD0dcd1FegZy6kiCBK+ZT/QxbE9QPgeZgy6KYlu4Lwv38bFFL
	sOzWe7ftUFoAM2HFW7I8TYNAJblflt5TAX9D9nUoBCH1xNJbW3oTSsDo1NbKf21J
	lYtM2A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3pdkr1t5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 10:03:07 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963d24c3886so4117722241.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 03:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727386; x=1783332186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=;
        b=Nx93eJ1OoAilEGxj7A6enbHsNSYmRj4etMOORfDTk0EY7q5t2kYjc8iaxYqAthjt8G
         VOlgW9MJssnL5boZd/zs1q7MdX6kWzjJvUTU4Ndr9+EFS3FHLXHaTvOT4bjSJBrFB6G4
         n0S6ydL2sGLG6/CMeE87mqwggG8wCHh5w4Yvyt5f4a6i4n3L46D1m+dGKcOWTewZ7HOZ
         ZqbZ+kE/83opF9c079TfSYHNAs1aMzaZEMJxfxk6moWKFX+8j2NTsuPB7KvoTJhNRyHr
         9J2ZcPVT5ogYLt+SVtFgocKkiLVPd54+4RVM1o56IL1q/RxJCmNhRiwo++yoIXFlU/lq
         aXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727386; x=1783332186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=;
        b=qdfyxlNS77PO3YYMbiIihuVl12FMCt1RaS7Qllj5dzTs8Xgq8/gFSoCmAnMKlBquXW
         u+eoue7e8MDpjokNYaRKGY/hCHyNorqrgQs3Nl85gFjfD4ZQw9ZqXj+vCRi94Xw9vbMa
         0xaT93MS5FLaUv9uMZH+x4Hi5/dc9k6emaIscTy+sNZUyQvgmFVaixwYFhUmrHm7qrDd
         Jdlh1gz5NhgDweXnBFTXX7f6tN0gmNM+/6Z9r9Wd36cbSjnTLSnxKoBaSD2O5bzHQrVA
         EpLMspcZGp4sU77HzaAtjszIsBRyQaFF6KWfvchclZ4cyFNh0OPpzmUBhKLn30oSyU6c
         j81Q==
X-Forwarded-Encrypted: i=1; AHgh+RrukY4ZRYa5Ztug8xCOT067cVpbvIk5PQ5a67Hm9y8N1AzhZFgzRpfjtbsPIjhvTNv45K84xr+pHBw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTX4ftOFYDTU44MlyK0/5O0vJ1l339V5pCVCRxGD0yvj7S7yZk
	df/9TldUGIuQTqZo8QBiRH+3vSaXThIKUxWjtVN5yZzCkYuI44UqhHljFe8pHffcCMV7xuK/7Ft
	bTqHnaeSAuGZrn+VtEMU0OE/k+SYUx6MHJMbLZjmFYvlWRvxgUofcVeLfUp89mdo=
X-Gm-Gg: AfdE7cn1xJOgYcfgrj56inS1Nf8XFGzHXUTgcIe7AuWafM39h2hGFc4FBYyu3JeFvmt
	GsoRLJE/7NgS631DSB06kOccyjn7i/3D5kghHocNU19Zpcl+Pr3OeOUQeE9CZtAhxX3Ns0CUAV8
	AzHJYldVCq/B55qpbi+gfm4ga2KG65p9rtGHS6OAhtQDwfUA6519sLVJoNMtRn3/bufPlSHOy3b
	eAEOYscuBi89kl7sNYT4bHZqBDRM41IM4gcr5KSeVN5rdvyNF0RXAZOUKMhYJQP2hBd6TY/9xpn
	+poFjTC6yQTi3He95lmapOekM21ISa9v8QYxNlyMTT0p43GiOOMyy+9VQ3KhABwsathDhYCfGRM
	mtGWUp41LT93Ff9N/yQLX7Hpsyw184RIaV8xOABpg
X-Received: by 2002:a05:6122:7d0:b0:5a5:3eea:4513 with SMTP id 71dfb90a1353d-5bd69dc3af5mr7025438e0c.12.1782727325978;
        Mon, 29 Jun 2026 03:02:05 -0700 (PDT)
X-Received: by 2002:a05:6122:7d0:b0:5a5:3eea:4513 with SMTP id 71dfb90a1353d-5bd69dc3af5mr7019570e0c.12.1782727294041;
        Mon, 29 Jun 2026 03:01:34 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm24729405f8f.0.2026.06.29.03.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:33 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:01:05 +0200
Subject: [PATCH v20 03/14] dmaengine: qcom: bam_dma: convert tasklet to a
 BH workqueue
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-qce-cmd-descr-v20-3-56f67da84c05@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4421;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wCpLSEqzl6yoBDde9p+VABZfQUJK0dP0DnJmF5kRzKI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQkJqJG4NZNDsu3JpoCMiZp9XSSPn3ihDbswpT
 eRQcXp5nSqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJCagAKCRAFnS7L/zaE
 w0O7D/9JyrQzzkB6Wv5aFDilYPXHCfO21IAugUnx/jhdZge7cS0uKPqSl3fpxRpgvSXj+RRR5kg
 9H9jHZKnRdNXuz4SUrASw4kQ5c8ljBRgjMchfuTJ+LdIo25IcgjzLivdnrB1BpfNe43LwQtKL+x
 neMud/IXvYTf2wCDQ/C3AZRNjxVzSel7XqEw31QvO9+R7bqQ+fJ1CJA/MSBM4HRyaYk5BkALVuo
 MDh4fw99EflxoUkbyXJNgHKNfdch3FC9Wgt8qpy/JrjauwCgv/rxtne/IRWQ6eGx06YVSk5jvk7
 G7MDd26+G5V5DCznpnGLerUympvDBJaaKsqhb+szgyEfHcyN7KJ6Q5nJHkyPLnlG/jus12CAMLJ
 2V/bE7YPzzhNZQUO3U7u8F6Xo21Tw11UDlx5ZcSqYWgXO2KxAl9CUMff30s0O/dXCUOeffsScI7
 gk9hnmJAjWw2ROgbnw4WZO1Zi+1DfN+N0fOubDPkHsmR86sJelDk3yUxDS4lJaywRdRjOH9sh1u
 HF8ImB/FFfAZEucm2WvC8Wr1qaUs7PhhNfogsTbBCNvwi10Ty/z+vv9Y0yzR5MCmGx3e00fwDMx
 kQQj/Amm+hntJH42xAxr1RgzK0jaMHrM2SqvygNewU5I8u8+i70S1W1IltItgX9QhPe1SAbRzDl
 dvjlUNdtwr/vbuQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a4242db cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=u-biHsxzOdRIXVMzAPsA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: fQFJ5ffJNbV-bYNiy6_IdW2D395Hh94G
X-Proofpoint-ORIG-GUID: fQFJ5ffJNbV-bYNiy6_IdW2D395Hh94G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MSBTYWx0ZWRfXxoOnabokI5ZY
 pwIx0iYyMARBjqTh3kKHcECN3hoB2plAKqcXbwlAFnMGD0LfzZyxcgs5A9zEI6ZqZI0gVMrDTEr
 5PcZdFw5lC6THmfS1bOp2uhi6b1YqvuIwGxWA6pRocuLuRcZKHlESOxDKlTrE/rwvXp559RPfMh
 HxFcA8UNKQjXafNpwTuxf5FhIVgmak5AJfmQvZiIXk8n3K4StIue6DI/Pk0oMne7EEW6SiBhKSX
 VoK96F2a9AvssyC5fwjszSSvA1Fo/F/4pBhomHbwt8z8ELqAPxOrFOudi35WazT3iX/dgE5a9jd
 r1OOHUjyuVd2XMaF20UrJwbHUbHlwkFdGRvAGHFhosfvj3XylhfSD+rZz0rO75YVM1fGQ2FVSbJ
 LbYAOSaw5urXu6hSI1cnzI6YbkgJvGxkiXCmb03dx6iubl+y5rwMRXxt7XDyQjX/FwysFX2SXZb
 MjvqofAStoaCj1H8DFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MSBTYWx0ZWRfX8Dx3Rwj6wqFY
 0sJw+Hn0GoGUE972mBew7rgib8mRpQBHWQ+/OCd+yt1EBWtUOqBqGJCtTlUtwv9ik9DX6CEhqQf
 OzehqPsQoGIYoUIlxMAthEddrF4uy74=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290081

BH workqueues are a modern mechanism, aiming to replace legacy tasklets.
Let's convert the BAM DMA driver to using the high-priority variant of
the BH workqueue.

[Vinod: suggested using the BG workqueue instead of the regular one
running in process context]

Suggested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index fc155e0d1870cbb7e099a2c4280f9f8fbdf6cf15..ea3df28e777f99c0532761b6aee6807ab23ab4ca 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -42,6 +42,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
+#include <linux/workqueue.h>
 
 #include "../dmaengine.h"
 #include "../virt-dma.h"
@@ -426,8 +427,8 @@ struct bam_device {
 	struct clk *bamclk;
 	int irq;
 
-	/* dma start transaction tasklet */
-	struct tasklet_struct task;
+	/* dma start transaction workqueue */
+	struct work_struct work;
 };
 
 /**
@@ -892,7 +893,7 @@ static u32 process_channel_irqs(struct bam_device *bdev)
 			/*
 			 * if complete, process cookie. Otherwise
 			 * push back to front of desc_issued so that
-			 * it gets restarted by the tasklet
+			 * it gets restarted by the work queue.
 			 */
 			if (!async_desc->num_desc) {
 				vchan_cookie_complete(&async_desc->vd);
@@ -922,9 +923,9 @@ static irqreturn_t bam_dma_irq(int irq, void *data)
 
 	srcs |= process_channel_irqs(bdev);
 
-	/* kick off tasklet to start next dma transfer */
+	/* kick off the work queue to start next dma transfer */
 	if (srcs & P_IRQ)
-		tasklet_schedule(&bdev->task);
+		queue_work(system_bh_highpri_wq, &bdev->work);
 
 	ret = pm_runtime_get_sync(bdev->dev);
 	if (ret < 0)
@@ -1120,14 +1121,14 @@ static void bam_start_dma(struct bam_chan *bchan)
 }
 
 /**
- * dma_tasklet - DMA IRQ tasklet
- * @t: tasklet argument (bam controller structure)
+ * bam_dma_work() - DMA interrupt work queue callback
+ * @work: work queue struct embedded in the BAM controller device struct
  *
  * Sets up next DMA operation and then processes all completed transactions
  */
-static void dma_tasklet(struct tasklet_struct *t)
+static void bam_dma_work(struct work_struct *work)
 {
-	struct bam_device *bdev = from_tasklet(bdev, t, task);
+	struct bam_device *bdev = from_work(bdev, work, work);
 	struct bam_chan *bchan;
 	unsigned int i;
 
@@ -1140,14 +1141,13 @@ static void dma_tasklet(struct tasklet_struct *t)
 		if (!list_empty(&bchan->vc.desc_issued) && !IS_BUSY(bchan))
 			bam_start_dma(bchan);
 	}
-
 }
 
 /**
  * bam_issue_pending - starts pending transactions
  * @chan: dma channel
  *
- * Calls tasklet directly which in turn starts any pending transactions
+ * Calls work queue directly which in turn starts any pending transactions
  */
 static void bam_issue_pending(struct dma_chan *chan)
 {
@@ -1316,14 +1316,14 @@ static int bam_dma_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_disable_clk;
 
-	tasklet_setup(&bdev->task, dma_tasklet);
+	INIT_WORK(&bdev->work, bam_dma_work);
 
 	bdev->channels = devm_kcalloc(bdev->dev, bdev->num_channels,
 				sizeof(*bdev->channels), GFP_KERNEL);
 
 	if (!bdev->channels) {
 		ret = -ENOMEM;
-		goto err_tasklet_kill;
+		goto err_workqueue_cancel;
 	}
 
 	/* allocate and initialize channels */
@@ -1389,8 +1389,8 @@ static int bam_dma_probe(struct platform_device *pdev)
 err_bam_channel_exit:
 	for (i = 0; i < bdev->num_channels; i++)
 		tasklet_kill(&bdev->channels[i].vc.task);
-err_tasklet_kill:
-	tasklet_kill(&bdev->task);
+err_workqueue_cancel:
+	cancel_work_sync(&bdev->work);
 err_disable_clk:
 	clk_disable_unprepare(bdev->bamclk);
 
@@ -1424,7 +1424,7 @@ static void bam_dma_remove(struct platform_device *pdev)
 			    bdev->channels[i].fifo_phys);
 	}
 
-	tasklet_kill(&bdev->task);
+	cancel_work_sync(&bdev->work);
 
 	clk_disable_unprepare(bdev->bamclk);
 }

-- 
2.47.3

