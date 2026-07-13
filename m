Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BCA420E6A
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 13:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947716; cv=none; b=uiOAEHgE1TqAOVTtQonQgvqqH+gls9bGB+WjYryObLEJYg9gfFEft8xl2rWhC96O1vhzYWvLfORQWBvw6MDTlK0kJEYr+C+GIXRYFcgYbsk/7w2hmyVCr9gScgK/aGcL/ACVVB+DErGv+2gyi8LCys9Uox01IrcJ7x73HBVLir4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947716; c=relaxed/simple;
	bh=vuAef0aUBOeSio60r/pSKcTossm3V61GQJlAyMtLfKU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Me10u39yrIGdE5kps7o+Ls0iE0Qynj3Ke/TM1iFk5jt8Gv/Z72tXQqsh19R9RVYtgX9WTlNUUQL9GOT+PnBN4N5v2M7Zo7WIlVkwYMEwpbkJZnl5iy6iQkHLT4f1k3hhUhGbkUyUe2mFOUde4BOSCHBtUF+JrdZHoXDBhyumm14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C++bvYKo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HUnKFgfi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C++bvYKo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HUnKFgfi"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDuxH1209914
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 13:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=; b=C++bvYKoKA4PWl7z
	Fj9/BoSaXCBYnuw4KX+woJ/i+yg+v7xY+sKp+//LJvvMGIjjIxqwRDB6wqhSMZuo
	eLjIT97Gph/mHA6sWUtUhzbQU2W0NnUTG/jtz/CPXdh9v1y6UAj0IIPfzqK3r6ha
	Dml2jt6/TjwYUxG1S+gasWwylClH7hIkIhbIL7jJkMRQH0bDnsxBZH/8VUkq2NgZ
	XQ/I3TP2rSvZL0s2xLCC9XzKyG0MPv1icVvtjGaKC8RgTJlF5bb+MEIYcnUhs4s4
	RZzMTzfGw9eES+jL/zP+neNSSsSdxErLHfIm8x3LeoYZ8uYJGhIpVunKCPXBheCR
	8SHQDw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcw4qrtej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 13:01:54 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6a374e480daso4222512eaf.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 06:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783947713; x=1784552513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=;
        b=HUnKFgfih0e9FhWfHivcZI0mwe8prDGFJSB5uKPjcz0rc1AhPl2795TXO6GAzDnP/u
         Mr7aShN6p8B/01PRb9zUkSyhWymQuyn/IrJaPOARu6hAmfmXlVv/P/KGMY5XJmZc2ZgW
         jGTOg6HRH4D7TOIurbZBp23lmBsBvwoKXHtEE8s2OxECbwAFuWxsE68fdeELauFojbAL
         RTBwBcTZrBM75kpE0QBWUJHmPDHE2sn3RNs6+EwL4sWjhvsRCrf17C0FvKwVV5q20Ya4
         7MJtfJOgd5XWcuJSAW3RmGklFt6MZkrgjUIxu2ua2aunEYhkvsJljb5yeck6NwufqP+0
         iNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947713; x=1784552513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ToTIYJiHy5tONa3lc6dWWbGZLTEc7JJCb/cDS7cr/tE=;
        b=NT9YEjIaYgYOsMASPsNiZrV0oLBuAxo80hKEpC9l3Rptq+f3Jrd1OjKB4rpXeEuweu
         GSpFI+IZG+3Cube17zFkcOVTS0CjZS8bfiyOx+n7y74dsG4MrDnvZAUMUDPFVLjcCrmF
         qHa53SR5bUd+4emR5yK2TLSK/g8N3c/dGNVgOdyvqJEXWpYIj1g54JmuPsV63Cl7BcRD
         KAJU7fFHlmyxaK1zv7l2rgmP1kcAru/11wpBS6PK99o9ByxEye29TjCwOcpb1F3573RB
         awVCND0rXVirV9qLPJL+PPsFPC0ItyVvAbZd/sJln4vPVCvI8S33NeTyPAiUCkfhzQX2
         q8LQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Y42vBkuKuSnT49B+Sqg+Ld5+1saQ4tMxK5oVRspYb1e+RmUluTfU1QSiQE6FNwZDjF3xQE8Gx7jk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYUB9gRNUJbZvN+20gbi4imNs/iWVBTwBn2kQgY0V+iGbvw4VI
	BIW4G9n3mnHvmkZBJnWoRhXvoeCYavU3VR4Poldp3ZZJpRch87sW5EUV1P2g90jF4U0ZOC1HPOu
	s+sm0MgS/GwDE+tkJTG3mkAiO7G1Oa36kmxp6VEKQxqcL+qdBMexEYlWWM/bHpaE=
X-Gm-Gg: AfdE7cnKQa0WUmfa8h6zRqN63iM4VJ3w1DmoulJxi373lDXDUQG5CmVWLeKsoch2Bqh
	qqbBKRU9CgGCCvps1hUiiItJigLCib6LFNhFfHwjovF+8+w3XfH8LnTuAEqR+IJrD0Kl62DXA78
	hJTsaixXPQDYEMXR5LPxBth+yQygRnFQ+trMGdb0hyr/2crnpD1di4xl/+67tCw8bhJbAMpArs/
	iJ+v7N4lewLTMbwKD6rVOFXNS5SEuCp7yukfECWUnWPfmnELQdzSyIp2IbgeLfFhmzQG801Nxt2
	qkRagBOopn/dB5huaNlzfiDZJDMo3RJWPMx+Q642oQz4qMekI6aD/8h5xf9Ktjmr+vpLh9p2u4x
	iQ+lbp97we+nghAr6B3NTUSjsPkglallZ513TWSIh
