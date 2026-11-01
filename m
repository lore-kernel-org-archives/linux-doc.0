Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571811;
	b=WQU/HJYHQTnWMEVCV+AQJTHcW2glu5VGsCxcwT03XH6Ut2rhLSGKPdiAjQp8t4uLuH/i
	 5Z3UY6YR3UEP4lfqH2M8sJFT7WRFXxYlSv1siG3GAXSAenLMd22ol9oBGD10mYIOSJ/+E
	 wOduUnB6wQndYXnbH7o60PW6e4GgNgDIi6CqQ9YACTh+/e8BVL86E3aG1DLZzv+DchYSn
	 4zMQCAaOC3oB0YijpCM1Ly1lnDcjEp4JFK/otDLSOsgnL7Yx7hj8uTynk9LZ6FEsW2xjn
	 0RvBDfqwyHN4AcnJPDeAP7MYJX4ssAzrXWa0mnhPYc7OqEBlX051hS2fXKx27Ls2tSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571811;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZbSjJHNr7gVsGUHniWVZPCFLIFyV9I4K9HbwvGRxR+A=;
	b=C0mvRg7RpARNQETrFIYOFXjMb0yJGFf7Guhct+CGRB6IAh5+B2w0uNf/tu4p8AOQ8cii
	 eDrHJhmBMecttW4LM5KPRWUrGAlQ0PGKGsT4AdFEDxYWgp0j9u0lj5WRwPRMHVf+KIUCG
	 9O0E5LOH3WrqzA4tTJpO/yon/ir4hFp6OfH6QXYBIhZKg6R/bUyY0LDoyO/K95fn38gyA
	 5xgeeD5LFQIh63saLqXiHNFGYJs/Xj+8C94IdtE2pcqDVRCV1QqcBcOslRc475d2YHeSI
	 s9IMg6C+J/7TTkQHAOxx3PeGaOijDjp5vMYVPKkUDBLcfzDY38Yc0oC0ue0zS41frYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GAvuHWb4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gBiaQW+N;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0840606F2C1
	for <linux-doc@vger.kernel.org>; Sun,  1 Nov 2026 22:23:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0840606F2C1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GAvuHWb4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gBiaQW+N
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1KKVj31246223
	for <linux-doc@vger.kernel.org>; Sun, 1 Nov 2026 22:23:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZbSjJHNr7gVsGUHniWVZPCFLIFyV9I4K9HbwvGRxR+A=; b=GAvuHWb4pYesFrep
	0Hr2lHr0Oo1mSI/fGERls+6P2tslAmskuSO0maLB5GvQRiq5rclNCFyfR55CCstA
	he0L4myGDs6H9w1x4UaFhvdVym99KjKv93TDuAukqcgy2Q9eLbasF4pIxPnvPZzs
	oqcED9iwQR+l43mT4h3HQ+QdmpqL74DK+OzNGwi1BvPpNGKy4sPC34FhBmGtiCni
	KpJo4JJCKXEX+yaEd7LLUlL0JarFZBLG4L6jwA05hui07TpCTiiU0g3zs8PRTR24
	Fznxwr4w05bjAmeO9H3N6+ngY8QHMQiEwQrHqdYTXngvLyMiYFeTvRZ1yWsBqV8Q
	tDfKtQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93em62y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 01 Nov 2026 22:23:29 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1aa0fb7f157so3661456c88.0
        for <linux-doc@vger.kernel.org>; Sun, 01 Nov 2026 14:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793571809; x=1794176609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZbSjJHNr7gVsGUHniWVZPCFLIFyV9I4K9HbwvGRxR+A=;
        b=gBiaQW+NEdjt91L1j/d4Vue9igwraELp/PHW1xxlgR3MdGTQF1taRtGkhdg8rqUNKS
         c2ONCyzzLdJK7IDv+qRTKRAVCeuKM9QsNI+Zf7h1B+vqmOB6hozbNH+Om3KUUXQJm1Zn
         ERVWxOAhCYtTgDKxD0hgCttaiUkpWJ1Mf72X6ECPXg81EhLKVdGR6He2uVzteGjbZUf1
         hHCN6QXz0DzWwrh0+FL7EeCLo0Gcm3KqQ2cZ3k93k99RpPpJgCJ4t8a9unmCLP9C1Thk
         pr/BrjbK27gN2nkPCNPwfs5rm6cC0oitB90JFYFIVYVCZHOHSnlxbD5SlCqrY22XT1rg
         0ADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571809; x=1794176609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZbSjJHNr7gVsGUHniWVZPCFLIFyV9I4K9HbwvGRxR+A=;
        b=0uCO5sy2iI1UWP9NtlhyMoKBJFdu953eGUpnufE6mtbCpoDmORFAd3xZxyW1dIMo7h
         p5rTBR+WkiEpUotoEank8IDcYgKfhcMU1/Q6L9h8E34CrUyhPlpH4dkYf2v2t1fqo2HD
         h7/I2nLNR4JdAD2UCqHuIaQpetdoegJpK5GG2rIjw/g/2PdRSUnkA1BO8fn8hEw4v84E
         4G9XdS0bsXwe0e+/gRLfrMRfJG0mfGH4KQl70eSCBJMd5N92v0eoKUDfIuBBiMtYgsKP
         JzJMD5oYam1QTpH6tjwWI2sQugNhlRrWnJsWGfTH+H0SCf2zo0O9fQHav/YlyVaIx8hd
         Z0Gw==
