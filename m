Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2F53FF1D0
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 10:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727309; cv=none; b=sTxo3kl/XNUaHJnOq1+9A75To6uIgMWaisaBfcyzcma4llQ/NnexPIfIeE3kehJUIvw/2nRhWPKIZjmIS8Wx6ns0J8ojnVRd7+uJ/CwqBG24LubhMwAHUUixeUrAFCTc/+jyuhXjdqPHdNrBkrfpu5a3181efJ9awlnkcL2rHN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727309; c=relaxed/simple;
	bh=bxwOj+1r4hE0BIdCr6O2vUvIE65d0GfBKW7+Xew4ns0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BiJI9DM8ARtovEyu89JBbmpuXLJHoQr9h6mb1HGIXOzvrUN6lg4Lg8/HzYXRHAe7zNTF2Awg2vHhmkLBjxsOAVzZF6hgOYtv7+Aa+Qeh6ezwNAP40BoAMhhdbDU+z4vsUNg7qzL6zhE9ufpfmBNS2JwIV42RtYuQ8Nkp36zIMR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A0ka6O8L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cvgCI/Wm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A0ka6O8L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cvgCI/Wm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8aQ9M2368167
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 10:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0kLuBmycbMAXm5ws7TG+DllfddsRIfX83CGKYC8vsgk=; b=A0ka6O8LtQj50Nf+
	xqmQXunSe9B7gTf38ZRn7tK8X6JjzgPsTFKQp6oY81MmP3z+Uj8Dcw1sHlgs3dgt
	TPqsnhf5134g04V/dXYb24PcCrnQEaZuezQX6TUmrfW9A/63IbSDD8r1dWSjvHvN
	4fLghUoydYLPpW4z9Xh16lUlFvYKTHe+9WF3l8/PGuF8+vKDZsIT8EJnyDMeruok
	RCdIohzWdpRjBIjViNIOQv1gP54lslY6wOtFq/Urm/3QsS05MSRxij4FZQaBI0E8
	i+eQ6ZJBlAksCe7PfoaGAByvk9om4Sfpdnt8Bgvbo9M743J2BHihnieu/3jr/z88
	efcSeQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgrbb6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 10:01:44 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-495e372e38cso54471b6e.2
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 03:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727304; x=1783332104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0kLuBmycbMAXm5ws7TG+DllfddsRIfX83CGKYC8vsgk=;
        b=cvgCI/WmYAgNYuklgHqt1P50yu+AN+vYEF4bh3kd2DWY9zQDMMmSBHpUlzoYF+eaVM
         KiG8uahlIOF9t/0shy0UNFzLs+3Y09mSHWJXmm0fjMM2Vv3SvEH91hElr5DdbnNycebT
         cyH+EaVCm+IhrOAM3SqDjlmiYU+aWIsNsk4jt6KQCdtrzJ903fDuq7wIgM8fsMg+QghF
         Btbjs39Netraxj26CbL9WRQ9KDL9zk5aIXOvtlPHbPJMlkBmVegxID819p8FUEzy3khI
         lbNwiFnAh/UJ8jVKFBToYDNn9d564zBqkBTnGB1E+BZUqwpwIoQx9KsmJku9LwQ03g6a
         J0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727304; x=1783332104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0kLuBmycbMAXm5ws7TG+DllfddsRIfX83CGKYC8vsgk=;
        b=m4/wy2CAIOE2MsUDlsZhKNZIawEQiKYgMwn6baXAPTmXESuEiJAFCdga9nQKqIYFul
         RLC2OHJqt4WLqUAr6+wVMkmo+2+s0V9Ycpcdrk5YGBaUVFioIk/rW7rIkY9Uk+i6PT+B
         7ZLJSO7lp5FWSkr7I38kYb93BRQUIYjqT6fSelJpcgzPIMipSstPOyd2LG7aFGuwlqEq
         EPxaEOfcXU5+fPLuXzQzzimgqlkdve1Zc5pdDRxEK0cfUBht51ltMTzIrLBoCp+7gMyY
         XH5pbeVnTTtKyYa2pwADftdNnnne++bsewrU7NxptGsXnEKl49680JazFzbpIDay1MNL
         N0nQ==
X-Forwarded-Encrypted: i=1; AFNElJ+QeVee+GyrFXB/O/HvOcGHXFW8t5Q2f51zdDuvqzLm0ZgUYHnTYl6+rqdT0mp/AieLlYI7y9UEXsA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgxEaAawdYQAnm0t3Spe7m81i0bRZcV6li/nHY0ZbE2Kz4I7Gn
	ik++sIC6XkTHBkQ86yV1kO7y4wTPNlp2Y88fZVwfQiYYGZQsBTQw4oGkIlAGGPAlMaYX3B/FXb1
	oPI+3TLpT/uIxg17YB7b1LIMqKwhsCfClTNE3pzQZSO3fCL6zSDAQW7G0GqeoTTQ=
