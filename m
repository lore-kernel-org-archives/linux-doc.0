Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99A64A3C
	for <linux-doc@vger.kernel.org>; Sat, 31 Jan 2026 16:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769876203; cv=none; b=LnmVf3JFvvQ6bomIBGHfWo9x2vWR1oCBIRMtdh8SyfrbGRx5y1EqrbplJUBawyrFJqgbGA/ImKJEgta+UpVJg1NQHjf3G3o5iILW55p+7srJmreguErToUi+Z5B/tVd+acswLlOUtUtRE+Lr5VvGDuzQYoGRDNTa7gIJB2epnU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769876203; c=relaxed/simple;
	bh=VK9Pa6bSVZ2wX0vSxdh8PA9o16ssgUDKLaI9IEgywCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6BmW8UgDFfqTZUjM6qDAYlt3M8lNl2KrYVqLUQrHpO0SZ87z0vZfRALKyjc32uN56GCvAVNY9Z5VFZ2jvB8NOaQYnxjM47bOYC/ed2srVCG+xeC/80PPptCk/UIaPvHDT/6tJqo98ALh8GEOTJBImszHz7fyhQgV00m+JnrK3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJ7OVUD1; arc=none smtp.client-ip=209.85.219.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJ7OVUD1"
Received: by mail-qv1-f65.google.com with SMTP id 6a1803df08f44-894703956b8so52945166d6.1
        for <linux-doc@vger.kernel.org>; Sat, 31 Jan 2026 08:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769876201; x=1770481001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nZdfjr2YBB6Bg1S9gnKxkULsiC0x83ebbFEXgtKWVOQ=;
        b=NJ7OVUD1pA1QKFXc0lzZ838WyFQeOg3YXndf9vksmchuUOqZKypnHvk31JP5bgWjRo
         EbK1NhXf++9002Y3mV6KZ4EZdBhNi5+p0koURPA4t2QRuQm+RDd9cmweb9WJ9nZNFD9a
         9+qJcYR5MHm10hjHuyupmeUO1ONgqra2HjFL3BLp10dsk7O9R5tp92JmaIaBVylUG0HG
         Ju/aFZVBFAkyrJDUc3wjHuVTQo+d0j5alKTlwW5ptlumLOmDgmx+W/13+L6FwdTOCOOY
         RSBskJ4IkmnPjCFZqtLDv6T+RbHuZHDXKE7dkKp0qLClytN0WDE3bewrko7GCqMt+IGj
         R1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769876201; x=1770481001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZdfjr2YBB6Bg1S9gnKxkULsiC0x83ebbFEXgtKWVOQ=;
        b=Fib4G0ZDn5AzfinqdFzcF/7BR/UBjGASCL37F2vmA0YQ5Fqh18QluTWrnxGGSPPKQW
         CUcOE7AYcSC/TEO2fJfWEU6bKEedbqYRKuKqME0ssnPJFmbD+TMtqYUAcncbU9byrRsB
         YdEde7a1I9q6x1a3ScSfTK0YSyDoTVNbJm7h4UuwuGuIfGJBQyr2MOuPQoCw8ePvoV3U
         pywFooXnub7rHFidbbr8Io6Anflvhq2AfgnB2ICuGLWa5HrTxCKz4EWqzHHkr8aQ08P1
         U8QUno9z25bL5lfiRwQD+7QhYM60Q9K838pFsl5LOoX2oJCXpD687iTfDBsxKn8pi84p
         BVeA==
X-Forwarded-Encrypted: i=1; AJvYcCWFGGE3cpgJ+jKlZCceg+9gE1MCgMP7+fkX+0cjiel0wMkAFfbA++E/JadbO01buy88cxvVMD+B9m4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG7S9rEzAGNKSuOhOlE/d6vGN13tRSGb9I3hqN+epFqujW5b65
	IAj21Uhh2rtHI2l0E4W18LtD5ZD8qyKGs4sTLQRaw6IhdvKSrG+jPhra
X-Gm-Gg: AZuq6aI7mgqE+H/FsavvTikh1KDFSU3gV6XILJHa5Hyvazlb1eJxWozY46tiwlE5ZXx
	olaldy0GARucE3PzpftV0XP6pYZRZdnsxwPRV/eUCxZ9lccGw3AQgPKE2ShlAlTU2cqmBlLSSuC
	ZmdWSMx6eQ/ecmysLUXVoLWwi8+DViQlvWnX/H0vvXlArhtMiIjK4DaQxygRsa6AHCSOBtDQ2Sx
	5ityXZQIvTLXlghXLDqBNwDAxDab/fKyi++Aw2NT9ZZzXfU+zMfld2bz3YURpZ4lWcaTkgOhKv/
	QdrqEwM00VY74uDmOwhIs+FxtllU32u85nOqOPJ3RPCCyV9y3t+mp3MxMprRFJvgki1HAnDY6k5
	OqJ9k7QHfIXhURK71HeLHB29WumCu9Q9gcjo56YzNAgT/7YdQLj7l4zsugSVdJZBmEtYGlIzhRD
	pr9ImpMYuQixIEZfUzpc5ixu2RyZXHwsh6TF6PFfBTWmU=
X-Received: by 2002:ad4:594c:0:b0:894:7322:f1c6 with SMTP id 6a1803df08f44-894ea036009mr91543476d6.34.1769876200574;
        Sat, 31 Jan 2026 08:16:40 -0800 (PST)
