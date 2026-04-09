Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A71A33B6E1
	for <linux-doc@vger.kernel.org>; Thu,  9 Apr 2026 20:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775767939; cv=none; b=LBOaTbyLh+iL9pFhL40BRTWha+vcqZbTlz6HoCNpGwAwkWCasb5iIdhlyH7P1dbkFk9B2A0W9Y/8aFuloeChDHuGXAHgVUbW5sV0uqzN2GD9QQKfBdC7ULCbbA4IDf0WtjVIUnh1+kz0tdic1axAAI0n10XysJrqnR9NRackKk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775767939; c=relaxed/simple;
	bh=Xdl4SEPIG1bTe8bbKcDft3BVAeSV/iIOez/utcM7wRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nS0JJZYqV1BSPAsMCiLX8f98b7xSTKpE1+2eM6878/uPjF7+7Me10wvXhFcCAcgzTO0RuMGfqAAQHGWO8d3JMjsPezNtAhBckH+1THHORAQFV7LP4mHnmcyVVjRK3RRIYW520XZPEXcrj007Pni+SKLlYQmhSK2YFYIOKKefVZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=erglGhfy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MDmfj+T6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="erglGhfy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MDmfj+T6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639DbjPk3934532
	for <linux-doc@vger.kernel.org>; Thu, 9 Apr 2026 20:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4YgjMxSPty1CRZ5O2vYOSJef2/ASxr164jwUcV48qCQ=; b=erglGhfyWNLs2xhs
	hqwT5Y0E58DH/3rzJnDP8Mb0HJYivfLS9OHlovYOb7XIpm0WPCGO1USuxhcnKLEr
	G3s2Dnt8gpIc+OFwenIsc3J+ZHs22ECsu0M9KGnxzZdlGkkzKa9iYR0xcC2l7ae3
	ZyMsno5XuK0Y3TRIhiVZAZlSASFSycf3QA0TNOOVrvafXAujeq8CTwlIk8rxeR7S
	NIdc+SoU0HHpJYUHfmdE97nMzCmXjEnm40+f+D780Di0pyU36k7fSB1VcvmgC26U
	M5OI8OubEVUfqFIexP+PCh2S2k25C47qvoH2yXvd4NFpeGL8koDnHNwzggv4zkOl
	/ruLiw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded5s9g5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 09 Apr 2026 20:52:17 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c68a134df8so1137892eec.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Apr 2026 13:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775767936; x=1776372736; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4YgjMxSPty1CRZ5O2vYOSJef2/ASxr164jwUcV48qCQ=;
        b=MDmfj+T6t9G8e7l18DfskcwezWKAQfToJMy1jdAriIajjDtFO+FESgUPfchOMI4F4M
         SaxwbdJtaEY+QB5RD1gniQwlErSHXJ02qIcvSGr1xKaQqxH9rY41tfDO9inH2XBSGUJ0
         UocLUY0x7JdWxlsznZK1oNXkCOR+fYmX4gLMbgvcXfXnDBIHlJPenPC65UfTQNGGnVB6
         bC3psVn6NJF8J9ESTL/8+7Mxz3h2Ns9HqEviZd8pxwNDDKRDi0JRVyN15yvOsV6ZwXYb
         RSiVRHwTJrA9hcdDdYbZmnUIHUXrV6KNdyW1/jxDQO3YoOdR5rgoZzYp7IWJXWY/1Tlw
         CI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775767936; x=1776372736;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4YgjMxSPty1CRZ5O2vYOSJef2/ASxr164jwUcV48qCQ=;
        b=axmjM1RXmsfgCPTGjX22w0Kpz+W3y2h0IsSpE8qZl4wY+sHYwo1wU1L+/+FM86Hf/D
         fCRmtMs3mZ8L7fbiEDa7wbLnrOxvuZ2UXJlIP0kirh0dWl3zH7RDDusBtOpl/f+6Dh3c
         vMyLDcbjBSQcg5g3p/zxz6lQAAnoPdrTo2s9iCh9ztdg81/G2JCuqgwzPLPXQ4dsiQb3
         kviZIRtqQkMjTc7bt7jxATS+84/NKgedZ9RiKNONeRyoifmxIX/ZEpVrqMxsGRcl+IGV
         b+30ir3eTYXamT9SRWd3+YrtDOL99IXKuzR1ycFxII6YYa0I9NxPn91dQbZNHFwVP8zJ
         7LTw==
X-Gm-Message-State: AOJu0YyYqGwJqloKSB4hesh7fYL/wafLB4/8Nba9M38FMiyJhrClPot7
	V3K9ESVspECRTCobJwLT7i2U0o4dPxCwXiBCDaIs4ja9YjDoIATmdfnVPNC01Ug9HZ3JXgGRc/5
	lQ0bc8VM0QxXBDkI1rfdhBvcOEOaCc0kqswXHQ3gihTU3gCn9iAU6/Z4VwR7Px/4=
