Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660158;
	b=jZoxT3XPe/uchW2e99lsLz/8M9G0BlcjVQWUlOX2YCGkesgyP/r//AuOyAvQUg/744eI
	 7A+MhVs6Lh8mEBea13z4uAjZogBCliu93JPTq2GntbhZbEjccyIiKTTCBWwNd2KNlcVZY
	 g3UQ4Z4RO+C4yOIVgwJaleTJkaoxrJD6Z0N+0B01UPN2wnm/5ObcZDzfd+wtXY9KXnXs5
	 eNVTfKyTXrX0WZAkcByhxFKLohsJf0Wc/bAuGLABiCYvkjWxi9DKsFAABGWSIMH4o1vTl
	 lB/DkdZddHh4rM6r0lM416k36esuxp5ayDHrdIdWAAgiVpvnsotRBRG8x7Ee9eZn4zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660158;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=slIQ5nbF48VcmS+dIZFdGVRDEHVD3C1yP2q1zGxhyTY=;
	b=U2xlSkhGlkP8k3BD/x4RW6hTB9+AkZExz3OQwLK6FBlv0e9ZhaDu3SrRG93by2wX8XG5
	 kVDxO0dz4jI7hmZq0nxtsONMX/9VLYxBpEm7+PnPqessJDfV6ISmUz9/YraU8A2KJiQTj
	 uYTjseDWK/dTqLq9cKz7YXfn7ySn61BIKLpqIksE6SygWbsyE7KAcqZZ6MRGPOCvN0YD9
	 N1GvSBTPSH1+3XtoJ1ti+XtT50vE7EhuEP/6BxNN6UXQGXjzAj3byt2SYlB/wNyFtlbiV
	 XFId318a5aJ7sxXf3eJLHLt6utRyTKhRyD/js6rvJ3xUE6PRn+cyWj6ZnXSFA/K0BKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SsounLrb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VG1txsrv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78010606A31A
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 09:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78010606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SsounLrb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VG1txsrv
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M95x0m3305784
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 09:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	slIQ5nbF48VcmS+dIZFdGVRDEHVD3C1yP2q1zGxhyTY=; b=SsounLrbno2A15d+
	ClCERI+B1V+EMqLt1+wepiaRTknes0S7NdxD8yeeZkOfYW/TQ5iVhO2fYLGagDVT
	6zwfaTY6ZxeP9ZzkhIJPnPrihW4NibAMxACH2dfFJQLnGoG44lRwYmq/JIzuiyIU
	zL47yZQtDL9hYN4+qYftnqps6T1+m1E+cL/1zyCNpwjZ7Ly3g7XthmXvtozJNuMT
	4AYxb9g5hDWI+Ib63N3gL8qRLXKclblB8Crtvy2vu9Z/7wzZg6iDosRZjE+XF+LT
	h6PI1BjPjw71fw4douyqBZL6Q97NfxP6iAiAWCHvfXWwAYpoe6uZadar3FZiz6JK
	EDlhzA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93asjgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 09:09:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc50fb0d2so33371185a.0
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 02:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660156; x=1793264956; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=slIQ5nbF48VcmS+dIZFdGVRDEHVD3C1yP2q1zGxhyTY=;
        b=VG1txsrvSGqNwZqWECOXBWCIaj3QoD1NFILAu1J7G1oG/nqc3ioJKhuiPKG1V35/lh
         FILqUz9DUfzDSdCcSmerRRGA5x13rNxvI9umdNgQsa2DlWwwj9PMY2FOaQumaUtVDAhA
         KzhsWYWLiN78IcWZBhzJ71WmCMx8DlcLpeGESdFw5O8wmeCtSgqSmAmiGNFOP0/6Rmgm
         izPzxDW7dkmEjWGKSjaFo/AATwYDB8BQfrPWHJnXW3Se3fE37abC2gneqLNep7+r2Zns
         I6y+RCR0gU8iHdsjmrFQWujFUYtRAmcgeoGdtC7pN8eWavPcQlbdZlP49ZSN/Sa2hlXG
         SelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660156; x=1793264956;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=slIQ5nbF48VcmS+dIZFdGVRDEHVD3C1yP2q1zGxhyTY=;
        b=X995I/XfclkJh8ChVuOnsvoyQsU/bWFvFB4iZTKsovvgvDP3foUMgw56Lqk+A44ikN
         qp09tmSHkd5PhUNSWiKp56BXZwwgpyr9AQf4aPcdV7E5U58TkkF+IaA1KZ0EzrHzWH54
         4TyqT7hJCKwABFiV5eAxvks+qqzGLteUTpxenGxtU9OLEW6te8EMR1b84qLAQwbOkpag
         g6g2vR0t754f7bmIvw+wAZIcdafMz73ssaRBDuHcAiCOgi5HkJw1oCA02vibLpRWUo3F
         /vU5RPnlpor7Bsu90570AEBI8b+1ClsSKgtwqCWX+hYIcQcIW/bLYLNc/hT4dxm3faFU
         czpw==
