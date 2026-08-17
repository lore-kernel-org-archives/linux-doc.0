Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E90399000;
	Mon, 17 Aug 2026 05:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786945318; cv=none; b=bakjGdTaTisdI0sS7QyG3PeaLbGUfuKMcYzCyyOkGlAkMqgwq/RyZbNtYe2yuBZeaY591nwSOhBL2FcHL4nDgdaBDdQhoXtNzBBQizQd8ximUzfbQTmbh5XuUNkkqwaC/Yx8/VYrUUsbZm7eibaVfcYKKBzwj4T6PX4yz3dvdIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786945318; c=relaxed/simple;
	bh=yDrZADxvTe30wcKBerh+lpRN4z+HXjDl4RFRnrzBESE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=cQUJIOhRSQu0tuUQ3M8/A2qZ4TuwGeDjGd/fIBJL4YbqSsPtvnAH1+a3Yp18JP1sKtyjTnTdZE9N1+evbK2lmsi2RZAtkPuL+kcz1a1o8l80cP5Q4eUYxDs0euw/DN3FX8OEQw6UqTMJoQdWPBjm1TczDCN0Ck9U0hOc/Fns7AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OgPJusgH; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OgPJusgH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=oj6zyfumLi8ApQsZgg4jVkvZX3S+X5Mtvnc7Bz9hvvU=; b=OgPJusgHvjI0ATosS9aU9hASpz
	FDXMkTesk/ryvu86C3fYgAHmG7atwK4LwbXSC48HUWtDrc4IYlmqZ5R1SttUP0i0jd7qAWxADnfFn
	04I1c0cWggKxNfLa4X9H130yA6sGxtH0k21bDzF/f1uc/a+85HsUxws9XSpbUPbc/j9ehN9SQ8Yyi
	JnSzESxIE9oL6rxRQQlAahi6GOLNF2u1GJqZ3RhZ4Z7jIm6JEpodkL/0EjyT7T9oUgPkf1mV29Ena
	ppom7NsbbL3A1DSE11A+7Hf5WDGqcSJ+zR50rRIvJRsHkrljMiUayOfueb3iT39pGWmbDeuwt4J4R
	+CyTirpg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvq6R-00000005Rhf-0QjD;
	Mon, 17 Aug 2026 05:41:43 +0000
Message-ID: <e5fc8f70-3da5-4a17-a0d1-c08ffebc79b9@infradead.org>
Date: Sun, 16 Aug 2026 22:41:37 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: kdoc_output: only use out_tail when the identfier
 is shown
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-doc@vger.kernel.org,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <20260816054826.3988516-1-rdunlap@infradead.org>
 <db2fca9b-eb16-41ce-b980-151a463c52af@infradead.org>
Content-Language: en-US
In-Reply-To: <db2fca9b-eb16-41ce-b980-151a463c52af@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro et al,

On 8/16/26 11:05 AM, Randy Dunlap wrote:
> I think that I just found a problem with this.
> I'll post an update when I have one.
> 
> On 8/15/26 10:48 PM, Randy Dunlap wrote:
>> In -man mode, scripts/kernel-doc prints the "out_tail" information for
>> all symbols that are found (without the symbol info), whether the
>> symbols match the output selection criteria or not.
>>
>> This can cause quite a lot of extraneous output in -man mode for the
>> symbols that are not in the selection criteria.
>>
>> Modify kdoc_output.py so that it only calls out_tail() for symbols that
>> are being shown according to the selection criteria.
>>
>> Closes: https://lore.kernel.org/all/fc7978bb-a71f-456d-84bb-670c8f0426ed@infradead.org/
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> ---
>> Cc: Jonathan Corbet <corbet@lwn.net>
>> Cc: Shuah Khan <skhan@linuxfoundation.org>
>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>> Cc: linux-doc@vger.kernel.org
>>
>>  tools/lib/python/kdoc/kdoc_output.py |    6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>

This change represents that I think would/could be a reasonable fix for
the problem that I reported (see the Closes: link).
However, this doesn't work because what I want to call (out_tail) does not
belong to the OutputFormat object but instead to the ManFormat class.

Can someone advise me on how I could/should call ManFormat.out_tail()
from here in the OutputFormat object?

  File "linux-next-20260814/tools/docs/../lib/python/kdoc/kdoc_output.py", line 221, in msg
    self.out_tail(fname, name, args)
    ^^^^^^^^^^^^^
AttributeError: 'OutputFormat' object has no attribute 'out_tail'. Did you mean: 'out_var'?


>> --- linux-next-20260814.orig/tools/lib/python/kdoc/kdoc_output.py
>> +++ linux-next-20260814/tools/lib/python/kdoc/kdoc_output.py
>> @@ -198,22 +198,27 @@ class OutputFormat:
>>  
>>          if dtype == "function":
>>              self.out_function(fname, name, args)
>> +            self.out_tail(fname, name, args)
>>              return self.data
>>  
>>          if dtype == "enum":
>>              self.out_enum(fname, name, args)
>> +            self.out_tail(fname, name, args)
>>              return self.data
>>  
>>          if dtype == "var":
>>              self.out_var(fname, name, args)
>> +            self.out_tail(fname, name, args)
>>              return self.data
>>  
>>          if dtype == "typedef":
>>              self.out_typedef(fname, name, args)
>> +            self.out_tail(fname, name, args)
>>              return self.data
>>  
>>          if dtype in ["struct", "union"]:
>>              self.out_struct(fname, name, args)
>> +            self.out_tail(fname, name, args)
>>              return self.data
>>  
>>          # Warn if some type requires an output logic
>> @@ -763,7 +768,6 @@ class ManFormat(OutputFormat):
>>          Add a tail at the end of man pages output.
>>          """
>>          super().msg(fname, name, args)
>> -        self.out_tail(fname, name, args)
>>  
>>          return self.data
>>  
> 

Thanks.
-- 
~Randy