X-Received: by 2002:a05:6820:1a0a:b0:6a3:7d5a:1ae0 with SMTP id 006d021491bc7-6a38b9f0c0cmr6902465eaf.29.1783947713265;
        Mon, 13 Jul 2026 06:01:53 -0700 (PDT)
X-Received: by 2002:a05:6820:1a0a:b0:6a3:7d5a:1ae0 with SMTP id 006d021491bc7-6a38b9f0c0cmr6902275eaf.29.1783947711045;
        Mon, 13 Jul 2026 06:01:51 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm306129725e9.2.2026.07.13.06.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:01:49 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:01:09 +0200
Subject: [PATCH v21 08/14] crypto: qce - Include algapi.h in the core.h
 header
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-qce-cmd-descr-v21-8-bc2583e18475@oss.qualcomm.com>
References: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1305;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CUp2WTmSuEfCdx1+Ds/evRL1UENxTV/cwxTY1f9GBAU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOGdIJMZbD30Ir6MPnqFekcNPq0AjO4fvaXMy
 HuGbWZzdr6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalThnQAKCRAFnS7L/zaE
 wxivD/93ThfidN7R0lxtpI59l//wvd89SN9EFKqvevdrZmeZUM2n9BNk+0V2zIQ/T75BQQ/4WoK
 5ZMmrneskmHZk00O2+JYrEgdsKna+qpriKe/bGoKg8wPoAC2u/Q/bChbfeisnpJnJ+/bVi0PfiO
 ORlAvQ1g0DCmTfKYWa0t46jTTlivRLUqzZ6kHY5EbciCGV8omxWLlkQLvDOJZrhJDK0aRjRgGl6
 iR7inEOFnjy2WbUB34Nu4NQj/aGtKNs/3gwtkmXqyEz+FlyzZ4niadDM8RcA/4Sz1QzS95SgX6C
 DkhSgZuZSA8ilJDdzP9fE/ZUYWAkJ7/UY5Q3E4n63UgGlRPZJqCVA7v0PZqchnWcn6d36C6tWRW
 jM9eJRbvimDuWPnpUZtp078615VgWGDjrD8W/4XbWARxrl1IYQWtR+ECB65+ekY9fctfEbF5avG
 WK1lvxeXw95NQvdHd118d8o1BLMucX0PHPjz7oj51Rv4c/ZhD9KcufolYQfQ8T4RuHHTjYF6Cuv
 Bx1DA2U+E0jeIpGnIRDte0bm9ou9JYRcNGMPkEO2jG/adpYdbMhf2Fh/V1sgHRp4teFYA+bi20n
 Fmk070j0OyWbe6NEIF33u7HjXVT7WO045hedaI6Ajug85whxWdL91I+PqIoA2DDCJ/JxhBYrE/7
 UZBBDi+BCq4stKA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX5Dg5ePFGI2dj
 EeUmHdlOobmqoG7omKskWflkyC4b5QxOsa/Trykg9/K0HErOKEQm/lgF93VybsUpf5+XZquTl4O
 iq0u7rTtaaPqU4oXJ7OM6SrCJCDdCtskT1jie+gVypYdJ6rlrVUR/9wREdjjf5xkJ6vciNJu1iZ
 ePJMHWEZDdSZKMsDA67gM6BkRDYRwFQilydAeXunmUTRnroumeJ8/T0lQ4BFUjmShVGTE5f0v0l
 hRAttOtJkmqnjT1xILWY+dTgHBJPnEcYf8i2TmnEMCvpwbVJfl0ySTtE4tQ6Q/ZHW1io2ynauSq
 7w5lTdUBBr4yIjcwDRYamMgdo6bk44UHUqXc35XgPoxUyIBP2bAwIDtrNENeQm8+vlVJDEY6asP
 B30Jtvu9NeRi8Upg50Oj/WLQqwwq6PynG2fH3ulA8GcWuKrxMVfmFTpstzz3VYmNBbHLVqIAk13
 zTpzLYCgCgez7izfg6g==
X-Authority-Analysis: v=2.4 cv=HJrz0Itv c=1 sm=1 tr=0 ts=6a54e1c2 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rvG61WhHFVBzVmnuldcA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: n0QRXdfV5zFkLDgy_CDPxTwt6EK0L9T5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX/C4yd2WfohHF
 iRXbgyD/cX60SePY2v5cqtT8VDlwMbCYJH9ZrBN4Choe7p2FjyMyCMEtj0kJZSVeMzT4LdqsVt6
 38nXP5wmfs3KNbV3CjFaQuowgt/z9fI=
X-Proofpoint-ORIG-GUID: n0QRXdfV5zFkLDgy_CDPxTwt6EK0L9T5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130135

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The header defines a struct embedding struct crypto_queue whose size
needs to be known and which is defined in crypto/algapi.h. Move the
inclusion from core.c to core.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 1 -
 drivers/crypto/qce/core.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index b52a26ffff5ee733adcf4e8cf8bef75018dfa63e..dd860435d2c47a608c82cc2686583a44ff96c889 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -12,7 +12,6 @@
 #include <linux/module.h>
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

