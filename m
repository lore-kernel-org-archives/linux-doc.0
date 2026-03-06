Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D0842B73B
	for <linux-doc@vger.kernel.org>; Fri,  6 Mar 2026 17:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817818; cv=none; b=k1w5NN8/CCgOD7IokVh1uCtEx3DV9ze+CvevJM9kSHIibj4Th5Ea16UfVoumvrXgVrjbHtNuVaBYyFe1M1SZcDG8wnvPgoyGfVYXf8jrFKl4L7/qX6PiH+DCMeUh/fkiXg9sEdx9/36/gNwOJ5kXUdyEsA0abKaqHtELXE0itCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817818; c=relaxed/simple;
	bh=WwdQB/HEMCiILXFdnsdSwGLYysMzviGgQyw41TjcHTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gD5+/tnIvghXJJth4d8jozjOFxnba3TE/soyeWqtWr0Iw+kFpFNCYSZFqmagYFwATpNiKzHZ2CWwFZeFmTlwZxttnXbh4HqBxgMuQUk4ywzblyaa8CKucIS4IbWpGV1xKkR4SiFQMyNRpTstDy0gnEwrvR2/OaaUQvmJM7Uk7Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IKLYi4tE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bq2wK8zu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IKLYi4tE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bq2wK8zu"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H1cS01343483
	for <linux-doc@vger.kernel.org>; Fri, 6 Mar 2026 17:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ucGnjAmJrAINhZPKAil097cu+BIB2nTNg2JRK7+n04=; b=IKLYi4tEYzNGco36
	nXrI0gzyS+FNpZrCV4t4pyoYB4ke9qvvl/7FQLAFzmEjkRNxU9pXQvSQ2KGtXcKG
	Ak1lOL0qsmO8tCgNnHTFXO2/ScMVLwlmyj8ZX9G68YRCkvoCgE6ZzkovMIaVlWjo
	TKfDMQ8BYgzEUnXyN0pMEpHlZIyl1VOx3bp6xeOwebTyXp6Hstgvgh4MmI2vviIu
	QY8PoAjxIMZXu/qKdoCyXCSLg25wHUcCwSo+lLt+qBNHXJsCIFsXF0xOXDw9XKdU
	IJOlW2w86/oGsV7JvuX5oJ5nKHtVjIfQyWYAMuqPpOU/whWE4+PMrHlD0vhTHROa
	VNfcCg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr2uqr4gj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 17:23:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3b6b37d8so4955611685a.3
        for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 09:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772817816; x=1773422616; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ucGnjAmJrAINhZPKAil097cu+BIB2nTNg2JRK7+n04=;
        b=bq2wK8zuj2d1PNt9ACsaiWq5BJldkmBPeBkh1RQj/+qZEMKVYZrDJdfkMdbpSQTNDj
         wA23W1rydMdlcm/fc7AUY81XZtX5+VHW+Xi4/SlmhsW8e8SHShxwJqddMh2+YRKK1ogr
         BWT9zsmQEG3S+f70soI+gGobH520a1oR9NekUuKOcRy550GYVmypenDoZRbZAb8Mm0r0
         3t0ZE9kvUubzEtVfIF3tS2QU0FJ6r48/tMLRwQ5TFufwv+swXfTmZp6fX32tyGtQjMJ5
         auqLoGmG3DdfVOuNF+PQ0h0I1uHe0Et4md18q4rObmpreA/Sd4fksjqzLPB3ftd55VLG
         x3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772817816; x=1773422616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7ucGnjAmJrAINhZPKAil097cu+BIB2nTNg2JRK7+n04=;
        b=Pye/9DmNfmjP2u4ZSEjA2McLNzJVtNuZ1obxHS1NBzb6Us5F2YfTtMEiHPUgCWkUwU
         ORmb6SCp4LY54nGFDCchn/La5QN3ywOwdmwWSdWJxe3a7KuzHosc/G4IVo9p5paRlR8p
         hP8pb2z51OJgDrlZPlYc/Y1HLtpkbR4rFXzgYEIooLxGVEp7BnPWR1HyTIk7GQoXGZtU
         +wbV0VBQyTK55Xod77gP00NZf/SEKO1NgSaTS1OfYCEKl50p8MXts4Vs0/qyS7jxSc3g
         jny7kyaA/nOi8mGAxcxzJv5SiL+tJ2j2h4p8jr286F1iYJEwlSIEXq2rvHcHSerQ0sVP
         j9Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVhgEaBt3Hgr3wroKWLi3ZZ6gnYvL+Ey1FEzdJ5w2Q8RbMBo3DFrYXbW6PvPRJqZn3kXpRHRZ8Z2wk=@vger.kernel.org
