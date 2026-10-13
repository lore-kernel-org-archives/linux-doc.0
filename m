Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C203806C0
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 07:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791876452; cv=none; b=mRbW1GzqhfS5kd2joEykdUvxVZHnWfHxh+j7PUpxezgpIUT4bEP8jsk0OYDJfTkeHWHgtL4+Kk9JheR/++v0r3uv25y+VQbUA6fLYTT5TI0OBRPCcMHA/cBxYUt/nROoKSR5KsfUuKZVd/H4Z02eefk/5q6cozEAORW8N499RsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791876452; c=relaxed/simple;
	bh=HNtZ6WxqkhhZxZcY0QGx+aYFkBcRDuHhTkZVnERgxgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iCjocVwcBxH+U4cjKFy+5gVLhZQVomFtbIMgQ/3Wx+9b6AOrkr0/qj5ZHgYfSf0kFkIPPNxjbuBkeYU1rZSTh3oz/O18Tx5pvEDwmeb1YbbD300BPJnuM33U4/XwGq5OtsfeM3T0JqVeINmlSzUBrEeDkoCOSlsK+JAWdy7Q6Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gVEOvMuJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+XskqUr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gVEOvMuJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X+XskqUr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D20pij3907367
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 07:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DvokiBRaiti5Y+UDOubxiXcM9bfVFYj7J+MMf4KQ2L4=; b=gVEOvMuJ29Cd8Tk8
	E5fUCLBmjwGvP9eU7uoGzTempBz9i2mM6p0m4Uylu0RyfK1u7JiOpFhl7oD15R53
	vV+eCkljybWYkfQQ9cFhdj/SMO1mu0oiUqOWr2cNK/HytSaovAYl/Rr0qALmOY7M
	eYW4oe05hKpSvZ4B5PN70nhyFSeBkZ6aOOWeFm+jXrk7YycsYyRuEXS44IrU7/Zn
	02uY9OWZy5iVEfmQ6Bnol8fvVNaanVP0eeAGF4v/x+e0e/QibwCWAQNYe3Y5uDqU
	iFE/KIGxwzpslCoSkdszLbPJM+2dWuyNuzRxHPO/omGfk/43KNxscIR9k5XmCkQ0
	sLGMwQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h95xqt928-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 07:27:29 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso1820812a12.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 00:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791876449; x=1792481249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DvokiBRaiti5Y+UDOubxiXcM9bfVFYj7J+MMf4KQ2L4=;
        b=X+XskqUrAxJRNcW8UuN6AbfvZcAVC6WufGmuGJZqPY3xjmCUW6xhVzwx4IZTJgs/eS
         mc09hYsqn6bObQFu3pK1hnnEtptEBMlVT4K8avwQ3VFIdkz9Aha24gx73hR/wM22L51f
         C/3HHuw/jL/CBY1Ftj4QOJplHf8nDtyLwci1AMjwQLtLbsgLMWbSfn5EL13rsgsjEc5q
         FcMmRGAGdgB3NTnjV5lRIvH04fp4nETvznpBkZJE1k1NeoDEwdQnOYLgw3BK+SMkSCNB
         HIClTtKQ/K1itSoD09ix7LdTuBMNceeAeHZ4wOwmW0T3+av0IAuA1BPFsfVUVeeT6Gmc
         5g9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791876449; x=1792481249;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DvokiBRaiti5Y+UDOubxiXcM9bfVFYj7J+MMf4KQ2L4=;
        b=W6gwj2mrPbQJ2pPQfQvcIuEpEWoOddnN2XzdDHlL78uawRLXNy2EMv4WjBYKN9Q3FP
         qf0wNEkozaRlsK1xYXJ23cg3IVkeYu5noAUw7UFEWCQhaQZPFyYA/oodN7TVL+LBGxG2
         VLDeFqI55RES/xt2/WlNI8nU7xM3MBXXx6BX6cduWT+X6N1EpvQGZuZgHv6nGa6wZ55L
         G1sWn+peuMAXJ9kFMOvASx96CRbU885EPj3AKLMZJyZek/PaxT8jvoPXp5fjYYu72Mkq
         R59Nkx2GtXXM/89hwu1B5Z18N7GiV69vR+ToUH12Y7mGSnFTcOnFn901rqZFsxiELiPo
         iKMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxaB7c1bVdouwjNdKNqqollkDGS2LEv0zQHPW8DpiK9D34wjkX9Gk3cA97Re0iasIVKg5JXhheC6ag=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyVUkbAwHlCWyHrHFdqKK3a81XQVTh/UekxhU3NTZBujndNXvM
	+qr32lrN7Zi/3DVvgv0TmU+JszjOGZf6uKIiq0MkkQ7k95ZSEpm5Yp+VvytJwXmq0+YSSUuFssS
	T+24WvBewZMihXYW5oVVTVrEvCmgxz/1uUMsfFUbWmYUeXb//5LxzuTWPiQql4Rs=
