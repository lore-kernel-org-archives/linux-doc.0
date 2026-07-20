Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D283B42C4
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 20:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784578058; cv=none; b=UxL5hcX3PEW9kZdxah/3kUyuzWUsA4xc/NK79nz1uyY0e7fUKKGhipob258Ajy470Ra76asm9MepXnD3yBg+FbHSl/Eqix/axixCORswqFLAnZfc1SleDTQnZKqrD56eJOKw28/QHwou2EYMXpQGvitAzCCoaZL4hrpMObcPEls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784578058; c=relaxed/simple;
	bh=LGrdWEuT7keK94kqeuSq7Las3dkp3HeUocwXD8AFATA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bU2JKDla5qw7/5UIleL/qqTAFtFAF6Kvv/ieLsd91KJFwnYCjXyjAs9A01PVTPXpdhMdNK2+IHEDxio2FHCHuKcW/lEYArI0lE8igS2e0p2dk9j97403LFr1yq4HFgpK7TWVm4PC5Z/klo0PApHKqTN53yZxCZhU6D/FNX/sU98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nfiPyBMp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hfaY4TNF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nfiPyBMp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hfaY4TNF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KJTXEB3284278
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 20:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/gU0Bjcz6gevLpZPMsPuntoWQiycmw1kGtp7ffZLM7s=; b=nfiPyBMp3MeNE0uW
	HisocUGunlVdZo9pHvtKTtLUcBUsjludYPPrnv16PJiZgiSj/zHkIR91+/udzKjF
	VCwYsOBCHNjAOKreHdZVm6Uxtso1q49it60Wc0yvNksBFqyzV/l6JvPgPqLkLd8F
	/S7ciGh9+vDMWrlYBO/XgfqakKjbsUYW6W8MwFNJxee5zfgQxQ+PI8aIPD1STJxt
	cXIPgzSFIpd49S4eFHPPjq8j4luZG1vti7Sh9VuqUd/0sVRQeacVSEcq0tj0vWlA
	by/CGUUAhVmknKMbYw8eXh5wGDj5E00DJAG/kBYzn9CcVjRluEfhXoKuNmSugB4v
	WLiRoQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhh5y2sx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 20:07:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c20762d21so99122841cf.0
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 13:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784578055; x=1785182855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/gU0Bjcz6gevLpZPMsPuntoWQiycmw1kGtp7ffZLM7s=;
        b=hfaY4TNFLN1kF/qKzeMYtQLgzXbjr67/Sgbw41HpFansNDTXNorUoZ/AVcHqXI485R
         jBcqNaMB5tSPHXiskcvXdtvPY+kqXFnKbgtMmpj+A3+ZZfuQ0BC76ug3qejW5439Vvad
         Q1ROoyx7N/45XOCvQo8+9VJ+zhDDgIx2+nHxJekMwLs3x8DVdVsq2/DYvna1Y8OzpZou
         Iu4wUdoXUKoSbgQQ3Lg329NDTYAC27sG/sfnU6uD2RCB2ipZJs6gxg76UOFeHXrZPDvR
         DwlG/dTIYh14JTVcNfzTJs635pWGfJYDPgJr+j00UyabORC2wIrMlGBxc4FUt7w/b373
         ykcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784578055; x=1785182855;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/gU0Bjcz6gevLpZPMsPuntoWQiycmw1kGtp7ffZLM7s=;
        b=oHjzbW05rgYJgo46lbQCS6T1uRWW1UuiGGr1cMOj+Tgdqz1CK62HCdJX8vbv8QCXrM
         rb+BD+51sN4SqMnrI4OJFggTLZAd8fadh97bI06BciGDOs4FIDLlY50UHtix9lRXvFcV
         XcjpvKdPaf2ge/So7qf506UwPVYFpMxd0YH5XppdHPaXKZC+5g/57K2nMs+fGN4hcDPA
         se4EO2AYeklPYCbYqeNCWhTgZulg9a/nrWaXkZpeeUrdAiMk05Ru0i1PI4299+OawLMj
         yivVMUuEmFyijvSwIwKgRCGhcgiBviv9EEHA1Z6lSkkFvE73BMPHvot71ZDtLosRbSIS
         VBDA==
X-Forwarded-Encrypted: i=1; AHgh+Rq5A1AkTwq7c4KYyNTlzMr1DDRFbOreA376qGWkUENcmiTs+X/LtglJvSDz4gvADchHezYLLxkLvzs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYSMPbF+zCqeWfJI+lsFOq3amPNdg6H4nWDN7iiPO2SzxOB099
	zspYpA5pBL7BUK3lp7AVTZOpos2vLSy853vRhs/pcbXyV6kjG8h+RSmUIHNoqSoon76rsAls9tq
	Du21ZjE75pjpG0TjLoDfp2VkQhg6VNzRVHBL9xKEMbxNhcTFJu64p3qMhEScAwxs=
