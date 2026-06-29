Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2C43FD152
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 10:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727304; cv=none; b=SsSIZF/YwUzGA6FG+AwVLYIKEIRHa6ZJwy2I1tg2/pL7r4VIaWlgIClcN0U2ghbhiBcpRoKLwzixj7OxZVsJHVcNihbUd/iX8lKXKrajVL5RAJfMwxr55E9FfRuegT1DpLcvol7zOkphPfBZbQz5shzxLeA+iw+8KE41gBijTDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727304; c=relaxed/simple;
	bh=iGMhQdgZHzPFXIWzlLjeXFA8PmsPJCQ6+aFhjAm8b+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y/NFFJL13o9VsTv4kDx8cTMBWZ1QNu4qcvATiUnDOQi6TbznHMckGfcY/2b6/Ll7ky//Rr9iBnY8UBQBWCfCdTbr44dyR6XsEnErMXrmWIE1dlGA+WXljtKhFM7v6t/GB6G7a/JG/GxFoLMvjZYnxaT4HnwLNs/s2b4sg2joILQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oUiVCH2V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G2S+PVq4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oUiVCH2V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G2S+PVq4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rNGU2089412
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 10:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3rdfNV8kdNyI49J/Zg3zzIifE1I7KdiUq5fr7IbYoVk=; b=oUiVCH2VignJ5x03
	aHNFjyWSEJZvbTo8b1c+DOb/1xoyho25CDrwmKecpLWjpjuN9/7DBwSqihjnRY2K
	l8I+O/ayzlNIwjMmD37wy7lmFS4UA61vz+BxmF4rStbMmF7F7tOn8dL9OdlZcDPs
	nv0Db4Z6F83Z5bVMfSL6nG59o0XDFkWVD2a+Ht5nOsNJVtZsSNmBhX2fd88hhbhe
	PeLSWlevwzfLDy+URnBIm7nt4Pc1El3w4fPNIgEplcmeSfKa+WBBBZoYoejzVN/g
	BsiANkWjNK1mwYbDSNHolsvohhUEEbdHperMGaYaol4AvPIccPSljJ3vPH6DuIy6
	senI5w==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3k7vh3ur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 10:01:41 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7383a52d9beso786495137.2
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 03:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727300; x=1783332100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3rdfNV8kdNyI49J/Zg3zzIifE1I7KdiUq5fr7IbYoVk=;
        b=G2S+PVq435c+mKDKtLEGvGu6EP4/oESu637NxUBykHKZfpGwBlVp/eeJ86rKDmL0LN
         fj7kFTb7kE+Qs54Akl3kU02o+zttgnRnnFwQseEeUroyJd01/sGqe7Ja/99HYGeO7yTW
         7dqY+Fc/B84x7vGR5SyvOdxicDyO/11OO2g4m/FIJwwgyuMtg1JjAZ4X4SEHMnPRhH88
         MnWMevZmZ92AV6XEWKYE9Be7WEU2Rhipx8gH42S9v3Glc3CChsO48zGJP3lWh9V3o/Dc
         T6apPo2xhp2vfBpdczWqepJJLLaDOwxdtQvOueVpR5BvgI19IiA3CGKc3QHjT8YzDBeR
         AVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727300; x=1783332100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3rdfNV8kdNyI49J/Zg3zzIifE1I7KdiUq5fr7IbYoVk=;
        b=fI6ZO3bWAFOuN/ESJT1qbHEmHA5zQylNrfCLSsj4JvzwJHdbXxmi76edjt2fMEZUM6
         RNT655rq4NBNtbhRYfoMI80/G28gEEEzU7fpG1D5y8mqulhvdAhAj/56xfQORCuu4q0Y
         63LJQVSjZ9I/ktBlolvpx6lBAgAFz25EyPHYI7JfgWtVJ891+2qfFYyD5IKChOFnoze3
         73UHGYlfp3Rm6cMPqvNhLhHxXdFGImS4TUuHSJ636tOOdUTfdAgl1HjiYp1bvuGwdtA9
         +Ewj3I7EDRlCAeWASBWY6+p1sjwYjFCLZo8r0FBpsBUQdM5I+QiG3wbE7XNiPxyqzHNy
         vayA==
