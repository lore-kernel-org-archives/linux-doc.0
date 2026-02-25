Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDB63D2FE5
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 14:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772029228; cv=none; b=lp9iKnA8jEZpN1lnaUe82NT7TrVMOtNUnvweWtmeWT76BNVQk/aBqERaooStBRWIcJT/2ov0HJRtoSRbxTZHkJ9AqyyHg0O1MEiUWTR94wOHXwZg/qgtolYsKSM3XB4hq1wly5h1pp7QFS7/HVuxWiCt6Gaw9Nldf4CZgpF9oQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772029228; c=relaxed/simple;
	bh=HoX+77Ou1KVRWuj52NLOpoMqo5t3Lt0ZrveaYtMn2MI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XA5GcthYaXdbxqJl8BVq2nKAkRY/vzfTkjj451UClP6iFZq5uGl1MR/x0yM6SxLG7F6fsBFMO5lPW/QmbMDy4dflV2UujIPc8DbAf34MNsfmSpxrq7KUdLGJsipeYJ1WNCvLRwnIRGVGzCOP8m42L9VtktfxoQi3hBG8IqExl7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lCLZuHlf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kY7oHhmE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lCLZuHlf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kY7oHhmE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9TAQP1579465
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 14:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EtyOE2hUVljy+kbFE5PibxyFcc/R7aXCK4PQrjUFn2o=; b=lCLZuHlf8TyAjJm3
	u3rme9fFAEMEi7u536FDPUL5nlAy5jiQp4VpF1GwY2/RJhELgyk1DwwPJRciUo9f
	G6UtslgOw5RylV8+vIzZxzMkscSgIcWthwhfKep4VCv3qiZH2jlFNOMtWoa46lcX
	6KcSkfDa2N+ZoxRrbkVfKOoXzCQaocEd0HhJDFA+sXLsHChPj9nrDPFepT1nqWVI
	IZ36rErEHBHfnY7GWhBi1tYt4FOiBTs7/fvZPcQLxGXvO1vVknuj6NlwUVlasWB5
	3wFujOQ6K2RIpoDNlYCvW7z0Q1Es0jss86QZ/6e/PluRBy/m1UvZ3r/40OqsZ3/M
	2XHL/g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg1sbftp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 14:20:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aaf2ce5d81so87051095ad.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 06:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772029226; x=1772634026; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EtyOE2hUVljy+kbFE5PibxyFcc/R7aXCK4PQrjUFn2o=;
        b=kY7oHhmEVfNKnl2Ets9P9vugOZO24QTV9ZW+gUYqGvz9rPMJQYeTDaPW8gCyQhT5oX
         kM1eciXC55RcKkfrgz5j0X8PcKzDzlc0EiV4xc21488ryLkx0xZ5sYyfN43v6Tu531Yq
         wRmK3xov5ROrDgaFVlnmGeURzJKgjSuv9/ghY6/s9/3xeTHecSGoyUnhaZ8KdC1QSJUS
         huraSwqyLHE18EPjXfzAm4JMJqYA6GOe6qd37ja9GtijGvwyuHQ4RFl2dCxh8DSLEXOR
         P8Tgv2BreMhHnnXG1KBNcvn0eUBntXMwkuRoFhT2znJ+8GczSN2UDjpoAMKH8ZRmhkbN
         vCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772029226; x=1772634026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EtyOE2hUVljy+kbFE5PibxyFcc/R7aXCK4PQrjUFn2o=;
        b=HiUtVU7GZcxBE3PXuPrNzWs2lvFMExI4OKrDN2TBNdO8r6tumJ4saSyDQIA31X6c67
         gkgLU3as8N1sH0LhGYYjQQ/VwkRddWpGcCGuR2Q/QMvL78EY1Mnfds+yVyNraplgBEcw
         olHT1hnKemZRxXV29XWVhBSxTc51hMGyVuFBdCEVNvAuoW1ZDdajBmeQotlfWpauv/YY
         5mYKySQO/+3Bnr2k1BtyYn2qGupc6yYlaoA1ni07FxlJ/jqktlBO6/98yrt0gyL10K/o
         RG7IV1GYseun2yicL2bUT3qmnejkgjHkVd4FwUn5xaeA+urRJB725PeTRK5bMxzPNeSI
         4hPA==
X-Forwarded-Encrypted: i=1; AJvYcCXKDBNrZFrlfHI33iNdvhzFUecof0kYGZ2xkSwAm/Cq3QKQM9Ax/dbF+AkXALayUmdc6e1yiWevWuM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Cv9ThSWM2+L1t9uxd3+ydnuMhSfeQJaKq4ZCE6lb8SAeB/Rt
	+zrnKcWXSgRfLWfwtevh74xDbWeOXeg2bb3ro1Dm1cqBUeJaOc38E36K+i5ZcT0kSU2NNUXAcxK
	zwW0dSvgKK2rtJG6GQF+E2auLY4sPFEN9aWx1qhHFRUSRquIb6N7qi4UpgkJEsC8=
