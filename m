Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620C43C65E3
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 15:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279076; cv=none; b=NnIB0UnHcuhMF2TkoxQEJtZOorFebnZXPFCPm17yD6c1Gt/jJMjZzVXm8GtAUGqooqbg9NwHh3LPrruhh0RcVuFDFcc6Gybr/va7PauGLOWLPx9PB28yt6eD4f0TkguKTLzhbuplqab6v0gBC9O84aaCbV9qmCCkjVKU6jidiuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279076; c=relaxed/simple;
	bh=H6RGZzI1m6Hy642I73fornlozWd6x9hkPKo2H6raYsE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KIIJwmKU2ujdIV8qJw/AK42zihBmur4UUrjgNXp/kXVTa/gCkpO7n/H7B/oC1KJA+Bvr1CZUeQhLSAM48p+IxBe2tYacx0zPIYaGy/dVtHbbTTDjfsDqbSv21reDOm2+Qblt0w8bGuRfO1L4OSlF9SmmeRNXvSGzwgxqSDAhHxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QDyDQzqj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L0nTkRnB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QDyDQzqj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L0nTkRnB"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFHp8K1423358
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 15:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=; b=QDyDQzqjr379G7GM
	ymLkzI1H3VBDMUsyC3gQOY3crRVlVznwIcPZ8WnlGbSZa8eUIsGvKb1T8NA0Nh24
	Km6W4r9ewrUWlrHzNPpWmGH+PTkeC/iXdI5Eux+2GDg5nZT8sfWTsoNPYhNeRLY/
	Sj81Rr8XAU1p6S6cgniVQj2Iri5HsyIr5de8cO4RffuinaqL/3tWOZayoZRMQXLI
	9CTwrP4KFJC9Y3tHMMovq28l18/6qhYGGgXds3/7XCmu9FTbqA5rSKMbGJGB3+rk
	CafH9fBHizr/0nE7zGWYg1WciImZ1q/RFbBBhgeI9rldGL/QeqO/0HoHEPcc21qD
	lFh3Dw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d36f08dkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 15:17:54 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ffba307845so32387642137.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 08:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774279074; x=1774883874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=;
        b=L0nTkRnB+D5z5pwypaCcUV3pa/SzYQODmOWw6Q0y5d/tCMOq4L4bUoyH+dopKgeB4s
         fiQp8XQnoVyTpIQyQUL2LC1tURriSjxI5l5G/3R3zWKMw2ne+rm4dOJy8cQqI9kroTHh
         giOHrrL1OaqmwhKlpmhdPS3Hott6T6noAU4c5aTFCeI8tfha8mj6qF4FFt2GJILWXdB8
         CDYlnMUeiAtiDUcNMqA9BxjCnXxR+sOeuqRvM0+VTj+JJu+PAbJoPh68jhcHlzSCTpKf
         i9QTqw1Gf53MhBv5PNdxvnF/sFnxDIa7MfLbd9qi7vXMdEV7/PdHMtllNpAiNZ2jVmZo
         MTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279074; x=1774883874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=;
        b=bN4DWU83QQzzyGUnpBO8+AJY0ebvPU2W6fOyagOAJiiePhIZ2ingaquKTnni1OnfBt
         cXEzZPTovs8Vkcw7hac4+bPn/4Onv6NZIXFgF4PGBQYoFyIoNFMZVN8IqVpyf4m2/c32
         hak1mx3FH7PS0+mLTRuYAPJ5Ioc21OTdzNFzgMKhAJ6Z4kzeXh7/QhTHyEUJmEmQiOLZ
         ykDwbJPd2EhgD4eKKSb3H/5Tzl8QSn24x5W1fMFFeSTExDfvftKgZXI3I6zre2pFI7ug
         xOnVrgvge+Qm572j+nBAa3eHAwf+bEUuplcSGKRv6GlOKjLkpZ5GZ/qDKY3hNbx/rtWh
         LLRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUk/Yg5lhDMlEHBJJwS55UyfGAkY0erVCle6WVXRkMkyKihbIFCWyLfa4Aj8ldPgvpkvE3NcAppvsw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN4vKjISRtM0J7Xg8akpGN3+bflk09H7uySg6unayUexFPPOKv
	CQOiqGx78XXBmkQOSbrutwLe382Im6MVmjmKf4tj50YhcnJCEZG9YiWT8coTHUuo2vdQctf/DOX
	+4vNSDXV54aYXPxbKTZw+S3cB+ZoHc2ZUfxnPhg4TnpyilmI2cBtqsaMLOSGzM8c=
