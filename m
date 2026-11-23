Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462525;
	b=dw1q/LCiIQtrzZ7JL1BMNGfzN7vusdkovN4+WPQNX5kciU/tEFe6aWzQJC8qtUqaUb6d
	 AcLp+25ITzkkV2CFK/+azfMu0xJpJQNBONtNYr+GR2EWaZJ9Gk2BsaeWMiLFkfs//xq1g
	 poqzzkTWxYIauj5ko1bRa6W2XaojSMfUGhkl9ut2POMkg8A2t2D2ZI/1Ewx+cbfCjej3H
	 c9XvK2XblkC9DhHvgvWH2LQ5YPFvVIzcSTcl9GjgXG5GRs7yU0TxND8qblTwcTxqBJzoE
	 6sWNenURtZsdn7RnXV7mkFeYNavgYaJl5n8Yyt7ZTJLcCw5R8KtUkoIsY4lnoSG34Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=74mX4a3vRqZEyTV8MaSaXTpj++Dtm74ijLlv0eeiueg=;
	b=sF4imILjr0La2I1YjUxe38IXc8qSKycjU+kWwU1Hr+B1M6/YP7ARm6Gwx1XqFwQZ2dx/
	 FdR414b5hYlPOMZ5oswGhMZ48B6n0pau9vZ2KguYNg+B+de9RlKc3HsdMGGCydrvqCMpL
	 +2JkvebSGvOr4qPSXd96FEtc9w2aAh0s8HchadehvwN1Su0b7WzgjfglHtr+q/KmWKtyD
	 IuOhxDi+vvDo8UqjqJLJB7lapXQFLepB2wCxCvMxKLWY6fKXdWry7vW0UgSNH1V+p1G5V
	 mEjXn+/YL2doDRZSnvWb1esEAxpQ1cKf3yVQf9KfSzjR+gMX6V8s9rMkfi7n2YU0D+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i0kM35MM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=evuPWXBg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CAA606A32C
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 19:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40CAA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i0kM35MM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=evuPWXBg
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJNFcY647031
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 19:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=74mX4a3vRqZEyTV8MaSaXTpj
	++Dtm74ijLlv0eeiueg=; b=i0kM35MMHabLAbMOP4SVW3ovhIuBCRprPcSdpGRR
	1j1pJ+96IZXsT1MNg5tMrEEZnBOBuXNHWOA6cWZ2mVHyqAqy5902QVXjQuADfDTa
	FjLmZBnM+ld51CWIcT/1sDPHHKSP+DDHeJW57IM+TvaLWsfoseZEfNUtNjAlS+pi
	9jxNWzT5jyZTWr06p4kc2eBME22hGa0ju0stzwpMyY+qY/v7HHcs7Wv8pVBmuyUE
	d2163ZYt8oynYY6rPHZt0b8nAIkCVBOU1XqCtJ6H2H6J7bBLeraUaV+EuSmPY2p/
	ODrGLBWyO46RnmhEkLlUo1ai/Ca+7RkDRriy1Okd5fVvpw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqg1cb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 19:35:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f32050e72so892307785a.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 11:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462523; x=1796067323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=74mX4a3vRqZEyTV8MaSaXTpj++Dtm74ijLlv0eeiueg=;
        b=evuPWXBg2S1HDs02kVAFSafa1UPDJ/qwUXhXw4tcKqyhkg5WJz+fJ9pxPHc/oXbUUa
         QeyVeMnGivjh87mhEFVW16GXiiTEns6O2+61ZSlsQiCKTu1M8MUm/QtcAOpj8f9fgsbC
         tSQvql/i9k8TOGkxuZZCMmig4n47F67fYOTO7eeLA53Nh3ZVaCgPm7lVOzgPoi8LihK8
         S3cXpxzm0L8jjgQzmL44gLOI+59swUHL3dg/6wvBV5waJaLKp0M0Gi2AcLClC8+5/UJP
         xNgaX8iGcxnpdDKoZiHe3IyJlFXDY2wjIPtPcolCB+AAuNO0X0PrwR0f4sQenwuzmyAN
         sEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462523; x=1796067323;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=74mX4a3vRqZEyTV8MaSaXTpj++Dtm74ijLlv0eeiueg=;
        b=Nvq9xIQjCKIMdSa4ilwOsLHbHu51/iC5e4f2kfgLRarYjsf4WMH/sBrU+/0em5QwgK
         qDHxDTUp20137fJLbpgs0XpHWvc8gZ6UDJ5eiAGPrPZBcKjk0iWsi+JKfkcjoVa/1dPY
         +3cm+yVr4C6CX0SpXFkqiKxzMfveswPGOBlMzWzCYgqrTPbbDmCzbBRuG6zjoBN/OZv0
         MIC7Z/ezcPC8xicC7P9uPwczNTW0l0R/wan2aFYKQ0BrLbWEPy8ARfABl87IsqKKi6oC
         HA1Nxm5HdOn1fHC2u2h1DcCUdPnL2XAoVUvW1liiIP01B9BISbWPy1Cal98mjMoLz7c8
         J5PA==
