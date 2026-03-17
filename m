Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C3F3E1CE7
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 14:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773756176; cv=none; b=ksNKZ8eDDJ7obK5xPYp5ZmHAyAPFiu0maCGY1hgXXe437+HlijDHfYJdCXu+FASj+HYudaK4X39gW38EkqYPVppJyUS1HIhRcOs5MNugFZ/J7SRLncUpwgLOwB7UmvQJjUjg5oSHS+l2MuvhNf3B5FhSG7TmoQThi3bi1Qjfh18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773756176; c=relaxed/simple;
	bh=D/DbbvsYNV6WfJJN+Y3qtsfzsdueJP3Q7cdgK44aCk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UeLSedkSVjTk6In2fp0HHLRjIiLxBFgxqHzarGY1W6Plbxc2hsHkXa+PPiqDmmOSUmanNmzmMNqIIMjbWIwhPfVlcjdW4ox3YIY9xc+CPP7QzYOx9bxS7PJk9UAKu4T78xtjjZTgfOfM9tviOj0gcmQ/kznlQE2IF81eDhOVpqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J37dUWlT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RPPu9zHP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J37dUWlT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RPPu9zHP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H8lcDC1534138
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 14:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=; b=J37dUWlTLsOBHZNw
	6VWyQj6ki0vlQA2P3S0na4xyWdhNPs9TDNzuJJSFoQjH5fBV/QAWAfxiy2E1HFnb
	nZCg51GLiYXD6kHA/6H7g91aXCBDusODHpczTtOz5LgVs2l9UrJo6CGFnAdTM/tG
	gLCPkDyjPQ1NErUhdpw5td/7TX3+ph3DBVdoeRI1tFvVovQFatQGBM92690KJQRW
	hUt4eq4SL8o5318WBT3o75smfaeZ1Obbh+NFSqm120ZJVwCEF4b2KnpV8apFn565
	u/bYwBcOlBCadZk+bmmdQzTuk0D4McN2Akv30CKisYxHRyrz58sa0B6RvvzoT2b6
	R4fjqw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxm5k4bm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 14:02:53 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ffbab490d3so50031689137.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 07:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773756173; x=1774360973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=;
        b=RPPu9zHPZJw1KTPB3R8rYH48/U3DleXT0mIIQxDf/StkOUVwNz8E58Z8b8ghvArxWP
         u9W6q1Zmv8upGVedAb0ovCJMRF4RVlYAbpgmrEJvHHBl8Kw7ezpg8ICcDnaTez2mQpHk
         8wJ/zy7RcYZCX5wgCHEBpg+r1wbdEvvHzUQYgELlY9GGxycVvVrlv64uZ6A3zvVEgrQ3
         86Zhp+VmhQav5K6umWPchvBv/lnPUI5nVBMSnPvlVnc2j2qjVj+s6q7sbTVx7raY7KMa
         8qSfOt8PmHbIujuSUQfNSVL6+MCHyTqdHq1gfvQaPNYX8DOyiLkml7lNvCzBLlUwRotA
         7k8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756173; x=1774360973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=;
        b=fVU9YDjTvbiWqFqUo6BWqF21uiUpy2ChqDlNIQb23DJQjI8Xo4OvosAR2+t1umtw6+
         bbOt0BuQLaSxt9bVZ5x904qkCZs8+2heJOJMC6R8FRBQPne9Oq0IH84VAYDCMQ9yjHNP
         RXB2GPeNRHzSvpZvVtuJ+erUgj+jFr8s1jon7ZutolFin6p0QPw6jRmcR/+7nS2LCBYk
         8tAyBvBN4rIB8Oth7q3QL8k3jGx0KfjlmmdZ+4vR8fsVz7eWCYzS/TLNCl6v/0wYJDpn
         uf2eqK5xiK2CRBXaZec5r/BpVC8NbRpxyJCXzoMaUNPNSY3/IHU4gHw+XOavzU2fudcM
         A7CA==
X-Forwarded-Encrypted: i=1; AJvYcCXSqIXjkHcsmXYqspSsbGZ25CBv/S9xbaLu3pc+jv4CHykvBo6kaFj3ZhZQkymV7VpNbRVxwH7zm4w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9rGL/pVJ/DxF/9pgxSh/lqeGvalTN/hIuHs/HVkvAA0inZneb
	vU56CrMa87GQBRR+eI9G55zMJnc2VbSffLKCNfhdi8/aiYwwPKFSM2brDkrpudfQgBgltPBi3L/
	+lizCPp0hnY2/ZzESMbOeKCXQaFrd8ZOnpSJsdn/SEb3GI64K6M9kvnq5Qr4+Bh8=
X-Gm-Gg: ATEYQzxpknF5wEs3wcSiZCuuMPdHVy1ABxQdXtoT3kUv4TDQx4B6LBFgUP6SYrQ7b2f
	b2/AOUTBzExUpAEu0h+I553gMAc6ZZeh6EcG73CudzxgQd37kzZrC09Yd3i6co2QTMlbDzJcEEo
	gEVTFvyzcmeRvpPkOoH00P1mEjDphR3DCEOSsVXyzsiEWhOmXDx+ZimEL9He+ENVjgprxO5EBAl
	zD7eivRPPuVM6E3R6jya6rRhsLGIenotbNdBRWI19nQai7ICz0o9CplxuXt3dEZ86pXAFKASRZf
	9OSYuOuaA7AKuRdkpaVh1J90bECs8pOhyvz2LAXgUa3y6M3oSu+BTSpqChPmML+CEPL6Dgamp44
	01zNNKC7xszzEHcTg193yhmhFD4E+RfPZnQ0eQvgELeSUD0qpm2Oo