X-Forwarded-Encrypted: i=1; AHgh+Rqc9BRcXNIvg0kJHcSaHhkHN/xwKk1jwUSE/QTcdkV0xJBZpUC3uYr63R3wk4p3p7wakUwxEvG2Ihk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJgIYYsAVGF8C+vfUoz7d1bMbuzA+at8MYPqLBcHVDmcmdm5Xp
	waP5bIZ6dgLZUCj37UdfS4vgSspBoC523vHeolBi20qOkS/B1lfdo/OJ1i9V2oKaCT0Vh4rLumj
	fmpp9le9fVSBPKQzZln5/cf1Sdd2rWPfejwYFYmOuFmiFHGc1zwkgUpvZygClUls=
X-Gm-Gg: AfdE7ckWvhWJfNiAxbKpsAgmwCC5zCaOaPC65u/HNaPe5xIAUWjCLFO5jCXIgIIrxD5
	6sORM9X9hQV7d1IwbkZqF+HNrTl8Ni0qYg2NVkIQwyNHyjTDk+sHLOqg6oc0+c2UDfnUvWgUrDr
	buLbzmmqA6fbdxi1AkW96QAVISp9hvn6gXaWoXnMDH2jywjMg35cZeg/N7ShY6XcXrCzHM/Ciib
	GW4VBOxfDkeHZ//McuO0bYHlLcFmxSb4OjobXy56q9V8xLppcYXaAgzCEIMKlawA++zj9k1mT/l
	B+CbgzGsWoc/UN7LswuRMevzXk/gE0bGChgfs4QzCzM5ggwPiPktbRJc0Fm0R7oB6AKN/xIth67
	s+dIg7yYZaspm0lEzfZ16PVOx0uf97EdnK4h/zI3M
X-Received: by 2002:a05:6102:50a0:b0:738:472f:2caa with SMTP id ada2fe7eead31-738472f54d2mr1923960137.9.1782727300226;
        Mon, 29 Jun 2026 03:01:40 -0700 (PDT)
X-Received: by 2002:a05:6102:50a0:b0:738:472f:2caa with SMTP id ada2fe7eead31-738472f54d2mr1923878137.9.1782727299604;
        Mon, 29 Jun 2026 03:01:39 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm24729405f8f.0.2026.06.29.03.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:38 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:01:08 +0200
Subject: [PATCH v20 06/14] dmaengine: qcom: bam_dma: add support for BAM
 locking
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-qce-cmd-descr-v20-6-56f67da84c05@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12080;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=iGMhQdgZHzPFXIWzlLjeXFA8PmsPJCQ6+aFhjAm8b+I=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQkJtvNFRcHmBKk3FL4gE0gnzgc7VaMva0IUr4
 gcQIKpKKuaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJCbQAKCRAFnS7L/zaE
 w6c3D/0RrCr0TvE/i0o8u1ik8gQZ5QjPuSPpmJZKyAz7k9thleDVZWnHFWPKwxzGgQPD7q0rhQ4
 f6xOJsyPypR+MqCk1iv6pcEEGbB/I76r0dUplCN6iY9ft+n2qVxlAoDw/yFUQwTZd0TU4JVD0Qa
 V7djBp6lbjWysq8RMA0RYi/ptBv/9obJTrS7dxgRC5CWcU6Bg9pJyBbmFJSgnnAJ4NqNB0PbOfG
 +Zi77q91A28OZ8oN8LUrSMNS/b4evl+BiiokmNDjOvQQLSNO2HrqNwp4q3cohxZqUk23uDADYmM
 /LTwtwv3fSZtJGnL1Rd+r994o35/pb3okmzfpmX4ZypR4EfCEsZLnTlDT7WVEZCUVKICkGUmrW1
 FzKynVXUOJva+zfbfqZ2IfEPn0XhaChLWOCEtdl+O3hKxRGyVx3dd2enWSjs1bUCG5LNTa+Cl38
 FjqMlNQIPQBywMdBcBew9UQxywNpGYjCClCpGFgdVozJqiNMSHKYV9DaKE3pEpgeYjCHP8J6/vL
 g3txXPks09ke+6mNTIpAtOcOrlKrgKmcFOqYT55jG/ykw/nkOzXHDrKMkTAbFQKw8yf+Qb8ZhQP
 iUKQSSzNWsWRbKpiB32NH0HtqKE5eqx1G0AMfy813BCFEuSCv36t4pr19Oy59zSNq6VyZpcTnJ2
 REKE1hjUIULsJag==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 6Sjrg-vDZllnU1H1oBgcmIRwydY0PRkU
