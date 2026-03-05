Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4135235F18A
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 21:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772747192; cv=none; b=NjWYUKe063uryrUeO3PHi0rY46jj3VZRYiLU/mc9zo3RkAK8fLYhaBDo5MbTCxmdSe470/UWn9qZg5vsC+gHNOjYSv5+Q5XAfzf/Nh2NqwMyJZgfeJf7JSq8FfgNp6SY0NFJ6TmZqP47hlZwI/cY+wQHnIsh6bg/XyY5AwF9Tv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772747192; c=relaxed/simple;
	bh=NEUpXBPJ9dEtS2fWmU+0dR2QDjspzcgcqiZEmv2uSmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FIazicm6Q5uEA7rlgR4KG6HVlyNLBTsi3KQOH1TnQfPEw8MZ/6aSoOifUC3OGM8xVxDC2HbAGVlc2vRU0a7u7GiJRJEBNBfONUndCVoXbdN8vwNldMsPylr0oBrZI4kqS0lQaZ+pLGV/wnHuyz80IpSC5twk/LHISQbiDguZd0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hsF3iFgZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HvXZhPrH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hsF3iFgZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HvXZhPrH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625KmYbF1489060
	for <linux-doc@vger.kernel.org>; Thu, 5 Mar 2026 21:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pMdwalXJEavN6LV6CAE/53Eqg9eopdoniYo4PZb2D4c=; b=hsF3iFgZR3eFh6Ua
	8327APE3WHi8P+d6fNwAgOeZkBA7nU/f46nx0tJOzdK+dQl1mUb1mq1x+YiANJp0
	I1GuI4e/GaoeDdjwQb+St9rfI9y7MqWyBz4m5Zwmi6XUFeS/TwygmH++HSfneFeu
	xS/LQxdbaLeNZDvra23uALJ4t6q/5eQIIrxKq93g/I6j+0Cji+dm+0N7fr6xzTiK
	RNL3FSlM0VhToCUb5dUT0iKFOb6lqFDhv8glQwvmkyXyFgj2RHeC8McMjhTvQ3ar
	M+dNBv0iH6X1ejSPi+62L2hrLHgOQYxx9kKdsHP1E3gdJflQnXe09MMvi5DxJJbm
	OzwKJQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq84wa3yb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 21:46:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70e610242so1804039185a.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 13:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772747186; x=1773351986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pMdwalXJEavN6LV6CAE/53Eqg9eopdoniYo4PZb2D4c=;
        b=HvXZhPrHiq5MDhQ/EUWR7Xm3iP8iOn46l4sAKKvVJYHJGDg/kHQaS/+zgqjCMyo9jZ
         Tbn2X1a/m1iYjG0JKvStPrNU9/bFDYXLcJVy5qI5P8JcwExsP9y6M3wigucLeHDkj/zL
         bt+WChbpglwlEAOEZEwbSgtByOtqbM52GbIhsjt9rtm2NPACE/nlzyOhqfWqqy2Y82hu
         hbpub1jNMKpigREG7I9LyvJe9Mzjq3ofGu6nC0O4ZPs+e//dahlhqcmWEspUsHsLzKvu
         +SZ4yDV/gAVEGmVDbG8yqEWIx+bvNlUkM3LZd3AWneSsoLLTFdhojAKrAQ/ANH0C39T/
         Ehnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772747186; x=1773351986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pMdwalXJEavN6LV6CAE/53Eqg9eopdoniYo4PZb2D4c=;
        b=OX3+uroiaSC3WqQWhcio2S2PTU7P201F3ACVG+tv83NBzEtumUtJl7a4W769FbEtM3
         W9AghUYVN5Txwj/yVYQsGACbnnYoh9EHMnfzJwvc4ctozhMd4F2GvgBxhZ6P8MvR6Ga2
         Zb5KXmNDeIpfhUpz5uS9dab2yujqpWiqBTR8zHjslVa+Z1H9CYTfNHPKosPk6qKi5Dzq
         VYDeiT1izQNv/aqIdKAT+dZr3bU2EtSBNi24lcysxxKTXbPU/FY0Mv9tqLLdLJmhiygw
         qltwF+uGcuYJH5NDdsy0pwSWHdR7x8DfkB3WdC3oM5RD2JzlralwCJcV5jJFrQWXDvZQ
         f0JQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsQYzKa23x+iyaexI0+bc00qpey7Q1PAS3BPp2Ja39ibaeppBnocXckPamdSkAXGaa926/s1UrxcI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOEp4rDRxGqpo5UQpoamZ4KFh9prM6q1OlzeFXsCylY8IbQ6BB
	/p+ZPLm8+sG+bI//bk4rxkcsxt88kYcrZUJ7Lw7QVpx9L2WIc6AjbpHONbh1Z6L4x4UoZLsgj6z
	+OuH9NCEUflQPDTKFJSXH8bZb1DlpuCXovL2EG10bX3g1YknwbVgGIztnrCrFW0M=
