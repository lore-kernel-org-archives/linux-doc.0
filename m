Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F9F34B682
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 07:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771831674; cv=none; b=on3mM1MWLIcHiV3Lg1SVN+uQjRfXryiZHJ89+xGLwVrV35GUXZF0XAkXuNaFijoHaGCmLdj7BaL4bSZQU7qA/xLrYkUGqVfyp6Ux5t01jZfQykecu6ufRfHHZuQg6JvftK307lBLdVHsQlqsc9gfcXLMajmn7veZTig7rxxSm60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771831674; c=relaxed/simple;
	bh=PuW7vlRiKBG5VvIHCjRT7mt2DV/SLWGdgcWu/vmtLTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iPY+zNo0SCUkIz4nwNcAbAZlUMgLodUvSW8RRjRSXpFsWKbdcfSFr3PmwufdHTECQxxL+3Q+OygQxizrr+t1FY/1Dqeep4WRxKgGQAVqPFhtq1QyfaIMQoaSNPUDEJCrILByo2t+fkEnUlTBx9JU3OHUVTuMVFGUpnsdsuDwSuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AhVNzKi/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NLbGHVjl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AhVNzKi/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NLbGHVjl"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MLET561750344
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 07:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5YOJJ2aXA0BEB/msmbEifF3HLLVOcCnZaBxJ0rWPj8w=; b=AhVNzKi/n41rbMtm
	bJgATnTFIfFxKfHJ5a4WVIV5+HHTe8orLjZ7KAno3WPsIvsPXCcEn6lo2+S69uzB
	M2i0Kicl8APo20JMse+4x4D9AOlSYN8ESi5rtS6g8AwrElhexSIzNnd7rsCcSu38
	ex4c2JICHfVu9jBgCqirckqKD6jq5Ip90iOgBaaVKYaqnj1c5UIh33bRuG6Ajz9O
	6qYpdE+1S8agq9pQd5h8IXySalWBph49742vem2av3piY5nbjVVHWDeQVRB9Nrgf
	af50ETrukk+Q6rR84ZOOLDmYYiCubub2e+koxbd0ph8cxUFh8xiBrg2UH8cueYWc
	Ssgmag==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wbbry8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 07:27:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70cff1da5so3389322585a.2
        for <linux-doc@vger.kernel.org>; Sun, 22 Feb 2026 23:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771831671; x=1772436471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5YOJJ2aXA0BEB/msmbEifF3HLLVOcCnZaBxJ0rWPj8w=;
        b=NLbGHVjlf6qugvOYnWdryN1RqLRvCvLmgwHN59fU+r9tiTPUrQ9vF0P0g0+SPKaPMM
         yA7WjeVvE2IOhqN4PqJzKL2Vnj2bfBVfSWGxYr43rwhgdQONpuoMEfHSRqq5ZXjdMtJr
         m6dROH/DXBCLgVreiGa/AwPY97gKsu8gEIkr33rf1N19w+GlqEZ6cRtiCxY9sln9cbiG
         Y1cRJcutB1qWYDTFuKeU5BEnxlPN9tOYNwEw0bVxfPt/3YAew7b1PCQxtnUTg7LK7aTk
         DvtZxbhdHfjwlEFRTS7H9v6fcduvWbspDOUUXSGL2slnqcC7MSWRnX3sDw46tF3xuac/
         ltqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771831671; x=1772436471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5YOJJ2aXA0BEB/msmbEifF3HLLVOcCnZaBxJ0rWPj8w=;
        b=kkejBFMR49Lk1O2FU7J2sJCIlGJKcrO0PQs2fb9Kq4GlETsR8fjmEtofckxSJ12hIs
         zQvTT5AN4cs7WJJQbzfASgfTusjyBdGS6corcmBgRJLdZa8YlZzlIFg+YyFsWpzBpKan
         6VNXi0iK7AzidvXGQt0hRFRBN29njcYXien540dB+bPtbTV9lMW1I0PVFkDKI7j6e+UA
         ygh/eM2KjhFzOPoH1FWR0PsTcnSgddbV5tgyF91XHQPVjvLVK7MrqDWBe80MCVfUMeNK
         3Mz/0XN8eiBT9URtsEc0w8ez1e418ZRNpPYby8qHpB0AsuT9RqmlLW4c9RQwjQEY13gi
         Lrrg==
