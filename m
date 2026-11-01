Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571951;
	b=mgQv1dcTN3YroIfCHLP32zLig5h0jKf+hv62QyHFe9nHPfRWd+3OfMeGv9i24Hb1y04r
	 EgVD6wvlSS3JWpm8Z1kGSvBBivjLQQLI8YWyWKEUOd4p+L34u8jzGAL9nie+UNTlphpZp
	 ZEI/hGhkQoy1KfajEFqhLioVSm4tzZRjvIYP/St7k2u5f5PEAiphjGReiQW/R8C1Ebfhd
	 TEWYdPqP6wuVB7nDqtk8dio9slMuI1Lz/GUTw9ogaPaIOgkJEMrPYFWAYb2AwUkuSgPaT
	 M94R26KSNi1PLEBQpooY7G87Qk8Sju/oBxyvMM3gpI6d+9/PjSvQCjGOe05+3AIhdMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571951;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nwucajbD+HNWxH4FxeHiZU8tWXZnOU3zyZiJTCLv21w=;
	b=Qc+IQgWK2v5wqFJs9V2Ui6qhDLXkzSKr/B571mdXGQQ1h8Nck5I+szJ+gNlfP+IEb2gs
	 x+TabYpbsoNn9g5Rwr/SF1OECo/UU8oX9D4KSXK7Po+7vartxPxqOtWStw9ROkSZEJZGV
	 GbhAlWXV3+gtsGhotdB7E2ZtFldibfYNNNPZODZNZHiOP+BIyE3iyIWYmcfsOylCTIN84
	 WiaTdSEOy1yMAR4SiofGcniA0IVbet3JkVOu3idh2M8ylENX5XgQTtZlMUPMvB0RbRFaA
	 3C0OluYhMhpooGZvfxBqIDYjiek91/63mR1tO6k+aoP6ZvOaMF/Cfk12rDe3x4Sxy9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nuQFYCfs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V7iY4ZYt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95BF6070E90
	for <linux-doc@vger.kernel.org>; Sun,  1 Nov 2026 22:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A95BF6070E90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nuQFYCfs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V7iY4ZYt
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1KKOd1733503
	for <linux-doc@vger.kernel.org>; Sun, 1 Nov 2026 22:25:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nwucajbD+HNWxH4FxeHiZU8tWXZnOU3zyZiJTCLv21w=; b=nuQFYCfsssQ3y9N0
	7Za3EjBr7nYaRhEHo9aY3j7SnThyTGwMB/gPb5kJYP450DFQoxpU0e1nmLixVV2g
	Ryy94jRAyJPD183XJBUbly1erFQ8c8d+0JRI+ib3Y1GMov/cte8Tv9hCHE5XdPsO
	0jL2sdhUWBn6EGsz8oHxzjrMfRJq0zkKcqa9syoD2B3FRbMvY1BVgEmUFwIv9I50
	RoMr8LcuNQc4ncTb4h34iWJ6nuOXUq4XdRVDzWvKxRtXdkNl/oc3gkvB7xpbjcqO
	f5ZlITYalzKx+4c7MXLabR5NGdhYYH/qH6/7j6ht8uobG6vEnFPNFChWIteB4Abp
	E7xFZg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7v9m5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 01 Nov 2026 22:25:49 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a190c53a3so3389104eec.0
        for <linux-doc@vger.kernel.org>; Sun, 01 Nov 2026 14:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793571949; x=1794176749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwucajbD+HNWxH4FxeHiZU8tWXZnOU3zyZiJTCLv21w=;
        b=V7iY4ZYtHtS627Sesz8xwXpsYRXiVl4n2+shqiK5mogl3OF1Rgy2wrD2FnD09Tb3Th
         YvJns/BuQcE9wB63sbmd3nkVRN05nBe4a1ZCYKA1WDsy6dDwSpH6NoVB8zUSCtUQAq/P
         YisVX2zKVFMGFFoqlOAwtw67ccJzLWK5J/Y2i29i0WuDeVhCoroQp+GlFBnQgoo2YRwR
         kaulmkGtJuqmlFF6iRHjrZgVsM3ANpbNkUlaH/UsW1AM775XhxnRSGU7BYPGGcxJCQYr
         w2OrbA9kTyq1IIE3ZW5FmF6WDVrQccHMNW/nzqX9BbNYY0yax9z/ZhjcTrLuMTvXZiQ9
         eKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571949; x=1794176749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nwucajbD+HNWxH4FxeHiZU8tWXZnOU3zyZiJTCLv21w=;
        b=Ij/9j4+/o1VfHVbgy0ZAXYBnswN3qbpJ/qQ2iyZGJyJ9eEqI6km16dyufHC6rgLN3s
         bmvhu2Yqrv0Gh51pD8srkHJj1E5/G6yJCenEwO2KzO0LwRlpfHNzLYThBNo67TwW7/+G
         5n355fNkLr6iRy9wkMa5M5VfgWSycjA6vCdpstu2XNeHjozy5EPVmKV7KUoXXA9EFymP
         5OzhepVuw5jzVk/77il6MUw2uGh/VdUXunAsh/hcYvcWIMF3HvscLajvhd17RxCg4GAG
         xWo0890OZ609B0dKhFZbq5iwLd0w0ld5R4+11LrQ67Phg+n1e6wx4Mzv09ZSYGwfPb5K
         jCvg==
