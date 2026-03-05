Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C0B37BE62
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 09:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704310; cv=none; b=NSY2cU0Z5SdZ7kcOdhdFexzQc+vNwhHPDiHlfMi2uZE2KPhd80gxKYW+RIHyE0Am3doVvi2KkqTG402idzjZA5M+5qrnCMzupTX6gQbOFmYm2b0RCIhgfY5XFHHk+LqYcM81nH8DyzUotjbDq5PQuKJT3P4Qw9OCiH8sawvBitI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704310; c=relaxed/simple;
	bh=asFRYbS+mWsBdMTNaAjlr1kv9Sq3WYDbm6irXLJp2J0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VGD/xfJ9DNvAHnVSWE3DZBO2AvVRwLrxqSne8hgulpfj/K2GN32QOa6CjvYrL+8Y2r7U9YNwidQjdOnrRGcMYHbD4UvWMfnqqQzjBLUepI91L6C4rQxwzNyN/GhsGWVgacF3ZJHqPcXIjMstUtcU3IZq3NXCKhVi3FoPV/gT984=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DE1at4dG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dqTNxfno; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DE1at4dG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dqTNxfno"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625971MD3665124
	for <linux-doc@vger.kernel.org>; Thu, 5 Mar 2026 09:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ExEz4/DFiPUvRA1okzAQrYU3w++SlZSrUbTH+yM/Ouo=; b=DE1at4dGMoW0MPoj
	fkTM1XPnbaXH9aOtii8tMvhXZrHf0+cANP9OsxrvjZFRsMmqGtC6L8yRzmPBUjnB
	0bZb4g/2M4jJQPf2/9OAno2qDzeFI6D40wtuqXeqFs/IHqUl0i5EPWUHZKVVIY/O
	rwgpXcQDFhXpr3mW5UQY8n1mS8ePYv+Gzhbt4XN99Bn0ELm7TbaP71qoS6SCnV31
	jWY2dqSMvz6jnGnZycfawLKRE/xFmFMQSaRxb4BxnUxtBzgNCexoCgiQkrPD7Q4U
	YZmDIJIaJJ+BTsntuEuxDhA/rTQ/TZDX+SSJXFWtfdeo+ikncpU4dYalpZCl/deB
	6/3fJg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq04u1hmh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 09:51:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4b8e9112so676568285a.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 01:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704307; x=1773309107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ExEz4/DFiPUvRA1okzAQrYU3w++SlZSrUbTH+yM/Ouo=;
        b=dqTNxfnolhchTXA7hTdZdD2yyQMMbHfy4UJG/6UWfolY1scPf4ttfhannRJiqPUR1s
         tuJtWa78J1voKdgkRFjE0t8rm+HJ7LqsIXtnslc0LDk15oo9ohRlH5IM+ODRfpTFUSPT
         hNUgS1VQUMuwEJoKkcs7wE2HPs7ch1sl1DQF59YXGuuw2C7OakWq9bWLxZXzhISdzSwO
         PYTYcE2SfBeoZQTpxeSrfTzqus7/aSEHHX42qsnX3kV2aWkcNIwezL92sNYiSJwkJq+Y
         GCZycB2bFe02UXDX+MdIVMm27ehRn/Qm9R6WRD0UUxSy1YnFyQCidhQrbFcy07NEwdIi
         KbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704307; x=1773309107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ExEz4/DFiPUvRA1okzAQrYU3w++SlZSrUbTH+yM/Ouo=;
        b=DSr1hmKQZb6vjGJ/F155ATN5dV/mIbIxQG/LOoM0gOZ5NACbj2QKhRqij0dsatWLPc
         Sw75Pkiwi4j/RMJ7z/FyYqaWluOS2LeB7PqhLL2KSDXTgVbBHXP43FKXRl/o+ZsauGu5
         0opjyr9dJJKtqhXoc4ow8lGysCQZhVD75pM9HHHhv5OkXsXeAIZ9fTUvNPp2YW0RwuY3
         a2XEgfznEozc55QCXUUYW926L6f3X3BrojR1kYtewxTQVV6S769fk4ayokr5+C9LtVvt
         V1zveGtEgh1LZeMnicl9fGxjLlXR11E549tod7x5HyFtkhK3uhUTHV/m0g54bQzNQaW9
         Cb0A==
