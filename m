Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C048B34BA2E
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 07:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771831680; cv=none; b=JdFnJ5PbxeqPxB0f42TvhgDAZbygUhwHypTxnTr+ca12fK/6hbO4Pz9qs1cYsciT7vQZ31yPk0OiiYzCXOjKtH8O0+saNbzpP23RGfXUcJjuPqagXD7Unax1J4YFIqhlyJxQ3nZRlR2FVsQOZwmgl2FQmOZnGsAuykM41kzWWAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771831680; c=relaxed/simple;
	bh=r9x2dulUi2i/xHeDpXgX0ZLrT/131D7Fe/8Z5nmd+1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fG0rKqMWjwWM/2NT7i4sc5kLYe6c4pb6uOh/JzMMdqn+7BITztTlvyWhV8k1zptpcYzq2T0gviTadppygPY4IkIJ9nuoH8Le+tDd6GviAIbvwwmQJaq++sGWNFxcl7OjnpWJOIND3EiIniPJu8XbgBcT8lU/DozVWsyUOdfH4TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bXFefgdh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D7B7TJAv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bXFefgdh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D7B7TJAv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMNgXJ2211942
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 07:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nrZc/Z7Be2A9y5DqcniQ9Lm/4gP6G87E802BvnTYUp0=; b=bXFefgdhxPDsuijE
	pYnRuIw6NL0O9YNgYItg1nt7i4ZCQEWOoOkFJAUghwrB+umKaoiUYEtnZpPxNNPv
	OlxrAGmuu+grnE0hac0PCqTo2xII88LwC3ifwVKfvHze7LyFkgVMOAn4C6uMF0YJ
	8jmAdcTJaXVqOp4YC+mru81BehBD+pO8nU349x98rPbYDSELkEAXuHO7UYcyA+yV
	K0q+d/6efiT0GCyZpTSr8tHZ67dyXrgpKBBLC7c8thjs3hNPl4RTemJhOjlQSZX9
	zgOUbR4t5ODWBY2zjHg1jkLRKO2p5vtjTVKJ21Y/ynHGhui94xPGB13nXFD7ys/s
	uWY9GQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5v3ur7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 07:27:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4817f3c8so3600514485a.3
        for <linux-doc@vger.kernel.org>; Sun, 22 Feb 2026 23:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771831677; x=1772436477; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nrZc/Z7Be2A9y5DqcniQ9Lm/4gP6G87E802BvnTYUp0=;
        b=D7B7TJAvFxFW18uM8WyBE0jrIzd3vOZHZcOyKdNGkNZ9akr9fYqxFb3Yz2YswN6fS0
         VwjUMHmGxvM61rL09Gw3G0VyR6hn+Ep+IPAucW9uM7YTPfDyBtDq+jqFL/H0PzE+cAah
         ub+/IkydBreJXtp5PiW2aonWrAcG9NUfKj8HhwE28STSvorMYAeHoz6SuUexq3b0XQf9
         xSUOljrGD99l+T95t0kSd6eUHL+E+ePmMICT9+JLfTj3NX7YPuZSEuu2CNMD+j2+y0zb
         DVjCr175mL6kit4+XF12wEkX1feB/YO8Et7Vkf3DQ4tsafbq7GY/zEAXfknGPolbqYGE
         w4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771831677; x=1772436477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nrZc/Z7Be2A9y5DqcniQ9Lm/4gP6G87E802BvnTYUp0=;
        b=rFme7cFqDWszEfRlDP56L0nDEwwGSrZ0kx93IZwHE8hQluAqXozi3wi2eySkfhsRGv
         eIR9nrIu9QeBvq4w3iDeS1r1QXm7ke17ECNgcMRTmIzW9pz/MbgULMi3SrQuklmc2Fhy
         IvJdOnyLthEKE/jkRhn1RU9fBcKhIoZtEH3szcEtErsDIcdNfEFK/UCRBUsFsA/dN2l3
         Yr8PaX775U3v70kNZ6rrhKEjyh0BIeQLvs7zdxFunHWGGFxZMfOLhbsttAGwBXkzv18f
         k4pTubQ8QF4dVpSKC2V+2jIBvgwsmUMamtdqkYB5nL6Xer3eglFcjWfOTcu7yQeAoow7
         Wb8A==
X-Forwarded-Encrypted: i=1; AJvYcCV4kzX5p+mm8d+AMWvZqtnQk9fPqbsUEXUWNJJEa9rNhC9vMP+bJNsqmdPXGf37bnbu6gvzaHz16aQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxsoSONOcjFIPSPWStHt9lYJtFGj7E3xp0S23p+3iJZnAgvF22
	SxWBHe1ri0jSTgIegPj8PyScijsWDkzU7CHt/GH/10ZjkLyH2ca39zboIjryANHDcDebBWzOT7Q
	VmLYLbu9oZaQRYNJ3qVEhS3DVPyAOhGeMiQmPiDrS65V5drAnO/9q9USovnd7um0UF4CuQZA=
X-Gm-Gg: AZuq6aKd7nUyO4OPhNRomVIDToLjIUxWEHDvGcRzG7OnvAMHR+OPaLB4WI3D0YWhVYn
	e0qtJyVqU/W1g3xCaKVz/9ub9JqOiHtRKKrcFcVzMQZvDbDoiTfvbWBE22lxNTBlNsgdQ7hPFn+
	hDHPoHRwdnGbiQepYh31nsgWZuLQqid57H5ndlvaekL8qcYCr+9bBySz1179alODNMZjMX8xvN1
	zevjt1AbVol7UhJIAnfBaanOfeH6LeQmL9LKkatWu0JRKqn9xmcB0tJsKO21a9ef8hNDCBQKA3K
	aGeNtD0YCaf39L8YPmRaG0LHn9gasYTjHiDrIiXG84njt6C1TPCh3m3VNg7kvZ+7C+y3DEN1a0r
	qKgrpq0tFetpSUnoLTE7XYkTqBxemZjnii5RSHflmihDtxA==