X-Gm-Gg: AeBDievnywL7A/arR9dZaRUEEwVqMtOVdoowjdKAYd7LpZjflpWTIhYe70M+4PTorYg
	AZ2NyKHLXXpvlMNrFY2h31VXeBhwxR+R+lkT1kT6YlKaq//vhqc4QHmiIsXutvwyWSWeLntMIP/
	vQAs0UjiNLxgLGRODVwaojh2z9EVUWJ+r5Hw7iCaPOoMfxcrjawU/lATBGhESbEqVNL/AsDBqLI
	grxmLOlxSprhcZ5syIx8PWaao1Y1/gRFoNA7Dp5NWJQTBeyqF701wrPcka6cifRsbMga7E+1IxJ
	yV3Kin5ynfgTAeJWJrYljFEqGe/U2zNJ85denPQZpokPhHwnX933+ZvO7kt1cXxYO94bELjwCtT
	c8bJJNcOZ3Xqc1WMuvv5gGvrdynXYtDisZnACVSSGhwV70WCY0KmPNAmY3zHMBNjKdsCDwekaLg
	U=
X-Received: by 2002:a05:693c:3117:b0:2d3:dff7:13ba with SMTP id 5a478bee46e88-2d5871afaa7mr376371eec.5.1775767936362;
        Thu, 09 Apr 2026 13:52:16 -0700 (PDT)
X-Received: by 2002:a05:693c:3117:b0:2d3:dff7:13ba with SMTP id 5a478bee46e88-2d5871afaa7mr376348eec.5.1775767935665;
        Thu, 09 Apr 2026 13:52:15 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d5632a64easm1452705eec.31.2026.04.09.13.52.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 13:52:15 -0700 (PDT)
Message-ID: <2eda7d10-e4a9-4ca7-ae73-bf9c0ca8fa33@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 14:52:13 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/9] bus: mhi: Centralize firmware image table
 selection at probe time
To: Kishore Batta <kishore.batta@oss.qualcomm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-4-47ad79308762@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-4-47ad79308762@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QJ6YtwHqY93-zpZf-fvkzLpSOAdgFMaZ
X-Proofpoint-GUID: QJ6YtwHqY93-zpZf-fvkzLpSOAdgFMaZ
X-Authority-Analysis: v=2.4 cv=Ko59H2WN c=1 sm=1 tr=0 ts=69d81181 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=AsT2qU_2Mam4ECEOgGwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5MiBTYWx0ZWRfXzqpcWuB2+YQ+
 CSMQA+PGdG8k2m9TPp2v4mJrxBo6eFZ42T1KQqECC+eGHh6o1gsoh2ad4qRLos8OSbZ9mROl+Eh
 bXyPTGPvKKFnUhK/xQ5v7l1jPuvAIKTvBJllZPJkC5JsQULNvqZkaBhzLebzbGdZICof6Qw6WmX
 ikSSVPpK4C8UHn0nzDQYKxMs9w+VrcEeyckTf0oi1OSsGXT9VNxeuuBs2oI1p2qtp5f14Mmc3yt
 Gs6at/QRy0JmyMqLGOzGZZwnH9uHDc2vwvTjaKOyPaqzfGPxN3ockEEcfLwaf4fbP+rhxaj0+EX
 FHTnurOFAvNVdIHKpKqLar/nmXm2cCYiSGZ7WkWh2pF4PkSSJxCwRVaILlj5wxhfaI6kTD2inMg
 WrQTFq98RvUxewSs/n5D+mS7qna8/NKbHtrbZBOviJbSKC5YAZhUHCLHjnaarZvh1JVkkBnPQui
 y13+lDL/UXfHv5dh9LA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090192

On 3/19/2026 12:31 AM, Kishore Batta wrote:
> The Sahara driver currently selects firmware image tables using
> scattered, device specific conditionals in the probe path, making the
> logic harder to  follow and extend.

"to follow" (remove extra space)

> Refactor firmware image table selection into a single, explicit probe-time
> mechanism by introducing a variant table that captures device matching,
> firmware image tables, firmware folder names, and streaming behavior in
> one place.
> 
> This centralizes device specific decisions, simplifies the probe logic,
> and avoids ad-hoc conditionals while preserving the existing behavior for
> all supported AIC devices.

It would probably be useful to mention this is in preparation for adding 
QDU100 support, otherwise this reads like it is just change for the sake 
of change.

> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>   drivers/bus/mhi/sahara/sahara.c | 66 ++++++++++++++++++++++++++++++++++++-----
>   1 file changed, 58 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
> index e3499977e7c6b53bc624a8eb00d0636f2ea63307..8f1c0d72066c0cf80c09d78bfc51df2e482133b9 100644
> --- a/drivers/bus/mhi/sahara/sahara.c
> +++ b/drivers/bus/mhi/sahara/sahara.c
> @@ -180,6 +180,16 @@ struct sahara_context {
>   	u32				read_data_length;
>   	bool				is_mem_dump_mode;
>   	bool				non_streaming;
> +	const char			*fw_folder;
> +};
> +
> +struct sahara_variant {
> +	const char *match;
> +	bool match_is_chan;

This is dead code, add it later on when it gets used.

> +	const char * const *image_table;
> +	size_t table_size;
> +	const char *fw_folder;

This is dead code, add it later on when it gets used.

> +	bool non_streaming;

Please run pahole on this structure. With the interleaving of types for 
every other member, I'm expecting there would be quite a bit of compiler 
added padding.


