Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D251732C94B
	for <linux-doc@vger.kernel.org>; Wed, 17 Dec 2025 06:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765954294; cv=none; b=iXlL7QB1zd+dmFf/kje8lWU/vOPJr1SC8zaqBNnCQpU1TZ+W81rY0mpNc4+6Hykha28pEZdt57ukSKrn5XoOhK1SDWcWvZtQTGxZr12w8ifRiKNngPTa+dVshBhxqR+FT6TmG3kdt7+p5VqASpk5VbKbXY75auMd4vE+n9ukhcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765954294; c=relaxed/simple;
	bh=WU4YCpuN2WnD6U8Z8IJ4kJne3uzXJ2vUUx1RNzxXTBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Epw0W1jhzMQ484ctqYsYaAXySEOUpgdF/CF91gigY/r563PGhljB4qTYQTZ7GSI4qiXGwoDsKjzBtT102sDm+eM3yg2hOYV7QZ6gGTfJf+G7Q9H/ObfWARQ3TOSAhoIY6zbAE60NlxZQML6MGEMzear0Ku3EUbzM3Hds8vAUJuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FuQi89Fg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R2G/KxAG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FuQi89Fg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R2G/KxAG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3F8pH1591234
	for <linux-doc@vger.kernel.org>; Wed, 17 Dec 2025 06:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RwaICuxiYsG3y9nIJZac4i/l8YIIA0taYYtciFqIqkw=; b=FuQi89FgPujVhVeB
	AXZOxriGnZsGxtyrKz44h93BrOPjeRBbKhq2R+Dq9vQyAxyPNkkbag3ppMpVZUdt
	5Lv7//DOfRxnrs4Q7BC4B7MeukLYRAvKuKY7aWkhPzkUuxbAaXGvO9pVMCYvdhzj
	GQrYjI34BMIhWGGb4y+JXCufBEM3BUj3YdaaxHrHpUGW2kVa8K+MjTNjzA+7eV7n
	bFvqIHKFJi+CZ3XbaT94T7M3gVLkLrqV5pMabYbP3lTbiiGadTgxxIbhAgS/P4Uj
	rTn10k9Jr2C8Bm05RP5lM0xZNh+DJgW8ZvO8JqPZ6eAEC23sl4LQXFmEoMzVdLUz
	wu7OWw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fefhc0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 17 Dec 2025 06:51:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0f47c0e60so69607875ad.3
        for <linux-doc@vger.kernel.org>; Tue, 16 Dec 2025 22:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765954287; x=1766559087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwaICuxiYsG3y9nIJZac4i/l8YIIA0taYYtciFqIqkw=;
        b=R2G/KxAGnH4XddV+GHYQ8NGkzdgL5at6jZddlTFMF+jIbIV24U7591vaVFybdG28P0
         AUjUAo936unrMl4W3G5xQZOIRIwqMaG+3lqguSfL7zozTCalJXBh7oCnYsMiGnxWXIYC
         LxbDKkuE53qww+fR6XzwUEOGkMdNeAoIOHL+0cDSDzGMQm2atrtl06mdRkujcZu5SRQz
         97XA9kigpUr/mNXtr72LltiUV3tzPp4f2clW1CjwaGi36QZXUJBb7FS5LLWEHsccRqhW
         AA6kOToT7AOhe43zgl+FA/sOOkJt9eZ0WQwRJ8JTFJpIPVyJY0KNc/ogMxY4Hlw3ImUi
         8wDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765954287; x=1766559087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RwaICuxiYsG3y9nIJZac4i/l8YIIA0taYYtciFqIqkw=;
        b=QWSCh7esAmMARN/zpnsv5JXRxbwkXl8r8wMmgNfOlTdT38ZaN9eMcxKq/Xbb++7lw6
         999nrWw/hEpWLKuIFLlroZFfva00g7lF5xJt8zcCO26NCOpjtl1Ka19xi7xmVFQuQnCw
         cUj6rqEzdyInM4scfH57kgFeelXMp123KU/3Wme5l4xWei/MQw8DCE8rSHoHgC3eFNMb
         /uQqgux1vNzb6xT/7RaWFsnGpv81ix4pi8MvzzL5Qed8B+7E+eQ2dzPAm7S/KIVVwUoN
         qDZuxkFaOpssH2aji0qu7nzra5eqVPxmm02mGlCTwON6nRwQbr5ocGs8JMeKWleY340Q
         UY1A==
