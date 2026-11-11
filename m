Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386217;
	b=RXzC9f3RKK8/zolX0gjf1VLPjZmZfm4rYtMu5c14LwoB1ItRAdXem+2E/+8akN5lFyB2
	 1EDRVdsMLvs9nfKPicw3JDZYi8Or1G++cUW8JHx3bFd/2JA+298ETMkFOdljw6blcG6Rw
	 PfreqdKqICYR5S5jD6S+fvhqUUYnqyDF5qrmU0izj0CiuLYa5OaHeNODN0QvZRfNV/TGF
	 AAfGkTuCNaE8QKgp2TrrwlF6L3s39UYGippeEZpqiijnNzIK2wost9VzSHb1TaZvAhzFh
	 AcjWls+ip3G8aRXy9qIRLCVJrr1/H3gapfzp3TuQTuHOEc3c0q4EXm8To/HoLisTNHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386217;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=igMYJMq7eF04W/A/XL8oyJAjhaFF7eFiuQ1RKU9QAE4=;
	b=n05AVh3kLtSh1bW9N9fk+vwpyfjkVK0aB2VCLkwG3yxsjyTujhepp3GksVJrEi4EEVvC
	 /TcrIqRaQSPKLaq4saXY3wRJed7SZxg1hDyMH6oVQK0F4Z4ywe5wriCDdeDyQnwu09vqZ
	 3OMQ/hwn4C24ZlnD9H752lStgmVr44gE+t85mbYYDnnDSbIFoMgOqiThTr9zl5hAzFvrZ
	 YTsITsYTdhIkgCAIZJ4g2J2f8TxKHmZ7NuZAQ+Ryg/IYw/yPSoAEbS1VpGDZMGmD2wOFi
	 lkGoMCuHKvOiih2vO+Wa8nP7T33xNrQvThy2cDVHVIdWR1FoMPl/ILUVPrL6iRWrCrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I+e347Nr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZKIdUQr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5471606A320
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 08:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5471606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I+e347Nr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZKIdUQr
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB7DWb81590236
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 08:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	igMYJMq7eF04W/A/XL8oyJAjhaFF7eFiuQ1RKU9QAE4=; b=I+e347Nr8kQrrMhv
	CdfUv6n7OT4zzKr7jAN3iOK26iVfN75BV9KR1z7u7uGfVenCJO59oapm173a/luI
	FfEj0V+4oofjcwJOFv9O7cqlijPcNIkwJwuwLq41hPyBL8b3URmI9aHmW1hXxow1
	pES6YA8Bj6K6bnMsGxxnzWUVtBLt2hZ+vwfQu+Q3cO4CxgCDUzJu4yrKusReoKMF
	yZP4jfl6e2S+RG/P/JE0R2xfKRBLskX4iRc4GywP3a1zaD3S8VYrnr/YiBk923yU
	Snk0zTGuv2dVU1nUwUV89T6DtqnY58TXLkiGrWDgW+od5O3uvJHpxRqAOt9KQJDP
	CW4f9w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksm8ajh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 08:36:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375f0fd31f4so1750253eec.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 00:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794386215; x=1794991015; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=igMYJMq7eF04W/A/XL8oyJAjhaFF7eFiuQ1RKU9QAE4=;
        b=bZKIdUQrK+UAyPNLzL5I4Iw7Q0TZ31Q+0VsEmK65H9eI16NLb3JCf3yBrTqEnC+gKF
         PC5YW4nr2xtx42rUIvruqduNL9LgNkTfKDLdbGy7mAOl6OgyEZdTJ99Dj8pgMEOIgUDx
         /cevxc2L5+eTBPN6VieVKWXPc5Qh0K0HEYVETchtSzo7GzcZUtwWz9BvkV4EonJsgVfl
         A3l+WNIqckiEnuFIJING5ngg1MirhgEwhkAqYUhtYvdUUtPjxPnKorlQYM/mWQQy2tjG
         ZFUD8348s6xzC8+GLRZ5pmDQ2Iz79dDxJClNTfUSSuBgPlvnHQc0lfRfp22rz7VHnggw
         Qz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386215; x=1794991015;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=igMYJMq7eF04W/A/XL8oyJAjhaFF7eFiuQ1RKU9QAE4=;
        b=bqJyx96mIPlqDAMm4NdjUrXzrNPn2ivJxemWKM4bdkMEaAxMABUrmbIJxkUPjprYFW
         UFN7fkUrK40zao4rCtc1x+VSBwKafvCQ9WdrRc2U4WFUPd8IfVj5SQNpogi+jZfiShAc
         nCGDXlSHBUr1T34COg2+0w+Qgh8I95Os/zh5/CiLOICOd45X/tJFDqADBB3x1MMj6GsT
         L5Xrmu8EXiQNotME8OfZTmePlDuuVYwFw0jIiF56hfeFra3jkG9G+lQAoZz0YNkHvFqd
         P0Xx6AP0/ENX+cj1VabRTp79FCjmjRYkJdBz+TN24iC/E5bHD2hTS/sW+sf+8Wvwtr4N
         Ndug==
