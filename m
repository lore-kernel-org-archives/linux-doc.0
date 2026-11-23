Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462610;
	b=kXtX1oRmYqXeJmb+Ha6mioVDzJ4c0DwpAedE72vE16Me5Pg6mCwLVMFXwuZirMDGVpyk
	 XM73iMK4+YN8e7Y/1ph80f3Ig0pXpu1wfgRsozrQI+baKwc24rYE4hyenR+zXSfE1ktkw
	 5VTebtWvh8IwzW7apHm1wVfq0Q2dwYNYjIki0Lh1z1d9wIUYrNmWwckTopN7tNlew3jzm
	 JFqO5SjoNT+GoGDsyW4mBM/is2j0nfX70KgRpRGrqJ597CyhuRa0NUdIaDY2xZzXngt69
	 BgRodGfxH16YuZJZe9SyrcYmaSNSgrnbtldAVr62LQYGx0GG5KCgr0zlw4ZMvCgq20A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462610;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6aU+cchuetqDtzjD9jSrzXmm5L9uzDfuqw5ewOyVopE=;
	b=gIa8k7IIBScDxuR2M75ZsheHGnSXt0LF3YxO+pZswYOe/VVcqRuMLVXrSVprrPk1ijuf
	 rMYPs8Yv/J51UUZJt3ApQnT/dDr7215FBPlkru1bZYClyyGm8zhrY5VLkWRcxdfANUcSJ
	 uX/OggD8SE0Ssf1cZUHkwnynXqq/SXjFwsxtr3yWZq0jtcQm4jA3h4Qbe20347suWkzc/
	 d9809K2UOa5IGEegeDjMEoyTdRPSeasgbDbtcHN3vgrxLl3u24mgM/YL/WRtfvGZ6YKsI
	 XXQPLudNpgm9D2xv8/ZPJyoZ+HDPQjmqh69H2B5zKuilTxOjhpOGKqlBH4+kKc+3ZRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iVxyptQy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bKAti34M;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C552E606A321
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 19:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C552E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iVxyptQy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bKAti34M
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH3bK3475231
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 19:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6aU+cchuetqDtzjD9jSrzXmm
	5L9uzDfuqw5ewOyVopE=; b=iVxyptQyjbLdiD3MOBcuca1LHEDdlI/vq7mQDPNn
	L6TB/voo6VsCPcz55NyJQ2q4PbOshmC2Rzxl5Iahos3fItygEA+NnHwNcPP3w33T
	uWgi1qjKEPmolYVbfpX+3zntRn9lIsfl2hWnVmCWRUm5cV/q7TKAZL9zTuDAJs2j
	l/Vw8B8fzaKZNoUIkZk9ZvIwFl7eBD7cUQB2npHEWqwasg5QcPsm2Mz9XbhXOuV0
	QUhdTmByTU5OVQ1sQ3oO8qNmuIYcPKqGLQ44u/rKh5aVjloFkDsV2YfAH+d3CqdM
	UKs3aJBrTnJOzE9A2qSFxkhY7GpGQdwqlGkPsQc9UZWUxA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7tssh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 19:36:47 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92135a58c91so87705686d6.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 11:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462607; x=1796067407; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6aU+cchuetqDtzjD9jSrzXmm5L9uzDfuqw5ewOyVopE=;
        b=bKAti34Mh7WNLgI2C9TuC+tqXFyihBwGWkk/rJotugXxvSJxfNzciunb4KOALivbmG
         BKDhp5fTyznyglrUoo2fYidmonWKVPnFX3zX/kU9ELWe81fzr22g7XAsiGq+og13RcsT
         zGNvvcDMhpvuMltMz2fI/l3UDLNldg6EAaStM4zfIsAUPAtFhLm1cde0UsraXojq9xyi
         jfZRnaoIITipuOxd/EMIKCn8dC7Sv8EmuFbTWHT7cWMHdpkc9f/zyX5tyHNXeJ5y7dYC
         H4Pl+rvtQTD9xYqfgOlMpc9IKMCoMb7k7lOsrOrDe/zcE6RAOnMPJCEwUpNES4xlsKaN
         wlng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462607; x=1796067407;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6aU+cchuetqDtzjD9jSrzXmm5L9uzDfuqw5ewOyVopE=;
        b=ktk8s9qkoMjentFlcThdQwdl0TKjzDzXgdbTShC16U1zGywGhyyYdFaYxVHtwimqBU
         hl0iclfxCxW3tUMPc4N9CZGjAlLDtu0tYyaHkyKZzzJOMO+VjijB9OWgSZTMN/5p84rA
         QWP0D1ozmoXwdX0Ax69rqO2ZNhsDZ6N2rV0jYmf8ds3/mbZU8cbc0I4q31nLe/7MA5KF
         +yN0mauw7WB7Aa2SDSJqiZz1BnI6C4geld6oEA5PCcQRDD8UzE4Ve2UUCJYbg2qoatCX
         8f1fe7cvBGb7zTrqNWq35WfZ54keet33+NQYsNBVZjT+jUsLmk4y0aQ50dKu/1Geq2Kc
         mxdA==
