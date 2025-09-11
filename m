Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D57238C26
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 03:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757562093; cv=none; b=jkQW+M77sNaA3XWnMoc0Nu6DTqjxxi7UBwG2fJ3hA+o6JW9JcCNGbDZh5UYdJIUMFiyPl4cDFKhWGR5DSryYbj9jCanaz7ahxpMS+HScP83GC8DmjCaVuNpeyReAymejPl9yNeVuJUv6AY8E9pXL5+I02RmnVAl3CafdK5XSJBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757562093; c=relaxed/simple;
	bh=PlNtUBn1m92e6j1roGLFXzYvk2/0ghYLEgBgH8NcnDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uIm/WU7m/B5w3hMOMrOxOb8HFsNG16jJDT+Q81h93AjHQaAXqKHBLrd6WyVcg2bwKQiAidgptQHzlUktU3iMpHaHzfYtFbsEW41hJk1SKXxh+EYZ5T98NISpi+LHV4C1gJxNi/pvEEfAwyarH2uoqNqotXpbffscyh+vb9cDIQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O88QfUT9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O88QfUT9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2Ibhc005468
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 03:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0cy7zuNmWldsjxlDI+hNSLQe922ofh0kNWkW6uU0Hx8=; b=O88QfUT9GmAis5Ps
	Rd3Etve6sOMnGsOB1PoKeD8JHjerLUfP2tnBbArzZBPIyEuWUNXDvA90enzHZYIM
	jMDje6iPstBEmlMOQI0rDe8TGPMgSQ66X/hLrnByK0zob7QCeJHlUHP9PVPKnzPa
	RcC3Kvr248vdGcBYGqIDecQvOTyole3a9jungNRYUt4VFw+5F8QTQ82+JovIV5pY
	Q35cY677ctHy0L3+qubkkYTiZmCVZGMj9qJzY3hk0rLj6eOLDtL7r96VEgfcCR7M
	NMOtOdB5Fw0DLtcxbWyCJXKdIZuppx/BaG4rEIlxKmTIeUcbY8MEURsYwd/HohAH
	F8hwkg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc2a62y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 03:41:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-244582bc5e4so3011245ad.2
        for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 20:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757562089; x=1758166889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0cy7zuNmWldsjxlDI+hNSLQe922ofh0kNWkW6uU0Hx8=;
        b=uMW7lBIKV/7d3MjDQlmrjR6i6+rCmB3kIvzNxr+1Mfqn9D9AOfxnYqpQh/jj3oQxpA
         GkQsfhJiXXzgGY1s4/lbCmgnqgX5NH7lOuCQK2uxNrGw1w5TnAihvu9EPdBwYKp4ejPG
         ZMtIDKX+3R/PT80f6HqlECpVuxuUQe4g/CP3OU1kzLiS8Q+nG+znkMZ2ULbMh4iRmQsb
         PiQHGu+48N6f9KueRBqX7E5bBjPcKKqoTQNLeZhmOOJOdlQg7rSTk3e3T+UsnXZVvDSR
         Ebpu5Vtt4d9IbGo8yc3dM4P0GEy9A7c2QlV2PYaSFJaEex3kwWgExm3bWuluKE1mEF6E
         fYYg==
X-Forwarded-Encrypted: i=1; AJvYcCV6e+hy25S1KS4hHhQBWLvtyiv2e/sYdV6+xvB3Ny85lAgwneHraIUbxzxs7MssQcEYnYaleMBdPLA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuGoU+yrQ2eDAcqKBD8WTfesn/1RVcUYsNRkeg8wegpxfy2GGb
	rtdyPHH3uQrEMUHGs3RT79rIorsG51ZL5XRYB/53SYINapMhjoPR1Scd3BWYbFuqzc79odHgzER
	8vRiQbw+TDcKbhw52x9P4Jq/YOycbnewOdFbG0A1zG1c0vQEb6xVuU82XTVrO/Q==
X-Gm-Gg: ASbGnctRYSmRWtMWkSAwb5fRmVDF8v4bQitfdKDQULGFRcirs9XSVQ6+ksDIZ7ptJ4W
	Evtz6z6lyj/CT+fbt7rGVdt0iNE8mTSjNPTYqCCAHVCquNbFlASawJ6vpD9NT3xUSWz/fJYmHlH
	KkzKr9Qgh5zZgHi99nvdfhrWuq+NtC+BP88jr4Y1YbWtD7XROInIqY3brh0GxwqAORZ/BANkdm5
	Xj/UlX2MlMhdhsu2j+Y6BpopoEZ91r9vkxW7u7NYdClphxsJnng4LXxAi5yy3ejt9trJB/J7g2B
	WmvSYeSUn61Wo0RusWACy95Rc3wjhSi2cG3+TeG53q15FMhpFTfnO5sVWqBs4PTKmip6WQ5OZYN
	7a8QgmWkEdGWhI2tn4w612KE=
X-Received: by 2002:a17:903:2b04:b0:24e:13f6:22d with SMTP id d9443c01a7336-251722929d4mr290434645ad.36.1757562088993;
        Wed, 10 Sep 2025 20:41:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKhpZZ7QQ2u4bajGkkm1KKWLUYyswJaL/iiPppE3MndRE8NjcBrWi4HRB5LTZP40i4NipFKg==
X-Received: by 2002:a17:903:2b04:b0:24e:13f6:22d with SMTP id d9443c01a7336-251722929d4mr290434315ad.36.1757562088589;
        Wed, 10 Sep 2025 20:41:28 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3b304f76sm2962275ad.130.2025.09.10.20.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 20:41:27 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 20:41:16 -0700
Subject: [PATCH v11 03/11] tee: allow a driver to allocate a tee_device
 without a pool
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-3-520e867b3d74@oss.qualcomm.com>
References: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-0-520e867b3d74@oss.qualcomm.com>
In-Reply-To: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-0-520e867b3d74@oss.qualcomm.com>
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
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c244ea cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=1atmPuGhRQHGwWkYLZIA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Z4C4Hlinxs0T8CDjVVM7diq2Y4mgoOOz
X-Proofpoint-GUID: Z4C4Hlinxs0T8CDjVVM7diq2Y4mgoOOz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX7mLFZGe4rSPN
 GO89Dl3nQME4hDwmJ6X+zMhYm9CSZUkuENqsiALykju3DC9qXWYGxI04S17zkyz7O0WLtMH7iT4
 uHZlupSCuWygHbbR1U4Nex8oFNMPyzWs5WcOum9KV0hQOMztTQokEY+4gSHgUUnOymgZM3MRRLZ
 JEG96WNTiZAWRdSR3ZRmt0NAKDT5cgjKl3dzW3lsfh7WI9qmCLXnXjp6VV7tuMJfPkQ4igVeaE/
 ljNjYv99CJweUp4cKGGvrmPRdZiWAEmhTNmB+awScaO7eoqVjY/mE3Enhzj8BFGgEsAPGFDbJm7
 p0IkYXqOOcvpejqjV6YE5SAoYCnJYx3AwyoL5qv7BCW6PC2Utc0mFFC4dAqM157rj4bf0Ex3gN7
 JtfRe2VB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

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
index 807317d7b3c5..9fa042d80622 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -926,7 +926,7 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
 
 	if (!teedesc || !teedesc->name || !teedesc->ops ||
 	    !teedesc->ops->get_version || !teedesc->ops->open ||
-	    !teedesc->ops->release || !pool)
+	    !teedesc->ops->release)
 		return ERR_PTR(-EINVAL);
 
 	teedev = kzalloc(sizeof(*teedev), GFP_KERNEL);

-- 
2.34.1

