Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622B61B85F8
	for <linux-doc@vger.kernel.org>; Fri, 11 Jul 2025 05:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752210366; cv=none; b=bFRDYOKrWRVwOU/Jguv2aaHe3tJK1r/1hB1ec1yF9XUj3pjmi32Inh5go7tW8BLp57qLVxM0z38Xr/SHaKW3ZGzO3RUWej1DuAwaoadA8pxIdwbnC/RunbB6dhKqZ7yqNlgA2V7twxQ9EM1fWoJ9hzh1XpLYP2aNoW24TaipeRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752210366; c=relaxed/simple;
	bh=ZiQ3Fv8gmz6RId3auba0EbdkWD4thp4jNvTHfKbkpmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qsn3s/nn40kXud+5eYKhrfKwOle1fXzysuWQHnQE74Ih+i7Xl9/iTWe4ZjlNQto+npuD5hjVdkAGDWgSM4qL5CY2i19SHIQXh8GxoKM7ZjtUnnMbnSAKWKIr7CFGf3l/t9kvcCJhGTxnIC1B3u2Dr+6E6X+SvA23hmlyyYNh7cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B9xo24QQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B9xo24QQ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1X65C016280
	for <linux-doc@vger.kernel.org>; Fri, 11 Jul 2025 05:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ON4p5KKmBIR3FGHX5880lk4pL/vyxFoXHm7nsMOOrHc=; b=B9xo24QQrEIy7vY7
	2H/4mBPA3lz09M1dFW1fwOCkLhQfAW7ZCNoO5BPE83/2joulY+bKdcmmx1buzB4N
	DJ/k0jMO4qVOPlg9gxsmsShYUDwx4+Tkh5hVzS+GqIQA6tnG6jwrpqRQiwm6b9RS
	XPBK0WcYvjRKsCFErTQqZ8xDU9gfETVVz772t9enoch6qBI1PW/ivByxjkm8ZNhE
	V0l/K9PWd8NBcsTNpnzDVg2pVE4TydTdDmZEskeyhotPZmCkHAhrBUl8EulOipbr
	2hFqH7AF6YTK/z5hJYO5lxELm+g7qlasIirEqu+f1a1xEQdDlh6mI8QGPKeqqOBC
	j50esQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47t83u3n2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 11 Jul 2025 05:05:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2356ce55d33so25652175ad.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Jul 2025 22:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752210356; x=1752815156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ON4p5KKmBIR3FGHX5880lk4pL/vyxFoXHm7nsMOOrHc=;
        b=wi0epBFDS+ERIPJ/5lJzVwWEK3eUC2sOiNF3GjOpT5QXDGHTnV60EfRRG+aIIODSP2
         jMzVgcfWR9GCqsX7m2drnxnOiQ5ailSqxmATKmukETXGPid/Y4sVF2DrneT6b/FiBICo
         08mBUBgD633F1jPRFnOzj9cm5iciHYSo0mOzARfi52wL1JSxlV6uvAgf3S9HDRRtUKqR
         dmnfWlvIzWOiv2qVR1VD5erlr+3/t0OQroAaYOPWVWwFqPLdVqSsy79MmPcVnnF1YbVC
         NuJniMHcAIN1EvHoaExZdPAIkOvAXYd4jJNzxqobVMYywV4DZSuwXN1c96kgcqA1rSa8
         Tf5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjQBProBjm0VWZnkne9cbj28m5Z3BtWJhKfk15cfREqxR6zuVUSiTJAEPZ5Lu7ljJjnn2S3glNo0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNJd0WEDlVvFr4Y9WUuPVzkQuxFsHit00SEkfFKVFnvMxJ/oal
	434lcrg4v7oLlIP+L+WUPrpphPQjkNsnN4nclH5h+hEaB/tVxfzKf+h4QxuWkqz0MC57Th/TkCE
	66zKJ7vuwdF/lY1S3H70YGCf4CsvPi43u7uoDTZcWjyyMySGT2aBcyapHRfVb0g==
