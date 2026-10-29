Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793273906;
	b=0eM8Q2R1f2WdYQY3Mt8QQsn2flc8SoS2bBDh49iuDdl1gFNVQMmGOL44XckpieuC+6VR
	 BUejpdhK7T6SBXx1oBB3XK0LbbgWlihzgrWEFO8ccxpoceH5boGu9PSaV+CK+xJCuBt9P
	 +uoT0tOpCVLpgNe78seamRfYE5zGpIup9hFRWTBNLEtT2ROTKHfByjRP/rZ1bOnn1D6pQ
	 9D9y9sSaMZsAdQyEZRGBceio5o0gL4odGcLahc59g1vtb5NkBnYEXHO9EhMnvH6zp19rV
	 qrwMP6A8zQtRrMqQxI8AYPd9L+LVLShh/5U5fzMl0J/g2RBJ/wVlvQ3XkvCl6kXWKHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793273906;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=d+gMCI5zJ/0ncCjFjxtCwKE+NZWsbIHy4vH2hFbUCDM=;
	b=5GgHNm9dVvO4GJUFuXGWeE2IWqYNANC87kPOje2a5q7p6wTlPTHSLYfyCbdm7sSeN1kw
	 vyVXGZejz98wKOmHVTt/CPkDlBr3VYjl9f+Y8xLXsjfYMvPqnV0+nQbagylecCOzIqKg9
	 0V88xlFSQd4XBezDtGF358YBWyCOBce+ywJSzkGt5ZGOW7fd09Sa71YhC0/ksRrG2qZUU
	 dAHlh+BknkoC6oCd8Nmm7yk+6eTomB+E1TgoGJknip0/EE9nplj4Xrne7zLJhvwPiOfHg
	 kI3I8BE6pHD+Fng9Nh3XSRCVy0Oz8TKDaDKhb9lzZQ1MfPCoJhRG0HSLhT576egysog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D5ewi8Si;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ButymcXZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE9A606A334
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 11:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CE9A606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D5ewi8Si;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ButymcXZ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vDTO3824957
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 11:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d+gMCI5zJ/0ncCjFjxtCwKE+
	NZWsbIHy4vH2hFbUCDM=; b=D5ewi8Si/yyUEb4CJLgr2xpoJW6pK614WmguzPBw
	J5FlTgxUj9XZAh+NE9KOm3uJhnohYq0oODVnzC0zXuWRlnWGEa0EpKshXqVexq/V
	YeIqos3s4ctK6PgTrZ6nDAyJaIyWu7IfJZ/H5eVqFhw8q/upJZft8UhNmy5g4gYs
	5v8oEy86bTKoZ6WTVHwQUa4cduU9NSj2a4xh3DaIcSJ5A2gq/4mbwNdYKh7xEi5s
	DKBN7/aB+9Nu0ERYvB0Gej2xy2JSoBHcXD0V+8L2FOtcQj8jg7gAI142AY7+jX4L
	45TLVh2VKZ9QfCGDALDlCzP6GcXAKCzO+bqGPqH3BCm1Ew==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkut3j5qt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 11:38:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so4286224eec.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 04:38:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793273904; cv=none;
        d=google.com; s=arc-20260327;
        b=JW+pFmEkjRC6bnc7i/w3mj+v6XwYmS9xE6Gss5k3jTuuHxLjUAtmfNlS8fhcdt7v7W
         RQONZMiwXmra1ogcoOxmMP7LGV22SJBZ9aQzBUt/rbkL6I7vTGNvB9WPrupSfevgH0Pk
         rAFJ1Hp53Fz60x2m3xh6mNAE132uoYVv9CYR4Ef5u/vvedkIo2/HHqFOnraZRuIYcE3T
         Kdns4DVySfOo9MF8APeplOZRoFCxP9EH7fb73CvmYLszRDXaP9DiVlLlfl1e5irjf38k
         tJDjA9FlfEGTBvDL7tcNqH3Sj/+KgIXFNre/4Hoy/+UFmW3TupHqdqttrbdsOkNXbO7o
         yT2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=d+gMCI5zJ/0ncCjFjxtCwKE+NZWsbIHy4vH2hFbUCDM=;
        fh=D64z/4UqVmI6eAeb8jzR5gALveIEaE2JzDPiMIocNBc=;
        b=qE2RlEy4ZzpP2cmOrDr71OyK+arFGKQ4wVrLp5GjSpdDWniZ0luNMpSzzukUyZq04E
         /oWzC/i1RY2UZ83tZijSEDPfkkeyVNHMyvK1JRMSDXz4uC4HLOPZ6Pwty6QdMlhzhmH2
         7557Pem42aFOn6LGquy/7X3WwadSn2HSo90TntD93WazxPiojnXtOgDJWdPSYJ2v5d+k
         OYeVH1NnwE4/KIiTJQFB5zwJIoc441tH1hupEGBato59dpQ+AUvR1XmAtlHeAZMcj/Vu
         p3d98Xf7a2FNjyIRJI7hnz5tlUM/DF0bppvEaHQ1iv9nHREF2zWC+GOFFvtD+lLSlu7K
         Db4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793273904; x=1793878704; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d+gMCI5zJ/0ncCjFjxtCwKE+NZWsbIHy4vH2hFbUCDM=;
        b=ButymcXZfc0Waii9DJ0T72l6Uvi/Zrzco27bvXxYF9jTsh9AYzmGH6HwTZ0sov38Uf
         aStY4Py+kaowk1I5SZUme7PVp7X6OZEHCG/L/8QcFF+YHrMpdbYF3NJwDau/uwcoX2a2
         ToOkgaXgM8eIpVjlvKRpRhyu7GEQ4GnkdYyQtmOwdzZavjJ+uk47K7vpYpdJWFieE3tD
         EM+W1arS2GQ60K8qYWJm+l/z1KzWIqKoaDKEW3f1+3Xkb1BwWTS1r/qlkN5WiX802hxc
         OJTGUtQ+XoBGWC6TAkt0IbIdmeud+Bw68m+BQ13lDMLX8urlhHmsVAl9gOr1qagk0mRz
         FeSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793273904; x=1793878704;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d+gMCI5zJ/0ncCjFjxtCwKE+NZWsbIHy4vH2hFbUCDM=;
        b=2P9uVMAm78C7feGRZAvnVZXFuO0PispiR/Wa5m8vkapK1oNv0FtOhX41U7rT/ic+H0
         4/6FuiyUWSIJATBdmTGjXWXD/k/SIu84iT9D+3xx7rPlzSXlMKVn224+0R1HshBOKXkw
         Z2RzIPuhVIIDl9BPxoerCjHoIlF43s3BPpskQGT2pDUzX/x/O+pPgL/EBaFsOjxoL/k1
         F537HOEflEkPPdX60W/l7Uhs94qzYBJkEp4IeRBcXVxVQfnAiFjEH5u6PnZ/elKTgK8y
         vNlC9VkH9W5uhUV9X+coPwtNpaZ2LUGNgIFfjDSr4ZAucxuHDbJdDfPXdw4CAXfKHKP8
         dMmQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5IwnTWcmB1yoRMiT0zXNJ0cIJY8wds/HWb8q4GvmD59ZOGSlbj+hjuUdLFCtqjSNDa+tfSl4Z4oE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRmB9/AV2uF7L/LheHNfagh5KQB4THPjWPvTUXIVfWWYW3nHDc
	qUMCJAeVmhSpfkWgbNvx57GsS33CqxgZkzeMC/v2eDm8q2jAHO6oX+oHyAQF3oFmV87HYju//JD
	z0EyI4pDQhmBt+K9bOHPhx1CprFmaz+oWVCzKqFVELRqBtY0GiArTFntBn9NBkVJOYWeaRT21os
	RIakHwijdxEshyqW3cjRVjhYyML/uqy9oOpLXysw==
