Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F2D3B7760
	for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 09:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160116; cv=none; b=i3mU4VOk46gUk6STLjRCIUWBWrjVfgAw8zkemp42Vg77ynmwVuS8vBUBf1yUksQM7Cefq46IT2m69TgRSWLEv+kMHzvEAq12Y4mn2r5sLAxr6Ph6qMTa++zirZGUlFHRvrUIUeRnkyr++JiShvVZKSFDYA9INmpoQnpCy0YodTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160116; c=relaxed/simple;
	bh=vNcuxiJuz7ecPTV8B29JRlMCeIInrul1jIHPLz1hujQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U8825SfbjDVvNVJipGg8uV/OdESkZLnUsEPHwsrEj9zFVVHpju/l9h3lXhZcWPfV+GEmMOxa4wLHvh4ehj3R6xMYmxZKTI7peOFVU4yvo98HSxLCscv0BKSSDSsp1ANS7ghZ0PgM6arNCWGtCDGyeiehUGjGNmRt9lYNH1tv0eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JNlqAFMo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E47ZmDlr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JNlqAFMo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E47ZmDlr"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6NTqB2633313
	for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 09:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UYgzfLrWgyd1wrni+1rtp7Hj0T1fnqOlMeY5VN5OHf8=; b=JNlqAFMoF+0jNcNz
	Xlesh46qoOkI02fuffqxc16ZpUWiwfJMmwmVaFCnORhQZPVU1+fY9ewBIOoSqTtx
	2wXuUMsD0nmTFJZ6w2F+eD3XuWTtr6+J32zC3gyzR9qx2VJqT/Ys2eFNFFdvV8od
	HqLig5nACs6Wibg3aOE1lxO9IHmbSQ29bFmESphL9wCO96LVbLj7n3m3Qur+6cOg
	2R0lA3zifLM59GKSUUqXDfBeYQtxq8hXXmSbjN2W8fuC+mPz87aAMWgYiesBiOhP
	oCRV8vh4KRYseIcLq3db+AO1MqFLQFGk+0F8dziMZYr+EKxi37nKDp2P38Oozmf+
	8+BL+A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86ca5b4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 09:48:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b465bf993cso15503325ad.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 02:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776160113; x=1776764913; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UYgzfLrWgyd1wrni+1rtp7Hj0T1fnqOlMeY5VN5OHf8=;
        b=E47ZmDlrMUgJ7nkBgKGWDXD+LcZQBcVci73bTJ8WTRj0X3KY34NLF3SG7VhC2MiBb5
         Ra46LbDVnlWrMnlJ2kMpRQc9wMvg9hfzH+vfCZvdUR4GvL8byV5d+CSt1IdmmNBl23dA
         EAS8n4UJ62L7DPy/m9RI3vh+4/pzFsqeVGlrfFcps1BZTJxMasr32R9ugbeXQjliYqz0
         wwt8FMkkILRxH9XC1F7mDvoPGmOh1/1i7xrhV/8GCxWA9mP1Pe0utUgcimRmZ0xYgL1b
         XoKfoULGUeVc6dlSnNP7tC9x0xqahY3q9t7Yg6gRfaE1bUgJQKUUPzuaG6lgLIq9pNIL
         qTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160113; x=1776764913;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UYgzfLrWgyd1wrni+1rtp7Hj0T1fnqOlMeY5VN5OHf8=;
        b=VeTJdqqMouqb9hRfAtfK59vpzHcE8Re+QIKfAdogimRv41XWpF/n4EjTT2szMrHBP/
         hiO0ywVseh9hi4w6pEShJdQ7SLRW3BW/bpUDdNe6jn1KSBD6f/RiB2zi/uX6PSCCXdGz
         MTQLdnrFF6fNCMd6So8TAla/1Jj/z219cXceeMXCvmmtZTpxiJHR6LeNcTnHS36kYExp
         v9NQn+zzz/oNAIKXI6IBk2N3sMBVAbvMTuTocoHipawU32y/Zm6O2ycm5XUGPUNnb/1/
         jaxSLSCAPBDh0r/O7mJtVSTKNbf29Kkc+EGqF1NIjE7mGgv47867Y4CLgiSlEaY+JvU8
         ZXkA==