X-Forwarded-Encrypted: i=1; AKwUvBwj3jA5HJi/m7wdumq/K4IIH4S1++vjfBNbJu3cwEJS3yekD0zHlanWr06zLSjDKkpKHrqOUDfbs+s=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0Fw5yg3fjYOI0dPgat5G4VX154kWYVwI0rFeMT754IfAGOSVH
	QxTaYtppXaicrLixSgbGlTFedl4cmS+3FvyWktRUEkrRlavRNAzVw/2nGr4iE3qS2+FcsbN7Dn0
	/4b5KY+POgTvSsUwuAQkBz0FejAJnba38zFHikPXvWRQ8s4R5NldhIo3eOuQcVNw=
X-Gm-Gg: AYBFou2WHZZIzbWEBqzbPkRLkrnr4bFkuo22UELVIk5XQjqtmlzfvcRx82feAqlnk6B
	fGqHJ/52zm/srmw25dTmm1CfLrHKhSVOqvLo8hIyiqXWDvLRgvlwBOzVvHklSVlw3yFdyzqKr5W
	H6oXZekLxr/p1ChgncAx7V98bS2aEaTtPnsDnv0DSzRo0ZZyF0Rg5TnpTMkImNEWXd0WNdYMyns
	OAjIqXEUWW5k6jW+AKQiVjRfkI019LvYUHE/+WdaZpt3Mk8IXmz9TArjsxKMB/zMUnmbCQwHDBA
	17zQQe7jt3SONhWkxOWUiXJ5Tc1mA6UBKx1bF6B+XRIS2jjx9DQoDaNOAvbUEypSEqRZsKlt/hP
	9/Hwxq81rI19TOCdT/ilXlDtKX2+xMILaNfI1mQynvDwk5BGYD9k5QasSMzxQ9Br8rQ3Uv+GHZL
	Te0QMRdA==
X-Received: by 2002:a05:7022:1301:b0:128:d4be:7428 with SMTP id a92af1059eb24-1ac5bda586bmr12428487c88.19.1793571808977;
        Sun, 01 Nov 2026 14:23:28 -0800 (PST)
X-Received: by 2002:a05:7022:1301:b0:128:d4be:7428 with SMTP id a92af1059eb24-1ac5bda586bmr12428411c88.19.1793571808100;
        Sun, 01 Nov 2026 14:23:28 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1932sm27742653c88.2.2026.11.01.14.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:23:27 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 03:51:24 +0530
Subject: [PATCH v4 11/25] accel/qda: Add RPMsg send and response dispatch
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
Message-Id: <20261102-v4-v4-11-88f2f24a5f0b@qti.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793571679; l=9485;
 i=ekangupt@qti.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=SK7TITjjEJjLXL9NIr2Dwt9DhcJdmdMLKRMTOVSL2MY=;
 b=b5qEUCgHo5niIV/sQMuegxpQ7xFuktORDgEzvE7WPftarWKLVolYGM88Zhf5GlTla1oLJmXXI
 ORWFla1yB96DwZlwss9nj5GOdFMdLaBI+gvumr2hV8iWi0tPJUpFN6d