X-Authority-Analysis: v=2.4 cv=CqCPtH4D c=1 sm=1 tr=0 ts=6a424285 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-0mtKZB-VTZit_Rp23UA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfXxICb6PPbW42u
 OHLIqaPl7aAfIEs5HcixZwP99or1xc+TH9HZWcA4huixw6351yHIy0jpyvOIvJzurI2YxqWHnJv
 w+apx29xexR+9vD0JtKs6vUL7wDndpY=
X-Proofpoint-ORIG-GUID: 6Sjrg-vDZllnU1H1oBgcmIRwydY0PRkU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX9nwvQV0IpZuS
 NTGm4p4Tk+uzJoFO7mdhYKftqBDFvKzMyYBg9WtytVV2cIpSnDOQkcpqtLv/ufSh4H8F1bFuVAa
 kk7M/kpMdYL8kH2kPK2N+XeoGAqTmAajKh5lsxHFAHRxl8qDNnEof5CEUx9U8APiYNxzcb2c1EK
 ylQuM4LmMNjUZTbnWd9jnBBcYmcrlEJZ3IjPhmdBBmEHSPROcz+YiSO1M+pI9ZfFuXOvA1kY7Bw
 4hfDtVz6lLpd+WY81xO7TpDECS7sB+hmJ3EXCE/XRSeIRoHVtERYpoB9E69sAcetagzi9Z7Pn17
 eJJ8O81ozJ/q3YfkegOlJNpb887fPyDfd9yyGgsjDjw5xhMINtdzpL99iV1TckpY0aR9ihSh+F/
 YsNocpEwrGrqZaqf7TZJK0Y+dXzvTfpU1dv6es520q/SIOzdaK/ZQiLzRFDpaYXt8Ug1N8FDHYC
 BndAQGlP7yvJyQD0WoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290080

Add support for BAM pipe locking. To that end: when starting DMA on an RX
channel - prepend the existing queue of issued descriptors with an
additional "dummy" command descriptor with the LOCK bit set. Once the
transaction is done (no more issued descriptors), issue one more dummy
descriptor with the UNLOCK bit.

We *must* wait until the transaction is signalled as done because we
must not perform any writes into config registers while the engine is
busy.

The dummy writes must be issued into a scratchpad register of the client
so provide a mechanism to communicate the right address via descriptor
metadata.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c       | 189 +++++++++++++++++++++++++++++++++++++--
 include/linux/dma/qcom_bam_dma.h |  14 +++
 2 files changed, 196 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index f3e713a5259c2c7c24cfdcec094814eb1202971a..f4f258994264a234f60debd3e66e31a6b35d1dc5 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -28,11 +28,13 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
+#include <linux/dma/qcom_bam_dma.h>
 #include <linux/dmaengine.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_dma.h>