X-Forwarded-Encrypted: i=1; AFNElJ93rRAodXqFeoxf6vUYxJmITk6Xw+LzHacwWyrMSkcnI6FSmdjbRDILxWtFgwMuZBSFpQpyR16NjEo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4LAHObDmELEGKtY+TRFOUKzDnt2DIE83Opt5QwQZ0mXr+7OZb
	RZt+jkezRtEXqlw61k0uVOR0SyDIiIuPsCUkfou7JmCfuqawB5s/zSP2XMdtz3OMua5KvJXRzdB
	XuaYEkh6yH2ipSdm7VzOe/y7m/BEtDACbPww0Retzm3RqU/7+sRyLk8++LAWXFqI=
X-Gm-Gg: AeBDiesI99l5YjkzIe65wvMOveR/WphIV9S5AFCI4EGXu0nKa/jgh+XG6WOKSitzK9o
	kyiJQO4iTnWMNjzE49QxfBtn0MiZ7Fr0dKgBdqG6PvDavbW7Cbck/P3mSce92WdrerRSE4L6Dii
	dXtRJz9I3/ppfpJsmZLAcLNfCcQa7WwU6ifltGn0LpLQGz4yzD4Kd08TgkKlP9I4ylYoLYSqKZf
	GBfNVwXpWx4OEIqBnHBqWrFw8BIW+z7VPX+7dMSg8wT58hFBcxYZvY/1//sO0h09tse+mjmO58V
	zMEQvCsL322ANGOP1Jh8yW+qeJ5vfaOGTUTdUfZ/QesVGxlR0t+tFfnteGgsxfLDIEF4vYJ89uf
	1Tlb2KBtr+0KacxzRSBoAOnG4VQkM/i5EpGF5wP1sQhF6zMBoIkTkfg==
X-Received: by 2002:a17:902:c94d:b0:2b2:5da8:14be with SMTP id d9443c01a7336-2b2d5a76e9amr168406705ad.41.1776160112231;
        Tue, 14 Apr 2026 02:48:32 -0700 (PDT)
X-Received: by 2002:a17:902:c94d:b0:2b2:5da8:14be with SMTP id d9443c01a7336-2b2d5a76e9amr168406275ad.41.1776160111703;
        Tue, 14 Apr 2026 02:48:31 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b468273ccfsm53628875ad.43.2026.04.14.02.48.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:48:31 -0700 (PDT)
Message-ID: <0ba07cb4-d337-4405-a9cc-82e17a648801@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 15:18:26 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] bus: mhi: Move sahara protocol driver under
 drivers/bus/mhi
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, andersson@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-2-47ad79308762@oss.qualcomm.com>
 <enwtopztznwtvlhukkggxcdmh4t7v7duoiuapi5gd4zggqwbit@ypb4nxnds53f>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <enwtopztznwtvlhukkggxcdmh4t7v7duoiuapi5gd4zggqwbit@ypb4nxnds53f>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HoCeyQVhtHgyBGV2_VyBmkQdeVa4W6q0
