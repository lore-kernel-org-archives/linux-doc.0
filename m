Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B836D3382F0
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 10:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779101006; cv=none; b=HYkXPFqALBtZ83vpyF1y4mlSLYTEItBsUhrcQAVETQXuzz7xLXk1nqR2GBdCY9w2QJLsIDj2K9Vq+Iuzn2Rjc8iX7Qz0MEbXbCzhXKNsV+2QJS/AfPK6HHCoq3/nk7SlT5SeSELjS0pGP8PCPP0WuEorKG1QKGy2zJfgtozT2Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779101006; c=relaxed/simple;
	bh=3tkmBXe921tXdJfepykgMhwlK5xBKsfmw3IiMm15+VM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bs80rO+OFQnLK4bb9Hm0T0hlIPsSg9EQyYUE6xkACJxA2wUe1SlG/FdurkW4CcuiAjKhhM+Y3c3jFDF4b7GZdW3SZwQn0smL/ttboDCpyOy828wEjQvn9HmOBYxMWBtxrJoVcRSSdCsjSHGaEjnLOnh3Q0Ccyldn7t3ze9ssdko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XwEynNgv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TXWjzqpU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XwEynNgv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TXWjzqpU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7e3MV2892690
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 10:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tdVpl5M3mVeKMA/o8Lfxi/HC9IDNqbp9p1o
	WtiNOOxM=; b=XwEynNgvkUX6UNfm08kluP++oZgyecqPxPF0wuNzeuvP6mKEcUj
	3YZBOjoOO+keLfZOcXvXwXT065d01TieiC2yZLR2lkcddjA0saPNWTJt0STriJQM
	woE5yqFDTv+EFD6Ui5mIi0A6Epot+6yCnhvUxUDEhmR35z98mLWxcqxszLsPeFhx
	legRuFggUekQPwrcIpjc/qfDa6uC219UgY7Pquth5znaecSaGdS2XViPdG1eA08L
	DJKqluaM8El/C8Umgbz73gQEBbvJ7OoJjxjf/5QMsNOMDW+D0awdRnD68LB2mJar
	hLFpliyj23NM33xWyZ3eYYwVaRZeTmmWeFQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xk18s9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 10:43:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e136aff17so52393231cf.3
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 03:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779100995; x=1779705795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tdVpl5M3mVeKMA/o8Lfxi/HC9IDNqbp9p1oWtiNOOxM=;
        b=TXWjzqpUZGoCd9Xdx/dg36q2v0y+cw1ZfAuwZKDq/XeWOBOOq2h9bC5kAUkekLIK3H
         Zls267RbPfEmUVZfoOiCd6YkLd/R5FduBzj77jP0EBw3JP2BoebLwLC4ymxTvXQQ7WYc
         SHee2k2VerywPI8uoRJiJMCGwYnVWn/qzPiONWtfBCgIryRpVss/Xsb8rPRTFAwnkgif
         Nkl0Fnz98WPNPVrWPsifadO/bOAZHX68rrtu2Pfglzlx4+63dMcN+aByp5b0ZFhWAXfB
         gTpJLcz3Aqj1ZtNbK5CckChk3DaqsBw7/vpzPmZNjBOuoG5zlA2dFkm/GKH4TR0Ol5MR
         1hbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779100995; x=1779705795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdVpl5M3mVeKMA/o8Lfxi/HC9IDNqbp9p1oWtiNOOxM=;
        b=T8ERfqERIVaI5Cf2nz8Pq+zytDUeTd8V0YsnbdN7jVTsEXUv5jpvo2fo68Vkc8twgG
         lk1cYNHNFrXP2rcCdkXSUkhMRFmi2Vgtok+2Dxh17igPucWg0vjvUxKiMu0GjrByG3Qf
         AvB/7jIyb1Pe8CQO+2l1XnaiNlwSuY/EF0/k3TUVj+c2FFTXi3EA90tka8bgr48yDHR9
         lY1Fho9rhwezzTgH8o/3aazMg/9mtMJ+rPeX690C0KixmjX1aAjEVXUNxq/5yRwPZ5jt
         mzSgPKYWefNKIry3R4m2lbqhQXgdmwA0TthPzWSncq0lmZ0U22dN2/4LiPQec/a207tc
         Nb3g==
X-Forwarded-Encrypted: i=1; AFNElJ/Krvext+1uQtSFOaUtZ/G1fVY2CmdPhuYI6Tzz/jNQ98bSNPfvPDhzSvDIQXTNqKUl3fZp9GtJRQs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu7eYGp/r6fVysXEkfnr2Fik1JNafGhPfTSa4Ml8Qso+1Byfs7
	dSM2OJFbLUIMWyTFTdaklZsBcBnunIHoegtuD5sRxiqOu7dXnyTIebI6XAeueUo4mR/DIyejqdh
	ZT0MyevMruW7xdwq31cUmEHRk3nMDLOfR8JT2yctHYhTrnKLwi7f7xtFlojvYjDQ=
X-Gm-Gg: Acq92OHZK9vuROPh4U5zWmHrr8LqQpIaFtIhmsbNP/sxdqZ6NLLRLmkSoXbSUqXEHJh
	qsWM+rIA1iYHMTb6gSp8T+JMOFY27D7C++j5lcbqQ10NDj1UvAoD2n7kLQS9m94tX1pTEHBIB+R
	ZKxQCWNhp90cGdraOZ5so4XRuQEpqfv+ZtcuqbN+LhnQz1nNOwaoHpNSukRxIJAGKP3KuEC/VU7
	0UbK9zBfBgV9xzXR8NfR0WXO0iGJsKiUBmf+stFd+z+vD9mqV8wac7a5Ov57Txm7AcfZuVb5ug/
	1J4ByNCSt90T7i6oB+aU9/jRO2LzZy5yzpT23TwlP+tf4K1gUiDN7QZFgAaXFBRQfq0nO7YE/5X
	ERESovLIYnmwdpYKvFiCTic7EUmAIKPQdguAt1ZtwjQ/Vons=
