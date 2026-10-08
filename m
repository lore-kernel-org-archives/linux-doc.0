Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213313BFE2D
	for <linux-doc@vger.kernel.org>; Thu,  8 Oct 2026 06:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439856; cv=none; b=ZMUCC1jjw/bhy1ZRRShhPI5Ph8OU/4cOR0jv37u9VahBHzi4zLDSjGLeg60/SpIPLFbpAwbbjgH6V4QneFdm7J8IX8aB0BmKsmon53W5wwVHIUADkYa6+lPtxqNxUVwrqkExcgRQg6p07NecBDMhfw/vtNprG7HO06Busfd9IgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439856; c=relaxed/simple;
	bh=9sm8KXWdUgCKJZiCqooRJIQAmVgG+nvnpuC5U/+qK1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SU1fOSkLJXbT9UBQnFD+UmEMRavSL3JzWWaWTvn9wPX8wUxYgSfYeH04yZd20lOtRX0nEnuAIORjk/t6z21spQDaQQ7PB2a2p5G7X3iVMHYnAROIZZWj1oR3gnN7yoltf4mUosx3sZfQxhs6jsWz1UNSWWjkS4v7Ujy7KUTOSQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dc4000Si; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nd62tLre; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dc4000Si";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nd62tLre"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BUN91775343
	for <linux-doc@vger.kernel.org>; Thu, 8 Oct 2026 06:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zjPDQNHaNCvR8SSMd/7nciKslGSKiJYIqMIIEsRJhtg=; b=Dc4000SimgsXN83I
	YITP31k18mKS8yvh2N0PkMiaGpEDdJ1SJkyWtWR8nd8dNsK08a+3gMNEiOkvWil+
	f4ghUYYHSZSMorWYDYWU8JFLvLgghY3cIyOyKguNn6rcz3Yn4Tjok5whiWbOjXgK
	H39+T5pc/gsps0BY71Vgfx8/2brr0pASt9UhMIwoE1GPgzE+RaYBSDajq2qrBMar
	jR7f8c46nQwVFeP773jhNDSL1xmLKrNZ4awcU+2uSweWbNuFELm494VU06PrkbIY
	nWzcf5O5T6yCObzS7izBeZhsxeUjQ/qExP79TwM8XwWujinvUluVIagcz+I2I3UU
	gbeEew==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe39bhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 06:10:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a4b70941efso4143318a91.0
        for <linux-doc@vger.kernel.org>; Wed, 07 Oct 2026 23:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791439853; x=1792044653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zjPDQNHaNCvR8SSMd/7nciKslGSKiJYIqMIIEsRJhtg=;
        b=Nd62tLreZqpLu3uKddMJfGbdsHJCkoCGF5SsKvi75OyU9ribSqPuHCvPpefwqaYdNT
         eiKkfAFggfXOOgYI28hhtqpIS4+o1CN4iltn5WKehrFriATFPJkVu9p1eiCyyJQ8MlYj
         FmJHnUiItelINBBz8r3selXrMQMU/puWlarOImshjM8+bhTA7XbSJzsKrcXj5Ssw7Wlm
         fmTVM3Nw49XujTiALC7YiVftFVnTOJug7YjgxTjKTEcTuAJtgn0YZIVOWRkUXVFQ6N0n
         4qn9aYlINGVRzUbknMqAd9wpxuLeZklfSz1h2fwKPtZMr/NOkBYqXVS9dYzJOmgxJilZ
         vjcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439853; x=1792044653;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zjPDQNHaNCvR8SSMd/7nciKslGSKiJYIqMIIEsRJhtg=;
        b=qEpVSzNlm1oDFQVp7LTgL6DuVerppBy+87ZcoYD3Ku7Us1Q9Tlpp5bqk4LJAd9kD3T
         BLJLc1M5SbCe4wPtO0hIWC13WL2xeWk6u+yCFZP0/aoMnTZVQmr2hmlf5Do4qE49YfOp
         4l9cp8HZMYD4UfFiuBjb7DOOf+y6FtrijeP6rPyJTAtr3+E+u+4yobBs/3X5KFg9qSXf
         j5ShAt7577ZuDpbJAGyYfijm9GVnbjpp4j4BNtML2mwBgpvBEkquRJ3KfkE+TOpGxcSN
         wGIdUEfELH5wBFB8YV1TpiOnznd7tCC/Vfyy8Mmh2f0liSJmuNDbfOXdAjh1Ul8In1RQ
         IJ+A==