X-Authority-Analysis: v=2.4 cv=RoH16imK c=1 sm=1 tr=0 ts=69de0d72 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=lNZ6NPquD5IsYqIz-wEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MSBTYWx0ZWRfXylYPvZ/8/upI
 XLFe+hwZUmlgo8jOClxayxZy7s5tKBvZ8eYQhAWcEbasq8ds+5rViiN9dIZf1K/OwehPlDYLXCt
 Vt8QLzNTncfb4SQY9zD/K2VlJofskuaHKr3OVjIvl+qVpQyBZYwiFvMigv54Xt88VG1RGaEE/6P
 D4UWxeG96lg53DVTo4ZYdsi7ubIEUVVDn9c2XqYyM54Uf+NHxPjlqYFhYahXwbbc7cQoFZV0ECm
 7LK2rI70Z5oIKF0lu9KaWOruo/eFF+dfiE+R9Mea7BOW3Hu+xzaLBDq3VwXXvLoJXxcG7zH54B6
 rrUTql38h9QGo7pQQ2hQNClWFw4wpC+vFjqBtEjQs3SU0xC26TqYteSJ28DUJtaKv0lT7q+WK8e
 SPCUBC8E4e11RisiMLi7iODTYiU3rvynEQFreJqRx+iIa0g+rmXTMuukJXfpyras0cl0YNZbX8t
 MXdVxE4FoEWsFZzDjcg==
X-Proofpoint-GUID: HoCeyQVhtHgyBGV2_VyBmkQdeVa4W6q0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140091


On 4/13/2026 4:50 PM, Manivannan Sadhasivam wrote:
> On Thu, Mar 19, 2026 at 12:01:42PM +0530, Kishore Batta wrote:
>> The Sahara protocol driver is currently located under the QAIC
>> accelerator subsystem even though protocol itself is transported over the
>> MHI bus and is used by multiple Qualcomm flashless devices.
>>
>> Relocate the Sahara protocol driver to drivers/bus/mhi and register it as
>> an independent MHI protocol driver. This avoids treating Sahara as QAIC
>> specific and makes it available for reuse by other MHI based devices.
>>
>> As part of this move, introduce a dedicated Kconfig and Makefile under the
>> MHI subsystem and expose the sahara interface via a common header.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/accel/qaic/Kconfig                      |  1 +
>>   drivers/accel/qaic/Makefile                     |  3 +--
>>   drivers/accel/qaic/qaic_drv.c                   | 11 ++---------
>>   drivers/bus/mhi/Kconfig                         |  1 +
>>   drivers/bus/mhi/Makefile                        |  3 +++
>>   drivers/bus/mhi/sahara/Kconfig                  | 18 ++++++++++++++++++
>>   drivers/bus/mhi/sahara/Makefile                 |  2 ++
> Create one more subidr 'clients' and move 'sahara' here:
> 	drivers/bus/mhi/host/clients/sahara/
>
> I'm not sure if we are going to have Sahara implementation for the endpoint
> itself. If so, it should be moved under drivers/bus/mhi/common/.


Thanks for the suggestion. I will create clients directory and move 
Sahara driver here. For endpoint, Sahara driver is implemented in XBL. 
So, its not required here.