X-Forwarded-Encrypted: i=1; AKwUvBwJPiKm00UkSih9/Ufh35vZ4PTQcyX4dT5oVQAx0kbAwUFO9pd+dUs23Sjas4GuccpMFBnjQ+5qbKI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3jz51ulEGln8Oqx61PxlBAVAiGFPfN0fFoF+cGHzO3bLx3aZz
	Mmfd0NRgQcRLi/iie7igybDpd7aHSayldCA97+T7ilvhxib67OxYJYnRjx32lLgl1CtBngZzmXo
	agS4QLXkmjNaRgN+Qbti2KfXor+R1j8U95BBPlkneeyr1Jb8m7wvXXmzxQo8cAHI=
X-Gm-Gg: AYBFou1P2IwScumqPwpVVtqs0/FtxZc+5hffg/D4sflugl4cBXbppTHQhPm3gL2neKM
	7tqt2Or16H7j6sv+G8DoTrOdWFKbRVRUHbyFD9umjpR9WOJny940DOW2Ds5N6xTw+Owc48R3P7g
	ICqVNvjat0purSXwy9UbtKsb1PrarN5EQbcWo3ZiXkuvxpTOcAWVgExGfDrvC+1/pnSBFGHyKuh
	2ddXYqz/CRnA2bKsevrLUOeZZKSBIs5DMnaHFNfUrCoNXRVcm2Kn3/+JaN3vP3o/XX3YJxLPhKf
	y+FXDWa6UogTUAygm0zaGDFrwsh1UL8Sr16DP/YyI3AZAc5JTIU8H5QPtuNDi9plNlBRpRwoKX2
	m9rUjF7VuRD+Ri3cBsvCycYxJ4SQWshPywhzeO5XMfpIoLQtMA9VYgGSR2cslP4r46lJD5lApv1
	OdPROSsA==
X-Received: by 2002:a05:701b:2092:20b0:1a7:77ae:11f6 with SMTP id a92af1059eb24-1ac5b7e0185mr12212171c88.17.1793571948415;
        Sun, 01 Nov 2026 14:25:48 -0800 (PST)
X-Received: by 2002:a05:701b:2092:20b0:1a7:77ae:11f6 with SMTP id a92af1059eb24-1ac5b7e0185mr12212134c88.17.1793571947846;
        Sun, 01 Nov 2026 14:25:47 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1932sm27742653c88.2.2026.11.01.14.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:25:47 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 03:51:37 +0530
