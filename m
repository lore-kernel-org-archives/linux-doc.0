Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BCC32D0FA
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 18:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762800611; cv=none; b=FtQlTB4mmn4rYvVcrqKuPqUffqP5qykSMrAmhWZhRCPI7+FHYZCCOFgX0btJ/SmRSBu3lXak3XUnOTxujQ3KuLSdPwNUDGIZyL/rFKuTbayNUUkKyvmTxt0g0jJ4t8XM81a5UO7rDp03+ZVFG7RLOAoAgxvI1GSYZ3ff45AOwDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762800611; c=relaxed/simple;
	bh=wWAAHsBo5eGVreWpDIGPuNgkq+S79c815li9vXHQXAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zre1ZQgvlf6LDIgKrAKtMG3YQpmRxAntXsUuoIhagOn8MZ4bqIi6NEFUsaz5sM4HdVrFJtvNYsq3wPATmylZJBrydLTgPCadHtJToJX1hDBZao/aFNpqygqAdRqp/L2bUw6qlyV/93wLHF1eI3ZQE1GIyaAnKGvxOwLY9uL71XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eQ8ANLLy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aSYW0Wsv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eQ8ANLLy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aSYW0Wsv"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAGYNWq4070712
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 18:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RrsqLNacV7Ae9T939lkJ95hgRyBZA3cSW6oQvnilp7Q=; b=eQ8ANLLysglmEV88
	MDw9r2QGq2ZNgu8euJvumCzNGM2H3URrC7z4D0VUTCGKH/ruVgQRn4xq7vI8rNsO
	Cjbmw77aXsU65D4WnMnI+8cvbdQtk2oHe1tr9g2YVOZcQnLZ6GJiwmBk7EfEewzR
	WsVmfKBTbozctStCa3UBE3tDRu9akIOj6xTkvAlBzboIO3Ue9A6weUdcZKF3Hkz9
	VjmsOR680noAqDgJklluR6qBErWEV8I8CVaWYSre3ewEAYgjthVBsYjCK6rnV3rq
	WoyymRA2zJRjs4FdGhF/oYObuIL52z0J8++J+FPomv7NvBkBG0E5SrBx0YRWQ0Gr
	DCMcyw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abkpj8dfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 18:50:08 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-33da21394adso3566890a91.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 10:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762800607; x=1763405407; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RrsqLNacV7Ae9T939lkJ95hgRyBZA3cSW6oQvnilp7Q=;
        b=aSYW0WsvszyD93irLh90OOLm03E1safSfPmmYFfgNPoBF3HsbdoyqM9fkDNpJK/4jC
         3PayEF6qNII6Dk1DVSghGFZG1tlL78nK6wlpyNGEqJ2+ooF6ye0036xOZZYDE+QiHBms
         wGd4jd6FQDtRJ0ijAUf6po1AMP2lkXWCd6oybxA0o3/aAo1/bDLpY9KCX63gduQsjP//
         ZzXkbimDOscjDB/w4MU+0rJdh1BvvHgEYiapnsJCkKqbktGNQtHHYlWS25ErXwsqNT04
         YgQOw7ePNjA9C/rOdT/UuQ/XZUBgTV2jw2Z77lem14et7MsVmx25Tds+6lbYKFEHdo9b
         ofAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762800607; x=1763405407;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RrsqLNacV7Ae9T939lkJ95hgRyBZA3cSW6oQvnilp7Q=;
        b=I/XhvwB8FMtrZwpBMn4R6QmTDS6mdteXaa86bevPzkVOWN565xalIrzQccudoJVM6z
         grPk56khlBsOiFHQ8l1Q7oZGvDrP8cixBfCK8RwHzHRUZaR5Vqp2CXN4PG1uw8db2xji
         5kkID217sIpS9Di4DEfKAHOJPOJNLZ+Uk5tfe6Cdnk5cN/PTkUeOwR8DXfKIPb0ZM4JU
         L1nGN4Qc6F1JiORk6IoEEfa3cX/3OqRY8d7M9HrgYEGZJfUBVQyiwOUem7q0z3U3ZjjU
         g3Ul/QRZX14xIeUzMW/P38qYuTM6qA8WIkDgX8i7MqRQLlXBYXCO94shUaRzsJX7qOSH
         5pCA==
X-Forwarded-Encrypted: i=1; AJvYcCWtClklJjS++plSW7EMFbX/trbsRXJEttj9hzifb9aHcojcg+mHr3tN9VHphvjlgImEIyPQVdtpYHA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3adcBtZ6CHuaSQj9gOzruDYi7bPccQ7Oh+FmcUbRXOk8SVkCW
	IfAz9SNZbPWZHLcNBJmmpdWOey0+HQjlKMZz8ksIP7lEr2hcSFhqL0FJQvYejGNfzoKWRhMA/Zp
	FaMfIwcCZeS/3ainHN0CwgLWpJJOEYj68/kSUry1yNJo+xVugOhwgUKzpP1sAACs=