X-Forwarded-Encrypted: i=1; AJvYcCWuHcUSVfDLI3rzKjP20t79Qsbj94J+BGUmbVOysd8LctuzAfhVRIF09ImPrsVdOyze/wgJVBWOWyw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2D+3bkOD5FqkcNLF0nPybQHs2FZgHufSjMFHz9FPyv4UqQBPV
	Hjf0l4/9/Req83BKpaJJKILas+N4T7wQGp1hXIlzrh2TaIHKyCy/aM3EVKTIeNIDMW0X0ULx+7H
	NnTCfGMBFHetXFKwvEelTpBc99Mrg9O1eKzWodHg8ojEtG3yh27MY4LBZQ/dbtuU=
X-Gm-Gg: AZuq6aLzGSisS6V8jTo0Rs1iJFyGmuUAIShw3F6yT1gtnW1Lnd+HcbXYLEf4wTNbHCI
	dEv6AKhsC86W5yeh9EwHNBJ9pTBO/hU1XAQ6LAOyCKbPS91NXPzooWaxIiud1bT/k9WHifUBbBm
	yNVi6B78zjS0XfCruYASODUWFPB8tJ37Q+DPLG52ZGjyceCwo5LoGh86KNtXEJLKAZZKEExUM0a
	urgCsZ1tTJydm/3aVx+HEX4bW8c2S+uS90eDulzFsoKpQN0pQmK3nveokqniLcj2UKheapcdJAw
	8ksFnF1xFF275pO63UONlkW6XmFAcr3rqiQbnmc4+PS6f6UI+LVGlCtTbUPPHIUNEO8SLlcfOXB
	mmIaWPHiYkPytMyh4s1Pun8Uqq0sZPM6BOvKN+nJmoZAtLg==
X-Received: by 2002:a05:620a:2994:b0:8c9:e98a:d9f1 with SMTP id af79cd13be357-8cb8c9fe5a6mr1011978185a.30.1771831671278;
        Sun, 22 Feb 2026 23:27:51 -0800 (PST)
X-Received: by 2002:a05:620a:2994:b0:8c9:e98a:d9f1 with SMTP id af79cd13be357-8cb8c9fe5a6mr1011974885a.30.1771831670712;
        Sun, 22 Feb 2026 23:27:50 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9ff5sm18550286f8f.4.2026.02.22.23.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:27:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 08:27:31 +0100
Subject: [PATCH 3/9] power: supply: max77705: Free allocated workqueue and
 fix removal order
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-workqueue-devm-v1-3-10b3a6087586@oss.qualcomm.com>
References: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
In-Reply-To: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
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
Cc: driver-core@lists.linux.dev, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3319;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PuW7vlRiKBG5VvIHCjRT7mt2DV/SLWGdgcWu/vmtLTg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnAFo/UKzNCc8KS1w39QKA5O4bC7woFna1QIAf
 BiaUZZ1gFmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZwBaAAKCRDBN2bmhouD
 1+EED/9RkN0mxPd4BItqsLJ3y1xwAvEJApbWLIpmsMJXLty2XG8gkwjO8hplcVmzFYS+iOGPsZj
 aPSAVj2pgSAUt12aoLw+ajNWfgCUzP7nsreSR3QFvNiFQf5rQ/wuCbRl2e6IlMc+i5McriHEnrd
 bn3OdqIahOkjSN2RSB24KS/ejjWMDLFu69ADWjuiFRRia+TILRWHGMqWjgawoOLvZPPHgMLEuuR
 zcuVoogWJCE3DW5Wti2+nzH1ufXTdWzHu3m37OrR1ddxunY7RYs9gqBHCDZrGf0DkJnEhBtfUW9
 0IRlqNW+vrhKw4ggkuAe6KpzRUXK+Vu4wuquJBbJDwOSErn90S6sv5DwZPwccOz6O5/2HUAEn4p
 75WRc4EDngZ6BirtmvZ6V6FON6OABNiwAQilzGnyrXz2wTf31hPLCPT8wyTsYkINffmY2/OY5Bf
 NB/DRkDRPUxLp+3wERhCwqCqB7+B7QAKjK2CjdfXDiRFJIsKn0Z/fyVxOdFCZiJwXQTos27zmFV
 tl2P4mW9+CyaKoH7bnw2IulsbIYWkicoDpPc4BlqaIt0iWInuAJMuVG748eqTphll4FFndqFk+o
 6ga4pYKmERVHVmgSCqopHYyvccnuvgznBMZst0XYRfruAygHMVgeyT0VFowKtI6dRsCoIncJh6b
 pQwLQ3EyvLfqsXg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: zcZvugCXiMlaJk5zxsWMvaRoE7ZT9qmh
