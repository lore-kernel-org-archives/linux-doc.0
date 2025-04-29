Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F162741B7
	for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 06:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745906820; cv=none; b=tXR9zhwZuYRZ2wHMIH8uN2pUWmbM6W4HxsArIAVbXdg5wdtOx7WmDwFzu7A+JM8JmYDcQwNnhhE0ryK5Z90XsBx9C6nhV/HhtRSbzaxA1bVl5KY/H35Sy6FUUe5+vkRjGc3j/EsVH4SaCKwctQjQrAIwPD1I7Sz6rD9pN3TEg8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745906820; c=relaxed/simple;
	bh=jFBkkTZSAMc8YsW5eR17yaZHeNm/0DGHN2MFjL1ufWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=otJ6JeE7pewTRWzbrUZrLVBliCjwVo9nsnu3plzN9B8d/GkjTYvbOQ1AIxiVWVW3fYMBEFfTuwVNL5IVrxwNVEU5PvpDDcure0Pd9xR3NEjNJ5sTeRq1ScoQePcosPS2BsI0eGF3c4eQY8h9sBA5B/VXal3yalk/1E8vWDu7BM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CVy0cjHP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CVy0cjHP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq0Dq000496
	for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 06:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tluKXCMaC5kMOu8ljoIfLsf72OuKjTNKaAhw+onm69U=; b=CVy0cjHPv3Zr2qaf
	Y+ZYOFhfBxNo77Y4SZCjSzR70EWrwd5eMxTNdDvBq72VomkAOI9/s8nTVCqYl+vr
	GKO7tHkNDe08BEqDIFHqg+Jk2INqyc5v1jkuO6ozFw4NrdCC7hv0uuKFINMD6Sk+
	BV9//jH7cenb49NC7bQ21xqtanpg3zLjq705iiHC9GKOMA4XehXsy0pUW9cLreEu
	LNBiJe9dy0iS0gttCSqRcONQ363t6ZrHJYYB8vpo1XTbX/u/VJg+A/KSttpARnnX
	HiNEe8LAWySAkg+ygDmBRA3uldMTSyvvlP17vJ9RbmV3pwc4Rlf/gbB1lbS1EpaW
	J5RZCA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qv9kd5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 06:06:57 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7394792f83cso4167303b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 28 Apr 2025 23:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745906817; x=1746511617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tluKXCMaC5kMOu8ljoIfLsf72OuKjTNKaAhw+onm69U=;
        b=mbbhP38k7+cl4IPFDwmzZqQBXhZmjbFOWd37lAiVvs/zSMBqbSA1cyAG7sTYLeOgCH
         Ve0V1tCaWli8y1B7142WEb7v+4PabmtFAj/HVi77czM1Yw9wnNM8ytrPjksuAUp2NYgv
         2RXTlN8VD01cMdK/oIprbdG9FHtP00Bjyl5umQqJ/OW+uRRSkryKLg5yYFbN9NFLmYrV
         cYIwp7up0q9GNMdRWf4C2yQEKgm3tP3UImr2FavIAqfjl1hARayyaTRAukyefYoseXOl
         khg6tU/u/MBvw3/6U1UCaWaPS8XmGJL5gVRtmCIERM8uAW5L/Xc6oXAoc+q7HasxUrb8
         5s1w==
X-Forwarded-Encrypted: i=1; AJvYcCV2zihLIZr4RMMcn5Haher3GJcA0YFmoAXFV2gGDL2pBvtP1K4LYW7J9o1zRpwau1onLi2E7wUe2H8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7sHqMR0UgFZx6JhXpPBYm5VTqGPscSu8saLCaXbIDFGLFhBeP
	LaZOSFjtXmWdL27GdtBYUxD+aLevuMzIJsDbs7gDAuxy8ISi8vUbBTp0niScQaybzdOo/cs8qtW
	/VR1iuxd6q0b7zEmeeO5UbFSHxf05FY6BrdwwpB36Lar7opj42EQx3of+Cw==