X-Developer-Key: i=ekangupt@qti.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfXw8/g5TGoiVV8
 a0Z/1CfsufP04Wr/mQZ1Mi0mKqzbgq9WNO7UdypSNbvlpZ7nDZZhk+mpd8ggGkuZdP8ob2A5aZf
 cjWkKqoxQcDgK2d9HoO5fxFS1ZRRqlvC4TO9/Gsw5fuZFPSBdFn19aj7HCEQhJYjc/4zZ5GentB
 QNDFQv7i5Y0scTzlqJK+c5++inG5MxNL5+Z8b6xPebCcpksj9W4MRnRECaH3pzFgyN/JyW4Lf5j
 bXNMw/dB5alJXcIivsp8Q0EGBwNadYUEOn2OGMXwUsqT3wh3YmoNlnUk1LZZAIiA+m82cu4ne0o
 mw7jM4ol6mUVu1IqkVrmBMnifVy52a1ZUsBLFBKztSTBCGVpmdoDt5wmlqjbjptLK6ac5wUFRpp
 0tr7CZ01CEjdx3s2fSRNHkECq0xtgpfNzml3PA4SaZ2L+/cUF8/wBVv15mR+gjPd+GKFKu1VM4R
 A2Gjmmvqk/tnL8AgD5w==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae7bbe1 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=4ib3UtCfM2bKzMqrc9cA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: FBWdV3bbq-w9QI3RwJRlxkkH8TT-UCs2
X-Proofpoint-GUID: FBWdV3bbq-w9QI3RwJRlxkkH8TT-UCs2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX8jOu8sTPv9ZI
 gD6XmdL/lUxEhHOqnfQ9noiq3tB6A+YJy4jIQ71lN8Q3LSt30Nvklx4C4UWGvh2Krx4O4WBQx7X
 bKj+m8EAZBbsL79OQOyAYJIwulN7MY0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010089

An invocation reaches the DSP as an rpmsg message, and the DSP answers
with a second message naming the invocation. Add both directions, along
with the wire message itself and the kernel-side bookkeeping that is
carried alongside it.

Sending takes a reference on the invocation for the response handler, so
the invocation stays alive even if its caller stops waiting for the
answer. If the send fails, that reference is dropped again here, because
no response will come to drop it.

A response is data the DSP wrote, so the handler checks that the whole
message is there before reading any of it, then looks the invocation up
by the context ID the DSP echoed. Context IDs are narrow and get reused,
so a late or duplicate response can name an ID that now belongs to a
newer invocation. The handler compares the sequence number as well and
drops a response that does not match, rather than completing the wrong
invocation early.

The handler runs in atomic context, and dropping the last reference
frees the context's DMA buffers, so that reference is dropped from a
worker instead.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/qda/qda_fastrpc.c |   9 ++++
 drivers/accel/qda/qda_fastrpc.h |  44 +++++++++++++++++
 drivers/accel/qda/qda_rpmsg.c   | 107 ++++++++++++++++++++++++++++++++++++++--
 drivers/accel/qda/qda_rpmsg.h   |  26 ++++++++++
 4 files changed, 182 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/qda/qda_fastrpc.c b/drivers/accel/qda/qda_fastrpc.c
index 14d9da8c20b3..ec37a38e9215 100644
--- a/drivers/accel/qda/qda_fastrpc.c
+++ b/drivers/accel/qda/qda_fastrpc.c
@@ -22,6 +22,14 @@ void qda_fastrpc_context_free(struct kref *ref)
 	kfree(ctx);
 }
 
+static void qda_fastrpc_context_put_wq(struct work_struct *work)
+{
+	struct qda_fastrpc_invoke_ctx *ctx =
+		container_of(work, struct qda_fastrpc_invoke_ctx, put_work);
+
+	kref_put(&ctx->refcount, qda_fastrpc_context_free);
+}
+
 /**
  * qda_fastrpc_context_alloc() - Allocate an invocation and give it an ID
  * @qdev: Device the invocation is issued on
@@ -42,6 +50,7 @@ struct qda_fastrpc_invoke_ctx *qda_fastrpc_context_alloc(struct qda_dev *qdev)
 		return ERR_PTR(-ENOMEM);
 
 	init_completion(&ctx->work);
+	INIT_WORK(&ctx->put_work, qda_fastrpc_context_put_wq);
 	kref_init(&ctx->refcount);
 	ctx->qdev = qdev;
 	/* Anything but a status the DSP could send, until it answers */
