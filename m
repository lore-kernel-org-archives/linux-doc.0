Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC7420E6E5;
	Fri, 10 Jan 2025 15:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736523339; cv=none; b=f+Hq9mwmbYyMIRzC43yA8+QeDD9kzmDQNOYZt9BItcU87kW7EQQNsLRcSKO+DD886AzrS6mAr4bviYUOeSoWrYuI8fiVxWV5DIZgj5VfperL48ozNR0wLy9gOJnrah1lApV95m17zYA8pi5GlOetyedtt35zAuJH5SB+XUVyz28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736523339; c=relaxed/simple;
	bh=vkDFVjYGpU8b/zOSIDYDAIaSzNvg1FGBb/o2TlAZGSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fEreTRabGaSleedyflSXEECgnQAoe0Ru97Liz01zxa1ClCRnfEyeCKX9XYOJE4SegWkTcfy7xwBOLm5GSgLioR/eP7nFlqMPEwgfmOR1dvpOQfejfwjPpi7oQ80OUXFwYN+3xqEwak4qoClXM/8wMOcvSN+rQEO0dGotsTOL2aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Bpnn421p; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=1Rf/rFZe; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Bpnn421p; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=1Rf/rFZe; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Bpnn421p";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="1Rf/rFZe";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Bpnn421p";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="1Rf/rFZe"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 430592116F;
	Fri, 10 Jan 2025 15:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736523335; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O7cJOrGVmPv31AML6QCANk75igLQl02QfxGviw3WTZU=;
	b=Bpnn421prCq/UXCYN64tsZ1x4llmtDyDCHuxGeooytS97TLYxbiju5zaVBvRhscYKu/v+H
	2qw1ZFBQCTVFKqc9W7Zdno4YmULfn3h0qhtvYkz9fLwsnVacgpUxl3DBPY5yDAZ6jVQnPT
	bYf1q+cqIjy+UgETY4lHaNnqEdID0HM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736523335;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O7cJOrGVmPv31AML6QCANk75igLQl02QfxGviw3WTZU=;
	b=1Rf/rFZe5rw7aBsuOFurKUBRlep1YnXaZNhZW2ySSmj8TpFDe2L1FRS0Vy5XWtkFPAj25O
	4UOWhcIampASe/DQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736523335; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O7cJOrGVmPv31AML6QCANk75igLQl02QfxGviw3WTZU=;
	b=Bpnn421prCq/UXCYN64tsZ1x4llmtDyDCHuxGeooytS97TLYxbiju5zaVBvRhscYKu/v+H
	2qw1ZFBQCTVFKqc9W7Zdno4YmULfn3h0qhtvYkz9fLwsnVacgpUxl3DBPY5yDAZ6jVQnPT
	bYf1q+cqIjy+UgETY4lHaNnqEdID0HM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736523335;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O7cJOrGVmPv31AML6QCANk75igLQl02QfxGviw3WTZU=;
	b=1Rf/rFZe5rw7aBsuOFurKUBRlep1YnXaZNhZW2ySSmj8TpFDe2L1FRS0Vy5XWtkFPAj25O
	4UOWhcIampASe/DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1B2B513A86;
	Fri, 10 Jan 2025 15:35:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IRReBkc+gWeuCgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Fri, 10 Jan 2025 15:35:35 +0000
Message-ID: <745d6935-3732-4639-a1d4-ead73d590597@suse.cz>
Date: Fri, 10 Jan 2025 16:36:34 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/16] move per-vma lock into vm_area_struct
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org,
 liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, mhocko@suse.com,
 hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com,
 mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
 oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org,
 dhowells@redhat.com, hdanton@sina.com, hughd@google.com,
 lokeshgidra@google.com, minchan@google.com, jannh@google.com,
 shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com,
 klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 kernel-team@android.com
References: <20250109023025.2242447-1-surenb@google.com>
 <52ecd3fa-5978-4f4b-b969-c42b00a5b885@suse.cz>
 <CAJuCfpExmxZFh_RB9t0+KmiJMiPOQ9priEx1xz63SCMTL=b8uw@mail.gmail.com>
 <CAJuCfpEgWOi09QPfTJTNp5mO2=SMx-svSYRmUs8XYZG131Labw@mail.gmail.com>
From: Vlastimil Babka <vbabka@suse.cz>
Content-Language: en-US
In-Reply-To: <CAJuCfpEgWOi09QPfTJTNp5mO2=SMx-svSYRmUs8XYZG131Labw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,sina.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,infradead.org,oracle.com,suse.com,cmpxchg.org,gmail.com,intel.com,techsingularity.net,redhat.com,stgolabs.net,kernel.org,sina.com,google.com,linux.dev,soleen.com,lwn.net,vger.kernel.org,kvack.org,android.com];
	R_RATELIMIT(0.00)[to_ip_from(RLumbhs4xhzuuihrchnpuyb6qu)];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -2.80
X-Spam-Flag: NO



On 1/10/25 1:16 AM, Suren Baghdasaryan wrote:
> On Thu, Jan 9, 2025 at 7:59 AM Suren Baghdasaryan <surenb@google.com> wrote:
>>
>> On Thu, Jan 9, 2025 at 5:40 AM Vlastimil Babka <vbabka@suse.cz> wrote:
>>>
>>> Btw the subject became rather incomplete given all the series does :)
>>
>> Missed this one. What do you think is worth mentioning here? It's
>> true, the patchset does many small things but I wanted to outline the
>> main conceptual changes. Please LMK if you think there are more
>> changes big enough to be mentioned here.
> 
> I just realized that your comment was only about the subject of this
> cover letter. Maybe something like this:
> 
> per-vma lock and vm_area_struct cache optimizations

arguably the biggest change here is:

reimplement per-vma lock as a refcount

but yours is ok to, don't want to bikeshed