X-Forwarded-Encrypted: i=1; AL+hErH6z/xIszXOqsLIUM02WESeuZAN3Khzbc6o+duwNM8lmykEiDoZ7ch8J34//UAWMxUsXz+gGIHCEOc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OLU4hJ3f6CM1G5HiEQyK9wvOFrBKiW+LZjl7BTOMzwN5eG2Ti
	UZRR+ZyJ7AdEECE2cEYtjU5T2oD2Q8Et8a0kboBHMk8fR0BKoRLprYgD6FfPqvSpjlqrndQyAtS
	R9AX/OTF7P7aQ5l3ceZ59FRcgOBFLjAIeSaEgfJN6TmRxjs5ftAqq5yXguSzTYKY=
X-Gm-Gg: AZFdTZdGejkS7WRTBY0Zm5kmxwi7CqPKmkGSgZkgv4C4ipRhQDy9O5glqVu8cLn1USs
	Dd3SiWzoELyRxJXaFHMpjtWYtwmRFBiyVTxjSnORE2peqlNgDkAcV9Z4y+RSURvqXFEl1oYHjMr
	ABThqyQMYhgRoajGvgtdJ+76z7VPmJxnA+Ma9HzUr3qaHu/5TqQi+ggn4P/NCBfDALPiUWPjk0U
	48vHvzgiqJpg3c4BofZ9w7E8ymznWQ5LVkXF603bcTf9VjZ+CVHILLDnwF7ngK8/nSSh0BYKpuC
	ALPCq8TK3qtSSKp1gxysqvxJur+/SwCAnkiiMd4KTWHQyiC46pJjDy+a+AL+fukgN4VzwcPUgfu
	CRsPO7VgIZXRnE6WuTsgVjIYP7bRn831IsWB+s2VR9DtKw8pmprgyw874JAfRSswO
X-Received: by 2002:a05:620a:c51:b0:949:7641:3872 with SMTP id af79cd13be357-949ba9b8b16mr2280103085a.14.1795462606843;
        Mon, 23 Nov 2026 11:36:46 -0800 (PST)
X-Received: by 2002:a05:620a:c51:b0:949:7641:3872 with SMTP id af79cd13be357-949ba9b8b16mr2280096985a.14.1795462606303;
        Mon, 23 Nov 2026 11:36:46 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm336356205e9.12.2026.11.23.11.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:36:45 -0800 (PST)
Date: Mon, 23 Nov 2026 21:36:44 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 24/24] arm64: dts: qcom: x1e78100-t14s: add WSA
 speaker protection VI feedback
Message-ID: <j4zssaws6gb4cico53bwweb3755agxwrunxao3ykvbpa4rbzi3@j3lkijgta4as>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261122161437.5994-25-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122161437.5994-25-srinivas.kandagatla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b0495cf cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=M6omgQR0Woip3EZOlBYA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXwsjPYd4TTHud
 IEQfYiocFsudrnAzQpjKLhXPEq9waYXyuQMTwWxU7EHjxs1JXS1it9u+SioIcipWQgY/XJn0XqA
 gzF1hl7htPT+dbevVg+gfjG0N+FhJXDYJJ/jm57LX4KjPmNfUbu+lwjqnSvMswNrcZDtKsuUsaT
 CCh27E73KSFfuCRssBHpfoy3eZXzRdHk0IwWvtBjG0H6dGUN8SMNR0oOl3VRYtsWva1yMwpXxep
 +tfDPcvxiw5Oad5VDjy83COzGL4bI5M6Z+bZzLw26HRAi2pJi7Bi2Vc53tHm5kH/L+c4eRoceXT
 q61Haj1tERN5hV2ehlj8RGj3WBbcgt0KytCKbRzdDXHXcG9RDyvu66YGzJYzSsgU6tiDfeANqOo
 iypTSxrFJFUggz5eej+e1hTZf88+FntJLmqUxKL4DYEw4UaT/SXyzgGGYC39NZrhmweho5G7LQ5
 9NzrYB4Ghig1NB0aCLg==
X-Proofpoint-GUID: Ff2CtgFn3yVSRF-dymgyCLneut10idJL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX5yEhbRP6PoBK
 7Y405rZnbyID/fMeEzSgmTmG7JXA9VBm5vbR7rNv0C2HOVB5U8S2qrZt9PQCxAQ8fOpUPe3fK/v
 hj3yhFisITqF5cbNM+Gg6faFYF+Rd3A=
X-Proofpoint-ORIG-GUID: Ff2CtgFn3yVSRF-dymgyCLneut10idJL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230078

On 26-11-22 16:14:37, Srinivas Kandagatla wrote:
> Add the V/I sense DAIs of the two WSA8845 speakers, the SoundWire VI
> ports and the WSA macro VI capture DAI to the WSA Playback link, for
> speaker protection. The speakers now expose two DAIs, so give them a
> '#sound-dai-cells' of 1 and address the playback DAI explicitly.
> 
> The VI sense master ports (10 and 11) are picked up from the VISENSE
> slot of the per-speaker qcom,port-mapping, which differs from the
> mahua-t14s Gen 7 layout (12/13).
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