X-Gm-Gg: ASbGnctMuYPu6aw21mr8N1DSs0jW6q5fyXSdF2KItkD88Bami1UXsoFPbjKtoc+qA0v
	TEJ/MjvCOIG+tfbLa0HGyHl9u7qJkxzZpasDPOUn5rrjaLtKHc3YhjqsevfJzcWHNP4gNVTzQ1W
	/jHbEH2TU3zErbYGfF0hK3oFXnGKcvzoD6Dr9TpmiatwnJLM3JYFNib9tWRFgDzXThZvZNAZKBr
	YfzAev4WgpjE/lFTd6vjKEqUMJo7NLI8TqDj8+YULb1t551lGsWLhkeEnn3noPcjEvbFd//4MqK
	BEWHCUE3WrNmJ01xYDTZMn5nn0CqyP/51klg1sTCc+6zPrz1NgCmpxVdV3ZhqA05xF0afhSQM0h
	zu0G4ZMjBNwnc30Z7XkoUja88q2QqKtHIjyv1lQ==
X-Received: by 2002:a17:902:e54a:b0:234:8a16:d62b with SMTP id d9443c01a7336-23dede38615mr28066635ad.12.1752210356346;
        Thu, 10 Jul 2025 22:05:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGc9IdZCzOQJSKnApzYY4Ey9QwM3RLDd7RZBRwcYVcIK2ljlo/TA59XUzUEdTJNZzy9kf6SxQ==
X-Received: by 2002:a17:902:e54a:b0:234:8a16:d62b with SMTP id d9443c01a7336-23dede38615mr28066255ad.12.1752210355851;
        Thu, 10 Jul 2025 22:05:55 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de432289bsm37082315ad.118.2025.07.10.22.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 22:05:55 -0700 (PDT)
Message-ID: <ad88258e-dc44-4b82-b49c-e327609ab774@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 15:05:46 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/12] Documentation: tee: Add Qualcomm TEE driver
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org
References: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
 <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-12-024e3221b0b9@oss.qualcomm.com>
 <aGu7boxOTB3TFRNU@sumit-X1>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <aGu7boxOTB3TFRNU@sumit-X1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: neRGqdkvvWAR7Y-tyVexCWuoc9fJ2aPf
X-Authority-Analysis: v=2.4 cv=OotPyz/t c=1 sm=1 tr=0 ts=68709bb5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=VwQbUJbxAAAA:8 a=XIjxTgID6P44-LRwrwcA:9 a=QEXdDO2ut3YA:10 a=M0EVDjxxv-UA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDAzMyBTYWx0ZWRfX9MfVz4zAy42a
 YV9u48Of9B30i4ViZwgVwSOMb9c9IGO1awba58KePlHJ69gOgKmcA5hKrf+joa48OTHDWc4NyAX
 OC4jP899P75+kvs2/NBlunUuPj6LfXv8xKyatDnQ7zyCleHU8d76PcxaX5oJJuSjGCkIg32MTT2
 YKnE1fwZt1/KBR/mxgZLmpvcg1LAU2uZepEyaIyIPHXerTvk4fuN7AJ3qhGsaYY1ERj2kctvoX9
 VgCkqj6/erZB+Mwq9EUGQzl8qNFLQRDAvkkoEAkotOeECxxbJ7cMYZF4CLt5yJ+nUpQ8tFaeg8F
 kQ36vKFN9D4/06L6pvA+VgtpNIFMOOmmU56aIiHDKXMNfEr1Oqz1abT+Tts9zleaeSkGQdN0jE6
 MYADGYElicH1kUnxyqP3WLCSx/iAoagJlpwi4lG8jNlm2coqr6KW7EAin5UL33rBHrVEnFQj
X-Proofpoint-GUID: neRGqdkvvWAR7Y-tyVexCWuoc9fJ2aPf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1015 suspectscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110033

Hi Sumit,

