Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D51034D4F9
	for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 06:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773901949; cv=none; b=CyqU3BIGitHUv6OasE3GYWzU0SnJYFFCL1h7YKDYiv2SJAk2I0bM/CL6LjU2niaQ7COuh7a/awhlC39HrJLR9aGqqjRUwEqiXWm/C1Plwo0DgysFTWg06hHJCWcl1Y8lobWZ/yFG++xMSOKMXaq9JkaL+JNxAbUvNhhRAJ/1t+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773901949; c=relaxed/simple;
	bh=PYlMjATY4SM1+jaLjbUMOn336QEIJpGFcRpjUcyzz/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hI4YSmlOq5iSNRYu0Sw0uTc93e0A3kDBoRETRZYYukeFAlIIGGsZleVfPoX9+Mh8atpgv5/pT4NJXoT9ZkVTw2B+ctIhhay/vB9MHx1SG2f9/d6rCOE2qgU2ybB1mTBWetzUIt3vm3kFQdpsijLl+OMfmrPs5Qz4lvclgYFgAgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XjdYOj6Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jZeqoXra; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XjdYOj6Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jZeqoXra"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5Xcnu831261
	for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 06:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AhZtQR443/E19GewAj1186Zwj+uyAl6zxJPtQ9r8Toc=; b=XjdYOj6ZySs+ffOQ
	nIXhwt5OeOeWVukqAGGFaWFnkYi1qnr565OZs+NKGzUFqDEEMmFMAPrgo4nld+DW
	Ip9FlKU2r1dwY1+JHnFUeDSH1RF9RnqLCKQfLnhYNSfW7F79oYWtJ5S/GvurHkRQ
	Br9J39bODzuBspngARD1uc53SXDHWMGl7sEGOeX7vRsccZs9uYSQva52f6XysenQ
	Of6izH1A8FoqhEg1sFg39oPMc9xKwg4JVW6eU5OWbqGpP7AMcMGgculpSra5MXcY
	3JRWd30EVQF3SI4d/t9bsIwgr830exrO5qD65OmraYUqzUgeO1N1rC8L915SIl4G
	RwUmsQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0032j6pj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 06:32:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b061868724so49237265ad.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 23:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773901946; x=1774506746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhZtQR443/E19GewAj1186Zwj+uyAl6zxJPtQ9r8Toc=;
        b=jZeqoXraWgrM9ufxqtsTdrn4GKpEiqTI/MbLwQ1hsTbeHPCq3fQrHW9rpz7M6eiNtY
         L/ddgf3MmNWrYSFp004HMEh/V4nZRuoo+2C3+iYlNGDJw/u4JE9jHpBZbFyeFY7EOJ4s
         yOk+Z1QQ2LDcDuaKfLIhsofWrjQLmbe+RgQGurgIolcfqXFgsebwYoRDQTV481/VN8XW
         FtgN00i46CDNRoBuKvX1wpGFX4wNfpy9dKw5Y3defk0BUFmpR5LdI3nORLzZKcgWVsuy
         mtowrgFc+wxA1//ORPh/1/TaFfd0zpXPivMSfFU2tNUq3kLk9hIi+CMM4CitlTswkPi2
         3hYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773901946; x=1774506746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AhZtQR443/E19GewAj1186Zwj+uyAl6zxJPtQ9r8Toc=;
        b=PSDVERyRYDDK+5mdn/ftsRfs+F0tYcLtuypQ0iGqbTZZ0+4Mp3VKPskIU6hglhgRfa
         CieM8NiQqCVQv3fqqtaeK4Uc6twW9jp7Ec1KYizcvpxhQSUF1l4+1UwlaKAkS2BfRF9L
         p+vEveimabSZ6Po4hJr6/5bGbz/FY/1oIabrWmrSJN8tWu4d23HqjuHMV0q8M3elR/Hb
         sg4N/S+bp6eayig3N/Cnrh+7f3zY5DNy5rbJhkBprMGzBlmdfc9oNOJgxUAmaSH9O41K
         yGmVs5lvfeiXUAQinNO8PTKYhPOQpf5bBA8kBGREgpvEKo5NpESI1SSWuBAh0HUy2ccY
         2phQ==
X-Gm-Message-State: AOJu0YwJBRH+5XG1SengI7+HLcSJwc5nMmVLbWfNUD1LRKQyBhR8DVLu
	diy+9VXqaCsuHDC9L+WF7e7QsK6dV3Dii88h9N0vbbgp127c1kzOUyj1RF/UCzS61i5cEiAJkX5
	GLlT/l2ANrS0m9JYZFMbIExkdJopTAyDhBiCm+2Gyx3WIPIjH9gJnWJTkvj5AvL8=