@@ -60,6 +62,8 @@ struct bam_desc_hw {
 #define DESC_FLAG_EOB BIT(13)
 #define DESC_FLAG_NWD BIT(12)
 #define DESC_FLAG_CMD BIT(11)
+#define DESC_FLAG_LOCK BIT(10)
+#define DESC_FLAG_UNLOCK BIT(9)
 
 struct bam_async_desc {
 	struct virt_dma_desc vd;
@@ -72,6 +76,10 @@ struct bam_async_desc {
 
 	struct bam_desc_hw *curr_desc;
 
+	/* BAM locking infrastructure */
+	struct scatterlist lock_sg;
+	struct bam_cmd_element lock_ce;
+
 	/* list node for the desc in the bam_chan list of descriptors */
 	struct list_head desc_node;
 	enum dma_transfer_direction dir;
@@ -425,6 +433,11 @@ struct bam_chan {
 	struct list_head desc_list;
 
 	struct list_head node;
+
+	/* BAM locking infrastructure */
+	phys_addr_t scratchpad_addr;
+	enum dma_transfer_direction direction;
+	bool bam_locked;
 };
 
 static inline struct bam_chan *to_bam_chan(struct dma_chan *common)
@@ -638,8 +651,10 @@ static void bam_free_chan(struct dma_chan *chan)
 		goto err;
 	}
 
-	scoped_guard(spinlock_irqsave, &bchan->vc.lock)
+	scoped_guard(spinlock_irqsave, &bchan->vc.lock) {
 		bam_reset_channel(bchan);
+		bchan->bam_locked = false;
+	}
 
 	dma_free_wc(bdev->dev, BAM_DESC_FIFO_SIZE, bchan->fifo_virt,
 		    bchan->fifo_phys);
@@ -686,6 +701,35 @@ static int bam_slave_config(struct dma_chan *chan,
 	return 0;
 }
 
+static int bam_metadata_attach(struct dma_async_tx_descriptor *desc, void *data, size_t len)
+{
+	struct bam_chan *bchan = to_bam_chan(desc->chan);
+	const struct bam_device_data *bdata = bchan->bdev->dev_data;
+	struct bam_desc_metadata *metadata = data;
+
+	if (!data)
+		return -EINVAL;
+
+	if (!bdata->pipe_lock_supported)
+		/*
+		 * The client wants to use locking but this BAM version doesn't
+		 * support it. Don't return an error here as this will stop the
+		 * client from using DMA at all for no reason.
+		 */
+		return 0;
+
+	guard(spinlock_irqsave)(&bchan->vc.lock);
+
+	bchan->scratchpad_addr = metadata->scratchpad_addr;
+	bchan->direction = metadata->direction;
+
+	return 0;
+}
+
+static const struct dma_descriptor_metadata_ops bam_metadata_ops = {
+	.attach = bam_metadata_attach,
+};
+
 /**
  * bam_prep_slave_sg - Prep slave sg transaction
  *
@@ -702,6 +746,7 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
 	void *context)
 {
 	struct bam_chan *bchan = to_bam_chan(chan);
+	struct dma_async_tx_descriptor *tx_desc;
 	struct bam_device *bdev = bchan->bdev;
 	struct bam_async_desc *async_desc;
 	struct scatterlist *sg;
@@ -757,7 +802,10 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
 		} while (remainder > 0);
 	}
 
-	return vchan_tx_prep(&bchan->vc, &async_desc->vd, flags);
+	tx_desc = vchan_tx_prep(&bchan->vc, &async_desc->vd, flags);
+	tx_desc->metadata_ops = &bam_metadata_ops;
+
+	return tx_desc;
 }
 
 /**
@@ -802,6 +850,7 @@ static int bam_dma_terminate_all(struct dma_chan *chan)
 		}
 
 		vchan_get_all_descriptors(&bchan->vc, &head);
+		bchan->bam_locked = false;
 	}
 
 	vchan_dma_desc_free_list(&bchan->vc, &head);
@@ -859,6 +908,15 @@ static int bam_resume(struct dma_chan *chan)
 	return 0;
 }
 
+static void bam_dma_free_lock_desc(struct virt_dma_desc *vd)
+{
+	struct bam_async_desc *async_desc = container_of(vd, struct bam_async_desc, vd);
+	struct dma_chan *chan = vd->tx.chan;
+
+	dma_unmap_sg(chan->slave, &async_desc->lock_sg, 1, DMA_TO_DEVICE);
+	kfree(async_desc);
+}
+
 /**
  * process_channel_irqs - processes the channel interrupts
  * @bdev: bam controller
@@ -919,13 +977,23 @@ static u32 process_channel_irqs(struct bam_device *bdev)
 			 * push back to front of desc_issued so that
 			 * it gets restarted by the work queue.
 			 */
+
+			list_del(&async_desc->desc_node);
 			if (!async_desc->num_desc) {
-				vchan_cookie_complete(&async_desc->vd);
+				struct bam_desc_hw *hdesc = async_desc->desc;
+				u16 flags = le16_to_cpu(hdesc->flags);
+
+				if (flags & (DESC_FLAG_LOCK | DESC_FLAG_UNLOCK)) {
+					if (flags & DESC_FLAG_UNLOCK)
+						bchan->bam_locked = false;
+					bam_dma_free_lock_desc(&async_desc->vd);
+				} else {
+					vchan_cookie_complete(&async_desc->vd);
+				}
 			} else {
 				list_add(&async_desc->vd.node,
 					 &bchan->vc.desc_issued);
 			}
-			list_del(&async_desc->desc_node);
 		}
 	}
 
