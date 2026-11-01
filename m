Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571833;
	b=KUhG08CuVPpsv3JDuNcl0ziZJu7ZQztStvImRCaMR7ziZcYB1GPrY5Zy6pyRs6+7O9Xg
	 IFjKlRy/OgkfZfDOU5hfgCVed6CD18SGzHZ8RNoXnJbqmvzELHY3bICJ2LnP1uqW2bGpn
	 PIbjTEfUMsdKhsHnqzb+pRvvnYY7XntYoQCUCtgqZ44Y/NCwmdcc5PfEfsomCB7quZhTC
	 OfWesNcVJ99bED1rLUM0wM3hWoda8uiUOYCPJP9Ym7I9rraMq2Dfcnki7e0G2Y2HNKwhD
	 dWqy3p4yxDU7GqMSPOg9v1KKB8NLH35eqBF/1uwyUYfhp0TAt6ON4hK9gRo3JESPhpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571833;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qRDJJBZlza5pBRCaWFAM5MPcJFDxu7gSBMchw7P24uw=;
	b=DgNltAUY1Ypvy1QvRtRWIhta5RUmQVNMHQk6YQxIRz70dDOknbw6DzsPBYJMRLi7gvSC
	 X1jT1Umjys10E6RYpRDzMZ3ex3TaDgSwKoNGy0hoz7lEe8kt2Rk4zkgxxbjSx+qeB1NNL
	 OShDZuPlQm76z4lmEbDYHK5mtTz/Vb7v2j8IzVTuoM8ABBwT9JiEA4ROmCx8MvwW6i3fA
	 WFdg2mMJY3R1AKgM+71kW1/7b6jIPspDmkNqEX/+hPNXpSgNEojtPAGabpwo7fHuj2Y3Z
	 kCLEuB1cRAm/0vYgRKOQE/hqZ6QQw4ldEiDzhd655Gbwef6Dp05qvonPGFDDpIULfeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zfzp3P+M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DIdwUa9h;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87876606F684
	for <linux-doc@vger.kernel.org>; Sun,  1 Nov 2026 22:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87876606F684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zfzp3P+M;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DIdwUa9h
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1KK5gr2401198
	for <linux-doc@vger.kernel.org>; Sun, 1 Nov 2026 22:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qRDJJBZlza5pBRCaWFAM5MPcJFDxu7gSBMchw7P24uw=; b=Zfzp3P+Mvp2uOAJF
	WbWy/eFL0IYk+jOozgl65lyrc4rjdh8U9GNi/9Ehkf77TeC1GuLRRecjYZuKXr+b
	pBpr6Tjt6oj8RGdd5sTZ5vMjoji3VwfTlZ65/R615qhkigiK8NFdmMi+jYcnaF4/
	LBhV4g47b5WOG7Venc31x7vcdHLhUWTbz3DgIpkfihQ461IW55vIjzQ75+eHFtJl
	pQSYm8RfC/Pd0P3VPD9DbAHZzBqLG1HqXMkDJRccnvKWIMxfzyCLz7u21AGahX59
	KNsThKwMgjCcMdh5H+sK4Pkn8ByMrP8XhaUV2Z/Voj6AB0hFGyLLH+p2RBPW2np+
	4squ1g==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7wxmb4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 01 Nov 2026 22:23:51 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-147be78cd56so5124503c88.1
        for <linux-doc@vger.kernel.org>; Sun, 01 Nov 2026 14:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793571830; x=1794176630; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRDJJBZlza5pBRCaWFAM5MPcJFDxu7gSBMchw7P24uw=;
        b=DIdwUa9hZl+oYh8ZiLqYnGoUU7HfmWuyJx6eE2XYqOsjPBWIxPkq6W3M6vQc5+l+Vm
         IXt9LiL6bk3x37vsUHycCX5UUtL0FtYRRX6oLLYr8UECtZDn2njiXMdmkbM6hDQPMQK8
         Hk9/EV2a80z8ba0DblSwdTRvYJ/Q/bIp1GLPi8p/Wqi48JTtqX4UzSytTj1KmxUsNIsX
         UuqDTBozq3neY4Enl26mHtgrUEo0O3tuvJTA3BaMF++XU9rEXp5On5b8buIUIzhYe0xK
         rFRx0Vv12tTit9glLgPXeAwWu0umuGnq4E5C9x4wh8Faidcg6QBejcGSVTa23ztclvQX
         qZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571830; x=1794176630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRDJJBZlza5pBRCaWFAM5MPcJFDxu7gSBMchw7P24uw=;
        b=cf/ZyCLn8fyQ8aPeCgq2xD+GDvtzQ/Rv9BzmJSNZT1eSH6yWCGCp55Oil1n47sHBG/
         glYzVyikybsD9BcONflwXrX3F/Lbhbd8UGr0SQZYMnF07abS9cw3y7tSYvhs3xFP9ZvV
         +lBDCdqE4FIcYlwhHxmOvo8/1SxnKPnicKxG8d+DZihKVmpgo0ZxpVo9Lj3ky4Igt/yh
         wIKwerFmPHh18Bm5Oe4nRMtftrSPAkpksZAgCMFaENy0MkGrsFjDMFreLExnznEhG9HY
         e0gGLOnz9gPO+U7MF0ELMgOSbY1P4C2apuVnAP7sdBaq6db63h67qgcoE46Y6qJBGX7X
         X+2A==