X-Gm-Gg: ATEYQzzcFJlbS700Dq8aZRlTAfOn6DP7cf4fB2YM+cvIMXzSkxnHlxyjXPyeVyzlaNC
	lWIc25xtPr8ORF/w+PYDZv6+88DbRCsFvVivCkl9WV6rXnEVwIUayRXJShVX+A38ts9cZwkK+Bn
	TdT1MmPhR76dzAiyq1Zs5Hf0AT6DtIiKBSSIwkW0VJiB84PJ3yDzRydm4cKoZBAaFpLcEwjLCD5
	faOEZFs9lbZDNuLUkcrMpB2/eSLMrcHoE3kpeld5kqIvPnNth41pYgEKGo0KlF0mW1BRzRQfF1r
	JGBsTuN34zo6O/OAuw4geY2XQbtKXgTlpVsRl6pVqvK4flqfZkoX5EFV9f8OqX1U/R0LVlmFFmx
	7/VyTichw/Oh8A8ECoZyP4yH5vzw53UtrLzNRblsEPvNV
X-Received: by 2002:a05:620a:4482:b0:8b2:37ff:de74 with SMTP id af79cd13be357-8cd6d3ab314mr5796385a.34.1772747186555;
        Thu, 05 Mar 2026 13:46:26 -0800 (PST)
X-Received: by 2002:a05:620a:4482:b0:8b2:37ff:de74 with SMTP id af79cd13be357-8cd6d3ab314mr5793685a.34.1772747186093;
        Thu, 05 Mar 2026 13:46:26 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a58dasm28571575f8f.27.2026.03.05.13.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:46:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 22:45:44 +0100
Subject: [PATCH v2 05/10] power: supply: mt6370: Simplify with
 devm_alloc_ordered_workqueue()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-workqueue-devm-v2-5-66a38741c652@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1981;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NEUpXBPJ9dEtS2fWmU+0dR2QDjspzcgcqiZEmv2uSmU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqfmcNn3k3Rnw/2EcuO2yaMfih5Vsn0i/XXJf8
 SvINHHZXpmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaan5nAAKCRDBN2bmhouD
 136hD/9ALKD9SvFh/azG10v3UDLkpNlFun8cFPxOsqHfB7d5jt0wLAMJR5OL/G0gbo4oAOx3rZz
 T8YEb9fJN8jqmiPiXHZV46OJ6MX4FJxGF3ko3W56lIhjR/GbgdkU4oZZOUDfJjhKmjm52JL4uri
 Ety79GYKI8agwE1+zQxflWbPZ0ACvbgpu/gSfA1+uImrdNmJrXxnGczTKSzc6/cwKvrfFhRITfK
 qugeeHB6FJX98OI7B0/y5V/PxLS6HhXfQb28TXxpfHaQi2Z6At+ql1/SaeFX33rIq4NSlV1Z17x
 2AQUKGzGhYSQBFE9p/BHznlYMN4+YUsSpkilQJq1FLg50apjcVXWhbRdDTU/QlgGwiy/qn849+R
 bTeGbErLTERXzbcUgA0JDy01bNziJyp3zcwACGBgVCoc7HyfY1C+ZrrXs55ou4ZUTH74eX8e/75
 Bsj6LEgkgws/j26GPyEqX0tUEoKn4KYjr5vjMPiT3B4CjRnm2EIMQA+hd3eVIDLEF1Gx73S//O7
 P3uykwrUAg4/KbdSlO4x8Y0oZekuMvA0wECeeIsW6nBX/GLqql/R+MrycZ4s3CzNoILTJJm4VGq
 aqUNQtFjSZkEGtycfu9T0VqpOY1quTm3MSUX/d9t7UBo0mj5pjjRuYFEc0K/+Auqy76BT2ros/w
 1z93nTbelAT8enQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: zoAaLJSYlzJqxeEWbHE7H4X2VRPgSFQQ
