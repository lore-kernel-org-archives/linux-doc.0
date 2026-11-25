Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596396;
	b=EH8XgUZxCqn0okrBTAr8JaKv7jaH1njYGJT+GLwU2U7hDuhVLfvHzHChjHCnxctAhfLW
	 lUX40p4lphHdQd2xYCuwGRKBM9AZjeEQsahjZGgPS0h3HSJp3Vy2LccpQAi04uTDGdnE+
	 np4IKDugEx/R4kxpPcD2eQRi9GpVi608cCzmlFyhrj8swgw3opBGYMDmeddR5llz/aL2J
	 kUNi1ThyJ5UJ/PQcGZT+YIpIfrbJxcGG+U56/KW0jHUu1ls+7gfEEKjjHSDIKtDdFygyd
	 Dk/XfQ63NjuVf06K/PQSjLdHtZZevpGCgaFSyjIUJW8cmCV2HkjZ69AfIV8dzpoAKLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596396;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kKvNZULobWTkgnWspQ6zXpMU9tDRDqB+Try7/+v8+b0=;
	b=cD4P43FAQRcH0YrSvw9a10vq5CkcDjtsYA8dSuHD9ETs6akdh/f5/xWr+9DNlmvbU6X/
	 kvzRGOS7fD9iyWSHZukviME/iDCg9I7Wdu9lmuMNr0MS23tYV7WTBVlq1y9hH/o+PFNgp
	 4VO+1sKFUiy4hXE62QPAZE6+soFC61ozdp+HLufOuDTnnuTKD0JIyVEf/96x0oHVaJNCG
	 kJADR2uOoVNi1JKutlSNBRexlBIyYMcNCnUaWpAS/vjBX6Eua74RDf6lIBlNslnqVHqsd
	 VuDRyMu0TwVW7yIxITLxz/RtYnZELZuRq21MbzuMxM7eufdnCqrvxBgW0sA5crL3J7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D4A2rRQm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DFYkPXcS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62346606A326
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 08:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62346606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D4A2rRQm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DFYkPXcS
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68c893630245
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 08:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kKvNZULobWTkgnWspQ6zXpMU9tDRDqB+Try7/+v8+b0=; b=D4A2rRQmHNjsn9qZ
	7CGgn+x/QEBQ43ddBcy28LJf53/3XBPIFbXlptTz2TKlwprHiA9KsIuQgmvmGOQo
	uN9t77tMbJdBP+SUtQf1buggw3Me8N18yqTbqxY1WI3uwUcqUJnP2InkWHaL0Vsj
	40tHf8swZu+xtQT17OB4PLI8w87Nhj/yijS6AGTfTVYMPuMHHaicKZWXUskdkmFf
	6h7/KXDRZMXzz+PnEUxIqfoYrS8Cecacium/klrtGvENWGrGlx7cTFvqIHW3C2bC
	03f2FGD3YojsjhTdmwx1vbXrqIHwIR7RWm5TWMIy5f28bdjLBUfc5Ldu6/PQA7TL
	guJWyQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5b804gj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 08:46:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0a7cbf164so4613155a91.3
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 00:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795596394; x=1796201194; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kKvNZULobWTkgnWspQ6zXpMU9tDRDqB+Try7/+v8+b0=;
        b=DFYkPXcSpNXNI10LP/9KTWCquzqzBW1RqzLUTGh1/7HxeMxYYe9b5irpzyd5B6nKDs
         icXbJsr6TNHyAoyzNCbdiUicH4jloEyMMNMttxvMhhxCY5ay8vfd/zQf7FirtrN+5yLR
         FS7iyNRnLSl1iZsJS6DFH5Q8K7kIOehwLLnFj+6QJgNK5ekt8MDg7C407JR+5NlIcQLf
         tsch84SO32S006jKgyqkMrWZRVMfS6HQ5UnLsHlGDoE0dNGR5lG38mNUoWndpy9LuPn5
         5EKtol2f+dT5iJOMcxiTZ9ybLc38RLl3kQP9tXzXUgDXZPc/EgjH34PT3vXqs+31nOem
         4N2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596394; x=1796201194;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kKvNZULobWTkgnWspQ6zXpMU9tDRDqB+Try7/+v8+b0=;
        b=TkBdn7fTv9OIu0Xs6cQS34pXqhdTX41vjLNsPuOA7uK7mR2cZD2NsEHoVROMWXwAz7
         RgDjj0wxHksf89DcBG1XVaIiFyJXpwcqyth/17pLQKhgwI96WW2gePWgxqdYe7GoClQo
         uzOZSsR7varFfPQ6gkD5CFD6UtXGA+Ctux7YEgG7JU/Sz6T1vxIr250OMzYwzLWm3UQi
         qV1suec5SLB+1HFHMrjXa4yr5Yg9fYuIRcWcEpl6YepUk3mR7etzbcwnQdoonjyUlk9C
         /e2nbtsOx4dzinuxCGAJiWgtgCfBVCguWkdevfrbmcL4Y0B0zjdARBb8UgPLaAy0M3SR
         Ac2A==
X-Forwarded-Encrypted: i=1; AL+hErHFvNz6xaAu/52/egD/Ihy9zfFgwVnL3ROAkt4iroM/QlRIfJvgI76gE0ZozdL07hgLoHIaO8WDyXk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bO3W3FlZBAGyc69iSBSS/0ENFxqAhZxbY9AhRTvbZmpMUZH1w
	XpxKYF+cLIsVKlPiKzc0KWOt+ocXnlS/CVhu/yEePiSZEjpAdqr86xr2aTJqmtyydpaloqv8p9+
	ZjCZThzNTowAPqKpAiCW1PdxKHrCFa1eE25r7YHrUPCGboUNrz8tdgNojMvcWIJg=
