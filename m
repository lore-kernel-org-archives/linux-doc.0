Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C7C4CC62D
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 18:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791828758; cv=none; b=m00eBOxxxarSuyJsbti1xUFS+jZ713Rjs/63A+tNFOTRyHN8gB+d7Tlu/ibjZ4/Yep6kzljt9WLhpMqC8lul0lynoQ1zkw5E4djSvXG+eU4MBqK5lVcSq4Xv5V7P7+Aoh/gQJsJiIcKbZVJVCPhGQvAuffGkPbExdp2aRaDqpTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791828758; c=relaxed/simple;
	bh=xMOB+Xeswh/VHG1JRXbW55ogVP/Sfyg4N3upBRTPGH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZZVsioPjwmrZgsCieFMFExzFfklvFztP0Rcb8gheQtWdLdqhxOzXlXPWt2kllJDkcwOb91ZfVoAZcCYkW+/Q6b4a+y6lrdRCDzElpAvxnMIQ64eydQTNgaVm591/DRf+TrQiMytbvdfz8O9D4M+y7bnBiBQ7YPWVC7lOwZP3F5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YNSM7lB4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KqTBcvF8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YNSM7lB4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KqTBcvF8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CHv4ir3573582
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 18:12:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	218J+j7wE8PIduGE71lICGhFvQKcwEnxX938pBY/Ais=; b=YNSM7lB4JH/yNGny
	CkiKnKe2Q/7w9vBoMyHJg/uLWTnONhHn5J+/1bsPsEAs9AUyIxXShnRefFp3lNN7
	5hqZyXp2gMfq9tjuyE4TlUWUQ2IW36U8gheCFvniVwXnJy8RETjpu0u0qjqWUgGI
	7iZCLRvwUy6/ZpMWCRXTEj27D6TzlX9+IdQh4vawLxl+t8yNoEDxfGJ6xvpRLVcR
	Ao/FfP1gSDZgFLvTgU9lCXKYwsPWi32FZmAd9aBiB1Sam2FeWMfCtsKkyphgXDSI
	IN1E8sbVGedTsfCtjh7QWbRGXiG03Oc5S/YOd6iBR3krdFZcDZIV7mNW+5wlBPPr
	wxa4/A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wffj53s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 18:12:36 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-351788121cfso15086eec.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 11:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791828755; x=1792433555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=218J+j7wE8PIduGE71lICGhFvQKcwEnxX938pBY/Ais=;
        b=KqTBcvF8+GhJuMeliOhItQt6R91+nWHcf88BOofFGYuzqrFqbF+ZGmzSQ+0+CcT1W8
         b94nHAkEY8EU5Wd9MxZ63OCTRgGtmSCsfzyN8X0/0zf5Z75jc2L2xG8AwnvYlpB87Q60
         oIaHTNBJDInBXp4oIdft2J9oBdVoBOEqywQy69cTWu6vnc25oXN/Mt0tZgLrGi9XKgcZ
         W23gdeVu4NQlqujGfQItjA1hYaOgF3OpUzPxL575Wgn73Ztp3DyATZeKf7KDEGbSwJs9
         gzNwJeEi4P6d8uGgk6+VGT96M/a55ZKraFMBGinqWG8dTG0SEeBVojZfBMy+iLGEzJEn
         VnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791828755; x=1792433555;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=218J+j7wE8PIduGE71lICGhFvQKcwEnxX938pBY/Ais=;
        b=BVgJxKQz13GNSNcNk/rCLm9RO6SqicxadMXxeGANhasQWZIOpgCcXyGxgbFaF1bu24
         GPg4k2sHczv6oLShPX4wum9hIPhQKa/WYFvapG8+/bAo0TZJx0RJVoP8FS97L3aRS66a
         +146hMWhL+es3fCqjeR/HAIN1MKk2N7xJ9XRNS8RkkXIiQ2XV4E3go2kLB2t8vNWzvbB
         rwRtmP1s8Ejq2rZbIE1vJH2f8rJZ4dCMXGvyaG49udXMNHWjjE7pzfVZ4O7xGtSJxJDn
         QvpT/9idyUwXV5ZcSpFXO+JwUnWxjwRlfQeDR2CXH07zNku+JGSnvEDoHrICY7SvO4rY
         Rr0A==
