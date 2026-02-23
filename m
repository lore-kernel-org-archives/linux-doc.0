Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2043D34B683
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 07:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771831682; cv=none; b=Ny2ksHWKCAoUbGy7fU1EMpjU7mLcNLZ0hIeY0VxL3IJ36lLm6LY6ktYwb0eEcqVY7HcozCoWvhSSFAWsNiEqkC8Mn81hS/lQszjNmkqVAbUJLCtvuOTdpDjHx7XQ1olUyV7o0FWlnPKQSBrvBcj5TV1eqOX+FAqXQFUt6ojURsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771831682; c=relaxed/simple;
	bh=ESdCsaeIum29ouwuVQycaCeiYY4yOvrSCQxsV5yQYpU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FyvtUMr00Og7CxWnq286LJQfNr3CQ6nU8dSbPbhqcqOfSqCrbHVZdnjXoTHwHztzd7ZJhRZg0Fx5U59D2GK/otrBwZF5khx5Y/dTrJGLo/Pnf4uEK+JusYA2M3QlJvhNbiG+66v+UUNfMr6mKGcIezQUKL4tR0QaTOtvdtengEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=imRR7dQa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYRKFnsd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="imRR7dQa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LYRKFnsd"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MJvrAg1930507
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 07:27:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EKvU/PNxjAddR2yAhFrCBL4lcj3bDh4g/P+pXxlhagQ=; b=imRR7dQaLra0EmG/
	CLVgZzMTSjtFjvJGWsatrgZAxI4+8sXNgtBdn1m6ntzrKLeq9IoCDcJaD4E3psOG
	6JiFR1sLUNsl4jhyyPcb2jMWdYLw+O8Gba1KrBolfaV1Mxvk3w136p/s1b+JzTPk
	AU5y09iTzyUYHqPbbUQ2ARe3wymQutpxvg8ec6ZSR6cIjR5XtsDFRnYwDPw4WWF6
	5PwoXLBgw9oEHZYTw3BPH/V0UYAFGm340rZH25TN2XM+1m4fs5jNEDnrv4D7ISBZ
	D17OfkIqZG7l1taNVj1/E6iThifPdwIKFpB3KgEO4A53amQh1OXpdj2h1s2fNJMU
	fhRdHA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5v3ur7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 07:27:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-896f8dde688so433357236d6.0
        for <linux-doc@vger.kernel.org>; Sun, 22 Feb 2026 23:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771831678; x=1772436478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EKvU/PNxjAddR2yAhFrCBL4lcj3bDh4g/P+pXxlhagQ=;
        b=LYRKFnsdtULbM4uu4LY4GvqTvXClGtGLsDWaiT7+Zn1nPFRF0pKUQF8o2xM+h4f6hj
         EgwR9R4NtTzvdGrNyA1iB5SAosELXguPfL6mMhCqRwjJhpT7+MdxH2x87q0pyjwhZihZ
         EHWduhnDwQMOFHVP3pzZEf5zKrf7OW53O8o5QD5VWrlcZWFHtSpvSzZCsTMlYwaZEFnu
         RbGR0cN3XNE6vDFUXjB5RYiB64tEqkJbv5QBh8ekF1+lhpWJy6+k6riXFYRJBTRsb9+E
         dW07sGEYyL5+meiYBuAN1jbgUapd69H9z1icDojJy+37H66w+s5c9SAdniDgP6Rnl2A9
         Qtww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771831678; x=1772436478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EKvU/PNxjAddR2yAhFrCBL4lcj3bDh4g/P+pXxlhagQ=;
        b=sOBk3/6oKfW0o4HyEAFO7zg1wLkF+2M9WoTw5lg22Y4ana/X/a7GDQwXjrfpXs+sHV
         K7iE+ThQnxux2W78ARnsVMc4+BQYDfvXKBM7oEpPJO9K+bew5w+kUJ91RJYONoTNux/l
         Oi9hG+6pwD+l2MGLeUfHPjzDq5KXTJGYGwwAAOjSx2C4E6NJYO4s6pGVSFsu8atQikG5
         pDDeatXjMZ37tRHcYKWGHDrjC25swvAwS85zSXEqEJLOwvcJFqzro2JwiPp+DyyrzjGb
         JGcL1u0dI1H7rI6Q0CzpFePHeZEO6XSdMp/gJUckjeJh9Kz9XwJ8APrNaC2XpXIVikGg
         CzQw==