X-Gm-Gg: ATEYQzwdoEjet2JCDe9yG7Y26pui8aAZFoVffZNBmKpyXoP8W5aXu9u2GLwigN0CSyL
	N+YCzV0OXuxW/jF+7vvv5L/yYuu2V3Ek2EbqiTrx6LGZyx0amMvw8oE9QxZDceH84AKnBWFA3Tt
	5SbL4GWYpthsXYWMLbfI0WN6kTHNyY6j4jKPRop50hHL6cIJ+DvvP/udF3yTVdCqu0d5h/IkJq7
	0ZNowiIq3GHANs3ZimB3xY+uZ9JNR5vRF6HtTyu/l84SO75C1XR2lzGOuly3RttzMBLdjuCvBXA
	k/GVfp+KKvTtHAM0K82c9Xk5synfjcFQZcTwvDlpKbnjyywK4X0Cq5n/+mO9/NsHLX6BkEJLqlH
	N9mC5U7EqCp56lpdWYoBhzzOfnoy6WjDEx3H50hKqHuP32CF53os=
X-Received: by 2002:a17:903:2a8b:b0:2ae:5776:45f8 with SMTP id d9443c01a7336-2b06e3236d0mr66217245ad.3.1773901946581;
        Wed, 18 Mar 2026 23:32:26 -0700 (PDT)
X-Received: by 2002:a17:903:2a8b:b0:2ae:5776:45f8 with SMTP id d9443c01a7336-2b06e3236d0mr66216985ad.3.1773901946126;
        Wed, 18 Mar 2026 23:32:26 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e603937sm48572485ad.57.2026.03.18.23.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 23:32:25 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 12:01:49 +0530
Subject: [PATCH v4 9/9] Documentation: ABI: Add sysfs ABI documentation for
 DDR training data
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-sahara_protocol_new_v2-v4-9-47ad79308762@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773901902; l=1903;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=PYlMjATY4SM1+jaLjbUMOn336QEIJpGFcRpjUcyzz/4=;
 b=oDJdabj+nevZsLKRAXC74rtzAHVO/YwH4bO6LZREstgcBsTlP0qNzP0ID0HAYGXuCGebsRFDN
 Qk9A9oeSuz4B1G+ilAYFW3ypjpCNAaWqO0Yl/9a3wvCY/fV+jBI0yuO
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-ORIG-GUID: uXJ25BLoVNQvN6xrPWAQAu9G0-sufOS5
X-Proofpoint-GUID: uXJ25BLoVNQvN6xrPWAQAu9G0-sufOS5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0OSBTYWx0ZWRfX9beyTpMYA8sD
 7zuh92wAFrO+eqjUKc6Hz4GjykzYTN/uodlZD/FhT1nXLFNtJL/A/Cl6DlT4AL7m3e1gxi9hIS3
 97Zt0YqBK+SPcLBErBXLoBR0g3XppSffkRuYIB8X2IDxK9mb0g4z44LHmeIScNdmO/5By+067Nb
 waospwXSIN3NF4Cz7RooNuhH/cKDv7I+BuzyeI4vfQ10PN+VNkUyPdfOk8Pfk6i3wLrZWlbaLW9
 /mUVG6GtbhDtteRkc0xN6ViOdOT/RDkAgTfO5+4jX+PPON0YYaNzvEJ9OL6/O/sXku87NV2AJNn
 cxpeMd6r/8jZWUvRm+VSQuDm4SW8DhrGy/LApgfbFHvde7CC3lyyz2xZxuQJRd5zcnUPgo4hrYW
 fZk0fsU6WPcpJVd7kcmxWsTqptfT43r0+hl+dwSUSG3gGpXzIckX/uqDugEuqD8MB189mObhyFx
 LCFFxnLWrQvvzD9wmFg==
X-Authority-Analysis: v=2.4 cv=WO9yn3sR c=1 sm=1 tr=0 ts=69bb987b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=dkV1H7vRkoxx0F9zaYgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190049

Add ABI documentation for the DDR training data sysfs attribute exposed by
the sahara MHI driver.

The documented sysfs node provides read-only access to the DDR training
data captured during sahara command mode and exposed via the MHI
controller device. This allows userspace to read the training data and
manage it as needed outside the kernel.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-mhi-ddr_training_data       | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
new file mode 100644
index 0000000000000000000000000000000000000000..810b487b5a5fdba133d81255f9879844e3938a10
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-mhi-ddr_training_data
@@ -0,0 +1,19 @@
+What:                   /sys/bus/mhi/devices/<mhi-cntrl>/ddr_training_data
+
+Date:                   March 2026
+
+Contact:                Kishore Batta <kishore.batta@oss.qualcomm.com>
+
+Description:            Contains the DDR training data for the Qualcomm device
+                        connected. MHI driver populates different controller
+                        nodes for each device. The DDR training data is exposed
+                        to userspace to read and save the training data file to
+                        the filesystem. In the subsequent boot up of the device,
+                        the training data is restored from host to device
+                        optimizing the boot up time of the device.
+
+Usage:                  Example for reading DDR training data:
+                        cat /sys/bus/mhi/devices/mhi0/ddr_training_data
+
+Permissions:            The file permissions are set to 0444 allowing read
+                        access.

-- 
2.34.1

