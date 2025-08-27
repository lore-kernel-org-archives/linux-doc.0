Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848A928725F
	for <linux-doc@vger.kernel.org>; Wed, 27 Aug 2025 06:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756274789; cv=none; b=hA4NuJgTLnJ8NIJTR2S/oZoy4cRuejmHRyJoa8RHLcbvHn+sfcZINqAo9CpolzwISIzZ38vSU9ocborXk0IQButz4dpIi+sFPPEGO5UFkU4f5CfLeDoGrE0yqAIl21M16layYn9ZTG+nLNFMpuXmp4anyprxAgYRY5cOyYrEtbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756274789; c=relaxed/simple;
	bh=wMGz6LtFcqKacfGBJToPMAl+pHQslhvTR58QLzr0q7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g+/1LHTLxfx5QvRn7Dt3cZgMt7yndlkvxzuBO56iIDBJB2OaNsnZRAPHiqQ6FZWqSFBSuGioIgE77Ad8YAoWv0ZwyQBoKdJd8C61UY9KJWIpWBxAkuTIvT667uY+auZzs6/qVDw5Me2DXDctUqcU5N+FjY1/kHbeaTUHkUChwVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n06+6yXW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n06+6yXW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R5Z5eR020924
	for <linux-doc@vger.kernel.org>; Wed, 27 Aug 2025 06:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IvtoMULgukZ1V1cgtQetdWBAfSoYzONqp4myym0U6ZU=; b=n06+6yXW0wU0IpKz
	/+cogiaPfyl+lmuJ7TkprUJ72V/3CKRv7h/oJxp36crzCJpUNmcMeyRp09RunAMn
	C21412ZnXj3muBeVY7sPWwXYZ+vkj9n3ZZEehipGEvQAXd7J0BY3VBxwbvuOX4qi
	6KmthjfMvu8hO4TkUwZQzP1C8fyypOa/EylDhNmDMHedafqFBS7SQj706WS/YC39
	SLkxUBa39PGF7SHrIoO/Bg9etaQjwvWUl0LcaiJM4b/BduiSIBozd/bJ3EmK61+Y
	h4FQlyPWG4avYytuEIDHAXJq33C7x91FRUn6hYgjQLMUC2475PDhbS/nq3ou/dWt
	SE9oQw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48se16tmd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 27 Aug 2025 06:06:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77053dd5eecso6590708b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 26 Aug 2025 23:06:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756274786; x=1756879586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IvtoMULgukZ1V1cgtQetdWBAfSoYzONqp4myym0U6ZU=;
        b=JsVVEQ1bWvMYzasQTSmvR+Xs+P/A7jg13XmEEIacv23XaGvE28BYypM8aPUMODWpg1
         LxibZTgKr3H+etf81lP2Im1Gg0XshEgP7Yk5TDYyz1oK9b/saVpdX0dhpDXMKmaB9lQ9
         rC3IaytEdIadGK5dOtQoE3ZgoHKTC9KYkuH2nm2KObU1nop0sVMcEUlPE5Kop1JusdEv
         XEvgOm8ECuSd9MOpw24/UKo1VfHDJ6Jf1iHCjscEltMFpH5p3yQr2FXWUIF4trNuoTqb
         UT1iOc2umcbWeNrwvVX1kkMriqfB/Nv5KpPAbI67D2UzsmlOzlo1sA8LBkwuE7CzqQuf
         kR/w==
X-Forwarded-Encrypted: i=1; AJvYcCUwamvsgdMTcj7cddrd7pmtAj6somFQbdBa6m1n1hmSX1Em3beIOt8gbQGXatHev5akzH2GMOvZosU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz72o6EDecq+1NQZTGGwqRqrpNDBBaIZSt/U+46pzNWpdv359TR
	y9Gn/wZIvRKY+9h4UiwRDUsZauenYzvXEJrNd+wZsR1TlCJDmvxrZTf245/cyJYnyY0wAFb4Gw2
	th9QHOoId64XDtEn5uWkF5mbfDtRnVNqxQ13xmjMUYeCao/Wp6HGkBjIdXRXt5Q==
