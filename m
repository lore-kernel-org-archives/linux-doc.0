Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0C6191F9C
	for <linux-doc@vger.kernel.org>; Wed,  4 Dec 2024 22:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733350802; cv=none; b=WytuZpx3CAxWbiH6WrCaZPir8uUF8LTEdceScqkJECJJz7v8irOznLnK0u4/rJHhuloUO6qrhu5cloy6JczhCRETNXFgyKF8/m0nCDp0VBTouMYiq3mZ0rYorocIF0w9bPH0w61btN7PXFx/gNdJY6p7VYCunNiKqC5RCRsL74o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733350802; c=relaxed/simple;
	bh=m9dPhC0Eio13IjDKlL5XN4iqzJ3Yf3kDYXXG4Htb1Ks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CT2OIEjGwMChLo2iao+oR3S0kSaIowTO1qygLd9LlMC3kGfcPdOnj5mACqGUokktq8f0FqRxQO28wLRUBFIItsLlHnY2ANxDmwzaAbinRxsvDoUvdhXN+v5fiQP5Osrqi6Kq0KN+keWgwOa4R6lTDkU6v5qgxFnJW9+vLFgNuuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JpjfPAqw; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JpjfPAqw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=kNs0N/rZDN78LZjSO0fithLsELuTwwEt/P8z+Nr8E0o=; b=JpjfPAqwAmbLU8cZKJeLpih7L/
	alw9fLfxp9p+H4k601Zre/erCK8iI/wXSTgvUAi6bfbGjXM46Vix9jj3+D81jnT2ZChA5B2Y8Rio1
	h3FWz/pWVv1aE8O2LeQ3kGfxNRvio9p2JWbK6ypVIQnrI8eysXoBjo/hYOn1USBpSgBCYeGC7YdTj
	jdjo1OUmqbMXf9GbPwaICDcsqr27rbbBvLhMq/1TXI246dXrKMHdiktl8YSnxsCCS+x4cTJdUJv1r
	gU9bG+47MrKD/KBNkLJKZUOkKpypOSYlLQeJ8hBx7VkDJQprP6DftTVGG904R2cnQcDBMRAKbYFEG
	gOe+zC9g==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tIxit-0000000C4bu-479c;
	Wed, 04 Dec 2024 22:19:57 +0000
Message-ID: <e159926f-32a8-42d5-8e7f-5aa84617bee2@infradead.org>
Date: Wed, 4 Dec 2024 14:19:52 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: move kgdb.rst from dev-tools to process/debugging/
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
References: <a81c6e57-46ff-4347-9ddc-2cf566065b11@infradead.org>
 <20241202094154.3yrbqiinlpkqn65b@basti-XPS-13-9310>
 <dc993ea5-15ad-4780-9ccf-206224efe027@infradead.org>
 <20241204074746.mmvwyfbx6ausy5tk@basti-XPS-13-9310>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20241204074746.mmvwyfbx6ausy5tk@basti-XPS-13-9310>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sebastian,

On 12/3/24 11:47 PM, Sebastian Fricke wrote:
> On 03.12.2024 13:42, Randy Dunlap wrote:
>>
>> On 12/2/24 1:41 AM, Sebastian Fricke wrote:
>>> Hey Randy,
>>>
>>> On 30.11.2024 00:10, Randy Dunlap wrote:
>>>> Hi,
>>>>
>>>> It seems to me that documentation for kgdb should be in the new /debugging/
>>>> sub-directory [or that all of /debugging/ should be under dev-tools].
>>>>
>>>> Same treatment for gdb-kernel-debugging.rst.
>>>>
>>>> Any comments about those?
>>>
>>> Thanks I have overlooked these files, but yes I would say these are good
>>> candidates for the new debugging directory. And then we can link those
>>> pages into the userspace debugging advice guide.
>>
>> I'm working on this move unless you want to do it.
> 
> Yes please go ahead :).
> 
>>
>> I don't think that we quite agree on adding links to kgdb & gdb into the
>> userspace debugging advice guide. I would prefer to see them in the
>> driver development debugging guide or only listed in debugging/index.rst.
> 
> Well within the driver development debugging guide I have written the
> following in the introduction:
> ```
> While this guide focuses on debugging that requires re-compiling the
> module/kernel, the :doc:`userspace debugging guide
> </process/debugging/userspace_debugging_guide>` will guide
> you through tools like dynamic debug, ftrace and other tools useful for
> debugging issues and behavior.
> ```
> 
> I would say your right about KGDB as that requires you to recompile with
> something like:
> ```
> # CONFIG_STRICT_KERNEL_RWX is not set
> CONFIG_FRAME_POINTER=y
> CONFIG_KGDB=y
> CONFIG_KGDB_SERIAL_CONSOLE=y
> ```
> But for GDB you only need to activate debug info, which is not just
> useful for GDB and it is a debugging method that you do from userspace
> with a userspace tool, which to me sounds very fitting for the userspace
> debugging guide.
> 
> But I am happy to hear your arguments if you feel like I misjudge this.

For now I prefer to just have these 2 files listed in the debugging index file.

We can add references somewhere later...

thanks.
-- 
~Randy

