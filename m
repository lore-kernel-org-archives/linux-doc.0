Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386284;
	b=ZMwGTm/yNPcF5lIHk8KZ1wGe7yQJH483v8yoBo+yP0E5QbBwiqsckjjSECNN5lO6m6/p
	 kPSKM2vm/ye1sUDbgtJFkhdclzF1N6/yhMQTMY3nmXj5aDjviFkl5ZvtacsFjOFSW0sBL
	 H7tTJTUUkiJz3qakuNCdlVBCuBGPWNf+gVntz6gVOrKY1KkevkiVJtsoa6PX3sK4Ns9+p
	 /C1EuDdO8CwgABieI5QbTiJJpvraHRysFntgYX54LrCqUunvkZlur1FtNHXrKbUeoD0L7
	 lKadD19Y0Nc5sad9w2u0IVWASJgoqGhLGTcqGyHTtE43mZyXSv8qPagf53CJr+RrS+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386284;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gw5+l/0X8hCUV3pAatH+kYAoIZTakO9BDt3Xr52dR7I=;
	b=s2DDSKvWVxuGdJOMMXJARPBNFbKlK4QyeI8ao0mZVTTQfDi3Fc5r93oqSbrJSa9oOb8V
	 sXlBxTkd08YbKu54lHm5udp6R7Jf5D1uQkZUWtLjiJiLh89JbVMFxAfqoFtlHdNwGN38T
	 tcn9W9Tk3v0hfOorAMVN7lbJGkfir1g9ka/9VhnGaZOHpK0a7Qq5E7DsFeOZdVJknLp0L
	 gN3LXx4QqGkeK+erws8VnKWNX7+21o8Ba07khprq8S7RzEKDirtIJVxvib6Skl4g7zlKy
	 fNfqAduuvpsF+pAicqs2kiB2cNrsEo/EKKmMkvzFSmoDT3lDrVZaumPlfICksG9HWKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="moXvA8H/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hreAjHaY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644DF606A320
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 08:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 644DF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=moXvA8H/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hreAjHaY
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB6ZANv581178
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 08:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gw5+l/0X8hCUV3pAatH+kYAoIZTakO9BDt3Xr52dR7I=; b=moXvA8H/k0DpUIk4
	lY9w/LdPlAq7sEgrI3Bg+iQMIbcqWwsIi7En6h0dWGcJ2wgIUmRWR9DqciOLeb9f
	3E4rtwvhCyBMp4XGLLSAtNQQgZj9MBsMVgXZURvzkD9A4dAfy47xPfP05yMHXc6n
	pNBuZngbFXr9ZgcXlLw6Fr6CPZZKS/2SFXNh+zo6L5foTdkrnTHPN6/DDLFB0yaX
	JGzH7c/jq6gDnFcZUzEg3FESgXR0wJlIt7o/5u19B+TNP4qpuxYtchW/DBiRfuqq
	Hk93+AafEtpisLIAsq9N2Mv1TzsxfCv0NK53xgo4ZCm7m4WfLQh7QJjRslA+kTZe
	UASsEw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7precs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 08:38:03 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5870390eec.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 00:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794386283; x=1794991083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gw5+l/0X8hCUV3pAatH+kYAoIZTakO9BDt3Xr52dR7I=;
        b=hreAjHaY4pmPcE5AD6mScQ9iVhTUFHo7SXGwZTLyU1HJ6dZiyppUHo1vxnVheoiTFe
         qCILmTYu1sZYYbEQFPOm58Jt6y46BJ4N+hGrMEbEl2lFzizn8rhzIThi563lUzUqVWMH
         KkXrqBqMC+OcIlTWee/XeP560zYDs9qRjY5qhdbsStZcu/MXBoPL1+INqNbPB1ABJ3mk
         jlShdpbZZzqEN2f0+LrtUf8uhDWg8HbTpBPjldmGeJMic64npgSm2zLXpkIHBquXalmi
         XKxcexmnnQeX1/OWP05ZkOguWj2cBbEe6wr9/s/dSgEdB1+GahOJkM0/Vu3KN2+zYbSW
         sB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386283; x=1794991083;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gw5+l/0X8hCUV3pAatH+kYAoIZTakO9BDt3Xr52dR7I=;
        b=yebCyc0UGZaElGRecBPVJ56IGymNVKXRfI/H/X7lYSzlCijwOUZnKyAttdRPpv/4Pz
         Hb+TdX6MxBm/D2V+ozmFX1o1iRCB9z2MIgCuM0BtXv344mjw7DD8zot9H5bpdqhk3Uhy
         vP2v9LFJxbP9+9V0RKQbC4WculUSLzHO/SSUoythKi24xGAnZZTxl8+iZ9SlHl6KWBzm
         YTrdnZ9xswkmr8u7VmkbEyLC+6WTRdd2pxH65x5tPeqJN/u4nNkwzZ2iP5aXDeAL7s8l
         pXNV/gwZT5vLKGnK+nEwNcZTr1GfGLpncGjYFNrffzb5wNPg3mN/jQHjWOR8zLtjjs9X
         05yw==
X-Forwarded-Encrypted: i=1; AL+hErH+Tr56TOvLavqOYwz98j8UfTzK4jmDw0mpTK/j9xD0/s7w/xA3qX9vyDc/y0haIF/gesNIzn3cRTo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sk1o4JqG66wJ4si7PO8iJ1wYqity8R0YrNds6d6R156aGFok/
	bnNGnvVHcCeKl8YAw/NfM6VN29ZMUUG2Shx4q+NtpholnhrYfDsFAzT6EDUUpTRP/h5hJpgGOwY
	u9ANK2BgWvHynLmDWtdJfxdgxLUGpLJeYR9APPgdbDg+kGWTYOQsIyKEC+4U3g3w=