X-Forwarded-Encrypted: i=1; AKwUvBzm4EqtcuzAwmqmA53tCsHdAuTFyHwldHC5A4dQJNm4mqutMTu4eknQlLs9FHPZuL9GkBFCNgTK1Mc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKf8SS/nZH97/3VBHqXIWS44r92uDLbZTtUaBi7S7wRWkSZu7cw
	uVoH1696lTSy9BmbxUExso1Y3UvQfyNNxbRUnXtAEkcN41KDK1zqLnwhjqjpvJQRsBl216rF9Nl
	UlOCuI+q6WlnFKn4MVHl+04efXZnnwaPzzHt4TE5kEQNgKR822tSsv62PLxGUWm4=
X-Gm-Gg: AYBFou0aAucBVGYamAdRx+eVlySLm+JT/lPQMdadtFXMrpDE2K3REPeNZ42Z2Ua7wKH
	2vK+Uo6fzHAekXvzP4soQQalX96Nop9iderDfAKhiN7mEBaXIh6EXLGtp8OB5VOTmzoeWb2NYMD
	RPaj2FBpOcYho2w03Lx+DlAV3vSFyT/ClWvKhdVnYifYpTiOkVXan8VU08IqwIFUcoX9Tr1B99i
	0Doqd9Iw2g9+9fpuBiZL9euaWGDYLff8SqTxacc/GxOGClg/SMnAmDBsRM299MA2ao/No8uX8qb
	bt6kF/t3COlEfwrgy7MF+sCj25sfsNTtHk54Bu/Gi4DlnpYMzsXUmqC1usvtSoboNfQ1VaATu/u
	tAoAXlFVguruIhat3dhIc9A==
X-Received: by 2002:a05:620a:4511:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f57f3bf10mr985172085a.3.1792660155732;
        Thu, 22 Oct 2026 02:09:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f57f3bf10mr985168085a.3.1792660155120;
        Thu, 22 Oct 2026 02:09:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5dd548sm84212966b.65.2026.10.22.02.09.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:09:14 -0700 (PDT)
Message-ID: <7cd708de-a58e-47fd-acd4-0e37be77de92@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:09:11 +0200
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] thermal: qcom: tsens: add hardware-bin trip-point
 filtering
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
References: <20261002-thermal_bin-v1-0-5a29be7e8ec5@oss.qualcomm.com>
 <20261002-thermal_bin-v1-4-5a29be7e8ec5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261002-thermal_bin-v1-4-5a29be7e8ec5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX03PPxjTAxpaP
 72lsgFJZHtoKnTe63WCbqsamu4U9xNAgk+RGuobduS53kj6GtHOONL+5Ny4ViqJB2yvHv1JmFbv
 oeJmCJodGvEikJ8H+iTrMk/NtsahHq6I1bPv9aGzkmzUkBRmrLXVn43PW7dOUrOoRC0BAqPSwSz
 LcMhsiClx9TTUpzJcmue/+EQJ/+VfrOGMktNoEoAkypEGIxEj7cdOOeGN/KKzHNR+wseJcCnd58
 XMdnvWGQksSN3ty+kqiN51BSbCxqzRL1J6OkzPwyo5wwnfJjGRxK+rHd/ICjPqNEbXZUKzuOI8S
 CVef8XC4rjmDAsbmNn6KpwpgXocoCx4hlYH/f4sqL2gUPhLUAEUWWRb8K2+PW7gjoN92kwHuazv
 E6/HtkFeE8/7/uKExPye0MYVyiaRUrm6/ayu3Mj5Xa+3GAWCv/u/QgpIM7vPvH7o8cKpfkLNAqT
 r9Id9QBAYYQ9MqsXAGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfXzA9GaN7vUZJZ
 On47cMA2j/z2RwdINQANiTAYg6zkODuCSpQ+GtgVVDVhtRYX9Dk10rbUUi0K1aWHcbD5lnE64P1
 euswRGgQR7wrexpL5QZ8ha0tgXMMWCg=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ad9d2bc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=9Uk6R85rmyly72tMM80A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: mTMYdk-ZVGxLZEN38vmIbCiz8ulk0Fk0