>
>>   drivers/{accel/qaic => bus/mhi/sahara}/sahara.c | 16 +++++++++++-----
>>   {drivers/accel/qaic => include/linux}/sahara.h  |  0
> include/linux/mhi/sahara.h
ACK. I will move the header file to include/linux/mhi/sahara.h
>
>>   9 files changed, 39 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/accel/qaic/Kconfig b/drivers/accel/qaic/Kconfig
>> index 116e42d152ca885b8c59e33c7a87519a0abc6bb3..1e5f1f4fa93c12d8ca8fb37633f2f0bee9997499 100644
>> --- a/drivers/accel/qaic/Kconfig
>> +++ b/drivers/accel/qaic/Kconfig
>> @@ -8,6 +8,7 @@ config DRM_ACCEL_QAIC
>>   	depends on DRM_ACCEL
>>   	depends on PCI && HAS_IOMEM
>>   	depends on MHI_BUS
>> +	select MHI_SAHARA
>>   	select CRC32
>>   	select WANT_DEV_COREDUMP
>>   	help
>> diff --git a/drivers/accel/qaic/Makefile b/drivers/accel/qaic/Makefile
>> index 71f727b74da3bb4478324689f02a7cea24a05c2d..e7b8458800072aa627f7f36c3257883aa56f4ce4 100644
>> --- a/drivers/accel/qaic/Makefile
>> +++ b/drivers/accel/qaic/Makefile
>> @@ -13,7 +13,6 @@ qaic-y := \
>>   	qaic_ras.o \
>>   	qaic_ssr.o \
>>   	qaic_sysfs.o \
>> -	qaic_timesync.o \
>> -	sahara.o
>> +	qaic_timesync.o
>>   
>>   qaic-$(CONFIG_DEBUG_FS) += qaic_debugfs.o
>> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
>> index 63fb8c7b4abcbe4f1b76c32106f4e8b9ea5e2c8e..76cc8086825e7949ed756d51fcb56a08f392d228 100644
>> --- a/drivers/accel/qaic/qaic_drv.c
>> +++ b/drivers/accel/qaic/qaic_drv.c
>> @@ -15,6 +15,7 @@
>>   #include <linux/msi.h>
>>   #include <linux/mutex.h>
>>   #include <linux/pci.h>
>> +#include <linux/sahara.h>
>>   #include <linux/spinlock.h>
>>   #include <linux/workqueue.h>
>>   #include <linux/wait.h>
>> @@ -32,7 +33,6 @@
>>   #include "qaic_ras.h"
>>   #include "qaic_ssr.h"
>>   #include "qaic_timesync.h"
>> -#include "sahara.h"
>>   
>>   MODULE_IMPORT_NS("DMA_BUF");
>>   
>> @@ -782,18 +782,12 @@ static int __init qaic_init(void)
>>   	ret = pci_register_driver(&qaic_pci_driver);
>>   	if (ret) {
>>   		pr_debug("qaic: pci_register_driver failed %d\n", ret);
>> -		return ret;
>> +		goto free_pci;
>>   	}
>>   
>>   	ret = mhi_driver_register(&qaic_mhi_driver);
>>   	if (ret) {
>>   		pr_debug("qaic: mhi_driver_register failed %d\n", ret);
>> -		goto free_pci;
>> -	}
>> -
>> -	ret = sahara_register();
>> -	if (ret) {
>> -		pr_debug("qaic: sahara_register failed %d\n", ret);
>>   		goto free_mhi;
>>   	}
>>   
>> @@ -847,7 +841,6 @@ static void __exit qaic_exit(void)
>>   	qaic_ras_unregister();
>>   	qaic_bootlog_unregister();
>>   	qaic_timesync_deinit();
>> -	sahara_unregister();
>>   	mhi_driver_unregister(&qaic_mhi_driver);
>>   	pci_unregister_driver(&qaic_pci_driver);
>>   }
>> diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
>> index b39a11e6c624ba00349cca22d74bd876020590ab..4acedb886adccc6f76f69c241d53106da59b491f 100644
>> --- a/drivers/bus/mhi/Kconfig
>> +++ b/drivers/bus/mhi/Kconfig
>> @@ -7,3 +7,4 @@
>>   
>>   source "drivers/bus/mhi/host/Kconfig"
>>   source "drivers/bus/mhi/ep/Kconfig"
>> +source "drivers/bus/mhi/sahara/Kconfig"
>> diff --git a/drivers/bus/mhi/Makefile b/drivers/bus/mhi/Makefile
>> index 354204b0ef3ae4030469a24a659f32429d592aef..e4af535e1bb1bc9481fae60d7eb347700d2e874c 100644
>> --- a/drivers/bus/mhi/Makefile
>> +++ b/drivers/bus/mhi/Makefile
>> @@ -3,3 +3,6 @@ obj-$(CONFIG_MHI_BUS) += host/
>>   
>>   # Endpoint MHI stack
>>   obj-$(CONFIG_MHI_BUS_EP) += ep/
>> +
>> +# Sahara MHI protocol
>> +obj-$(CONFIG_MHI_SAHARA) += sahara/
>> diff --git a/drivers/bus/mhi/sahara/Kconfig b/drivers/bus/mhi/sahara/Kconfig
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..3f1caf6acd979a4af68aaf0e250aa54762e8cda5
>> --- /dev/null
>> +++ b/drivers/bus/mhi/sahara/Kconfig
>> @@ -0,0 +1,18 @@
>> +config MHI_SAHARA
>> +	tristate
>> +	depends on MHI_BUS
>> +	select FW_LOADER_COMPRESS
>> +	select FW_LOADER_COMPRESS_XZ
>> +	select FW_LOADER_COMPRESS_ZSTD
> Why suddenly these configs pop up?


