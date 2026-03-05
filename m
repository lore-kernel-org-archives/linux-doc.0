Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E6735F186
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 21:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772747186; cv=none; b=YFkThfIq284jR4QGJSPilrYX2ACaV3D+4VOLCRN3uFxX3MOu1D0HiH3byZ3cJhEEzgR674egJgDi97jbVATBWrZOAe2W3RFAMeUiGTiXa49MTUrmBAVDAywSpMEp/eDqSDRWC+OpIARnshXFPPDPnneoMJSJKBSyZSIdJthp1Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772747186; c=relaxed/simple;
	bh=6wTg5DsJ+ATD7iLynQ18x4EJDM0BB2ZAPMsN3b8NZJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jXeB2bW2FophxdZhYwxCEaxi+XLDUf5eCfF3KcA7DYfmfV5rQz+7pSL86UdDHQyj3P+7rFJMBA4FMVdIqbh8bGGNRVMalOgZM+3n3Nr+7LeWKwtnZDuJ3ORMOmSskQj6P8UKyuZGctAZK8lV0YaM2udzP6NnwftCvPqt61zWJEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bKCS2POP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XNMMBA1C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bKCS2POP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XNMMBA1C"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625KmufU1810042
	for <linux-doc@vger.kernel.org>; Thu, 5 Mar 2026 21:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lmkUTSqSMKdHAfSHvzXCLPeWkagFUCz0SlNEC6QFdTo=; b=bKCS2POPMQPrhHTk
	ngNEQyMtdSUmID1ke5PQnDAWyP62jpHAdCAGQ3Rlru28IR2le3f4V/FpLO2n1OQm
	cMEG/XkRS4ik+VDEjHAlj3RMPaUE1GYVcEGbUy1wtOhDdF0n+sueBWvOEY5tn+fK
	YsXx2uEnAFpLhBX1uiUGNpRMLzjUq++idIRis2YSfm3ulhsiDpsQLOS2P1GdAC7m
	GSzaAJGqpZpRcHQsXXk6dZjKo1iW6zpEH6ZACe75dKr7H122JTczXqU3o+Qszzbd
	Iv3WjqUH0Zbam5CljqlClCvQCvJjHeuzykxsgbwm6k8fUfxCAgddNktl+SoLAnp5
	dPt6sw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqgp407ng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 21:46:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a1f95aea0so108798506d6.3
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 13:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772747182; x=1773351982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lmkUTSqSMKdHAfSHvzXCLPeWkagFUCz0SlNEC6QFdTo=;
        b=XNMMBA1Cq9NNwKzkG7yFGXQVqFk35YVpjw2HR8zcprBYW5kEDvTel7jAJtgehZEBJ1
         YC6OM+pl9A4i2mKhufgdbW8cGvY0lTrLyChl19txvDHWL11O6Wyx8ujMVMvkmzO7NxvG
         0rIy5JJsZsdocefj796gJ+EpZYoBOAnocG3P2yo4u4tdKezX/OIV10E4JL1s948VdOCy
         Y5Z8JfbA7yGoeOwua9PqXY9Xz3I/LAS2pJn2yjMJSDLVDdnojeJ3CMJz1kKNDmMQgXWk
         7nDn8O901RSvbIRevDGYrg8HPYkBEOXlEgW10EIOr37HtJ4lVMemVhfN4WTkK0lPFjDS
         nFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772747182; x=1773351982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lmkUTSqSMKdHAfSHvzXCLPeWkagFUCz0SlNEC6QFdTo=;
        b=m0yxjpUfaf0764E8Uq4fbMt53czsXGr+iAE5eZdIeD6lXg1kyumrjZvFQy8VVo3vGT
         5pyn9rvtj/wPVBnufd8A+KIzeuhuxUbc534xJVsPcAPyf+I2SU2ksxXGE80s1eFj+SIi
         y+YL/jZhLFa/rjjtjyN1w6nhxDDqJAI0rXrJtCUWx+ne4OA5WqoKqqNbuh7tHpOmSi1D
         ODlSCpiIn4P/olp+p/JX26p78Z43LXkFDdVEeXdR1lDMgf/F760Hd4eq7AskrT6pFQDu
         T08EjwRXAIpDA056JTvVB18qrHsR2ALxsdPTJ1i2nI4ssjgsw/gCCkCkyhINs59gD6/d
         Ylbw==