X-Forwarded-Encrypted: i=1; AKwUvByI14j5wOIDWBivc+PF1T3G7robqqAEXkIyt6gBwm4PV4fpsIr/ZBoxe5G+HAv5nPWDDCV4pTSPGh8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKS8T/ValtrcE8HTngrsPa4UzXmD5mtfRvHnPZrwp3VdLKapMB7
	3oAKUhnCXGtwqxOzAbzjYtOewHGaYjSay8Ay20Xi2svv7UVAHoyuB4VAfj1qc2P76haIok5hhRy
	+LAQLuVSh0abVY0F8VvXtB5plSK6RDdxXL8A4ZfodPjieSD69Klpf4MRLf6tWMwo=
X-Gm-Gg: AYBFou2fXxO9glQ4DlHJc8/FTc+Mrp2cMPqdr9EGLo/zE71Vx1m0wGmykvja6JsFXeZ
	DSDU++AKtaAY3jkZH+jXSePbGoz3fSFk68C9zHrS0bzv1nZ0MHso5ttqMojHgCUSXzKmWeRk/ks
	4q/J4e5mwdNwIWXJCElMXCqV2C54ShfMspJNenItfF9YoJXNQBNpMQ8VDJYRwW9z/Ybx4SivWbl
	fm9PgOwF9bTR36V210wRXgyjpPavccu4/oXboqiq3o+yMccRLKLl9aXQ5c5QGvNihYSRtjJY2lT
	oUWbJAWu0tPiCGMACmS9RD208fpXtAVYBR/k+INpW41ps0YL6wZ/gunyB9CKYqX4AdfQQZlv6bL
	HDJWAWZo91QkwEKXGAwjz+R9cx7K4dHo=
X-Received: by 2002:a05:7300:6822:b0:35b:bb89:231e with SMTP id 5a478bee46e88-35bbb892336mr1842443eec.29.1791828755112;
        Mon, 12 Oct 2026 11:12:35 -0700 (PDT)
X-Received: by 2002:a05:7300:6822:b0:35b:bb89:231e with SMTP id 5a478bee46e88-35bbb892336mr1842396eec.29.1791828754450;
        Mon, 12 Oct 2026 11:12:34 -0700 (PDT)
Received: from [192.168.0.215] ([49.205.115.55])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm40504487eec.3.2026.10.12.11.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 11:12:34 -0700 (PDT)
Message-ID: <1997618b-1350-4b67-9168-794be3e40683@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 23:42:28 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/7] Qualcomm Sahara protocol enhancements
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
References: <20261008-sahara_protocol_new_v2-v7-0-90d278bd7414@oss.qualcomm.com>
 <asu5x72z9-p0U8G0@debian>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <asu5x72z9-p0U8G0@debian>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfX6PQPxRpIUg0X
 kwUI0AW/9eJ4TiR+V8h8BcAuRsIjCnIUU1rV2U24Nqnn9jhpgiZEWQxa4gSCWCacdOM0F9/ODyF
 7yaYUXD2XlmKQg6iqQQ4u3/VuXO9bEcS2BiGPpmA3XCYyXn76JalMKTRDV6JmVfmaF+8TeC71Li
 rOJ4X1FdYYimdqKNuEEVApA6M2majyj2YTBwDoAfOlAzt9DglBrAThFGhT/EBcNYI3OLYjoRGkj
 vxkFcjrBPClnJrQajvf+PmpLEVgeCW+zaxrv/cBVYC+gCgcUlWlJkrVmdlzhyc+FV9q4impxgB3
 O8X4UXgBtv1HNdPpq9JmVbFxNv9Z7lRfGt5p174FZqaE4SBp3ZplWE+8DsRHYE3xJdpm/ZKh/n5
 CDjfdtPtZSC0EJasFpyDCa00h1wk0I7SAvCkZdUnCHD4YfGkpJqCVaJxjpizZMNBOZ4sgZj5Lqm
 TqRLT2IHg7PYar27C+g==
