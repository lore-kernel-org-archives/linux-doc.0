Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED58335BC1
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 14:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766500057; cv=none; b=uEyGwA/hrV6oK9AlZcX0dJz0dO48jlzuj4YXceAcDSrramyjpAbDnOivzkT3KVKj0fuSW0LeAIDUPfPh/5WUSinAAWb/pRXNsdS2KK/pv6lArhVsShpCyDdFUX0hDNJU3W1bbnFzH/qTfIyVbp0SKXddoqwzHMGMghjnpwqbdio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766500057; c=relaxed/simple;
	bh=8d1DDUBn0OgxirOWILF6DGTSvv73dIacjmoQNFthptY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KLEiyTjC9VHyVweoqDVl3F52khK6+SbxgYDVPbZXCccpZBpS+kcowkOwjzj7Qy3YG+EzCuLvUGqhFgo2ucJRzg7gcl7H/8+Qn/acDq0QBgryWOVAzgjffUYA3Bi0t9Iq4Le4pH60zOz/JOfnBVWe2DRzlDQEGUzNMW+o78VIaD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ts1aGRhf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NEyghZXm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ts1aGRhf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NEyghZXm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNAWf8x1529028
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 14:27:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mnNQYCjDT2I
	KwdufqcfSj1JgwQtQDYPlSNzciZd9v8I=; b=Ts1aGRhfiaAVeQUqMAEzULUH40M
	qty/l6zFIx15nNMAVvQ0BAlJ5rhNpmjTixKsc4Y0Dk8Awjl8sJbtSyK2BwqQ5ZdT
	YxpZTH1sX01ztcOm0Nw4hwrUzs0qzLHftMImAIH5C1PgF+d/aXQVpVajPLo1cRbT
	k57lfTpRN2ekwFs841bfi0ybBb7B+5TiySjajpqr70PPXc4fwFo4Xoen4wqCQmOP
	fkSntDIfJQLTGKmLS02z1suoIEGILpZpjdk08OQCzjnlefSjyAQPBHS93MO3XBy2
	MxXanXI1yXsJux0+/hBEbcE0MZVv4YmU6KzVF9noc4MMUBXStoLJBXE7sbA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b758y4735-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 14:27:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee0c1d1b36so132841131cf.0
        for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 06:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766500053; x=1767104853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnNQYCjDT2IKwdufqcfSj1JgwQtQDYPlSNzciZd9v8I=;
        b=NEyghZXmugsvE8JI32uneuqyexwyjNnuxvs04eJYrfrlIA8gg1kcQw0st5FEMBYb+O
         aOJiYXTtUhAiNoQZIfSt3Zx+ffsYvXGZvXZ+0zTKAElI3at7YeGHc1ufYoUpYJ6CuzgE
         IRbdN3ebophp0dmNz7kwsabejp4Yt9S4Asm3PE7U5+k/gaDGqshEIHX2T4SOhK2hvSsF
         oY2U9QRoh6dgjmZ4BE3ZfuxAFLwcZUlXrmVcMcNnG95Pa1CC8gSAyPgyvjSUYR2/xBwT
         hh67hk1SCXXOVkP/q1wenN6FhE781Lt+U+YNUc44BlzBUc4pja7GwHpx9PPcoWgHnfig
         lhig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766500053; x=1767104853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mnNQYCjDT2IKwdufqcfSj1JgwQtQDYPlSNzciZd9v8I=;
        b=TjktJzTgW5f2gURpFoaKmRjFKaWHAhxzI5A0Yu+SEHU0yWS73UZU8FFzhHN632kR3F
         QQDmhN0Ry4o+Tz8a/zThufh/XrqXyUybikTE7RQUOqacAu3F9CZ7yE2QAAgP6My6Y66p
         FFxvlNZWC/F0swX19Prrx4Tlr/x9H30X0MOHpeHvEFUaaQYXAbsayxju7SdGIgiJTPHq
         09UYPMRM6EqJqe7/OWjGk04GrzdDDbrJteMaC+9oocqr49XFA1VUjhDD6PBualVoYtum
         gzeS39mA4nbUMXceg4EVMl25GuAuK659PyHSZPj+YX/+UrneRaGlossEhokDjJez+xZR
         5rZA==
X-Forwarded-Encrypted: i=1; AJvYcCVF71ZkkCnkv65/iZtWiqtCNJypIU1FGbRLwaByl+c9Z9ZGpUQ7PZRGkqQjQXsyc3ZDwALWr2Tb/Uc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUX2DuS7YDkxQyJtCvO1qEvmFh/tfHDy1e6pUHUJBnAs7IIpVD
	eC0D4sUzPmMAd6R6kAWmUw7N2IWxNhluZvGz5bc87vCIcGqaa74Iddgl7LMhxztFv278UgZ+1HK
	CtgHVsN6Z+YhC5MR6cYNM8jYg9DenoAKv1Bnasd8yYeuh/G9RSVMtRS6kLJlJqlg=
X-Gm-Gg: AY/fxX4uH1jqqy6ncTm+4Jd/R3K2ljezXsKJM6sdn5C9T5t0kEbeRpOmdkbrpjX/rPc
	hsBiFikKg18bAQXh6WcZyR0FTteMJO9MOfj4wuDA7VQVTOZjC10UniecO+8NeSq41x/mgEyuORV
	oPBDdW4J2dY9mY5lgv5nbz6ft+5e1kYOKwCW9onw9X5HUMlENPcQwZAs837Y1a4Ozty1d6vOyTa
	eC8NJj+G7yyh6pCeoUykHhN7X8W7Afma3StP+K2D8KrThY/iqqmfch03IZntaJRe8dsFOFDoxdA
	Pov0IvRrHfp8UYD0sQPYzN9rVh/J2w4pFEUGctVLpRK6qawIR+/QcNxXL+46fSu4cKCgXe+Fgtm
	5aEVF9PMLOZwkRtGUECVqeLjn8S1ydtsQeU54z8/hK/Bx6fX9OX6lIy2lWFkUBqt8Z6s=