X-Gm-Gg: ASbGncvDlOd3KhMh0LIhfA1kxdfh+4owcHrm0VLD9wB2kSpowectwxnu+yEfbaC2FtR
	7cy9v9vV9jI09c6OF57UZMGdo3u1IFm4p2qCF3bud0dwcoeG4pLCbuY1eWohMR/cyp6psmHyg+d
	0VDATshQ7xNCFfIKFLT7N22bG9yhOfM+llwFR7gUMQSMlhYFQ1oFJkqpfa6qhN25gJsgDaWzTuY
	t7nJJB66H8nWI0D8QFNygt/7k3I4nQ0LyF/psAf9YQbjM4HIYfF+dlh+t4se0sIWmRN9w9NC+n6
	0I06zsVFo5Hyq5Q68b7vvnab9/gwQJG4OkuvY4oSYDfGfov4oTR20tzhkCRH3UPaciDqJEQlfJL
	98lkjyEG0hGj3IQKJYuy5WJ8RypOrJQZA6fEtnw==
X-Received: by 2002:a05:6a00:340e:b0:771:ea51:690e with SMTP id d2e1a72fcca58-771ea5170d6mr9587243b3a.20.1756274785581;
        Tue, 26 Aug 2025 23:06:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjXY9tZYbdaHdBkaKUQPtpmPxg/EWHTA5baJ83nFS3+u9isarHBBJ/FYnGHhPcbEv04uBR8Q==
X-Received: by 2002:a05:6a00:340e:b0:771:ea51:690e with SMTP id d2e1a72fcca58-771ea5170d6mr9587212b3a.20.1756274785081;
        Tue, 26 Aug 2025 23:06:25 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-771ecc4454esm6208226b3a.0.2025.08.26.23.06.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 23:06:24 -0700 (PDT)
Message-ID: <265e23fb-8865-4dee-99ed-f08450975ba8@oss.qualcomm.com>
Date: Wed, 27 Aug 2025 16:06:16 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 06/11] firmware: qcom: scm: add support for object
 invocation
To: Bjorn Andersson <andersson@kernel.org>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
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
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-0-7066680f138a@oss.qualcomm.com>
 <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-6-7066680f138a@oss.qualcomm.com>
 <itpdolgmxp4ofdv3vf2ghulo7slj5wjby2tvawehihwvenbep2@ub5sdgf6gxeh>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <itpdolgmxp4ofdv3vf2ghulo7slj5wjby2tvawehihwvenbep2@ub5sdgf6gxeh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: edQNewBK5u97c25BjWhTiTYNFo_xu53P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDEyMCBTYWx0ZWRfX73c0iSGYsra1
 +KwazRWzMNMYm6hMdtXCwHmflp1/cTsRFNiQ3G2J+/lpAI4Lgezp6k6yiTa+4FJWIEnEIwup78m
 sU6Ye7916HFu9UlWVcq8dIg25u3iyTkXMsD5r7t6vNRG8zcCm2arLcxhWYAtsGrtMZzgiopdj9X
 MYwoT+Re5eHkoVX9/09/31m3WWz84gFJGoIlxmyDGy6PO3zQ23iQihy8prk+QzkEndMQ/HFFCaz
 WmCc+UnzC+IJM6jGXNadUVa7CPFuIi9KZExoup4DsvKEmZicYmQo2c+pAuWizjtQpkwkXtFY96V
 EMmS1P+m6xRiDXiVoFV1lNqKP+ZZHy2tgRj/lPAFCjM+yvXlQ/uivz2j02OBBZdeq8TIFLMfVTg
 OsjH1eVo
X-Proofpoint-ORIG-GUID: edQNewBK5u97c25BjWhTiTYNFo_xu53P
X-Authority-Analysis: v=2.4 cv=CNYqXQrD c=1 sm=1 tr=0 ts=68aea062 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=3sczFqAQEyrjP0LPqEUA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508260120

