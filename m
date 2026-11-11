Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386107;
	b=dFQyWYZBpg9FXmjq91CV2HnaDD4eWasagdlOAAXXga0xB3BCdNLOlE4i1QtTQWohw8Ai
	 dDaMQRed2TmtjuuJn0EkD34KbD7bP8loyWsBYSSZ5qUfHK0O4H/334cblCNHbAwU415Zq
	 /kQfIJevQ5qjYSbM/C2giCCv1cjrjGpDKLg8TmA6VOFTykivJ+TX8hNxLCVsZkXuoezkr
	 F+PBnNV/h7T5TXqx2U5LK9rx6RQryKmZJKGNPkPNEJ9w6TmjpgE49lEPR8j38JlB4VPR2
	 RgDtri+/wtlKi5XTNi0A9U+TuUDOoLDIwbY8uwlGXKORTyaYjuwWNjs8wKfJJxQRYGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386107;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+AtNonFM71vbXHQV7j3ip4nyJfhO59wdnq4MfPfi1bI=;
	b=tYMqq1ClJiVTSWLxbGERNJA+/yMkXG29o3PkN76WN+kXwgr0vERN+UZqnfbBspGFwBe9
	 nqaY+GNy3yuG/Smta0QFrwtmsr75dpT1vZ9RTmQJk2TnS+nSHIwZKUdT7CovKI8BIZ6EI
	 LbB+VC77jgRTmhVEG05jTnvJx/rffenCHOJ8U5eE3OoVmhq7SIUWklWKgf6Y/RqCirPqo
	 Rn3BNgo0H7XENS+Z+EeHp8smBUNf6cACJy3zpWu62ni7vIxiEdxtqBui1ZIKL2SlUJEna
	 YfUX0caIIt5OXwgItBIvcwtXCMnGnRhDEzYUb1LM2X/j7bdv6JSItBHViaXN2/QN5Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G3MTb9Y+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZjdZC0l8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE17606A320
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 08:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AE17606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G3MTb9Y+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZjdZC0l8
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB6ZBHC581257
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 08:35:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+AtNonFM71vbXHQV7j3ip4nyJfhO59wdnq4MfPfi1bI=; b=G3MTb9Y+8weOGt9Y
	0+2hSI46Wr9+Kwaj1870IOXSx1KuhQOGseWxevW0WyhgVw8JBLUG2173hWJj4OEW
	SHDGiOZsFx65l1TAU4ZmhIjNGzBFh68P8mW2IaUPqq4ZA7jdV8tVgdjZwEjw7e6i
	7riyufEhiwVMl2YbnQkGk2peswmp8dJtiOkc2ohko8HhjjZMSwMhSThbEFgvdPxC
	kWJTzxN0DUJ7vwdeerFRkDPPFpayGrBrunj6h30UpPUfay7A6PzJy4NYhC3bubv+
	D8uvY9d2+8itGgJXtEs2+RwMd6H/ZDeQJyPcClfnRuiNelMcSB5K8mnmDZZWIAZ1
	A2vm/A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7pre1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 08:35:05 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37549877380so2560310eec.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 00:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794386105; x=1794990905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+AtNonFM71vbXHQV7j3ip4nyJfhO59wdnq4MfPfi1bI=;
        b=ZjdZC0l8oV+sMnH0NSJcrkNuJQVoBfua7bNYTbzZwFz2tjDbhIxUrFCBZoixGFzVhp
         /9mFjptd8QeOxNqSc3AyyrzXePt34abTWh0ZdRWDl3V1KwPquP0lLwH+anVIEL+PiUbx
         gyMFVzoMHHFMTBpWqMFplu3Ao7YnWZXiHnb7PUaYqAaOpIyAJQ/bChRkugTeSY/PqqkP
         V/YHVFwKLuE7dJEK3PFLX4MBM6ktzY7Nh6hYXdATr7Py80qv1iBfljQoUWUJKzEzdlT2
         1JTtiSMReW56PgkDo5uAADv777jSmzdQd6kBPcbXI4yIdJeexewW3gzCRVnLnsrSr1sJ
         ipWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386105; x=1794990905;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+AtNonFM71vbXHQV7j3ip4nyJfhO59wdnq4MfPfi1bI=;
        b=VL9aLTTNzjTPgwsczkArM4MlyZ89sk2MH5UARSZYkZsZeFhF6PA41/w6BxZAV0JLes
         5BTyOzcm/XQ/U3ORImvH0ReUexdFH2oAZtVlTCBx7sm2kpazbS693KRHZem27ouo8eFI
         prRkcbcojjXWv7ui06GE/a1dwRjOLFhqg84oXpFVUHz5ZYkAUPs04M4Dj4HO2jgbYez9
         bZGjj6A9tSa91fdorv9qJNwuoeQHIDnskOHnzCyQU/L9vgP/nO3oSk+ABiuX1pG9SGtA
         zFSaBOSRYepGnLuIT52DHpubg9YyDHlbOJYElbP4dAh8KlPn0pqKDTkKWT6aISDeIGGV
         MvBg==
X-Forwarded-Encrypted: i=1; AL+hErECz7194gUQqEcTBtrMiWhhzv/6tq7GtzdII14B0PTIP/4RHauYXAPmeh0Q0sHEepFr8cAnO+5LpI8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eFUvFwS5ogiWTfxeCFMcaQ70LRsuK/w5uAni1RAyfn/VGznSG
	PKXkz+WkeWtEpZzrkbsV785x18TZNIoMt/bwGTpoT1wxgsMId2Qk0fGWG5fpVEyeA6td2SMlFFE
	h38KGO81iHXdky79RVkkv7UyvAV9HaYaOt3tAlKoHsfTUN/YPsvnHVz6qfa/svHY=
