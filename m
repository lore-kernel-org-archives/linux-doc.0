Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971AF218ADA;
	Thu,  9 Jan 2025 14:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736431255; cv=none; b=jzPmo9bgYzrxCFPrPbbwWLk04/PftbVNG6K74LuNEvqG7zfA75Uv8xFyVv12+idEevQcmV4hUILW2GH96SgtL96npf37qf16hdXwx8CU8XOT3GxbKVahUlPbeMUHKdwtEvdeR/UbDMF4FOWtw4CRaonUb96ag3EIhpRgP3pkk2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736431255; c=relaxed/simple;
	bh=4aw+r9tfALf9OsNGWYrZZC8yANgRv8lxy31OOMQbjQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bKD+Okw/Mjj4Lgz8e6of49Fwn7wi4VpRmkfZGhZd2lTddTv2sGjeYZ2ENxJ5CEkcHj9BXrpDTPQL01T7VIFjzOk9nOx8K3XtzKhkmjqH3Chplpaus76euOvJuPdswQK4eq7M7w1t+7qmw6yz8gJtKWkuHC1VyEqvkinUUnt5hOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=zXDr+FnO; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=VXMIPune; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=zXDr+FnO; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=VXMIPune; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="zXDr+FnO";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="VXMIPune";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="zXDr+FnO";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="VXMIPune"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9E55F1F393;
	Thu,  9 Jan 2025 14:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736431251; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xl1eoUIsi7belwBdWckFhL+Dfd4YDNuITFVEMGaYH7Y=;
	b=zXDr+FnOhJYrDCNvZpaxyjd3ZxEnZRtQWunC2WO9hoEN4fM8ox3FHiV2qS/Mc72ja5BUAZ
	7V415lIQk9YtieFmLWR87IO+t7RO5i/uDiyZo1LxhXgh0XAc9ZiYCEbuSAigeP3q/xfdNK
	lKrgP63J99/T+dylSI8T5JRH9ky1/DA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736431251;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xl1eoUIsi7belwBdWckFhL+Dfd4YDNuITFVEMGaYH7Y=;
	b=VXMIPuneF7Crx8WHqCVzLy1HsH1hffhhFyTD2xOm8DiHqZnrRAVgpj1mDK+NtF690+fH8a
	dvMyqBZrMun1cPAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736431251; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xl1eoUIsi7belwBdWckFhL+Dfd4YDNuITFVEMGaYH7Y=;
	b=zXDr+FnOhJYrDCNvZpaxyjd3ZxEnZRtQWunC2WO9hoEN4fM8ox3FHiV2qS/Mc72ja5BUAZ
	7V415lIQk9YtieFmLWR87IO+t7RO5i/uDiyZo1LxhXgh0XAc9ZiYCEbuSAigeP3q/xfdNK
	lKrgP63J99/T+dylSI8T5JRH9ky1/DA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736431251;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xl1eoUIsi7belwBdWckFhL+Dfd4YDNuITFVEMGaYH7Y=;
	b=VXMIPuneF7Crx8WHqCVzLy1HsH1hffhhFyTD2xOm8DiHqZnrRAVgpj1mDK+NtF690+fH8a
	dvMyqBZrMun1cPAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 737E513876;
	Thu,  9 Jan 2025 14:00:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id T5D1G5PWf2dSVwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Thu, 09 Jan 2025 14:00:51 +0000
Message-ID: <6f89cce5-4ddf-473f-9112-cc269961b012@suse.cz>
Date: Thu, 9 Jan 2025 15:01:45 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/16] mm: introduce vma_iter_store_attached() to use
 with attached vmas
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
 <20250109023025.2242447-5-surenb@google.com>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250109023025.2242447-5-surenb@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	FREEMAIL_CC(0.00)[infradead.org,oracle.com,suse.com,cmpxchg.org,gmail.com,intel.com,techsingularity.net,redhat.com,stgolabs.net,kernel.org,sina.com,google.com,linux.dev,soleen.com,lwn.net,vger.kernel.org,kvack.org,android.com];
	R_RATELIMIT(0.00)[to_ip_from(RLumbhs4xhzuuihrchnpuyb6qu)];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.cz:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -2.80
X-Spam-Flag: NO

On 1/9/25 3:30 AM, Suren Baghdasaryan wrote:
> vma_iter_store() functions can be used both when adding a new vma and
> when updating an existing one. However for existing ones we do not need
> to mark them attached as they are already marked that way. Introduce
> vma_iter_store_attached() to be used with already attached vmas.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

