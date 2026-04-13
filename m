Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A4F3ACEF2
	for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 09:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071131; cv=none; b=U/ZP/zNoNeIoxP18Jg0hWz8QGwkoQm58CWAUr0pm91tCMzLoWvRPqiKfN6c4odukGu1SgFgWsSwqOQMgSj7SqZunwZrCCO8n7E9/+61nTulyyHFyMeG9TsX63IPHFZsbRKqCnAhkvvwHriwHQkg2ypp/4eyz8WeOQM3ToGYPMlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071131; c=relaxed/simple;
	bh=XUSWjMqY1TcVj/lT9b3VTx7DlNhLHwV3UnSmPKiLVH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b8qO1JEWe6XvBx1iNbU4AyplmeFHBjMuggSuOlxNZQNrWYpS4bUOjSDAq9qEzKknHZ/uJiegdFWHsYfYwaFjQePEQJhWzAhJRWkTzOaH+h3V4RvjFLjcceutFy1vYr0LLFc8+4cOlXEow+lGSDzshaJOlAWk7lFN4+Lhgd67VZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ncBPZl42; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KKZod9xH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ncBPZl42";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KKZod9xH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7QdTW025269
	for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 09:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X5iNUwt3gQbVraQOHa8N/Wm3vJZe0sjOtQUigB7egSg=; b=ncBPZl42vKT0s68i
	YjZ2sTRDO+TtXN2sVm07lZYm+vdcxWR8JTayAgAtKS46DeK0k1NZuyOzT8j0Yljs
	J0Z87KhGON0fVjyWpfDLyiNrTZ/50vJTpC4CWa64U8NzqZK6jbjmROZyxbzV+53Y
	nV5HUrQLiK73lWGhSTWWTZDD1f7p0I5f9Dr6HLT4F7Cfm5Vjxqrrw/Q+wRVXCeNo
	YImpEQIX6DUbDAG71sMqROrYnUnlhwxsomWhIah7w2NaEtahAJg8iHrebk2WhmRO
	qGhfpZAl9RWzoWREmyhUj8/8+WclYO3XxU9pi8EqUy3Ft+iBhdJqbG4Aoy0bFg2z
	oXUqpw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfewkvmrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 09:05:29 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c792e2169adso561790a12.2
        for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 02:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776071128; x=1776675928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X5iNUwt3gQbVraQOHa8N/Wm3vJZe0sjOtQUigB7egSg=;
        b=KKZod9xHtaTYssWf5CSGR1ZCNiA8f7bimhqBDW4M3yODNlPuO+pCkwbSzpa92nif7y
         jOmJClaVjNHbHL+3PU+6NRImg1Fx8qL90bS1Ue4rj/q5f6Z4CDitpOxxV+8MjA24C/UT
         ETDel7pVb+ZKe/ATFqPaspJov54JXTnUz+CpZVCClY+HckQ6m03fDUMh9H1IJl5a90uV
         9TIV+n+tXq6mjgp+fvlDNzW0CDgJ3TR8MhuqRPSrVIlnAfs0haAKTrDbwdt5BO8h8Mbs
         S4Lo0zXmY78kEnsxshVFpcwZPi+212wFqHnTtTnlPEA9+LYiMKM1tDP1v2M34kC2vC5b
         ylWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776071128; x=1776675928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X5iNUwt3gQbVraQOHa8N/Wm3vJZe0sjOtQUigB7egSg=;
        b=ICOMIZUiNg33UGkJ+Cuo69+66KS+aZVBS5LzeSr5ursn5yZBzPRKX8o12WFlWOpYkU
         0gvbj5vpCmRazDehb1V0uuKsIr7vcZHK0EI0VJ19PP9wjEgxjKgU6iB2MmmkdtNLRsoG
         7l+plE1ngUnuysbpG8fH/g5bsncDdXiGLV+V+KeHppeZVGtrq2xM/OwwDWPpNrllzRDe
         HwoC/2KwNXkwaOxNFvzv1RUr5izs8ISJAiSGAkPcTnkRFvIWmVXF3jRYHcFLc6PjRS17
         pxF1muJwN/4V8FmQllRxyxm4uS4PpCFcyrqx+OSqJQGr8OxjEbKETniHhnnyKHgd8hgq
         jdew==
