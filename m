Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C10919AD7B
	for <linux-doc@vger.kernel.org>; Thu,  5 Sep 2024 12:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725541077; cv=none; b=pzwu+B+us1X+daA/LoJK/VV0gy+/Qq+2ZrPq1nFrbpgUgUuORmFxbyth5CiFI331B0SDmMfHIR5C3kNRefjlb7DZoGOE0w3yNioqYFk2cZ6SRY+bvFafnD/uvRRiUR+hOW1Msq0lDNUifmxsCmKPsddCmL8WwgHzPFS+7h8j7G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725541077; c=relaxed/simple;
	bh=hTKeaTZmez0Ck3o81AEFBIv9eLCWopBvKIVL4SWK4Pg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cPPwcGIrVZSd7HMw4sgw1Gr/8bHGkACE5urSF+kmIVZFZBczeDimezI/7QwPzRX/D3Ee4Q6R4ewKmhqlaDSflO4IXPR3gWSHWB6eMVbhyVmc8EXZAUJ2Q+R99msB9DN7yidWI4JQ2nMsUH1G6DxaYSXBOdygD1kkBWjPTYCf6yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=d44qr28J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Bnrnz7x0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=d44qr28J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Bnrnz7x0; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d44qr28J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Bnrnz7x0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d44qr28J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Bnrnz7x0"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 93FF11F815;
	Thu,  5 Sep 2024 12:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725541073; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RsqydaexiCOcYmPqe+55qQHSp0PMWL66PxniTkkBx3A=;
	b=d44qr28JYW625AKw+5Qr3pe39ix0r1lEQ8bXi6l4vwJwNy7+ZIpweJ0OFu3MzCToC2k/1o
	oB6FEmm9qQYELqsl6WNp3xhU7aT0N0gepjxJmkpyX7BgJN22Mn8SQvoLRM74LWohgvQGJm
	62nelGvAHKcoFqVFQcF4GIwdvHLMVy8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725541073;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RsqydaexiCOcYmPqe+55qQHSp0PMWL66PxniTkkBx3A=;
	b=Bnrnz7x0ac7NyKSoXUVzes2V1DO2u2dAfLJF2x418j56EGhCEzCPkqMkodRYqLyRYJ5TgG
	a1ypNrtDii4bqUDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725541073; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RsqydaexiCOcYmPqe+55qQHSp0PMWL66PxniTkkBx3A=;
	b=d44qr28JYW625AKw+5Qr3pe39ix0r1lEQ8bXi6l4vwJwNy7+ZIpweJ0OFu3MzCToC2k/1o
	oB6FEmm9qQYELqsl6WNp3xhU7aT0N0gepjxJmkpyX7BgJN22Mn8SQvoLRM74LWohgvQGJm
	62nelGvAHKcoFqVFQcF4GIwdvHLMVy8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725541073;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RsqydaexiCOcYmPqe+55qQHSp0PMWL66PxniTkkBx3A=;
	b=Bnrnz7x0ac7NyKSoXUVzes2V1DO2u2dAfLJF2x418j56EGhCEzCPkqMkodRYqLyRYJ5TgG
	a1ypNrtDii4bqUDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 76FF01395F;
	Thu,  5 Sep 2024 12:57:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /93VG9Gq2WZCewAAD6G6ig
	(envelope-from <bwiedemann@suse.de>); Thu, 05 Sep 2024 12:57:53 +0000
Message-ID: <18f6aafd-3a96-42fc-9a65-b1b03ab8ae2a@suse.de>
Date: Thu, 5 Sep 2024 14:57:52 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Build kernel docs deterministically
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-doc@vger.kernel.org
References: <20240905113531.65375-1-bernhard+linux-doc@lsmod.de>
 <878qw6qpbu.fsf@intel.com>
Content-Language: en-US
From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
In-Reply-To: <878qw6qpbu.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.993];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 

On 05/09/2024 14.04, Jani Nikula wrote:
> On Thu, 05 Sep 2024, bernhard+linux-doc@lsmod.de wrote:
>> From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
>>
>> Because we want reproducible builds
>> and https://github.com/sphinx-doc/sphinx/issues/6714
>> did not receive any love from Sphinx devs in five years,
>> let's disable parallel doc builds until that Sphinx issue is fixed.
> 
> You mention in [1] that this is likely a duplicate of [2] i.e. multiple
> Sphinx instances running in parallel and racing in doctree access.
> 
> In kernel, does the issue then boil down to:
> 
> htmldocs:
> 	@$(srctree)/scripts/sphinx-pre-install --version-check
> 	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,html,$(var),,$(var)))
> 
> i.e. multiple Sphinx invocations instead of just one?

If that is the case, then providing a unique doctree dir to each 
invocation should also help.

However my patch for sphinx -j1 did give good test results, too.
Maybe in your case that would result in 8 sphinx calls with 1 thread 
each, which would be more appropriate for your machine.
