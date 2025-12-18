Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B12521638D
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 10:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766053665; cv=none; b=bdCAQDG00Ak2cC4m81UItQDR5fJe9aUzzzie3+rVLETSlWR7P4zoXxnccA9XdBMkMMHMHDmsU1bdkglhXWs20iSLEuJVyxmAcDGO8iJzqFuL6ZglDcljjjE9iECpjszUF73ViApJydOAZa3XrKZVjMmSGYL9Ab/OgOV/y2C1cYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766053665; c=relaxed/simple;
	bh=OI71iMPCva/n2OGZyxyBKYJ1LY828j88+PQeNz7+1mM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eGIyvllTO8QCXAzYdjIGvP2hCav+NsyazJXLm9Qfq4jZT8za6JXH/dRX7PlILFxuoY6fn3mu3E2x1vHhq5IH5WfdwC6p+cJytCuvGvoOiwUykDSWBJ24/9NVlCJp3fJSaae5G/RtIxmMxQmlKP1WZXFkEL57235g39waIbT+xrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJNXqYjZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xi20Ze0u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJNXqYjZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xi20Ze0u"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIADOeM754959
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 10:27:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Co3+UnxzYNDboe0H8zPytVumPx/fk5cCzhFhhgpDVMQ=; b=IJNXqYjZD2Rj/hNw
	J5gw/J/isgvIQznAd+3v16hKtA0gdCOF9xhFTMuTf2I6RVa3Rvi9MPWMjnT9WFtT
	m+m2/WsqYaHV/yXk5ddqUSB62PmzbU426AQq3+5BOtR00xEj6MNc1TPWw6SJjMjv
	nfUkyFReFTid2AuTAdZojZOxHTvaRrAV9NDI80gmoR/EOlMqf45FoSeelUIej0Li
	4ZvBkbe0QYof3lMdhPqkIBfxbcAc52lAMY19WPI+vAt1HRisg65NsrYi5+j6sVdO
	qrSfnRfOodQ4NlfZ7qMG6dKEIbiMKtdI4icYvMY0lSRwO5m1JWFV4vpz4Vw1HBbf
	Avwt9g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b49v0s7ab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 10:27:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee1b7293e7so16277821cf.0
        for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 02:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766053662; x=1766658462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Co3+UnxzYNDboe0H8zPytVumPx/fk5cCzhFhhgpDVMQ=;
        b=Xi20Ze0uELR6K04WLEjHsfSnp6e8rsTEmZulcl4agb7Wl/mkhni7qiNklSpDKrrynW
         OW6/vToHMwqNxQar18OOh8k3/kwUICELg+joQbN3TTw8QAsNjZspher3olAtFBhqlo9s
         vD/hcotQS2Zilq4nI/6X/QOAu++i8N74/rmFr6QgJWBZD2E+R3qtpA1MckSMyWMjOLdV
         HcJooH0HP43zg9oc8blsM8CEfZRuKkw/Zn7tklM+C4N/yXJ1iIF4Nh8XGLT3a4d5o9ix
         TtQPTFrsWW9/j+14EeXLquWA9VvU2Ixczk4iLRRz+FssmKbJElpsR63RE5jMvl9aEpl6
         WtHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766053662; x=1766658462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Co3+UnxzYNDboe0H8zPytVumPx/fk5cCzhFhhgpDVMQ=;
        b=FOVTHiTRPRwpS7ZjySyBBI4Zj/hJQX9sPtlr6p+TZBTB4KRnLg9kpmgZt8A3AziGMB
         taZaHxVnmNhnspK0CNLp14odF5ANCoy7FyzFs689jge7mvFgzLeWRNx5yKAb4Cb1cxl2
         sFFrzETy+Bn5EMH+xmJT1TnFUTRfikHIf0eyO8ZgMc1jUBiNDGc94RWUI3jNKKWa9pEs
         JXUAvo7gQVP916gIP+Bp1BrvVUsxRc1P7/X3XnqCOPqCj+b7Z7BIeghXIekbZ2Lkb7wC
         R/at/i0S3iBBo9y8JnOZRTU27FTkrXABIG096hIW9tFWW8ldhMXbLEu996kyfUl3DIGT
         bAoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL4RM17VYIH1sv7UB7RQWMT4w395zOywg9f0A69ttSXUcKbFMRizPTNbC4b7DW7dTuGUNQJSHUn6g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFgM5AhMBfle4nOLVup9pA4XSu1E0YFYLMzISm9QDaf1I9bGA3
	AWlaxPspW746FME6YEAOdhleLW52xC/+jd6dHEicctR7ovManACZ7z24MK8k4x5BJaVfC5X+9KP
	tfDG8FWD/AyaUqNFBtSKhoZkOm6staYU0sCjjU7p/fTamX46ZxQo8VKN2dMOqd20=