X-Forwarded-Encrypted: i=1; AJvYcCUE6GdhFEIb0+x0hxakbDemDKzx8zVnWKdXTsqvr9BbeHCmMEm+E6/ys03SBUC0WoJacrlYG7NvWWw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbhmRkE1kfSxK+QRVw8lrmWlQv4EuSAeB2xiMN1yZvBzpuU6uo
	0NhhmshtHJkszJdYvdx4AcpaEHUmXRzSKgYcA1/4Oe25bsExwiuidBZ9lWWPLX+2Yr69wFRjaqi
	zuxN2WLoCKu79JahO9x3h3iFk1fHYdNk39cDFDG2r/jq7YQoWvmEapdLRGXocOdX2FPp2P1A=
X-Gm-Gg: ATEYQzyNpNl9DTDu7SeYOPml5IEOfXZIPckQ1fae24z0xuV5zRI+jtvVXVdkX2q3aAu
	CiGc1MmHnkIZE74tzv139g+ZIEm9mpD3oVFaALXBkZjkV/skztj6D76zhx+ISWHvi40pLFta3hQ
	tJbclOx/1kYFp3iZqcugFcnUXpw4DlXMYvOaSkwoN6PD+zPlMr1jbDa0FSv9bnEb4rK7XaEtePO
	jCGz3gVnQ/Yl2v/hBP6QIW74OZl3V2G0FW+8Yb0jzS4mOktGxMrPEvbzD5MEKtWjt+JlCw4ZNau
	32vgm0ER27TTriLj4GOzimBhLegBxBNTRZxZVpMaxNl9zcf3cJYM6Eu1RjWZGc/jLrM+8aVYnpm
	kIc0wVTk8GiXDqVvEX5nR/utV+Og6cWCKFFksf7w6rPoJ0E2RqruE
X-Received: by 2002:a05:620a:4405:b0:8c5:3067:903c with SMTP id af79cd13be357-8cd5aec446emr644635985a.11.1772704307389;
        Thu, 05 Mar 2026 01:51:47 -0800 (PST)
X-Received: by 2002:a05:620a:4405:b0:8c5:3067:903c with SMTP id af79cd13be357-8cd5aec446emr644634385a.11.1772704306918;
        Thu, 05 Mar 2026 01:51:46 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8314:9d33:34c1:88ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad1656bsm35598215e9.24.2026.03.05.01.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:51:46 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 10:51:26 +0100