X-Gm-Gg: ASbGnct6ggGbWFwFgWM303iDwgE2E5FYRCeeL5xEmG0QIS98YHbCo4kp8HesQ0uZwuN
	K65XDP/Ey5sCgHPRQgYeM+EZAKnwhD/uH/a8kzqzBoIJ/HrrdQl6W7gPnTx6JNfFTCGFuKShcx+
	8XCDdt2H2IDLLpi4l8N5rpk2j+LPAH3LVRUg1CnhYbi0IZn4YKJ5yysazGXkriv7ef8gQUsBQk2
	oJ8lXbqcx5RZ6epp3vBgeDGv6rU6HCoBdTMmKYJkmCAPKW7TJ68aCNfcU38IYXcCDXYxfPj2Ca5
	Q69XirgHB0hcMhPxnU1g7kcAVx7HrlhE7abFc5DSIQw78f7zJkEBJJfLEQsdwejUvW69K1o=
X-Received: by 2002:a05:6a00:2883:b0:736:8c0f:774f with SMTP id d2e1a72fcca58-74029565221mr2187774b3a.22.1745906816672;
        Mon, 28 Apr 2025 23:06:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg07otcOVfNPJ8y+U5whY82XEhwy5M5k9eRX8C8wg/VMa0dKjj+wgL5TymAJ0tRCcizjOWNQ==
X-Received: by 2002:a05:6a00:2883:b0:736:8c0f:774f with SMTP id d2e1a72fcca58-74029565221mr2187751b3a.22.1745906816303;
        Mon, 28 Apr 2025 23:06:56 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25acd9cbsm9353642b3a.174.2025.04.28.23.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:06:55 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:06:22 -0700
Subject: [PATCH v4 01/11] tee: allow a driver to allocate a tee_device
 without a pool
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-1-6a143640a6cb@oss.qualcomm.com>
References: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
In-Reply-To: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-doc@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=AO34vM+d c=1 sm=1 tr=0 ts=68106c82 cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=1atmPuGhRQHGwWkYLZIA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: PIJlS964kqK4wKBQEGs5MBIJlXtbRJ4G
X-Proofpoint-ORIG-GUID: PIJlS964kqK4wKBQEGs5MBIJlXtbRJ4G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA0NCBTYWx0ZWRfX8F5M2zlXHlIV LJ6I6Ei4buEzb0aZm33qlFjUgt7DLi2oPhZU0Jq/XpAcEcwnVdahholDmUpvVe3RU68eork5utw sUTofhGJo9CXpcLUxr+HHlSIFi70Girte94Mg3cxXlEKa1hbjQRVjouNglCVFQAjIH745b/uMfq
 aT2OoXaWrj5J2CWn/T24eYdohR4flWKR4Gz45WeIOUTuP+us/4mMj+w/oB+Bd+jap/3ihy9ELB2 LXjnZTTgro9Zuy0OY0eZJMr8rbdTHE97MLrpS0wZmUdUblPI0pcW65XP0NM9iTV9PhaJf/+gf8Z xJ13LKjQBHwdftXzEdH3uIC2Jvn2azbiuW39Mad03x6Wk9ynv94MU4OS/kHHnf1zuncYhuPeI+X
 1ZUDp45hN7SDoxvoNudnojTdrCWfTB6vxwOLmo5LU+nOeUOZvGPNVj2SP2fo2cGuiCu23mWo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290044

A TEE driver doesn't always need to provide a pool if it doesn't
support memory sharing ioctls and can allocate memory for TEE
messages in another way. Although this is mentioned in the
documentation for tee_device_alloc(), it is not handled correctly.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index d113679b1e2d..24edce4cdbaa 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -888,7 +888,7 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
 
 	if (!teedesc || !teedesc->name || !teedesc->ops ||
 	    !teedesc->ops->get_version || !teedesc->ops->open ||
-	    !teedesc->ops->release || !pool)
+	    !teedesc->ops->release)
 		return ERR_PTR(-EINVAL);
 
 	teedev = kzalloc(sizeof(*teedev), GFP_KERNEL);

-- 
2.34.1

