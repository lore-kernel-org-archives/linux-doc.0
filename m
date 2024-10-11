Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BB61CFEAD
	for <linux-doc@vger.kernel.org>; Fri, 11 Oct 2024 22:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728685027; cv=none; b=ohLmxuKAv36PrjyPLVm8MOLhqNVbbzYInYeodFndiR/ZQVdRM3E9LrSwkbbG3TocW9J4ZGlG+ek/2+E6+wadIZzURm0WjJ0Nw47oPmEg8JopA9yh+U/9upKaP+feQiX3aZHePfPCvknm1ClhQ4qYoxScDbXNl1eNaThMn0oPTeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728685027; c=relaxed/simple;
	bh=Lzbxaa5C4bY6asXktdr3tR2wUTVEyFmATZ2ImB7NFfI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=SD3mlHM5NA7JyWCqpAOS7GAfwiyCSC2Os3sDx+PP0jwdmxcRpw3XXrqeLp6jvPoWzKPIy0EHAUjt/7ZT9UwI+a+9Rje/3rp/lL+flxgsL6SV6P/4J6TQFLSFy9NH8jOA80IjGUG/iBuve085luk3mjGjtKpK9z4zpm+6VGRo/gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=J1rZ+qrS; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="J1rZ+qrS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=oeW1HyXR4hV35TAnMpQXj1iUWZ/ily35TUmXRLi56NE=; b=J1rZ+qrSJBa4v5Am3OfmB7t5ry
	bLly0BP4HuHLByPgX2UoCQHUtRhaZkSvVDgoLmiu4zs1nYIEx5QF1ZSYVl5WjR4YFolSuAMYE4c88
	ZPfVhSgqQOJksiIXm+LPcXWkewUBssIzpOoNmZHISLT+JpzMthfXo4ts22WKXzxt+QIkIPkQvXZK4
	hfJkfvcS+eSKU0qt5Pov+qciDcd78YOum5IwjAMY3bUuol6pVeUd8XrqyQNq8DOMu+bKCd3TGMAtu
	/rOmJmWrdIo2xi70+UMcGEeyws56Ya5uyL/Omd/Yt+2SfF9KzZGaJnHlFPci4O3p54d1FD+2etQh0
	clQ9DKJg==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1szNwN-0000000BzZO-0YIk;
	Fri, 11 Oct 2024 22:16:57 +0000
Message-ID: <9e09f97e-90ca-4a36-a6cc-0234d683c9fa@infradead.org>
Date: Fri, 11 Oct 2024 15:16:47 -0700
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
 <5b16b00f-749c-431b-baeb-7accb76b492b@infradead.org>
 <eef0d9af-4d04-46b1-b132-1213fa97b97b@infradead.org>
Content-Language: en-US
In-Reply-To: <eef0d9af-4d04-46b1-b132-1213fa97b97b@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/10/24 8:07 PM, Randy Dunlap wrote:
> 
> 
> On 10/10/24 4:54 PM, Randy Dunlap wrote:
>>
>>
>> On 10/10/24 4:43 PM, Randy Dunlap wrote:
>>>
>>>
>>> On 10/9/24 10:06 PM, Randy Dunlap wrote:
>>>>
>>>>
>>>> On 10/9/24 3:02 PM, Randy Dunlap wrote:
>>>>>
>>>>>
>>>>> On 10/9/24 9:49 AM, Jonathan Corbet wrote:
>>>>>> Vlastimil Babka <vbabka@suse.cz> writes:
>>>>>>
>>>
>>> The main problem is that output_function_rst() does not support object-like macros while
>>> output_function_man() does.  There is still a bunch of sphinx_version handling that I know
>>> nothing about, so the present output (after my trivial patch) leaves more to be done.
>>>
>>> Well, the *main* problem is that the output is not consistent. Sometimes my tests don't fail
>>> as they did at first.
>>>
>>>
>>> This patch drops the trailing "()" for object-like macros in output_function_rst()
>>> but there is still more to be done.
>>>
>>> ---------------------
> 
> This one mostly works for me although I don't care for the second line
> here. I guess it has something to do with cross-referencing(?), but IDK.
> 

That seems to be normal but this patch now causes regressions for macros that
do have parameters. Back to searching...

> 
> """
> SLAB_TYPESAFE_BY_RCU
> ``SLAB_TYPESAFE_BY_RCU ``
> 
> WARNING READ THIS!
> 
> Description
> """
> 
> ---
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
>  scripts/kernel-doc |   13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> --- linux-next-20241009.orig/scripts/kernel-doc
> +++ linux-next-20241009/scripts/kernel-doc
> @@ -822,10 +822,13 @@ sub output_function_rst(%) {
>      my $oldprefix = $lineprefix;
>  
>      my $signature = "";
> +    my $noret = 0;
> +
>      if ($args{'functiontype'} ne "") {
>          $signature = $args{'functiontype'} . " " . $args{'function'} . " (";
>      } else {
> -        $signature = $args{'function'} . " (";
> +        $signature = $args{'function'} . " ";
> +    	$noret = 1;
>      }
>  
>      my $count = 0;
> @@ -844,7 +847,9 @@ sub output_function_rst(%) {
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
> @@ -890,7 +895,9 @@ sub output_function_rst(%) {
>      #
>      print ".. container:: kernelindent\n\n";
>      $lineprefix = "  ";
> -    print $lineprefix . "**Parameters**\n\n";
> +	if (!$noret) {
> +   		print $lineprefix . "**Parameters**\n\n";
> +    }
>      foreach $parameter (@{$args{'parameterlist'}}) {
>          my $parameter_name = $parameter;
>          $parameter_name =~ s/\[.*//;
> 
> 

-- 
~Randy