diff --git a/drivers/accel/qda/qda_fastrpc.h b/drivers/accel/qda/qda_fastrpc.h
index face3b3336b6..170b513533b9 100644
--- a/drivers/accel/qda/qda_fastrpc.h
+++ b/drivers/accel/qda/qda_fastrpc.h
@@ -10,6 +10,7 @@
 #include <linux/completion.h>
 #include <linux/kref.h>
 #include <linux/types.h>
+#include <linux/workqueue.h>
 
 struct qda_dev;
 
@@ -28,6 +29,43 @@ struct qda_dev;
 #define QDA_FASTRPC_CTXID_SEQ_MASK	GENMASK_ULL(63, 16)
 #define QDA_FASTRPC_CTXID_MAX		(QDA_FASTRPC_CTXID_MASK >> 8)
 
+/**
+ * struct qda_fastrpc_msg - FastRPC wire message for remote invocations
+ *
+ * Sent to the remote processor via RPMsg. This is the exact layout
+ * the DSP expects; do not reorder or add fields without DSP firmware
+ * coordination.
+ */
+struct qda_fastrpc_msg {
+	/** @remote_session_id: Session identifier on the remote processor */
+	int remote_session_id;
+	/** @tid: Thread ID of the invoking thread */
+	int tid;
+	/** @ctx: Context identifier for matching request/response */
+	u64 ctx;
+	/** @handle: Handle of the remote method to invoke */
+	u32 handle;
+	/** @sc: Scalars value encoding in/out buffer counts */
+	u32 sc;
+	/** @addr: Physical address of the message payload buffer */
+	u64 addr;
+	/** @size: Size of the message payload in bytes */
+	u64 size;
+} __packed;
+
+/**
+ * struct qda_msg - FastRPC message with kernel-internal bookkeeping
+ */
+struct qda_msg {
+	/**
+	 * @fastrpc: Wire-format message sent to the DSP via RPMsg.
+	 * Must be the first member.
+	 */
+	struct qda_fastrpc_msg fastrpc;
+	/** @fastrpc_ctx: Back-pointer to the owning invocation context */
+	struct qda_fastrpc_invoke_ctx *fastrpc_ctx;
+};
+
 /**
  * struct qda_fastrpc_invoke_ctx - One invocation in flight
  */
@@ -46,6 +84,12 @@ struct qda_fastrpc_invoke_ctx {
 	 * handler.
 	 */
 	struct kref refcount;
+	/**
+	 * @put_work: Drops the response callback's reference from process
+	 * context, since the callback runs in atomic context and the final
+	 * put frees DMA memory.
+	 */
+	struct work_struct put_work;
 };
 
 struct qda_fastrpc_invoke_ctx *qda_fastrpc_context_alloc(struct qda_dev *qdev);
diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
index 14034e250555..43b56ab3f012 100644
--- a/drivers/accel/qda/qda_rpmsg.c
+++ b/drivers/accel/qda/qda_rpmsg.c
@@ -1,12 +1,17 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <linux/bitfield.h>
+#include <linux/completion.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/rpmsg.h>
+#include <linux/wait.h>
 #include <drm/drm_print.h>
 
 #include "qda_cb.h"
 #include "qda_drv.h"
+#include "qda_fastrpc.h"
+#include "qda_rpmsg.h"
 #include "qda_soc.h"
 
 /*
@@ -36,14 +41,108 @@ static struct qda_dev *qda_rpmsg_alloc_and_init_qdev(struct rpmsg_device *rpdev)
 	return qdev;
 }
 
-/*
- * The rpmsg core requires a callback, so one is registered from the start.
- * Responses are dispatched here once there are invocations to answer.
+/**
+ * qda_rpmsg_send_msg() - Send a packed invocation to the remote processor
+ * @qdev: QDA device structure
+ * @msg: Packed message to send
+ *
+ * Takes a reference on the invocation context on behalf of the response
+ * callback, which keeps the context alive until the DSP has replied.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_rpmsg_send_msg(struct qda_dev *qdev, struct qda_msg *msg)
+{
+	struct qda_fastrpc_invoke_ctx *ctx = msg->fastrpc_ctx;
+	int ret, idx;
+
+	if (!drm_dev_enter(&qdev->drm_dev, &idx))
+		return -ENODEV;
+
+	if (!qdev->rpdev) {
+		ret = -ENODEV;
+		goto out_exit;
+	}
+
+	kref_get(&ctx->refcount);
+
+	ret = rpmsg_send(qdev->rpdev->ept, &msg->fastrpc, sizeof(msg->fastrpc));
+	if (ret) {
+		drm_err_ratelimited(&qdev->drm_dev, "Failed to send rpmsg: %d\n", ret);
+		kref_put(&ctx->refcount, qda_fastrpc_context_free);
+	}
+
+out_exit:
+	drm_dev_exit(idx);
+
+	return ret;
+}
+
+/**
+ * qda_rpmsg_wait_for_rsp() - Wait for the DSP to answer an invocation
+ * @ctx: FastRPC invocation context
+ *
+ * Return: 0 once the response arrived, or -ERESTARTSYS if a signal
+ * interrupted the wait
  */