X-Received: by 2002:ac8:5a04:0:b0:50f:e0c0:9d92 with SMTP id d75a77b69052e-5165a26bab0mr194255411cf.54.1779100995037;
        Mon, 18 May 2026 03:43:15 -0700 (PDT)
X-Received: by 2002:ac8:5a04:0:b0:50f:e0c0:9d92 with SMTP id d75a77b69052e-5165a26bab0mr194255081cf.54.1779100994549;
        Mon, 18 May 2026 03:43:14 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767ee0sm34139603f8f.1.2026.05.18.03.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 03:43:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Dan Williams <djbw@kernel.org>, Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, nvdimm@lists.linux.dev,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] MAINTAINERS: nvdimm: Include maintainer profile
Date: Mon, 18 May 2026 12:43:07 +0200
Message-ID: <20260518104306.39289-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=805; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=3tkmBXe921tXdJfepykgMhwlK5xBKsfmw3IiMm15+VM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqCu06tCL9Esz7Um0aGrx2FMrT3K35zYcB8OA2y
 0RdOLvxUFSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCagrtOgAKCRDBN2bmhouD
 1w2lD/0UT6Ne6vRVXdyMTlqIwrMuxT7upTi7nN7NZSHMz4SgicEJY9oELanMRH9hJwrt+BhHCc7
 M7zkp0siu7MxWrG4Alub1Gg0zIU3hK+vlkn1R/7N7zKKVYEGxcH28nWHwjl6YQq05mmzPPZrz/m
 rQgEF2WvG3CUiJQIWZp/LPTKsz3Ev0KHh5sOgrIsC+u3y0td8UdwfFPYS0UjA7169pKSoaFbRAX
 1+nKZGq5uYIXbJlyVK4V5NeibKV/tyZKV0D8jqDx3dPZXB6Jkj5Prnyuhq2w6HEPjj8mqyzUqfH
 NH826yMlycrxKnpNseXstt84qBct41miSmM5BckxhJXcX4EC6cS94sobn/heJjPTtKNPvZ6616o
 dbrtVjTUdn/90kDXfEBLzRUc21fDZCjUD1V1TBbqYCMiKMKka57aNoc7DOmy/hvnPp/cey5tDPf
 eAw+99pNnKCQoMBpRvb6p/kLaTGeMzjKhrsv9eHV9hQpw57cH6vSWieB9q2uJJ7mG2z0iNH+8nq
 qQ51Pap60ZdDwSHpl7YviUoDEZOqukhh9tux5PO+luKaNtw8Ej/LUEGI9H0ZNKRbrkX0LRGAPx3
 sUmYiYz9q65kced6c9Q7PklNjJr20Ungw5tQwGueEj93d2zsQfRGnvGpUTmVWzpGv4qtvL6mTqe /qb4Yee8fPqhRkA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IDAh8QJ7i8KoWr7tquHymsvMgBWq6yMB
X-Proofpoint-ORIG-GUID: IDAh8QJ7i8KoWr7tquHymsvMgBWq6yMB
X-Authority-Analysis: v=2.4 cv=BICDalQG c=1 sm=1 tr=0 ts=6a0aed43 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XFwzJdQMGZzsQ3vWwL8A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwMyBTYWx0ZWRfXz3bf2e0fK1Wd
 DB09R+UPUWz7vig3XapUMgRdE2hWlGBAxyq7BFfUrjQSIQH5RnRxBAGMROmwbJgr/sww3GyrejS
 krEeEZ8J2H+vKnriT5lyOa93oHtxIK7Xv+FAhOezB/NIvJVBmlbFNEBwzyG6ojwWjEG/MHMpWMY
 +UMQfwEbfwzySt3g3Qj2H3gzBmVSl8zK1kxp6adJYL9zXl7bFA0pHHlOpBuidNBxUvUN6rncgUZ
 juyOhUJzH839HCQVz77ISiNkSvAblikoMUFKEoZPP2lt+5OFY/JtGHi5njgBKwMFpY8eHOg3eP+
 TkDs1wB/OpTrM3YQmHwZ6BEfl7ZcpLrcAUhFHGhMQrNzP4IdPI7u4/BT7vDRKEwg0+C6e5NTPgy
 FOIJ229PdMHw/7Rovsrt2BF+A0UV5V6BYEGWWGOiMZA0Q5ICVVCzTeNAJnA2JwhcSHIaSbJMDK5
 Sxk8s/2zI5M2Sen6hCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180103

No dedicated NVDIMM maintainers are returned by get_maintainers.pl for
the subsystem maintainer profile, thus patches changing that file miss
the actual owners of the file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7a65b220d93f..294909f6d488 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14751,6 +14751,7 @@ S:	Supported
 Q:	https://patchwork.kernel.org/project/linux-nvdimm/list/
 P:	Documentation/nvdimm/maintainer-entry-profile.rst
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm.git
+F:	Documentation/nvdimm/maintainer-entry-profile.rst
 F:	drivers/acpi/nfit/*
 F:	drivers/nvdimm/*
 F:	include/linux/libnvdimm.h
-- 
2.51.0

