Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBDC2AEED;
	Wed, 18 Dec 2024 02:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734488499; cv=none; b=IsDxc8ksqYK1rFePATysRSUTlN2P0u+T6lyUyZ9070FBfW+gJFgccl/ZiwIKVpE5hI6r9M5hGMl9pP/YhZfLC9zg/OBIg6dMXdNwkHXBwSP4BhxZnMWu3hesNKU39gLPntIYR2V6vL033JCfov0G31PTkD08i+1r9NjcDipZh8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734488499; c=relaxed/simple;
	bh=2dfktqLq+Vu6IQmTgM2MVcirLc/3oh6bOjnyMuNRk4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mWhGRtCd2EABx/ANCFtmLWjyAp/yrtlbuN0FkUKvBAEvPD1X77ekbY74qrhqMbGNQdEzqt3xUwge2B3NIdxAADwf0WPAIcXMCxZGbWuUfhwQ2cmW/+NXJs0fcuAoBAqKbf1QXkQ5oV8izNp0hUE1zJTNDhlhXc7NT8dwAZPSu3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CMTxi5KD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CMTxi5KD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHNVpq2023282;
	Wed, 18 Dec 2024 02:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BgkSjZ8EbFbfs6UyyZE4BVrTuBG3ePaglPB/zt5dDGs=; b=CMTxi5KDJGaz4tJ+
	CxwRDGQSgIFxHmfk5EBd9poN1RXHRgyKW6NUmtiSEFx+qFGVtQ3p80+6XcEGsfCu
	ozbchxyzgnVlh37IMfHgyDJPD6TpSmZJFrNnyuzP9G4DKGmyWha39GeBB+NJWr31
	OXYGLByJbfkB6j2UCPxURTRLpQGOM1dhPszFUJ7kBrQdm8YueqVcPO9PkIDBB5TH
	vygN9bNao3XfPSwTvlFB1zReANjzXrIIc75eO1JTsQ7UFv2dm+UdA/XnMGkDuS9I
	yjemLG5d4XchWuDsA1naBCbnNR37VbfdtgIzNnqjA8X8/oHiFqHtNZDbpvopymH2
	1Cc1vQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kk2909d9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 02:21:26 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BI2LP51025196
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 02:21:25 GMT
Received: from [10.253.12.24] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Dec
 2024 18:21:22 -0800
Message-ID: <e3a66cc7-a770-4d08-be66-13e13a2d5130@quicinc.com>
Date: Wed, 18 Dec 2024 10:21:19 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] of: Add printf '%pOFm' for generating modalias
To: "Rob Herring (Arm)" <robh@kernel.org>, Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes
	<linux@rasmusvillemoes.dk>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Saravana Kannan <saravanak@google.com>,
        Andrew Morton <akpm@linux-foundation.org>
CC: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20241217183711.2525863-1-robh@kernel.org>
Content-Language: en-US
From: quic_zijuhu <quic_zijuhu@quicinc.com>
In-Reply-To: <20241217183711.2525863-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -hCPlTfEvDG_N_w4_IJdpRd3-WCbOXK8
X-Proofpoint-ORIG-GUID: -hCPlTfEvDG_N_w4_IJdpRd3-WCbOXK8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 spamscore=0 clxscore=1011
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180016

On 12/18/2024 2:37 AM, Rob Herring (Arm) wrote:
> The callers for of_modalias() generally need the module alias as part of
> some larger string. That results in some error prone manipulation of the
> buffer prepend/append the module alias string. In fact,
> of_device_uevent_modalias() has several issues. First, it's off by one
> too few characters in utilization of the full buffer. Second, the error
> paths leave OF_MODALIAS with a truncated value when in the end nothing
> should be added to the buffer. It is also fragile because it needs
> internal details of struct kobj_uevent_env. add_uevent_var() really
> wants to write the env variable and value in one shot which would need
> either a temporary buffer for value or a format specifier.
> 
> Fix these issues by adding a new printf format specifier, "%pOFm". With
> the format specifier in place, simplify all the callers of
> of_modalias(). of_modalias() can also be simplified with vsprintf()
> being the only caller as it avoids the error conditions.
> 