X-Forwarded-Encrypted: i=1; AJvYcCV/tC+itQqFbBDuUkkb7BG8JTMX/y4IBKoPKNsL2rfdWXjB3f/yz3EniVNzpaK8g83NUjmdP3sLTQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCgIVdzSNsRwWBga4VzVgY8h1dowW3JJphq6LOCU2sDZ3I3piD
	vljYYw3hPxLh/eCtNr/MLbXCN2tmsNWO62Kt6xRxRaiCReFOiAQbWYKThs0Cxyn7gFsXIo49nH9
	P20u+VMAudEjJ+9gUAZxhj0X6iMfOvlkXpehYA5Nz6ozIv/o5Qe/OOoIfTGcn+XM=
X-Gm-Gg: AZuq6aIg/IM7VUfoLaiNBWvRP3nRu+LAC9XoCO2Aao3jTz3vfB3rIjUJhjQAF5a+Cfl
	nae2ajVeKmH/H0OWZZIPJOFNDRESqMBlvidYjUTpvB++27d7NGAAe9rl8KBwRl0ozBppeddK70O
	C8KhZfkQhgXE3CBvcEI+pvXBXF7gnP/r1ujNmGWw04uUg+0pNl2B7luN5ej5a/VaZ9Nqimf44hn
	p0flB/0ODjCvTPSam6vns5P3HKK1CUXkI0wA2gAsBBDO3+0BJfTqFKVtnpP7/SGCMilKuxRZi4H
	/49V59WUf5pet0BwtgUE6VN+isdvxC/ZMVyyLdzn13Q1gOzB9qdgYGEAcz6SY0UO27MXNFFxwqV
	88VbG7voRfHpAMHj3hujqbXUjq2zkIDQ7nG0cOkxMHFmVwQ==
X-Received: by 2002:a05:620a:bc6:b0:8c2:3f3b:dae8 with SMTP id af79cd13be357-8cb8ca02729mr953887185a.24.1771831678588;
        Sun, 22 Feb 2026 23:27:58 -0800 (PST)
X-Received: by 2002:a05:620a:bc6:b0:8c2:3f3b:dae8 with SMTP id af79cd13be357-8cb8ca02729mr953885685a.24.1771831678191;
        Sun, 22 Feb 2026 23:27:58 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9ff5sm18550286f8f.4.2026.02.22.23.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:27:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 08:27:35 +0100