X-Forwarded-Encrypted: i=1; AKwUvBzlkZrr+R0L2B7syA3HPJVPISPNsWGsRwBViJuczcyRZjnuvnFluXJLbiijqRjR9ZbQNGmZ2v7gwBw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKH6qGUdooO/mqGwWoKkPssLFpzGYYZkeQ+Xb5T1tdSkjECE821
	2kAEpdVsEQGpn9YsW9EjIKMnk9nbBNCqFPhP8R5zvO/utSTLK3x/DbQ/xB4jEJOE0eI3Cjm14Ct
	kjyVS8Yg8S25bxs2n/QDBtFCDlRtzd7LU0SeFsDHoJd7VK6pHKGJ2/T0z/V3caic=
X-Gm-Gg: AYBFou2+H1ya8kKimSenvYkyfraijZCSwrzr8rJuie3bEB86g1+Af4bAetT8Mp2vlnE
	mSYUrsPC3CjWQ/fXGPKY3j+Zg3IP9Z0Sk/buxBBzSXvlBfHTFdlCJ083Pr/h20WTV08yQ6wSZfm
	SB0sGjiCLomJx6zbvfKsB1bpEun2L2V9a+TudoDOyrBgjl9+Ow3NmWOHICb6YbcEK9eZnjIlY6q
	4aHEjStXCEAa5cYKU97fuH2GP7NWTA+SP1OFbFqrzj0I3AKPqvH6Tcn3PrPX6gyAUAK8Y4SzVV1
	Rxwi84viJrJy25dQPJgvRvZiiUvZeWWxI3yltzr11v16Zb7uOF43dYJCi0XCJQnz8BO4RoUsA2O
	wNJ8a/JZ6PYSgAWf0COj91z+2EIHQUntEGu/ufpfYimheWTIWfwh2hXGnNtpO4UMfr9fs01aUjp
	9439e0Tw==
X-Received: by 2002:a05:701b:464a:b0:165:aced:1fde with SMTP id a92af1059eb24-1ac4f91fcd6mr11371174c88.0.1793571830259;
        Sun, 01 Nov 2026 14:23:50 -0800 (PST)
X-Received: by 2002:a05:701b:464a:b0:165:aced:1fde with SMTP id a92af1059eb24-1ac4f91fcd6mr11371115c88.0.1793571829609;
        Sun, 01 Nov 2026 14:23:49 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1932sm27742653c88.2.2026.11.01.14.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:23:49 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 03:51:26 +0530