X-Gm-Message-State: AFq9FYJGhS3EWToQtfQqpy1PPyun58NPKsHc8JM4VnY4oRwORcglziLE
	Y4FzupjXyDHloxzh1Lzw7ZsU669FXk68mcRtbitF2R/H817LQ99IKQcgzMUZJLZEpuTKiAEQHqq
	buy6kdd4tBh7ms32GbiFgeKwMjPdtnFAfrOT1ZaUv9ETruamtvxPdyEt3PrE/ydg=
X-Gm-Gg: AYBFou1FrIiNnjNfFEPTnkXUrliXawSjIpPzMchU+3dwX6LqI4g5S5JtkBDp17GqEd9
	zSihQX63Yd2wDJcHIFuFfJTsxfy5ZkQSOrcAfmY9c2w8sd6Lbb9wIE2nlW8CW32tcv52Evul2t4
	A4Knd9QU9cE1A+o324+FCa19NIkKjylcdVZAIF/8ixpquBJs0gL1OULLXRZ7xBk+apKlR7KGsGj
	ZVoLn+NimG1DqwUCemz8Bo8+L4KGzNZ9QTWE5we9WpZyOjP6jReg+c8Icavp0yp0Xo59SILVQAl
	YIkqy5cCfGMU6hecydHBz75gzbhBKGCyLtxn/ZEznWIlIoy+XrgFGyvzeaestUZf71fecgumpSS
	FSD16Mf1vnxd/SE12mZuZIiEgQW7SUx8=
X-Received: by 2002:a17:90a:da84:b0:3a6:fec5:c179 with SMTP id 98e67ed59e1d1-3a8a1b49b4fmr3492387a91.41.1791439853382;
        Wed, 07 Oct 2026 23:10:53 -0700 (PDT)
X-Received: by 2002:a17:90a:da84:b0:3a6:fec5:c179 with SMTP id 98e67ed59e1d1-3a8a1b49b4fmr3492280a91.41.1791439850602;
        Wed, 07 Oct 2026 23:10:50 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aa0cbc6e23sm2785258a91.14.2026.10.07.23.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:10:50 -0700 (PDT)
Message-ID: <f69b350a-63a6-4a66-afc7-8421ab86877b@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 11:40:45 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/7] Add documentation for Sahara protocol
To: Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
 <20260701-sahara_protocol_new_v2-v6-1-3a78362c4741@oss.qualcomm.com>
 <699644e7-2fc2-41b5-9e02-7f4dbc2aa3a7@infradead.org>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <699644e7-2fc2-41b5-9e02-7f4dbc2aa3a7@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac733ee cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=QPSRtYdQVBWiSw6D44AA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX5NQ5lmBdGlYG
 3nIkaRAwaAkJwMnF+T8JYXM/3rBz6rLuXoiR3BQFDsSwWdcy7dWIRE99ucpUO2oRWMsASCugjy/
 Yc7ZNmZmZuD0ZvQvMRO2BKJILDqFeZg=
X-Proofpoint-GUID: QPMS-JNz5LSu1jqs38iFXTidv1w1siod
X-Proofpoint-ORIG-GUID: QPMS-JNz5LSu1jqs38iFXTidv1w1siod
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX7LkApKFqFq0a
 n1oHyxKQLGqEQH8TikwAs8V7TWsmfbXENtqWKbrJwx8IWEEU5MyJJndGVurCQL76SIvIytQXUL4
 PEnVSitZkxkcJnAr/Bi6Vd0NVWfeemIk6YFdnq1FOfJRn8wdnx9gKoN7jSkAFsysVlts5HYms+9
 QqX/BA70M5dgQwiznAndGRNrJkxgktnyE35iRgONcLGc2LrkQ/ZY7jo3RWPRxCXGZ5ga8gN7FsP
 Ews7dfsrI7kUjiotQZlrvX6LFNrr6dOQz1KSbs24fI49dSAYGdKKXPWZN8cGgKvNnIOOzVSAZUL
 nnlMQ6LGHhwtPNTT5KjzUKGSH+6+UjM7dY8F45uJhhP7rSRWET6dnIGsCu9W9wt+R5W4b6dMf9m
 K6QkLeTx1dYFtjJqlb5I64Xanvsdu3HxE6VMkKDVs5q1lzbdV09U2HnrqU0AS5HqrD9TzMNWJwY
 QIhGCZrrULbkmxCND7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1011 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080024


