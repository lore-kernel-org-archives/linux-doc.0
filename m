Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9427836C0CA
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 13:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640828; cv=none; b=c5N0gufIPZFiQT4I3d277tyd+mDeocLKhalUruBE80IX1ZoyUvLJxJ12iM04bkVWRvPx/Ogr+ub4A0u0FV5JiTATCXtTOuvdAKFt1fSIpoC+AgFiUX7TW8hliJW1GCw9MvjaLbjxLctep46WZzhu+qIT0j0S/QUbjvIGhGPWSzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640828; c=relaxed/simple;
	bh=wCpLSEqzl6yoBDde9p+VABZfQUJK0dP0DnJmF5kRzKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gx7vPBIh4l/FvX+PJwnFOKpoqjCA2aBz0hy/e96qlBmXYjeISSTM66qyV1YCMT+qBaPDo3/MwS60nh3keyCPYpJutkdRqH5+xyfCnOm9X9D7M3euFL+er/7GAUyvUzFfYUpKewOAOsL9mp9fuKAPRoymczGzZdYyC57OK2uoNSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jQJNAIvH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qcob/aWJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jQJNAIvH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qcob/aWJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDMI291793878
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 13:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=; b=jQJNAIvHvUB7R3vB
	AGOxMJAYulIc3vYqLX1z1j3Wa+nXzFGTJMtEDIybTzvOKPwH5l7zvpz8xMTEf+SI
	sWUN9OdF4Gr3e1ptzT/WjDyAVsAZ6wPChXwLaXD3jriYJ0Ab2ELdtseZh/L6GIQm
	CFEhNpTITPFEfeDAwy+h6hBLwhnI+6dgBwrDYYHv3x+s80b8g1khJ6pH3pmdj9AF
	f09Y38joVqkHXlk+QiEsaEsne8mqWosoXZ8dbAHSyAk1k6uI83YPGUE2Vpz+d8f9
	2fHhRdFzcI6AMZCqz6JCpeOEVOpjov82Uvpf9e/8btT0hdm11hokvGCUk3hwzkIU
	NeQ+iQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1se2ejy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 13:33:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bf321d786so100881171cf.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 06:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640825; x=1785245625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=;
        b=Qcob/aWJnqmKGvSYlEQKH/2LeUH5GAYGvHrh6EdZuSVhIGoEmidb3FF5YtajukJINB
         703IdfIFyS26axOSZNo1V2Q0/EqdN57EdZA8unk/9Xsq/OdUNM6fwxgLx7O/y3xZonv7
         QUi3mFZE0p3+QMxOgdK5nK6R8LywHTWRypsVQ3K2bmap+ScMWrdFc7FUSL5Bzgu3vdC1
         ptFqe6KKVJxBtGsaiJh8lIiBbzmiqNviUEFDQATLnjpezuJJXS8rAL2EAW2iKCWpQnQu
         f1NVg+nWxeay0rSfmMcb5VvCmoYgJWNlsfVxgLiEVjeqKGNszaFEQJCJp/Pm2wBfgrbX
         2BLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640825; x=1785245625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=;
        b=kVcl8UvyjXmeLBvRCbTmKFB1d4MrFrZ3GMtRXAu4E3JnSsjHQs6wGLRCMc7Rs8ZN4I
         U2oevEqRsXvmcsUvFMyESL7k81HgON9GHDhKn9W6mHgyUhgrekA5nxnV6n6O5GcXdI5Q
         AESaFqwjLNoaBqM9rxlCSFahsQnHxo6e3nAGhs+v5WDag+PICPqPfCKt41AnbINk0CF1
         EpHlmKG71U2kxcrYuw84G97nlaMpaK3VD1FpINAgeTD1bNXt6KwtTV6//FozFg+KiLbn
         70weBmKaLvF4+Hy0gvB4HIZ8Fs55aYG4A7957U6Q6mbdA3u5qp0j18YXKbP8dycEnUPc
         /Hvg==
X-Forwarded-Encrypted: i=1; AHgh+Rri2I6o6/g7fFhswW9lsGISeZmUGsZi/uiv2NtE7k7Pj/M++ZHK8K7RoCH/4qj8tvcI0bqOA6S1QAc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOscMIUDRuafD4A7HFNCylEnHmIGsiYfPO60Arqaci5h+u6gDS
	5nSh/oFTHTyINiC+wywEnxPF4DlOzw83G0eiOBl2IQYmHisaCuBI50f7bhl6k7CvEClD5l5BiVK
	5Ob9NnGBIx3OVaCYej6nfRzkKUodJVVzrhWnTGVwwpEW3VLpFrS5hH/WOJ4Yp3+M=