X-Gm-Gg: AZFdTZdBuHuxYkUC3ginPjR+VHj41814X/7QmDIhAgPzqzLvrlL/m+j4dAnSd0gzyAH
	v/MYY2TcAzGZW2+es/Yszn5N67usuZpwaif00izQ6vEDwFmsPbG6Rpa/5c46aeZ7IXDpmqEuFRx
	ICXzebS0JkzmtTz8jI+Wbeenx3ESWYTF3Ijj2zYU2W3Z3Kh6xhKw/E78HBL+H5VmuR0pb0bMzYy
	Q/KUkgzDEPqcdV9GxCXY/DnXjfmwn/BKOTP95wRaOw9i6w1iG/ny555dp4IgFD1otD241qc/zhN
	6O6BiHvxYyztUU8tbbAimwYof5swM9+FGBudnAvbsgOAilNivNLpu0Slw53vMzi6d9oXBKV5x0j
	pzsIScIIDD/unUpTZk6igQfq+2YW5yCIr0HPcMvvFgfa1nTQVczDPeA904ganptX2RvH9INofGh
	KS
X-Received: by 2002:a17:90a:d2cf:b0:3b4:d22:8600 with SMTP id 98e67ed59e1d1-3b41c8fe1e2mr14881283a91.18.1795596393918;
        Wed, 25 Nov 2026 00:46:33 -0800 (PST)
X-Received: by 2002:a17:90a:d2cf:b0:3b4:d22:8600 with SMTP id 98e67ed59e1d1-3b41c8fe1e2mr14881261a91.18.1795596393472;
        Wed, 25 Nov 2026 00:46:33 -0800 (PST)
Received: from [192.168.1.12] ([223.230.5.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b495035339sm13872331a91.0.2026.11.25.00.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 00:46:33 -0800 (PST)
Message-ID: <dfb34991-ceb2-48c8-b1a1-bb6d07a594e4@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:16:22 +0530
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
Subject: Re: [PATCH v4 21/25] accel/qda: Add Audio protection domain attach
 and its remote heap
To: Arnd Bergmann <arnd@arndb.de>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Srinivas Kandagatla
 <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski
 <krzk@kernel.org>, rob.clark@oss.qualcomm.com,
        Jason Gunthorpe <jgg@ziepe.ca>
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
 <20261102-v4-v4-21-88f2f24a5f0b@qti.qualcomm.com>
 <ab387dce-fa47-4fe8-90ea-d0b8013d01a6@app.fastmail.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <ab387dce-fa47-4fe8-90ea-d0b8013d01a6@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX63aab+YBAvwF
 8+Zp786yiZW6Oi9AkpJeQTc0VVD741Q4SUD5H0DV4kExUZup9OLaAkbMRLvsc8cIv4sVOMFyX0+
 FHlJBWuJE4CsEIRGhIHqSQ6oOMHwesXK2ip17GMGiFrzVpFUq6zaTVJ/TWBqT3v8oD3vwIddjFx
 YLXqZLO7epGVHjsP+U2mdys0K0piNj+H59bVEoFp/oSxAtXd76X75rIi44xuZkSouHzv8sdE8mv
 94b7yJB9fkLOfwZl9ftH2Ueu5GjjWMtfpalF9xPcWELIorRJotC/DaGCEKy/j06pH+zdpw9UdDI
 +3Bt9sG1IS+n9HwZ/u2+WMSBWoCwgu21yzzUiO3S7xwtViheaPsiGD6hCdOET4L5esl+fscpmX9
 AOMNvitU5kexaW6OEg+HyGC6D1l5dnbCfjSuO0c0wwJQ/r2uG5RbG7ZUjVxnTUvF8J/rhkfjyEP
 Lv58hta4BivrQmTPT1A==
X-Authority-Analysis: v=2.4 cv=K5W3jCWI c=1 sm=1 tr=0 ts=6b06a06b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=7CQlB+x2kvO/AZ184d7fkw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=JiugtRSXLg-Y64xyin8A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: qq7-aIbAzqIIHQVuyaTFBDNh2hseG4Gl
X-Proofpoint-GUID: qq7-aIbAzqIIHQVuyaTFBDNh2hseG4Gl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfXzQlqptHwzUh2
 JZlt/bN/J7yLlqCjVcAAw4PCsPftRxEaYGzBWn1dV2NmY/ecksHlVNrsMOJBy9DfniUF75pAXe/
 xjTKhgWUVtBfIt3DvftHc0pnFYu1an4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250034

On 02-11-2026 14:13, Arnd Bergmann wrote:
> On Sun, Nov 1, 2026, at 23:21, Ekansh Gupta wrote:
> 
>>  struct drm_qda_remote_attach {
>>  	__u32 pd_type;
>> -	__u32 pad;
>> +	__u32 namelen;
>> +	__u64 name;
>>  };
>>
> 
> This is an ABI change in the middle of the series, which isn't
> great even though it is harmless as there are no users that
> would see the initial ABI.
> 
> I'd suggest defining the structure in the final length
> from the start.
> 
>       Arnd
ack, I'll define the final form in the patch that introduces it
