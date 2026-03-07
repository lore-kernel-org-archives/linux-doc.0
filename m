Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A389357727
	for <linux-doc@vger.kernel.org>; Sat,  7 Mar 2026 11:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883733; cv=none; b=ioz4LPknjXNwtT9T8WafIA5e/SNL7J8Iw0QYMiWnPbQVcehZ4AHknDIvIjaiehx3Z+aM/JNefNDzKyYSAx+0FyZhAW0ABSSJ1X6JZWltIgPHOGH4dbQTqRbDgHttGNolsU52u64JRIkux9v1fOZLAXYUXj06WKPPjXreIC61EM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883733; c=relaxed/simple;
	bh=IdXz01mR4Rs8f0RYsO8zVitGxgHIzvaHiQFtik+wHJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UfiiOoESZh1afnvDayV36EohpqNhHLI+SgHsnZN6i8K7UTzh5hluVAVUE6kbRPnMXbiRPNKubb4fKn3c20VJftKePni+k+G6ETHDj6FcqVOV2yuVtWYf9UrlVUymwIeIc1/Mpn4Y5/DM2gao1d4zV1gJHLxuDjRIrCx0CFGQtqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XwzR2mDA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ksxsray+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XwzR2mDA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ksxsray+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6276s0Md2404971
	for <linux-doc@vger.kernel.org>; Sat, 7 Mar 2026 11:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ql/OBlsnmzWsbfZsETPUc9XH7il2mDmKIxDrs/rob/k=; b=XwzR2mDAVP8gQTmc
	ONv/9nBbSN6R1/IGchyt5pVMxbvkE+HFfnOaPpL3gKYssoTyJjrdBodQJLB9bkNl
	bbELNoZRi+f/yXKdHSR2QNGN202Me4tnPDtMvgEFsyEw3v8vSZLOJxjwGvvEygoD
	474gv3EinsdqUM2MqtJeKbK7qDKvuRedK8hSnoqO0c6kvLtX0SSF3pqmK5G8QWZK
	eQ7ExLmVM5by6tSH4MlHvuAjlAO47zPkWYRIHevZg0nOtMuuUi0gEG8lxjT8rBTv
	027wBHsbgvg1sshTTQrLhquygJn0fC+aKYAB/hbXM3B/3f7Eu3j2fzcpPiqK8G9s
	8CyhJQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9qes1ga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sat, 07 Mar 2026 11:42:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae59e057f1so71130565ad.1
        for <linux-doc@vger.kernel.org>; Sat, 07 Mar 2026 03:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772883731; x=1773488531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ql/OBlsnmzWsbfZsETPUc9XH7il2mDmKIxDrs/rob/k=;
        b=Ksxsray+yQlWDE6Atop5lEH3UReyPN4H9bY/FhIiI3j0uoJnF/2yApBDgGR5J44Qxm
         eaUAom893yqqzWrQ8D0KEYsyh0Y7MnE1i7pKHEWldjl9LPx8Rv6Dv/JaTiSGJc8FIP1s
         wgbDa2VB7d17Uk8TJ5dGH1iva3XSYakGHe0rCgLJWsKdg7E1oHdW6Ts1Fi6fkcx7AbmU
         qjWOC1+3UAJ7MwgwwDGT+X3X23SBI8n9C+aAnz/ViRZN5k9R0Mu4MQT5vAJWVSD3v8Yg
         4S8ph0SxuCtjKuOekmvDocgbrWP69kAjlchqi/pFZRbDHzTbqjpxtRE3s9JbD35jyOsy
         fafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883731; x=1773488531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ql/OBlsnmzWsbfZsETPUc9XH7il2mDmKIxDrs/rob/k=;
        b=C1Xc0HCr/XhHxszc0ZNEcInkbnyDb8pq74EPydF0BpOM+3iyfUhAmBpIScm6u6IiXu
         eI7W+lQpqUvYfbn7fvNENpSotuWEWaeP3inTHD0LwPRkYN1FHNEwoxi810xlkJZJEQIT
         bleHo6VpkOp5ASTOC2AhP8BqC0OLaHUiw1aYNC9HAvoqYspmpWF3ric9AwHAtWn8+lac
         7ims5umCFDezUD4kF/kN5my43nkzMGuwV03vmTCURWuGiU2JuOC53Vz5I+SUAWYVP7Ct
         Zj+1s6TbPYWuseDpKg/+z9xWhanrHtISIieUGIAk5Wdr3TNN8+aoIMeIL/Shgk195JlN
         2OTg==