Subject: [PATCH v4 13/25] accel/qda: Add the invocation ioctl and teardown
 on unplug
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
Message-Id: <20261102-v4-v4-13-88f2f24a5f0b@qti.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793571679; l=8842;
 i=ekangupt@qti.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=AUsO6Q67rYlFvmpU6Tfv1oiM1A0lyQ8V08TbEWqNKj0=;
 b=3qRk2mfPmtkGwLwTSYOdx2hIbxP7OlKadhZUpBVItdPwlar3G60UFHEi0GCOYCurhtn6OWvF9
 SokskmW4KBcCS6lYD/HWa0N8wtwYLFnUq0INbzIBaXn57x/vvnMF4nt
X-Developer-Key: i=ekangupt@qti.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-GUID: u7wZjd_Q7HXSBQz0sa0bJ08iLHK2A4bs
X-Proofpoint-ORIG-GUID: u7wZjd_Q7HXSBQz0sa0bJ08iLHK2A4bs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfXyMIsyqiP7F8S
 6+3SL1B8bL3DlZvmO2qre5RLp0WJl2VyGyTUOnEN/ywfemNwinDSVCCrj7pyll9pm+7jch6q8Wx
 ZdS0j3Wg3rMmcxVI3JOYOZRskc53orE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX3spJPIZggVCY
 p8A3e5W7l9GKnkQtaoQta8ZFdfkSesuYyZUDK+SkjQU4bHB4uoy0DgKN46nkde71EaQbipvPpqq
 v/B7vg5L5GbR2z6vdTI7ADzf33+N/lUsfbRSG9pSYRKesO5N+/2tuFtRJjyPeAmXs1S36EYQx6i
 ivpIx1ArQp+9FaHMxVsiaqOWbG2ZTQkEm+PEOZmc/OB6BNLm6CE/O6kOzqTYn+ChJJ9Yz/mQr2n
 4Q7omgQLj4ZmyCuI3jK9Y8BpOEM97gDsnJu7ZiIk52W0VVlil3g8KhjSfux7+cZHIpy/NcILBiJ
 VxRepY0g770g58sGuwLJoFSZaxCRiSK7lxPF00Hx0yO4C4gCXhA7CWloxxP+QaNBBfS4wyqEqK5
 Z25xg/q6eH+SgxWUYaQOJJahFPZvjc7OIR9f1j+uZPmyk6lKGK5NZnEsiWxJDsn2/GSqB4gL4mI
 OvLG0rloUunT1KjgNuQ==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6ae7bbf7 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ABjhkyQy1TsoSMdrgBYA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010089

Tie the invocation pieces together behind an ioctl: allocate an
invocation, take its arguments from user space, build the payload, send
it to the DSP, wait, and act on the answer.

The wait is interruptible, so a DSP that never answers does not leave
the caller unkillable. An interrupted caller drops its own reference and
returns, but the invocation lives on, because the DSP still owns the
payload buffer and may write into it. It is freed once the DSP answers
or the transport goes away.

When the remote processor goes away, invocations may be waiting for
answers that will never come. Those waiters are failed with -EPIPE
and woken so they can release the buffers they hold. The flush runs
after the device is unplugged, so the response handler is drained and
the flush is the only thing completing invocations.

The flush drops the reference the send path took for the response. An
invocation that has not been sent yet, or whose response has already
been handled, does not hold that reference, so the flush can drop one
that is not its own. Both windows are narrow but open exactly when the
DSP crashes.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/qda/qda_drv.c     |  1 +
 drivers/accel/qda/qda_fastrpc.c | 67 +++++++++++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_fastrpc.h |  2 ++
 drivers/accel/qda/qda_ioctl.c   | 36 ++++++++++++++++++++++
 drivers/accel/qda/qda_ioctl.h   |  1 +
 drivers/accel/qda/qda_rpmsg.c   |  1 +
 include/uapi/drm/qda_accel.h    |  3 ++
 7 files changed, 111 insertions(+)

diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index 99bd37fca438..7d44342d3f67 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -110,6 +110,7 @@ static const struct drm_ioctl_desc qda_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(QDA_QUERY, qda_ioctl_query, 0),
 	DRM_IOCTL_DEF_DRV(QDA_GEM_CREATE, qda_ioctl_gem_create, 0),
 	DRM_IOCTL_DEF_DRV(QDA_GEM_MMAP_OFFSET, qda_ioctl_gem_mmap_offset, 0),