X-Proofpoint-GUID: MVL-qXz6wPeoM56eXwA-PWYxqLBG-9wH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA3MiBTYWx0ZWRfXwyuf8Zpojd3E
 7bGjrfxup2FbMP6rxzevKvzwtyoY1fyErLLGgdW7TfWoax0c19RLvGAri9xlccUtHIx23wRMcXU
 /mQJGvzjI6c8JqqkuCalTqXb4I9tQEg=
X-Authority-Analysis: v=2.4 cv=ZcWIpcVA c=1 sm=1 tr=0 ts=6acd2314 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=rMnsrh5NOwviKPWndHUBiA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=YvxDvPKW4DV_tE5yJ3MA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: MVL-qXz6wPeoM56eXwA-PWYxqLBG-9wH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120072


On 10/11/2026 10:03 PM, Manivannan Sadhasivam wrote:
> On Thu, Oct 08, 2026 at 11:53:44AM +0530, Kishore Batta wrote:
>> Hi All,
>>
>> This series reworks the Sahara protocol driver to make it reusable for
>> multiple MHI based devices and adds support for capturing, restoring and
>> exposing DDR training data using the Sahara command mode.
>>
>> The Sahara protocol is transported over the MHI bus and is used by multiple
>> flashless devices to transfer firmware images, retrieve memory dumps and
>> exchange command mode data during early boot. However, the current
>> implementation lives under the QAIC accelerator driver and contains
>> device-specific assumptions that limit reuse.
>>
>> Some MHI devices (for example, QDU100) expose the sahara protocol directly
>> on a "SAHARA" MHI channel and rely on command mode to exchange DDR training
>> data with the host. The existing driver does not bind to such devices and
>> ignores Sahara command mode packets, causing training data to be dropped.
>>
>> This series addresses these issues by relocating the Sahara driver to the
>> MHI subsystem, centralizing device specific configuration and adding command
>> mode handling for DDR training data.
>>
>> Overview of the changes in this series -
>> 1. Move Sahara under the MHI subsystem:
>>     a. Relocate the sahara protocol driver from QAIC accelerator tree to
>>        drivers/bus/mhi/host/clients directory.
>>     b. Register Sahara as an independent MHI protocol driver.
>>
>> 2. Generalize device matching and configuration
>>     a. Allow the driver to bind to devices exposing the protocol on a
>>        SAHARA MHI channel.
>>     b. Centralize firmware image table selection at probe time using a variant
>>        table, instead of scattered conditionals.
>>     c. Preserve existing behavior on AIC devices.
>>
>> 3. Add QDU100 firmware image table support
>>     a. Add a QDU100 image table and select it based on the matched MHI channel.
>>     b. No separate client driver or registration mechanism is required.
>>
>> 4. Add Sahara command mode support for DDR training.
>>     a. Handle command mode packets(CMD_READY, EXECUTE, EXECUTE_DATA).
>>     b. Query supported commands and retrieve DDR training data from the device.
>>     c. Allocate receive buffers based on the reported payload size and copy
>>        raw data from the MHI DL.
>>     d. Store training data in controller-scoped memory using devres so it
>>        survives sahara channel teardown.
>>
>> 5. Expose DDR training data to userspace
>>     a. Add a read-only binary sysfs attribute under the MHI controller device.
>>     b. The attribute reads directly from controller-scoped storage and remains
>>        available after the Sahara channel device is removed.
>>     c. Cleanup is handled automatically via device-managed resources.
>>
>> 6. Document the sysfs ABI
>>     a. Add ABI documentation describing the DDR training data sysfs node.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> Series fails to apply to mhi-next branch. Please rebase and resend. Since I'm
> about to send the PR for v7.4, this will miss the upcoming cycle. But I can
> queue it once v7.4-rc1 is released.
>
> - Mani


Sure Mani. I'll rebase the series onto the current mhi-next branch and 
resend it in v8 version.


