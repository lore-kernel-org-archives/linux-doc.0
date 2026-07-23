Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E7B4734D9
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 17:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784826601; cv=none; b=rIho2MfH6yCQM702R4ZVhEBILs7sN3JbEz/Km200OCIB+ZlA9vfwtZNr4UGfvK1zpcDC5Xfkl0GnjmjTKaX3uz8qcBwX04VNOYKq/BJNWKORv6IZg1JLkGfmY3uYH2JK3ar0sHyT9GkOHNRNIcSt2xODb0Ie61Vpcg3kJTjdcNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784826601; c=relaxed/simple;
	bh=wCpLSEqzl6yoBDde9p+VABZfQUJK0dP0DnJmF5kRzKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qH3OE3AHRgd5VOEgMc+SGmY/VEIMqWyvaQGpLooaAHC2ekLO/yJVcl4pLB3iIfavG90PDmxq5M2fkeAjWpMmUf/omsQPFM2IYxm1uNuH92FqaiLGsRX1GLWUjxTTNDDf4rNj1iQKdxHXw+T5vAOBbZCWRjSSvG2LmEi44+SRSys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kn1hPOoe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TwSNWX46; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kn1hPOoe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TwSNWX46"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCw4P93605672
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 17:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=; b=kn1hPOoe0KcUbjHa
	+wIOfkQ+gSJv2FonGs3nvAeM9E0OnBoX38UvSiqErEhF3Pi6rZathVDxUyNXgZbU
	XoabpBtiQI3+nn9a6RcrZ4BcZGpgkRMZ1MqwdHtRaEid+oemJ7/j/mr+zFLdYQER
	ZwV8FPJSPFVMt4CSyzOSXmX0KXjK2dj8gbd+1PtEEAnGrmc/NNrWWb3WQ/RjPmUv
	ACIm2bBW7iw9KcdgutioXB0rpuFfDkNvhcKW4zt4XMuZSYsNRFlzC00RFgEE2/jR
	zYp2pxcHk6BdJUqsYSSHpkkJcoOaQAykrQQB7pjzBjd6A2nRRPwyZRXNbO4tTNf+
	eaQajg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkeuqaex6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 17:09:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-520a00c7a03so21465501cf.1
        for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 10:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784826583; x=1785431383; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=;
        b=TwSNWX461TrbHkYVV2sw8hCtA/xCxqQ+ZrjAZSWWAvfTEUAMhgxhwN4am0ED2fluVE
         CUTruDFftS/Ll6LLUpz6htrhrkjwgzNl5QkXfhh3vobt/zetqgCmxaXE8U8HClxCkq52
         a9DhG42XC8JhXx/gbMXKlYrWHSP0k0UpArAk8cnveBd8eHdRombQppt1aPKi+qaESKPu
         sHY9hm1Rwjmo7oqADT8oBYySSPYvWM8JTsMtY6BG/pNayFV/oBLCQrx+HBE2+CZBzd0C
         mCOcKz3qM1Am8BqvgU0lAMso167+bCrGW9CIGnPOnRamIVbg7PnBn9KyBj4jWpVtH2c7
         cMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826583; x=1785431383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=;
        b=lHj7wQi9I7PaTDCp8fukHKJEvj4Y+pr7XhtHlsWyYRKeg8gvawTII7T6qTAJqfZj29
         ChaAs1jY15e2i8kxoz7G2+Q1BbtwoyUbrcychYcz6ZASFXW+VwIYhnakfO7bwPFZTGoP
         pZ2RaKGxOHKWOvCHzysmHS26EWPflidQB4hByJXrkZRnUIW536Tic9/f1avdkfm7zmSQ
         pFo7WtQt+RUKyYIdISxdQasy0W0KMmG93SlkLa2Fxo5nOSd8zopqjYsp9saQcOHoIZ3g
         aQ+vhOli5T7w8TJK1ODnXMu5yhqD1X9oNrTBT5XnaLCV9SczfSRy99A2UtOvCWLRrzNm
         p41w==
X-Forwarded-Encrypted: i=1; AHgh+RqJTuqIAA5GySfiHvF1sEzF6BNp54nnbTyZ+EZRr6Ai69gsj/NS79PDwZLeUMoTumJ51c2kh95ity8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt1WsueIaQbJdqCeaO/TIAhnYpWvcgJLg9NXAzV4XiVJTIYsW4
	/Iip0tlF+As8mVUP9tNS63DzHIML5KH8g4dYJaK220tFJNpvEaJ9uNBIL0fq/lIWejRlKtshZIX
	qmSKXnicW9ttyVLaaH4cd2LU9j2UX1M0SUS+MlQvYC2tfKZrIOwZ0Et1gcVTYazA=
X-Gm-Gg: AR+sD11UmWMlv1eIqNEjTQQub2P0SlaNCaY7YbsakqVd2XZgEGvaWJ5i9gvpxL3AIH0
	y05mPucAzw7SW30Hp7D8A6Qf79M2j4vlUTD6Fmk2SQxFZgOFLVXJWgQn5QNf7JnXWRV/i/3HPoJ
	PVlFw+9dVSrarII7OmhPd/m3JrtpyzPXBlGe7rbwUOJ+OTBWrHm1Rbq7CiPiVX8DNA+RTglPqZj
	PDBu5NG/vkyD6RavLAIbtvzuc4Hro9Sc0ivEVDWvnj0HNLujGjJzE510CKOcaru9TrNoLEB7psH
	Lc6gaZI7qKxj0iCX5BgQkhrj512mLggIPSvmz08NRKeNqW3obTzSdRSI0D2ERdn1crhJP8IdUwv
	Dnl1I5d7vfgCcPGXgS18Wp6kKPdue