X-Gm-Gg: AfdE7ckslI03GMRPuC7z5lj7qFC0iVDuzY03rdSHQQTTGBddSS1rwhV34D+0Lx23LEy
	39+dCdIeXatyFEfduvbbI1eezdGtJDN6NRN2UjeopzaAB3e/BgSvzryY/ar1uihfJhknHO6ZMfH
	yOtMTfqS4ouLp0grkGxct9Tf4N1J9856h1PmALJy7f2rBHPE4W5f2QS1CFS9IeE+u+LDA9OriYm
	hfpJvWZpa7cX527314Y9h7o/vt1LinYrXRkEGAlYYbskG/tu2GSMt8rCgkQcFAt4Ca5CrDIpVXr
	eQ++B/pjt626uGBXZbhJkyNS8Kme3P146w1f68/PQHIyh4UwXuI2zt4Z+NpXQxGFGm9+KBoPzY1
	VLOjy7Q5BORb4OrE7H1/XCdlrxHaG3A==
X-Received: by 2002:ac8:5a43:0:b0:51c:25da:903f with SMTP id d75a77b69052e-5213eb784bdmr146931771cf.59.1784578055131;
        Mon, 20 Jul 2026 13:07:35 -0700 (PDT)
X-Received: by 2002:ac8:5a43:0:b0:51c:25da:903f with SMTP id d75a77b69052e-5213eb784bdmr146931361cf.59.1784578054627;
        Mon, 20 Jul 2026 13:07:34 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ee0086sm35375670f8f.30.2026.07.20.13.07.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 13:07:33 -0700 (PDT)
Message-ID: <3e797ffc-8cf6-437c-81f2-9f82d946d042@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 22:07:32 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs: dt: maintainer: Add Devicetree and OF maintainer
 profile document
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Saravana Kannan <saravanak@kernel.org>
References: <20260720184040.9870-2-krzysztof.kozlowski@oss.qualcomm.com>
 <87y0f531uz.fsf@trenco.lwn.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <87y0f531uz.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIxOSBTYWx0ZWRfX8yIGJBRpW+zf
 c/CGT9IAmyV7wTPRjXYpKpJykhWZME3NkzmXflmfGLnwOZ6o8qQNjjM+GUEBI4K85qqd9oS6c5/
 7F5dcq/fVmXy+Aw/iaMAtbN1seNXfr0=
X-Proofpoint-GUID: C4bQQhGig5NYqEDc4b91PM9YNcRemrx6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIxOSBTYWx0ZWRfX5uREUXEIdXMV
 MYF8O8yiKJ4tsZ5RINW0gTBh72oC2UrYl+9Jg+CCdn30Ml+GPbwVjTSKhSpokoe8cQ7jBptclyv
 afh3DXb4YozqwrhiLJvOIt37UFFCeu0kBFD9ugrAlN7xa+LfhfGTWeLz3eMfsT2q2KziSa5Pj6D
 z+i8TTFUh7KaX7teNxx2H+3qrnTAtBO5G/NFbdrYJ7SMbvQylrAg9XejD5KVI9F0OIljRXv6SOZ
 n7qZBcpWmR5mYLhYRsryEES3qaHyyhp8ZiVbx0OPugONtJnf/sjkJn/afm4ayEBuXAe+fz6r/bU
 sthelKQFXpEbEcDVvJ7vHHkEbZlU9j66+CK3IfqIgy2SCMv/UW2cfyqWaI60SLjZ3xZX7w5/X0A
 YDxTQLDw0hzI4TBEZjRA5k1D+pID4gj2Msbp2J/duv+KUNG5KTul9pevCl8rK0UCm43asq3tASA
 gTY9SB2aPHtdFMW8hdw==
X-Proofpoint-ORIG-GUID: C4bQQhGig5NYqEDc4b91PM9YNcRemrx6
X-Authority-Analysis: v=2.4 cv=f/x4wuyM c=1 sm=1 tr=0 ts=6a5e8008 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VHDG6K7AFjjWFEZ5LykA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1011 adultscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200219

On 20/07/2026 21:19, Jonathan Corbet wrote:
>> I expect patch to be picked up by Rob, after review.
>>
>> Changes in v3:
>> 1. Add also F: entry
>>
>> Changes in v2:
>> 1. Correct typos and trailing white spaces.
>> 2. Fix order of P: after C: in maintainers.
>> ---
>>  .../process/maintainer-devicetree.rst         | 70 +++++++++++++++++++
>>  MAINTAINERS                                   |  3 +
>>  2 files changed, 73 insertions(+)
>>  create mode 100644 Documentation/process/maintainer-devicetree.rst
> 
> You'll need to add this new file to index.rst as well.

Hm, where? In docs/process/index.rst? None of the other maintainer
profiles are mentioned there.

Best regards,
Krzysztof