X-Proofpoint-GUID: zoAaLJSYlzJqxeEWbHE7H4X2VRPgSFQQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE4NSBTYWx0ZWRfX+lyq99z8HRMO
 afcEd3ID8I5H4+3bXlUpQwe9rlj34ce/akYibwRZ2ii71VYGMefTO+ON89zB9Q/frDzHvo2+78+
 yvsl1BONBbdbYDILMFv7xDbTOa+lpZMvxeJZ90mWDwBlvTXXQdjRhOZGbze/eRIiOlaeKxw0cmI
 uieCV+exGVu8XYEEvScDkUwST0NqdYH8CXHRUwRaRL6ZIOO5AtxtzKoTe5Fz8Et1zArPKuQQX0q
 Ek73JxHstlpSRIQFNP0vRJlxV7tswmwHBNvZt1onMUhgZt4FdkmOraysBFn+4pkOnz+nwsBFQ8I
 tj0bbNl6ZJdH1SycA0zEAgitpJ3NroBV8bilIy8v9qjooEfIRJKpfXqODV3z2kA3dKSlIScltMx
 ZewnQK7rRwYtN0dh8YykcRxjlINwI+H0o0Pkmv2Hia7dg48PmXK4JrjMfEF9HK26FZZvSrQ/iPz
 PVi1I+yvtJx68yaZU+A==
X-Authority-Analysis: v=2.4 cv=N64k1m9B c=1 sm=1 tr=0 ts=69a9f9b3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=3EgDlKgDbQZu3HAsDPoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050185

Simplify the driver probe function by using
devm_alloc_ordered_workqueue() which handles the cleanup already.

Change is not equivalent in the workqueue itself: use non-legacy API
which does not set (__WQ_LEGACY | WQ_MEM_RECLAIM).  The workqueue is
used to update power supply data (power_supply_changed()) status, thus
there is no point to run it for memory reclaim.  Note that dev_name() is
not directly used in second argument to prevent possible unlikely
parsing any "%" character in device name as format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Use devm_alloc_ordered_workqueue(), mention this in commit msg
---
 drivers/power/supply/mt6370-charger.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/power/supply/mt6370-charger.c b/drivers/power/supply/mt6370-charger.c
index e6db961d5818..916556baa854 100644
--- a/drivers/power/supply/mt6370-charger.c
+++ b/drivers/power/supply/mt6370-charger.c
@@ -761,13 +761,6 @@ static int mt6370_chg_init_psy(struct mt6370_priv *priv)
 	return PTR_ERR_OR_ZERO(priv->psy);
 }
 
-static void mt6370_chg_destroy_wq(void *data)
-{
-	struct workqueue_struct *wq = data;
-
-	destroy_workqueue(wq);
-}
-
 static irqreturn_t mt6370_attach_i_handler(int irq, void *data)
 {
 	struct mt6370_priv *priv = data;
@@ -893,14 +886,10 @@ static int mt6370_chg_probe(struct platform_device *pdev)
 
 	priv->attach = MT6370_ATTACH_STAT_DETACH;
 
-	priv->wq = create_singlethread_workqueue(dev_name(priv->dev));
+	priv->wq = devm_alloc_ordered_workqueue(dev, "%s", 0, dev_name(priv->dev));
 	if (!priv->wq)
 		return -ENOMEM;
 
-	ret = devm_add_action_or_reset(dev, mt6370_chg_destroy_wq, priv->wq);
-	if (ret)
-		return ret;
-
 	ret = devm_work_autocancel(dev, &priv->bc12_work, mt6370_chg_bc12_work_func);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to init bc12 work\n");

-- 
2.51.0

