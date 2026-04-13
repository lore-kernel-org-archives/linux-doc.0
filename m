Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641693AE6E4
	for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 09:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071145; cv=none; b=Usb+Yiy6gyGtNV6dmBvTZWvxOdclHGg4OnBHCucHJcCgxd7WwiFnVCsCDW7iaY9DcKQBXrHxIlo8vDFUN+lOZfLYWXPFbT7Bc5Ib+LzuTEMAbrwfGbymLqvihaUBYr7AnQ+3OYe7sd6S0HS+cMFEutmtx8xErdIwHbd4ewyhB3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071145; c=relaxed/simple;
	bh=HvBWIjEkN6X5RQBn4tnjBzkItJ7cHBZXC8gL4GAHTOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oxuo11LApoSv66Ug5dSginJDCz5wBPH689Oargznr+XvkzjUT5CDiO0zirE+bsCYfKVZOAk1xKtiNNJNH0kKC/uM5bQiuGVe4QwFas7Y07g++PoN/4M/Lhj0wWdjiqjIths0te0EpZ5Y0HvftZSNT4zBX8CauHwNBuzwNOjF2LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E/U1GUVG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MTRdhos/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E/U1GUVG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MTRdhos/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D75eaV1481380
	for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 09:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vjUBjpRkT+GDE4DzKslbwRJdENH+P4t/nPg+9+ZAdK0=; b=E/U1GUVG9dhseGrO
	zjp7836sfwiLAcHhwbncbt+hPDQKUScdLGb4+nD9sFydXqa8Ni/4LbfnH9AvZ2c7
	+CJkvZ/s/m584Q1VB58ATOgqHlIlYVAJYmbL6o2ZtFmSiaarBw7OUh1PyeTNew95
	guz4xwp2Av5vY2NkopOo2w0eL3a/eBa1nQSD2ZlIDmv3rmBrvuFAkA1F3sIRbd5d
	Knqq6O4RlvFB6nmVnB77c99hZ29qBFRJdmsFDAwBAnhqA9gEtLdJQ5jsC43K2UZk
	DBn+qB3k1BdYtdpd5lM+nOMGMjZSToNA2ZmsdesBLOpU9ruNjG9v0OJ7e37UwGz4
	TqrPOw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexfvka3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 09:05:43 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82cd9fa609aso2565545b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 02:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776071142; x=1776675942; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vjUBjpRkT+GDE4DzKslbwRJdENH+P4t/nPg+9+ZAdK0=;
        b=MTRdhos/6Dvzlwo8G27Zz6QOp5e5g1iiot/nbZc8y8WK57PzDgP620z8WNNKhs/+Vt
         3pz7qwGWUVHDTCjP/B2vz+Lj/kb0qpbOF0H6Y3DFHTSDybM9Ju+MLXaEtRIFeyV0Ge+r
         7wi+8a7YqaJQwMM16AnHjblLstt1R4bz3MpmuI0rKxpxJ5wzgJBg1nhCG642bn3f8H/L
         ypcGWdwTq17aNlkmxHXpAI5ITqOodSP39NNtuKUZc/l/Z5xbAplsupV8kvT1vdAQu30J
         +/zDZvH9Lr4uoWhy7RyrvaEMSGtx7JHoeuRfOtI/hgTA1hz6+cCidTpt5EVOa+mzwE+C
         r/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776071142; x=1776675942;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vjUBjpRkT+GDE4DzKslbwRJdENH+P4t/nPg+9+ZAdK0=;
        b=LmRA81je6Cqzw1mmGC1EXY2Wtd2x7Fhhwd/BASeVr+XhgrjfdE/DP9n0QosF0wuVQq
         9V7sSNEQTIZln7c6k39BKrpma8dbvj7GUKXpuBPCNSM+6jQBQAPfkqOZEjBMH51WasIM
         treTAX/221a4pdRwKQ8iiuhRfS1q56R+0RzQCsOTeGwJqk6WVGHCM/F5ScdDSpJKpbQi
         LS1B7j//LgtRfAf2dshAXxd3Wnl5G7DDJbeUY3phxpXoPShoRKhTu4aWXfX4affJLvsI
         FV7vMJJ4JMEqj+evqsk1oSrDUjAf5WQVI1BFmsilJvO3yuDubrugQ9muNKAL+ANd1uJk
         ze6g==