+	DRM_IOCTL_DEF_DRV(QDA_REMOTE_INVOKE, qda_ioctl_invoke, 0),
 };
 
 static const struct drm_driver qda_drm_driver = {
diff --git a/drivers/accel/qda/qda_fastrpc.c b/drivers/accel/qda/qda_fastrpc.c
index 2971f2f9461f..3a1959e2c53e 100644
--- a/drivers/accel/qda/qda_fastrpc.c
+++ b/drivers/accel/qda/qda_fastrpc.c
@@ -10,6 +10,7 @@
 #include "qda_drv.h"
 #include "qda_fastrpc.h"
 #include "qda_gem.h"
+#include "qda_rpmsg.h"
 
 /*
  * The caller owns the returned reference and must drop it with
@@ -484,6 +485,72 @@ int qda_fastrpc_invoke_pack(struct qda_fastrpc_invoke_ctx *ctx, struct qda_msg *
 	return 0;
 }
 
+/**
+ * qda_fastrpc_flush_pending() - Fail every invocation still in flight
+ * @qdev: Device whose invocations should be failed
+ *
+ * The DSP has gone away and will never answer, so stand in for the response
+ * handler: wake each waiter with an error and drop the reference the send
+ * path took for that handler. Each waiter then tears its invocation down,
+ * releasing the buffers it holds.
+ *
+ * Must run after drm_dev_unplug() has drained the response handler, so this
+ * is the only path completing an invocation.
+ */
+void qda_fastrpc_flush_pending(struct qda_dev *qdev)
+{
+	struct qda_fastrpc_invoke_ctx *ctx;
+	unsigned long idx;
+
+	xa_for_each(&qdev->ctx_xa, idx, ctx) {
+		ctx->retval = -EPIPE;
+		complete(&ctx->work);
+		kref_put(&ctx->refcount, qda_fastrpc_context_free);
+	}
+}
+
+/**
+ * qda_fastrpc_invoke_common() - Shared tail of a FastRPC invocation
+ * @qdev: Device to invoke on
+ * @ctx: Invocation whose arguments are already prepared
+ *
+ * Packs the invocation into a message, sends it, waits for the DSP, and acts
+ * on the answer. Common to the accel UAPI and the legacy shim, once each has
+ * prepared ctx->args and ctx->gem_objs by its own means.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_fastrpc_invoke_common(struct qda_dev *qdev, struct qda_fastrpc_invoke_ctx *ctx)
+{
+	struct qda_msg msg = {};
+	int err;
+
+	err = qda_fastrpc_invoke_pack(ctx, &msg);
+	if (err)
+		return err;
+
+	err = qda_rpmsg_send_msg(qdev, &msg);
+	if (err)
+		return err;
+
+	err = qda_rpmsg_wait_for_rsp(ctx);
+	if (err)
+		return err;
+
+	/* Ensure the results written by the DSP are visible before reading */
+	dma_rmb();
+
+	err = ctx->retval;
+	if (err) {
+		drm_dbg_driver(&qdev->drm_dev, "DSP returned status %d\n", ctx->retval);
+		return err;
+	}
+
+	qda_fastrpc_cleanup_handlelist(ctx);
+
+	return 0;
+}
+
 /*
  * INVOKE_DYNAMIC: the argument descriptors are supplied by user space, which
  * is also responsible for having imported every buffer to a GEM handle.
diff --git a/drivers/accel/qda/qda_fastrpc.h b/drivers/accel/qda/qda_fastrpc.h
index 8440efc21b77..61f80c64e6d2 100644
--- a/drivers/accel/qda/qda_fastrpc.h
+++ b/drivers/accel/qda/qda_fastrpc.h
@@ -205,5 +205,7 @@ void qda_session_msg_buf_pool_destroy(struct qda_session *session);
 int qda_fastrpc_prepare_args(struct qda_fastrpc_invoke_ctx *ctx,
 			     struct qda_session *session, void *argp);
 int qda_fastrpc_invoke_pack(struct qda_fastrpc_invoke_ctx *ctx, struct qda_msg *msg);
+int qda_fastrpc_invoke_common(struct qda_dev *qdev, struct qda_fastrpc_invoke_ctx *ctx);
+void qda_fastrpc_flush_pending(struct qda_dev *qdev);
 
 #endif /* __QDA_FASTRPC_H__ */
diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
index b11743ab791e..e9f4151e344a 100644
--- a/drivers/accel/qda/qda_ioctl.c
+++ b/drivers/accel/qda/qda_ioctl.c
@@ -6,6 +6,7 @@
 #include <drm/drm_gem.h>
 #include <drm/qda_accel.h>
 #include "qda_drv.h"
+#include "qda_fastrpc.h"
 #include "qda_gem.h"
 #include "qda_ioctl.h"
 
@@ -73,3 +74,38 @@ int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_fil
 
 	return drm_gem_dumb_map_offset(file_priv, dev, args->handle, &args->offset);
 }
+
+static int qda_fastrpc_invoke(void *data, struct qda_session *session)
+{
+	struct qda_dev *qdev = session->qda_dev;
+	struct qda_fastrpc_invoke_ctx *ctx;
+	int err;
+
+	ctx = qda_fastrpc_context_alloc(qdev);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	err = qda_fastrpc_prepare_args(ctx, session, data);
+	if (err)
+		goto out_put;
+
+	err = qda_fastrpc_invoke_common(qdev, ctx);
+
+out_put:
+	kref_put(&ctx->refcount, qda_fastrpc_context_free);
+
+	return err;
+}
+
+/**
+ * qda_ioctl_invoke() - Run a method on the DSP
+ * @dev: DRM device structure
+ * @data: User-space data (struct drm_qda_invoke_args)
+ * @file_priv: DRM file private data
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_ioctl_invoke(struct drm_device *dev, void *data, struct drm_file *file_priv)
+{
+	return qda_fastrpc_invoke(data, file_priv->driver_priv);
+}
diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
index d1cbbfb6d965..3bb9cfd98370 100644
--- a/drivers/accel/qda/qda_ioctl.h
+++ b/drivers/accel/qda/qda_ioctl.h
@@ -11,5 +11,6 @@
 int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qda_ioctl_gem_create(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_file *file_priv);
+int qda_ioctl_invoke(struct drm_device *dev, void *data, struct drm_file *file_priv);
 
 #endif /* __QDA_IOCTL_H__ */
diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
index 43b56ab3f012..7e58df3eb2e1 100644
--- a/drivers/accel/qda/qda_rpmsg.c
+++ b/drivers/accel/qda/qda_rpmsg.c
@@ -160,6 +160,7 @@ static void qda_rpmsg_remove(struct rpmsg_device *rpdev)
 	 */
 	drm_dev_unplug(&qdev->drm_dev);
 	qdev->rpdev = NULL;
+	qda_fastrpc_flush_pending(qdev);
 	qda_cb_unpopulate(qdev);
 	qda_deinit_device(qdev);
 }
diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
index 6d81f0ef47b6..c21bc5b2446c 100644
--- a/include/uapi/drm/qda_accel.h
+++ b/include/uapi/drm/qda_accel.h
@@ -15,6 +15,7 @@ extern "C" {
 #define DRM_QDA_QUERY			0x00
 #define DRM_QDA_GEM_CREATE		0x01
 #define DRM_QDA_GEM_MMAP_OFFSET		0x02
+#define DRM_QDA_REMOTE_INVOKE		0x03
 
 #define DRM_IOCTL_QDA_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_QUERY, \
 					 struct drm_qda_query)
@@ -22,6 +23,8 @@ extern "C" {
 					 struct drm_qda_gem_create)
 #define DRM_IOCTL_QDA_GEM_MMAP_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_GEM_MMAP_OFFSET, \
 					 struct drm_qda_gem_mmap_offset)
+#define DRM_IOCTL_QDA_REMOTE_INVOKE	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_REMOTE_INVOKE, \
+					 struct drm_qda_invoke_args)
 
 /* Query type definitions for drm_qda_query */
 #define QDA_QUERY_DSP_NAME		1

-- 
2.34.1

