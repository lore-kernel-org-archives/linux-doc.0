Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B76374735
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 19:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771873899; cv=none; b=QaXnTYt4qfg8Mox1GMwY4rtQM6HQk+Z92mfr9nr7JDYOHhPBe+u7jWuZpArNLJpQij8Dnu9AfMqG19KgL6hoS0z8Lj9wN2yGddsP05Tjggl5YU/E6PHCV2ua9P7NhK0wagwEVS4udYU+4iIiVb/u+VcsXncC6mSQfBox+zsRq4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771873899; c=relaxed/simple;
	bh=Lyy5sl15dqp/AXuBfl18EdJ2b3DY11ZJbm74AYUuJlc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZZOvgQC49IkMyo5nd+DNfHcWmrp5bxfMxA3377BajjX+0s+KWFiTO3AUT0ntyaVXUzkr1XBo2OeBSJmZ/GDjZqvP+l+KmFKPCTlFO3DLqHy1+EpavZrFvKF3bN+Zbz4KPsI8SQl+QQFdDJOCBWY0tBf4wYxtO2B1xJKMbHVJ6R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pqFA/fbd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTj0se3R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pqFA/fbd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jTj0se3R"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NIoTwA3698103
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 19:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yRUzuJcFHmAaqmAyK9hpXfuGmZiOZ8PtVGzanUhu6Dk=; b=pqFA/fbd40J7GH0t
	61FyLOwfDSBvbMB0H48uB5tQBf1nMdwKyi7biOEudmKNLtZaCsHYrrY/RnXrULD4
	w4yAWFNMhi50p0mUeEzxYnRpAxzUsKqBh/pCA3yKoiiWVnVijCCw2Lr6ocNjAwS/
	yo/iHekskfL7+jZGq0dYD6AMhCUsw+aYBjxRqJigwofNqsASS6DqjbDCKDNjGeva
	ZhR57O96hFB0Ppr3UBZXQqFPhusEZciHCQ7Q0HMY+qI2KySKOkAPwz4wCWfSFwRv
	gVh0g8+HS7qHnwJT/iBLrycvZyJHCNIIhltkojxsTRyuAREntcMXPozM3Ft9BD7K
	1QpTdg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn819mn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 19:11:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a79164b686so60906635ad.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 11:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771873896; x=1772478696; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yRUzuJcFHmAaqmAyK9hpXfuGmZiOZ8PtVGzanUhu6Dk=;
        b=jTj0se3RNwIyWh3zFk8u3xW4KdT1njeYLwrxLRaIpYtgFAlepUXNvBZuYK4lxogXmC
         12r7ke3O+bY22nZhdkMY5ULNIEQ9eQHxi3cb0jTtzhVP5WEs/uFpOtc5672SiJvtzSjG
         3RVMAi0rqKbN6ite2RDbMuhA4ZiK1icD2xMr0jrjnFuO/d22VTLuHMyPQGk4iu7LfKhv
         8os5zbPjCl9FvSRXu2zeEg0LzIfFHbLWyE8aRwyUDpVl44tfN84QIMDbpFsDooVULyu3
         6Uh9wU97yfnfRBnx2UEYVAwNEZQnh6Us9qK8mhXRKu1KUofh5WTuoE6DM66JRAP/A+l0
         FUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771873896; x=1772478696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yRUzuJcFHmAaqmAyK9hpXfuGmZiOZ8PtVGzanUhu6Dk=;
        b=Ta8DxW2j8tQ3kBZX876zREEFSfF10iIEdhI206cfHpt3zktqvwXoK6z8BzPmr+qQiK
         zlgomSiqueyirX2AxHkxrZCok2+DPut2Luk2Mz4y5t8FA2Iuk3MZ+T7gHeRSSMRQoJPX
         3nBQVwthkNvxHRKCOkehv6aCCPBZGbBA1nLESxOcCMhfsB+xaELrcefeEDOtYMzg/zU6
         LsSHI2vnYuHT6LsTuVZG7Og1ycpm7aWVjRRjUTY4nUYIWhcZ00+2hvQNpmDjULBAns8y
         T/+YGPDQXUxlMSI/HiRgpU206YLQTHbDv2y1tSY1iNbAP0LLNiP/Wsys7pk/j8aWsXAZ
         Hweg==
X-Forwarded-Encrypted: i=1; AJvYcCW5/2EzFjykpQVwj/EsronyT6bEYM92EUXbt6GoxNZ4MMiKDq319ei4EmcAg+G+M8lB8tOA4jeH1I0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDkN+n7+98LxA4Y3QD4bYkiAgasQxQJqqPkL82LF4BS0RJgyct
	5fmr0RcIx02Evtl2wySMQaq5WmV7Ctn6rT5188EXw/qwT699F+OACRV+AfLd0VOlACOK8fMpVNY
	65cHyLLUNT/FXYVc+b3vSfEtHGMxSS0uV1XTXLwTL7ey4UX+d5iqVHzJaXEbxGms=
