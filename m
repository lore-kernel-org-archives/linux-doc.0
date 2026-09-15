Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB143438493
	for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 05:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789449178; cv=none; b=Hm89TaOZYOZi78rdZqFYyc6cxakO6mi5br7ZPsIW/3K7QB4ZHb9jUZWXJZBmiSeWEn7ofe7uCqSnyra7zx0q+yhA+D/erC6zMuDyysZaYdjP8IgNnSQOEaM4Ekycio3EN9UBDo+BmPbQ/TMqxyluzNn4KQe6HENnS7bnQvUHAqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789449178; c=relaxed/simple;
	bh=HR0XZdX2D2u0KtgeE0YOCG/CJ6cueEc3ds4iCmzG/eo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dcFtJZWVamQBNAye0SM0fgaW66XxD+JYsOd4NVJKks+0+0PNzCZJUCIJG0ZrudYtJJj3Yd6PZx2GfayhuUceRDNxEOQWwuTQt3ABQCJcEsooE2WtwqgRvRqti+5yc9Saz39PhVwyCLYN4RoYhoOkNYwGXF3wqTCVBrO76tEo3mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xrc8YUBF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DFc6kfv+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xrc8YUBF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DFc6kfv+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F4uZ4a3830041
	for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 05:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IaKMq2iEgH112+MNMunDFqRICOBIUCOg2em55rtMQMU=; b=Xrc8YUBFaFOaEj4t
	eaSSluzyDy4Kjc/R0pTBTIurYcdivL3+qYhjfqgvcdnL7iSQVsCooUvpEP6yQCMp
	5arVoy0Sg4B357ZP0uaYorQbwZqI9DJylO/Af0xxxQ6OJ5j46ot8HG+LkrVZaWKF
	87uSe84azaKe+At9VdKwcrvW71XHhW1SDjKW9uwNvCg/3h7ZFkXfXf5ZQxIr2XA0
	5ZFuogG5/nF4KoknYIV7F2MQ3jOMte292TQkoTPRsKbzR59TkjQy5VXR9dKvb7ef
	uzauQVo/++BcC8rTCpE+IlowMtxlA9qg30IapXBK1VuWBDmFu5zJJJA+ibCZ9hvc
	AfVAvw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyea01wp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 05:12:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39e087a18deso247562a91.0
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 22:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789449175; x=1790053975; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IaKMq2iEgH112+MNMunDFqRICOBIUCOg2em55rtMQMU=;
        b=DFc6kfv+LiWEDndAICsPnQmXFsvSAXQ4zZZRR8YLBumEjRa0K/JWQ3YTzAzwQ17MIu
         DC4TodBNIZlHId0aKJSYaSsrDVxhn/zqpGrvIWQt95AMpgjosVDOhA/vn3CIrE7dA0lY
         q3/RjrHI9GaGU9/3qoH7JX4WhJnC8c6c4e2uM+BNZuPMMv/FJQYXCgWi56kQzPExrlBu
         lMS+4Dd0h7w6JPCZuUt/rz+7fBN3Ea7lp+tlUwp4wFbudQs601I2jUd7nRNS79UcMoqv
         K3IANnq7V8AaYM4FVfLNA/4sDDg2ul2r5YBJwNOTJMrXvJNmCgZLR0m73gzyyhTqgVA0
         csiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789449175; x=1790053975;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IaKMq2iEgH112+MNMunDFqRICOBIUCOg2em55rtMQMU=;
        b=M2RpNd+LVvXvDXP8LekmTvRqZ5aWKBUoLTJCD1bwx+BNRK+hVG1qwfbpKSU+0yOMwt
         Of+2pEypgX3l5cBSypRBbBN4tjNePLipdD19f/YqdUTDyRz88o/mzXbv+FmEiDfMNH/C
         fpDmylhVNVEROy9cwOZj5Gm/teRmkmOBZfr5ThSVypHqcONhsQ5YsjadsWJz/897Hm0g
         HxEQouixLTr9Qn2pb6nVPn7hrdQ59acCeoGAKqq9AF3UMwUmM3hWf3W5Sgo95p1tk2L2
         Z5NSa5Eg34vGcbwv3AOqkh1FJPJzgwmTk1pEjzf4lNZy+4VurhegaBf/1pNVyG7lTEf3
         gY5A==
X-Forwarded-Encrypted: i=1; AKwUvBxThNTxfI3jTZYD7GOzFeC6FKUHTqjseDIVaHa04VfB4ovEZEnG6cDWxClC3uHBgZOZj+kVV8QCSNo=@vger.kernel.org
X-Gm-Message-State: AFuF++mRwCS/6DMdWvAtqW6tYCxUYwFO9u2wuAPjLS/3sN4sizlYwRAC
	mn+NOb0IwW+DYDGhx1/IwjDL5mdVfZvHIs6W7eAvrXvF53uXcZ9UK/ct0Wr6ISiBBgDdCxUHh+e
	5yHYGOWZ3+oxJqdatqMGeusoaQdnl4IucIJEFPfFm89o/J3D6k1la0DgWn8F1X+U=