X-Gm-Gg: ATEYQzwkg4o8icxToUDr+8F0WZ8nanFV/5Wl8suGwZlAvIl7eHG+Ta9HFCknVDfbUD+
	huAmPZpo1bmYqrPRJR1wK+3HCzzSiU28tUIYqo7lbYaKFle0S8PSfceOlllm331QXlW+TqW2Ujs
	dH1nLatYuHNJt37uK1/knhtrJHRoqTTcyOzl7C73dvL9EhPfsZDNtoRJPxiP8RNWsyZJvHxnG8d
	AywGR/5oPlG5nmPiXVSDc1TzreThwi/zptYrGoF7UaiigpuoHfGs3FvEXNTmWl+yO7X6NcUm/co
	Iayf6t+bAFreUnB59s+X7lfE71yhTOrgojqsoP3XrF8le/3s/fIO6GZx050sEHddRbVsDJORdUQ
	MxjWIoCMNzCYYrcsiNfI2INpljDaL40Hh4lSMeztsOp9XsD0qSm0=
X-Received: by 2002:a17:902:d485:b0:2a9:2ab2:e50d with SMTP id d9443c01a7336-2ade9aa21a7mr3608565ad.51.1772029226471;
        Wed, 25 Feb 2026 06:20:26 -0800 (PST)
X-Received: by 2002:a17:902:d485:b0:2a9:2ab2:e50d with SMTP id d9443c01a7336-2ade9aa21a7mr3608015ad.51.1772029225935;
        Wed, 25 Feb 2026 06:20:25 -0800 (PST)
Received: from [192.168.1.5] ([171.61.227.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f5e55dsm142051345ad.30.2026.02.25.06.20.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 06:20:25 -0800 (PST)
Message-ID: <b6519bfc-7931-4985-aaf1-1aaf1fe5aa88@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 19:50:17 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 02/18] accel/qda: Add Qualcomm DSP accelerator driver
 skeleton
To: Bjorn Andersson <andersson@kernel.org>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-2-fe46a9c1a046@oss.qualcomm.com>
 <elu44euja7d7nnnhdmdqgof76646b3m3isjmws5pr274gqhy2a@dbeq4hk74ebo>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <elu44euja7d7nnnhdmdqgof76646b3m3isjmws5pr274gqhy2a@dbeq4hk74ebo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZKvaWH7b c=1 sm=1 tr=0 ts=699f052b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=CLJ8B99oKJtQbdnoKiLypA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=tV0izz4fD985yFSgC6wA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: LIzXXSntQIS-5dA__OnOfzAX8BUdWf8P
X-Proofpoint-ORIG-GUID: LIzXXSntQIS-5dA__OnOfzAX8BUdWf8P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEzNyBTYWx0ZWRfX+ICg/mlKyudV
 mB8DSBxtDJQaraPlzIckF1yz6+eYOT8T8P1I335uELHYUwaIU2XzfUNK9S6F3pSepeKF2TwkHM4
 D/lvvcxtQ0iklnE70a1TVvYpK4fqvgGnOZt0nB+jicV0/2OiDIpyuFSxMiyrYwMAWBKk2tPUuwi
 974RivL5kB0Sd5LCKjA91J1bzysHMNmleov7Ci5Ayz06C8Fhs+cu4YSGXKwckWoLQjz918Uo2Ca
 AZjVSvZ7INkxvyyikuR5ah90CT410UvtqUzZtF1ZgEuYXjKZHlSSABRsF5I5btrVnHB014bGXYE
 /4RHGb1nU5IOOjBiYZtpKZl0g11rRGEzTINPVOaMkcEIMXGuOoJGBgrUwAZDCTu2NCLwEGQ4Hml
 HUUkUKI6HDOJLVxbuctv4WbunUF2sVePq1CFONqu9otsbDzpU0YNNbleHFHNBOWJZQM43A/+u8I
 RVIalf5MfEaK5TCybkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250137



On 2/24/2026 3:22 AM, Bjorn Andersson wrote:
> On Tue, Feb 24, 2026 at 12:38:56AM +0530, Ekansh Gupta wrote:
> [..]
>> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
>> new file mode 100644
>> index 000000000000..18b0d3fb1598
>> --- /dev/null
>> +++ b/drivers/accel/qda/qda_drv.c
>> @@ -0,0 +1,22 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> +#include <linux/module.h>
>> +#include <linux/kernel.h>
>> +
>> +static int __init qda_core_init(void)
>> +{
>> +	pr_info("QDA: driver initialization complete\n");
> This print is useless as soon as you make the driver do anything, please
> don't include developmental debug logs.
>
>
> In fact, this patch doesn't actually do anything, please squash things a
> bit to give it some meat.
>
> Regards,
> Bjorn
Ack, will squash the next commit with this one.
>
>> +	return 0;
>> +}
>> +
>> +static void __exit qda_core_exit(void)
>> +{
>> +	pr_info("QDA: driver exit complete\n");
>> +}
>> +
>> +module_init(qda_core_init);
>> +module_exit(qda_core_exit);
>> +
>> +MODULE_AUTHOR("Qualcomm AI Infra Team");
>> +MODULE_DESCRIPTION("Qualcomm DSP Accelerator Driver");
>> +MODULE_LICENSE("GPL");
>>
>> -- 
>> 2.34.1
>>
>>