X-Gm-Gg: AYBFou3tXyRAYf32N9Cyz9zeR0CgF1ulpO+hgQgRZdD+Zmr4Sq4ZDgsAeS4z+o63Z32
	ntJQQrJFkJtHploWUFILxZ554XLKyPb09APl8Ou84RyA/IVKG/xKCHyqJNljZq25w8eB/dGhcXP
	8FRg9WOEq/o1IfsCAEtr2oqBOYYIGLDfJk/VayYkurZ0O2yCwyhQEYCPy3ts4Yp5rvJP3j3gEb6
	InbeVPXsdr8Fz/kQrRJclMIqn7zUkyRuveqIekXWaqNdHhSE1NDdaSp6rCBhiphZrfaHfuXyuo0
	zIcqozjzTu2XaFVoJRWLjv8dprCr+zMPFfDWuK4rsihtKC5qJPWq6st8K4BgI4uLRhkg4cQTKEb
	/AzmsaQw9+Lp8xkvGXjQkDHMzRKcKqiI=
X-Received: by 2002:a05:6a21:a02:b0:3de:5ce4:9e72 with SMTP id adf61e73a8af0-3e16c07d2c3mr9113738637.56.1791876448590;
        Tue, 13 Oct 2026 00:27:28 -0700 (PDT)
X-Received: by 2002:a05:6a21:a02:b0:3de:5ce4:9e72 with SMTP id adf61e73a8af0-3e16c07d2c3mr9113720637.56.1791876448142;
        Tue, 13 Oct 2026 00:27:28 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da05caaesm5050788a12.32.2026.10.13.00.27.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 00:27:27 -0700 (PDT)
Message-ID: <122f5f0b-6314-4b12-b9dc-8f983c9b5698@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:57:22 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/7] bus: mhi: Move Sahara protocol driver under MHI
 host client drivers
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
References: <20261012-sahara_protocol_new_v2-v8-0-e12939d229a1@oss.qualcomm.com>
 <20261012-sahara_protocol_new_v2-v8-2-e12939d229a1@oss.qualcomm.com>
 <as1F08YNeWz_1bre@monoceros>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <as1F08YNeWz_1bre@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyOSBTYWx0ZWRfX7KfXB3Z5ERr/
 Q4csy9vl6X8elq7lfziWyjyQnl0exOYEW2diInLuH3ohWnrh+NVTpMidnFaefHO8++85WIq5SII
 cFxwb9Q9XfOpwjLrgJn8uuLMiJUUrO8mIfKfuwz9LKL/carekK04Zwm8Igie69+RVv/AlUTniZH
 vAMiVuLRUkaZG2vDUOHOTCPB2aQ6uFOeeg4TjwH7iXmVMgsHM+KJsyg+C/4AuCRpbcS4sKqSRf6
 jPN0jDYQKu6XyQvq1539Y4XPhM+ZwNQKQhOH2ABMNpgI9HUawXfDELuS6oXBDBnzYzQ76Zk9kaO
 Ih+jtIi3Yxf2PEzl0vB+BIPPUfqvRGN49qtQsYrdpQhw7qrHnrbfRyIeSxWrGqPIv0+2KlHdcJM
 EbM3s21rNy4zc2ELgbQyoz7Tzi8XurR/jf3o2iVPgzwDtfDU0zGC9isC0CnArI+YmxndxQxZg7z
 qUgtCa872qYhPQPWWIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyOSBTYWx0ZWRfX+72N0q9GkiGN
 jXpLk+g2VTzmTUO61B1xQDw7Ze8Q9mHuJAAck3BRISXWMUdoyx6utY+jzEdcbz9iWOiKv6+MJB6
 saEVzCb9MJ03RElZ0o0Sp69wKtih6UI=
X-Proofpoint-ORIG-GUID: Xpca0JxZ7EBn7JeHtGs33llWmxGz8SDb
X-Authority-Analysis: v=2.4 cv=EP+TQFZC c=1 sm=1 tr=0 ts=6acddd61 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=qh2oGK4qJ8XON0oEHbUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: Xpca0JxZ7EBn7JeHtGs33llWmxGz8SDb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130029


On 10/13/2026 2:13 AM, Uwe Kleine-König wrote:
> On Mon, Oct 12, 2026 at 11:48:00PM +0530, Kishore Batta wrote:
>>   #include <linux/devcoredump.h>
>>   #include <linux/firmware.h>
>>   #include <linux/limits.h>
>>   #include <linux/mhi.h>
>> +#include <linux/mod_devicetable.h>
> Why? There isn't even a (new) usage of any *_device_id. There is a
> mhi_device_id, please rely on linux/mhi.h to provide that. The main
> effect of including linux/mod_devicetable.h is that the driver grows
> many unneeded dependencies, so don't.
>
> Best regards
> Uwe


ACK. I will remove the redundant mod_devicetable.h include in the v9 
version.