X-Gm-Gg: AYBFou3J1zJVQn975zgKfdDYBLk5S6FCHKPyy08KH21zdYkLUkKh8KB9lsfZI1fg/gW
	K/hP2/fRn0g88AnFIcXk6k3roX5yN8OcymSk5nX0uxDScfUJnv43Z+PDnoYyzgbvTs0k1V1Adys
	tphQ1UnOPaSnOqHPW+ygW6gP4+KFhy7BWV+fb8koNlctDhET/2ttuztQo9AWvvynLD4XXitp3ZD
	0eQ1ZxGA52+8h8TO4uoRQj7QwwtLZoI8t24Xo/iVdl/dxeh0x9WmcDqRFn/c2suD03g9acpRxk0
	Q2T3vDwfQfYQySVJhyTOYmoGnbU/nK/DFTnZGbnHayjOzubqmYeskYSees6PVZC4TPJV96c/I6w
	XsyNCWCr/C2e/X6GPn6koiKAWQlI=
X-Received: by 2002:a17:90b:4b10:b0:39b:92bb:9eef with SMTP id 98e67ed59e1d1-39dec0f738cmr10877535a91.22.1789449174877;
        Mon, 14 Sep 2026 22:12:54 -0700 (PDT)
X-Received: by 2002:a17:90b:4b10:b0:39b:92bb:9eef with SMTP id 98e67ed59e1d1-39dec0f738cmr10877396a91.22.1789449173407;
        Mon, 14 Sep 2026 22:12:53 -0700 (PDT)
Received: from [10.218.7.127] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1438d1381c2sm3755853c88.10.2026.09.14.22.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 22:12:47 -0700 (PDT)
Message-ID: <90fcc9ff-4ba6-4e16-a322-17ad8e4a51e7@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:42:39 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] PCI: epf-mhi: Add batched DMA read support
To: Manivannan Sadhasivam <mani@kernel.org>, Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, dmaengine@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260803-dma_multi_sg-v2-0-c12bb05e42d6@oss.qualcomm.com>
 <20260803-dma_multi_sg-v2-4-c12bb05e42d6@oss.qualcomm.com>
 <anTARsISvCPUA9_v@SMW015318>
 <szx7jctqp4h6yhgvhwmiqfjtsemwlu3iardtntp4nfc22u3bfi@ux5ioixmfdnh>
Content-Language: en-US
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
In-Reply-To: <szx7jctqp4h6yhgvhwmiqfjtsemwlu3iardtntp4nfc22u3bfi@ux5ioixmfdnh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UN2uX-le0ej5MuDmQuVzbqiruyqWWvJs
X-Authority-Analysis: v=2.4 cv=cehHPXDM c=1 sm=1 tr=0 ts=6aa8d3d7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Z1hDqqN1xTHES3mYk24A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: UN2uX-le0ej5MuDmQuVzbqiruyqWWvJs
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA3MSBTYWx0ZWRfXzPnxOgzk0zz7
 pqbWb1hR5aVKKj2KX1Ueb+Jd/okZVrNGXxMTCwOVUm7aYna6Jmj+qQeXac+V1UNlysGeOFi24JX
 RQyhmWseZJtqjbikZBFC/BGBAUZymjo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA3MSBTYWx0ZWRfX7bF09qsWQS0s
 HADf0CiDD1NotxinbtwkdyLjwTKvK7hyxlxAiBR/gI8XYB58YTcA4rsMn5UscDJNrM9WT2CvcrH
 biYtp/+b14WcBOlsSk3Af5xBbSTxgnb+hoDYgf7SsGCBa6dxVJjsMFg4r5H7rL/4GT+YHd7IUTZ
 ijf4SiP2nJ19bR26pjJ/KY22zToPu6n+ADuv38IPrEpjRN+flvmRye2Or40xLDH8LJ8SdAkoPo7
 xjEjn3vlu4RSNlmUdZk54m1sEoD8lZrPMMCRhdXav1Fe1vDm9LAYudeUfE4UdGItwpa+/CXUtR7
 bJwYfSpIxQPojQ307huFrKlnVi46JbPLVI4oT6XvM7jtn/bndyUOaY78E1+l8bD1Sx3Cu+WZRti
 FDzcNegiWwVw8V6wb+D0Xit8BSPJf8yaEoACNvyyhotF46JWZimy90ub5o+5ZZhT/dEiU9nHviA
 UtqcUu1V40d4lHCz4bA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_01,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150071



On 8/14/2026 8:22 PM, Manivannan Sadhasivam wrote:
> On Thu, Aug 06, 2026 at 12:11:34PM -0500, Frank Li wrote:
>
> [...]
>
>>> +       config.direction = DMA_DEV_TO_MEM;
>>> +       ret = dmaengine_slave_config(chan, &config);
>>> +       if (ret) {
>>> +               dev_err(dev, "Failed to configure DMA channel for %u-buffer batch read: %d\n",
>>> +                       num_buffers, ret);
>>> +               goto err_unmap;
>>> +       }
>>> +
>>> +       desc = dmaengine_prep_dma_sg(chan, dst_sg, num_buffers,
>>> +                                    src_sg, num_buffers,
>>> +                                    DMA_CTRL_ACK | DMA_PREP_INTERRUPT);
>> Although both side memory address, but as previous discussion, which is not
>> memcpy, still memory to IO space transfer.
>>
> I agree, it is peripheral DMA nevertheless.
>
>> Maybe enhence device_prep_peripheral_dma_vec(). Actually eDMA still split
>> it to small trunk and linked together.
>>
> By enhance you mean keeping the semantics of device_prep_peripheral_dma_vec()
> API? I don't know how it helps because we would most likely end up with two
> vector arguments and duplicating scatter-gather lists.
Frank can you comment on this.
> - Mani
>