@@ -1046,13 +1114,101 @@ static void bam_apply_new_config(struct bam_chan *bchan,
 	bchan->reconfigure = 0;
 }
 
+static struct bam_async_desc *
+bam_make_lock_desc(struct bam_chan *bchan, unsigned long flag)
+{
+	struct dma_chan *chan = &bchan->vc.chan;
+	struct bam_async_desc *async_desc;
+	struct bam_desc_hw *desc;
+	struct virt_dma_desc *vd;
+	struct virt_dma_chan *vc;
+	unsigned int mapped;
+
+	async_desc = kzalloc_flex(*async_desc, desc, 1, GFP_NOWAIT);
+	if (!async_desc) {
+		dev_err(bchan->bdev->dev, "failed to allocate the BAM lock descriptor\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	sg_init_table(&async_desc->lock_sg, 1);
+
+	async_desc->num_desc = 1;
+	async_desc->curr_desc = async_desc->desc;
+	async_desc->dir = DMA_MEM_TO_DEV;
+
+	desc = async_desc->desc;
+
+	bam_prep_ce_le32(&async_desc->lock_ce, bchan->scratchpad_addr, BAM_WRITE_COMMAND, 0);
+	sg_set_buf(&async_desc->lock_sg, &async_desc->lock_ce, sizeof(async_desc->lock_ce));
+
+	mapped = dma_map_sg(chan->slave, &async_desc->lock_sg, 1, DMA_TO_DEVICE);
+	if (!mapped) {
+		kfree(async_desc);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	desc->flags |= cpu_to_le16(DESC_FLAG_CMD | flag);
+	desc->addr = sg_dma_address(&async_desc->lock_sg);
+	desc->size = cpu_to_le16(sizeof(struct bam_cmd_element));
+
+	vc = &bchan->vc;
+	vd = &async_desc->vd;
+
+	dma_async_tx_descriptor_init(&vd->tx, &vc->chan);
+	vd->tx.flags = DMA_PREP_CMD;
+	vd->tx_result.result = DMA_TRANS_NOERROR;
+	vd->tx_result.residue = 0;
+
+	return async_desc;
+}
+
+static int bam_setup_pipe_lock(struct bam_chan *bchan)
+{
+	const struct bam_device_data *bdata = bchan->bdev->dev_data;
+	struct bam_async_desc *lock_desc, *unlock_desc;
+
+	lockdep_assert_held(&bchan->vc.lock);
+
+	if (!bdata->pipe_lock_supported || !bchan->scratchpad_addr ||
+	    bchan->direction != DMA_MEM_TO_DEV)
+		return 0;
+
+	/*
+	 * Allocate both the LOCK and the UNLOCK descriptors up-front so the
+	 * operation is all-or-nothing: if either allocation fails we free both
+	 * and run the sequence unlocked rather than leave the pipe locked with
+	 * no matching UNLOCK.
+	 *
+	 * Both are queued in-band around the currently issued work: the LOCK is
+	 * prepended so it enters the FIFO first, the UNLOCK is appended so it is
+	 * the last descriptor of the sequence. They are loaded together with the
+	 * payload in a single operation so the engine executes LOCK, the work
+	 * and UNLOCK as one ordered batch.
+	 */
+	lock_desc = bam_make_lock_desc(bchan, DESC_FLAG_LOCK);
+	if (IS_ERR(lock_desc))
+		return PTR_ERR(lock_desc);
+
+	unlock_desc = bam_make_lock_desc(bchan, DESC_FLAG_UNLOCK);
+	if (IS_ERR(unlock_desc)) {
+		bam_dma_free_lock_desc(&lock_desc->vd);
+		return PTR_ERR(unlock_desc);
+	}
+
+	list_add(&lock_desc->vd.node, &bchan->vc.desc_issued);
+	list_add_tail(&unlock_desc->vd.node, &bchan->vc.desc_issued);
+	bchan->bam_locked = true;
+
+	return 0;
+}
+
 /**
  * bam_start_dma - start next transaction
  * @bchan: bam dma channel
  */
 static void bam_start_dma(struct bam_chan *bchan)
 {
-	struct virt_dma_desc *vd = vchan_next_desc(&bchan->vc);
+	struct virt_dma_desc *vd;
 	struct bam_device *bdev = bchan->bdev;
 	struct bam_async_desc *async_desc = NULL;
 	struct bam_desc_hw *desc;
@@ -1064,9 +1220,23 @@ static void bam_start_dma(struct bam_chan *bchan)
 
 	lockdep_assert_held(&bchan->vc.lock);
 
+	vd = vchan_next_desc(&bchan->vc);
 	if (!vd)
 		return;
 
+	/*
+	 * Wrap the issued work with a LOCK/UNLOCK pair exactly once, at the
+	 * start of a fresh sequence and only when there is real work to lock
+	 * around. On a re-entry after a full FIFO, we see the BAM is locked
+	 * and must not add another pair we simply continue loading the
+	 * remainder of the same locked sequence.
+	 */
+	if (!bchan->bam_locked) {
+		ret = bam_setup_pipe_lock(bchan);
+		if (ret == 0 && bchan->bam_locked)
+			vd = vchan_next_desc(&bchan->vc);
+	}
+
 	ret = pm_runtime_get_sync(bdev->dev);
 	if (ret < 0)
 		return;
@@ -1191,8 +1361,12 @@ static void bam_issue_pending(struct dma_chan *chan)
  */
 static void bam_dma_free_desc(struct virt_dma_desc *vd)
 {
-	struct bam_async_desc *async_desc = container_of(vd,
-			struct bam_async_desc, vd);
+	struct bam_async_desc *async_desc = container_of(vd, struct bam_async_desc, vd);
+	struct bam_desc_hw *desc = async_desc->desc;
+	struct dma_chan *chan = vd->tx.chan;
+
+	if (le16_to_cpu(desc->flags) & (DESC_FLAG_LOCK | DESC_FLAG_UNLOCK))
+		dma_unmap_sg(chan->slave, &async_desc->lock_sg, 1, DMA_TO_DEVICE);
 
 	kfree(async_desc);
 }
@@ -1384,6 +1558,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	bdev->common.device_terminate_all = bam_dma_terminate_all;
 	bdev->common.device_issue_pending = bam_issue_pending;
 	bdev->common.device_tx_status = bam_tx_status;
+	bdev->common.desc_metadata_modes = DESC_METADATA_CLIENT;
 	bdev->common.dev = bdev->dev;
 
 	ret = dma_async_device_register(&bdev->common);
diff --git a/include/linux/dma/qcom_bam_dma.h b/include/linux/dma/qcom_bam_dma.h
index 68fc0e643b1b97fe4520d5878daa322b81f4f559..a2594264b0f58c4b2b1c85e243cad0d5669c26dc 100644
--- a/include/linux/dma/qcom_bam_dma.h
+++ b/include/linux/dma/qcom_bam_dma.h
@@ -6,6 +6,8 @@
 #ifndef _QCOM_BAM_DMA_H
 #define _QCOM_BAM_DMA_H
 
+#include <linux/dmaengine.h>
+
 #include <asm/byteorder.h>
 
 /*
@@ -34,6 +36,18 @@ enum bam_command_type {
 	BAM_READ_COMMAND,
 };
 
+/**
+ * struct bam_desc_metadata - DMA descriptor metadata specific to the BAM driver.
+ *
+ * @scratchpad_addr: Physical address to use for dummy write operations when
+ *                   queuing command descriptors with LOCK/UNLOCK bits set.
+ * @direction: Transfer direction of this channel.
+ */
+struct bam_desc_metadata {
+	phys_addr_t scratchpad_addr;
+	enum dma_transfer_direction direction;
+};
+
 /*
  * prep_bam_ce_le32 - Wrapper function to prepare a single BAM command
  * element with the data already in le32 format.

-- 
2.47.3

