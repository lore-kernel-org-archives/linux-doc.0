Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D6D219F1
	for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 15:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705504950; cv=none; b=cMIkFMFuZ4gGG4ianXOZIw3yiK9VKJT6Mhr2mzipMOCwvvYiyKX2nwWQImDlQH6TXsYQPJS+Y2fZHBlwtToqQZXucVQMUUEA8D63rOA+xDKkiAyK18CBtfsO7AUmKysRbv5QvrmcgLwwsdbE+aiaW1dPu2Lzvvebr/hMnAUqqT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705504950; c=relaxed/simple;
	bh=IiMaPOqpUzn1pJI+Dgu8m7VuIzEgUtD8Pt2lbXXzmlI=;
	h=Received:DKIM-Filter:DKIM-Signature:From:To:Subject:In-Reply-To:
	 References:Date:Message-ID:MIME-Version:Content-Type; b=KVJxlkKoZFlzzcR8nJiJpdubryQZkp7JnO0iSR3JbgTj//JXGW2JadN7wQmUvCsAlA0/l30iKZV7wjRDe4UK7GqRUHMDml3vDy6kHIOYw4eWusKUwXx9yxVEG5GSEmYM0lXLCWlDJzObYzUJzqczWL9wE/l5Rin8a/GmnyvURWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=pQBu0e8R; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="pQBu0e8R"
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 36F0079C0;
	Wed, 17 Jan 2024 15:22:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 36F0079C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1705504947; bh=yjKec3Ad63HOwUz/a2RJqXwD/ORuXY+Ut49R6doCb5U=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=pQBu0e8RyAxtfQOtUUVp3+QsdnJ9Gs6YPYGnxNifFhB3AugxgHEgOg2oeYkPEViYM
	 6nSDZYh3FhP0z9bfoRD+wFJFexSk8dbrfGum/pliNtHx76hftbgonAhong0P7y5/F7
	 cl6Lv09ZpXtvfKWHYylktjm5AojMRKY/J7GNs0z86ZtVVhz9ocPsb1fnwyDDL4nyee
	 9dlslvAOvHTGVGsCnDQVzs/GTtWVkTLC+cyWeHDVHSlAGoCsqQVw5f/CNQ8sNXxRcV
	 C/FOflYipAmshnhTTr3vjP52GDa/t/kU1dc+K/gWAhR43pNaMr9BWQIu3exsSWxl8O
	 IqF8onTM5OHpw==
From: Jonathan Corbet <corbet@lwn.net>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>, linux-doc@vger.kernel.org
Subject: Re: Help required - kernel-doc, code block and backslash
In-Reply-To: <871qagb41s.fsf@somnus>
References: <87y1cqbg01.fsf@somnus> <87ttnee69t.fsf@meer.lwn.net>
 <878r4pxlnw.fsf@somnus> <87jzo9b09p.fsf@meer.lwn.net>
 <871qagb41s.fsf@somnus>
Date: Wed, 17 Jan 2024 08:22:26 -0700
Message-ID: <87v87s56j1.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Anna-Maria Behnsen <anna-maria@linutronix.de> writes:

> Maybe I'm on the wrong track (definitely possible as I am a
> scripting/tooling amateur), but I thought identifiers option takes a
> list of functions or types and not filenames?

No, you're right.  I was talking about the type of matching desired.

> In case the filename-glob matching is this what I would call wildcard
> matching, then I would propose to enable this for the existing
> option. In case regexes are required as well, maybe another option like
> '[no-]identifiers-regex' could be introduced.

Given that we've gotten by with no matching support until now, I don't
think that we need to add two types :)  Basic globbing it is, though I
can't promise to get it done right away.  That will have to be done on
the Perl side, and I get really slow in that world...

Thanks,

jon