X-Gm-Gg: AY/fxX6YVVNLna8lishIGWKPklI7sg7Xl42lAPQ3oY7lodS5ttVEwjNRURHc8SSFi23
	v6gWtGMfmXqjmbkchPztM8HGO1Ssool/g+kuiY/MPp3Vkmgb4HgJd1o4eU69cXZpZi6H6FOVUyJ
	YWePoI7QUwd9QmGz5NJ9To48W8bjwoRKORxHyYVy87L0ptp0I9/P13JTwD80vDjPAgyp0XgeQFZ
	4C1glZTMMgq3WpxSpp/P+DQj7B0IDEpzYtpk3Oz2lEmQ2m8UDjXk/vPGwyQccQ2xJh6N0xk8+oQ
	ztSyTM0ISJGGdBfhdkDo8nsXWDuBrYKkrtP6YZ7H71/X759vQzWcpeMioGnbZWo3eb2BFumvDt9
	yTzp23l0fbdHFq4v14HhkP/2x/J/s+RnHA/Yvcb0=
X-Received: by 2002:a05:622a:4891:b0:4ee:1b36:b5c2 with SMTP id d75a77b69052e-4f1d05fda8cmr274645831cf.68.1766053662498;
        Thu, 18 Dec 2025 02:27:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGH8Xs99lwk0ln8Fhm8MT0KYk43fwblcEWogwddMnWX6PXNnrsr2mBiRPPS1m4a03lPfWrYtg==
X-Received: by 2002:a05:622a:4891:b0:4ee:1b36:b5c2 with SMTP id d75a77b69052e-4f1d05fda8cmr274645531cf.68.1766053662095;
        Thu, 18 Dec 2025 02:27:42 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:f231:224c:1d69:c0c1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432448ca8dbsm4192238f8f.0.2025.12.18.02.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 02:27:40 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?q?Levente=20R=C3=A9v=C3=A9sz?= <levente.revesz@eilabs.com>,
        Jan Remmet <j.remmet@phytec.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, upstream@lists.phytec.de,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] gpio: pca953x: Add support for TCAL6408 TCAL6416
Date: Thu, 18 Dec 2025 11:27:35 +0100
Message-ID: <176605365223.36578.17805523730541624399.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251216-wip-jremmet-tcal6416rtw-v2-0-6516d98a9836@phytec.de>
References: <20251216-wip-jremmet-tcal6416rtw-v2-0-6516d98a9836@phytec.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: f_VYXwL4Mv37FRqBc_NsqPdE96zwavVJ
X-Authority-Analysis: v=2.4 cv=Q/HfIo2a c=1 sm=1 tr=0 ts=6943d71f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=N8dQhNKznRLd4DIZfUgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: f_VYXwL4Mv37FRqBc_NsqPdE96zwavVJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA4NSBTYWx0ZWRfX98a+sBQWC+bR
 DrpDB5cHN4lsX3gT/eUbZQXkQdMs9srYjuKUlhvGlO9kfyKM2+u0CfQavHjxluhjBKZ386tKeT8
 ugmWLx61Mmqa8/dDnLu3aoQYiKB6GS4u09pKSC2PQjEaz6z7J2MqPwSpeVxKX0F6XWk71r+ac/h
 pUHJlQpCUc+VQQuGjhrAA6QLvmxfYRRvt2KVPwmYndXEWhstcxTFP4d1szRH1faYnIzH4E1EPkR
 4VGtGOXAqQGJpSrbABVC9IuJkAn+qM9GMzZK+1jHc2kI3gWcbgYgAoBARj5X/D6r1anHRKv6xHa
 nPfSI73cQd6h1LAbVy7LgH/eO0wXWEkE/TnAmduGoPmu3Vxy9nsAH+Ad1PRMUGC7bnpcb2byLYs
 cRVRin8mGSolfXPRB1CaQmT7RC4yUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180085


On Tue, 16 Dec 2025 08:39:32 +0100, Jan Remmet wrote:
> Add two compatible. They share register layout with nxp pcal6408 and
> pcal6416
> 
> 

Applied, thanks!

[1/3] Documentation: gpio: add TCAL6408 and TCAL6416
      commit: d19c36134fe14647873af5569329489502c174b9
[2/3] dt-bindings: gpio: gpio-pca95xx: Add tcal6408 and tcal6416
      commit: 9b5f506ff6c11e82574e7f6aa763c92ddb3afc57
[3/3] gpio: pca953x: Add support for TCAL6408 TCAL6416
      commit: a30a9cb9bca4296d25f253619883e7013b6be158

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
