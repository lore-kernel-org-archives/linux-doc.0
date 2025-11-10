Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE01232AAC7
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 18:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762800597; cv=none; b=dNtHSYXs+F7tTp9EZM/zKgMIyeWLPMJ8inbyLVQh08xt6rn+vFkQ2rTlgwaCDW/6B2myf2erFRDAiNDyy2bV/UOpHUcSMOm/P0Q3XgTo4PcLW0XHVgSZPiTJm36IIyoH3z9v4W+fDiOnc8qcqjoCIQ4OPWdAuVCTn93lIyZxFDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762800597; c=relaxed/simple;
	bh=5KsqV0q3bBOU5rsRiux1gNTW1pdgiIi69GXvdpcIg2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PoB0BAlblVLgQN9+AynPyJHjZ0XJDXftt92aSn+0l4D8bAwPExe1nIez6bdmmpePN1hegPR2at7f2b9PKj2PugulD7b7svx9+JPN0slyclVTCYfExIKQRw8q/wkF5vwLLwAiL3Vsm9GkLH5rRL9ThLNmxgcEJaG5NSGel4LDjnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PL1AEmln; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FQu4JQnI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PL1AEmln";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FQu4JQnI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAGnsSF4073997
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 18:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O0m4SsGXFjn2QrveGO9bZZGQsmQpk9SLlkT4+HpNpjY=; b=PL1AEmln8Wp5xl7w
	if42V9d8kC2vO7KoDJ8J7Zziit+76YgVx6P4OGUTF5++Avt5HSX8vh+zX0RZUvST
	j1dialVZPYE8Ips1+6OIaaQimcYMg2Rn4/K568KCdb9SbqHr32ryC0wvm2u4zxYs
	g9xlzv4+LcBTGoUQHp2W2lIH0nh8gqt0+vUZJu17tSShwNIDii8PR5J/nrj6wGVm
	OzREJZiylPjgoeRGEdO15OJOUvoJuYFFqK/rfV93oA6LGJpq4UvqZU0W0Kqpp0hK
	vuyDnH+32MhvEqVv/cJMVpHn4smdPUT6TLB8MQL9pKkMIze7h4234INZE0m9diIZ
	4+WCEA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abkws8bn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 18:49:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-340c07119bfso8173998a91.2
        for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 10:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762800593; x=1763405393; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O0m4SsGXFjn2QrveGO9bZZGQsmQpk9SLlkT4+HpNpjY=;
        b=FQu4JQnIc9X6NepP1SbernDV8nPvFm6zn4itCBbxYZig6pcqZ6TSuCO+mMElYrO7NG
         fbsqM/Qy11Yg5bms/K3Ned8UOj5TTrvYpic58a4vf5XuM2rTe6xTy4gmHTM79xpR44jV
         pxyPmkRuDLN5T8+2c4ufBmnkq1Jh+GhUYOd6S1r+NiDlTes7aM1p34a5M4dcek0wUA6R
         qExZRp+OKj7yNAB6NoU8eW5krfWN6tb1x3s1+ENokaWnLlRzwO++eMI0C31kEVRB/M44
         R3uok/VdP8N0anTeX7BQ4sSMxkdAu3wrxH7bvW/bAypLG8G842c1IlUlb5GJAGMZK0sj
         Ciqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762800593; x=1763405393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O0m4SsGXFjn2QrveGO9bZZGQsmQpk9SLlkT4+HpNpjY=;
        b=AZafa5iyUPUAlPcYjEN5EgbQg2H8l+lUW0vJRHsVjk86JoyQYFqtwjXqYJI5vkobGq
         udxrjtKIJqcjEI5QOmE9Z7pHbXIjLamJFtFc5HXyORVhH/9RUUyqaTHgWM87TLj2bxbQ
         G9uUxgWEHmRbcjo2zKCKnMZtT5I5NBS+cH3ehKbBXL35lFpHjshbSXAdiAjIuUzi6UbB
         If2J2t696SWKRuFolJDXJhh3gsoPJu2s3bSuajd2x9jWdop8xc6f1JIhl38CUujpk6xU
         tNUChX/uTncm3e1xr7lE0JQLKoVmXYCUDbdXPVGEqxfdTx0qx7+QkLg4L9wfBPapxtVM
         Vefw==
