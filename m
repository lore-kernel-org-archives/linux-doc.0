Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868858;
	b=E2Kvo0y58iaNQgF+b0RPgmyLA70TYRE4zUcoPRzhF3tkvf/2joYrl5iO9ErqRt67qq7E
	 Qkx7o9BqzLC7vh766vVaBwmynthMvzG458dy9Ww1TbNvpp+pWb5dwZdENaQuQG3OyCOnB
	 rWy7x/VdQnuykqt/eLBem/O601YQf8R25J6zPYQErivM7oWM3LqCLYrBJNAivSizP+hEB
	 NDbQzv0bHqDPaNmuOu9EWqgUkX9UUH4LbGVoxwwF/Q4tIjsX/Xp3vwyFyIw7EBsMuSaqL
	 2zjPkxTaH1ARRHPY3JGUBtT86iqiGeJaX74bZUDFoOtmXdqCi11Gi1gr8NczF2wDiPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868858;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=m6c0U2kXZv+b92GN9K/VAduIpfZBm5UMGcmej7J4GdQ=;
	b=wjNEbr3Uu2ouhrwn8LpRsLPlACmi3shOoJ4W5q9QO3e/pq8OMCEhOuB+ZlN/chdN0kqt
	 L0p7/G2jmgHAVsgGLz2wG9EWGMT8FshZ0pntZHGaqa84i/M9RSTt3tbrfg5FdhyzKBfJc
	 vMgY2aePGMpjoq9kggSHE/z7Pse8c18THqg6iBUmRqzy6ymHrqnfZM4e3OMyHB6Ljq7xF
	 wet2+W8+E/LNVVexGTBKD6uZbMJReyaQense1JEAtanB1J+7kjQu4hHGSM/k6DBKTTUtX
	 rINc6/XfyfPlZXXJp7gpwH+jn/oLF2gu9RW9SU2o4GCH6kYPDhmqdTANiPYwmNniCWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oI8fiLxr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WkZLQlkC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C28606A328
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 08:54:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91C28606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oI8fiLxr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WkZLQlkC
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56U1503073545
	for <linux-doc@vger.kernel.org>; Thu, 5 Nov 2026 08:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m6c0U2kXZv+b92GN9K/VAduIpfZBm5UMGcmej7J4GdQ=; b=oI8fiLxrX9MVAS2o
	GVojKcZn+LYdt2j0/vq1o3yz1VTl2gEzCu+CWyWWI2RK3zMZ2kz8U7eGRVaVrgBl
	rfiVD2cD36WffmRqnBwzJu3iHwgLxKDskHldqTaVtXOKmLf1tBeNbUfW7u0JnqY2
	p3IrV+CsrmrcIJh1W4r8w7UkIELj7CZYSzlHpCWwMmbBu7NWPTjfiieGMbUK+d/F
	dY9s5YKZyRpwcNRPIc7I7RSGr4uS6yRibEoJ74l7VOs3bjNQ1IhizlROsAE63ASR
	kdeFEaUdv9M7AlKE/uLVm0yVPhORm36lxrQbws411Mjc1XfL20MWQr2pTW6yBWo7
	pCr5ZQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrksq8rw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 08:54:16 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc23a549a9so1305785137.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 00:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793868856; x=1794473656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m6c0U2kXZv+b92GN9K/VAduIpfZBm5UMGcmej7J4GdQ=;
        b=WkZLQlkCpcLveevDkD2bv0zsY51xjyRlCN4tzF4sCp7CsrF+2yF84smKlfb5iXZLrm
         McXjy+KAeZm5BEdfeGDVFQZGIh+sRhtmHQVeSBu9+i3FS3ZSIShbNwqqqGg7kHrW8AG7
         gJSXBbSBGp1HXUP7tml/f3687k+4YNHHyjVr7VkQGxPQ4TiCLu1B4D/3i1r37DijhkaW
         4HdsaZdIiFEDTEmdIiHGmtVeOAT9IbHFEKXHjBXJLvkr5Q1XTxyzMpQATvjhSwdn+mI2
         GsckBUfyntcwCWD4yn4NHlz4kXdgJRkaSxEiBXc3sJGxidDiRM+/q7ic/Hi2qtyvhz2r
         Vziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868856; x=1794473656;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m6c0U2kXZv+b92GN9K/VAduIpfZBm5UMGcmej7J4GdQ=;
        b=OECn3Obwbfr1ZwwHku09qCKnHC8jLncdxZ5F/RxjfitABAv0/p5P3ViVYe23vAjLIU
         DRpORMt2xsr/t0Ztbn2NGlGAbn1BV5X5HB3n3uU7pyDJf4r2G7WhCRxNSu2i4n8NpbNU
         r2niY1u9iEVXH+97riKPVNFx9sUgM4kOm/nvAj9MsGzxi8/3CAkgqhK7tQWQud/TqSvp
         C0joASkb0J3S3IMghlo5j5h+0bs50ZNh6251EYuwGHdzUnt4k5eqjsdvDykwMxw2G8Kf
         oPZr0SF6TlEqjP+6f3MWvDaqlz6XEqUpHjaATatCBskYBHqfFuZb1OQbDxhdBYd+8/58
         q0sQ==
X-Forwarded-Encrypted: i=1; AKwUvBysR1jQToc0eRYwhQbxmMVJ/lxww4jTrA4WTC89bMWVYLFxE1prYL43LifG8YWNeyx9zNsB3bGM0pQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BBRv88DAhyoebvOYHjRmgBTY2ieepczdRatsat+GvQtxlDNwQ
	fEeElWJ+mmXYQ83F5bG/htBLndY1yhuJhwx687k+bsJ2s2ujYj7G9wo0XvZHrtsCuLDP49IlnxP
	dC30i1s2i3hR6dH1Pmdbg6wt6ryD99U0rzrz54TieqgVHG6ns3qROjvLBK9Q2NN0=