I will remove these in the next version.

>
>> +	help
>> +	  Enable support for the Sahara protocol transported over the MHI bus.
>> +
>> +	  The Sahara protocol is used to transfer firmware images, retrieve
>> +	  memory dumps and exchange command mode DDR calibration data between
>> +	  host and device. This driver is not tied to a specific SoC and may be
>> +	  used by multiple MHI based devices.
>> +
>> +	  If unsure, say N.
>> +
>> +	  To compile this driver as a module, choose M here: the module will be
>> +	  called mhi_sahara.
>> diff --git a/drivers/bus/mhi/sahara/Makefile b/drivers/bus/mhi/sahara/Makefile
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..fc02a25935011cbd7138ea8f24b88cf5b032a4ce
>> --- /dev/null
>> +++ b/drivers/bus/mhi/sahara/Makefile
>> @@ -0,0 +1,2 @@
>> +obj-$(CONFIG_MHI_SAHARA) += mhi_sahara.o
>> +mhi_sahara-y := sahara.o
>> diff --git a/drivers/accel/qaic/sahara.c b/drivers/bus/mhi/sahara/sahara.c
>> similarity index 99%
>> rename from drivers/accel/qaic/sahara.c
>> rename to drivers/bus/mhi/sahara/sahara.c
>> index fd3c3b2d1fd3bb698809e6ca669128e2dce06613..8ff7b6425ac5423ef8f32117151dca10397686a8 100644
>> --- a/drivers/accel/qaic/sahara.c
>> +++ b/drivers/bus/mhi/sahara/sahara.c
>> @@ -1,6 +1,8 @@
>> -// SPDX-License-Identifier: GPL-2.0-only
>> -
>> -/* Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved. */
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
> Why are you changing the copyright?
I misunderstood the comment from Patch 1 series. Only the copyright 
style needs to be changed. I will modify it in next version.
>
>> + *
>> + */
>>   
>>   #include <linux/devcoredump.h>
>>   #include <linux/firmware.h>
>> @@ -9,12 +11,11 @@
>>   #include <linux/minmax.h>
>>   #include <linux/mod_devicetable.h>
>>   #include <linux/overflow.h>
>> +#include <linux/sahara.h>
>>   #include <linux/types.h>
>>   #include <linux/vmalloc.h>
>>   #include <linux/workqueue.h>
>>   
>> -#include "sahara.h"
>> -
>>   #define SAHARA_HELLO_CMD		0x1  /* Min protocol version 1.0 */
>>   #define SAHARA_HELLO_RESP_CMD		0x2  /* Min protocol version 1.0 */
>>   #define SAHARA_READ_DATA_CMD		0x3  /* Min protocol version 1.0 */
>> @@ -928,8 +929,13 @@ int sahara_register(void)
>>   {
>>   	return mhi_driver_register(&sahara_mhi_driver);
>>   }
>> +module_init(sahara_register);
>>   
>>   void sahara_unregister(void)
>>   {
>>   	mhi_driver_unregister(&sahara_mhi_driver);
>>   }
>> +module_exit(sahara_unregister);
> Use module_mhi_driver().
ACK.
>
> - Mani
>
