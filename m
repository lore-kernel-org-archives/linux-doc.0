Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD43374E4E;
	Wed, 20 May 2026 08:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264364; cv=none; b=qStKGVHLuknIrOqbLzEdAvhW4xmZz5shdpu01ntkJ2atJiKYJRovS++8DioCyVCL+QFeuPpXbhPZ8QyHMIJMsH/ixSBKk5IO2Rz0yAH1qHoxdN0xFBFz21fer34RRTV+IEWIL8Bu1MkCUpuand5a5Z4alzc9+2k/DvT5yzlvlkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264364; c=relaxed/simple;
	bh=gs853bop4kkL7HTCekE+oDlfVu/SjBw5Q0VX/QiWKBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bqVeYdHHdQgLI4vCNio8x09Obxf8vObcMnvxcaBwi31f3vPlptuT5L6HB5/hRMRJhEHt/jAvIqb0SjmA1vCyzzMp6ot+xtyADSxhrEa1IZqcku7t9AeB/7nast9QytOmQoF0rywuJk+qUJZ8+NbibrPvNZw8HqSZCWSh1dKQl14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=YpsM5/Qj; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="YpsM5/Qj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1779264344; bh=HZsvl46qWQHigxum3FRtg7Qi/0P+9ZbmcLxGnn2DTnE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=YpsM5/Qj1KURlIBKXLJLEH+lwLnh88W1EEgBZLjhrAelBCsljXVjJJxjryt8i9wQ0
	 vjmllYVYxP0SnVFg/nHCbxoshrpQ2OQ0kEfi8P12VeplLEx29Fwq4T+9/IbWOoh9yc
	 yzQK+SsclykiiRNEVLAq70fiOdbo09A4VZ9etRi4=
Received: from [10.46.141.45] ([36.112.3.68])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 16885226; Wed, 20 May 2026 16:05:40 +0800
X-QQ-mid: xmsmtpt1779264340t8p8jvwdc
Message-ID: <tencent_A8707EC14361A4E2A6C762850BE5994F7105@qq.com>
X-QQ-XMAILINFO: M+sNXJc2Y9oMgafrCSjOBLoEkBVammffmwkVL4pQz/KyGooagbxo2UFNtXEbLh
	 rDi3OJerN0VkNlalFAXGmVO8SqJsbrApke7cZTPXErJbye8yUYiyjtnXucuGGKdnPS4ZWkMjORLL
	 E/S7d3vE/rBeteK1ca9TKRKKT1uFOqYG3/ez+2SyeelQ9WzoKiruO2ndJy9pJJqUvwcpYWBXuXgU
	 SB1OUOa5/s09GsqQiEboiOv8DeyUHSmVFNaaPqW9NSM9UaOhyVDpfUdTkkLc8JvwGcqZyjfzcdGH
	 CrPm/FnQvtCHqRF9zAhBXkef+5KK/XcI6I/tN9Gi3O+UVe1V3BQsZ3DHbfBWHMo+uRffnsz/ouXA
	 9eGT+k46yxGZnzw0ETTaaRUieH4azQ02o8fccCNc1OB/uY4pUdwnVfX1A/s86AXHGfWrFgMLSUKi
	 1UuF6L0327zC412Cmf9QHLZpqfBv9xkf3fnMQBDvkKMlF6beR6gntKXcPzwehCZcy5k3FwisK/qd
	 8vgbcbJf7FusMgZ+/BiHj4OC125YJ6G7g05kz6065sJ30fSX/qNfvihpEFwpmWW+Z4ZdwdUPYybT
	 QqBxihj3O1JSe71SMHPcdUGT/vBLD1AqFlfuoDCZi53GIk3JyPCEG0RKNZm2nn0l9tKw9DyASRfQ
	 FdiAv3btEKFA4HQFa710G0GRp9THDoMAtwtcsfZNWXSaEhtz90Mk53ELMfpxDyXeWiDwWen8IHUl
	 MR6OaNi19UkF7jYkhWRHkjQvi6UfxueW/oMAnbS78suVnTK/5deKb09RXJ+yB9sbU6ZK0eJTF8Y8
	 3AslxoulvrFgJRYmNRkZn+NRYA2KKGZztDz7NpU/gEHwPzOeK/Pus1H/KN8/9+0M0AwbVAGxtb7G
	 D35TFXXX4USBwqFerf3vi6rCrIwWsw1dxWF8dvGsxUgpZ/adCtbCJvLk5JstUfWNEnSQY/vBgNk3
	 1fnbPSpVkcsTQ/b7F6LuDA+PyEyGLta+dSQpURXB/nZNf9vYZZK9xXuA7nRQ77T1dMFpz/eWSe6c
	 bZYMqPCSMIhm1JxME0UXWO5XEZAOZMWC5WhpFbEJ6SvNZFk27zSEyQcSCRqqZl+pfhHXmfFi5hKf
	 Ib3Xw2hnwwXOjgp8Iv6sQoa8RJKgKrYNLlcEtw
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-OQ-MSGID: <ff735130-77be-4c2f-99a6-aff64d95457d@qq.com>
Date: Wed, 20 May 2026 16:05:41 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] mm: support zswap-backed anonymous large folio
 swapin
