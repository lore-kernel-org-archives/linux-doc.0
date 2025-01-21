Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5341F1501;
	Tue, 21 Jan 2025 10:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737455664; cv=none; b=Z6sq9woVOcR657LhB6yQjDPP/LS8yUijqDLArdbBeLI0rc8ctvoIMJeAMKEr77Upf4fyek1e+6UIw01uZodsZIlUvpu/f8pTMKDDt9XHvBFRkgw/w8uHjlAOc97f+STnA4F2/A9pIZjfBDnGLn9iXa55c85HsO8u7jMqwzSRTD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737455664; c=relaxed/simple;
	bh=zteXaq01dCKXl3zPEDG4xQa2VkuTaEUWdHw1Vh/XmZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Si296cBrV4U829kIAsgbQW/DEVUf0x0Thx1POBbRXe6MtQm1C1sFbIP187h2D6VTN0wq9USdWJo5d8vjaMRAzBVHv/Pw3lCgnwdm9U5a2IB4JdiOeRfLSjxaZPBzO1FaBAkDrs9hWvNrwfqLxFiS1NWMNvH++0n1n6MwoZIhf8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Di+lOclO; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=jILGfGZG; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=zj5OWOy9; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=zg9qQ1+1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Di+lOclO";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="jILGfGZG";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="zj5OWOy9";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="zg9qQ1+1"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 02CAF21188;
	Tue, 21 Jan 2025 10:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1737455241; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rUmPw+tsP8Hn2JdtmVJvzpT6x1j65OtgawzbwfWp6FY=;
	b=Di+lOclOvMRn05YrToA5WQdS2gEYVq39E3YyF6mDmu9ekAtO5EIA2gcZRFNdht6a+tK4T6
	q1oN0rr20xA1JeK7oP4BSM+02E8kVZmn3neEJBH8xjQIOZ9Obk63OQ8G5MtuXYGo+qB3z1
	BI39vQj30nqdEQeKLJ0WnN+h8ookjY4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1737455241;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rUmPw+tsP8Hn2JdtmVJvzpT6x1j65OtgawzbwfWp6FY=;
	b=jILGfGZG0HhP5NIwSmZ7uGD4/+/j2f5QbVcoGFvQnhF/PG8goDsq0BPQZ1CQ08vwMUUatS
	GGnA+3HEHqn0HJBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1737455240; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rUmPw+tsP8Hn2JdtmVJvzpT6x1j65OtgawzbwfWp6FY=;
	b=zj5OWOy9HBhnHgvi2SMzCQFxA0QGegKkW8eMytfLKeTKpvSR8pVHD34g0OEGGPSvk39oep
	1Kf8d88H+MySDg3GQASU/pEvymCM222wv0KW/SWez/M1PUaV383z6gedeOQZwdsaaBH4C5
	XMnb2CQzKA1LBkO3L7JWqbbK43uQGfQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1737455240;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rUmPw+tsP8Hn2JdtmVJvzpT6x1j65OtgawzbwfWp6FY=;
	b=zg9qQ1+15vF3Xmt8v63VrGe5DudClLiyxs9dSvKm0kAMI8hb6KdPJCICOq798TRC6Px4p8
	SmTKJNi9P++cOGAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E1AE713963;
	Tue, 21 Jan 2025 10:27:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7GvWNod2j2d3cgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 21 Jan 2025 10:27:19 +0000
Message-ID: <3661f67f-8c52-4e7b-80b6-9b3cc63b41bd@suse.cz>
Date: Tue, 21 Jan 2025 11:27:19 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: slub: Panic if the object corruption is checked.
To: Hyesoo Yu <hyesoo.yu@samsung.com>, Matthew Wilcox <willy@infradead.org>
Cc: janghyuck.kim@samsung.com, Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Christoph Lameter <cl@linux.com>,
 Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CGME20250120083041epcas2p30d61ee801c1db5a7ebdf26fdc642883f@epcas2p3.samsung.com>
 <20250120082908.4162780-1-hyesoo.yu@samsung.com>
 <Z45taJAEqdcyIXX-@casper.infradead.org> <20250121003959.GA610565@tiffany>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250121003959.GA610565@tiffany>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[samsung.com,linux-foundation.org,lwn.net,linux.com,kernel.org,google.com,lge.com,linux.dev,gmail.com,kvack.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:mid,samsung.com:email]
X-Spam-Score: -2.80
X-Spam-Flag: NO

On 1/21/25 1:40 AM, Hyesoo Yu wrote:
> On Mon, Jan 20, 2025 at 03:36:08PM +0000, Matthew Wilcox wrote:
>> On Mon, Jan 20, 2025 at 05:28:21PM +0900, Hyesoo Yu wrote:
>>> If a slab object is corrupted or an error occurs in its internal
>>> value, continuing after restoration may cause other side effects.
>>> At this point, it is difficult to debug because the problem occurred
>>> in the past. A flag has been added that can cause a panic when there
>>> is a problem with the object.
>>>
>>> Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
>>> Change-Id: I4e7e5e0ec3421a7f6c84d591db052f79d3775493
>>
>> Linux does not use Change IDs.  Please omit these from future patches.
>>
>> Panicing is a very unfriendly approach.  I think a better approach would
>> be to freeze the slab where corruption is detected.  That is, no future
>> objects are allocated from that slab, and attempts to free objects from
>> that slab become no-ops.  I don't think that should be hard to implement.

Freezing of slab is already done in some cases when corruption is
detected - all objects are marked as used, and further freeing attempts
on the slab are discarded. Perhaps not all cases, which could be improved.

> Thanks you for your responce. That is my mistake. I will remove the change ID.
> 
> I agree that freezing is better than recovery or panic for the system's stability.
> However what I want from the patch is not just to make the system run stably.
> I need to immediately trigger a panic to investigate the slub.

IMHO it's a valid goal to panic more quickly when debugging, and
enabling slub_debug means debugging is in progress (as opposed to normal
production when we try to avoid panic).
But making it possible to reuse the general panic_on_warn mechanism
(which can be also expected to be enabled when debugging) is indeed
preferable to introducing a new slab-specific flag.

> I would like to analyze the corrupted data at that moment to check issues
> like cache problem, user errors, system clock frequency and similar problems,
> not just passing by without any issues.
> 
> However I agree that panic is not a friendly approach.
> I will modify it to notify the problem using warn() and then use
> panic_on_warn to trigger panic.
> 
> Thanks,
> Regards.
> 
> 

