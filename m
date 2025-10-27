Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2838823771E
	for <linux-doc@vger.kernel.org>; Mon, 27 Oct 2025 01:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761530368; cv=none; b=lf3/ifn5Sf9F6aO6PxEOLIblQyRuerAjkBLjVVAakxkL3OEUyQ0x/qsW8VL7KZZBgAQlpKLEsE7cTjeHbJeepQfhYXu2bQdKnSxec8PH9lNXkKYBwHuTmjz4KqcCC0HMxcH+MBKMls6c0fxD78KGnba7Dzfk5t9cyeFjSz5ggt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761530368; c=relaxed/simple;
	bh=HpEPiCN5qYwVqp7BzMb/oBMUXCw/sD9fYm6WiG+Dyq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YmyJLAyyq0188hUuyW5Umv1RYDGx/k3/2YWEO8m4mHCP676fFaqIBjTyzV85JJB84W6uJfFkI+k+65ATIUMP1TQnwvjdAz140RkoJao6uUzB2hKT48iZJ0LDZnrrG+r1b0e5hIaGQqL5GtuVJUSeW1h60wPwBYTmWA7+E0BHtfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=goAbfdta; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="goAbfdta"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-28a5b8b12a1so41316115ad.0
        for <linux-doc@vger.kernel.org>; Sun, 26 Oct 2025 18:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761530366; x=1762135166; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AKkagDqvy8vzjbyvf1eBUmABe3ymGzGAkczrB89YTZA=;
        b=goAbfdta1dBYY3EAzWfDurQ1mV5paBdMi1QT8ar6d88M+/eduYtAAU2UrnKgihrkjO
         7BHELWqm1RweW/IkdxbmwJYL30qQNGvLjHHEODqFPRsa7Z9yl7r2/dwuyJe9MjxIIVpA
         KAK5UiMgstJgvC3xpaIpsvfHmIpkyZLWtnaI4RDddKgQ0xBR3fcA2FnK+BvR0hKWk3Ow
         4/qkUCoI9cxZkxKKe04RcE+Zbn+iRvrXkH2Asr+bdoPQOWk582bddbbM4cH8jeybS2An
         V86MhTpU/JPPh/Zu8A0EB7MMgzLaVeJ67/IX9iIFr0PfB00K+I5gplkN2HIXoORfOjIE
         tXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761530366; x=1762135166;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AKkagDqvy8vzjbyvf1eBUmABe3ymGzGAkczrB89YTZA=;
        b=jWlefqOBugiPMASc/a1MdLPypF91eyIVa4HdfuPX7jVCmzXyKOcgXF+tHR+mCmPht1
         DHLGtympB4Zi3F3OFkP191toY/0KUdwZX4ub60KOVw8oimEcuzrb5PuX+H3VlT6+4S64
         wHYkavPmfrjoUB18om7IMYtl3vpCxr+zInbscOWkNPnRdB6ZOaU7Gn4+UFpJMjUxGka7
         lSH2cI41zWXFElnEzUJu9uWuQOwIz3w537KpcSEhHmJtnAAmylDkz1tiYnD9hx6mkD3D
         MfDB/fwVYq5dOkGZpzxXe+H4NXHRsE/F/uZgzWwqsGw8Z5iZm9do7LPyWylfgLpeml2T
         4wHg==
X-Gm-Message-State: AOJu0YyIwPXtZn+bgABXFLVuAq25+Bx84KGg9Mvsw1446qZ1+l7NOu0E
	WjBas0moSeWjoa3C2r4YDIXIDYya22gZr/VHBssoWa8WB0L0jyFCBTRd