Subject: [PATCH 7/9] mfd: ezx-pcap: Return directly instead of empty gotos
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-workqueue-devm-v1-7-10b3a6087586@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1584;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ESdCsaeIum29ouwuVQycaCeiYY4yOvrSCQxsV5yQYpU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnAFsdVOSZjLWU15fu6tXhkyH5o/JBZijmD+7F
 xJuktpOs16JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZwBbAAKCRDBN2bmhouD
 11hqEACQeJWBcnOA0HqzOwEkeI7B9TgL3mN+MiZFvfd+qLHOhNAN5GPqKlAoYXkpu+ggDO0qWz9
 oYB5wpEIyViQz6F7P1BbSk7JDPJNPXtSO8eCIPGH1pBauIFXYzYhV8mSvy5NBR7mEMYSKKu6Ki5
 c2HHxYRYV34xSMpIrhaZh8QRVvQF+02ORACguJKiqALZysCqUV7Lssv6LmOneLzlHwOmppCNJ2o
 TB7ZxS4wPCl6edlbVzZrMMFQ1y+DfwdvIux3JU9oT1PriOQ+M1ocC9uh319Y9tCqJGVUBStU4+p
 SMFlYLPr0BTBAPNFFombh5ZS68gj4DqMJ6Unb/ZrUU/4jkXJNA681W6H59pOUOXo8QIziJ7gdHL
 yLif6Cex6xL/Ap+5oN2poWDdGsdcuj15yxkdz5lyJyRdBSslo4p7EGLMPzdeqY79LEwoqKafjAa
 vU3CpssLcVilmqPFQ3SZBwFW06aflTmZkGUbBUB/mUUo7I8VTS3SdhS635sblTp41z5mhW/xy0r
 vvKapnIZlD9rOw5Xxg19beyLy37OW1z/5cm0mAYucel1XB/13lDUq0v86dixoHMc1KA1qdQC67y
 qsmaAQwI4e7mlF47O+yr/jaCE6/Z8x6wiysP1jZxhoPdIGKyBILkDL/5cNMwz7/FT78JNlj7SK0
 pLo5wqw2dA4WDpg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=YL6SCBGx c=1 sm=1 tr=0 ts=699c017f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VGyNsPSQNFFz0_f43M8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: ftZmEpcICMRbIWqCDRoIgxdh1Qnj9UdQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA2NCBTYWx0ZWRfX2UbYGOUaYxzP
 Xm+nvGXQSK7fjLF20+Dlo5ifRC3O1a3PKSxWqOkXEhVtwyCDGi7nxw5f4Pzr/NOTgs6wtvVvlaR
 Xi3r6P/lGVirhJ/cv02SSWAsCi+j9D0EzqaTqwYitYrMzc5S7DHUO1Bmgv0X+eClmou0LuBpcf5
 Mq7ZZQWSE1l8R/RMuDXmz1zz4OEhCOUANTLErb7IEvkXEpNOPVnei+wr/ml5RVRszoN8GwobWoP
 RcLSg12Rgn+zXeaghxR1b2jrqI8I7kcAN5F8AvRwXCcK2gO9YbQJI4xahHtSTcVfn77EIq7oUGd
 MoYY2vG7ten4YoRABVAhVvqJIei8ygqi78DkCr1l4Pik1CaQH0LXvsKQMjGKw2ZhUCHm/J85ikL
 We0qkkOh0M6liVqUqy/RI2FoJHP3lwb5FSX7GarjZ4AKUw39HyC3Z6tP5lZz3KPY7+mCYa54wbS
 V8zoKIzICwdcztooh7g==
X-Proofpoint-GUID: ftZmEpcICMRbIWqCDRoIgxdh1Qnj9UdQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230064

Code is easier to read if empty error paths simply return, instead of
jumping to empty label doing only "return ret".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mfd/ezx-pcap.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/ezx-pcap.c b/drivers/mfd/ezx-pcap.c
index 13cb185638a9..b929559d84ae 100644
--- a/drivers/mfd/ezx-pcap.c
+++ b/drivers/mfd/ezx-pcap.c
@@ -384,17 +384,15 @@ static int ezx_pcap_probe(struct spi_device *spi)
 	struct pcap_platform_data *pdata = dev_get_platdata(&spi->dev);
 	struct pcap_chip *pcap;
 	int i, adc_irq;
-	int ret = -ENODEV;
+	int ret;
 
 	/* platform data is required */
 	if (!pdata)
-		goto ret;
+		return -ENODEV;
 
 	pcap = devm_kzalloc(&spi->dev, sizeof(*pcap), GFP_KERNEL);
-	if (!pcap) {
-		ret = -ENOMEM;
-		goto ret;
-	}
+	if (!pcap)
+		return -ENOMEM;
 
 	spin_lock_init(&pcap->io_lock);
 	spin_lock_init(&pcap->adc_lock);
@@ -407,17 +405,15 @@ static int ezx_pcap_probe(struct spi_device *spi)
 	spi->mode = SPI_MODE_0 | (pdata->config & PCAP_CS_AH ? SPI_CS_HIGH : 0);
 	ret = spi_setup(spi);
 	if (ret)
-		goto ret;
+		return ret;
 
 	pcap->spi = spi;
 
 	/* setup irq */
 	pcap->irq_base = pdata->irq_base;
 	pcap->workqueue = create_singlethread_workqueue("pcapd");
-	if (!pcap->workqueue) {
-		ret = -ENOMEM;
-		goto ret;
-	}
+	if (!pcap->workqueue)
+		return -ENOMEM;
 
 	/* redirect interrupts to AP, except adcdone2 */
 	if (!(pdata->config & PCAP_SECOND_PORT))

-- 
2.51.0

