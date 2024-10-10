Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1E41A704B
	for <linux-doc@vger.kernel.org>; Thu, 10 Oct 2024 23:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728604508; cv=none; b=lHN1FScX+XPQ6wJWw0W1r5zISeCJ92giN4GLutDd6wZE463L3rf+E9ubHA8NZk7gEGkFjDJ2BXzEeIQZjKK6vPp7MAXxTtwOncO62pBv+LmMAsQP9DC0Qa+Eo6VvT+qhmo3S4VJXqZH/XodPbvJKY8llLmKBQFcTq3nhC/13t68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728604508; c=relaxed/simple;
	bh=KHqXPixWG9aXv6WohiHYIwXMRo6WFOd5Wo6gjSfxyYk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Y+oU+dwgZsWrWFGVCsD7p35DtJt3CRK8c5G1TO1/GvwuEKrsXcydFIZTJldDq+DJ+V4aX9SMQJHMC5R9Xp16W2nibbceyjuK9y6mcXoWgHCo6Ql1jDUICjTacwCE2jT10BS+1l77m5efJC1c2goJfn8Qk+jX+JHzBCjO04E4DB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=k5y2A0KT; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="k5y2A0KT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=snqs3EHvQQFe5TlwVU9Fqyfnun53AdSjkQFSmOW8rqg=; b=k5y2A0KTzzhh1N8FNtU6Rdqy7o
	Zi5Aw1wAZJ+Dw8nItthR3rpyIm+YsPBYhuFaZfsancwNjOqDFLMybm7ClX1L5YMEc37/0pyu00uLa
	Nr/d3Q+gZ2q9aeELopN6NbOgzpZZMNGJDqMaEJTUGAaokGoZfVzevvIHohmXXX4c1g9aoEVshRd1a
	mKtRz4vbCwnMKXnkS78s+UKdb9/qxKoFN+fiq2nlmCG0C09JuFWjFMRCUsbVaRE5b/CEdhoUUr6cj
	RqQ09iemAlqK0IB4hjEM++BfEzt3LF4trW75rxzE42i8o37ozPxXjNpZpi0MleQEfay+JwIcXV5X3
	FY7x6UQA==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1sz2za-00000005k0I-2q5f;
	Thu, 10 Oct 2024 23:54:51 +0000
Message-ID: <5b16b00f-749c-431b-baeb-7accb76b492b@infradead.org>
Date: Thu, 10 Oct 2024 16:54:46 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [partial fix] Re: [PATCH] mm, slab: add kerneldocs for common
 SLAB_ flags
From: Randy Dunlap <rdunlap@infradead.org>
To: Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
 David Rientjes <rientjes@google.com>, Christoph Lameter <cl@linux.com>,
 Horia Geanta <horia.geanta@freescale.com>
Cc: Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org
References: <20241009142936.56092-2-vbabka@suse.cz>
 <878quxe2kw.fsf@trenco.lwn.net>
 <f6fa720b-e8af-4afa-906f-29019aefe49a@suse.cz>
 <878quxb4rm.fsf@trenco.lwn.net>
 <8b0c1bb9-4a9a-4f8e-87df-275994df739d@infradead.org>
 <1406d498-84bf-49aa-9efd-6480ad618582@infradead.org>
 <46c52676-c402-4b39-b634-a401f7a7a571@infradead.org>
Content-Language: en-US
In-Reply-To: <46c52676-c402-4b39-b634-a401f7a7a571@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/10/24 4:43 PM, Randy Dunlap wrote:
> 
> 
> On 10/9/24 10:06 PM, Randy Dunlap wrote:
>>
>>
>> On 10/9/24 3:02 PM, Randy Dunlap wrote:
>>>
>>>
>>> On 10/9/24 9:49 AM, Jonathan Corbet wrote:
>>>> Vlastimil Babka <vbabka@suse.cz> writes:
>>>>
>>>>> Thanks for the hints. I hope if we can agree that documenting the macros was
>>>>> intended to be supported, doesn't break the build (there are users already)
>>>>> and has only those minor rendering issues, it can be used?
>>>>
>>>> I'd totally forgotten that this was supposed to work.
>>>>
>>>> Yes it can be used... $WE just need to find a way to make it work
>>>> properly.
>>>
>>> The code probably isn't expecting a macro on the right side. I'll take a look,
>>> but no promises.
>>>
>> That would have been too simple.
>> I haven't found the problem yet. Ran out of time. Will continue on it tommorrow/Thursday.
> 
> The main problem is that output_function_rst() does not support object-like macros while
> output_function_man() does.  There is still a bunch of sphinx_version handling that I know
> nothing about, so the present output (after my trivial patch) leaves more to be done.
> 
> Well, the *main* problem is that the output is not consistent. Sometimes my tests don't fail
> as they did at first.
> 
> 
> This patch drops the trailing "()" for object-like macros in output_function_rst()
> but there is still more to be done.
> 
> ---------------------
> From: Randy Dunlap <rdunlap@infradead.org>
> Subject: [PATCH] kernel-doc: allow object-like macros in ReST output
> 
> output_function_rst() does not handle object-like macros. It presents
> a trailing "()" while output_function_man() handles these macros
> correctly.
> 
> Fixes: cbb4d3e6510b ("scripts/kernel-doc: handle object-like macros")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Horia Geanta <horia.geanta@freescale.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Vlastimil Babka <vbabka@suse.cz>
> ---
>  scripts/kernel-doc |    8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> --- linux-next-20241009.orig/scripts/kernel-doc
> +++ linux-next-20241009/scripts/kernel-doc
> @@ -822,10 +822,12 @@ sub output_function_rst(%) {
>      my $oldprefix = $lineprefix;
>  
>      my $signature = "";
> +    my $noret = $signature eq "";

^^^ That line is in the wrong location. Still working on it....

> +
>      if ($args{'functiontype'} ne "") {
>          $signature = $args{'functiontype'} . " " . $args{'function'} . " (";
>      } else {
> -        $signature = $args{'function'} . " (";
> +        $signature = $args{'function'} . " ";
>      }
>  
>      my $count = 0;
> @@ -844,7 +846,9 @@ sub output_function_rst(%) {
>          }
>      }
>  
> -    $signature .= ")";
> +    if (!$noret) {
> +    	$signature .= ")";
> +    }
>  
>      if ($sphinx_major < 3) {
>          if ($args{'typedef'}) {
> 
> 

-- 
~Randy
