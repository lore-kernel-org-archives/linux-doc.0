Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1D978F26;
	Fri, 16 Jan 2026 17:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768585447; cv=none; b=FIZujGEFSJ9h7sCpfWToc/JShOYfJP18IsEfCbnibcnsTRk5NhO56zeJZ0s9QENu1ShMmPynwG6OIGl2Dbd43QIyXLqtvDAlCwWy0faRwkcEg4dwaFB/mnZGtFJ52Fv7iTOUyVuFuA5DSNzUboTP9TRw7fDutqASw6KWxvAMXdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768585447; c=relaxed/simple;
	bh=hpk3vy57xqMZAzKfmIMW6O4MmzDaCixckiUE3II8rBo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=K00xM9KrD7RUoSBVvBYWLmxd8KqajF4O1Ul8jhdXcVz3ucSESjs7iD3csMUucF3ps3b/XWyhD03HKLWTYZui5yYFYsSvAkLcRBR0XsBdCXFLj9tCxpUDxQ+9lBw0e804FS3Ro7it/uwcOiwEAsvwwDw3TElzO/12pMbkw9GvH8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=smeEYCXx; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="smeEYCXx"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1E77440425
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768585445; bh=M8JDq/HYpaIpdQfyg0uKWzvctBcSmzdi5iogaZiA8qw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=smeEYCXx6d0EveUoFXuwlroVzG4/+S7siu7s3Q/kl3CyeXOrUhmI4PVYzsdi9x0SX
	 X3WqVFLFCzuco2sf9A957cF6WNxatDy5x3nrGNTb9gchjf83nvvDCql8vep/deyhqa
	 4Oil+LrTZW8B7HFDPnZtPS7MK9HOj99RDuAyCMc00enOoY7618NX7/RyHeE4XCGP/7
	 6sjyaCpAq4rRuH70RN3UHZRDi6jbju0CfYhf8MfMZxl5rXugAEJCunE51FmjZcIUDC
	 k1UC5Rwf4aPlsS1SRiIrYUz0Vm1h4d+ZBpJkLRH10VlVa+ndGCY1miaBeGPFrbkmSQ
	 QYIeNwsFYFu2w==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1E77440425;
	Fri, 16 Jan 2026 17:44:05 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jani Nikula <jani.nikula@linux.intel.com>, Randy Dunlap
 <rdunlap@infradead.org>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>, Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH 0/2] Move kernel-doc to tools/docs
In-Reply-To: <8a885d30b9915e80a86e4096a0b4a1fb13616a95@intel.com>
References: <20260114164146.532916-1-corbet@lwn.net>
 <813cd0b6-e23b-4571-91fa-224106d3ad54@infradead.org>
 <87zf6gt2ts.fsf@trenco.lwn.net> <20260114212558.1aeb1b17@foz.lan>
 <3237bd2e1397910708743dba2c7d80b2c8eecb0b@intel.com>
 <87ecnquda3.fsf@trenco.lwn.net>
 <8af04281-6cde-4903-8b30-3eea213d8ff9@infradead.org>
 <87wm1isqf8.fsf@trenco.lwn.net>
 <8a885d30b9915e80a86e4096a0b4a1fb13616a95@intel.com>
Date: Fri, 16 Jan 2026 10:44:04 -0700
Message-ID: <871pjppi57.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jani Nikula <jani.nikula@linux.intel.com> writes:

> On Thu, 15 Jan 2026, Jonathan Corbet <corbet@lwn.net> wrote:
>> Randy Dunlap <rdunlap@infradead.org> writes:
>>
>>> On 1/15/26 7:05 AM, Jonathan Corbet wrote:
>>>> Jani Nikula <jani.nikula@linux.intel.com> writes:
>>>> 
>>>>> I think the tool source should be called kernel_doc.py or something, and
>>>>> scripts/kernel-doc should be a script running the former.
>>>> 
>>>> I honestly don't get it - why add an extra indirection step here?
>>>
>>> a. compatibility with people in the wild running scripts/kernel-doc
>>
>> That is easily achieved with a symbolic link if we need it.
>>
>>> b. adhere to well-known naming conventions.
>>
>> The normal convention is to not have language-specific extensions on
>> commands.  As in "scripts/kernel-doc".  I still don't understand how
>> making a wrapper script somehow makes this better.
>
> kernel-doc the python source directly messing with sys.path is not
> great. The python source should be able to assume the environment has
> been set up, imports work, etc.

I agree that's not great.  We could of course fix that up in the
makefile; the sys.path manipulation is only for standalone runs.

> The wrapper script is the stable interface that can hide the actual
> location and structure of the python packages and sources, and set up
> the python environment.

I suppose.  I sort of see the existing kernel-doc as *being* the wrapper
script. 

> While I'm not suggesting to package kernel-doc for pypi, I think
> structuring it in a way that it could be is a fairly good guideline for
> managing the source. And I feel like all the other refactoring and
> relocation is already taking us in this direction.

So I guess my feeling is that if somebody really wants to implement that
extra level of indirection, we can consider it.  I won't dig in my heels
*too* deeply.  But it's a separate change from moving the tool, so
should be done on its own.

Thanks,

jon
