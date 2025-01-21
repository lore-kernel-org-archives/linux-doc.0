Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798451BD018;
	Tue, 21 Jan 2025 10:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737455331; cv=none; b=UjBCYx9/mni5dWCzbyYzh1cjcafIjjet03uXDH7VoVMYxApNgzDnTLjOINkrVZcY7ulKhsmL2oNyAjIRJigkjSvWDNF/fndqK+Ihi1rqtEq7d4G4PNfW5NdIpis/Dx69K8KcSwMcy3ImrDnJAngXulTpgxl3oFVGgPQstZrfGC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737455331; c=relaxed/simple;
	bh=of/P/iAbzwKgqNJ29k2ba7DZOxXAbkW82WSAPYiiCTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=txQ3DatY1P3WWi9YTadeNj4DJYrIDfxkMrN0bjAt+qfW6bkoTVQICgPKfUpo4m5f7ebDk4f0iYD/HTxTHDOH+OEOR5Gp1okmqMJ2rWdSCfsieup4ADnPVF+mmPTnzDC7imlvV94hxkkdtWVUaJMHwtbzbZnJ1K3grGMiETkRUdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=vBE/L8no; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=2K9Sc88P; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=vBE/L8no; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=2K9Sc88P; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="vBE/L8no";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="2K9Sc88P";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="vBE/L8no";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="2K9Sc88P"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8A17E1F792;
	Tue, 21 Jan 2025 10:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1737455321; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZpU7w1Na811TmueKf3rbkfXGP1ok9xGvPXs4uunOtBo=;
	b=vBE/L8no9mIMz6O6IEd3c7ltHMEjfMiC6nDvDYE3Sf4RC5rYC9lkyqA/JCu7U+hTurh1Gj
	K/CgoYLVW8thGEbexHCvTSW+tYFEysVvyLOphm62t9AP8qsMihHUgja5cLx/Hbaz2GKMzF
	+gztXVWros7GzfdNQAr159hHvGUR1i0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1737455321;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZpU7w1Na811TmueKf3rbkfXGP1ok9xGvPXs4uunOtBo=;
	b=2K9Sc88PZgsuoa7yLm2MerCaz22ps8WEv4k+CL+lIL1Ik31vVuqlbPyM8AfHpyGCTWNb5t
	kugvYDf6ZL20xPBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b="vBE/L8no";
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=2K9Sc88P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1737455321; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZpU7w1Na811TmueKf3rbkfXGP1ok9xGvPXs4uunOtBo=;
	b=vBE/L8no9mIMz6O6IEd3c7ltHMEjfMiC6nDvDYE3Sf4RC5rYC9lkyqA/JCu7U+hTurh1Gj
	K/CgoYLVW8thGEbexHCvTSW+tYFEysVvyLOphm62t9AP8qsMihHUgja5cLx/Hbaz2GKMzF
	+gztXVWros7GzfdNQAr159hHvGUR1i0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1737455321;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZpU7w1Na811TmueKf3rbkfXGP1ok9xGvPXs4uunOtBo=;
	b=2K9Sc88PZgsuoa7yLm2MerCaz22ps8WEv4k+CL+lIL1Ik31vVuqlbPyM8AfHpyGCTWNb5t
	kugvYDf6ZL20xPBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 74A4D13963;
	Tue, 21 Jan 2025 10:28:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IYI+HNl2j2eGDQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 21 Jan 2025 10:28:41 +0000
Message-ID: <712ff549-5ef2-418f-a0a2-8a3da04f03fd@suse.cz>
Date: Tue, 21 Jan 2025 11:28:37 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: slub: Panic if the object corruption is checked.
To: Hyesoo Yu <hyesoo.yu@samsung.com>, Hyeonggon Yoo <hyeonggon.yoo@sk.com>
Cc: Hyeonggon Yoo <42.hyeyoo@gmail.com>, kernel_team@skhynix.com,
 "janghyuck.kim@samsung.com" <janghyuck.kim@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>,
 David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <CGME20250120083041epcas2p30d61ee801c1db5a7ebdf26fdc642883f@epcas2p3.samsung.com>
 <20250120082908.4162780-1-hyesoo.yu@samsung.com>
 <CAB=+i9R-9LQWJFGSJJ5dUqwkoFQK8VDxEwi-4Sb73pTP+xw+wQ@mail.gmail.com>
 <20250121005452.GB610565@tiffany>
 <1495dc28-f16c-4990-ad89-2a90b79a80b8@sk.com>
 <20250121023240.GA645761@tiffany>
From: Vlastimil Babka <vbabka@suse.cz>
Content-Language: en-US
In-Reply-To: <20250121023240.GA645761@tiffany>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8A17E1F792
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,skhynix.com,samsung.com,linux-foundation.org,lwn.net,linux.com,kernel.org,google.com,lge.com,linux.dev,kvack.org,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.cz:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,samsung.com:email,suse.cz:mid,suse.cz:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On 1/21/25 3:32 AM, Hyesoo Yu wrote:
> On Tue, Jan 21, 2025 at 10:48:08AM +0900, Hyeonggon Yoo wrote:
>>
>>
>> On 1/21/2025 9:54 AM, Hyesoo Yu wrote:
>>> On Tue, Jan 21, 2025 at 12:41:01AM +0900, Hyeonggon Yoo wrote:
>>>> On Mon, Jan 20, 2025 at 5:30 PM Hyesoo Yu <hyesoo.yu@samsung.com> wrote:
>>>
>>> Thanks for response.
>>>
>>> Using warn() instead of panic, is a great idea.
>>> Thanks for pointing out what I missed.
>>
>> Just for clarification, I think changing the common error reporting
>> logic (like, slab_bug()) to use WARN() will be preferable to inserting
>> new WARN()s at random points, which is what this patch does now.
>>
>> Best,
>> Hyeonggon
>>
> 
> Thanks you for clarification.
> 
> Actually, I considered adding BUG_ON() to slab_bug. However if we add BUG_ON() to slab_bug,
> it will prevent many meaningful error log from being printed subsequently.
> As you know, slab_bug is the log that usually is printed at the biginning of a bug
> in the slab. As a result, it would be difficult to figure out the problems based on
> the logs during our large-scale test-bed.
> 
> Similary, even if I use WARN() in slab_bug, we won't be able to obtain the logs
> when panic_on_warn is enabled. I don't think it is useful to include WARN in slab_bug.
> 
> Instead, I will implement a solution where WARN is only used in slab_fix before
> slab object is restored. If I add it to slab_fix, I think warning is suppressed on
> kunit test by slab_add_kunit_errors handling.

Right, makes sense to only do the WARN() after printing the debugging
logs. Thanks.

> Thanks,
> Regards.
> 
> 