X-Gm-Gg: AYBFou3v3wvpCQfRv7zTVAXRXDmJjvu/8xwc7YdZ5whU2OSiasMBtaz6Vw+1ggo35Z9
	EJVeAVQsX59HwUE450rWA0UaADKKjs6HVMtnGjgKbf7y9U5HnLx04CdTb9poF0P4NyMEbXJHGAP
	AKMtwovTPS+eWLnmTrox2CrYkQU5pZZFeLnSLWLJE5+xbsMthdRwUurDObEtKS4jcWVrhRIbaa5
	ObnqnOhRq8aWfWQsNSzUJ4XpRr2OcNV9wHAowmxwmbwQ0FJ5zBeNAKeX7IE2TIGJ/zO4XsACQlj
	e+GgFw8dtUtV+g5TcGL/sstoqYgOdk97FTa9BenQODtxpmOZKOyXtqkWPqTy5PzpuvTTNcRQvEI
	x8DDq2JwwWlQRBQLXfOz/T0Yv13C9mZhsfdswPZ2luGZbg50kfHYz7cKtNwVak1z+8sin0AZPoA
	IQEEk=
X-Received: by 2002:a05:7301:5f01:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-37685b80487mr3633518eec.10.1794386104845;
        Wed, 11 Nov 2026 00:35:04 -0800 (PST)
X-Received: by 2002:a05:7301:5f01:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-37685b80487mr3633472eec.10.1794386104118;
        Wed, 11 Nov 2026 00:35:04 -0800 (PST)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e7d24sm21766474eec.22.2026.11.11.00.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 00:35:03 -0800 (PST)
Message-ID: <0f24911e-83e6-4de7-9af9-3c1bd3e143d9@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 14:04:52 +0530
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
Subject: Re: [PATCH v4 03/25] accel/qda: Add compute context bank devices
To: Krzysztof Kozlowski <krzk@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Srinivas Kandagatla
 <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, rob.clark@oss.qualcomm.com, jgg@ziepe.ca
Cc: lingtong@qti.qualcomm.com, cacar@qti.qualcomm.com,
        sandheep@qti.qualcomm.com, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
 <20261102-v4-v4-3-88f2f24a5f0b@qti.qualcomm.com>
 <492ed183-9495-401e-b678-e91a324f5a64@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <492ed183-9495-401e-b678-e91a324f5a64@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzNCBTYWx0ZWRfXyk8D4a4hPZsl
 Gq5cDYcIBzHaisNa/aVeSCvu1ozXg1UUbm8Mb9WNYovxrvvhfRPBlNCA2WTYxRxYqYi5Yu1woFU
 j6mUKPLkUHocrmYFe137NK0tYi+ab0g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzNCBTYWx0ZWRfX4lrWRxpQLCPx
 UBCwoHtjjiOgCxOaDrxzJkWP0doxQjXYGu/JE8K0dQ5eGn3OBKtqNBIfDio7h+NteXRcx9N4jcd
 WDlBr4/DPjpNoOUw6S+f/bcVL6Ag6LdFo2KNiCiaIHmzV/TnYi8hY8RFxYu71ak69g+3XayP5B0
 l3fGdlFldGaR931vcCkgZew2GVG1wXtZrOMv5CMBcYqqWyfeSUjVVWeJ7uYK1l3n4tApG304lxf
 DH8tXnwgnLsvVehdBwTK0RtYquL3OmCbYQL3v5GLfY355U52TPAXDD9hsCcTFDFL+vn4DVORvs0
 nT4CyRVaqWmW6zm1tp37XBRj3QXmhq/JVnrQj6nidzYzz1fO59kz1MQj5RPujLiqCHMivvVhIzT
 NrqN+TbATFYp/TNS4ND35HG0X5IN2ocz4Ax8ClBQxcWmtPQykhmFAHF+TN86LYPGbqofnBjpy/r
 3DDsFLsCHvp2yjfu+UA==
X-Proofpoint-GUID: Sfr0qp2bkE1vp3Sij6xiW1zL3ePCDAEP
X-Proofpoint-ORIG-GUID: Sfr0qp2bkE1vp3Sij6xiW1zL3ePCDAEP
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af428b9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=_YfdpRd3OS4PFdmd1n4A:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110034

On 02-11-2026 14:13, Krzysztof Kozlowski wrote:
> On 01/11/2026 23:21, Ekansh Gupta wrote:
>> diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
>> index 6bd977e8d68a..78b5f31974c1 100644
>> --- a/drivers/accel/qda/qda_rpmsg.c
>> +++ b/drivers/accel/qda/qda_rpmsg.c
>> @@ -5,18 +5,18 @@
>>  #include <linux/rpmsg.h>
>>  #include <drm/drm_print.h>
>>  
>> +#include "qda_cb.h"
>>  #include "qda_drv.h"
>> +#include "qda_soc.h"
>>  
>>  /*
>>   * Both compatibles the binding defines are matched here. The glymur, hawi,
>>   * maili and nord nodes name "qcom,kaanapali-fastrpc" as their fallback
>> - * compatible and so are matched by that entry. Per-SoC DSP parameters are
>> - * attached as match data by a later patch, once there is something that
>> - * consumes them.
> 
> You just added this in previous commit. Why adding invalid
> documentation, which is immediately removed?
I'll fix this in the next spin.

> 
>> + * compatible and so are matched by that entry.
> 
> 
> 
> Best regards,
> Krzysztof