On 7/7/2025 10:19 PM, Sumit Garg wrote:
> On Mon, May 26, 2025 at 11:56:57PM -0700, Amirreza Zarrabi wrote:
>> Add documentation for the Qualcomm TEE driver.
>>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
>>  Documentation/tee/index.rst |   1 +
>>  Documentation/tee/qtee.rst  | 150 ++++++++++++++++++++++++++++++++++++++++++++
>>  MAINTAINERS                 |   1 +
>>  3 files changed, 152 insertions(+)
>>
>> diff --git a/Documentation/tee/index.rst b/Documentation/tee/index.rst
>> index 4be6e69d7837..62afb7ee9b52 100644
>> --- a/Documentation/tee/index.rst
>> +++ b/Documentation/tee/index.rst
>> @@ -11,6 +11,7 @@ TEE Subsystem
>>     op-tee
>>     amd-tee
>>     ts-tee
>> +   qtee
>>  
>>  .. only::  subproject and html
>>  
>> diff --git a/Documentation/tee/qtee.rst b/Documentation/tee/qtee.rst
>> new file mode 100644
>> index 000000000000..8ae4da17c3a7
>> --- /dev/null
>> +++ b/Documentation/tee/qtee.rst
>> @@ -0,0 +1,150 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +=============================================
>> +QTEE (Qualcomm Trusted Execution Environment)
>> +=============================================
>> +
>> +The QTEE driver handles communication with Qualcomm TEE [1].
>> +
>> +The lowest level of communication with QTEE builds on the ARM SMC Calling
>> +Convention (SMCCC) [2], which is the foundation for QTEE's Secure Channel
>> +Manager (SCM) [3] used internally by the driver [4].
>> +
>> +In a QTEE-based system, services are represented as objects with a series of
>> +operations that can be called to produce results, including other objects.
>> +
>> +When an object is hosted within QTEE, executing its operations is referred
>> +to as direct invocation. QTEE can invoke objects hosted in the kernel or
>> +userspace using a method known as callback requests.
>> +
>> +The SCM provides two functions for direct invocation and callback request:
>> +
>> +- QCOM_SCM_SMCINVOKE_INVOKE for direct invocation. It can return either
>> +  a result or a callback request.
>> +- QCOM_SCM_SMCINVOKE_CB_RSP submits a response for a previous callback request.
>> +
>> +The QTEE Transport Message [5] is stacked on top of the SCM driver functions.
>> +
>> +A message consists of two buffers shared with QTEE: inbound and outbound
>> +buffers. The inbound buffer is used for direct invocation, and the outbound
>> +buffer is used to make callback requests. This picture shows the contents of
>> +a QTEE transport message::
>> +
>> +                                      +---------------------+
>> +                                      |                     v
>> +    +-----------------+-------+-------+------+--------------------------+
>> +    | qcomtee_msg_    |object | buffer       |                          |
>> +    |  object_invoke  |  id   | offset, size |                          | (inbound buffer)
>> +    +-----------------+-------+--------------+--------------------------+
>> +    <---- header -----><---- arguments ------><- in/out buffer payload ->
>> +
>> +                                      +-----------+
>> +                                      |           v
>> +    +-----------------+-------+-------+------+----------------------+
>> +    | qcomtee_msg_    |object | buffer       |                      |
>> +    |  callback       |  id   | offset, size |                      | (outbound buffer)
>> +    +-----------------+-------+--------------+----------------------+
>> +
>> +Each buffer is started with a header and array of arguments.
>> +
>> +QTEE Transport Message supports four types of arguments:
>> +
>> +- Input Object (IO) is an object parameter to the current invocation
>> +  or callback request.
>> +- Output Object (OO) is an object parameter from the current invocation
>> +  or callback request.
>> +- Input Buffer (IB) is (offset, size) pair to the inbound or outbound region
>> +  to store parameter to the current invocation or callback request.
>> +- Output Buffer (OB) is (offset, size) pair to the inbound or outbound region
>> +  to store parameter from the current invocation or callback request.
>> +
>> +The QTEE driver provides the qcomtee_object, which represents an object within
>> +both QTEE and the kernel. To access any service in QTEE, a client needs to
>> +invoke an instance of this object. Any structure intended to represent a service
>> +for export to QTEE should include an instance of qcomtee_object::
>> +
>> +	struct driver_service {
>> +		struct qcomtee_object object;
>> +		...
>> +	};
>> +
>> +	#define to_driver_service_object(o) container_of((o), struct driver_service, object)
>> +
>> +	static int driver_service_dispatch(struct qcomtee_object *object, u32 op,
>> +					   struct qcomtee_arg *args)
>> +	{
>> +		struct driver_service *so = to_driver_service_object(object);
>> +
>> +		switch(op) {
>> +		case OBJECT_OP1:
>> +			...
>> +			break;
>> +		default:
>> +			return -EINVAL;
>> +		}
>> +	}
>> +
>> +	static void driver_service_object_release(struct si_object *object)
>> +	{
>> +		struct driver_service *so = to_driver_service_object(object);
>> +		kfree(so);
>> +	}
>> +
>> +	struct si_object_operations driver_service_ops = {
>> +		.release = driver_service_object_release;
>> +		.dispatch = driver_service_dispatch;
>> +	};
>> +
>> +	void service_init(void)
>> +	{
>> +		struct driver_service *so = kzalloc(sizeof(*so), GFP_KERNEL);
>> +
>> +		/* Initialize so->object as a callback object. */
>> +		qcomtee_object_user_init(&so->object, QCOMTEE_OBJECT_TYPE_CB_OBJECT,
>> +					 &driver_service_ops, "driver_service_object");
>> +
>> +		/* Invoke a QTEE object and pass/register 'so->object' with QTEE. */
>> +		...
>> +	}
>> +	module_init(service_init);
> 
> Lets drop any reference for kernel client/services since they aren't
> supported by this patch-set yet.

