Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011E51ACEDF
	for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 03:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758599984; cv=none; b=a/T8MQSt4JLGdLcjsr05U+UyaBMOh7vrTrj0DnhcnNi0isOpIV310sD9fT80pZqiD2qK7Pbc9LzcIqiexY8CpkQyerqfLyZwIvG5YWCFpk4SDlc2DhGCRI8xgAF6V+Ndgtw9wwpmEFTpyFt7HBxGJ3MXz7Y74uVx0XBOtf2/I/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758599984; c=relaxed/simple;
	bh=stufo5VaflHTD5Dch8msOtonFZ5qNNcz+IiyCZiyGe0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nO0iABuQF6HHD12R0ZJQXfAaOmaLDINGTc9f41VQFSeO+0rvvhI5Wr8lc57vnF8xQaGT54U4CBrLL0M78TYv5W9fD5VozEhEkw2WZpxz+1iVRj4ot6zwy4jNayWpoLZJrBfrMn044bgUAGGnRZqcLKELHXdZCcIDdBBjrm8NKaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Drjoyeyh; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Drjoyeyh"
Message-ID: <9067a88d-f5df-4d6e-b3b3-2e266ebcf3d0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758599979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wBb7AifhcOJYVqzVR28gnq9RZ3Lo8WspOuJNKw0BLWU=;
	b=DrjoyeyhpJzeaP9BvJa1Zj2N6qGxchqojKau7q5f6FSO7Y9Y42GNjix0LLb8EKXzkP9Hp5
	NhJ/rTh7jV2hX0Rn++ixLA1iJSV46Yd9q7zVJVj3r0ocBnWP/ACAWDN8iLL5PU08UTxM0F
	JBwmOYsd4uAYrhHjwp04CMtS+uDAd44=
Date: Tue, 23 Sep 2025 11:59:30 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH][RFC] hung_task: Support to panic when the maximum number
 of hung task warnings is reached
Content-Language: en-US
To: lirongqing <lirongqing@baidu.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: corbet@lwn.net, mhiramat@kernel.org, paulmck@kernel.org,
 pawan.kumar.gupta@linux.intel.com, mingo@kernel.org,
 dave.hansen@linux.intel.com, rostedt@goodmis.org, kees@kernel.org,
 arnd@arndb.de, feng.tang@linux.alibaba.com, pauld@redhat.com,
 joel.granados@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250923033740.2696-1-lirongqing@baidu.com>
 <20250922204554.55dd890090b0f56ad10a61f5@linux-foundation.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20250922204554.55dd890090b0f56ad10a61f5@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 2025/9/23 11:45, Andrew Morton wrote:
> On Tue, 23 Sep 2025 11:37:40 +0800 lirongqing <lirongqing@baidu.com> wrote:
> 
>> Currently the hung task detector can either panic immediately or continue
>> operation when hung tasks are detected. However, there are scenarios
>> where we want a more balanced approach:
>>
>> - We don't want the system to panic immediately when a few hung tasks
>>    are detected, as the system may be able to recover
>> - And we also don't want the system to stall indefinitely with multiple
>>    hung tasks
>>
>> This commit introduces a new mode (value 2) for the hung task panic behavior.
>> When set to 2, the system will panic only after the maximum number of hung
>> task warnings (hung_task_warnings) has been reached.
>>
>> This provides a middle ground between immediate panic and potentially
>> infinite stall, allowing for automated vmcore generation after a reasonable
> 
> I assume the same argument applies to the NMI watchdog, to the
> softlockup detector and to the RCU stall detector?
> 
> A general framework to handle all of these might be better.  But why do
> it in kernel at all?  What about a userspace detector which parses
> kernel logs (or new procfs counters) and makes such decisions?

+1. I agree that a userspace detector seems more appropriate for this.

We already have the hung_task_detect_count counter, so a userspace
detector could easily use that to implement custom policies ;)
