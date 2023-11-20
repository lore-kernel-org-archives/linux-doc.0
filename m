Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55691FB5
	for <linux-doc@vger.kernel.org>; Mon, 20 Nov 2023 03:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JoUsK73I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4606FC433C7;
	Mon, 20 Nov 2023 03:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700451065;
	bh=uxxAGRWdwqBmgwfEnUwOzhTgqvnU5E0LeL4YVdvlZk0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JoUsK73IFpg6cVkHckq09vpfXPv+i83dvhY3VhS/9lDU4sNMaF6A7g/mRX7jRLmEj
	 Th4MxtGaH3qSdfJwqlJuzpU9+Gre6aF0bcR1Azc17UqAk7wEcXzXT5rOI8xlpFAyka
	 q6S+d0ytUZ++AuKTWzsAltANwA438nv9zmZrRxvy/bJmx3wzOgrNhtNz3J3Uv0HOnX
	 dmoROY2ji976QOL9xNQvclfXDzBL0OQpCzlXquKMSBkvmIzr+zeGY4MqrAWthtuPhK
	 5YRRLujXDPJQ2k8GBWRDS8NdEDwsJpIEisk6WfA2Fjchn1fLAq0twaf0qqoV5YCFeF
	 7pZ/eyR5ZFmIg==
Message-ID: <43466ecc-7218-e813-7a4f-bcce30f9b3fb@kernel.org>
Date: Mon, 20 Nov 2023 11:31:01 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] MAINTAINERS: erofs: add EROFS webpage
Content-Language: en-US
To: Gao Xiang <hsiangkao@linux.alibaba.com>, linux-erofs@lists.ozlabs.org
Cc: Jonathan Corbet <corbet@lwn.net>, LKML <linux-kernel@vger.kernel.org>,
 linux-doc@vger.kernel.org
References: <20231117085329.1624223-1-hsiangkao@linux.alibaba.com>
 <4e99d1a3-026f-b5f0-fd15-fba57692d973@kernel.org>
 <056d09c0-eb0d-2092-0766-bf253a9d8751@linux.alibaba.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <056d09c0-eb0d-2092-0766-bf253a9d8751@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2023/11/20 11:23, Gao Xiang wrote:
> 
> 
> On 2023/11/20 11:18, Chao Yu wrote:
>> On 2023/11/17 16:53, Gao Xiang wrote:
>>> Add a new `W:` field of the EROFS entry points to the documentation
>>> site at <https://erofs.docs.kernel.org>.
>>>
>>> In addition, update the in-tree documentation and Kconfig too.
>>>
>>> Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
>>
>> Nice work!
>>
>> Reviewed-by: Chao Yu <chao@kernel.org>
> 
> Hi Chao,
> 
> Thanks for the time and review! but I've already do a tag this morning
> for Linus later so it may not contain this tag, sorry about that.

Xiang,

No problem, it seems I replied a little bit late. :-P

Thanks,

> 
> Thanks for the review again!
> 
> Thanks,
> Gao Xiang
> 
>>
>> Thanks,
>>
>>> ---
>>>   Documentation/filesystems/erofs.rst | 4 ++++
>>>   MAINTAINERS                         | 1 +
>>>   fs/erofs/Kconfig                    | 2 +-
>>>   3 files changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/filesystems/erofs.rst b/Documentation/filesystems/erofs.rst
>>> index 57c6ae23b3fc..cc4626d6ee4f 100644
>>> --- a/Documentation/filesystems/erofs.rst
>>> +++ b/Documentation/filesystems/erofs.rst
>>> @@ -91,6 +91,10 @@ compatibility checking tool (fsck.erofs), and a debugging tool (dump.erofs):
>>>   - git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git
>>> +For more information, please also refer to the documentation site:
>>> +
>>> +- https://erofs.docs.kernel.org
>>> +
>>>   Bugs and patches are welcome, please kindly help us and send to the following
>>>   linux-erofs mailing list:
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 97f51d5ec1cf..cf39d16ad22a 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -7855,6 +7855,7 @@ R:    Yue Hu <huyue2@coolpad.com>
>>>   R:    Jeffle Xu <jefflexu@linux.alibaba.com>
>>>   L:    linux-erofs@lists.ozlabs.org
>>>   S:    Maintained
>>> +W:    https://erofs.docs.kernel.org
>>>   T:    git git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git
>>>   F:    Documentation/ABI/testing/sysfs-fs-erofs
>>>   F:    Documentation/filesystems/erofs.rst
>>> diff --git a/fs/erofs/Kconfig b/fs/erofs/Kconfig
>>> index e540648dedc2..1d318f85232d 100644
>>> --- a/fs/erofs/Kconfig
>>> +++ b/fs/erofs/Kconfig
>>> @@ -21,7 +21,7 @@ config EROFS_FS
>>>         performance under extremely memory pressure without extra cost.
>>>         See the documentation at <file:Documentation/filesystems/erofs.rst>
>>> -      for more details.
>>> +      and the web pages at <https://erofs.docs.kernel.org> for more details.
>>>         If unsure, say N.