X-Forwarded-Encrypted: i=1; AL+hErE0uDCqWG3K9qax2OaBTNLzdE3dVBpFMH3Y2luKYeyWJPfPQ5Ob0WZKjSrP4I7MBNk9Q7znaACD1HY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7q6my97R0SjrBQ6rJQijuctQySjjPbprBLUSQycONadAerGq2
	Z/QciQYiA7epo2dA9r0QouOPgfR01zKdzkEcwaaPnnCB4XQ9b053l4krodv0AJFOkuut369LaXW
	c7nDZW1rRrXn79UIjQYUPyx1pPb8zrzD93NQ+i5cS9rj5IeTokA56yPH8nlU0ZJg=
X-Gm-Gg: AZFdTZco2O4xWeJdlNg6VgkjoSEj5CFNuwlBOP9Er5M/q7PnzUcproNQQYZ88nCq8Kz
	/jn6csj5w8oKirob0LW5UF/s+yjQYMSzW43OZF62pbCikEjdAqcUpZJzMljVYIpXcdc52VCn8sT
	6L0qwxVdzBdRkqEA/D5xnfgW6hNjJZrn9Nm2mS2Kn8N97lsYmkpfT5BVLV7vvwHEhdWsrZJeK6E
	Ta4tvXE1DdL/5Dn6dZgqKSuG5sFtzax8DrZEkrwV+pxF20Kn4kzoaXrrCjiMHh4quouKpS+ooNA
	qNVHX8uUrS7Ho6AqJ39Nw6Ekq8yTrYnwWLr4DUDzctSHcRYczYw/SRWFEDgATuRY7PQO+aIkQa6
	2zXsVpXWmIqZTyfvDUoF18mk0TdFy01fUe3ychOEQaAcenxEpI7LO9X5HJpjSPoGc
X-Received: by 2002:a05:620a:84ca:b0:949:6fd4:354d with SMTP id af79cd13be357-949ba8483f8mr2134934785a.8.1795462523326;
        Mon, 23 Nov 2026 11:35:23 -0800 (PST)
X-Received: by 2002:a05:620a:84ca:b0:949:6fd4:354d with SMTP id af79cd13be357-949ba8483f8mr2134926885a.8.1795462522682;
        Mon, 23 Nov 2026 11:35:22 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm184963885e9.3.2026.11.23.11.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:35:22 -0800 (PST)
Date: Mon, 23 Nov 2026 21:35:20 +0200
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
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Subject: Re: [PATCH v2 22/24] arm64: dts: qcom: glymur-crd: add WSA speaker
 protection VI feedback
Message-ID: <6ps6o4mexhrbmcodgl3yze2pobq2vzao4lrbhqomhrc2vbfjb4@zmuby52sku6s>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261122161437.5994-23-srinivas.kandagatla@oss.qualcomm.com>
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
In-Reply-To: <20261122161437.5994-23-srinivas.kandagatla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b04957c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=IQcQmC8h3zhotARXj3UA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfXyPk/H0/ehjta
 EyCvktEfWHVBTtNEPJKDLBsIXzhAvAUKJttR7TdfGzr5ePpXxxo7/F4+ochn2lqPyGE0YheEXPY
 Zdf7aKEUkmWJFttfr5GK16II3ECSVR8baw7LYBMYEKUbjN3buT/fR1J20r3sFl/+G/Cc7xFZ19I
 DcQ7uvfqVrCcqxUd3NoQeCbePiDmbYo1+KtWdvFDo7aU9tbiqjjkyJaFMRyaZfy6tkFCuULM8jL
 zqHVxp3UVAOhv2v3fsK3nbS/DB9a4OrWr9e18RLtnfAl2x+uckIKIm52Sev1kQPuJ/brGj8oO1H
 C2IXg8O1/Hf6PBRnzG+L8Psx4LaA6WK5eDw7l1u7Fg3LvTYCTiUUpuDIEtyf9TKboJjEXQ/mkCN
 j1k5MhZmGc69yp/pNbugc++ZsEfeRE9bfNZGUF73LYs9wbBe81tgA7HMj97vni5lDxpxpBb9FCw
 hMDbzP+MJG8uvEywFdA==
X-Proofpoint-GUID: ZendtZvyPE1dtymywmE4rtmCUaJX-Vn-
X-Proofpoint-ORIG-GUID: ZendtZvyPE1dtymywmE4rtmCUaJX-Vn-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfX8tzH7yN0BIu7
 pqdudFNlUOQs9rSaCHoOgt+M0Nt/aScxFhDScoFDviZ7zo2pogd2WfZsbTgeT458Tmj8972t4Vx
 5HSgnSdkSX/kfOnr0oE8xUOHx85IEaY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230077

On 26-11-22 16:14:35, Srinivas Kandagatla wrote:
> From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> 
> Add the V/I sense DAIs of the four WSA8845 speakers, the SoundWire VI
> ports and the WSA macro VI capture DAIs to the WSA Playback link, for
> speaker protection. The speakers now expose two DAIs, so give them a
> '#sound-dai-cells' of 1 and address the playback DAI explicitly.
> 
> The playback-side WSA SPKR codec DAIs sit next to the speaker-
> protection VI capture-side DAIs on both WSA (left) and WSA2 (right)
> buses on the same WSA Playback link. One MM1 playback open brings up
> both chains via the machine driver's multi_direction_codecs flag; the
> SP<->SP_VI control link in the topology handles the DSP-side pairing.
> 
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