X-Forwarded-Encrypted: i=1; AJvYcCV/0vjoiI79LdUIUzD8edi8Sm0ZzS9ZxnREq913yssFuiPtEbr8DSYcgWhbkliSPYEIhsU9q5kYE9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YybpfDbUMyquZtzUFq7dCCPOGHDx9htXr3PCQF9ZZscnVlJq1Rw
	4r0Z9SRHKrVtsnXA3lsV36tcTwPO8Divs2a9+PEO+N/v5G/yoAx7tumw55+1qdyalAs24piBssU
	saZerFhE0qi1hvp071JrVltMY3HCnnMiLj+yHpCiBAsUNjYmqSYq0zcZatRI1ovk=
X-Gm-Gg: ASbGncvNYBaRWOIgen1zbdI11PYXbB3yOHWBNs9B/5KISxUyNkDILwEODOeJJeh9KtQ
	kUn/4aTgRnuiv6WT1n5nTVOXu0GAR0sdWKPNGw1Zvtpwok0SX84z9EjrPIFy5Wi/Lh3vH4ABMMT
	KluyzXXZUlinq4Wm/xwwPHEx9j8zFIrKMVhqMbNLQq633pZ8j0uy3AhOZz9WY4AJca2Gtub33Jy
	N06h+JXT0Xz6QsMaUGJAP6byajdkgrxDmI5SneUdlaC3g88/SD01q97vB84Telu5UBJHq/XYuAT
	hV5cLJ6nxgCargABm16RM6OY58QJzQd7FNuRf193heElWzQiepm2lE3eCW/vnETqAfMkN3MBMKz
	w2Bb6wqgc3kTGfH7cheuflsKgXA1edOkldba3NElIhI1UABOpDvIc
X-Received: by 2002:a17:90b:3904:b0:340:ec6f:5adb with SMTP id 98e67ed59e1d1-3436cb7beb3mr11459420a91.3.1762800592652;
        Mon, 10 Nov 2025 10:49:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEly7/dDtyVvwZoxb1UUG2yBv46sYHnPdx6WiV4Ldjd9d3p/YphCmNqkTgC3gIcVgA7m3+7tw==
X-Received: by 2002:a17:90b:3904:b0:340:ec6f:5adb with SMTP id 98e67ed59e1d1-3436cb7beb3mr11459389a91.3.1762800592166;
        Mon, 10 Nov 2025 10:49:52 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8f8e750c1sm13402258a12.1.2025.11.10.10.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 10:49:51 -0800 (PST)
Message-ID: <507160ca-a3ba-4705-984b-ef94a56e3b8f@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 11:49:49 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] accel/qaic: Separate DBC_STATE_* definition list
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
 <20251110035952.25778-3-bagasdotme@gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251110035952.25778-3-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE1OSBTYWx0ZWRfX3ARGGZoylO3U
 37UNvUGjGZzN1KGN32gPNI3sSB0TSCo/e4dr/4Mv0AOa3/XwCo9ZRULmUZfw3xGRuC11XiOxoYa
 2M207E7MguYxND2yQdkizzYHraKQtan2rCMcJq7GHbNI2vHyb2z6Ve8htSEjWo8683OlqNWug7E
 Jv5KJGk+LMdGyoMkYNx/LmAa4/ExalBKzU5truDo0OJEmWxilhCBE6Pj2qS7Daz1bynBM7EIE3G
 uYSBdQ9w7+qqJCI2HGigfMiCpw/1/EsTnJ7eGJCe9xL8un4C+2AMyIJo3TDnWYaCei8DPvq0ZIy
 0aJcwnJz21BFA+hjgJw9rAIURwB2rs2iuf1sYjvlKXmWVYe8jxTiLbOQSUEDaRJfBM+nx6fn9P3
 iIySAAdXupVpnmkUwzs0e7WekGnKIg==
X-Authority-Analysis: v=2.4 cv=Vosuwu2n c=1 sm=1 tr=0 ts=691233d1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=yxMg_K-rWnv8iLjOS7QA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-GUID: CH2K4sRTd5qFBcm5PTaykzHnQrD7FwZR
X-Proofpoint-ORIG-GUID: CH2K4sRTd5qFBcm5PTaykzHnQrD7FwZR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_07,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511100159

On 11/9/2025 8:59 PM, Bagas Sanjaya wrote:
> Stephen Rothwell reports htmldocs warnings when merging drm-misc tree:
> 
> Documentation/accel/qaic/aic100.rst:502: ERROR: Unexpected indentation. [docutils]
> Documentation/accel/qaic/aic100.rst:504: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
> 
> Fix these by separating DBC_STATE_* definition list from preceding
> paragraph.
> 
> Fixes: 9675093acea04c ("accel/qaic: Implement basic SSR handling")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20251110132401.200d88bd@canb.auug.org.au/
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
