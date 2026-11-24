Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560845;
	b=C7hOeasRLBpv+6r6xjTsvQ/hKWLtXWTKfQCLHJ3vkrfU6eLPutND54yUzhx6B/tKQt3y
	 4mdM1j+AHrNnJ2WEgocX1jplKq9d70pkzjPk+rv9uQifyaqs+QAq8jHd72rIUrU0yQ46u
	 l1o8dHC1iHoXWz7Mx+k9LhgonyK5Bv1+SpcFBA7v96HUC1GT041EERmaXGlbO1fHRPaIi
	 I4nmuU4ea0Ej2h5PcIr8IYmAqW44AySglPkOVJC2QG34jArHA5BMLhQWFR+dkFOjB70Yy
	 A0AJxbJfJCV4jzKiHRb3CEIoFekcMoc5cL0wNnw0bfKRfcKS4SYCIB6QqaEEsKmXm0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560845;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XMB/Jny4u3WqVurFKRqFAqz/mYflSRmFYQ6ksF+dO8w=;
	b=1pdQNDGvG/pc7NfAEoLWY73qiRbP4k+I6E9p2/Hh9baU7bHS5I9lXw7BcfwUyciLQXRG
	 U0hQMxbDlAn+os5Qn6EfPCkcs6yOGiUpzMCI+v8vcGY/7T8jJULolP6xTu8latYbnLxWO
	 kqq1gW3b4hNWwtIP4MagAXiX2N7QS1uqic7V13su0ydNkBJe2kpoZx4qTP2WZDuQLMdaG
	 svj5Ust5hOL5tnuDzD457VVbp5Qm0aHLNx77chvpfV13K96i04IGJiAMbzMAYWA9YJKnn
	 ua4tPfZg/4HwBxoIUBy3DlYp3gqXuw79qthepIWUM6XZzLwXZIvbKC+vyuHJ/MSiPwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cAqieYB9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YbZz7GvJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1EF606A32A
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 22:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD1EF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cAqieYB9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YbZz7GvJ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMb0On2170991
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 22:54:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XMB/Jny4u3WqVurFKRqFAqz/mYflSRmFYQ6ksF+dO8w=; b=cAqieYB9PYXK9wiS
	seI4bz/T3gnzW8qzi+yuIyLTRs8jAWSgvmQkufQpgBtfBxkLJFk7SIYbHC/xsbok
	jh6Msd7xe1jvC8KyRKH0EsCOkm2u/14MD8HOm+mw7+B4PmlzwW/X0/FyPswwznvp
	M8uZnBAla1Oz9CrtXeu8hrpOZjFkwfd6NmyFCv+xR2xqzcaLH8v1obEaeWIhYvUv
	huLrIDBuYIKdcJzADv3LtdMzcx+1GC97fgBodl2R8ybzthWXaY3xPDXtiLTMhJT/
	5kjNwI+SApe9xU0IYz3pjwelPKJZDQeE7CuMeJkIa2ky+jd71nh0zPMylHIISVoS
	5W3eYg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpm9ae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 22:54:03 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3a348a6dbso4143956c88.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 14:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795560842; x=1796165642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XMB/Jny4u3WqVurFKRqFAqz/mYflSRmFYQ6ksF+dO8w=;
        b=YbZz7GvJaDPZrq6KVAf2P/gcD178BFZ7Cn2ik+SCe4I+I9fPkXlbMKKkEeS3sdP844
         IZSNeza/MBTGQCuYiR30ZfoE9QpniiucU3kY+tSJmDoBjdtpsozdrvobKM9006wY8/wH
         ImwM6xsKXJHLXDJaxrSI/MfYmWkxemq/h6SqXb4det3DMk3ggoFDYP43t5cVcBJZGJY7
         4lkGPwqvSpNWNey1xg7u5jXcz/4SoJ8BA5L0oBSKWPcGemfrqdeydry8LQfGtJwu4ak+
         x9aqsDJ5oxcZbNsgk7SszzpgrTj99ZPnigGyoJHez72TPaf80IVZjrm+G34Dg/qo3+RZ
         x26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560842; x=1796165642;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XMB/Jny4u3WqVurFKRqFAqz/mYflSRmFYQ6ksF+dO8w=;
        b=XmQHVvbZBYsXDUkUAy8jSgQM7DNIYINCFV0zbmHcECe0WC2bqdM3DfH3URYnG1B2+j
         3KyBQ3E/TxC2ROmH5Uxm9YKBX/GVFC6gqma1djxX+m8VdrmwfufWs4QmpR5BahxnYUpx
         YeoNpHb/j1JN47n/UqE0VRLPj5Xl8/0Fe2jxOMX+vlZQhPXP+4XxQVPj+bNisDoyRrgP
         NSlauazGaOzsjlBmIHgL6Xw8/9r5asuxJ7KvYqphkw5/866gXCc0u2wour/e1ybt0p9H
         jaCsrIdVZuVl38Lr9w3JELoV5Yx0cC+Xq6Ynz1lDfDvh5cnzHo95dIrjBacCksXjRd4B
         MPwA==