X-Forwarded-Encrypted: i=1; AJvYcCXXRqt3BBgmE3nQGFdUS3xPL35GuzKxXxCMU3+QQajqsfXjLXk9cU5XR+gTCj5gxXFgq/FAoug2ziY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnJtZxjoX6PeT51cJur06G4+iBqNvmuWmCw4FsOyeJE3eoCGnr
	W2tN78Shlvb7PYe5kVi3361w+oSk8IdIG+OmnPmjj0EhzDzNg9WYfexWGsIH01QxuABVrEr/060
	TgW5k3/o8pinJp/x3YEk693liOzyNkQALEupfyZTB5r5ySCgaIleigwhEPDNW/Ok=
X-Gm-Gg: ATEYQzy6PRTwm5XLSn5qcw0Q3CF8vGzjDeb1AC7T6tpUdkCBOKdd0ckXVip/psMPIgZ
	jzTz76rznLiPevk57BybC1ufoMU/YOh6i+f8kzEufZG4kSfqYat8Uabrty2RCyetk79P3Jdqy3q
	sGrziDySJ8+dMNszloY3V5QvzJUgyoo/BRWYNXY1b5I6VnIAIyIiSs5xq3g/usuRgq5bvOvwlqt
	QEyhndUCs2UndmqMAp6StZgyngfRFaOLEK7hUar6yq5DF/EM9/9OVKn3GHgz2nnRQMJdcOoF1YQ
	k0sMUTjokGmiTTkde98aUScxakPzlX1YGt5jwqR2eGMm6N58Y0wI3St6gsgQ2+aZH8H+XJd1BTP
	U6CSx7GyeDdoQnaCuUmDN8N/G0QX1tAnkEA9/DRr045Oj
X-Received: by 2002:a05:620a:4494:b0:8c3:598a:2956 with SMTP id af79cd13be357-8cd6d3966bamr6924985a.33.1772747181600;
        Thu, 05 Mar 2026 13:46:21 -0800 (PST)
X-Received: by 2002:a05:620a:4494:b0:8c3:598a:2956 with SMTP id af79cd13be357-8cd6d3966bamr6920685a.33.1772747181120;
        Thu, 05 Mar 2026 13:46:21 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a58dasm28571575f8f.27.2026.03.05.13.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:46:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 22:45:42 +0100
Subject: [PATCH v2 03/10] power: supply: max77705: Drop duplicated IRQ
 error message
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-workqueue-devm-v2-3-66a38741c652@oss.qualcomm.com>
References: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
In-Reply-To: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Tejun Heo <tj@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Tobias Schrammm <t.schramm@manjaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, driver-core@lists.linux.dev,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1275;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6wTg5DsJ+ATD7iLynQ18x4EJDM0BB2ZAPMsN3b8NZJk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqfmb4FqaUPE8Ufhusp62MvQj/z/BudC05PFyG
 lRWQHQ+flSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaan5mwAKCRDBN2bmhouD
 18oJD/0TgRoahqQolkN+HXA2B7CERLNPQLecC5FxtW/Y0TeM3mpHkMAh5y1xBix+0e9BayIEkGg
 SMrEr3kgC8I9FEc8Mc8G2UFY7AQpAHuFGmjnjIhj9YCfgJaOB9GLUtsDkzip9AjWYMuEPNdg0hH
 N240sOUOBCgzBgfGY+5U8AHaK7JKZp4nA257ZtiwWR/9Ua7KEXVvyXL7KujZzgWoYIY1H3CJ+p9
 T2MII1isUfaViTmqZnLN/EDTeHMwvh2SUwRMBc0x+oROHzkHmx7GkhwhXEFpFaQlJpLhHdM0cr6
 UCteNGZaYTAhPBNZ3Iwwg1g3kHUQpAtuxMGI6wP2TM2T8thzx0lOP1vpCHoyAKS8NffvVE4Cnlk
 LJeRT9kzSPj3mNfW2tQPou3NDRouDud3eSUX7dHRCsKEgWH94aGzbAGxyuCFcq/tWFl2XXBOmfm
 44H+Vcs8ff43di9cK0YWiJtn5Sk14hXiz1sz6bEFr/nKpKDdCiJw5sSjZF3+ODc93BsQWiJXlsI
 8T9NZ7c4YdS+9WfiGvwjRTTPanrmNmgtAZXQEooWvgiGwxRPaR1whqMDEtiuFeAauioOIxE2eQ7
 +MCgY2ay1ZTUSZ8QjJDAT3LgPa6Dqw/0s4NcwNpP6zqW+ya/JiSa/HNOPPnTzOt2BShhQY/QI3E
 YavCWFWns+RI0Iw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: GNj4k39A7Gcq9jplJS3LOHDKu-KBDlAw