X-Gm-Gg: ASbGncvjIWXyFRqKP9a58trPa+/ieMQtVHpVwUKy1XrQx04YUj2vjo6svolJJ4oZagN
	FOgHheSEmsG3UX0S9SiNQm831MuGLdXCBLu1aznAHcan9Zs81km4wtRQ+7JlfDkUSChHNP6wXQS
	xOOllmfS9oxJ7ArpPuIg0zz54hraPiqQF8EnoqPtFsxkXARVOomf1MMIUGCG1cKHWSL54SEPDx+
	VwRJ+d+iy0yZNHdYf/7TgPx9xErcxYDGM0KgQxfaHpYsuq8PaG0GeZqq7sY4tKSIHgIdHWiUlrO
	g+Xb73mLt1gs+Ma9/QfM5x+NnRKbFBwc45PbDRBL0pmO21msiHg5hZi5gfJSNXGJjRKTVN0Jk/A
	olv/Wt7A0MNoTpnEhGa4+9+jUy9paTaVEQFTlS4BzXz+yfGnSXNKaPRiiunyLXCvkEHxgQxfqU+
	x0gd2DLM52q3PhCQuL/L3dE4R6MzLt7yUTyRpCHz7YSWVg9w==
X-Google-Smtp-Source: AGHT+IHK1+8wkUkZrlVKyHxSIkxWM3L2OtLqZLkiHtzswKb2EhNwF5bCPQ8/IEskBtEZBQzHRol8dg==
X-Received: by 2002:a17:903:19c3:b0:270:4aa8:2dcc with SMTP id d9443c01a7336-290c9d34dddmr430271895ad.19.1761530366334;
        Sun, 26 Oct 2025 18:59:26 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d42558sm62269595ad.69.2025.10.26.18.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 18:59:25 -0700 (PDT)
Message-ID: <cb301be6-8d51-4872-8722-60d0accb7387@gmail.com>
Date: Mon, 27 Oct 2025 10:59:22 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] Collect documentation-related tools under
 /tools/docs
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Akira Yokosawa <akiyks@gmail.com>
References: <20251024200834.20644-1-corbet@lwn.net>
 <d3f4c7ee-6351-4c6f-ae93-f423245c4c9e@gmail.com>
 <20251026073405.0672c9dd@sal.lan>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20251026073405.0672c9dd@sal.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Sun, 26 Oct 2025 07:34:05 -0300, Mauro Carvalho Chehab wrote:
> Em Sun, 26 Oct 2025 00:14:23 +0900
> Akira Yokosawa <akiyks@gmail.com> escreveu:
> 
>> On Fri, 24 Oct 2025 14:08:21 -0600, Jonathan Corbet wrote:
>>> Our documentation-related tools are spread out over various directories;
>>> several are buried in the scripts/ dumping ground.  That makes them harder
>>> to discover and harder to maintain.
>>>
>>> Recent work has started accumulating our documentation-related tools in
>>> /tools/docs.  This series completes that task, moving the rest of our
>>> various utilities there, hopefully fixing up all of the relevant references
>>> in the process.
>>>
>>> At the end, rather than move the old, Perl kernel-doc, I simply removed it.
>>>
>>> The big elephant lurking in this small room is the home for Python modules;
>>> I left them under scripts/lib, but that is an even less appropriate place
>>> than it was before.  I would propose either tools/python or lib/python;
>>> thoughts on that matter welcome.
>>>
>>> Changes in v3:
>>>   - Now with more caffeine! Properly based on docs-next.  
>>
>> :-) :-)
>>
>> WRT the build error from test robot, it looks to me like we need these
>> final touches:
>>
>> diff --git a/Documentation/conf.py b/Documentation/conf.py
>> index 8e3df5db858e..fbd8e3ae23ea 100644
>> --- a/Documentation/conf.py
>> +++ b/Documentation/conf.py
>> @@ -582,7 +582,7 @@ pdf_documents = [
>>  # kernel-doc extension configuration for running Sphinx directly (e.g. by Read
>>  # the Docs). In a normal build, these are supplied from the Makefile via command
>>  # line arguments.
>> -kerneldoc_bin = "../tools/docs/kernel-doc.py"
>> +kerneldoc_bin = "../tools/docs/kernel-doc"
>>  kerneldoc_srctree = ".."
>>  
>>  def setup(app):
>> diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
>> index 2586b4d4e494..3c815b40026b 100644
>> --- a/Documentation/sphinx/kerneldoc.py
>> +++ b/Documentation/sphinx/kerneldoc.py
>> @@ -289,13 +289,8 @@ def setup_kfiles(app):
>>  
>>      kerneldoc_bin = app.env.config.kerneldoc_bin
>>  
>> -    if kerneldoc_bin and kerneldoc_bin.endswith("kernel-doc.py"):
>> -        print("Using Python kernel-doc")
>> -        out_style = RestFormat()
>> -        kfiles = KernelFiles(out_style=out_style, logger=logger)
>> -    else:
>> -        print(f"Using {kerneldoc_bin}")
>> -
>> +    out_style = RestFormat()
>> +    kfiles = KernelFiles(out_style=out_style, logger=logger)
> 
> Patch is incomplete, as it doesn't drop the logic which forks
> kernel-doc script run, but see below.
> 
>>  def setup(app):
>>      app.add_config_value('kerneldoc_bin', None, 'env')
>> diff --git a/Makefile b/Makefile
>> index d6ff0af5cca6..33b1db1cc0cf 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -460,7 +460,7 @@ HOSTPKG_CONFIG	= pkg-config
>>  
>>  # the KERNELDOC macro needs to be exported, as scripts/Makefile.build
>>  # has a logic to call it
>> -KERNELDOC       = $(srctree)/tools/docs/kernel-doc.py
>> +KERNELDOC       = $(srctree)/tools/docs/kernel-doc
>>  export KERNELDOC
>>  
>>  KBUILD_USERHOSTCFLAGS := -Wall -Wmissing-prototypes -Wstrict-prototypes \
>>
>> -----------------------------------------------------------------
>>
>> The change in Documentation/sphinx/kerneldoc.py is needed because
>>
>>     kerneldoc_bin == ".../kernel-doc.py"
>>
>> indicated loading it as python lib into the extension, while
>>
>>     kerneldoc_bin == ".../kernel-doc"
>>
>> indicated invoking it as a script.
>>
>> Now that we don't have kernel-doc.py, loading python lib looks to me
>> as a natural choice.
>>
>> Mauro, what do you think?
> 
> Good point. I'm not sure about this. Yeah, on normal cases, we
> just want to run kernel-doc classes, instead of actually
> executing its binary. Yet, for debugging purposes, it might
> still be interesting to run it as separate processes.
> 
> See, right now, if KERNELDOC is not used, it will use imported
> Python classes, running them directly without creating processes.
> So, it won't actually call ".../kernel-doc". On such case, in
> practice, it will actually ignore KERNELDOC when building docs.
> 
> Now, (after this series), if one runs:
> 
> 	KERNELDOC=tools/docs/kernel-doc make htmldocs
> 
> it will run kernel-doc script as a process. This might be useful
> for debugging purposes.
> 
> Also, please notice that KERNELDOC is used on several files:
> 
> 	$ git grep -l KERNELDOC
> 	Makefile
> 	drivers/gpu/drm/Makefile
> 	drivers/gpu/drm/i915/Makefile
> 	include/drm/Makefile
> 	scripts/Makefile.build
> 	tools/docs/sphinx-build-wrapper
> 
> IMHO, we have some alternatives here:
> 
> 1. completely drop support for KERNELDOC variable.
>    On such case, we need to drop from the script:
> 
> 	- kerneldoc_bin
> 	- run_cmd() function
> 	- remove KERNELDOC from Makefiles and sphinx-build-wrapper
> 
> 2. keep it as is, which would help debugging (and eventually
>    would allow testing two different implementations of kernel-doc
>    without needing to bisect);
> 

So, as far as the build regression reported by the build bot is
concerned, I think 2. is good enough.

Probably, Jon included the rename of:

 scripts/kernel-doc                                     |  1 -
 scripts/kernel-doc.py => tools/docs/kernel-doc         |  0
 16 files changed, 22 insertions(+), 24 deletions(-)
 delete mode 120000 scripts/kernel-doc
 rename scripts/kernel-doc.py => tools/docs/kernel-doc (100%)

in 6/8 considering it the right thing to do.

Let's keep the symlink of kernel-doc --> kernel-doc.py, at least for the
time being.

Further tweaks and cleanups around KERNELDOC can wait.

       Thanks, Akira