X-Forwarded-Encrypted: i=1; AL+hErGeq4F31xDyfZ6bZ7Cjume7w+w4QntCN1sgX9oVIErPvPBoy9a0EPlJ2AWSUKSXlHLENiA3Df30Jjk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+g437oCcqy/SX3dx0SXmNWFzOgA+evhGeghTc11VoGoifTQvZZ
	zdZPBKIV2PbAZaK5B8fBKRaX/z95o5H6mJ2WII2DjRvKJKxX0g6TCAIzmis9Ykjl4U+5kJJlodQ
	HNEot2KrKwCWUyfaag03K3SdBFzTDhOinMUMRdhlmzHE+1jBLng1gMcAEXUBs6s0=
X-Gm-Gg: AZFdTZdemXNUYj0VIkyMH3QbQB5V+CdKUjsQ1ixGtS5LnQui9mNSztlkQRXnSHUfLOY
	ibUu2uY6AKDTTXuf4uzcCGA1kM/o5EPiYINYmWS3KYbvC7dGv34QEhU2Q3wwHRLBnxTmLzkYUSu
	ph9G6nrifDn/DFNrt9I5CyIyYjU8Mw1KQ/G/i9gcJueehye7HKgsiWFKWcqOoPTvb86a3MBw/t6
	x9/QHTiud+QaIgbReZA0bmmwl4Qxvu8Qq4j3C03u+yHhyO+6oUqHR74pm6TJTAVK4PA2p29viPe
	NxcDaaLk3McLcV4WwxY+eHsZ90TRHL5kd9To8zpKIILe4t4CWgT0fIeApAOjfcGhxVUQFcpONuj
	URGyjaIpom0wFMiI0JHoPJyyDg8rFBZQsGt+twGblAnt8Y6+hRrmEyTTRODFsmUkmTyrb2euFqE
	U3sY6RkzlS0RnRpISpqK0WxkTZ44M=
X-Received: by 2002:a05:701b:2817:b0:1b3:aceb:b8dd with SMTP id a92af1059eb24-1b556911012mr15571053c88.38.1795560842361;
        Tue, 24 Nov 2026 14:54:02 -0800 (PST)
X-Received: by 2002:a05:701b:2817:b0:1b3:aceb:b8dd with SMTP id a92af1059eb24-1b556911012mr15571016c88.38.1795560841728;
        Tue, 24 Nov 2026 14:54:01 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm26179110c88.4.2026.11.24.14.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:54:01 -0800 (PST)
Date: Tue, 24 Nov 2026 14:53:57 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v17 00/34] Introduce SCMI Telemetry support
Message-ID: <20261124145357.00003e9f@oss.qualcomm.com>
In-Reply-To: <20261124194841.1147072-1-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MCBTYWx0ZWRfX/RS19N+CjNAz
 Ib9zsMDx+3uf84CNhUJFEr+td5usHJBzYMUXB7RWglHsBQBZYdDHek7tgat31+3DjOVWAZejrV8
 Fl7jTXwqLjFzGSIwqCpjxbGr9hLgXwC10iuvXIPR0JB+UbS1vjXCU85pYzRjoIWQQpcW+s6oImh
 7gS5LbvbHa+VzWotweWbfl9+rLc24F2wclpSlv9DxOgXgHbKh9DvMusiGfxQAzOsNHW4L3vtELX
 e/0KlZlTzZ4p5XCHxbePGttfeWbQb+cB+0Ye9cQnP9U0VAh0Gtq2uIlYNQTix88PdCjYmYIA6tv
 P0rynW2Gu/+tM+i5msYEuO5f8N0zaW8t5MnU4m44i/6Nn1aCpLby/VQnzAfn6sEQ5ZrAB+Z112J
 YOHWhsx71rAbU0g+EZ4Pl2oH5hBABD/BT64yVj5Nfc83/ofOO9x/VNvHiH7fUQeAQEV0tZBpY0J
 ezYzyfnmIUFEh0W3eHg==
X-Proofpoint-GUID: V7bZxnTAI--A_n8n69UY848K9KVkBCkM
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b06158b cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7CQSdrXTAAAA:8 a=FV59EcnNoF-tUHG6_8cA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MCBTYWx0ZWRfX+LUxYVLBsnqs
 /zyV9DyOTcCUX3ZwqAdcH8ZYrizpm7DiKQpx3iw/uWT0sCokFx5cVki0JvCA98U4ibCtV2O6t8A
 g5aUD1crSsZCgmyWFv9JVxtiQa3Fyc8=
X-Proofpoint-ORIG-GUID: V7bZxnTAI--A_n8n69UY848K9KVkBCkM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240090

On Tue, 24 Nov 2026 19:48:06 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Hi all,
> 
> [TLDR Summary]
>  [V17 highlights]
>  - addressed more Sashiko reports
>  - added a few more SCMI Core fixes that ease per-protocol logic:
>    + added more consistency in the SCMI Core Iterators machinery
>    + added centralized check (SCMI Core) for truncated reply
>      + Reworked some SCM Clock behaviour to allow for truncated checks
>    + SCMI protocol core initialization refactor and fixes
> 
>  [V18 TODO]
>   - address any remaining outstanding Sashiko/reviewers issues
>   - address pending human reviews feedback
I'm lost.

Does this mean humans should wait for v18?  I'll assume not and
take a look anyway... 

Sashiko is moderately easy to run locally as long as your company
isn't too restrictive with tokens (if they are say upstream folk are
complaining and ask for more!). Might not be exactly the same
as the version here but will reduce the noise and versions on list.

Jonathan