+int qda_rpmsg_wait_for_rsp(struct qda_fastrpc_invoke_ctx *ctx)
+{
+	return wait_for_completion_interruptible(&ctx->work);
+}
+
 static int qda_rpmsg_cb(struct rpmsg_device *rpdev, void *data, int len,
 			void *priv, u32 src)
 {
-	return 0;
+	struct qda_dev *qdev = dev_get_drvdata(&rpdev->dev);
+	struct qda_invoke_rsp *resp_msg = data;
+	struct qda_fastrpc_invoke_ctx *ctx;
+	int ret = 0, idx;
+
+	if (!qdev)
+		return -ENODEV;
+
+	if (!drm_dev_enter(&qdev->drm_dev, &idx))
+		return -ENODEV;
+
+	if (len < sizeof(*resp_msg)) {
+		ret = -EINVAL;
+		goto out_exit;
+	}
+
+	ctx = xa_load(&qdev->ctx_xa, FIELD_GET(QDA_FASTRPC_CTXID_MASK, resp_msg->ctx));
+	if (!ctx) {
+		drm_dbg_driver(&qdev->drm_dev, "No context matches response 0x%llx\n",
+			       resp_msg->ctx);
+		ret = -ENOENT;
+		goto out_exit;
+	}
+
+	/*
+	 * Context IDs are only 8 bits wide and are recycled once a context is
+	 * freed, so a late or duplicate response may name an ID that now belongs
+	 * to a newer context. The sequence number tells the two apart.
+	 */
+	if (FIELD_GET(QDA_FASTRPC_CTXID_SEQ_MASK, resp_msg->ctx) !=
+	    FIELD_GET(QDA_FASTRPC_CTXID_SEQ_MASK, ctx->ctxid)) {
+		drm_dbg_driver(&qdev->drm_dev, "Dropping stale response 0x%llx\n",
+			       resp_msg->ctx);
+		goto out_exit;
+	}
+
+	ctx->retval = resp_msg->retval;
+	complete(&ctx->work);
+
+	/*
+	 * Release the reference taken by qda_rpmsg_send_msg(). This callback
+	 * runs in atomic context, and if it drops the last reference the
+	 * context's DMA buffers are freed, which must not happen here.
+	 */
+	schedule_work(&ctx->put_work);
+
+out_exit:
+	drm_dev_exit(idx);
+
+	return ret;
 }
 
 static void qda_rpmsg_remove(struct rpmsg_device *rpdev)
diff --git a/drivers/accel/qda/qda_rpmsg.h b/drivers/accel/qda/qda_rpmsg.h
new file mode 100644
index 000000000000..a70f4a80808d
--- /dev/null
+++ b/drivers/accel/qda/qda_rpmsg.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QDA_RPMSG_H__
+#define __QDA_RPMSG_H__
+
+#include "qda_drv.h"
+#include "qda_fastrpc.h"
+
+/**
+ * struct qda_invoke_rsp - Response structure for FastRPC invocations
+ */
+struct qda_invoke_rsp {
+	/** @ctx: Invoke caller context for matching request/response */
+	u64 ctx;
+	/** @retval: Return value from the remote invocation */
+	int retval;
+};
+
+/* RPMsg transport layer functions */
+int qda_rpmsg_send_msg(struct qda_dev *qdev, struct qda_msg *msg);
+int qda_rpmsg_wait_for_rsp(struct qda_fastrpc_invoke_ctx *ctx);
+
+#endif /* __QDA_RPMSG_H__ */

-- 
2.34.1