On 7/8/2026 10:16 AM, Randy Dunlap wrote:
> On 7/1/26 3:37 AM, Kishore Batta wrote:
>> +The packet flow sequence is as follows :
>> +
>> +1. The target sends the hello packet to the host to initiate the protocol
>> +   with the mode set to image transfer pending.
>> +
>> +2. The host sends a hello response packet with a success status and sets the
>> +   mode to image transfer pending after it receives the hello packet and
>> +   validates the protocol version running on the target.
>> +
>> +3. After the target receives the hello response, it initiates the data
>> +   transfer by requesting the size of DDR training/calibration data.
>> +
>> +4. The host sends back the DDR training/calibration data to the target.
>> +
>> +5. The target decodes the training data and does not find valid DDR
>> +   calibration data, target sends END_IMAGE_TX to interrupt the transfer.
>> +
>> +6. The host sends DONE after receives END_IMAGE_TX.
>> +
>> +7. The target sends DONE_RESP with mode = IMAGE_TX_PENDING because it has
>> +   not received all images.
>> +
>> +8. The target executes DDR training process to generate valid DDR calibration
>> +   data and prepares to push back to host.
>> +
>> +9. The target initiates protocol by sending a hello packet with COMMAND_MODE
>> +   to the host.
>> +
>> +10. The host sends a hello response packet with a success status and sets the
>> +    mode to COMMAND_MODE.
>> +
>> +11. The target sends CMD_READY to the host.
>> +
>> +12. The host receives CMD_READY and starts to get command IDs to be executed.
>> +
>> +13. The target sends CMD_ID = 9 to push DDR calibration data to host.
>> +
>> +14. The host executes CMD_ID = 9 to get DDR calibration data from the target.
>> +
>> +15. The target sends RAW_DATA with the payload which contains DDR calibration
>> +    data to host.
>> +
>> +16. The host saves training data in the kernel buffer and exposes to userspace
>> +    via the sysfs entry. The host sends CMD_SWITCH_MODE with the mode set to
>> +    IMAGE_TX_PENDING to continue booting.
>> +
>> +17. After the target receives the CMD_SWITCH_MODE command, it sends HELLO to
>> +    the host with the mode set to IMAGE_TX_PENDING. The target and the host
>> +    repeat the packet flow for image transfer to get all booting-required
>> +    images.
>> +
>> +18. Upon successful transfer of all images, the target sends an END_IMAGE_TX
>> +    packet with a success status to the host.
>> +
>> +19. The host sends DONE after it receives END_IMAGE_TX.
>> +
>> +20. The target sends DONE_RESP with the mode set to IMAGE_TX_COMPLETE because
>> +    it has received all images. The process has been completed after the host
>> +    receives DONE_RESP with the mode set to IMAGE_TX_COMPLETE.
>> +
>> +Subsequent boot scenario with valid DDR calibration data
>> +--------------------------------------------------------
>> +
>> +The below firgure shows the subsequent boot scenario with valid DDR calibration
>> +data process being loaded from host to target.
>> +
>> +.. code-block:: text
>> +
>> +                        Host                       Target
>> +                          |          HELLO            |
>> +                          |   (mode = image transfer) |
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          |         HELLO RESP        |
>> +                          |   (mode = image transfer) |
>> +                          |-------------------------->|
>> +                          |                           |
>> +                          |         READ_DATA         |
>> +                          |   (img ID:34, 0, offset,  |
>> +                          | size of DDR training data)|
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          |         RAW_DATA          |
>> +                          |(size of DDR training data)|
>> +                          |-------------------------->|
>> +                          |                           |
>> +                          |                           |
>> +                          |       END_IMAGE_TX        |
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          |                           |
>> +                          |          DONE             |
>> +                          |-------------------------->|
>> +                          |                           |
>> +                          |                           |
>> +                          |         DONE_RESP         |
>> +                          | (mode = IMAGE_TX_PENDING) |
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          | Subsequent boot scenario  |
>> +                          | (valid calibration data)  |
>> +                          | DDR driver configures DDR |
>> +                          | using valid calibration   |
>> +                          | data                      |
>> +                          |                           |
>> +                          |                           |
>> +                          |          HELLO            |
>> +                          | (mode = IMAGE_TX_PENDING) |
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          |         HELLO RESP        |
>> +                          | (mode = IMAGE_TX_PENDING) |
>> +                          |-------------------------->|
>> +                          |                           |
>> +                          | Boot/Load rest of the     |
>> +                          |    images....             |
>> +                          |                           |
>> +                          |       END_IMAGE_TX        |
>> +                          |<--------------------------|
>> +                          |                           |
>> +                          |                           |
>> +                          |          DONE             |
>> +                          |-------------------------->|
>> +                          |                           |
>> +                          |                           |
>> +                          |         DONE_RESP         |
>> +                          |(mode = IMAGE_TX_COMPLETE) |
>> +                          |<--------------------------|
>> +                          |                           |
>> +
>> +The packet flow is as follows :
>> +
> s/as follows :/as follows:/
> in 2 places.
ACK. will correct in next version.
>> +1. The target sends the hello packet to the host to initiate the protocol
>> +   with the mode set to image transfer pending.
