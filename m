Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F8636D
	for <linux-doc@vger.kernel.org>; Mon, 25 Nov 2024 00:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732493168; cv=none; b=qwmXghrosf+Z/Yody31SL7p0g6ifwiWqSip8MkiDrz39NhGbRsjbUh8fH4woH65Ym77yZ19O8hRM0nuAkqVZiOvX30XiBzJw2FVUiNefnuuwwYBR6QjqgSrhSE8ALwHUpOfW+AIbD8q+UulQoJCLAykSMPzi+t8dTS+8O+df/RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732493168; c=relaxed/simple;
	bh=LTGT+GfOCgkJKYsN/bpoU9RVAU0tbnw7nVHvVhwWM3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=I66L3dDh66k9/cPJ+ouNT9KwFFkGGPKde/IN6iarKqPTeuV3u3lDJsbesewosgMolkL4s4sKOJsXJgX3JON1WtZAdb1i+hh+x9dUAU+DaqZQiZHoPLw1fH4KduF0nolzSnU2yX4ioWpvPto5Ph0rp9zZjLbKDhbro6pXomSfLK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HG6nP7jw; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HG6nP7jw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=KqFg/pDxwg39F9g/SMck0MBrM7MyEvBT7kDtmjwf7+o=; b=HG6nP7jwcIv8qcp7ce5iYlRdp7
	oNDczdDflGVOheqdUG8LJrsikrThNZSDg5BJ100J1cVKOYUxlW2OoWnZPru9p3lXTJVDFG9XaQ49U
	VcZxDzpREMDoRr6IJIfuprp9uPGM22mk21KdArFnX9uEQFw1Y2onTx5ZdGxIcYjEOMZlQIQcK9hKQ
	YkzYRDzm+LxDUTRQvUjC63Ac5NLmNqVJPPYqOOZW7U9oUMShixnE0XFNuV3cCxR6pI0PQcemmgRB/
	Xhn81m6CsiUMMYFzFXgzn73tnqU575/6fyrcrhRcBaB/6M1ZLxlnjpxJNKzHAWLomrPEkFtG5kKb9
	k0jzJeYg==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tFMc1-000000011kY-1j7b;
	Mon, 25 Nov 2024 00:05:57 +0000
Message-ID: <344b7402-466b-4b42-b8a4-6c1c822cc47a@infradead.org>
Date: Sun, 24 Nov 2024 16:05:52 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: typedef output question/issue?
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
References: <e9d714fd-d034-4176-a2b7-50a72f80c8ad@infradead.org>
 <877c8w25sn.fsf@intel.com> <874j4025rq.fsf@intel.com>
 <9b7a43f5-5d04-4917-906b-707581b5a39e@infradead.org>
 <87serkz8rg.fsf@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87serkz8rg.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jani,

On 11/21/24 11:28 AM, Jani Nikula wrote:
> On Thu, 21 Nov 2024, Randy Dunlap <rdunlap@infradead.org> wrote:
>> On 11/21/24 3:19 AM, Jani Nikula wrote:
>>> On Thu, 21 Nov 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>>> On Wed, 20 Nov 2024, Randy Dunlap <rdunlap@infradead.org> wrote:
>>>>> Hi,
>>>>>
>>>>> If I print a typedef in html (make htmldocs) from a .rst file,
>>>>> I see:
>>>>>
>>>>> type dma_cookie_t
>>>>>     an opaque DMA cookie
>>>>>
>>>>> Description
>>>>>
>>>>> if dma_cookie_t is >0 it’s a DMA request cookie, <0 it’s an error code
>>>>>
>>>>> ~~~~~~~~~~~~~~~~~~~
>>>>>
>>>>> If I print the same typedef in man format, it says 'typedef' instead of
>>>>> 'type', which is what I expect to see.
>>>>
>>>> I'm sorry, it's unambigous to me which one you expect.
>>>
>>> *ambiguous, obvs!
>>
>> Sorry about that. I would like to see 'typedef' instead of 'type'.
> 
> Right, so looking into it, Sphinx actually has two forms for documenting
> types, described at [1]:
> 
> .. c:type:: foo_t
> 
> .. c:type:: int foo_t
> 
> The former is simple, and becomes a generic "type" in rendered
> documentation, while the latter can contain a "typedef-like
> declaration", and becomes "typedef" in rendered documentation.
> 
> So, if you can make kernel-doc emit a proper typedef for the c:type

What a big "if"!  Not your problem though.

What this exercise has shown me is that the scripts/kernel-doc processing of
'typedef' is sorely lacking. I.e., "typedef [many options]" is too complex for it. ;)

My test case has 3 typedefs in a row and scripts/kernel-doc sees only the first one
as a typedef, skips the second one, and parses the third one as a macro. (!)


> directive, the output will contain typedef, but otherwise remains just
> type. Whether having the actual typedef declaration in the output is
> something you also want, is a different matter.

Thanks for your assistance.

-- 
~Randy