Hi Bjorn,

On 8/27/2025 1:52 AM, Bjorn Andersson wrote:
> On Wed, Aug 20, 2025 at 04:38:53PM -0700, Amirreza Zarrabi wrote:
>> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> [..]
>> +static void qcom_scm_qtee_free(void *data)
>> +{
>> +	struct platform_device *qtee_dev = data;
>> +
>> +	platform_device_unregister(qtee_dev);
>> +}
>> +
>> +static int qcom_scm_qtee_init(struct qcom_scm *scm)
>> +{
>> +	struct platform_device *qtee_dev;
>> +	u64 result, response_type;
>> +	int ret;
>> +
>> +	/*
>> +	 * Check if QTEE supports smcinvoke:
>> +	 * This will fail due to invalid buffers, but first, it checks whether
>> +	 * the call is supported in QTEE syscall handler.
>> +	 * If not supported, -EIO is returned.
>> +	 */
>> +	ret = qcom_scm_qtee_invoke_smc(0, 0, 0, 0, &result, &response_type);
>> +	if (ret == -EIO)
>> +		return -EIO;
>> +
>> +	/* Setup QTEE interface device. */
>> +	qtee_dev = platform_device_alloc("qcomtee", -1);
>> +	if (!qtee_dev)
>> +		return -ENOMEM;
>> +
>> +	qtee_dev->dev.parent = scm->dev;
>> +
>> +	ret = platform_device_add(qtee_dev);
>> +	if (ret) {
>> +		platform_device_put(qtee_dev);
>> +		return ret;
>> +	}
> 
> Wouldn't this work instead of the alloc + parent + add?
> 
> 	qtee_dev = platform_device_alloc_data(scm->dev, "qcomtee", -1, NULL, 0);
> 	if (IS_ERR(qtee_dev))
> 		return PTR_ERR(qtee_dev);
>

You are right, I'll replace it with platform_device_register_data().

>> +
>> +	return devm_add_action_or_reset(scm->dev, qcom_scm_qtee_free, qtee_dev);
>> +}
>> +
>>  /**
>>   * qcom_scm_is_available() - Checks if SCM is available
>>   */
>> @@ -2326,6 +2450,16 @@ static int qcom_scm_probe(struct platform_device *pdev)
>>  	ret = qcom_scm_qseecom_init(scm);
>>  	WARN(ret < 0, "failed to initialize qseecom: %d\n", ret);
>>  
>> +	/*
>> +	 * Initialize the QTEE object interface.
>> +	 *
>> +	 * This only represents the availability for QTEE object invocation
>> +	 * and callback support. On failure, ignore the result. Any subsystem
>> +	 * depending on it may fail if it tries to access this interface.
>> +	 */
>> +	ret = qcom_scm_qtee_init(scm);
>> +	dev_warn_probe(scm->dev, ret, "Failed to initialize qcomtee\n");
> 
> A successful boot of db410c (APQ8016) now has the following in the log:
> 
> [    0.161437] qcom_scm firmware:scm: error -EIO: Failed to initialize qcomtee
> 
> If the target doesn't implement qtee, I'd expect that you tell me that -
> or preferably stay silent.
> 
> Looking at the other error conditions, we find -ENOMEM, for which you
> should also avoid printing. In fact, I believe all other error paths of
> qcom_scm_qtee_init() will have printed an error already (if not, please
> move the error print to the place(s) where it's needed).
> 
> As you're ignoring the return value, please then also change the return
> type of the function to void.
> 
> Regards,
> Bjorn
> 

Sure, a successful QTEE boot already logs its version from TEE SS,
along with any internal error messages. Based on those logs,
it's quite clear whether this function failed or succeeded at the
beginning. I'll remove the print statements.

Regards,
Amir

>> +
>>  	return 0;
>>  }