X-Gm-Message-State: AOJu0YxY9YFIEDhZjeG0jANl8+GdLpXnIVT6hs2Hl4s4AVF0dUaeunIK
	1Vz2Hjo4lgQ1QyxiwTu93RdptwIpBgQ6Cq4s4ovuUgIeu/xMF5oiRn6Uhm2QCSr8cFnYZHAW3Jr
	roUG0jzfwqTPWs45Ga8N2HLa/4WZ741mzj4KYqPmRY8J9Gt26Eh03l2seNcKAH4k=
X-Gm-Gg: ATEYQzw4q6xrcEphjXA7jeqeiFjRx5NokThf5Opkd/9StYGCd9cSURbP4Kk5J5Z5Taa
	68QtcxIyNQdbNZe4hkiZHCfWWToZlt9B7PlND580oPx6Viph5TO/Lv6qbhSv/70XGxOWkH5aj+6
	u4pwnZ/hyeIJ1U9pcq634+Wsp4LClK0R6e+iwzzRJLMzb22arYB8fKMnX9UDU7XhKrN7xzxEkha
	oaNviirfsEqxXuC0qI7DWRV812BJziQlq9vvjEkJJIy78HL4GGSt50MMVzTeeN8NR3+xXZ5nUsP
	8uTAn7EjKqRRtVQ6daYesuxLCMDw21+Fc2w/WuoVrXiEAOGE7ecjFtWm4NYitNf+Lj2PwyyL+Mh
	CcelcDF+J/4qqqGiwQ1EXFY54OvEU7nM54DL9LSHSJWBl+/QA2AU=
X-Received: by 2002:a17:902:ef50:b0:2ae:5797:e082 with SMTP id d9443c01a7336-2ae823aad45mr55366165ad.24.1772883730944;
        Sat, 07 Mar 2026 03:42:10 -0800 (PST)
X-Received: by 2002:a17:902:ef50:b0:2ae:5797:e082 with SMTP id d9443c01a7336-2ae823aad45mr55365825ad.24.1772883730454;
        Sat, 07 Mar 2026 03:42:10 -0800 (PST)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f8c713sm47996145ad.66.2026.03.07.03.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 03:42:10 -0800 (PST)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Sat, 07 Mar 2026 17:11:24 +0530
Subject: [PATCH v2 3/9] bus: mhi: Match devices exposing the protocol on
 the SAHARA channel
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-sahara_protocol_new_v2-v2-3-29dc748b5e9c@oss.qualcomm.com>
References: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
In-Reply-To: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772883713; l=1219;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=IdXz01mR4Rs8f0RYsO8zVitGxgHIzvaHiQFtik+wHJE=;
 b=3HTb3lNqq1SBlZH8owlRUqgc1PykEjlh9ZnscaYY2XCHwlu9RlWn/8c29wYzbFP832FhPqK4M
 6/gbGM0wW/kAcei6sxdVFhRnS5Q53iyxG//r/OMoyPfrXciF+4abQ5k
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-ORIG-GUID: wI6Q0jV1BWtGkQONGzz-6-wewly34rV6
X-Proofpoint-GUID: wI6Q0jV1BWtGkQONGzz-6-wewly34rV6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwOCBTYWx0ZWRfX905CPm/DuiL3
 M6H8PabPWAsMqtvuV4RRAbAYaefFj7M6J9IJoItC0ee/VUq4fgIWZ9MV0dEx0r/j1/TaJLIDXva
 5rD5NsIGqZ04g04U6L/dk6776gY8FUChCr+dqnaRQY04qNKb3W4hT0mu2Y4nKE6ld2RR1teSnLp
 d9ylvf3r9vd/HRlh96dGTlu+kPRRT0PmpJmCsg6HztXOz9/TY6vV71pwLIJG05N6xRzHFH7R0Hr
 hFRinDqp+lcbxgCNKinp/IR8bg8GlfRqE0QfNn2BA7oOdC9ue2uEsjElbSWpMy2nqLJGy/Gm9Vg
 p6Xn/E1dSW6FqSxXNIhkjMRSzslcUyTgYnatH+i/B5BIXByUG7fcFNIF1IB6mBU9JsQ2VdtOkkZ
 c9Jn4FCJnFqQkyMUltCBclk+c9fE3wA41rygiUCrx5BPwR9+qI6Fe4+he/9E5xj+dMVhdX/VqSl
 T4wP/LnVIa2r1AkOa8w==
X-Authority-Analysis: v=2.4 cv=dcqNHHXe c=1 sm=1 tr=0 ts=69ac0f13 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=O3MGeqbvIhhX5qxHWLUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1011 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070108

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