Subject: [PATCH v4 24/25] accel/qda: Add legacy shim support for DSP
 capability query
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-v4-v4-24-88f2f24a5f0b@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
In-Reply-To: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, krzk@kernel.org, rob.clark@oss.qualcomm.com,
        jgg@ziepe.ca
Cc: lingtong@qti.qualcomm.com, cacar@qti.qualcomm.com,
        sandheep@qti.qualcomm.com, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793571679; l=3736;
 i=ekangupt@qti.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=jwnH5cfp8M6GHrX4Z/62vWuSavKSWMU+7o5H4b+rDhI=;
 b=e5bP4QRM4M++NoUYF49dvgjnn6jVgLjcjBzplELgWbocjqksZsYZ+UeV+0spKYA4N1U2Y6IMe
 CXSX78olZOjCfKLCICBHH6b1BTgTKI13Kv1urMO2RHlPcTyD5seSD2d
X-Developer-Key: i=ekangupt@qti.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-ORIG-GUID: VJloaG-aA6HF04NylS2A7o7tvH4sDKPU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfXxvH4eISOhNC3
 vQjMQgGI30gwzQAqQvpU6jjy47F1VsZA2gZdElxWZhXbdeLU6yyr18oAnvua5IjxWmIlvN4wR4C
 M3HyOH22PoGrBbpLOOXDFHbDeZigQvc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfXzex9f+y5bytU
 xOeRr5lugQz3ME8l7Ow5+bOI84/c5WXSeQG0xj2vZCN+jfMozul3SKmD/rEfW/pQwYrI/O6KuZK
 NRTNJ9QNa3lHEjTsQAwpj2JipSxV6GHwAxzvwxsiyAt6hizip6hBS1vWT63bUj867H+AJqerJUQ
 72Al1AeLnJ5oIkZJYtCT+rMW5Gku2LdYvbnjzs4uwivvjlQ5f/2es/o1gbPNf326VUw4oHOUZWP
 5XrI2wJUecQlO3AtbR5z4SlGlben7NZTo8aKzreWv5Yt8NJBSGxv8WDXFi39cs7n1cusltwOyeX
 0QuBQvUTT4bXqgJDIrcaMSjPYqYxl0REGP5j/3TMSpduOFHkhNWq4OyeQ2eWoWnPVBGaS6SXMMx
 CQLlpLgWLKbNngG81tSdkGfiEfq+tFcST3JSTgrjaHPvqtmq6cKSEdhusC2uk7fF92nkvqg3Dh0
 9o1ak8FJ/Ajo3wS5Opw==
X-Proofpoint-GUID: VJloaG-aA6HF04NylS2A7o7tvH4sDKPU
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae7bc6d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=co94-PkH9mM8E1aZUYUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010089

From: Ekansh Gupta <ekangupt@qti.qualcomm.com>

Wire FASTRPC_IOCTL_GET_DSP_INFO into the legacy FastRPC compatibility
shim on top of qda_fastrpc_get_dsp_info(), so existing user space can
query DSP capabilities through the /dev/fastrpc-* interface exactly
as it could with the driver this one replaces.

The device-wide capability cache introduced for the native
DRM_IOCTL_QDA_QUERY path is reused as-is; the shim only has to
translate between the legacy fastrpc_ioctl_capability layout and the
shared qda_fastrpc_get_dsp_info() call.

Signed-off-by: Ekansh Gupta <ekangupt@qti.qualcomm.com>
---
 drivers/accel/qda/qda_fastrpc_shim.c | 20 ++++++++++++++++++++
 drivers/accel/qda/qda_legacy_ops.c   |  6 ++++++
 drivers/accel/qda/qda_legacy_ops.h   |  2 ++
 3 files changed, 28 insertions(+)