X-Received: by 2002:a05:622a:5c17:b0:51b:7af7:77de with SMTP id d75a77b69052e-5283dda3ebfmr39083171cf.14.1784826583029;
        Thu, 23 Jul 2026 10:09:43 -0700 (PDT)
X-Received: by 2002:a05:622a:5c17:b0:51b:7af7:77de with SMTP id d75a77b69052e-5283dda3ebfmr39082491cf.14.1784826582431;
        Thu, 23 Jul 2026 10:09:42 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:cd9c:212:1357:7832])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm18472999f8f.1.2026.07.23.10.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:09:41 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:09:09 +0200
Subject: [PATCH v24 03/14] dmaengine: qcom: bam_dma: convert tasklet to a
 BH workqueue
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-qcom-qce-cmd-descr-v24-3-4f87bb4d9938@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4421;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wCpLSEqzl6yoBDde9p+VABZfQUJK0dP0DnJmF5kRzKI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqYkrBvXqR9TZC1tbg8D3QSJWkpFx+AucHs4s7N
 H/zFMiPLRqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamJKwQAKCRAFnS7L/zaE
 w+cxD/9Vc4yJMbV+XbQUTP6CYYzcaJyhYB+RJkFnIEGSb3RFNPchjtx3OR4fq44eQ68G7WP2/CT
 Yo1PXNdApTIEiJ6wuRcSYmqUHzNGgUg+KiRbdfdkag89Wma1+/pvLtYJ3GMM2nURtrFR5h0MsE0
 p8BZLw93ejhP+gL8rSjEqjmdH1ayehxewGh9QKAneLyk6225eFvO+qu7Dmdj4FLWjxyXN7q7WCp
 nLNxnFhf/t+JH+yInWkzzxIAySxRB0g61mWbkFIxCmlU6HYnek8lOGfh7dIdQnAWaFWTny7QFKr
 yjSzS2Wh6dxxXN4IvXYo55kV+yUpMdERa5z0+zw2Jm7OfZFXrnISL5evJepkVxTEg18/9G8mN2f
 sCrGEXbkmkZo8wrhwtCVBCTRn2MIFDLG7EkqvHZpop2+OidVsTKv3KFxwAVztLJ6T3x7N+obVMc
 uY+bhBU685gyJGijKrwpDxrbao7AU5h3tqJ/T+qjQ3oHEOsW+qb7O5E+txRz9RTYwl1MgMdIRbd
 qF06NvEq9aKoPhge7B/gfmVK4CjoDYMb9w39TJOS+OGVKgHHIw6toyew0X+nGeSM17qoR7GPDrn
 cLlWTfWqwWtcx+h0mjG0WXm4FUVWPYy0UagXxeCaFTdyzXLAPwlxa5WCi6uPU91be5aD0sQy15p
 8BxnhIrzqhRUSaw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX04Bd9merk15U
 Ld/cuBuayU+kbxPshBIkvs8IJ07cKi7ufQm1p5YcefWSXg7XjQTXE6Q3KhY/W2F37stsTOZjL/B
 11+18OyY+h25z5kDwpew6yFUwWHGOzA=
X-Proofpoint-ORIG-GUID: aC7DsmU9faGUjLnTkcVgaeXXgXJ0rSrC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX2ksphsmFdjd0
 7e4dsO2SscP4nFxtH3M7h620hUFe3y+hibmk5K6yrdaYm1Vtxu+le2bXcy6kpqooAXk0EfLTAG6
 mjX5J9eJJkIq8Ja33WiNjxWPfVsTW/x+nC8yLSLOigBUt1ef2hnepWQRPK53I3XaRHUBLy2pvLE
 WShXbcViRPbmvxUJt2ig+q4tMgNn9hzyoZhM+RwAitz1q0Qmc//Z8TmqkVt/U/fcNvm/N6o90LJ
 kVKqc+IpzLnqpC2n8phUZB7urWkBGIMq7LaJ1kmgwcuyq4iszW4iZaDIbeUlQJ7MOktCoJyry5J
 2s1GnwvNCoMUjKYo3wjc1u2ISJ1Cu/t/z6NM06nl8p+077wOeNgf9jAO66vauRuuNQ+LpePgcIF
 Kx1gbWk89B+aHimcX+K8nscrpkR1WoElO6qDA+y5AyQ6URu+lOeE2pFu+ySdmbjcA8kcTc3a763
 66xH06X3sDtlhJWIBJw==
X-Authority-Analysis: v=2.4 cv=cPDQdFeN c=1 sm=1 tr=0 ts=6a624ad8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=u-biHsxzOdRIXVMzAPsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: aC7DsmU9faGUjLnTkcVgaeXXgXJ0rSrC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230167

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

