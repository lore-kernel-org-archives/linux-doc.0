Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CA51C86F2
	for <linux-doc@vger.kernel.org>; Fri,  6 Sep 2024 13:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725630976; cv=none; b=b0rAXuIteJffIRcLZbUFoCDCp6T7WXY6c+3b/0u42LmcXmdD7gzZuRRsRiz6t5NkoQw40Es53tmKw8uyERP0F1o+xVQfSIKOynHVVeswVVxirFtuHFkt6eyPoDnaQ6MnW9tl4plChyotisdvq/T6jq2Qme/9lfumkdLqKR83wnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725630976; c=relaxed/simple;
	bh=S7qeP4AgFyrys7E/qD0lixs1EpOuiQj4fLU7Q1zbpls=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=U4otq/x4dQgEPXB6rJ6WFa9T6ofj/Asy+siAIB7gUa1CBl4nTFofRqWCkoYMB8xHm4DAWKHUZMJZ2Ds30nbsB+UyFQNcMIdAmzxgL5tBKohuEotJt3NylFw2pog/r+GgzRSDIhpX/pV0wisp9414HWZcfYK9Wc4q8tu5PFVnAV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ubawF4tM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9+rtdGiP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sdti1D5N; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WUnldVRz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ubawF4tM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9+rtdGiP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sdti1D5N";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WUnldVRz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 047B71F8B5;
	Fri,  6 Sep 2024 13:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725630972; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sRO6E959etYXzxivOUYwWDXYbrwo7ojvygaHM7nRaXc=;
	b=ubawF4tMl56TYdOBY8xEjsPgbN2OyW3XwUMgzl8+FT2rgblpYUcKPzZBlr74fX3YiXAeG1
	Ol/5fQb3093zxZiJuzItUAtYqL14I95QQh6ev0DzHhmp9DhjWjYNxPWevsHr/DrDyY6KpD
	nF7RB+vWfpOF6p58f7jke/CePAvwfnk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725630972;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sRO6E959etYXzxivOUYwWDXYbrwo7ojvygaHM7nRaXc=;
	b=9+rtdGiP2R3jVMN5uerYR/NXnX434FckZzpizwUqGnBe9ZYPLdPserGPRwH62nZyeLb2uM
	8c4XyRA07U7A0jAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725630971; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sRO6E959etYXzxivOUYwWDXYbrwo7ojvygaHM7nRaXc=;
	b=sdti1D5N3Ct/TjXFspYtjZLHJIBQDauIIVYHNY47FN9IW6DxNKvr1QwQHiJxnNek6Cfnz6
	1gmm9LKfsLyS4/rglchNNQ2sYoUFdquO9azTCmKbXXO5PYWJsugQCoH7KNNHNGovQmbkDQ
	7phpRivey+hBCIRodvvG1Gh+7Ln73Q4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725630971;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sRO6E959etYXzxivOUYwWDXYbrwo7ojvygaHM7nRaXc=;
	b=WUnldVRzzQnhgYB1bvD6t3z7QDjIGfHfj4X0koVhIRHo7iGnYznIPVC9K+c+MN+QayhlMn
	mmNKSExhZ1+aMDCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BC7591395F;
	Fri,  6 Sep 2024 13:56:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ko9cLPoJ22YBLAAAD6G6ig
	(envelope-from <bwiedemann@suse.de>); Fri, 06 Sep 2024 13:56:10 +0000
Message-ID: <33018311-0bdf-4258-b0c0-428a548c710d@suse.de>
Date: Fri, 6 Sep 2024 15:56:10 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Build kernel docs deterministically
To: Vegard Nossum <vegard.nossum@oracle.com>, bernhard+linux-doc@lsmod.de,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>
References: <20240905113531.65375-1-bernhard+linux-doc@lsmod.de>
 <be85300d-74f4-4e9d-998d-26d09fe96563@oracle.com>
Content-Language: en-US
From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
In-Reply-To: <be85300d-74f4-4e9d-998d-26d09fe96563@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,lsmod.de:email,suse.de:email,suse.de:mid,parallel-wrapper.sh:url]
X-Spam-Score: -2.80
X-Spam-Flag: NO

On 06/09/2024 11.11, Vegard Nossum wrote:
> On 05/09/2024 13:35, bernhard+linux-doc@lsmod.de wrote:
>> From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>

> If you need reproducibility and the solution/workaround is to limit it
> to 1 concurrent sphinx-build invocation, why can't you just run
> 'make -j1 htmldocs ...' explicitly?

I had tried that and it did not help.

however, an
export PARALLELISM=1
did help to make results reproducible.
This is converted in parallel-wrapper.sh into a sphinx -j1 $ARGS
call instead of sphinx -jauto.
And that points towards sphinx-internal parallelism as the issue here, 
rather than parallelism from kernel/make.

And that means https://github.com/sphinx-doc/sphinx/issues/6714
for kernel-docs, is not exactly the same issue as
https://github.com/sphinx-doc/sphinx/issues/2946


While I could add that workaround into our openSUSE kernel-docs.spec 
file, there are still Debian, Archlinux and others that desire 
reproducible builds and those would need to discover and apply that 
workaround as well. So would be nicer to have it reproducible by 
default, possibly with an option to sacrifice correct results for 
processing-speed.

Ciao
Bernhard M.
