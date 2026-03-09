Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010025.outbound.protection.outlook.com [52.101.56.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4932EC0A4;
	Mon,  9 Mar 2026 18:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773080786; cv=fail; b=i/4BYa9o7VMWqftBQ8fyihPHlqVUOC2k2bTktVfur29gxn/OLE2n0O5/y0ye8owvW4hFmWowS98alzvnLebh5NeRXmCSRe9UYoreBlJ+jnqx+y+z7ZiYl4qJ3RVdlmg1GmWrs+Elw9tVe0pBzHcwj+3IU7J97QzDWrihKbFXAsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773080786; c=relaxed/simple;
	bh=86Fuw+/fbbGXNYAAQsLgqx5CLh3wIMMltCbYHA8j0T4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=D5tJAnrVfD+BcNlFyroFKAtBTP6WJgV8WyiUZLjUVEAoleeNuDxWJq0PBPic7O4k/rvg4mtUzJ3q97taJk4PxgEK67vM0hjvqpqWtugV+xrkcPeLvRkdyoKUPJF9s5PwD2HiF51FliSdwbpJWTcXjDBui1oHgKxP29gGzIVT4wE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xeEEk/jr; arc=fail smtp.client-ip=52.101.56.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xeEEk/jr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VnDGkwPk9ay/TSqCblkkUYCgKIh706eN9uAUXf8JOV9cuHFrHg4oGQTRAxx+6J5u9LPx8HPaWlT8YWs+ZTbXkuFFNbIguad2RDRcTh02OlS264Jm1HQRL4olEA2XNR5/BZa44dFueSPFcAB4Y/GMvdMEl0rGSjZUeBB83234+ddJe5Uw6Ykw8jakpVsUCj5prEgR0mBatxbMuvJcJKEWFdAg59RnpJzmBpyHqPz2Z5wLNUnUNPo6JssUiLXjWICdMlIIl1VkQxevESAwBMdnWJs/WzANfuoTTWd93ANoZ8w8O/rXhYG54IE692EmYVqCzGQgdD3P2kUkJct61uutFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TtKG/6VK25Gl7JYUn8gxbQzlED5CnAtT+7BLr0BKffY=;
 b=SiJcAODUG+y93qRNOKEmVLIW+BuyrI2WUTTBZ5qGrpIKH2qoo52Q9eQ342FuIuRzt2c97sI79m3fQjDQzfm6i/gn7ajHStfmrGGZ5flr30E8t4/eNl+5PF9BqXNLsVjw1lg4ofMvojm0OYuzaXR+HWl9lHmKALeWNyyo6VfV9i2ujVWxExk+suO59r07eaQpkUfzlTLoye0UXyMGAHTvhkdBsjoYPkmUMiQuw2jQH0me47vFc5Mh3psg6KWbpa4fGD/cyVg+jNn6VHQWXvBI+X96/Gl0F+zyvo1jlnVlvFAvCAg1Tan27EcnIuzA68WK9H+G73Lf+AGefefbuq4HxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TtKG/6VK25Gl7JYUn8gxbQzlED5CnAtT+7BLr0BKffY=;
 b=xeEEk/jr7Xa9kH+BEIwnF1xHG0S0jQFZnvymOw/Tt2+7uGWsO0psxVQveyS3TElfjOBVCVodIkwKgUE8AjyrOS58rtjwFLXyiYZ9JDBz1W/AA6K/G/PBgbM/JT7xS71+BQyWzlu3RGgppHWCmpbI4ePcwtxGHNPrsMQeYD1sh20=
Received: from MN2PR16CA0058.namprd16.prod.outlook.com (2603:10b6:208:234::27)
 by MN0PR10MB5982.namprd10.prod.outlook.com (2603:10b6:208:3ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Mon, 9 Mar
 2026 18:26:19 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:208:234:cafe::fe) by MN2PR16CA0058.outlook.office365.com
 (2603:10b6:208:234::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Mon,
 9 Mar 2026 18:26:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 18:26:17 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 13:26:15 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 13:26:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 13:26:15 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 629IQFUZ1598363;
	Mon, 9 Mar 2026 13:26:15 -0500
Message-ID: <8cd7ad67-f279-4864-906e-f4166fcd4cc4@ti.com>
Date: Mon, 9 Mar 2026 13:26:15 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: driver-api: device-io: Split out relaxed access
 mention
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260303183628.80776-1-afd@ti.com>
 <87a4whvura.fsf@trenco.lwn.net>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <87a4whvura.fsf@trenco.lwn.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|MN0PR10MB5982:EE_
X-MS-Office365-Filtering-Correlation-Id: 91d297e4-4116-4d50-f58b-08de7e095ad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	p+A2wV31DOYQmXGk9hFmwE8Ysq0J70zicmxAfHVKfdKOyJ/gJxvtcKMEguNxPdMO/zMuCTKjEJn440fxO2yX/VTZ9W9ihLA4eEwHGgEQpwLgEHmGwELJE0b2u2MpGLg2dUrYZtVSmh6u8RA6ECkYFOgDlEtZWhfJ4y2xI0siwvkdIZBpjF46H/iPzz+BVEcnxfrtYfuAh5xVXV1T3CQ8EVs8cwAfaToiI+xhgGFURcGqp7xZlEkSEULgM8l5dxuTXRpEKAtLHzl8W5khVah3gpN+YQWfRu9TqtdpjH3Uv2xxE34Lz+VHvc8jTL428GQNj+oJtc5DicNLhQER+COZVwJqxn8wjOsvYl8GiJ5jxpMSksCbdEhL9emQkmUn/5xPVLkV/qfVqpewPWKMImP3sRpoQzk03OVfrshP/DDCmmhcw9Ot73QGPWunEjHr3LhsqevCq+XyDxYKXLAr0oToiXrPRJcuzfKBMH3kV0nBL+C4ONEQs7H3evoo67QVDrJCq4SrgN3wE4Tm+G0LLKRwWBp8DH1JrEd9U4QHbA9C2EbA4Hk5O1g+RIXtnH/bY3JGeDKzdNSIpayLknO8OuZcKz9UUBIUvOzeSN7tjBCgVRgu3QofadeZxse8VeIPVpQWb3FwzzQ7ZeRY9w5PPMiOqkya0XWtMdkUxk8M92uPtLLLdpEiz6xdPBL5IUwrbhSbF7bwGTmPXYbsJoydxmgfLYqz+NjwHwbPSYOaTAru7+kXsU1Vvqoy8RgOZ2StRO3d4NAtSSgBXU4F81e5BNk73w==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	u1IixdNPCKiL3PlWQFvflLJWwkDASPKQg9zJx8+QvBprjjKSKaL5r5fsyOajpMp0nVe1LVMhveCl+OTkqwDNf2lrJmiqoMIgaS+Zd3pNXcd1r0uLLc4L3Ujq5aOHz5MpxRE1pEN2woFnLoJcbBHLFEWQ3oK8HWExP3y2I6Xe5qb2MUr8k3BaRB+/2PCa6VXzw0T/p8lb8whUv+Qh0lvVUu97fftGqTm2cOiLTTBHZ6XTqiKPgIy5iuAHs0ZuWn9Jw280FrHjWnGJbT+TyPb9y+jc1iRly7y3EtKKc6ZDB9nWnWxP7XcDXMpByZZdkUnludT7LDT94yOH828Nn4doryT7CC6NQu/VCcp4PKCuzzV0qZiIOvHDhR5UAiaPS27tOzLiK6JLHZJrxhJX/CA5y58J0ZhrXcZTZqA6AeOw7gECcpWfjEWhBeJXU/P6Tr05
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 18:26:17.5980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91d297e4-4116-4d50-f58b-08de7e095ad8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB5982

On 3/9/26 11:21 AM, Jonathan Corbet wrote:
> Andrew Davis <afd@ti.com> writes:
> 
>> We list all the normal non-relaxed device io functions first, but also
>> list just the "read" versions of the relaxed device io functions.
>> Instead of adding the "write" versions to that list, fix a statement
>> below which should describe the relaxed versions so it is understood
>> that both read and write have relaxed versions.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>
>> Changes for v2:
>>   - None, rebase on v7.0-rc2 and resend
>>
>>   Documentation/driver-api/device-io.rst | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/Documentation/driver-api/device-io.rst b/Documentation/driver-api/device-io.rst
>> index d1aaa961cac4d..5b94973f44762 100644
>> --- a/Documentation/driver-api/device-io.rst
>> +++ b/Documentation/driver-api/device-io.rst
>> @@ -56,7 +56,6 @@ Both read and write accesses are supported; there is no prefetch support
>>   at this time.
>>   
>>   The functions are named readb(), readw(), readl(), readq(),
>> -readb_relaxed(), readw_relaxed(), readl_relaxed(), readq_relaxed(),
>>   writeb(), writew(), writel() and writeq().
>>   
>>   Some devices (such as framebuffers) would like to use larger transfers than
>> @@ -67,7 +66,7 @@ guaranteed to copy data in order.
>>   
>>   The read and write functions are defined to be ordered. That is the
>>   compiler is not permitted to reorder the I/O sequence. When the ordering
>> -can be compiler optimised, you can use __readb() and friends to
>> +can be compiler optimised, you can use readb_relaxed() and friends to
>>   indicate the relaxed ordering. Use this with care.
> 
> ...and we really think it's better to not just list the functions that
> are available?
> 

They are listed, down below in the section that explains the _relaxed() part[0]

Up here at the top, only the regular non-postfixed versions are listed, except
the "read" relaxed, but not the "write" ones. To be consistent I removed those.

Maybe it would be better to remove the whole list here at the top since the
documentation has been expanded and this list up here is now nowhere near
comprehensive of all the variations available.

Andrew

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/driver-api/device-io.rst?h=v7.0-rc1#n179

> Among other things, the list would then automatically link to the
> documentation for each function ... assuming, of course, that we ever
> got around to documenting them...
> 
> Thanks,
> 
> jon