X-Gm-Gg: ASbGnctZZ32d70gnJTfoDfbKNsEQe+KXsWWLXpMw+zEaVLTk3DaPEC4V2IsEmIXSK4p
	3CAipJMbl/7zTShpUyUB9b9suuUQ94P//cZ96nyaMk7wdn65Rp7Gd2kjhrYEhGyUXzja6DI84AG
	vikSr+STJQ20XcEMK2QBVn3VPTWTHWBi5cnBQU1FCt+iLcA6SfZ2hhEtKYGzna6HMEoewgEdNMw
	WJXkpzkLc3/B0ThuIwy2+G+cg56Tp5knbiT5pPeXnSF+BetwkXfjjQdA4e+t6BeO/lI7S3zgEyR
	/0L4HeTyF8jQZ/JLNnlSamASduH86XIVZq3bgVsL/it7Nu/rKbsVjOf3KaJdghiRQuP9l+p+g7y
	AzZr312E1HQjk/7XwheFCj+ZWuQOZP9DsXyriGTvertWc72O4CPDz
X-Received: by 2002:a17:90b:264a:b0:32e:a4d:41cb with SMTP id 98e67ed59e1d1-3436cb73f0fmr10032681a91.1.1762800607082;
        Mon, 10 Nov 2025 10:50:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2ixeW1TzGwl+WOFs/7oSmDpLI/67kOgWoub7CURXWxtpro6vNnQTPq5GNpFvY22qB8U2+fQ==
X-Received: by 2002:a17:90b:264a:b0:32e:a4d:41cb with SMTP id 98e67ed59e1d1-3436cb73f0fmr10032634a91.1.1762800606409;
        Mon, 10 Nov 2025 10:50:06 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343bfef789esm48975a91.1.2025.11.10.10.50.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 10:50:05 -0800 (PST)
Message-ID: <8f1028f5-039e-4040-a7f9-58ddb3b06cf4@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 11:50:04 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] accel/qaic: Format DBC states table in sysfs ABI
 documentation
To: Bagas Sanjaya <bagasdotme@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Documentation <linux-doc@vger.kernel.org>,
        Linux ARM MSM <linux-arm-msm@vger.kernel.org>,
        Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
        Aswin Venkatesan <aswivenk@qti.qualcomm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <20251110035952.25778-2-bagasdotme@gmail.com>
 <20251110035952.25778-4-bagasdotme@gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251110035952.25778-4-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uvIhIEsQrpF1jmxX9xFhPdkP4-7uFe_g
X-Authority-Analysis: v=2.4 cv=GZoaXAXL c=1 sm=1 tr=0 ts=691233e0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=p_F4U7gO7gGRQ7AvxbEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-GUID: uvIhIEsQrpF1jmxX9xFhPdkP4-7uFe_g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE1OSBTYWx0ZWRfX7cqPYxlixGnr
 K7L0gBB8juXApdI4b9tAGwKx2g2M20JSfapTDCQJVDtLr/oELDURjohtTAdzcbTOfJt49qBea5o
 iFr+sUXHWPqo267A8tm+t5R3ZPEetnDx1PGNT8R6PHC4VsQ+C7m8Xc2iSEoV4QCHlp6PehGbvp1
 PNjkyyXSH7Hw0uYjbDQkSkrb6oYZCof3zIBSeqN4OQskGwMBAPuYfNioxG4QL+S1kVlpqzqwQix
 Aedbrho9pTCRbCr1nEiH0AdPJ9AnH65Sd7OSVlwxJIjB6KBJfyxc78CujPhPKnp3IQPhtTMS7NY
 HSa1fSnN3Vc0IGNJ+bAPPX4S4p46BNGCmB8r1fXxsjveVc/qzSD2WhWMDGvHu85xF0ZTt96wEDW
 TJH/OZqZjKVepE/6RytCaDiuDly/zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_07,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100159

On 11/9/2025 8:59 PM, Bagas Sanjaya wrote:
> Stephen Rothwell reports htmldocs warnings when merging drm-misc tree:
> 
> Documentation/ABI/stable/sysfs-driver-qaic:1: ERROR: Unexpected indentation. [docutils]
> Documentation/ABI/stable/sysfs-driver-qaic:1: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
> Documentation/ABI/stable/sysfs-driver-qaic:1: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
> 
> These are caused by DMA Bridge channel (DBC) states list in sysfs ABI
> docs. Format it as a table to fix them.
> 
> Fixes: f286066ed9df38 ("accel/qaic: Add DMA Bridge Channel(DBC) sysfs and uevents")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20251110135038.29e96051@canb.auug.org.au/
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