X-Gm-Message-State: AOJu0YylBy8CAepfeKfP77y1+hHYZ+rJwyuOHJbnbS6y0yCXLR8sfBON
	iBmX3GZhDXKGVxLRkHbhuB8OaL79F89AVO4LgBju00ZOnWPTAk9oSl9TULVDP7Kwt/9W0EyufdJ
	NH7QKqMMAgkHLgfg74tyMR8lWdM1GeJDG3zsgb6YnADeqNhS2FRja+03In7GBn9w=
X-Gm-Gg: ATEYQzz7sDzRA108Sl58zq0SPPWW0ePycKXevET4FrROOwqAhq0Kc7nQS3XfVVwnjAw
	A4PIhUThKOVpxY0zNij61u+UqO5mQovSEpaSy96T1GqDLyizzx2AsWRiYj34s95bJXvGxDzOcG0
	67igfGlNoK9jHt0A3tA7IHT64g0ttSnLEm7G/2jfjwRpbvgJpF9O5TUYJodriVNR1eIvS2Y4hp8
	pQY4LkYMw0KF2J/YDcbPPcy6B6OhzP5kjLsfCz3no68KBcsXgxr5kyUxorV1C5WHD7nffj/6UxO
	8J/du1ORibSdVM7qPw4g2bMcK2DjbKqGb/fUwVSAegIUGcU1JDKL/rV1+D9p+LDBbvR9ZI346Lh
	muArxmDSAiF09cTJSFRSf1334K+eVDuBTIo/AnowJcsa0VXQmNWAX
X-Received: by 2002:a05:620a:4404:b0:8ca:3c67:890f with SMTP id af79cd13be357-8cd6d531b85mr357220185a.76.1772817815785;
        Fri, 06 Mar 2026 09:23:35 -0800 (PST)
X-Received: by 2002:a05:620a:4404:b0:8ca:3c67:890f with SMTP id af79cd13be357-8cd6d531b85mr357217285a.76.1772817815269;
        Fri, 06 Mar 2026 09:23:35 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:28b1:4950:7702:bb20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527686fa9sm61488475e9.8.2026.03.06.09.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 09:23:34 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:22:58 +0100
