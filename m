Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDEA3EF657
	for <linux-doc@vger.kernel.org>; Thu,  2 Apr 2026 14:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775141768; cv=none; b=CUdjHOkmy2e5iVc5ZEI2Gp7Mf99S87POxbHa+ZSzzA6gL2OJanW1JH31X0K8IeoIbQDQXExXJJcoZjvJm/26LFdQ2gK2uYTMU9WtSGMSD/jBhBihin6vbp5d1rX1ajK3g0iX9DQiZW2VFZMusQJwtIuX4mCMkW11e1+8T0AexKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775141768; c=relaxed/simple;
	bh=D/DbbvsYNV6WfJJN+Y3qtsfzsdueJP3Q7cdgK44aCk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EiYCokDJBcyohwxv7MkJI7e7Fc7GeKtSYfnRJCAeLPIJ/w8XNkJhl7ZhmOWZIJN5DeUIlPNWloIfZMcVyE0AUYIPVITxEcp118du0yaumON6HSZxCMgp4fpbbSLOSXTr8NTLY6mC6o4HV54VdaFm76gV4jzzG7gYXBX/oPC7mY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hhm/Q+Nj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RDqhAN7/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhm/Q+Nj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RDqhAN7/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632DDt0D1128506
	for <linux-doc@vger.kernel.org>; Thu, 2 Apr 2026 14:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=; b=hhm/Q+NjHhrDco77
	6f8Ze5n4yZZP+l0GvEJS7/dD1ZPaYsAXrJTVWMwXuiE3+ebDLntYbEnTXgGrmDxn
	db4xD1p9lS0B/suY53jKBX9FlIVuUa44RcTAjubtXx5xZPU1CZg9NUlL7bZ6Bsm6
	nT+IH8JlCmug39KX4UPdpWlV0QoMWog+WoXL8nqbrjisPhCJIV2QcxIBVkU5BO6W
	XPw0mnxeOGunILCIdsLFHFsiKCDN9B7hzcjslY0xXoq8NzD3VDU1fIca0nHzEiYb
	HkmB1iRyRMhcvNB6/qagH4PNMLvLx/suZ2lAWWrmdEYV2MwvYvHbvsbodC+SmhwK
	vLWU8Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d96k9cn64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 02 Apr 2026 14:56:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b220c72bbso31816961cf.1
        for <linux-doc@vger.kernel.org>; Thu, 02 Apr 2026 07:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775141763; x=1775746563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=;
        b=RDqhAN7/hD0f6VW0rJkYEedhP5yy+BhTu5k+tOLrZpC++wvCqk9/B/9CanXmbe8jg0
         6gluEFXrdXM/n8+CHQhsIpjbr+4ivkwClA8RSRxR14zLUyoOrVfrlawXFyPsGMmCpLzw
         f1GmB2wpf+1SrswennxQtFUjvaD4lMzaz7BcYpL02yFA0LHtbrk3P0i295PIGWWbGRZ+
         mtvOVvQJo9SwZDsU57zQY7o9Pvwkm9jCLbTXFwMPDVNV2RkB9qm3eMEhZpXdGqbC1JaG
         +snuShu7AORJDXk0IChNHWCMpKxv5op1d0zzU4TFvryuQyo1SK0G6slvc4jyJOdK6YQ7
         GU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141763; x=1775746563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f+eJOMoesWuzpXTSR4Li0Qt2PYtZi1rSvrjFdAlx9Tk=;
        b=PRNulgdUZNghhKyU6sMLKm0cBNsorgz4Ehv4Cngh+yCNoRCBPsbgd8cx/Ob1G5lmou
         3fAyImL3G4RRiEzl4caXljQ12Uf1kiZT7KlmDTMxcafbAi3wXbKnp8vLNeFq4/IF/rzC
         E2yRh/iMUCPS+n0ljZqu915FYnH6Nk7ennuDUvc7pvSF7XbGiNnuYJiE9ndT0fjORXlU
         U447eMiaYyJ/KKIWSybQ8bRY9nRyZvKdi/c68cMjD26uxa+s47bBv0PdrPk1bZKJFlbS
         lDeqwTg7Z6BQwfVVnWga0kW4NJJeP2etYMUwNURjejppg32JpKVX+/HXWzZBKbe7Yl9I
         pqNw==
X-Forwarded-Encrypted: i=1; AJvYcCVy8qWwcXf03oF9hqV3xFSDZTH6kxNQp1bZyPVyGvXXxgriNUzNPiYakL8/fVYAYtugeNoPh7NzRlU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjkOBDZRIYmB011q3e1A9vqrna/Vr21NXDlpzE9gwvKhs/p4i7
	tKh34nqgdFpv5oledwg6SaBOHP4wrM1kUPIREG7BE0O3mEH+8E45ceOk2yXdaft3b1VV52CAUpA
	M5tW8Tq6ZP5Lbb7MKwXhlYoAJ5VzEs3IFr7vD4kR2jOBE565SQN9h9wuOL2Xh0Ps=