Will do.

Regards,
Amir

> 
> -Sumit
> 
>> +
>> +The QTEE driver utilizes qcomtee_object to encapsulate userspace objects. When
>> +a callback request is made, it translates into calling the dispatch operation.
>> +For userspace objects, this is converted into requests accessible to callback
>> +servers and available through generic TEE API IOCTLs.
>> +
>> +Picture of the relationship between the different components in the QTEE
>> +architecture::
>> +
>> +         User space               Kernel                     Secure world
>> +         ~~~~~~~~~~               ~~~~~~                     ~~~~~~~~~~~~
>> +   +--------+   +----------+                                +--------------+
>> +   | Client |   |callback  |                                | Trusted      |
>> +   +--------+   |server    |                                | Application  |
>> +      /\        +----------+                                +--------------+
>> +      ||  +----------+ /\                                          /\
>> +      ||  |callback  | ||                                          ||
>> +      ||  |server    | ||                                          \/
>> +      ||  +----------+ ||                                   +--------------+
>> +      \/       /\      ||                                   | TEE Internal |
>> +   +-------+   ||      ||                                   | API          |
>> +   | TEE   |   ||      ||   +--------+--------+             +--------------+
>> +   | Client|   ||      ||   | TEE    | QTEE   |             | QTEE         |
>> +   | API   |   \/      \/   | subsys | driver |             | Trusted OS   |
>> +   +-------+----------------+----+-------+----+-------------+--------------+
>> +   |      Generic TEE API        |       |   QTEE MSG                      |
>> +   |      IOCTL (TEE_IOC_*)      |       |   SMCCC (QCOM_SCM_SMCINVOKE_*)  |
>> +   +-----------------------------+       +---------------------------------+
>> +
>> +References
>> +==========
>> +
>> +[1] https://docs.qualcomm.com/bundle/publicresource/topics/80-70015-11/qualcomm-trusted-execution-environment.html
>> +
>> +[2] http://infocenter.arm.com/help/topic/com.arm.doc.den0028a/index.html
>> +
>> +[3] drivers/firmware/qcom/qcom_scm.c
>> +
>> +[4] drivers/tee/qcomtee/qcom_scm.c
>> +
>> +[5] drivers/tee/qcomtee/qcomtee_msg.h
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 99fe1ae22ae0..42823d33cc03 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -20515,6 +20515,7 @@ QUALCOMM TEE (QCOMTEE) DRIVER
>>  M:	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>  L:	linux-arm-msm@vger.kernel.org
>>  S:	Maintained
>> +F:	Documentation/tee/qtee.rst
>>  F:	drivers/tee/qcomtee/
>>  F:	include/linux/firmware/qcom/qcom_tee.h
>>  
>>
>> -- 
>> 2.34.1
>>