X-Received: by 2002:ac8:7fd6:0:b0:4f3:4b53:a914 with SMTP id d75a77b69052e-4f35f3a051dmr284385861cf.9.1766500053153;
        Tue, 23 Dec 2025 06:27:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEsw8TOhjv6r9nZIguPFmBTZYdBATYu2f7Bi6Z7slZabfblusoMn6hz2QsbZpBdFgJjMJP/g==
X-Received: by 2002:ac8:7fd6:0:b0:4f3:4b53:a914 with SMTP id d75a77b69052e-4f35f3a051dmr284385491cf.9.1766500052737;
        Tue, 23 Dec 2025 06:27:32 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ab4f0dsm1436477166b.15.2025.12.23.06.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 06:27:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Drew Fustini <fustini@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] Documentation/process: maintainer-soc: Mark 'make' as commands
Date: Tue, 23 Dec 2025 15:27:28 +0100
Message-ID: <20251223142726.73417-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=8d1DDUBn0OgxirOWILF6DGTSvv73dIacjmoQNFthptY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSqbPfVIHImHavp9Q4pi4X2H2aagN44h5mmn/o
 WUYqpR+7byJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUqmzwAKCRDBN2bmhouD
 15CjD/9zFz8j3C6DgK4c5gqpuqozJOXSLhiVpHrkZwu13cXfBtu687NNnO62sgKoDnmJSgY3jGS
 7TKC1tYhbkXa2y7LlYqwIR9AGqSZYIilY3tQgEm/mNhNNpLjvqlDI2jlM3Dz3RjVcnHhYPB7UmE
 HoH6F9QPAkYYSgKAlVbuO1O5WDuQ71vDzgfAocj/Nblq/wchctMoQYwHqLxQnf2HuhgjhelkVGa
 4QbZr32bHUPLha0Mrvc8blWj0TzC9IQH0lIAFaiHQloC3uBd2WZi6CiiP60R03a/6z4pr1O1Mum
 KW09CGeJWmUBeRJPi5CxXLve+GW74XcABup7kTaA/CehiLucCZ2wDSI+Q1TQBlDNfPH14lex+Gh
 xbyCb5GL2vorCXws3leX07vjVTPmhg5AZUwY7tPDrfSWCmUXqVgDwFkw9+nf1/bsrMlYq8+qQbf
 CJ0erAoMWH3x4mdTe3BkOUM0NArOgSANYZmM8hU/US1BMG/ad0GTixl+miF7Yv3hFcxd7IbSqJN
 Lks7K6Av4LeEyVDddo20QMnTL3ZNUY+zVJcW/xCzVkQhhCmX0tp99b+sC8efuAaCnIUp5irDC1T
 +6e7hPw/o/urn0IscJxfbGpASE0H1uikeIBwotNoyGeghDqqKnr7eCWjEqOk5Iex2ETO+v8Axrg 65fzbZuenE+xZwg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TOdIilla c=1 sm=1 tr=0 ts=694aa6d6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hP_y0LdtDFoG4kz1LQIA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: gOSw7yqwbUMNt-EzO8oRvU6vfAf6R-Z4
X-Proofpoint-GUID: gOSw7yqwbUMNt-EzO8oRvU6vfAf6R-Z4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDExOSBTYWx0ZWRfX4wfi3uk+4K6l
 wQSsMm1mgMDuZinZ+BtJCY/78zViqy3Ug8mz3j6DxzcDgj/hjXHywXLpUqcBg9S0sSkXS00rJp+
 J4bXQw8TTExXZ2Ke1NSNDG6vz6yiWqi+lL1p2IF2bjr9+cWizYPk+2eRzBoDSX7esc1QIyJjSC2
 2GSj+CtJGebSrYUDXeOCEEG894scV6R17NqxqimmNOhD+fUQieELhNbdOlyol0gXEVOQFT/sgE5
 bwGyhwAqanm/EXH4b84arxfeqidWxlDFW57GWVLQ98tYtU9IR6xz9U1YdLRQzxqsNjjtAEjdGNL
 x4yLF6JDTJ9QT0e1bC7kv72Ux+jgodb5wZPlKssMpaTpog7ufcSj3vyzKTs4/3lIYSvTBCENaY7
 Oxi77UYV4SIDbkI6sG9t5cfzoiUUoTWpF4MZJ2ZqsGeqLuuWNAevKDnCOG5THinpA0lAEFyPLwT
 A89QFFUT/E3I6HVzDRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230119

Improve readability of the docs by marking 'make dtbs/dtbs_check' as
shell commands.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/process/maintainer-soc.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
index 014c639022b2..7d6bad989ad8 100644
--- a/Documentation/process/maintainer-soc.rst
+++ b/Documentation/process/maintainer-soc.rst
@@ -116,9 +116,9 @@ coordinating how the changes get merged through different maintainer trees.
 Usually the branch that includes a driver change will also include the
 corresponding change to the devicetree binding description, to ensure they are
 in fact compatible.  This means that the devicetree branch can end up causing
-warnings in the "make dtbs_check" step.  If a devicetree change depends on
+warnings in the ``make dtbs_check`` step.  If a devicetree change depends on
 missing additions to a header file in include/dt-bindings/, it will fail the
-"make dtbs" step and not get merged.
+``make dtbs`` step and not get merged.
 
 There are multiple ways to deal with this:
 
-- 
2.51.0