Subject: [PATCH v3 14/14] reset: gpio: make the driver fwnode-agnostic
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-reset-core-refactor-v3-14-599349522876@oss.qualcomm.com>
References: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
In-Reply-To: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, brgl@kernel.org, linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1683;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=WwdQB/HEMCiILXFdnsdSwGLYysMzviGgQyw41TjcHTg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqw19QdSWLo58xqzPbY3E/ZW1lcno/34jhW2o/
 fcSZCmGAt+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaasNfQAKCRAFnS7L/zaE
 w+4UD/9VIDVGnDP654XCvQOf/uPEmXjhExA6w/r6cIYLJEm59omPj4vHNR9S3pMbBaw0L295c/m
 NFS6W/TE1w8PpNsZSPdyhz5rzMZavFTzBQQ1s7Jhiz/P7BMnclSAPhwgNbj+RaHzSKgBTC3PTX7
 NWL/qDvibwY28uJHXO8XaX5/kuO0nOnRs+jt5iG3ACSs8exvFA2FBXGw651ruifXsMsMuzZIuv4
 d+bBTJo4t9wZ1Ckph1vwIWVsU9x9YH+nh2v6wyzrdBbXIoUgmF9dduQSXA3qpQm4pDjxz0yggC3
 dqGkkVNDxPYKcuIv0iQaw9sLLNtY0c7MLv459qoNJ2/OIlsLQKPJWv9PHGeCRsGpZwgQv0KQknq
 DQI10TAB34WddDTFn3pWDSVofJ8stke8GrOYHJOzneBxH9NPJisFNR1j+PEL5GewaRm625jzrxV
 fqr4b9PauT9lP9rFknkinRi8pplt6Q7dsaVdbcNJo58VMUyk0g/PQnGE3fYBU5ap8eY6pZkcjp/
 y0biTJLkRg6NIar0YI+St5Px6DOUb/FhI6VTGC6fC9d23/SXIW+oHcssf6ey1WITJeMWCPIIQsF
 JgUOZEe/cWnV3rCLWmSfXHknNLpeSWCuMICKS+9alvVwQp3fLnLzB68mk2++msLxwJXNeGpEjCu
 U35+ueygxsZR1og==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE2NCBTYWx0ZWRfX6SX3j6wRHFaz
 OuElremPb9XRuC0rj6Hfzve7UjWZ6dJgBskjVjF8QqaYidV2IkjSfGR3sxbChYiDRrw1MAN79rn
 E94YGigSgrJ72TS9+ZGLmPuT9rhdtOKhli1zcB17A4s5sVqRbWazymWHEailmBxnFRK8V1W9aqY
 tDUH4B/UWjZqt2ATYMVZ5RM7nFluQuU4nSq4CGXDrvX5ZJebTj+6gBB80ChHSjqp6fYiXxgVEde
 T0pDviuFxKIRl4ECWUMazbFpBSYK4+3wamy/7pilJNYkJZRlXrvthUpoWz0yZEdfoPxkoctjJo2
 yUHakmdoQhAIYOEMFeVWpLV0psvBbj5MFppJBQBZE+ya62ByYQK2ALMsI19fCNyT6ObD15pQBQB
 iMgUH1x0yANb2+NabFQOKrVxS2xQb5LPZTKC2u4sgngMSP6mT05ivQ/LdNyVi44higVCwcbH9qK
 Hwy9uwGeNRIKvdQs9dw==
X-Proofpoint-GUID: Y7rIDeTVVQ3TsFLP4mEmG4R7m8gH0EvZ
X-Proofpoint-ORIG-GUID: Y7rIDeTVVQ3TsFLP4mEmG4R7m8gH0EvZ
X-Authority-Analysis: v=2.4 cv=Q+HfIo2a c=1 sm=1 tr=0 ts=69ab0d98 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=3hQubXxqK_WyehwcTsYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603060164

With reset core now being able to work with firmware nodes, we can make
reset-gpio node-agnostic and drop any OF dependencies.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/reset/reset-gpio.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/reset/reset-gpio.c b/drivers/reset/reset-gpio.c
index 5044f809d0e59a08861597f4aeb685e95328c2af..26aa2c3a2e689385ffa6ac056ce8787518ea4376 100644
--- a/drivers/reset/reset-gpio.c
+++ b/drivers/reset/reset-gpio.c
@@ -4,7 +4,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
+#include <linux/property.h>
 #include <linux/reset-controller.h>
 
 struct reset_gpio_priv {
@@ -46,8 +46,8 @@ static const struct reset_control_ops reset_gpio_ops = {
 	.status = reset_gpio_status,
 };
 
-static int reset_gpio_of_xlate(struct reset_controller_dev *rcdev,
-			       const struct of_phandle_args *reset_spec)
+static int reset_gpio_fwnode_xlate(struct reset_controller_dev *rcdev,
+				   const struct fwnode_reference_args *reset_spec)
 {
 	return reset_spec->args[0];
 }
@@ -72,8 +72,8 @@ static int reset_gpio_probe(struct auxiliary_device *adev,
 	priv->rc.dev = dev;
 
 	/* Cells to match GPIO specifier, but it's not really used */
-	priv->rc.of_reset_n_cells = 2;
-	priv->rc.of_xlate = reset_gpio_of_xlate;
+	priv->rc.fwnode_reset_n_cells = 2;
+	priv->rc.fwnode_xlate = reset_gpio_fwnode_xlate;
 	priv->rc.nr_resets = 1;
 
 	return devm_reset_controller_register(dev, &priv->rc);

-- 
2.47.3