X-Authority-Analysis: v=2.4 cv=UZlciaSN c=1 sm=1 tr=0 ts=699c0178 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=NrNmjpoQ7DW6B6PU5UcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: zcZvugCXiMlaJk5zxsWMvaRoE7ZT9qmh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA2NCBTYWx0ZWRfX0T/D3EIsxr/b
 W/4Aa4rpuWY1BnJJO/saWMlkf61yJtBLJ5eJbAelozJ9DU6UAPrvhpQCaK0nKeY4Pzjs2h6MjaA
 y43tcok5npYkh++OJm7iOpbxngTi9YycZoodU/5OK2qmY1iAxFQ2mtC0mCCNRekbqavhlQn5mWX
 LnRYwGgbAQjvfPo0QGb4/xwjM2gfGXygA791Pvbs5Mjoif/fl7ogENj15ls7BG6QFxpGxGLJlRv
 9JB6IUWWtH3w+X0O0xetaYQJWG9uKpqhy2Umxs97H5wO0JCXBSYKJ+SBqXfoSAsU/6mGWl6G0nm
 ndjxPx2PmuuTj6yGZ8SBxJiD8AhVt7kl6DmNqVC3GcRBDi8imj0LbuqL5gRuE53l28lylONQV0E
 isBCSbFJ7aliAJP4fID6vvy2yZAlv/184gGr87Lc1gKWbWlV8z/pTVSa6shvv3mqDBn2e9EpuEp
 hcj7yaYapd4n0JLNHLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230064

Use devm interface for allocating workqueue to fix two bugs at the same
time:

1. Driver leaks the memory on remove(), because the workqueue is not
   destroyed.

2. Driver allocates workqueue and then registers interrupt handlers
   with devm interface.  This means that probe error paths will not use a
   reversed order, but first the destroy workqueue and then, via devm
   release handlers, free the interrupt.

   The interrupt handler schedules work on this exact workqueue, thus if
   interrupt is hit in this short time window - after destroying
   workqueue, but before devm() frees the interrupt, the work scheduling
   will lead to use of freed memory.

Fixes: 11741b8e382d ("power: supply: max77705: Fix workqueue error handling in probe")
Fixes: a6a494c8e3ce ("power: supply: max77705: Add charger driver for Maxim 77705")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/power/supply/max77705_charger.c | 36 ++++++++++-----------------------
 1 file changed, 11 insertions(+), 25 deletions(-)

diff --git a/drivers/power/supply/max77705_charger.c b/drivers/power/supply/max77705_charger.c
index 5dd02f658f5b..de12c215366c 100644
--- a/drivers/power/supply/max77705_charger.c
+++ b/drivers/power/supply/max77705_charger.c
@@ -646,51 +646,37 @@ static int max77705_charger_probe(struct i2c_client *i2c)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to add irq chip\n");
 
-	chg->wqueue = create_singlethread_workqueue(dev_name(dev));
+	chg->wqueue = devm_create_singlethread_workqueue(dev, dev_name(dev));
 	if (!chg->wqueue)
 		return -ENOMEM;
 
 	ret = devm_work_autocancel(dev, &chg->chgin_work, max77705_chgin_isr_work);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to initialize interrupt work\n");
-		goto destroy_wq;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to initialize interrupt work\n");
 
 	ret = max77705_charger_initialize(chg);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to initialize charger IC\n");
-		goto destroy_wq;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to initialize charger IC\n");
 
 	ret = devm_request_threaded_irq(dev, regmap_irq_get_virq(irq_data, MAX77705_CHGIN_I),
 					NULL, max77705_chgin_irq,
 					IRQF_TRIGGER_NONE,
 					"chgin-irq", chg);
-	if (ret) {
-		dev_err_probe(dev, ret, "Failed to Request chgin IRQ\n");
-		goto destroy_wq;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to Request chgin IRQ\n");
 
 	ret = devm_request_threaded_irq(dev, regmap_irq_get_virq(irq_data, MAX77705_AICL_I),
 					NULL, max77705_aicl_irq,
 					IRQF_TRIGGER_NONE,
 					"aicl-irq", chg);
-	if (ret) {
-		dev_err_probe(dev, ret, "Failed to Request aicl IRQ\n");
-		goto destroy_wq;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to Request aicl IRQ\n");
 
 	ret = max77705_charger_enable(chg);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to enable charge\n");
-		goto destroy_wq;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable charge\n");
 
 	return devm_add_action_or_reset(dev, max77705_charger_disable, chg);
-
-destroy_wq:
-	destroy_workqueue(chg->wqueue);
-	return ret;
 }
 
 static const struct of_device_id max77705_charger_of_match[] = {

-- 
2.51.0