X-Gm-Message-State: AOJu0YwHyxbHgGckO5CFAw1fAPNQLgR2t0B0Au/XLmY0b3sGniE/h+bD
	wIaQMqxknTAPOt4qkdYYwys/ZZzb+IUiuBlZrrZkRPQnH9vwftVVajEq70K05UyWjDlohOkMbBv
	PdIFmie/BdKxFSofzhC0F2d3NaUOsNAeAzV3hYMhsMYocz/WwpqYmHXWfBCCNNEc=
X-Gm-Gg: AeBDiet5z0VNrUH1s/yFyq821a/JYzqNTjXXuvaAGHRCjdngZ5JEp86H+XddP52ZjQg
	WsBA6Gj63Ps7yW67ZfGJ/W6BkZTYNlvL4UuodfYhOB6AVwY+692HspScdW7tCBapgP3m/sT3vza
	hKuZ6iP7xTWaP3Qt1c4zR7CAb7f4oyRP0t9ripAjUju5bJ5cY95N9lnHt2V7USV+/40m17y+5FH
	7IhR3ov2Bzt40mNLTWcYlECYRdzXEXuGjLLbZirrx2mXkw/U4iA47OxtUai9xL3qo0BmSPq3yid
	X/bMiDYl/SNFUElAlO1+H5mABOj2oTBTJoKQA0hd2mgEG/rcIYbfONfaPnq3xXvyfpchUE1JhDc
	cfHqdEamfSabnKvKDNzjrbvySBSLrky7nHHnuVuMlNP9pCQCo8xTwoT8=
X-Received: by 2002:a05:6a00:918e:b0:82f:18fa:166e with SMTP id d2e1a72fcca58-82f18fa4110mr8670515b3a.37.1776071142428;
        Mon, 13 Apr 2026 02:05:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:918e:b0:82f:18fa:166e with SMTP id d2e1a72fcca58-82f18fa4110mr8670469b3a.37.1776071141748;
        Mon, 13 Apr 2026 02:05:41 -0700 (PDT)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c339570sm10499494b3a.16.2026.04.13.02.05.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 02:05:41 -0700 (PDT)
Message-ID: <837cac8d-ef3a-49b4-9f10-2682df2cf273@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 14:35:36 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 9/9] Documentation: ABI: Add sysfs ABI documentation
 for DDR training data
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-9-47ad79308762@oss.qualcomm.com>
 <4bc1363d-5785-4214-8057-4f2a75e0f8a8@oss.qualcomm.com>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <4bc1363d-5785-4214-8057-4f2a75e0f8a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ssfwLJo9Pq153yM9MkvSVDHPJD97oK7N
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69dcb1e7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=aPmjE-LijuUacBvKLa4A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: ssfwLJo9Pq153yM9MkvSVDHPJD97oK7N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4OCBTYWx0ZWRfX0qfHxbZ42XzQ
 jbg08tQybSnLF53yLDZKHhSXAJP1cYIyyGV2AqnLTKmjj1Yj6SEdeCkHyyREUa8bH1grF6S1A/o
 rndjneXu0CQhTWFJ5d1jWS4m3xolFKVPqY5xWSETU4us5tAMb2gEURsqkw4V3wf9EBqimHW0skp
 doAR1aSDZZRaY1/yS+zDtAI30HtYwJ9RcXfJ3JXYPmZJmpJNVciKTkJ/PAKCQ+0h4AU/StKXP6c
 c84iSKE7Y73/R6p4EHqFVp5Up7vjPTIq0Kp1BLB4zq3JFLyDO58BWhlf7wiGVzfbn+LDfANkIza
 On2NTh9kXPpSzG0yM1UDZ4Xo7HXFXyDVltVVa4jWFXk/1Zbb/s2y+GXC2ZcFaUYX2QJA8gMDm75
 vQuJsCkvBX4LCI9JhLka5wZVw5SJMkjIX4FizjoHb/qdkMx1rmOzATL4QgYe9GQLPeBwh6a0Far
 y/b/EjVjPZriixxqCGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130088


On 4/10/2026 3:00 AM, Jeff Hugo wrote:
> On 3/19/2026 12:31 AM, Kishore Batta wrote:
>> Add ABI documentation for the DDR training data sysfs attribute 
>> exposed by
>> the sahara MHI driver.
>
> Sahara
>
> Also, this patch should be squashed with the previous patch since that 
> is the one that adds this sysfs entry.


ACK. Will correct Sahara keyword and also squash this with previous patch.

