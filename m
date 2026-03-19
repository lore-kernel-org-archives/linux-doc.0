Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D226B27B32B
	for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 06:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773901923; cv=none; b=Bc60yLJw34G3GLnLvO2ReJgrQXD+S06xV9cPlZpBrGK2JFD2VzkmvbV9n4RcXEBWKuHi74NGEFNbf/+upTqK0+1fKYROSYO0JWpQ2VFFOye+9J+zDOQ38lkYrLXIFr33I0sIEqgfr+AvYUmLfWk5kz/a4uZeNvFhH9gtl0u97GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773901923; c=relaxed/simple;
	bh=IdXz01mR4Rs8f0RYsO8zVitGxgHIzvaHiQFtik+wHJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oxg+yf89Mk7mCtFlLsDzhEDw2WxPpmX6HNUeQVtrQPEgFZAfxVBUTFpG+ZmcdXFJ+9Baqn2rITT67YNuLxyJO46KWPVyEWS4qy1KGdXe4QV6FqUNdxhBM99/OplGdU0UPtFfj1lCxVYflLuhya3ezplTodhpLACw1pSWjaI6mQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fkZp3sUq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GG9n/3Hb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fkZp3sUq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GG9n/3Hb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5XccC573824
	for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 06:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ql/OBlsnmzWsbfZsETPUc9XH7il2mDmKIxDrs/rob/k=; b=fkZp3sUqKr59AwKU
	3uQq48p13b4vR6gBonGwvBmVjwn5n/YYbgRKQGX/vBwXiktFUhq81HbCwNCW7GQx
	AdJs03ZGTM2ggM9Ddue2sEYze0QrekcBpIPDuNn7Ltkon6+8QlbiKXCY6n1yinIk
	7Q/ecDZD66cnqUXbXDBqF2m83V4D9ky0+88t9zU4Zx66m1bl/YWl7wQMlgRyhDjA
	FrnWi+RtiXSskMjCJU8GZbxZRXIz/m/QouIEaYH4gHB2p7aIax9sfstropJL1srf
	i3/C0sB0dbhVo+s6P9F0xG9R3rMmVg6qeZgTKbfAyH6a10Tm31j/HtI990NGnQy4
	+/BQNw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d00ega2gn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 06:32:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2adc527eaf5so6949855ad.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 23:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773901920; x=1774506720; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ql/OBlsnmzWsbfZsETPUc9XH7il2mDmKIxDrs/rob/k=;
        b=GG9n/3HbU+/9x0AEEUlPb/GyN94eeDjCOwtsToX1UML203CBde4VwyEwIqljF9veIT
         dUjUkqcoKHAeCNfTJUrfjaEDq3BmTsraWJw3gd4OmrRVPjO1dtDhyNzj+rIQLvg2Y4T3
         VfJWdP7ZgDDTFtpZrPTBIX1kIaQ586UYep1OPtOw7NxVu4Ylrv6iPJr7KuD3CPLIoERs
         apLFUcX9uf0rmQkMbHzsswWTDNG6pugiL6QJU73OVD0W52kuJaVxCh4SFEbkyyUyPUVV
         0W5T8tkP617NdA6vwun4vNEQLNa/QdgXXQsoto/kh9Jrju0bS4O+6LmllBecf3aTGcGr
         vP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773901920; x=1774506720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ql/OBlsnmzWsbfZsETPUc9XH7il2mDmKIxDrs/rob/k=;
        b=e6nVuyJnnMUWilphyjSs8mdQItWQbxgL+7mC92wlnHqk05A7gc7GwxM1dCMaGd1p5q
         t7vU1kIKuTetqfcfKLqlEXQiAyyeSQpdqyCgXJKkMPsSjzC8jfehemu8e9V6AfFowJOR
         /ne3j/aldH7gnvV8bggkEx23OTlBrDEd2aRD2N06KJW+BPDiF51zTaHGjjGmHanGZwju
         o2RrCXTBaAW3IMWq0RDFcyc8Mev0YDaZCxOcDR6nz/Wnc3igheqIttZIW7bpzrHyRPaH
         NJ5YNR/gs6Zh5+24WIJtlIe9oFwfTpFMhhuEDh7jbGmZO7fVs68IqxoMZ6e1Mi9vulIp
         ai0Q==
X-Gm-Message-State: AOJu0YwxB01rUitds9JGoZNKs/hvOOl0gGh2xJJzcREek8mG5o0l3HpW
	0TA84Dme/F/wuXyDPj1LNh9dFKY1deFiMesQ6LbEuumRu2EIkCMMtozq629Jj94thKPsPnhKt7S
	Qp3WhDp3Nlh+/PV6eY5IL0p/4T6DXsp2fGjwbTtFWDmmufN/yW9EdPteI3ujaQQA=