To: Alexandre Ghiti <alexghiti@meta.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
 Kairui Song <kasong@tencent.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Nhat Pham <nphamcs@gmail.com>, Yosry Ahmed <yosry@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, David Hildenbrand <david@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Barry Song <baohua@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chengming Zhou <chengming.zhou@linux.dev>, Baoquan He <bhe@redhat.com>,
 Lorenzo Stoakes <ljs@kernel.org>
References: <tencent_8B437BE4F586C162950BF71954316C1EDB05@qq.com>
 <CAEmasaV7ejxqb9-wTT=7xdt+icxj-ZvdSLkSoC6X5i6NMfsKPQ@mail.gmail.com>
 <tencent_BE4D8C052157D1B38BA2F9FCA287D4C8E606@qq.com>
 <CAEmasaV=L8w4dF7ja7GkDu_7U5i+aVVH1a1qsXgtFr3wuWNOPA@mail.gmail.com>
From: Fujunjie <fujunjie1@qq.com>
In-Reply-To: <CAEmasaV=L8w4dF7ja7GkDu_7U5i+aVVH1a1qsXgtFr3wuWNOPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/19/2026 10:49 PM, Alexandre Ghiti wrote:
> Hi,
> 
> On Tue, May 12, 2026 at 9:46 AM Fujunjie <fujunjie1@qq.com> wrote:
>>
>>>
>>
>>
>> On 5/12/2026 12:20 PM, Alexandre Ghiti wrote:
>>> So I have been working on the exact same thing for some weeks now. My work is based on Usama's series [1].
>>>
>>> The problem with large folio swapin is that it can create swap thrashing: to swap in a large folio, swap out may be necessary, as reported in [2].
>>>
>>> I implemented quite a few throttling algorithms on top to try to avoid this issue and so far, I have had mixed/inconsistent results.
>>>
>>> How did you test this series? Did you encounter thrashing? Do you have performance numbers?
>>>
>>> Happy to talk more about this, thanks for your series!
>>>
>>> Alex
>>>
>>> [1] https://lore.kernel.org/all/20241018105026.2521366-1-usamaarif642@gmail.com/  <https://lore.kernel.org/all/20241018105026.2521366-1-usamaarif642@gmail.com/ >
>>> [2] https://lore.kernel.org/all/SJ0PR11MB5678A864244B09FDE4D914EEC9402@SJ0PR11MB5678.namprd11.prod.outlook.com/  <https://lore.kernel.org/all/SJ0PR11MB5678A864244B09FDE4D914EEC9402@SJ0PR11MB5678.namprd11.prod.outlook.com/ >
>>
>> Thanks Alexandre.
>>
>> My RFC only had correctness testing so far. I tested the all-zswap path
>> and fallback cases under QEMU, but I don't have bare-metal
>> performance numbers yet.
>>
>> If you are already actively working on this, I don't want to duplicate the
>> same effort. I will pause this RFC for now and wait for your series.
>>
>> After your series is posted, I will take another look and see if there is
>> anything that still needs follow-up work.
>>
>> Thanks for letting me know.
> 
> Sorry for the late answer. I took a break because of the inconsistent
> results that I had, perhaps a fresh look could help so no worries if
> you give it a try on your end.
> 
> Happy to discuss further results if you continue.
> 
> Alex


Thanks Alexandre.

That sounds good. I will take a fresh look on my side.
If I find something useful, I will discuss with you.

Best regards,
fujunjie