Received: from pc ([2600:4041:4491:2000:27cf:ceff:6f56:5b3e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d37412d4sm84497356d6.36.2026.01.31.08.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 08:16:39 -0800 (PST)
Date: Sat, 31 Jan 2026 11:16:37 -0500
From: Seokwoo Chung <seokwoo.chung130@gmail.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, corbet@lwn.net, shuah@kernel.org, 
	mathieu.desnoyers@efficios.com, linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 v5 1/3] docs: tracing/fprobe: Document list filters
 and :entry/:exit
Message-ID: <ttsritlbnf5tpqvwcje3wgcjiri72thxo56c7y4ppjkpnw2c2d@tjvwfmxh2c55>
References: <20260118011815.56516-1-seokwoo.chung130@gmail.com>
 <20260118011815.56516-2-seokwoo.chung130@gmail.com>
 <20260120155340.2dac7fab@gandalf.local.home>
 <wqpijkdwziafpuci6js5mtfzro46bre4z7une547crcdzrlm67@kd4fgea5m6ov>
 <20260129093508.5064b3782a40811cbcd8cb7b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129093508.5064b3782a40811cbcd8cb7b@kernel.org>

On Thu, Jan 29, 2026 at 09:35:08AM +0900, Masami Hiramatsu wrote:
> Hi Ryan,
> 
> On Sun, 25 Jan 2026 15:23:17 -0500
> Seokwoo Chung <seokwoo.chung130@gmail.com> wrote:
> 
> > On Tue, Jan 20, 2026 at 03:53:40PM -0500, Steven Rostedt wrote:
> > > On Sat, 17 Jan 2026 20:18:13 -0500
> > > "Seokwoo Chung (Ryan)" <seokwoo.chung130@gmail.com> wrote:
> > > 
> > > > Update fprobe event documentation to describe comma-separated symbol lists,
> > > > exclusions, and explicit suffixes.
> > > 
> > > Usually, the documentation updates comes *after* the changes.
> > > 
> > > -- Steve
> > > 
> > Thanks for the comment. As you noticed, I sent another patch since I forgot to
> > put log. That said, please let me know if you want me to continue on this
> > series. My apologies on the ordering. I noted after Masami mentioned but I
> > misordered when sending. Thank you.
> 
> Sorry for replying so late,
> Can you fix the kernel test robot's error? I think it is almost done.
> 
> Thank you,
> 
Hi. Thanks for the reply. I will fix and send the next version.


> > 
> > Best regards,
> > Ryan Chung
> > > > 
> > > > Signed-off-by: Seokwoo Chung (Ryan) <seokwoo.chung130@gmail.com>
> > > > ---
> > > >  Documentation/trace/fprobetrace.rst | 17 ++++++++++++++---
> > > >  1 file changed, 14 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/Documentation/trace/fprobetrace.rst b/Documentation/trace/fprobetrace.rst
> > > > index b4c2ca3d02c1..bbcfd57f0005 100644
> > > > --- a/Documentation/trace/fprobetrace.rst
> > > > +++ b/Documentation/trace/fprobetrace.rst
> > > > @@ -25,14 +25,18 @@ Synopsis of fprobe-events
> > > >  -------------------------
> > > >  ::
> > > >  
> > > > -  f[:[GRP1/][EVENT1]] SYM [FETCHARGS]                       : Probe on function entry
> > > > -  f[MAXACTIVE][:[GRP1/][EVENT1]] SYM%return [FETCHARGS]     : Probe on function exit
> > > > +  f[:[GRP1/][EVENT1]] SYM[%return] [FETCHARGS]		    : Single function
> > > > +  f[:[GRP1/][EVENT1]] SYM[,[!]SYM[,...]][:entry|:exit] [FETCHARGS] :Multiple
> > > > +  function
> > > >    t[:[GRP2/][EVENT2]] TRACEPOINT [FETCHARGS]                : Probe on tracepoint
> > > >  
> > > >   GRP1           : Group name for fprobe. If omitted, use "fprobes" for it.
> > > >   GRP2           : Group name for tprobe. If omitted, use "tracepoints" for it.
> > > >   EVENT1         : Event name for fprobe. If omitted, the event name is
> > > > -                  "SYM__entry" or "SYM__exit".
> > > > +		  - For a single literal symbol, the event name is
> > > > +		    "SYM__entry" or "SYM__exit".
> > > > +		  - For a *list or any wildcard*, an explicit [GRP1/][EVENT1] is
> > > > +		    required; otherwise the parser rejects it.
> > > >   EVENT2         : Event name for tprobe. If omitted, the event name is
> > > >                    the same as "TRACEPOINT", but if the "TRACEPOINT" starts
> > > >                    with a digit character, "_TRACEPOINT" is used.
> > > > @@ -40,6 +44,13 @@ Synopsis of fprobe-events
> > > >                    can be probed simultaneously, or 0 for the default value
> > > >                    as defined in Documentation/trace/fprobe.rst
> > > >  
> > > > + SYM		: Function name or comma-separated list of symbols.
> > > > +		  - SYM prefixed with "!" are exclusions.
> > > > +		  - ":entry" suffix means it probes entry of given symbols
> > > > +		    (default)
> > > > +		  - ":exit" suffix means it probes exit of given symbols.
> > > > +		  - "%return" suffix means it probes exit of SYM (single
> > > > +		    symbol).
> > > >   FETCHARGS      : Arguments. Each probe can have up to 128 args.
> > > >    ARG           : Fetch "ARG" function argument using BTF (only for function
> > > >                    entry or tracepoint.) (\*1)
> > > 
> 
> 
> -- 
> Masami Hiramatsu (Google) <mhiramat@kernel.org>

Best regards,
Ryan Chung