X-Gm-Gg: ATEYQzywzfBeih/ggHnZkD7uIUvoE96GtGbbX+HLVA7/5LRUJQmWHHjhvYpj3Ie9nSR
	TPiEsTld21W2D/QTUNBPANMMkWCMwUnJX9ROrM2tnQktZfkBqQmtnKEQX2UATBKU6Pm3ogBk4wd
	t39HDTk/n6FuaP8/WT/tnVsLd7tVniW526/3DErzFjZPrf/T2jMgFPAMFm6s+UWoWtSIfI/yjOC
	qeo/r2QqTQHT1Eg/LoWPOh01vEGjVpw+hlOPFMUC/A00IN9EZubweZR9vdgK/KXntolHSpPoZqM
	1+++RzoPWQYjDtSaguwhNV8RDG/YjtmL3Bs6SBhRgyJcrduC85eOO6+0/RsN8vtH2gSUq4oQ1Q0
	e2OcSRblfZ2aOuaQBWYDMi/zeuPQPAfE7aFTiSgG+CUk9O4RDZaY=
X-Received: by 2002:a17:903:3810:b0:2ae:a429:fc42 with SMTP id d9443c01a7336-2b06e400620mr66595345ad.40.1773901920343;
        Wed, 18 Mar 2026 23:32:00 -0700 (PDT)
X-Received: by 2002:a17:903:3810:b0:2ae:a429:fc42 with SMTP id d9443c01a7336-2b06e400620mr66594985ad.40.1773901919866;
        Wed, 18 Mar 2026 23:31:59 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e603937sm48572485ad.57.2026.03.18.23.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 23:31:59 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 12:01:43 +0530
Subject: [PATCH v4 3/9] bus: mhi: Match devices exposing the protocol on
 the SAHARA channel
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-sahara_protocol_new_v2-v4-3-47ad79308762@oss.qualcomm.com>
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773901902; l=1219;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=IdXz01mR4Rs8f0RYsO8zVitGxgHIzvaHiQFtik+wHJE=;
 b=e9fMzcaKKjCxCsbrxlVdE5UJdojNscTn2zbL9SlQlbqh9xy1a1pnb+eD2q55B5TwUBYiq1GVm
 7P07BMMwHXWBaY4PRv2kbaKxxJwiZycQYlSC1IZL7WAdxVcWpfcgiJ/
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Authority-Analysis: v=2.4 cv=MMNtWcZl c=1 sm=1 tr=0 ts=69bb9861 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=O3MGeqbvIhhX5qxHWLUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: JU7YPsko80uDGyXOHbtnc66qqxqZa59_
X-Proofpoint-GUID: JU7YPsko80uDGyXOHbtnc66qqxqZa59_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0OSBTYWx0ZWRfX5VkPi6Sumq5h
 OW0A2ZtOSfl8hckZHTektCmXSNyvH54Gr2lFsqGDW/+jX0gGyKs249cXJGQrwbejinVHtmUBRmK
 /vlcRfEdUHt2uASNOoY8c4XoyA4mF2+xg1v9AX11wT/AbZwpbcV53viBOf9rxUloP+OawnZf8VU
 ytfCDYHB0YZTNzHLAfAmLY/ZGGgFBD+OWFayg8FAxr8gHyN5zHYyIDgmX5bM6U+Iijw/JjGk29z
 CrsQ0b36NZe/ya4WbN+ZEAij9xEgt5un86E5g59eM/6aj6l1fMhqjx9/N8UzstcUoI0oHo3owOP
 I+PZKzDBnzFZz7rTVFZj/1obtdoqwhubcOtwAocdo6IwvyAyjFyyXeC7iw9I92/z1C7hWuIGud9
 eLwVihJFqYPehGpCH/RUiT5hmiwpWvjqzYO/Jsf+x4OWsw2KM47/agosyKCZn0mW5IzpjeDHf8K
 A6T0awk7eojjCBCf/yA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190049

Some Qualcomm devices expose the Sahara protocol on a generic SAHARA MHI
channel rather than a QAIC specific channel name. As a result, the sahara
driver does not currently bind to such devices and never probes.

Extend the MHI device ID match table to also match the SAHARA channel
name. This allows the Sahara protocol driver to bind to devices that
expose the protocol directly on a standard sahara MHI channel.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/sahara/sahara.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
index 8ff7b6425ac5423ef8f32117151dca10397686a8..e3499977e7c6b53bc624a8eb00d0636f2ea63307 100644
--- a/drivers/bus/mhi/sahara/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -911,8 +911,10 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
 
 static const struct mhi_device_id sahara_mhi_match_table[] = {
 	{ .chan = "QAIC_SAHARA", },
+	{ .chan = "SAHARA"},
 	{},
 };
+MODULE_DEVICE_TABLE(mhi, sahara_mhi_match_table);
 
 static struct mhi_driver sahara_mhi_driver = {
 	.id_table = sahara_mhi_match_table,

-- 
2.34.1