X-Received: by 2002:a05:6102:c8e:b0:5ee:a494:1747 with SMTP id ada2fe7eead31-6020e5694e3mr8012697137.36.1773756172437;
        Tue, 17 Mar 2026 07:02:52 -0700 (PDT)
X-Received: by 2002:a05:6102:c8e:b0:5ee:a494:1747 with SMTP id ada2fe7eead31-6020e5694e3mr8012635137.36.1773756171962;
        Tue, 17 Mar 2026 07:02:51 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6aa2:dd35:4d6d:8eec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b4938854csm9359709f8f.34.2026.03.17.07.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:02:51 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 15:02:13 +0100
Subject: [PATCH v13 06/12] crypto: qce - Include algapi.h in the core.h
 header
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-qcom-qce-cmd-descr-v13-6-0968eb4f8c40@oss.qualcomm.com>
References: <20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com>
In-Reply-To: <20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SMWOwwGJxSzHnqJ7yBoaojvGxwV6GTuJEaiwl2WXaqU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpuV72seWPix5C5UOqBs0Dp63n1k65CTcZe5fCY
 yykFpDMoe2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCable9gAKCRAFnS7L/zaE
 w1sGD/9CfCSpmvX3BBs39L75twLMua/5LB7A1lDSNRSXgMm2cNZmPwLevSoCxGK9J0luJJjmDxb
 1LIQrNrz1Ct7+GrAmR1pdB0DJtPJbOCUsbj5SPE9fH2KY5g8RgpUqJcoOtLHfegLaeE+lhQb5Tf
 T3sEonHjE4xiYMumBoq5KuuHSFZaQiGmUs8OL1lbbhikfsQrFPfej61pf3QlIyfsG2JdhPzfCa1
 4RFS2bmN0836Hup8dj7ixmv7zz/XZtumaqlhKnxO77YdfDwW4Qlwd9KY+DMaaf0rMd0xyrWSdO9
 wYfppuy9Tp/Lk4G2lhCNL8hAmHndDBNJZk14YiZemTB5iQ55aMQ5HmopEj10+eWrgSbXOOV3usN
 QMkBvIU+Bt00I/vdhbrBwVllQBFGy6bMd83nvjnqr56XeCkab4Kalfz6F5WGiEZ2uzsb9Ze/+85
 KUMMRbBAnqaZW+ZHcGUakvUXrDgmF666nFEObqVslKjkAAHhOHr2CbgB1PqpztwsdmzUsWI8a/J
 ncm7bElz4hpt0H2h4N/olme/2OpC72Lsigb+eq/On95ZlxQ8Tp3L+dYYgJXIHLBNCHodD4HWxXf
 j4EyMjgLuliwK2o/VcxyxTrTcc7hCtY+JTkikwyuBzYR7EY3w+nq6Lw23Vpog+LaxmiAooXUJ5h
 PbIDsCpOPR1R7YQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=fJ00HJae c=1 sm=1 tr=0 ts=69b95f0d cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=rvG61WhHFVBzVmnuldcA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEyNCBTYWx0ZWRfX9AIBBJEiUd+D
 KXp4BHxtNVwflK634TZLffuSKWejw/p5Rq9J6szShjskP/k/5SEabUO5NDVeMs8WTtB2htNRbvS
 2NjgTXCDKkydENqcJLNqwAk1iB2h/0sz4lNxwYp1SL/iFkx1VglkuB3gpEfy0S7lSY3d/5MiNmn
 U3P2su4p5okyIbqzZ8yKGaMHhJFDUsgfky48i7TTPezVfNogIgvfENqcstCb/kK1qkvKHdfib30
 zIqYgE0EDN8F5xU/GJxOUte0kit+cwMSgOpzjO9nZkNipyvLAATdWlWMJE6sFH3q2MIMnMyoUkg
 Vz7k0A1/75z8nUUYue8M/evRZSaghKGiEMHH94aNf9xVYQDvA5ZJaw6/MGG7X7AWdPXV6ki962L
 u6p0fPkMXFmFAnNnxfSa/fJqDq9h82YLLXIo/+aSQ2zYFMOJO94rTsw0DPAGoSTKPLSjeRMyLHa
 KIK9SzX3Wq3phFRfw7w==
X-Proofpoint-GUID: 4g6ZmTA75dAScnuDkOsyWZe7hRE6gshU
X-Proofpoint-ORIG-GUID: 4g6ZmTA75dAScnuDkOsyWZe7hRE6gshU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170124

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The header defines a struct embedding struct crypto_queue whose size
needs to be known and which is defined in crypto/algapi.h. Move the
inclusion from core.c to core.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 1 -
 drivers/crypto/qce/core.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index b966f3365b7de8d2a8f6707397a34aa4facdc4ac..65205100c3df961ffaa4b7bc9e217e8d3e08ed57 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -13,7 +13,6 @@
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
-#include <crypto/algapi.h>
 #include <crypto/internal/hash.h>
 
 #include "core.h"
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index eb6fa7a8b64a81daf9ad5304a3ae4e5e597a70b8..f092ce2d3b04a936a37805c20ac5ba78d8fdd2df 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -8,6 +8,7 @@
 
 #include <linux/mutex.h>
 #include <linux/workqueue.h>
+#include <crypto/algapi.h>
 
 #include "dma.h"
 

-- 
2.47.3