X-Proofpoint-ORIG-GUID: mTMYdk-ZVGxLZEN38vmIbCiz8ulk0Fk0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1011 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220036

On 10/2/26 12:46 PM, Gaurav Kohli wrote:
> From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
> 
> Some Qualcomm SoCs are binned at manufacturing time and expose the bin
> in qfprom fuses.  The thermal core's supported_hw_bin mechanism filters
> trip points by hardware version; wire tsens up to feed it.

[...]

> +	/* Hardware-bin values for thermal-hw-bin matching in DT. */
> +	const u32 hw_bin_std = 0x1;
> +	const u32 hw_bin_elevated = 0x2;
> +
> +	/* Higher thermal profile identification for qcm6490/sc7280 bins. */
> +	const u32 tsens_chip_id0 = 0x197;
> +	const u32 tsens_chip_id1 = 0x198;
> +	const u32 tsens_chip_id2 = 0x20e;
> +	const u32 tsens_chip_id3 = 0x20f;
> +	const u8 tsens_feat_id2 = 0x2;
> +	const u8 tsens_feat_id3 = 0x3;
> +	const u8 tsens_feat_id4 = 0x4;

Isn't that (also) exposed over SMEM?

Konrad

> +
> +	if (nfuse < 2)
> +		return -EINVAL;
> +
> +	tsens_jtag = fuse[0] & GENMASK(19, 0);
> +	tsens_feat_id = fuse[1] & GENMASK(7, 0);
> +
> +	elevate_trip =
> +		(tsens_jtag == tsens_chip_id0 && tsens_feat_id == tsens_feat_id3) ||
> +		(tsens_jtag == tsens_chip_id1 && tsens_feat_id == tsens_feat_id4) ||
> +		(tsens_jtag == tsens_chip_id2 && tsens_feat_id == tsens_feat_id3) ||
> +		(tsens_jtag == tsens_chip_id3 && tsens_feat_id == tsens_feat_id2);
> +
> +	hw[0] = elevate_trip ? hw_bin_elevated : hw_bin_std;
> +	*count = 1;
> +
> +	dev_dbg(dev,
> +		"qcm6490 hw-bin from jtag-id=0x%x feat-id=0x%x => 0x%x\n",
> +		tsens_jtag, tsens_feat_id, hw[0]);
> +
> +	return 0;
> +}
> +
> +static int tsens_compute_hw_version_i_temp(struct device *dev,
> +					   const u32 *fuse, unsigned int nfuse,
> +					   u32 *hw, unsigned int *count)
> +{
> +	if (nfuse < 1)
> +		return -EINVAL;
> +
> +	/* Single bit: set bit 1 for high-temp bin, bit 0 for standard bin */
> +	hw[0]  = (fuse[0] & BIT(0)) ? 0x2u : 0x1u;
> +	*count = 1;
> +
> +	dev_dbg(dev, "i-temp hw-bin from i-temp=0x%x => 0x%x\n",
> +		fuse[0], hw[0]);
> +
> +	return 0;
> +}
> +
> +static const char * const tsens_cells_qcm6490[] = { "jtag-id", "feat-id" };
> +static const char * const tsens_cells_i_temp[]  = { "i-temp" };
> +
> +const struct tsens_hw_bin_desc tsens_hw_bin_desc_qcm6490 = {
> +	.cell_names         = tsens_cells_qcm6490,
> +	.ncells             = ARRAY_SIZE(tsens_cells_qcm6490),
> +	.compute_hw_version = tsens_compute_hw_version_qcm6490,
> +};
> +
> +const struct tsens_hw_bin_desc tsens_hw_bin_desc_i_temp = {
> +	.cell_names         = tsens_cells_i_temp,
> +	.ncells             = ARRAY_SIZE(tsens_cells_i_temp),
> +	.compute_hw_version = tsens_compute_hw_version_i_temp,
> +};
> +
> +/**
> + * tsens_populate_hw_bin_info - read fuse cells and populate priv->hw_bin_info
> + * @priv: tsens private data
> + * @data: platform data containing the optional hw_bin_desc pointer
> + *
> + * If data->hw_bin_desc is NULL, this is a no-op and returns 0.  Otherwise,
> + * reads the nvmem cells named in hw_bin_desc->cell_names, calls the
> + * compute_hw_version() callback, and stores the result in priv->hw_bin_info
> + * for later use by tsens_register().
> + *
> + * Return: 0 on success, negative errno on failure.
> + */
> +static int tsens_populate_hw_bin_info(struct tsens_priv *priv,
> +				      const struct tsens_plat_data *data)
> +{
> +	const struct tsens_hw_bin_desc *desc;
> +	u32 fuse_vals[TSENS_HW_BIN_MAX_CELLS];
> +	u32 hw_versions[THERMAL_HW_BIN_MAX_LEVELS] = { 0 };
> +	unsigned int hw_count = 0;
> +	int i, ret;
> +
> +	if (!data->hw_bin_desc)
> +		return 0;
> +
> +	desc = data->hw_bin_desc;
> +
> +	if (!desc->ncells || desc->ncells > TSENS_HW_BIN_MAX_CELLS) {
> +		dev_err(priv->dev, "hw_bin_desc ncells %u out of range\n",
> +			desc->ncells);
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < (int)desc->ncells; i++) {
> +		ret = nvmem_cell_read_variable_le_u32(priv->dev,
> +						      desc->cell_names[i],
> +						      &fuse_vals[i]);
> +		if (ret < 0) {
> +			dev_err(priv->dev,
> +				"failed to read nvmem cell '%s': %d\n",
> +				desc->cell_names[i], ret);
> +			return ret;
> +		}
> +	}
> +
> +	ret = desc->compute_hw_version(priv->dev, fuse_vals, desc->ncells,
> +				       hw_versions, &hw_count);
> +	if (ret) {
> +		dev_err(priv->dev, "compute_hw_version failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (!hw_count || hw_count > THERMAL_HW_BIN_MAX_LEVELS) {
> +		dev_err(priv->dev,
> +			"compute_hw_version returned invalid hw_count %u\n",
> +			hw_count);
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * Store a copy of the hw-version array in priv->hw_bin_info.  We can't
> +	 * call thermal_zone_set_supported_hw_bin() here because the thermal zones
> +	 * haven't been registered yet; tsens_register() will pass &priv->hw_bin_info
> +	 * directly to devm_thermal_of_zone_register_with_bin() instead.
> +	 *
> +	 * Use devm_kmemdup so the copy is freed when the device is unbound.
> +	 */
> +	priv->hw_bin_info.supported_hw_bin = devm_kmemdup(priv->dev, hw_versions,
> +							  hw_count * sizeof(u32),
> +							  GFP_KERNEL);
> +	if (!priv->hw_bin_info.supported_hw_bin)
> +		return -ENOMEM;
> +
> +	priv->hw_bin_info.supported_hw_bin_count = hw_count;
> +
> +	return 0;
> +}
> +
>  int tsens_read_calibration(struct tsens_priv *priv, int shift, u32 *p1, u32 *p2, bool backup)
>  {
>  	u32 mode;
> @@ -1206,6 +1368,12 @@ static const struct of_device_id tsens_table[] = {
>  	}, {
>  		.compatible = "qcom,msm8996-tsens",
>  		.data = &data_8996,
> +	}, {
> +		.compatible = "qcom,qcm6490-tsens",
> +		.data = &data_sc7280,
> +	}, {
> +		.compatible = "qcom,sc7280-tsens",
> +		.data = &data_sc7280,
>  	}, {
>  		.compatible = "qcom,tsens-v1",
>  		.data = &data_tsens_v1,
> @@ -1218,6 +1386,9 @@ static const struct of_device_id tsens_table[] = {
>  	}, {
>  		.compatible = "qcom,sa8255p-tsens",
>  		.data = &data_automotive_v2,
> +	}, {
> +		.compatible = "qcom,x1e80100-tsens",
> +		.data = &data_x1e80100,
>  	},
>  	{}
>  };
> @@ -1327,12 +1498,18 @@ static int tsens_register(struct tsens_priv *priv)
>  {
>  	int i, ret;
>  	struct thermal_zone_device *tzd;
> +	const struct thermal_hw_bin_info *bin_info;
> +
> +	bin_info = priv->hw_bin_info.supported_hw_bin_count ?
> +		   &priv->hw_bin_info : NULL;
>  
>  	for (i = 0;  i < priv->num_sensors; i++) {
>  		priv->sensor[i].priv = priv;
> -		tzd = devm_thermal_of_zone_register(priv->dev, priv->sensor[i].hw_id,
> -						    &priv->sensor[i],
> -						    &tsens_of_ops);
> +		tzd = devm_thermal_of_zone_register_with_bin(priv->dev,
> +							     priv->sensor[i].hw_id,
> +							     &priv->sensor[i],
> +							     &tsens_of_ops,
> +							     bin_info);
>  		if (IS_ERR(tzd))
>  			continue;
>  		priv->sensor[i].tzd = tzd;
> @@ -1425,6 +1602,12 @@ static int tsens_probe(struct platform_device *pdev)
>  	priv->feat = data->feat;
>  	priv->fields = data->fields;
>  
> +	ret = tsens_populate_hw_bin_info(priv, data);
> +	if (ret)
> +		dev_warn(&pdev->dev,
> +			 "thermal-bin failed to read FUSE data (%d): trips with temperature-bin will use first entry\n",
> +			 ret);
> +
>  	platform_set_drvdata(pdev, priv);
>  
>  	device_init_wakeup(dev, !data->no_irq_wake);
> diff --git a/drivers/thermal/qcom/tsens.h b/drivers/thermal/qcom/tsens.h
> index e8376accdff3..496ae6572bb8 100644
> --- a/drivers/thermal/qcom/tsens.h
> +++ b/drivers/thermal/qcom/tsens.h
> @@ -40,6 +40,29 @@ enum tsens_ver {
>  	VER_2_X_NO_RPM,
>  };
>  
> +/**
> + * struct tsens_hw_bin_desc - per-SoC descriptor for hardware-bin fuse reading
> + * @cell_names: NULL-terminated array of nvmem cell names to read
> + * @ncells:     number of entries in @cell_names
> + * @compute_hw_version: callback that converts raw fuse values to hw-version
> + *                      bitfields suitable for thermal_zone_set_supported_hw_bin()
> + *
> + * Embed a pointer to this struct in tsens_plat_data.hw_bin_desc to enable
> + * hardware-bin trip filtering for a given SoC.  Set to NULL to disable.
> + */
> +struct tsens_hw_bin_desc {
> +	const char * const	*cell_names;
> +	unsigned int		 ncells;
> +	int (*compute_hw_version)(struct device *dev,
> +				  const u32 *fuse, unsigned int nfuse,
> +				  u32 *hw, unsigned int *count);
> +};
> +
> +#define TSENS_HW_BIN_MAX_CELLS	8
> +
> +extern const struct tsens_hw_bin_desc tsens_hw_bin_desc_qcm6490;
> +extern const struct tsens_hw_bin_desc tsens_hw_bin_desc_i_temp;
> +
>  enum tsens_irq_type {
>  	LOWER,
>  	UPPER,
> @@ -533,6 +556,7 @@ struct tsens_features {
>   * @feat: features of the IP
>   * @fields: bitfield locations
>   * @no_irq_wake: if set, TSENS interrupts will not be configured as wakeup sources
> + * @hw_bin_desc: optional hardware-bin fuse descriptor for trip filtering
>   */
>  struct tsens_plat_data {
>  	const u32		num_sensors;
> @@ -541,6 +565,7 @@ struct tsens_plat_data {
>  	struct tsens_features	*feat;
>  	const struct reg_field		*fields;
>  	bool		no_irq_wake;
> +	const struct tsens_hw_bin_desc	*hw_bin_desc;
>  };
>  
>  /**
> @@ -568,6 +593,7 @@ struct tsens_context {
>   * @feat: features of the IP
>   * @fields: bitfield locations
>   * @ops: pointer to list of callbacks supported by this device
> + * @hw_bin_info: hardware binning info read from SoC fuse (populated at probe)
>   * @debug_root: pointer to debugfs dentry for all tsens
>   * @debug: pointer to debugfs dentry for tsens controller
>   * @uplow_irq: IRQ number for uplow (upper/lower) threshold interrupts
> @@ -591,6 +617,8 @@ struct tsens_priv {
>  	const struct reg_field		*fields;
>  	const struct tsens_ops		*ops;
>  
> +	struct thermal_hw_bin_info		 hw_bin_info;
> +
>  	struct dentry			*debug_root;
>  	struct dentry			*debug;
>  
> @@ -677,6 +705,7 @@ extern const struct tsens_plat_data data_ipq5018;
>  /* TSENS v2 targets */
>  extern struct tsens_plat_data data_8996, data_ipq8074, data_tsens_v2;
>  extern const struct tsens_plat_data data_ipq5332, data_ipq5424;
> +extern const struct tsens_plat_data data_x1e80100, data_sc7280;
>  
>  /* TSENS automotive targets */
>  extern struct tsens_plat_data data_automotive_v2;
> 