X-Forwarded-Encrypted: i=1; AL+hErETELb8wj+HWRn7V/5lcQQDP+EcYRLeO/Pi4tcW1jguQMwUoygTWIAkt9mtGeXUJskFDRxTGvOoQ/8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VS+qNubhG6jRNR6oBhHsfNHBpZZfp2JCZ0kmTKFHrYEIxdo71
	uvoyjX2wzJAucQB4sBn48Z1KrGlnHiGYD0qHgj2aEEAyOc3ndE6MpnzbyPhkC1oxVsogwUXiqfu
	Ud/C9xX1Qc1+LQoVY1JqQa6IWqkLvSI06cOrig7kolbGpQCE3Hd0z8t5hqKMtjA0=
X-Gm-Gg: AYBFou3WMOJ9rG4fR//RHMa2DPX7dKruzSrkzc1116IU/JHyI64KA9WRcA+CPNI7EIH
	tPcNcTXRwfo2EsY/dLanxOhM5QoONXmpcYDYJwGk43jNAGbawpjnqBsw9iVPJvkGuBl5X2FrEgR
	PIfwOnn42XTeSU1Cpp7QuhQZAJejk+GR6bThJGXoiIV4jiEoV/KEZaktbnApF9Js7B4W8fZWTop
	A1ICsCrdLq5/RDFCxc8koR03PxIZ9nby/2uSIK0ISZL/vT3ssCoHa23EaoH870gRZtY48XNweGg
	q9WR8UJknpixN+khZQ8ofuhGD12++4vW+/Cp6t+Nh5cZMeqb2f125fwK44xjtG2mq1tS64rwuXX
	kxST0VLjmgzzFBAhOfUbwoC6dmU119nWQh+yaMle13zP2r480pwp70Pe17Ua5XefGWDRSxK06/1
	1nThA=
X-Received: by 2002:a05:693c:66d3:20b0:35e:f1a5:9ba6 with SMTP id 5a478bee46e88-37683188881mr2370144eec.5.1794386215163;
        Wed, 11 Nov 2026 00:36:55 -0800 (PST)
X-Received: by 2002:a05:693c:66d3:20b0:35e:f1a5:9ba6 with SMTP id 5a478bee46e88-37683188881mr2370118eec.5.1794386214630;
        Wed, 11 Nov 2026 00:36:54 -0800 (PST)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm14498936eec.7.2026.11.11.00.36.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 00:36:54 -0800 (PST)
Message-ID: <a723688d-5a23-4ab5-8cee-bd4b6dfd8aa8@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 14:06:51 +0530
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
Subject: Re: [PATCH v4 01/25] accel/qda: Add QDA driver documentation
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: srini@kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
 <20261102-v4-v4-1-88f2f24a5f0b@qti.qualcomm.com>
 <CAMAsx6cNcqHLHHgS5ZxvnK2fjrV74WmsZ+8peLvu0gwPjFr+6w@mail.gmail.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <CAMAsx6cNcqHLHHgS5ZxvnK2fjrV74WmsZ+8peLvu0gwPjFr+6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Y-NlbBwujYq00Cv4agt4SEmmuthS5q8R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzNCBTYWx0ZWRfX07Iq3Jn/MxMM
 i8unvv3tbSrIwh8dT9Nm94DEBATzkCy5ArXOqfAqRM7TZW13zI4wu8SlVE/pLx/hIUj2vQeNzG4
 9gqqnfHI8FfEhDd/9kfBnZDF4uBTg0U63WvwZvdYZ1VhsrzmAMnjdkZEcG5QTpNgSJ/sW0g288Y
 QyY7grWgt7q5efDPMHzsVNCA3m3RDRNR2IARm0GXKiMQjpMsD6HWBgArq076xxrZrRjHr68ZI1M
 spG0M8TQiyogDH188hReto0Wi5nN5EWDujvPAav2Tq7HwZTFFDNeEzWluiK43dJZCcQX/OHe31/
 xUlzdmbphwnhsKWRumqB/+liROSyTUS+8xNmskz1Jt+quzrVUJJiarZE2cOzOqT24Y85uQWdc6l
 ZIeG91Hd8pCTHSPc5MdOU3q6oSrQLI456+INJo9nD6Cfmo55ajBRLQRdz3yO/E5ugFTxnSZoWCy
 +b/WWmvpJ0Z72+61hBQ==
X-Proofpoint-ORIG-GUID: Y-NlbBwujYq00Cv4agt4SEmmuthS5q8R
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af42928 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qPl2DjZev0XnbMKBJ24A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzNCBTYWx0ZWRfX93jDlWB45rtm
 kFdF0xGNnXMXftBq4vjRdu/31/O26hsdEX2rc1YKSV5zI5GN+xugB/SsjaxRASbe3dE8m+6bOST
 xVjEdiJlKAMsvJUECsbcCQcnjxMJziw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110034

On 03-11-2026 19:49, Daniel Pereira wrote:
> On Sun, Nov 01, 2026 07:37 PM, Ekansh Gupta
> <ekansh.gupta@oss.qualcomm.com> wrote:
>>
> Hi Ekansh,
> 
> The document reads well. I only have a few wording and consistency nits:
> 
>> +The driver binds to the device-tree nodes described by
> 
> The kernel documentation spells it "devicetree" (no hyphen). The same
> applies to the other "device-tree" occurrences in the file.
> 
>> +4. **Context banks** (``qda_cb``): creates a platform device for each
>> ...
>> + They are created before the accel device is registered
> 
> "They" is ambiguous here (the platform devices or the context banks).
> Consider naming the subject.
Thanks, will fix these.

> 
> Thanks,
> Daniel

