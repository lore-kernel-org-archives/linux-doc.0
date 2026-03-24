Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1B538C42C;
	Tue, 24 Mar 2026 16:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774369674; cv=none; b=qcmiBJ/H88f7wZiTmmnMAyB49QK7sGEITss32ohwvdrvb061S3WAaZ99LjqI92V4qUTllf2Hng/iDYKj5QEDv2w71ooKBDNDi4S3Vk57pYdFYPC/0Gl9n3qzOtQB0la5Bf9AmqNaD3VnlqdTLWDj075UgmBzeoUgYNbmlbSu4ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774369674; c=relaxed/simple;
	bh=FKK0cGLkcJrwZDeh9RGxbJn/5VafJOxYKY7agXj73Ro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C481lXH0VgFuqmU7mVftefTipnV/xKFrhgc2QykActknNSOXTvX759ihaI0UfawuT0Td41mGGF3ca7RqF7WHJzPnttnWS5RFOJ353qZt0yI1sSXuYs3wZ0Xx7hst2EsY1GPyzEGoZS/yiLOPTUdOGMgqJGumErlU5NR3h+bPkfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=J7v9jX1S; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="J7v9jX1S"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=sq8nauFKHr+epxRVCaZfaCNtBTPkuVzZwKmOS1s2fHw=; b=J7v9jX1SrDW9d9yC3274YRy9Wi
	nSSfzJyg5ZiwMyknerSZut0hhWnr/TSuMrggoO5HecX53ALDZUZKqgU8RbrP/bw/qGxIPVjzEotkk
	VxYa9xzM6sGSya1EYid39dSd2fCvcqxa4whTnZeyukbw/T9RRDg97fncaRnMFycFqgdWhSSv1VDVs
	Mjq7bTnj1MmPWQsdOBv21FIamoQFdwJ5XT39qk9HePbhX+UYS1trDohk3HFn5WEb/VgwiSitdMKvC
	GhF2gpPpvV9OZmIyrfxCTTwF/+rXnPTKPawTMuVVrMyGkFMcJl8/BfUiDeeoLD0e+RwXiw32Vz/A5
	W6s9WFvg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54bd-00000001t5m-2OJw;
	Tue, 24 Mar 2026 16:27:49 +0000
Message-ID: <31b9b7b7-ee21-4671-9726-cc439d88f508@infradead.org>
Date: Tue, 24 Mar 2026 09:27:49 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Documentation: document
 panic_on_unrecoverable_memory_failure sysctl
To: Akira Yokosawa <akiyks@gmail.com>, leitao@debian.org
Cc: akpm@linux-foundation.org, corbet@lwn.net, kernel-team@meta.com,
 linmiaohe@huawei.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, nao.horiguchi@gmail.com,
 skhan@linuxfoundation.org
References: <acJh0Sk4UdjaTFLh@gmail.com>
 <2ceb291b-3b18-43a7-9d51-5c752f1eebf4@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <2ceb291b-3b18-43a7-9d51-5c752f1eebf4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/24/26 4:48 AM, Akira Yokosawa wrote:
> Hi,
> 
> On Tue, 24 Mar 2026 03:09:25 -0700, Breno Leitao wrote:
>> Hello Randy,
>>
>> On Mon, Mar 23, 2026 at 09:51:55AM -0700, Randy Dunlap wrote:
>>> On 3/23/26 8:29 AM, Breno Leitao wrote:
>>>> Document the new vm.panic_on_unrecoverable_memory_failure sysctl in the
>>>> admin guide, following the same format as panic_on_unrecovered_nmi.
>>>>
>>>> Signed-off-by: Breno Leitao <leitao@debian.org>
>>>> ---
>>>>  Documentation/admin-guide/sysctl/vm.rst | 27 +++++++++++++++++++++++++++
>>>>  1 file changed, 27 insertions(+)
>>>>
>>>> diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
>>>> index 97e12359775c9..3310fb8272fb9 100644
>>>> --- a/Documentation/admin-guide/sysctl/vm.rst
>>>> +++ b/Documentation/admin-guide/sysctl/vm.rst
>>>
>>>
>>>> +
>>>> += ===================================================================
>>>> +0 Try to continue operation (default).
>>>> +1 Panic immediately.  If the ``panic`` sysctl is also non-zero then the
>>>> +  machine will be rebooted.
>>>> += ===================================================================
>>>
>>> The table begin and end lines must be at least as long as the text (may be
>>> longer). Please extend the =========== lines by a few characters.
>>
>> The HTML renders correctly in Sphinx (likely due to automatic column
>> expansion), but I agree the raw table format should be properly
>> structured.
> 
> Just to be clear, Sphinx is behaving as expected here.
> 
> The table is in the form of so-called "simple tables" in the reST
> (or docutils) parlance.  The rightmost column can exceed the width
> indicated by "==========".
> 
> Quote from [1]:
> 
>    The rightmost column is unbounded; text may continue past the
>    edge of the table (as indicated by the table borders). However,
>    it is recommended that borders be made long enough to contain
>    the entire text.
> 
> [1]: https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#simple-tables
> 
> So, it's just a recommendation, rather than a requirement.
> 
> "Grid tables" have a stricter rule.
> 
> Hope this helps.
> 
> Regards,
> Akira
> 
>>
>> I'll send v2 with this corrected.
>>
>> Thanks for the review,
>> --breno

Thanks to both of you for the edumcation.

-- 
~Randy