X-Forwarded-Encrypted: i=1; AJvYcCWqj6CuksPoJTf0tzRNGvmHrkbT+/5Fn588j6Oej7ySeJ2cY3NtQIaqn+XQlHpWq3xnJaiogaTou8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxY041wfYZBMXtyA+Fb+TGGv0JITfaEBWIlGWjFOqhpVhe02p8G
	lGoCyuKFfdSkySUlBCDIxsGkKllFs4QKicj9J1wNUN9y4HwlM4LL+7IsEKQqm83qTCzHqJKdpta
	9hFA7Uj0d2v33g3ewifD5iaWmJ35cFEgLtjEmXC/HGNk+g6HsaxsdbFRz9r5U6fA=
X-Gm-Gg: AY/fxX5bQ8ueAcbBAyjO1aI5b/l8NuJa8c7GGsgh4eLRbDWHLEVNTD2JqXlI7EEW/Ze
	h+jFsteZ1l6iqgaX0J1CteW6E7ed5PyPdot5KViPen8vSxZsz1fvpv9YzckFwIAbKaZey7M2F8r
	y4PB3gDgGbf+e59fvvHkHp/+SHs51BRsYltYc0uCSAaLGlviks6QvH7XRCxf+Cw87jQHHgisGPY
	inceSjXNa4veWNfYZDk4ccqTAwZ9aqQWUJXPmQwqDWaUT5791QzPuZHzdxTaEgCzKfT24oTb3Ou
	/PR5XnwgnzKSsixkbPo3I6LD5KCjyYH3YTdzqTT7sfhDaWrXWQuAJh+a4cUMAVg+G3Ka4FcidsU
	wr21qe09i13AW22YhEQ6nauW0LckwrY5G19fsfKuoF+gEAUAu7yuyOxAK3QXI+iEF37gZ6bt+qd
	f3
X-Received: by 2002:a17:903:1aac:b0:298:5fde:5a93 with SMTP id d9443c01a7336-29f23c677edmr164280295ad.32.1765954287160;
        Tue, 16 Dec 2025 22:51:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF58BJXn3L4f73R4hK7FiOEUWAG+6wWfw5TzAMcuw5HCxg3IPDoRUMpLvbBG3oYJf7SYmLA2A==
X-Received: by 2002:a17:903:1aac:b0:298:5fde:5a93 with SMTP id d9443c01a7336-29f23c677edmr164280045ad.32.1765954286732;
        Tue, 16 Dec 2025 22:51:26 -0800 (PST)
Received: from zhonhan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a0993ab61dsm118846515ad.46.2025.12.16.22.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 22:51:26 -0800 (PST)
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, corbet@lwn.net,
        rusty@rustcorp.com.au, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
Subject: [PATCH 3/5] rpmsg: char: Fix typo in comment
Date: Wed, 17 Dec 2025 14:51:10 +0800
Message-ID: <20251217065112.18392-4-zhongqiu.han@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217065112.18392-1-zhongqiu.han@oss.qualcomm.com>
References: <20251217065112.18392-1-zhongqiu.han@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA1MyBTYWx0ZWRfX8brB6NOIAaQF
 d+s0sX7QlSYLRsWDPs4rD6VfD3USP8pXECzVSlsIz/XcZb+tLYUMzATrgwYfvX8TK84Jj3DCikR
 l2so2/VnYVQmSz4iKQbT5DYjahmhi4WXU2Il50aGdfiAJJCUO4LxzBZgQygXlvArGHCMEx81TUA
 j4cBKtf8KjYOLYqF7Pfwidr9U/J80NoCWas5Hvhfcgx1+PCb4DlII50B2574iDGxey2CaWgyt7q
 4TFyubpP9MHuzRontDQxnB2ckOPO5j96lsjDiTX/zcLCtMTttw9QtCXAcLW48vvdyYDcLRuVcUc
 qDJZ+PYKRSZv+oBVYX4k1B1kOyflwIptAy+vPdEQiMweEqKmSIVer1iCBvdTjC6TKUDVszjFP+E
 zS0pK9FN2I0aepsA1EojZcS8I0HBXA==
X-Proofpoint-ORIG-GUID: ClPH1WToooHOCfjZEYYcoITatUx_u7U7
X-Proofpoint-GUID: ClPH1WToooHOCfjZEYYcoITatUx_u7U7
X-Authority-Analysis: v=2.4 cv=R48O2NRX c=1 sm=1 tr=0 ts=694252f0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=sB-E2kKsXCsxT4_ri-wA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170053

Correct a spelling mistake in a comment: "Storedit" → "Stored it".

Signed-off-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
---
 drivers/rpmsg/rpmsg_char.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 3287e7941c8c..073d56858b88 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -504,7 +504,7 @@ static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
 
 	/*
 	 * The rpmsg_ept_cb uses *priv parameter to get its rpmsg_eptdev context.
-	 * Storedit in default_ept *priv field.
+	 * Stored it in default_ept *priv field.
 	 */
 	eptdev->default_ept->priv = eptdev;
 
-- 
2.43.0

