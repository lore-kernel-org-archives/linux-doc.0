Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7A321B19F;
	Thu,  9 Jan 2025 14:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736433700; cv=none; b=fhP9CFC3Ei7PWzsZPWQVveMh/lY9HvSzMk5bDB/14rinBFGiknqaHcpMKMd+F6DpkrWftIReY3UjISVaw6epLz8BqQX2ii0+9xuZbVCzDDw+ypyDGyXALA2iIJyIGU/dRL5Gp1xBfOAwpiGBerkavY0SexU6cdPb8lbmAlnzGo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736433700; c=relaxed/simple;
	bh=AEG/PRplX7Q9Ar4R6s9BNcxTSrxfVQJ2ez+AGOhphAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JjT5E7HkerGhBVnzKRqPLMRXNAiOYHuARGM2ie08TqahVVOVmYxewKpw7ud8zF3F0Ugg1xX97k1fq1qMqREoGrhI8LxfVv9mpYk+HSw1uNdUls1tYW1VzjvzLUBLjhpMJgUvdtA/uwv4xnxekM4Es3f1Go6VYfl8y67bnnIZ7u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=wyx7EjPR; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=G4456YoX; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=wyx7EjPR; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=G4456YoX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="wyx7EjPR";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="G4456YoX";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="wyx7EjPR";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="G4456YoX"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 96A9321109;
	Thu,  9 Jan 2025 14:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736433696; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QR0ick1q/InlbfFc7W+83ZVxC/nbKmQ1hUsG6IYhMDc=;
	b=wyx7EjPRYHuaWEuIObJGaDc3SjVPtL91zfhWbQ4NTu64ZHhC4aNOUpTL5gsfoNvQaq2KNR
	YudOzeGTSo2PrkRMLaIvKn/ddgf3qaNA1DvhXtjWHQBYCeN6sO50sLnc/Qc5vsgZHJ7Tr9
	BvNVxYLm9aM6+8RDnkqHl9xHb6jj/Js=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736433696;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QR0ick1q/InlbfFc7W+83ZVxC/nbKmQ1hUsG6IYhMDc=;
	b=G4456YoXRQb7ZxxTea/XFnbLl1uE7+q7HQOHjwnksXHEEjBKddfeyTvGogI0LFYa44dfoP
	CR+szlg2WjODWoCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=wyx7EjPR;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=G4456YoX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736433696; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QR0ick1q/InlbfFc7W+83ZVxC/nbKmQ1hUsG6IYhMDc=;
	b=wyx7EjPRYHuaWEuIObJGaDc3SjVPtL91zfhWbQ4NTu64ZHhC4aNOUpTL5gsfoNvQaq2KNR
	YudOzeGTSo2PrkRMLaIvKn/ddgf3qaNA1DvhXtjWHQBYCeN6sO50sLnc/Qc5vsgZHJ7Tr9
	BvNVxYLm9aM6+8RDnkqHl9xHb6jj/Js=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736433696;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QR0ick1q/InlbfFc7W+83ZVxC/nbKmQ1hUsG6IYhMDc=;
	b=G4456YoXRQb7ZxxTea/XFnbLl1uE7+q7HQOHjwnksXHEEjBKddfeyTvGogI0LFYa44dfoP
	CR+szlg2WjODWoCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5821A139AB;
	Thu,  9 Jan 2025 14:41:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +x79FCDgf2coZAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Thu, 09 Jan 2025 14:41:36 +0000
Message-ID: <c592118f-be6a-4d82-b925-80e102a7aba2@suse.cz>
Date: Thu, 9 Jan 2025 15:42:30 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/16] refcount: introduce
 __refcount_{add|inc}_not_zero_limited
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com,
 lorenzo.stoakes@oracle.com, mhocko@suse.com, hannes@cmpxchg.org,
 mjguzik@gmail.com, oliver.sang@intel.com, mgorman@techsingularity.net,
 david@redhat.com, peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net,
 paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com,
 hdanton@sina.com, hughd@google.com, lokeshgidra@google.com,
 minchan@google.com, jannh@google.com, shakeel.butt@linux.dev,
 souravpanda@google.com, pasha.tatashin@soleen.com, klarasmodin@gmail.com,
 richard.weiyang@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
References: <20250109023025.2242447-1-surenb@google.com>
 <20250109023025.2242447-11-surenb@google.com>
From: Vlastimil Babka <vbabka@suse.cz>
Content-Language: en-US
In-Reply-To: <20250109023025.2242447-11-surenb@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 96A9321109
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
	RCPT_COUNT_TWELVE(0.00)[33];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,sina.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,oracle.com,suse.com,cmpxchg.org,gmail.com,intel.com,techsingularity.net,redhat.com,stgolabs.net,kernel.org,sina.com,google.com,linux.dev,soleen.com,lwn.net,vger.kernel.org,kvack.org,android.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	TAGGED_RCPT(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLk41rrgs15z4i1nmqiwtynpyh)];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On 1/9/25 3:30 AM, Suren Baghdasaryan wrote:
> Introduce functions to increase refcount but with a top limit above which
> they will fail to increase (the limit is inclusive). Setting the limit to
> INT_MAX indicates no limit.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Acked-by: Vlastimil Babka <vbabka@suse.cz>

