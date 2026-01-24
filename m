Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8276243AA4
	for <linux-doc@vger.kernel.org>; Sat, 24 Jan 2026 00:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769214712; cv=none; b=N1WL3utoQ3SK+v+AJcc3hHcET4pHXyoPLqG6oUTzI0hA/y68nWoSXG37WK8xcADVeoPfn7XPgLWL8lMJAn+eJZXmgbr07E/3Qz/dNIrNTzMv0IXtmXiRHkxYcSy2sHfY5+2Uq/aQxS12GW9uSSoxjALpOwgDEIVMLBDMscub1sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769214712; c=relaxed/simple;
	bh=QSW+5dqL884ti2B0pSppCQPPR/BJnhtxsPD90YktJ5w=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Vkubc+b5JmHHAnwju4Ow/I3YJFyKtAA172bbYyoxesD28jbVw5UOxScbmWqtTB1MwuA6JFHFq6nqqNhqxqv2jC34XKi7Ly8FSFFoAylHoTqJ+vF9qsa6AL4wO3sDqL8CRbrjJnDTnVFzUcyNQjrz8n+VuqwT9jX3eNqYQ/V9EU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QvQURA6u; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QvQURA6u"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2a7aa9efc55so20794035ad.1
        for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 16:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769214711; x=1769819511; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XHhFuv+6ufFWS5++ieVo6f09Zd0Zk0x1xBr8gUhUdds=;
        b=QvQURA6unBI5MthyXfw5BqYFEwaArK5AJLcgb6+v2eK9CjsGEpcSRTMnAPOXxcTci2
         0X3ver+3ya39SsdfgjT1X+RWuLRgpOkltaKnWP0VujECe2YrEbtcqHDoGq8oNK8A8hGJ
         ddr+eNwZ/slK8hoX8kLjExfYtnTF0tzNl8FGwmzudJVxAjCMNXglUYup6mpwmEFaL4CX
         m9AQnTHWY84CE9qSLvgw8DFft85r40NV3xOw37NnW8Cx1AwydRf3P5DP3+CC07RzShXC
         X8r2886+DYI8ujh1P6vgwhGPN7fijFTzxWxU55pfQc5nvNyMm6f4Cb5Z+kChzzxeWA52
         brIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769214711; x=1769819511;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHhFuv+6ufFWS5++ieVo6f09Zd0Zk0x1xBr8gUhUdds=;
        b=ki89qJyJpLeacK7U67ZpgcuIolE+Mcp9yIlJkJpt1G9aIIcNn0oVZUxUlc6qFzFFXZ
         n6h1dSsvy/XctOvfPATL06U6gLbvbl/RYaYeKtvQQf6+/vp6RzEOaopgOuuMSGSOA4HP
         /bOFT9/+JhkiFNVQ6i3UXY6qoToDzZjwGOAqsvwV1eFfz2EYlmDE0ePy8Yxfk5cdIxp3
         BDQqmO0dOZJ9cu/v9O8oyx/NpRV6Z4wvyu3OOzkQQV+jafuImeyyIBnLZJnZxioQ4ljy
         KAJOCWDII1PlEA+aUD14yjTtRbCEbjEfkFWrST+KsLFNLj+qFMmmXlSAmbRElgIU313o
         LKfA==
X-Gm-Message-State: AOJu0YyIvUKeXru0ft46/ZjtktH9ZyCASxiLQJ1PSLhFHdQBnj/0BG7k
	SM95mbh/R3lLE3vDhivLvLuD+KqikneqrPZFQ93qFLFF0Pp4Q0arTSWP
X-Gm-Gg: AZuq6aJO0zJFUUmJ+t9azp3Cb03elqbj67NepuOxCSroF+TWQpuNvgKgraJiDHSl0ZJ
	hcQwlHH0UgRJXLY04G9B7nq6e/ibMHndtRctfWN/bzM8qhfn6M+9DDReW9lV6lzyn29s3hmLhkx
	neiAVFvcCNepNpeRY9TROmomnJEsXpdEKnDUSy3rBaEBJEBntUhPf1AaqxV2f9DrNgQbaxp1lEQ
	AMEc6YVsS3Rvirv9mnmHvggw4AdroHqKRW9Hss1g3592KrPiiHumN24RWQ05N0kQatRznY4dQTI
	hWqqlH5op12HIgiK7+QI1WE1ae80rw0QCI1g7dfnl/E0f4HO/qGFkvfhjSHnD0qnfD0MPKGgAUU
	QSy/H5wlmi4mQnfo4k4veC+yJgtFhqRpSB51DSmbnYroYed6pNK6V+kOkfsak49WkprqnZnY55x
	fkdH/cnA//i3I/UTtD0W4bo6EjIX9Vm+W7x7w0IQycxeF9e82FZXk4ALuY
