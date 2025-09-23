Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE947464
	for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 05:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758606932; cv=none; b=U+lTedvzRmfsV64XoUPl4kRoyaDhOpj4Ydcsqr94XLqBlso54Sk7MeKPebHRABn4GCDhxr89y8XZXU79MUN9N6uwJg61YBD3bzaoV3qjtr+HCDTI9WH2W57LEdgYAYifb3+JRQO2VGzQs6Pp3ugEwspwqdi/z8aWRuPh2kXmvrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758606932; c=relaxed/simple;
	bh=SoPfLk2DSDCpNsQZD7sbEkXBsstIKZ4MGHGrubKHjys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H275caPr/qSjOjEZHVsiKwcM1XzEf6dxvoIXqF2Attukp5/gfCnJapVLO8WalprrACLvyh8q8WZs6Aio7fucpPELnHgHjR0lNsBHFqVj6j96+aVgwdWq772uiqDui+K0m5uxyYgrM2Nf9MYdR9If3/jqDbbUrjtucypoB8qGqsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=C4K0JJSU; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="C4K0JJSU"
Message-ID: <06facb7b-7d1b-44fd-b530-9a5300db7d4c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758606928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rd86CekFRCCLc7IBqjmg6J/oTeL60UxfJLHsCJAGs00=;
	b=C4K0JJSUHWCq0hAzivX+hcOLVF4wlwo4/iqy3zE+J6pY0R+ciKmC5ahYEi5jpwEPjwMkTi
	qpDlrasjAE5P52wQQq3+gso0M6eHh9ykW/hK21DVHxg2pCOM+orvHdpqot3z4IyUJF4hR2
	iHvCzobMFHR+0NdSezo3S4XFy/eqUN8=
Date: Tue, 23 Sep 2025 13:55:20 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: =?UTF-8?B?UmU6IFvlpJbpg6jpgq7ku7ZdIFJlOiBbUEFUQ0hdW1JGQ10gaHVuZ190?=
 =?UTF-8?Q?ask=3A_Support_to_panic_when_the_maximum_number_of_hung_task_warn?=
 =?UTF-8?Q?ings_is_reached?=
Content-Language: en-US
To: "Li,Rongqing" <lirongqing@baidu.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: "corbet@lwn.net" <corbet@lwn.net>,
 "mhiramat@kernel.org" <mhiramat@kernel.org>,
 "paulmck@kernel.org" <paulmck@kernel.org>,
 "pawan.kumar.gupta@linux.intel.com" <pawan.kumar.gupta@linux.intel.com>,
 "mingo@kernel.org" <mingo@kernel.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "kees@kernel.org" <kees@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
 "feng.tang@linux.alibaba.com" <feng.tang@linux.alibaba.com>,
 "pauld@redhat.com" <pauld@redhat.com>,
 "joel.granados@kernel.org" <joel.granados@kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250923033740.2696-1-lirongqing@baidu.com>
 <20250922204554.55dd890090b0f56ad10a61f5@linux-foundation.org>
 <9067a88d-f5df-4d6e-b3b3-2e266ebcf3d0@linux.dev>
 <bbdc2b5c2b374ed1801113148a72d83c@baidu.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <bbdc2b5c2b374ed1801113148a72d83c@baidu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 2025/9/23 13:22, Li,Rongqing wrote:
>>> I assume the same argument applies to the NMI watchdog, to the
>>> softlockup detector and to the RCU stall detector?
>>>
>>> A general framework to handle all of these might be better.  But why
>>> do it in kernel at all?  What about a userspace detector which parses
>>> kernel logs (or new procfs counters) and makes such decisions?
>>
>> +1. I agree that a userspace detector seems more appropriate for this.
>>
> 
> I think the user-space maybe flexibility, but incurs relatively higher overhead and is less reliable. When the system hangs, this task may have already hung as well.

Emmm... if the system is so degraded that a userspace monitor cannot get
scheduled, it's very likely that khungtaskd itself is also struggling to
run, right?

> 
> 
>> We already have the hung_task_detect_count counter, so a userspace detector
>> could easily use that to implement custom policies ;)