X-Gm-Gg: ATEYQzwIt5DOshHiFqMmBolEq+D3lEjzkb9rJTyUDipABA7s4ZqKx9UfN0dhZh/en2p
	uu1IktDgnCi69abJ5+o5q3l+BofcSA3fDkmvFFkYEVogXhMOj14y2eCBVz/pLC7AneZpc3czsT7
	x3tAZCEtbwiGSa/il4GiTZrxF8eT7TQtfICpyaV55hfBv6MB2Vbtb8TYKd/Bi1qvagKSlLvHv9R
	HcB4stg9iyKrckQPfS1O4yJf543kcBZ6JO/FRezscAYpt0cC10484zdZKV/EQsKXMHP2nAWzR3E
	NKDXEK9a9G1HPlaNyOSDEFcJIIH06MthbNBlpKRKQ0oXkoi4D8J/QcZOWHs6Ytapf7/qnsKeULZ
	Pz4PGsMDHU3ZG0kiScKnI+QymOluCaKG21FkqHy99+Rp1tqIglUvW
X-Received: by 2002:ac8:584c:0:b0:50d:3a3d:425 with SMTP id d75a77b69052e-50d3bcee735mr111226101cf.50.1775141763245;
        Thu, 02 Apr 2026 07:56:03 -0700 (PDT)
X-Received: by 2002:ac8:584c:0:b0:50d:3a3d:425 with SMTP id d75a77b69052e-50d3bcee735mr111225641cf.50.1775141762799;
        Thu, 02 Apr 2026 07:56:02 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4ff1:3e57:22ec:dadc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5294sm7234038f8f.35.2026.04.02.07.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:56:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 16:55:17 +0200
Subject: [PATCH v15 06/12] crypto: qce - Include algapi.h in the core.h
 header
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-qcom-qce-cmd-descr-v15-6-98b5361f7ed7@oss.qualcomm.com>
References: <20260402-qcom-qce-cmd-descr-v15-0-98b5361f7ed7@oss.qualcomm.com>
In-Reply-To: <20260402-qcom-qce-cmd-descr-v15-0-98b5361f7ed7@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpzoNxGfIiDAsunI8yEQv2dTMgafI9KDud+u6uY
 Z9EOTwuZLCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac6DcQAKCRAFnS7L/zaE
 w6oxD/9yby24fgmJblPwc+DaP6ygv8XanMom0FqM2s+v228aXwkVpuyN5FBuNWQCeGnbjlX/ZaY
 4YrJNNmnLEUh+QqJGWauvTQRl4zWc085RXGDYn3P1kC2rrXBrmDgRMGrVbtJbnkvXRIcEzuSBzQ
 MQUM4/UDW9HjMTWjw8fHLfCU7KZoWJemyyV7XK5Kla3GkPuOcTs8NGIsi25vIfZKYLDXp6fGBMZ
 j1bQgZSFTRxq/ko1u/x5qywVyi7DX9x8EpLRUkoURrcPkb+6+lgB8DMYt5+dir3bsyTViQCB5yD
 J9vblBfKuB5z5E3EpHRASIfzKPcFcVY3IYXy8dX9Defg46axje2sP5/7SqMBpi+EvDiUj74rEXG
 NLxOpx20lwxV+xxdQM2jzJ1ND58pPgxE/X+bDj+CMB6zt6jrkbSeljO6fYNaZu6TUxTNIO6V2QT
 EsB6KXtMTdQCyUu6+RklRbDZRGhsGfovviFIODqy27D+0kICbdM/LSMX2zkf6wCIgEECBXXyGk3
 NI/nucGzvlZcNLQ/H9obOyWrEkOq89+G9kKbDayNxw2KPxMz6SMHcSpNWxrxOBoXwVnZpLUc7zT
 SshWVro1XoNq4nhzpOUst2ip+iJU/VefYxcClkUSN+xyIzHwFnGal/nFAwzhwTeQ4eWZrGTq9SG
 i+vVfSKWmwcYMcg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=doLWylg4 c=1 sm=1 tr=0 ts=69ce8383 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=rvG61WhHFVBzVmnuldcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 10ftxaTqt0cJFGP8aMmkhFAC7MaFZGep
X-Proofpoint-GUID: 10ftxaTqt0cJFGP8aMmkhFAC7MaFZGep
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEzNCBTYWx0ZWRfX5ih0RmBac1fK
 RdTlzCv7huw6LKxbjae8mbPxdKjFS94k/wQyhwpD6FEenY89XJ9hoySUKkdsLG/fjY41BVJW6GK
 /DpbddpykTqDb0buMbo0kitaEfvZ7irCfcm7yPMkFn7unJr9B3zhaKlVmn1e6CL+z1+pdW7L0Wm
 HE/uzC2ZqqkFHFSSLm4L26FrRBVVh670GVmBFuK+FRUi1c1Xasr8CXJmrdZXL9vnI3SQfWbiCZJ
 KEmsF/wVN+/AbuqQnTixFDDEQX2F+Cn5fGrkgJQDTYl0cxWgdM/6SuEU8TUgYaD9JWeygvuYiYp
 3NZNQu0LNFHFzeURcTrzwrk5d9xG3tmfsnV5+a5h4IkJGQsd49yeRhSFRnXMT4+zbDFQpdRdy6E
 Jd3os01bzkjgHZYFGZesZ93BoN2+WHeI7JNhTa6N4VdFQkZzRiNYeNl37tOXKDdOKvk1U4WKAul
 BCKPi1BR3Zn91ZyeqoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020134

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