diff --git a/drivers/accel/qda/qda_fastrpc_shim.c b/drivers/accel/qda/qda_fastrpc_shim.c
index c1464b1adbc2..2be1dd116ef7 100644
--- a/drivers/accel/qda/qda_fastrpc_shim.c
+++ b/drivers/accel/qda/qda_fastrpc_shim.c
@@ -463,6 +463,24 @@ static long qda_shim_mem_unmap(struct qda_shim_file *sf, void __user *argp)
 	return 0;
 }
 
+static long qda_shim_get_dsp_info(struct qda_shim_file *sf, void __user *argp)
+{
+	struct fastrpc_ioctl_capability args;
+	int err;
+
+	if (copy_from_user(&args, argp, sizeof(args)))
+		return -EFAULT;
+
+	err = qda_legacy_ops_table.get_dsp_info(sf->session, args.attribute_id, &args.capability);
+	if (err)
+		return err;
+
+	if (copy_to_user(argp, &args, sizeof(args)))
+		return -EFAULT;
+
+	return 0;
+}
+
 static long qda_shim_invoke(struct qda_shim_file *sf, void __user *argp)
 {
 	struct qda_legacy_invoke_arg *largs;
@@ -550,6 +568,8 @@ static long qda_shim_dispatch(struct qda_shim_file *sf, unsigned int cmd, void _
 		return qda_shim_mem_unmap(sf, argp);
 	case FASTRPC_IOCTL_INVOKE:
 		return qda_shim_invoke(sf, argp);
+	case FASTRPC_IOCTL_GET_DSP_INFO:
+		return qda_shim_get_dsp_info(sf, argp);
 	default:
 		/*
 		 * Includes FASTRPC_IOCTL_FREE_DMA_BUFF, which the driver this
diff --git a/drivers/accel/qda/qda_legacy_ops.c b/drivers/accel/qda/qda_legacy_ops.c
index fc5e94c0c9bc..8d9d597c76c2 100644
--- a/drivers/accel/qda/qda_legacy_ops.c
+++ b/drivers/accel/qda/qda_legacy_ops.c
@@ -188,6 +188,11 @@ static int legacy_invoke(struct qda_session *session, u32 handle, u32 sc,
 	return qda_fastrpc_invoke_legacy(session->qda_dev, session, handle, sc, args);
 }
 
+static int legacy_get_dsp_info(struct qda_session *session, u32 attribute_id, u32 *capability)
+{
+	return qda_get_dsp_capability(session->qda_dev, session, attribute_id, capability);
+}
+
 const struct qda_legacy_ops qda_legacy_ops_table = {
 	.session_create = legacy_session_create,
 	.session_destroy = legacy_session_destroy,
@@ -201,5 +206,6 @@ const struct qda_legacy_ops qda_legacy_ops_table = {
 	.alloc_dmabuf = legacy_alloc_dmabuf,
 	.import_dmabuf = legacy_import_dmabuf,
 	.invoke = legacy_invoke,
+	.get_dsp_info = legacy_get_dsp_info,
 };
 EXPORT_SYMBOL_FOR_MODULES(qda_legacy_ops_table, "qda_fastrpc_shim");
diff --git a/drivers/accel/qda/qda_legacy_ops.h b/drivers/accel/qda/qda_legacy_ops.h
index 95a169edc594..c79003021fc1 100644
--- a/drivers/accel/qda/qda_legacy_ops.h
+++ b/drivers/accel/qda/qda_legacy_ops.h
@@ -57,6 +57,8 @@ struct qda_legacy_ops {
 	/** @invoke: Run a method on the DSP; takes ownership of each @args[i].obj */
 	int (*invoke)(struct qda_session *session, u32 handle, u32 sc,
 		      struct qda_legacy_invoke_arg *args);
+	/** @get_dsp_info: Query a DSP capability attribute */
+	int (*get_dsp_info)(struct qda_session *session, u32 attribute_id, u32 *capability);
 };
 
 extern const struct qda_legacy_ops qda_legacy_ops_table;

-- 
2.34.1

