Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78B11DDC8
	for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 11:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705490373; cv=none; b=baSRxzi4UqSO8uxsFjm3pUk/PCZE16mx2q5UAo68AFRbKlT/OmxYT6vyUIoST/YSabgQa3aWQ2I+0Aff9fwXdDnhC/cDxD9tLOi+qcoKVQipN4lFmxexhKKt+/O7uJ/v2yGyBqm/YWxnVT+jVuvRI7gfsCohQJsu466v7Odq/6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705490373; c=relaxed/simple;
	bh=7b7AVAFOetlgaChFot++R9nbYYV833/yZWRdnCvZaic=;
	h=From:DKIM-Signature:DKIM-Signature:To:Subject:In-Reply-To:
	 References:Date:Message-ID:MIME-Version:Content-Type; b=oJu56zhpJhfx1/iRYyOFI/yPqwB3qj8sR2xCb8EIqEQSIDtlvu4d/EI6jY0SCMtD15M/21wMY8GJLgH3mbBjNTFe6FjMfuaSnVioNairywjCGFSXUCyy4I+kUceCcWdmTS1CVOJGmjbtaiJT6EGiT9INUkHv9UQOMcRQLCo2FmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eEE1y172; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jtmbomZA; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eEE1y172";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jtmbomZA"
From: Anna-Maria Behnsen <anna-maria@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1705490367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lz/YWB3a2Zr5PIfyuam7eXOQuRmrlmDJDUSPL9oB81s=;
	b=eEE1y172+Ql04bPE2KzhC8YsgIeBrHkCBPNKXFJsXSxrkgQG5xTh21JaEKCnqEiY3SMsFN
	DbsDTPIGyB10xFjJFBSxkEW9SgmbisWNRoW/NSAYZNvFo3OWFIOsixIMfvur3yi33VOYxh
	LF4WoMv4soCW/5kHyUo7wXv5XVEtd18/HnHrKC165SexeqQPQ7GxC3d1yffLkWvl9ZstGw
	4TLU8NWIm2z6apkzmE0Fn2X0ui9LNmD2dCOLW8xUPC4IIqxP6oqC1o+MNmnyEVOKaeFdUk
	QzkUnTtT5Mf4FV4VoGfIxdBJ/ifZOI2iSEA+Z5PQkEp06laXjD8+g0IKezSiqA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1705490367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lz/YWB3a2Zr5PIfyuam7eXOQuRmrlmDJDUSPL9oB81s=;
	b=jtmbomZAy/yzbjtWqjLpX9Gwdo1v6yzffI6aq2J7EIhtzc/8/hRe1k1dB2uqjuiirfBjCa
	IPvmU4hPqlsDd0AQ==
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: Help required - kernel-doc, code block and backslash
In-Reply-To: <87jzo9b09p.fsf@meer.lwn.net>
References: <87y1cqbg01.fsf@somnus> <87ttnee69t.fsf@meer.lwn.net>
 <878r4pxlnw.fsf@somnus> <87jzo9b09p.fsf@meer.lwn.net>
Date: Wed, 17 Jan 2024 12:19:27 +0100
Message-ID: <871qagb41s.fsf@somnus>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jonathan Corbet <corbet@lwn.net> writes:
> Anna-Maria Behnsen <anna-maria@linutronix.de> writes:

[...]

>> When using the kernel-doc 'identifiers' option, is there a way to use
>> wildcards or a easy way to enable wildcards? Something like this:
>>
>> .. kernel-doc:: include/linux/jiffies.h
>>    :identifiers: time_*
>
> Not currently.  That would be useful, though, and easy enough to add.
> We just need to decide whether we want filename-glob matching, or proper
> regexes...
>

Maybe I'm on the wrong track (definitely possible as I am a
scripting/tooling amateur), but I thought identifiers option takes a
list of functions or types and not filenames?

In case the filename-glob matching is this what I would call wildcard
matching, then I would propose to enable this for the existing
option. In case regexes are required as well, maybe another option like
'[no-]identifiers-regex' could be introduced.

Thanks,

	Anna-Maria