X-Gm-Message-State: AOJu0Yyn7bXyWI3Aw5UkbZ7dPzbpNth2C2IUJQ9GJSYimOJ1c1+ziFgE
	j1hO9gW/BRtDglWjokhD7nswhi/Zg1vTRPaHzVIcApoYMjlS773P+896lgR07Dh4+39ctJeShkT
	yF1S11559aKZabTH+Lff7alLjXjeB+H0U8M5kgU1vTcmGTBYH0qkAtieKMyLSmhk=
X-Gm-Gg: AeBDieuAf1kpF2qNK2HKmBDU02hdVsE17AsNTzi/5JbZF0qhE3pvO6cx5KxVs9Nc4B0
	Tel6Llxd52MbZnkdc9ksm2GQDHXblvYkaHrdpIssh+1aVEu77pIxTTEhbERj7F3WDjCQQaXXd9e
	nWprxytAykwa3d3ZpXVDflLO433ZT0CKWTY3yNK9pDcQUI0mHXE+esfwiCs+rykxzPlnQy7Eb1M
	kCc9Rgt5mG0G+rC2quSlBBisdfxRHsJx7hRO9sF1tUQRJU8e1q4JAVJYJVkxGgAMeqkftJ3souz
	xDAOPgU7rTmQFR9B6tq0I7aXhdgENmv6nnzTfq7MQHj8r6Op2m37TnM9vudLmMDUx2yHd19HYqG
	pJOCo5V9LXsBRVT4S+pHeHs6bAO3uUptLnf1NOKYXaFa1g1ubva6+NSk=
X-Received: by 2002:a05:6a20:3953:b0:398:7eea:50a0 with SMTP id adf61e73a8af0-39fe3da99c8mr14281955637.18.1776071127937;
        Mon, 13 Apr 2026 02:05:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:3953:b0:398:7eea:50a0 with SMTP id adf61e73a8af0-39fe3da99c8mr14281886637.18.1776071127179;
        Mon, 13 Apr 2026 02:05:27 -0700 (PDT)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79218fc7e7sm9366906a12.10.2026.04.13.02.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 02:05:26 -0700 (PDT)
Message-ID: <62078c92-ab6e-46ca-85b6-ff02b8b4cdf3@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 14:35:21 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/9] bus: mhi: Capture DDR training data using command
 mode
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-7-47ad79308762@oss.qualcomm.com>
 <031702af-5976-438a-841a-48e95f41eb03@oss.qualcomm.com>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <031702af-5976-438a-841a-48e95f41eb03@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bcFbluPB c=1 sm=1 tr=0 ts=69dcb1d9 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VNyJVnxpnutqXYa9aisA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4OCBTYWx0ZWRfX6yeTSsocsKlp
 3es9JvjNUWiHwwrbfva/Mal9uh5G+B5iV+l7HL/IwyurWgCDjKUCjDE1ueET4W1TGtt/WcJyF4e
 8jqVZd88T4l1Sc/5xzy4ZHvfTqqkKvl5nJhl65hRHWOoxfJ9xoxIPft8BSyw6qJAh/vRgB2cj63
 69Ok4i5/KX/PwSR/Svl1A8ccGyegu3b9hqdtGxsWkcWPF9T2SeRaQMrXKJhcKmfVCf0eB7DYijA
 SugYdTS/OTmKtynk6mg0PJS8ljsr4YmhdndkqbTD4+2ivF3xzbhJflNUe6j8Ja+JmSZ6JUV4xoR
 LZi3t9PFNXTn6RzbM8UVi66RRdMiW9wKdQkg9h2fXXtPrRgvphCnLvK1eLg7COiJP65cg913mOB
 yaPLyYZHij4rA0jjdq1/Few63rmfcFQ5+YuMv00ysCMxvh4241lyxX2lvhPQ4uUZTfl4F0wqQfj
 gPXX1zFFJgoaR68qFiQ==
X-Proofpoint-ORIG-GUID: oy8n6fbYXMgvVLcECfgI-hJ8eA_qVIG4
X-Proofpoint-GUID: oy8n6fbYXMgvVLcECfgI-hJ8eA_qVIG4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130088


On 4/10/2026 2:57 AM, Jeff Hugo wrote:
> On 3/19/2026 12:31 AM, Kishore Batta wrote:
>> During early boot, devices may perform DDR training and produce training
>> data that can be reused on subsequent boots to reduce initialization
>> time. The sahara protocol provides a command mode flow to transfer this
>
> Sahara