Subject: [PATCH 1/6] gpio: of: clear OF_POPULATED on hog nodes in remove
 path
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-gpio-hog-fwnode-v1-1-97d7df6bbd17@oss.qualcomm.com>
References: <20260305-gpio-hog-fwnode-v1-0-97d7df6bbd17@oss.qualcomm.com>
In-Reply-To: <20260305-gpio-hog-fwnode-v1-0-97d7df6bbd17@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Frank Rowand <frowand.list@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-doc@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=asFRYbS+mWsBdMTNaAjlr1kv9Sq3WYDbm6irXLJp2J0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqVIpxm8mmJ89njb6VW6uBXMeoNjLVFgEK4G/7
 o5qRQijDnGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaalSKQAKCRAFnS7L/zaE
 w2ZEEAC2PUZMyFEneqHPYBmxvm7P6SHUaTj09ZmnewmcmRX1Ifjnh5Owxce4J2PXBfO51XuviuQ
 3ws20+W2Dijv0XJmzoq1nvGp5TLupbdjCSbyQJUFx0ra4QKROzaeuiDk1zVjKxOdxN2Mq6mWsI+
 ZlPluD8qWKSXqyl7F51SOEf2A3g2mZlYMooA4yXeYXW1/BdB42IY+L01RH+Dj1rJUAXyHEOQG+P
 U8Kfj2/UF8LR5XXWT5p14hdLAjUoPPQgXGTWwGykCZAQ87fvt2xofkwnYQvg5AfnJOtN3Q1z4Rb
 tAhCKqWUmyuGnM1cxyrYcmUwGyHxKu/JbGD8sHTiyhcr5/fNv0usioIXka1DEZ3AOJTQw+d8wmI
 I7GLTtfU86WrlAGhUm29Wiuvs3M2eoJzdOPwtCsPo8h/a+p8hTczNCsCu36zMJ2P3zBdQG+qK18
 4gkv7hrrC9HfvUV0GM7w8dzGf4XIYnh+G4OlakqRfusunUJEHOP02Qul78UfSEcXCzLbLigiuSn
 6WmVCIKsJ7XGLKM5Gbx39Qo6WlVAjrF9PYKHeyz/Hl8XsWUjEO324tHHi/ZbZFIYFqUcJcE7nOU
 cmH1y7X03mA+ecUrM2+7VkLkOq8SSkSK6J/0CKFWpOvOfbE5jfo7RPTULOkoh78+xaYksHk8Ma0
 x9BWcpJG25QWsnA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: ViVabgNOXR-wweNIQ_ZbcwNaHYp7BGF6
X-Authority-Analysis: v=2.4 cv=eqTSD4pX c=1 sm=1 tr=0 ts=69a95234 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=wIkqWORfvUmHQsOhi0cA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ViVabgNOXR-wweNIQ_ZbcwNaHYp7BGF6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3OSBTYWx0ZWRfX8q5WQKcJOuso
 OWF9O48ZKDvpCmfFe3WTQVM3SE2Fw2nuMbzkOynRmfAznakB8Wb8ZG2iQ+Nq7QkCnAiuAjHMXZY
 PMzhtz0MbP9RcsoIe7IOe49Y7cDeeE8MnZ+dyXjxFYW0CSr4WR/humztD+3Tz6v6HfoTP1ycFvX
 zLp5WHuFlrFWbbwcQb8ooIKHCHBlh2v2iTCrOIqJMNY+Nflm0Ex4FZqhGjKFu2LZxI+UsQBiwKC
 vb8H923cf2pkJJk+JppPUz+vn7PR34bC7Vss2q3PqeiQhA7q3DqnYbOcNaDdFztsNcLOIn9HOCF
 eS8CCIOD7IpSSo5g+7aE0yVaDa5kAF3KApB9yaMe5m8vArXksSBsDpXtXctZxMHaBrvU70B9eUQ
 pIvyQaapHbbk2OuNt5dKXAsY9+W5isjVPn88VpgyqoBGxnssMFEZYrbmyFxexl9MQmNDLeTTRLL
 UCyKHQKWHUEnIj5g0Gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050079

The previously set OF_POPULATED flag should be cleared on the hog nodes
when removing the chip.

Cc: stable@vger.kernel.org
Fixes: 63636d956c455 ("gpio: of: Add DT overlay support for GPIO hogs")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-of.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index ef1ac68b94b78f09e768cc740e893632b8817505..08b7b662512b825086cd70440be98b59befc3ffe 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -1210,7 +1210,14 @@ int of_gpiochip_add(struct gpio_chip *chip)
 
 void of_gpiochip_remove(struct gpio_chip *chip)
 {
-	of_node_put(dev_of_node(&chip->gpiodev->dev));
+	struct device_node *np = dev_of_node(&chip->gpiodev->dev);
+
+	for_each_child_of_node_scoped(np, child) {
+		if (of_property_present(child, "gpio-hog"))
+			of_node_clear_flag(child, OF_POPULATED);
+	}
+
+	of_node_put(np);
 }
 
 bool of_gpiochip_instance_match(struct gpio_chip *gc, unsigned int index)

-- 
2.47.3