X-Gm-Gg: ATEYQzx/ti/D5WukKfH3CC10XO/TaxT72ThJKRIe1SUge9G0WXIdW52hKd3AOqih6w/
	8b622ETO6NaAG1x87UlqCOG1q5MvtyO1khh+ry8JxO3EItxa3f8EUKqa5WqQHBkRxUV/N4WRRxB
	U53U5yfzwl+qWcHSvBYlF69IXEfCsElQkM4RxEHOPQI3fxStBicfIxH3SJ3aPPNZELRM/ZxL1eH
	0tui/FRyRm5owWGnIodE0M5/Ioy9wvJr9CXasX/UEstmj7+v8/idM4aggwE+NEQe3agcs7SA62a
	EFFtApgkRC0uyjgL0GneTQyygWQNdXQEp79j8iON9pzskxXlvQC21Rrq2suM1YdFqwjUztvXksw
	JwTC/4w1vNcMYrSdHQ0FxosU2lnVndkw0OnZBuZElbSOHs92ThdrR
X-Received: by 2002:a67:c981:0:b0:602:aeb1:730 with SMTP id ada2fe7eead31-602aeb11b3cmr4498101137.6.1774279073771;
        Mon, 23 Mar 2026 08:17:53 -0700 (PDT)
X-Received: by 2002:a67:c981:0:b0:602:aeb1:730 with SMTP id ada2fe7eead31-602aeb11b3cmr4497922137.6.1774279065481;
        Mon, 23 Mar 2026 08:17:45 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bd923sm35936993f8f.12.2026.03.23.08.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 08:17:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 16:17:14 +0100
Subject: [PATCH v14 08/12] crypto: qce - Simplify arguments of
 devm_qce_dma_request()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom-qce-cmd-descr-v14-8-f323af411274@oss.qualcomm.com>