X-Gm-Gg: AYBFou03J/pw7qSdWZVdK4FXp91+dB9LstOplZ5QiaZc2WI6vUVcM84vdn6KdZtgV8F
	7+xw+yrx0XQBs/zH+n5zyEkWA/bzWBwpNpZtntAxPxy0Ys2URDs+3JbTveR4qrKmYRJX1KXiikq
	M9uAr5rO4VJwMKN2Me1RTK83C4lo5n8aThCIw0KYeISxdSRqthqXLFfPCI/yieYO5MbsIaGl22E
	c/uu6YJAoxOhZ61be94xar+bZpv3WpiBa5szvPzAcBjqpkYbOsU3KLFuHOyJCsvAxOinXmcymHD
	BHfT6XpwIIFEFE3+d1UIcVQR3qt7A4L9d0RMArxQFiMJsUSckS7536VnymzjXa9t/tJZrdfw2w0
	dxWFMNNyZq5T4e0S/0tksS96rC6YwsobdhOltfGnEnzIOMl7YT5Bp04xp1yk7/wgIm9yvqiPGBg
	==
X-Received: by 2002:a67:e70e:0:b0:7b2:f3ff:6b34 with SMTP id ada2fe7eead31-7d07277c9e4mr9077920137.1.1793868855843;
        Thu, 05 Nov 2026 00:54:15 -0800 (PST)
X-Received: by 2002:a67:e70e:0:b0:7b2:f3ff:6b34 with SMTP id ada2fe7eead31-7d07277c9e4mr9077890137.1.1793868855323;
        Thu, 05 Nov 2026 00:54:15 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac1a1csm8603233f8f.12.2026.11.05.00.54.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:54:14 -0800 (PST)
Message-ID: <70a3eccf-2f4c-4816-a3d7-cd0a6708b5a9@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:54:12 +0100
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
Subject: Re: [PATCH] docs: submitting-patches: Clarify half-baked review tags
To: Weijie Yuan <wy@wyuan.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104171744.439209-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auw_egkhHADKXL90@wyuan.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <auw_egkhHADKXL90@wyuan.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX7Qe3dM5yZ0LX
 XfVfXdpzrBbeIHy1wYBrGkj2d4gI3UpL/oLkzS4+x/VlTPFM78Pw2vwEZFburdGLH2CcEmKWZML
 sEA8J+wjqfC9potR3n8ppBziWV3d9u1pBUScjruXULLgeY1YgIrqLu3TdZ7wV/qT8iHg1r1xuTl
 Mm7StfiKOzmQAwMla4SFHSCD3mycAw/9diH3nPVIs2P6Sf1l7UMy/JQxPq7UsR2fOnyYjutnnk+
 yagpmGUjE8QFlzyMESK0/xfUjrEliGvh05+2Mc24d9YmoiQVurNQPn92HiSsfvGnAI8FawClthm
 MeynAwFaSgbPTwT3aZTr+SPOiEychUzLcqE8Eq3kw88wllgxzp1cmoc+8s9q/dSsSI4RlkCxuJx
 CVGgkO0rERQER7y+fjrYgNSvtqizo3q+LtHJm2E80RYdZ8wM9dA80dgy3UJbFYZ/EtV9iDK5OE1
 f9b7g5M7ewLRHHZuKkw==
X-Proofpoint-ORIG-GUID: _Jnf63hNGQyBB3N3Fo7KRlJQepSUk1MT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX3bSKGp/C1Dva
 u8WPt05T3JwLORYykTzj2nW4Gm7HB6UHUpYo8B7z1oUftnsdSnZkO7IbSHQMR1/I4MyJ6Cj+4Vt
 YtHTM1nzshAZMMamA+KEfyPB9Ly0KWw=
X-Authority-Analysis: v=2.4 cv=CIe/zhrD c=1 sm=1 tr=0 ts=6aec4438 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=hQWSXl8fteurQVfxJlYA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: _Jnf63hNGQyBB3N3Fo7KRlJQepSUk1MT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050035

On 05/11/2026 09:34, Weijie Yuan wrote:
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> writes:
> 
>> Refactoring of driver subsystems or some core driver parts often come
>> with change of the actual drivers.  If that happens within one patch,
>> people giving "Reviewed-by" tag only to piece of the patch, like one
>> driver, and ignoring entire rest including the main concept of the
>> patch, are not really reviewing "the patch".
>>
>> As explained in Submitting Patches document, the "Reviewer's statement
>> of oversight" is for patch:
>>
>>   (a) I have carried out a technical review of this patch to
>>       evaluate its appropriateness and readiness for inclusion into
>>       the mainline kernel.
>>
>> The sentence is complete, meaning it does not allow implicit variations
>> "this patch or part of this patch".
> 
> Agreed.
> 
>> Reviewing pieces of patch while ignoring the main part of it, is
>> much closer to Acknowledgment, thus Ack, and "Reviewed-by" credit should
>> not be applicable.
> 
> But in this case, I suspect that your "Acked-by" trailer will still be
> interpreted as an ack of the entire patch in future git logs, rather
> than a partial ack and/or a partial review.
> 

Which would be fine, Acked-by has that meaning and no one really counts
Acks or tracks Acks for any metrics or patch quality purposes.

Best regards,
Krzysztof