X-Received: by 2002:a05:620a:4726:b0:8cb:66dc:9fcd with SMTP id af79cd13be357-8cb8ca740a5mr760939585a.56.1771831676899;
        Sun, 22 Feb 2026 23:27:56 -0800 (PST)
X-Received: by 2002:a05:620a:4726:b0:8cb:66dc:9fcd with SMTP id af79cd13be357-8cb8ca740a5mr760938185a.56.1771831676321;
        Sun, 22 Feb 2026 23:27:56 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9ff5sm18550286f8f.4.2026.02.22.23.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:27:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 08:27:34 +0100
Subject: [PATCH 6/9] mfd: ezx-pcap: Drop memory allocation error message
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-workqueue-devm-v1-6-10b3a6087586@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=769;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=r9x2dulUi2i/xHeDpXgX0ZLrT/131D7Fe/8Z5nmd+1c=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnAFrkKbfiaWJobMJ1uaOgm6ZHmwStj8BHlR2u
 vp1CSwCm1iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZwBawAKCRDBN2bmhouD
 1zVfD/oC4r95LjZ3DM+u2Ns+t8NFjd9MPKu16F32jeMboQjnWCR9YCLIRwn7Fvr1TR+ff5UtpyT
 XBgB2Rx8udmj/g956wfXJx/U4gpvw4kMozdxk98g5ROegzSW+zpfBmSdv/Y0RkSJY7v5JcH18E4
 nWjB6GjTLB5VOxQQj3pioJknmyxmuwTELNXH+jJri9kT3Z41Bz+Klt2i8/wc91yhXb407gbpdfR
 4DvWYkfuiKiF3C1e4MhjzEzlfuG9qQD3KIscOucgJL+YRlX3Ey7sED06o+WoJPNrPK0QfFXhHZv
 NOLX6kWeE53OeTAgE187NhmpJzoj7zvcDbaBI31ndIEGgthZWx7pORQJu6zkRlU71fOtYDaid9J
 FrKtxYHV0/sGCkFHormsZ+GOapWYEhWEJR50ScVUbd9ULC4ZlxUxCBTIWhz+Lkm9Gv5VXaFcLS+
 7OxY4GcIIWlXpspwcVNxWaSdqZ9JRVxzaRyzkcKW3kuNAn523XVBOUAuM9iCufA13SLXkpczN+Z
 ZZSw0XB5klJtECmOL/uR9A38T4ef5aU9LT4QNNVIEmKT6SgLS7zCvlvFse5bWOgrryLV9WAJGQ4
 W5iU8ft6bo8owCRtIIzDxGrRgVlwrPd6TNb2HR4Nqzie8fw3AxXahDDaQMK6t5HaFml+MzTwWfh
 z7dV1TA37i7F3gA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=YL6SCBGx c=1 sm=1 tr=0 ts=699c017d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=3HoxRS3-ReI3PdwluWoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: HPgna1lgZcDzs9J9ZCy586Qs-9Y9GXCR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA2NCBTYWx0ZWRfX7Aghv104d/F8
 56CRbQ3S3xT0yg1ECj65JqVJp5s18RoG5GKJZLRsvvh2hczNTtLpUarxgSH+H5Orndh2iSBgI5R
 mnwf/1Nci8rZ1uyLsD8k3sF15XYERAVThyfqY043C/R+BLFQA+irXvtfON/SZpa8aMVUV6/bWKT
 HoUGfkaFfGPwTnFQzHLgom2ruaw7t17AVfJ7u7F7XZilsphnrjiSrZCG/FqFgsmE4fnSJH9tfy/
 tf7CxA3eDB9T1Exgdblug6w7KJG2KZ3WwnZNPY7wTin8hntzWZU0a811HxFRkCKDAsGJW1H2D4M
 Bv318VU0CnDefMYFbrFBDddd0eEWSxurIo86NN261VV4/hHyvoM5Gs2qp9Mtb//nGH7Xf1UCAEg
 aDhCnDcb+uyDlWdSZZGBunaV+TZ83I7pD3eySyFVIxOhLJN7p6DMlLRr3XIayctO64S7YtXiJDN
 pR4aI2YomM4OG0nFS/Q==
X-Proofpoint-GUID: HPgna1lgZcDzs9J9ZCy586Qs-9Y9GXCR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230064

Drivers should not print error messages on memory allocation failures,
because core already does it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Further patch depends on this one, thus it should not be picked
separately.
---
 drivers/mfd/ezx-pcap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mfd/ezx-pcap.c b/drivers/mfd/ezx-pcap.c
index 1be4557b7bdd..13cb185638a9 100644
--- a/drivers/mfd/ezx-pcap.c
+++ b/drivers/mfd/ezx-pcap.c
@@ -416,7 +416,6 @@ static int ezx_pcap_probe(struct spi_device *spi)
 	pcap->workqueue = create_singlethread_workqueue("pcapd");
 	if (!pcap->workqueue) {
 		ret = -ENOMEM;
-		dev_err(&spi->dev, "can't create pcap thread\n");
 		goto ret;
 	}
 

-- 
2.51.0