References: <20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com>
In-Reply-To: <20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2620;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TfRVgyaOMZw2GJQ0rx6WhRl0huHGm4mvuAmz76BcVUM=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGnBWYKg/NabL7C8BSDtlapAWCowk5pqimHBbX5Atozm6VRYT
 IkCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJpwVmCAAoJEAWdLsv/NoTD9+0P/28q
 Urkx53lfgUCSaHR9lI4cWTVOyrHAGAJifojqI7AKWrxlLQslGC4kaOPwyr4orqL8cg4bLzasB0h
 SJ/DN4kPSZEFp1cAcW/WtIvmxfN/Vub+6S8sW3SvWEYEyuqIUTzFVFeYfGCaRkTx6kqOVKuJ6O6
 +dksUyx6PIC/dC2N0fzoY+7Cy+nJIFZ1FOSvhHxf5B25b5jSfrpIx2pfRLjnsWsdg2QRYVmvvyT
 M7EmD1xo5zPcZ0Fjq6F5nwallCll/6T4p1jfaambYt8tKe5yEir15GKGHBT/qB7DtivD8LVzr/v
 vvRTZBKlzSSAQM6zr2ZNyYmzLIKnzSxXHFY/wdumK8gTt/7XSeC6IkWYHiqL/pBW2nA/KsuTygQ
 8rnCaCcAeu4rUnpDOwDobLrLOHIT2yjAtmzoGlscJ9YNLpX6Q6d6lxDJ9sBWIkqygsRkAbhWYQj
 PJSqOPOGWzNnXlRdh/zf5Nn2zcKJ6nzEwqvAyiyCuQsJm9PzWyWsPyVxyD1gux+r13PAdlgg87z
 Ec/y9Po3Tt0zYKizZSmTvusdza5+uszdwT+eqIxQgRb2zmIVkoHebLg+raAHjKeneq3oeyHuFql
 2819zdzaDC/o2FLKDO8fEB7QMvYl2nicHv+hsjV5gBwpOeToinbDEYxLs40l5XN98b22TINMKdu
 lGZes
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=b+q/I9Gx c=1 sm=1 tr=0 ts=69c159a2 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=KrkfD191a8oFwBap4LAA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: AqTtHuJkgQcfKJjc_ejUymPWMdj0_lvl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExOCBTYWx0ZWRfX3MPBuz0e7AUi
 rMG+yJ9A9MKPxRo7By4JBKYHpMa70LmDovhYCyuDjObU7ARy0E2wcdqzZbDxG+Cco3bCaa90iAA
 pOLTjib20gBXwpZOa7Zs9wV/xMzsfcakjPjxZ85E/70mUyr72Dl0DSaTkPJmUi7xZQxky0DUHH0
 +EXF7zaE63ZPP8NJ3LOdEEqdQNHKkfoU5xnUA0PdDXi7YSdXhStOPDQZsXW6lRbLd7Fa2oECsel
 3RJ/kQBnFcoE/JhUemn0H5L0gHoJL4EuUvw42A1LEqSLZ4TONf9cpQyiVPIkaIheEQ83qzBtnLJ
 zh5wwr6PTWBu/EfCcKxhk+PccV1A3C1HY9vQNlaiKsVzoh3osDpWgEtzNUv4uXsA9BSF7FgJbpx
 XIwiWIrVparZ+eOBnCgIA31x61OBa0R0BarUo0luErxwTbBRsceoirefn/QowroZ44KD3LHiuQU
 Wid5McNsr9fvmK5SjUQ==
X-Proofpoint-GUID: AqTtHuJkgQcfKJjc_ejUymPWMdj0_lvl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230118

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This function can extract all the information it needs from struct
qce_device alone so simplify its arguments. This is done in preparation
for adding support for register I/O over DMA which will require
accessing even more fields from struct qce_device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 2 +-
 drivers/crypto/qce/dma.c  | 5 ++++-
 drivers/crypto/qce/dma.h  | 4 +++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 65205100c3df961ffaa4b7bc9e217e8d3e08ed57..8b7bcd0c420c45caf8b29e5455e0f384fd5c5616 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -226,7 +226,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_qce_dma_request(qce->dev, &qce->dma);
+	ret = devm_qce_dma_request(qce);
 	if (ret)
 		return ret;
 
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 08bf3e8ec12433c1a8ee17003f3487e41b7329e4..c29b0abe9445381a019e0447d30acfd7319d5c1f 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -7,6 +7,7 @@
 #include <linux/dmaengine.h>
 #include <crypto/scatterwalk.h>
 
+#include "core.h"
 #include "dma.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
@@ -20,8 +21,10 @@ static void qce_dma_release(void *data)
 	kfree(dma->result_buf);
 }
 
-int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
+int devm_qce_dma_request(struct qce_device *qce)
 {
+	struct qce_dma_data *dma = &qce->dma;
+	struct device *dev = qce->dev;
 	int ret;
 
 	dma->txchan = dma_request_chan(dev, "tx");
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index fc337c435cd14917bdfb99febcf9119275afdeba..483789d9fa98e79d1283de8297bf2fc2a773f3a7 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -8,6 +8,8 @@
 
 #include <linux/dmaengine.h>
 
+struct qce_device;
+
 /* maximum data transfer block size between BAM and CE */
 #define QCE_BAM_BURST_SIZE		64
 
@@ -32,7 +34,7 @@ struct qce_dma_data {
 	struct qce_result_dump *result_buf;
 };
 
-int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);
+int devm_qce_dma_request(struct qce_device *qce);
 int qce_dma_prep_sgs(struct qce_dma_data *dma, struct scatterlist *sg_in,
 		     int in_ents, struct scatterlist *sg_out, int out_ents,
 		     dma_async_tx_callback cb, void *cb_param);

-- 
2.47.3