X-Received: by 2002:a17:903:3b88:b0:295:62d:5004 with SMTP id d9443c01a7336-2a7fe592de1mr44376445ad.26.1769214710787;
        Fri, 23 Jan 2026 16:31:50 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f978c7sm30040775ad.65.2026.01.23.16.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 16:31:50 -0800 (PST)
Message-ID: <63e99049-cc72-4156-83af-414fdde34312@gmail.com>
Date: Sat, 24 Jan 2026 09:31:47 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: corbet@lwn.net, mchehab+huawei@kernel.org, mchehab@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 nfraprado@collabora.com, pvorel@suse.cz, rdunlap@infradead.org,
 skhan@linuxfoundation.org, Akira Yokosawa <akiyks@gmail.com>
References: <87h5sc17zx.fsf@trenco.lwn.net>
Subject: Re: [PATCH 00/25] Add tools/lib/python modules to Documentation/tools
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <87h5sc17zx.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 23 Jan 2026 11:47:30 -0700, Jonathan Corbet wrote:
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
>> Hi Jon,
>>
>> This is an extended version of:
>>     https://lore.kernel.org/linux-doc/cover.1768488832.git.mchehab+huawei@kernel.org/
>>
>> It basically adds everything we currently have inside libs/tool/python
>> to "tools" book inside documentation.
> 
> OK, I have applied the set, thanks.

I've not have time to test this set, so just a quick report of a build error
related to this set after the fact.

I'm getting this error from "make SPHINXDIRS=tools pdfdocs":

---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
------------
Running 'xelatex --no-pdf  -no-pdf -interaction=batchmode -no-shell-escape -recorder  "/<...>/Documentation/output/tools/latex/tools.tex"'
------------
This is XeTeX, Version 3.141592653-2.6-0.999997 (TeX Live 2025) (preloaded format=xelatex)
entering extended mode
Latexmk: Getting log file 'tools.log'
Latexmk: Examining 'tools.fls'
Latexmk: Examining 'tools.log'
Latexmk: References changed.
Latexmk: Missing input file 'tools.toc' message in .log file:
  No file tools.toc.
Latexmk: Missing input file 'tools.ind' message in .log file:
  No file tools.ind.
Latexmk: References changed.
Latexmk: References changed.
Latexmk: Log file says output to 'tools.xdv'
Latexmk: Index file 'tools.idx' was written
Latexmk: Using bibtex to make bibliography file(s).
Latexmk: Summary of warnings from last run of *latex:
  Latex failed to resolve 15 reference(s)
Latexmk: ====Undefined refs and citations with line #s in .tex file:
  Reference `kabi_parser:module-lib.python.abi.abi_parser' on page 75 undefined on input line 7092
  Reference `kabi_regex:module-lib.python.abi.abi_regex' on page 75 undefined on input line 7093
  Reference `kabi_helpers:module-lib.python.abi.helpers' on page 75 undefined on input line 7094
  Reference `kabi_symbols:module-lib.python.abi.system_symbols' on page 75 undefined on input line 7095
  Reference `feat:module-lib.python.feat.parse_features' on page 75 undefined on input line 7096
  Reference `jobserver:module-lib.python.jobserver' on page 75 undefined on input line 7097
  Reference `kdoc_ancillary:module-lib.python.kdoc.enrich_formatter' on page 75 undefined on input line 7098
 And 8 more --- see log file 'tools.log'
Latexmk: Errors, so I did not complete making targets
Collected error summary (may duplicate other messages):
  xelatex: Command for 'xelatex' gave return code 1
      Refer to 'tools.log' and/or above output for details

Latexmk: Sometimes, the -f option can be used to get latexmk
  to try to force complete processing.
  But normally, you will need to correct the file(s) that caused the
  error, and then rerun latexmk.
  In some cases, it is best to clean out generated files before rerunning
  latexmk after you've corrected the files.
Error: Can't build 1 PDF file(s): tools/pdf/tools.pdf
make[2]: *** [Documentation/Makefile:58: pdfdocs] Error 1
make[1]: *** [/<...>/Makefile:1842: pdfdocs] Error 2
make: *** [Makefile:248: __sub-make] Error 2
---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----

Excerpt from tools.log:

---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
! Text line contains an invalid character.
l.5865 if r’^^A
               ’ is used, it works just like re: it places there the
A funny symbol that I can't read has just been input.
Continue, and I'll forget that it ever happened.
---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----

, and from tools.tex:

--------
\sphinxAtStartPar
It matches a regex that it is followed by a delimiter,
replacing occurrences only if all delimiters are paired.

\sphinxAtStartPar
if r’’ is used, it works just like re: it places there the  <-- 5865
matched paired data with the delimiter stripped.
--------

Mauro, can you please have a look?

Thanks, Akira

> 
> jon