good solution (^^).

> Cc: Zijun Hu <quic_zijuhu@quicinc.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/core-api/printk-formats.rst |  1 +
>  drivers/of/device.c                       | 25 ++--------------
>  drivers/of/module.c                       | 35 +++++------------------
>  drivers/of/unittest.c                     |  2 ++
>  include/linux/of.h                        |  8 +++---
>  lib/vsprintf.c                            |  7 +++--
>  6 files changed, 22 insertions(+), 56 deletions(-)
> 
> diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> index ecccc0473da9..d72fe3d8c427 100644
> --- a/Documentation/core-api/printk-formats.rst
> +++ b/Documentation/core-api/printk-formats.rst
> @@ -496,6 +496,7 @@ equivalent to %pOFf.
>  	- F - device node flags
>  	- c - major compatible string
>  	- C - full compatible string
> +	- m - module alias string

Ack.

>  
>  The separator when using multiple arguments is ':'
>  
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index edf3be197265..ae8c47d5db8e 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -199,14 +199,9 @@ ssize_t of_device_modalias(struct device *dev, char *str, ssize_t len)
>  	if (!dev || !dev->of_node || dev->of_node_reused)
>  		return -ENODEV;
>  
> -	sl = of_modalias(dev->of_node, str, len - 2);
> -	if (sl < 0)
> -		return sl;
> -	if (sl > len - 2)
> +	sl = snprintf(str, len, "%pOFm\n", dev->of_node);
> +	if (sl >= len)
>  		return -ENOMEM;
> -
> -	str[sl++] = '\n';
> -	str[sl] = 0;
>  	return sl;
>  }

Ack.

>  EXPORT_SYMBOL_GPL(of_device_modalias);
> @@ -256,24 +251,10 @@ EXPORT_SYMBOL_GPL(of_device_uevent);
>  
>  int of_device_uevent_modalias(const struct device *dev, struct kobj_uevent_env *env)
>  {
> -	int sl;
> -
>  	if ((!dev) || (!dev->of_node) || dev->of_node_reused)
>  		return -ENODEV;
>  
> -	/* Devicetree modalias is tricky, we add it in 2 steps */
> -	if (add_uevent_var(env, "MODALIAS="))
> -		return -ENOMEM;
> -
> -	sl = of_modalias(dev->of_node, &env->buf[env->buflen-1],
> -			 sizeof(env->buf) - env->buflen);
> -	if (sl < 0)
> -		return sl;
> -	if (sl >= (sizeof(env->buf) - env->buflen))
> -		return -ENOMEM;
> -	env->buflen += sl;
> -
> -	return 0;
> +	return add_uevent_var(env, "MODALIAS=%pOFm", dev->of_node);
>  }

Ack.