X-Gm-Gg: AfdE7clEML2RKIFaY4R6JiAjhPb0m7sClQld84I/AL72i4hf8SdRdKS2pPisIs+3m7p
	YhSi09ogubhmg/JSHnSZIHhIsLa7vEVaoojstKd90cS2ygqCSLCSxcnR2Pnqd+tYnv9tjxJAQFV
	32MHBU50ykk9uDmF9HB/akaBYvBlnILmyXsmr2iGD6nsLogy52GTCgukEFYWh2NIVgJZijtaQg7
	dSOtdL/p7a60I02HGDKYtGNldvP81dFRwKoVjr/5FzcE+XVjSLf4Dt2SwPP7BhDaxKuxLA6TZAs
	m8vjqzU3avjFIzqdCGjDhO3UU78bEo3cmJC1epczC5jzqVEJ4+azYTqdjViEmO/D4zG3Zg4jfTX
	JkigAMhY/vJdQaTLuTtMeO2qZLeKU8o63kABppZ3j
X-Received: by 2002:a05:6808:14c3:b0:495:d41b:10 with SMTP id 5614622812f47-495d42a46c2mr1731317b6e.1.1782727304237;
        Mon, 29 Jun 2026 03:01:44 -0700 (PDT)
X-Received: by 2002:a05:6808:14c3:b0:495:d41b:10 with SMTP id 5614622812f47-495d42a46c2mr1731296b6e.1.1782727303830;
        Mon, 29 Jun 2026 03:01:43 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm24729405f8f.0.2026.06.29.03.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:01:10 +0200
Subject: [PATCH v20 08/14] crypto: qce - Include algapi.h in the core.h
 header
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-qce-cmd-descr-v20-8-56f67da84c05@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1314;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Qxst61jdIT+8Ht+en2AytpIG+5WhKs6TgGXh9cEYbqk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQkJwZW/a1/FuvH+070Jy1CpCEea0E8JvEmVzo
 Vx9kiBjUdKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJCcAAKCRAFnS7L/zaE
 wxs1EACIsX7YXdr0sjn4qm314IKBsfprLT063avihs0rpsQj/lF6gjwKnOvz7YbgGt07qTdu471
 NjRS+H5wDqPpZsXjIsJYB1SyURJB/A4vHaxe+rz827ME9Khl/5mFQmZGQKJ6VVBNDEeqhXBVzRb
 hhu6lfcmYU21pyqYv6ipDsw2IJLmT9SUab0OrNtYv/7anpnWBCeZtAmY+gQMs5ZzVX05GL3k2wG
 D6mCAWaJr1JU5Z8oNvbXBr3ayY0WvK1YgyRwT8GsqDPJ8PrOhZ7iai8WOjYiO7h0U236rSUoQ44
 jjpq5qor9RFHTMWJQTs+EPy1AROczrf3asQpQ70STVF35srSGEIekQES2mweoQoWTaR8Cwf815v
 cPqwvRX8JzY8lOsrxl1aOCGk9pZGD8zkwqo8jiquq8Gf6M3b1tLu4LFo2uLNTK1zvvDkIWsO53G
 Bi8P+hxhFmVDauM6iWRl+iWtfflXiJByzL3Kp+l8ZtlL08hm5XTieSj5In+jxdOir7YxN9zZjZP
 o+QWqZwbW5Pz+iqBhCfQz8nWjv1TqVlRb/dhlL29VgtdmsmNLDKmGYtOJRglb9Q1PozGlxdW7iT
 bziZJdpTgOL2VhzrJc1tG/dceQ8OLmKsS3Oc8O5joydTPZMfAeujfQKVVUKBS5lDpXovjURgMVL
 p9Zrsp/UAdloztg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: RuzXe2uCJTUN2hdAWqVyfIix6vufkuh2
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a424288 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rvG61WhHFVBzVmnuldcA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX9XWCe5SuJeNi
 LBsXIsblVldiwYnPZYDyYr6It2urrzGfUbT2pzsbcz3DpGZRKPFau4UthNDuWyVoLLpgciDQpnG
 Qv4nz0F98HbzQJYnC+tmW5/+t7cdiPw=
X-Proofpoint-GUID: RuzXe2uCJTUN2hdAWqVyfIix6vufkuh2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfXy6lyattMD1iU
 q2fiAeeMH3yfOn2IuwJQOlCvrS1XzGlEW8OctHuNr+tFDLAvdmEsERSF3LTuz+HNd6D28s+PIPp
 rwzk7CPBw8xFX9gfxARZAoIRHPcuMzefzQ4PUhEL3p5L+H9stQrMb+F2PXsF7WSrN2RH57eLG+G
 X0ZOcTya90TRMxM1Z8IL+ySy1eo9+Btt4zcaCr67inuen4fmQsS1KgO02UPTiGUrEBE3uVyvhnD
 k85SeBqpNgp1J53XHeqGEyoya+8tto/jyyWxlnNr9z8uJ21C8V8wrl52DmOFwPw8unk4Oxg1zlb
 kOshFApUtEcwlFtIP79eQkwvG1iqQy7gF4bg54HUCY6oVy+QDk2kqu71ooFLHhnob5ib5FuXEzt
 F5tjpO1VgbkkVPTwpogegfN0fjg0/lLyHeuQk4VHFO3f54F8Rt7xE9kGdjCZYr/emGAQ4iShsO1
 wY9SmEjZ/jfJNDyEhQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290080

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
index f671946cf7351cd5f0c319909bafd87e3af701c7..ad37c2b8ae53a373bb248aff06c3b7946e8439a8 100644
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