X-Gm-Gg: AYBFou3F92svB0canAIBclA4nAu9M4mxKJ0Da2b5biQ4IXOl60FfA5k8URSSzqN3kNl
	ZteCByILhqvA02gaxMxcMgPweAN6IuFRvaiz6R5SlI5RypN37jsKEfna3VtOchP+fv/+9NduW0T
	ZptjVEycTVZZkkQTzgjH/hN3wAucpW3xRq60hH5omCCSXSsn2eYC5FAu4ljg==
X-Received: by 2002:a05:7301:1888:b0:369:e930:6bc4 with SMTP id 5a478bee46e88-36a20440ab1mr6660873eec.30.1793273904009;
        Thu, 29 Oct 2026 04:38:24 -0700 (PDT)
X-Received: by 2002:a05:7301:1888:b0:369:e930:6bc4 with SMTP id
 5a478bee46e88-36a20440ab1mr6660831eec.30.1793273903447; Thu, 29 Oct 2026
 04:38:23 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
In-Reply-To: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 17:08:11 +0530
X-Gm-Features: AclHuK9mkpiY9HLm48B-7iSzfqzEzMPXUUWrIwq3MFK1djLB6MzLTJk2GLxddQQ
Message-ID: <CA+Ht8=YtrKJxr7YLO2z1389NPDnws8hSppAzVnYYJp5K1duvOw@mail.gmail.com>
Subject: Re: [PATCH v12 00/11] riscv: add SBI Supervisor Software Events support
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Conor Dooley <conor@kernel.org>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
        Yunhui Cui <cuiyunhui@bytedance.com>,
        Atish Patra <atish.patra@linux.dev>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
        yuanzhu@bytedance.com, yang.yicong@picoheart.com,
        yang.susheng@zte.com.cn, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0NSBTYWx0ZWRfX3jmAL9HTiisk
 8Sw0bI5nQlLMhl5M21oCGU4/eBO/qjbKlX9Q4IO7KP9jlbSUwO57Tt6/QRu+Z1IAIBfXb1UgBOj
 CEJpMuel9WnoY5E3ZNqCC1EFGepaVVc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0NSBTYWx0ZWRfX1YKp/Z2Kwnje
 a1oHtkt0C4DxeFYJhU7ur/iNA7norVJbPaUTe9pacF8qfYBP3JqDYLPGjnB6UJXjA7k35UvmV/4
 /lELarOAqLtYoDdj26nWoFono3bIM3frFqmpyVa94dgLMlqqc3jl2nH2jHAT5I3X605D0snpBkl
 52Z9H5VTrvIcMixbRonqQs4wi7uWbPBUUqnrlqU9Q3CD4QnbBCu/hoAdLqLUN9HIqq8zjiaNd97
 SnwzNVjiZtLbIAXys4orvr8QDDp7/bZKzRQ5bV5mAINw2rEnhcAd9uFMqK2dutgS5VZcpepiXyk
 dR52f4/xLV1srPxWkJD2s6tTOmgQ882Bb/qQUoRLfTbbqQnVxGAw2QSHvS9IY3n1oXQXGKAsgpp
 Oq/W11w0XhRSRqfvxbqXb52gYQ9pvzgOVzvZQTMXecxZ5GxTUQjHjCncnSXuIuK+Ekg5qjRE1HI
 +WeZY1Ss97IoEky7geQ==
X-Proofpoint-ORIG-GUID: 7o4k3cQpn85eQJPUD5v2bKoTpMGWG6V4
X-Proofpoint-GUID: 7o4k3cQpn85eQJPUD5v2bKoTpMGWG6V4
X-Authority-Analysis: v=2.4 cv=HYSB3SE8 c=1 sm=1 tr=0 ts=6ae33030 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=ojhntA04eiNvkV59mfQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290045

Hi Zhanpeng,

> [PATCH v12 00/11] riscv: add SBI Supervisor Software Events support

I See only 8 patches out of 11.

Regards
Himanshu