>  EXPORT_SYMBOL_GPL(of_device_uevent_modalias);
>  
> diff --git a/drivers/of/module.c b/drivers/of/module.c
> index 1e735fc130ad..80879d2abea8 100644
> --- a/drivers/of/module.c
> +++ b/drivers/of/module.c
> @@ -8,21 +8,14 @@
>  #include <linux/slab.h>
>  #include <linux/string.h>
>  
> -ssize_t of_modalias(const struct device_node *np, char *str, ssize_t len)
> +/* Do not use directly, use %pOFm format specifier instead */
> +size_t of_modalias(const struct device_node *np, char *str, size_t len)
>  {
>  	const char *compat;
>  	char *c;
>  	struct property *p;
> -	ssize_t csize;
> -	ssize_t tsize;
> -
> -	/*
> -	 * Prevent a kernel oops in vsnprintf() -- it only allows passing a
> -	 * NULL ptr when the length is also 0. Also filter out the negative
> -	 * lengths...
> -	 */
> -	if ((len > 0 && !str) || len < 0)
> -		return -EINVAL;
> +	size_t csize;
> +	size_t tsize;
> 

Ack.

>  	/* Name & Type */
>  	/* %p eats all alphanum characters, so %c must be used here */
> @@ -53,29 +46,15 @@ ssize_t of_modalias(const struct device_node *np, char *str, ssize_t len)
>  
>  int of_request_module(const struct device_node *np)
>  {
> -	char *str;
> -	ssize_t size;
> -	int ret;
> +	char *str __free(kfree);

char *str __free(kfree) = NULL;

otherwise, wild pointer dereference may happen when return below.

>  
>  	if (!np)
>  		return -ENODEV;
>  
> -	size = of_modalias(np, NULL, 0);
> -	if (size < 0)
> -		return size;
> -
> -	/* Reserve an additional byte for the trailing '\0' */
> -	size++;
> -
> -	str = kmalloc(size, GFP_KERNEL);
> +	str = kasprintf(GFP_KERNEL, "%pOFm", np);
>  	if (!str)
>  		return -ENOMEM;
>  
> -	of_modalias(np, str, size);
> -	str[size - 1] = '\0';
> -	ret = request_module(str);
> -	kfree(str);
> -
> -	return ret;
> +	return request_module(str);

Ack.

>  }
>  EXPORT_SYMBOL_GPL(of_request_module);
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index daf9a2dddd7e..93921399f02d 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -342,6 +342,8 @@ static void __init of_unittest_printf(void)
>  	of_unittest_printf_one(np, "%pOFc", "test-sub-device");
>  	of_unittest_printf_one(np, "%pOFC",
>  			"\"test-sub-device\",\"test-compat2\",\"test-compat3\"");
> +	of_unittest_printf_one(np, "%pOFm",
> +			"of:NdevT(null)Ctest-sub-deviceCtest-compat2Ctest-compat3");
>  }
>  
>  struct node_hash {
> diff --git a/include/linux/of.h b/include/linux/of.h
> index f921786cb8ac..9fe7d17ce7e2 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -382,7 +382,7 @@ extern int of_count_phandle_with_args(const struct device_node *np,
>  	const char *list_name, const char *cells_name);
>  
>  /* module functions */
> -extern ssize_t of_modalias(const struct device_node *np, char *str, ssize_t len);
> +extern size_t of_modalias(const struct device_node *np, char *str, size_t len);

extern  may be removed. it does not matter to keep it here as well.

Ack.


>  extern int of_request_module(const struct device_node *np);
>  
>  /* phandle iterator functions */
> @@ -762,10 +762,10 @@ static inline int of_count_phandle_with_args(const struct device_node *np,
>  	return -ENOSYS;
>  }
>  
> -static inline ssize_t of_modalias(const struct device_node *np, char *str,
> -				  ssize_t len)
> +static inline size_t of_modalias(const struct device_node *np, char *str,
> +				 size_t len)
>  {
> -	return -ENODEV;
> +	return 0;
>  }
>  

Ack.

>  static inline int of_request_module(const struct device_node *np)
> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index 9d3dac38a3f4..6a4f99b39de0 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -2169,10 +2169,10 @@ char *device_node_string(char *buf, char *end, struct device_node *dn,
>  
>  	/* simple case without anything any more format specifiers */
>  	fmt++;
> -	if (fmt[0] == '\0' || strcspn(fmt,"fnpPFcC") > 0)
> +	if (fmt[0] == '\0' || strcspn(fmt,"fnpPFcCm") > 0)
>  		fmt = "f";
>  
> -	for (pass = false; strspn(fmt,"fnpPFcC"); fmt++, pass = true) {
> +	for (pass = false; strspn(fmt,"fnpPFcCm"); fmt++, pass = true) {
>  		int precision;
>  		if (pass) {
>  			if (buf < end)
> @@ -2226,6 +2226,9 @@ char *device_node_string(char *buf, char *end, struct device_node *dn,
>  				has_mult = true;
>  			}
>  			break;
> +		case 'm':
> +			buf += of_modalias(dn, buf, end - buf);
> +			break;
>  		default:
>  			break;
>  		}

may Add below tag if the only issue is solved.

Reviewed-by: Zijun Hu <quic_zijuhu@quicinc.com>