X-Gm-Gg: AYBFou0tYF33R1QwQ3YJAyzD9U8Ew5WI9Tv82/F0QeV5EVUwl+IjqrlRtljQpGT07bl
	Np/6HPlvzMnmYK7zMrrdfwivLDGxJ6aCABABYwfpChKNUQZcB9NvJQBTo2hFI7CaCpIRP/rX2wh
	UX2e5kjjQ1FY8emlU6raGCZw2JYZVpoL9OtGtXXBhVCwNMn/lmxKbQ9pdGYTEnksjPlc52Cw8SA
	t2sG1y74NTHi6F9bSIbt2QR5WbTWxJWpCMHUIO8sfwfbaLQIO4cMmrVWIpAZDD0otoDaiRZ+3dE
	4rtM1FHv7BSW6TPPTE+xx8d4oLzapB8D/sz1Un7PrT311OY7VWJrb3NiiT9GoLFrQjuu8j+kmz2
	K2Rt8TZjZBL0BeHtZDie1rI69GRTtO2YFbxsX4IV7D4ljqEVM+BIYotqaWeaKTW+OvQ/iYPt9Tp
	4+3A==
X-Received: by 2002:a05:7300:f54b:b0:36c:a42d:9bc9 with SMTP id 5a478bee46e88-37685c7a866mr2252056eec.25.1794386282835;
        Wed, 11 Nov 2026 00:38:02 -0800 (PST)
X-Received: by 2002:a05:7300:f54b:b0:36c:a42d:9bc9 with SMTP id 5a478bee46e88-37685c7a866mr2252038eec.25.1794386282338;
        Wed, 11 Nov 2026 00:38:02 -0800 (PST)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm14512824eec.7.2026.11.11.00.37.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 00:38:01 -0800 (PST)
Message-ID: <f915ffa9-e094-4ee8-84f6-ecac642fea1a@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 14:07:51 +0530
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
Subject: Re: [PATCH v4 16/25] accel/qda: Add DSP process creation and release
 to the legacy shim
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
 <20261102-v4-v4-16-88f2f24a5f0b@qti.qualcomm.com>
 <f030a190-0cd9-4f6d-9a71-ab08dd760a02@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <f030a190-0cd9-4f6d-9a71-ab08dd760a02@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzNCBTYWx0ZWRfX2p9vUW+RtLqB
 n/YdclGhYbzg7tZHcCrvsZezLEPr5uR233J+G9dKAYw1ilE2pBzSHtFzBBZfwaZ2agJ921vORr2
 GxvPq7gW4Y+w91Pd44Jv83G1Q9cwGmc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzNCBTYWx0ZWRfXwRu6cWHV4X7t
 Owoee0WaaQjp7m/7NoRqsZDbz0ydDhfA/pa9N7cozbS0F+IzOEDfiseZ50zw6hxlDcFGq+UZEZo
 hIPNkAJQXW50+NPYKQpdZSjpHUymNjGDNLoLInrQ3GfPu5QVthPHrUYPvlkcINk+OEgzCqOFste
 gOyiMMiq0jMxUOC0vkdmcECeG28tK+0GPcOBxp91nfgEeaT0EZqs15Ar7qd7ujiNPm+PDLTc/er
 +pv1CSLCES5M/vgiN3LRjlUbGlE2IRCgIryq67W2rfpMaV+a3jP09pS3yPfLLO12XNfiCqb17s5
 UTM8epT8uewX3LRCuwo1CUic7b9hmBYSW5fB/pgv3GDhueRRFHZydlrWaBrX3aIirKDKSVncvkb
 LwkmJYymMtaapTGSLezcsIys6LZNepC7g98WMUxG3FruTVU886X6ZHM/krp1U81hzRvIYj9UDkX
 UsACcpOz9x2bIhMhiMg==
X-Proofpoint-GUID: 1fVh24L4fliOlZPy9cLbASvh35gmIq4u
X-Proofpoint-ORIG-GUID: 1fVh24L4fliOlZPy9cLbASvh35gmIq4u
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af4296b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=_9VnGE74eSGUFLHFbeEA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110034

On 02-11-2026 14:17, Krzysztof Kozlowski wrote:
> On 01/11/2026 23:21, Ekansh Gupta wrote:
>>  	snode->sdev = sdev;
>> +	snode->secure = secure;
>>  	snode->miscdev.minor = MISC_DYNAMIC_MINOR;
>>  	snode->miscdev.name = snode->name;
>>  	snode->miscdev.fops = &qda_shim_fops;
>> @@ -293,8 +346,6 @@ static int qda_shim_probe(struct auxiliary_device *auxdev,
>>  			  const struct auxiliary_device_id *id)
>>  {
>>  	struct qda_dev *qdev = dev_get_platdata(&auxdev->dev);
>> -	bool secure_channel = !of_property_read_bool(qdev->dev->of_node,
>> -						     "qcom,non-secure-domain");
> 
> You just added these lines two patches earlier.
> 
> You are adding COMPLETELY new driver, so adding completely new code and
> then removing it is confusing. It means you added something which was
> not needed.
I'll restructure this properly.

> 
> 
> Best regards,
> Krzysztof