X-Gm-Gg: ATEYQzxQBPa9Ie578tKqb5vLd0jTvDcdOBkDuh50I/7Og2YuyE3l0rPzdxCG945lbMI
	hWJxNpF1fwh8qpsNhANBlNHHOs4U1Y0qIHX1jkwk8adJ39Pt7DFXb92QuLJO6WDRulurYTLTFvk
	3+t8CSallKskJB2+dIrJtjkPrgL95xkPsppw3IaT3J2y7ITkh+njwN1cef8BklwHvB1f1xu38Xr
	VNzgnIaVoIokfkpkQ61rMCYgIWViyOndNWu2obvV51vQkmcvxwaCntycJdjJVKJU0ZZCmgFcC2D
	6YEjRuBGvCch2EiSQe99pkNToLl2bT/CEGsAit/Z2yIxNfQrpJtmLdS9hbw75WrEN84MxMIHHn4
	pGD9O+eH1OnJeDI4RDd4cX67RepMcRroAjtTq3Nqb/N1IvjP+Pbmn7g==
X-Received: by 2002:a17:902:db02:b0:2a5:8c1c:744f with SMTP id d9443c01a7336-2ad74525046mr99741255ad.40.1771873895862;
        Mon, 23 Feb 2026 11:11:35 -0800 (PST)
X-Received: by 2002:a17:902:db02:b0:2a5:8c1c:744f with SMTP id d9443c01a7336-2ad74525046mr99740985ad.40.1771873895387;
        Mon, 23 Feb 2026 11:11:35 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74e34e18sm83501505ad.10.2026.02.23.11.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:11:34 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 00:39:12 +0530
Subject: [PATCH RFC 18/18] MAINTAINERS: Add MAINTAINERS entry for QDA
 driver
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-qda-firstpost-v1-18-fe46a9c1a046@oss.qualcomm.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
In-Reply-To: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771873753; l=1237;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=Lyy5sl15dqp/AXuBfl18EdJ2b3DY11ZJbm74AYUuJlc=;
 b=U2RuZmqfnOzXIV4uEy/q/+tEABjRAyjmepjpnCpXNvRPVQEY3N8FyXUwnOR4IQspDW9EJCN6r
 /BSlCMecuL/A6nXKoi/ZCcCSKbs/ob1ERp+7UwIQROKZVvMOxgaov2G
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-GUID: E3I_C5xXmmqo4tByTYlU7o5qNwwEfdMq
X-Proofpoint-ORIG-GUID: E3I_C5xXmmqo4tByTYlU7o5qNwwEfdMq
X-Authority-Analysis: v=2.4 cv=CbsFJbrl c=1 sm=1 tr=0 ts=699ca668 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=DP9mDQDU2fd_VHYdcv8A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2NiBTYWx0ZWRfX83RwXGPKRc3g
 NKEdW9sKffpnT3KLEQbHcd7vrCKOqsmr5MheUcIOYdhHJR/O1K64W9BdCxOkBJnJBok5Muzn/g/
 fKpKMXdQB7HVhjr8fHUgzaqTHMj98uRLq1vUa1WpbfUApa/hwZbZcPsWaMB2vj1MTm/pCpA2PRO
 BWi27CBPFX9CTb5Z228gUY3scm2fMsp3al9JVOuMT/znZk7lKLBdkYiIPD/lpKCTBBSpx7SxoIB
 EL3mdBN+nHoUcwL/DP4IbjQxIQMOW8ZY+SE8q9F7QLdt9AsY4PzxJ4TxtvBLrxfQojnDW5DtWtE
 yQKVj9rNTSLdRPrNFfTpgETtDwemBooFTGWWdYfHV03rO2W80VobHK5k64w4AvirA40GaqUSH71
 BXebdGqmprYAbR9nDvjEFieY8F5QUcGKGym1TeFvCjFK2mhKTEgwSRZXFanGkygUsxVMIhTrl9D
 VvTFubUybAhf4g13IIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230166

Add a new MAINTAINERS entry for the Qualcomm DSP Accelerator (QDA)
driver. The entry lists the primary maintainer, the linux-arm-msm and
dri-devel mailing lists, and covers all source files under
drivers/accel/qda, Documentation/accel/qda and the UAPI header
include/uapi/drm/qda_accel.h.

This ensures that patches to the QDA driver and its public API are
tracked and routed to the appropriate reviewers as the driver is
integrated into the DRM accel subsystem.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 71f76fddebbf..78b8b82a6370 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21691,6 +21691,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/crypto/qcom-qce.yaml
 F:	drivers/crypto/qce/
 
+QUALCOMM DSP ACCELERATOR (QDA) DRIVER
+M:	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
+L:	linux-arm-msm@vger.kernel.org
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+F:	Documentation/accel/qda/
+F:	drivers/accel/qda/
+F:	include/uapi/drm/qda_accel.h
+
 QUALCOMM EMAC GIGABIT ETHERNET DRIVER
 M:	Timur Tabi <timur@kernel.org>
 L:	netdev@vger.kernel.org

-- 
2.34.1