X-Gm-Gg: AfdE7ckmxcpBgxBaXOwzEDFQfVu81z17dlLLqkAfcoeipWv/KikK4B7sNUQGNJDhfB2
	V2GcXAiwVyMiUL35jsUUVpkU7Yz0RCEyBscdfb4rz8MLG39WX78kJzU/DG5aslCmTa1ikQrrQ3y
	zYaHWrPlpcs3Wivd92XdLljIFhrwGNk46TNqbAAueb6ivpjtox0Lab3FVpibPDFcmlYPQNlHEnH
	sP0njmxLNstykYwfFL4Q6+zH448+NHkqjKY/MdDugEfHT+ZT5Nqkg/OjgG6p5Cm95U69b/plCZy
	OcIOBujqZZW3TN7fMcObIVxJMCsti1SNZ5LrDMwP+4CPtndvtdUyk16tkxxZjvgyxjdtHG9U0ma
	fB5+XBy2iPJXmaBbIxDjSI33FWL/hOQ==
X-Received: by 2002:a05:622a:4008:b0:517:6d82:9aec with SMTP id d75a77b69052e-52138ec2c01mr163913581cf.0.1784640824617;
        Tue, 21 Jul 2026 06:33:44 -0700 (PDT)
X-Received: by 2002:a05:622a:4008:b0:517:6d82:9aec with SMTP id d75a77b69052e-52138ec2c01mr163912961cf.0.1784640823889;
        Tue, 21 Jul 2026 06:33:43 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9dcf:9ab8:bffb:ec35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm237901185e9.2.2026.07.21.06.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:33:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:33:08 +0200
Subject: [PATCH v23 03/14] dmaengine: qcom: bam_dma: convert tasklet to a
 BH workqueue
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-qce-cmd-descr-v23-3-1be02deffda9@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4421;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wCpLSEqzl6yoBDde9p+VABZfQUJK0dP0DnJmF5kRzKI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqX3UfbWQcFOVE5hNy5ORpDyLVvvPVlbwquV0eO
 UIZtQ4iqweJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal91HwAKCRAFnS7L/zaE
 w9VzEACVgd2ByyZhxiiqIrqQ5VRlo7dmVYDYtB+etZcBxcZUXxwbXQkJsT5wyOvMgREkMdqEmJv
 a6zK9M1ajOkxL2P0RjHMmlxUKrJMIXEkPLasXDg7cKAtVkhtDLq+XaH9nEGMtZhU0slVi0J9v/u
 aXLizLyRua8zHDF2qRY/l7DrBa4vjampFpyvAORJyLn/I/44U9ebJwvIt7cIywP/H3bRNmVFrFP
 37PjSkfSxhBj9UyZ3ET7LozvKFCN8sGILU53dptezMXZHIsdSEjCTu0IrUShmz/mPEQcqA+rQSf
 JFoOYkQnhF2hT0riPA0jnFMKX/AlYVveILEWx/0syGzaAQHtPZvGucBvwaJrIuwcaof/xK5qc84
 qeBwJXLnoMuFmFIKmp53gYRYf9e9zvJ4PkoF5CzjUWtwi/AwBGhbdD83zv9mKVI4JBLU+ZLCGZn
 XU/YV1LO6Ojy/GQLvLVBTCCugiMDZsUzcU7IL+miT+j8Vzr3JslwIcZVTxtDbxbRcxIheDxRl6l
 U6J5HgUUSTygLFOkmXZ8Ma5PuV3hUVyWnIR0zo/g2lriNjsVAm1GmYr+otWQTA2s7pZmrCkQa83
 z5GPpoFEv/4OLkJbAige40aX80ytzB1XyGIDPQNPGetlVq6W74B/4I0FFE1HszG+usPq8KEYpJH
 35qR+l4u0wG7Y8w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: gwXyDK1Up6OrD1AqcvMckJbdTZe7BywW
X-Authority-Analysis: v=2.4 cv=TIZ1jVla c=1 sm=1 tr=0 ts=6a5f7539 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=u-biHsxzOdRIXVMzAPsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfXx4mTkl7kGT8g
 N2b+6a5WDQDFhmUksT1KJ09151sKtfjdpXuzxpV/g1BkJoKh1IXKnO9bkTItgMFIVm9aF5KRXfa
 so4nW0yF+b6rQPiMGt4Ux1WzKyxtjHU=
X-Proofpoint-GUID: gwXyDK1Up6OrD1AqcvMckJbdTZe7BywW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfXxR1Lo+muJegz
 oWC8tgZ3taUw7LHKXvN6otpHDIz+9lFwjXXusJqS0aoJfcwdBvEQ3YrgwCPlauSUZ8wveGAWFqQ
 UoYQJAvrg3Q1xdyVw8A+02m/wFQ1rxpDsMjXO9idZjlplVv40W8AiITjJ/9pDub0bqv6Op2n7V+
 wzgfHm5Qq89GaVs88kK3GddHSie1Xl0oyQlqt26H5/7lvT6gIvy1lNa6g7tYz/ebEF7njaT56Nz
 l86QesS36pX1DEucBTDCzERSafj0M7G2StaUR5DuklzZesw86r5OjH1OuMuDoRNfI/OyYyaMn4z
 9nJkgryVg5X0mCQ1sBdoGFirltbtz3YfBKRspyI3LTT/N0G4zSPGE9PqFpwzrVr+IflYncSPRDY
 nZlAWcKuWl+xhrFMvsh4U82MAbA29QUHNdy+28T+DBs4vlyQEEjvQQW8SWU0a3WnciMcpGAl5cg
 U+T2ZNAWCslOCT46IKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210144

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