ACK. Will correct it.
>
>> training data to the host, but the driver currently does not handle
>> command mode and drops the training payload.
>>
>> Add Sahara command mode support to retrieve DDR training data from the
>> device. When the device enters command mode and sends CMD_READY, query
>> the support command list and request DDR training data using EXECUTE and
>> EXECUTE_DATA. Allocate receive buffers based on the reported response
>> size and copy the raw payload directly from the MHI DL completion
>> callback.
>>
>> Store the captured training data in controller-scoped memory using 
>> devres,
>> so it remains available after sahara channel teardown. Also distinguish
>
> Sahara

ACK. Will correct it.
>
>> raw payload completion from control packets in the DL callback, avoiding
>> misinterpretation of training data as protocol messages, and requeue
>> the RX buffer after switching back to IMAGE_TX_PENDING to allow the
>> boot flow to continue.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/sahara/sahara.c | 328 
>> +++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 320 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/sahara/sahara.c 
>> b/drivers/bus/mhi/sahara/sahara.c
>> index 
>> 0a0f578aaa47ab2c4ca0765666b392fb9936ddd5..c88f1220199ac4373d3552167870c19a0d5f23b9 
>> 100644
>> --- a/drivers/bus/mhi/sahara/sahara.c
>> +++ b/drivers/bus/mhi/sahara/sahara.c
>> @@ -5,11 +5,14 @@
>>    */
>>     #include <linux/devcoredump.h>
>> +#include <linux/device.h>
>> +#include <linux/device/devres.h>
>>   #include <linux/firmware.h>
>>   #include <linux/limits.h>
>>   #include <linux/mhi.h>
>>   #include <linux/minmax.h>
>>   #include <linux/mod_devicetable.h>
>> +#include <linux/mutex.h>
>>   #include <linux/overflow.h>
>>   #include <linux/sahara.h>
>>   #include <linux/types.h>
>> @@ -60,8 +63,16 @@
>>   #define SAHARA_RESET_LENGTH        0x8
>>   #define SAHARA_MEM_DEBUG64_LENGTH    0x18
>>   #define SAHARA_MEM_READ64_LENGTH    0x18
>> -
>> +#define SAHARA_COMMAND_READY_LENGTH    0x8
>> +#define SAHARA_COMMAND_EXEC_RESP_LENGTH    0x10
>> +#define SAHARA_COMMAND_EXECUTE_LENGTH    0xc
>> +#define SAHARA_COMMAND_EXEC_DATA_LENGTH    0xc
>> +#define SAHARA_SWITCH_MODE_LENGTH    0xc
>> +
>> +#define SAHARA_EXEC_CMD_GET_COMMAND_ID_LIST    0x8
>> +#define SAHARA_EXEC_CMD_GET_TRAINING_DATA    0x9
>>   #define SAHARA_DDR_TRAINING_IMG_ID    34
>
> Why is the indentation of this line messed up?

ACK. Will correct it.
>
>> +#define SAHARA_NUM_CMD_BUF SAHARA_NUM_TX_BUF
>>     struct sahara_packet {
>>       __le32 cmd;
>> @@ -97,6 +108,19 @@ struct sahara_packet {
>>               __le64 memory_address;
>>               __le64 memory_length;
>>           } memory_read64;
>> +        struct {
>> +            __le32 client_command;
>> +        } command_execute;
>> +        struct {
>> +            __le32 client_command;
>> +            __le32 response_length;
>> +        } command_execute_resp;
>> +        struct {
>> +            __le32 client_command;
>> +        } command_exec_data;
>> +        struct {
>> +            __le32 mode;
>> +        } mode_switch;
>>       };
>>   };
>>   @@ -163,6 +187,7 @@ struct sahara_context {
>>       struct work_struct        fw_work;
>>       struct work_struct        dump_work;
>>       struct work_struct        read_data_work;
>> +    struct work_struct        cmd_work;
>>       struct mhi_device        *mhi_dev;
>>       const char * const        *image_table;
>>       u32                table_size;
>> @@ -183,6 +208,24 @@ struct sahara_context {
>>       bool                is_mem_dump_mode;
>>       bool                non_streaming;
>>       const char            *fw_folder;
>> +    bool                is_cmd_mode;
>> +    bool                receiving_trng_data;
>
> You already spell out "receiving", spell out "training".  I don't 
> recall seeing "trng" before so it seems like a really uncommon shortform.


ACK. Will correct it.

>
>> +    size_t                trng_size;
>> +    size_t                trng_rcvd;
>> +    u32                trng_nbuf;
>> +    char                *cmd_buff[SAHARA_NUM_CMD_BUF];
>> +};