X-Authority-Analysis: v=2.4 cv=LegxKzfi c=1 sm=1 tr=0 ts=69a9f9ae cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=e9VCzvh-DsFqsbzuLP0A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE4NSBTYWx0ZWRfX17tZN4TwWSC7
 NzBYe7PFA8Cz5brfAbA4Uu/J1RSNm+2SCtMMQ6Sj/NRAxbauCamy+ia45yXFAWr7VGK+lcancQI
 C8cgJNd8MsBE6Lno3DPuYONE+SOu0zn/TH5hBcMQ0GsR49BFYnfguM1O220mt0KAWDuofbTjaCY
 /eGWimaN7EkPv189R8Rf8BOKO5ekSDkLt4gwdF1c0kE0FD6WOBebJtHiY3APp68BMo1qZMcFv94
 Iuso+Mj1zvNUwydFpwziB+4INxIHY5m3FMq9DfigA3PXPz58xTQMuntO43kymdaDaFCAtC6Qdrb
 LapzXOm4rvJBQQrnDHkyiBVlil5OVoSnE+6vMLCTtNgzk3TUUtYwD8hkSVy7niPk3tZw0PGyl4I
 tM+M+65V5Ffpw+iHaoR6R29XOXpilovlg+Y8YUW5iE04PKNWfgLT6VKA5EApT0T+dC066DtNx6s
 0ekZAC0o/5+ufgjPNFw==
X-Proofpoint-GUID: GNj4k39A7Gcq9jplJS3LOHDKu-KBDlAw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050185

Core already prints error message on devm_request_threaded_irq()
failure, so no need to do that second time.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. New patch
---
 drivers/power/supply/max77705_charger.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/power/supply/max77705_charger.c b/drivers/power/supply/max77705_charger.c
index 5dd02f658f5b..0dfe4ab10919 100644
--- a/drivers/power/supply/max77705_charger.c
+++ b/drivers/power/supply/max77705_charger.c
@@ -666,19 +666,15 @@ static int max77705_charger_probe(struct i2c_client *i2c)
 					NULL, max77705_chgin_irq,
 					IRQF_TRIGGER_NONE,
 					"chgin-irq", chg);
-	if (ret) {
-		dev_err_probe(dev, ret, "Failed to Request chgin IRQ\n");
+	if (ret)
 		goto destroy_wq;
-	}
 
 	ret = devm_request_threaded_irq(dev, regmap_irq_get_virq(irq_data, MAX77705_AICL_I),
 					NULL, max77705_aicl_irq,
 					IRQF_TRIGGER_NONE,
 					"aicl-irq", chg);
-	if (ret) {
-		dev_err_probe(dev, ret, "Failed to Request aicl IRQ\n");
+	if (ret)
 		goto destroy_wq;
-	}
 
 	ret = max77705_charger_enable(chg);
 	if (ret) {

-- 
2.51.0

