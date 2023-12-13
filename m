Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="ZrDF5ALR";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="9Wndxuy/";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="ZrDF5ALR";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="9Wndxuy/"
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BD7F10A;
	Wed, 13 Dec 2023 03:23:29 -0800 (PST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0A72D22338;
	Wed, 13 Dec 2023 11:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1702466607; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J8oULe9Q6a8Fv/1vVGgO0lyOnjaJjGxb7lQ/bcbh7QY=;
	b=ZrDF5ALRylVVW01ePKPFwARd1kwHO5sKN6APKFmYZORcbn50+y+wAUL0IqAR+8v69WdlfA
	TWxu0Sv7GtTYqUptE2DghyxfNlQ5CwaCTeNd3t16nL1bweYBMpJySlsC9BnKMFPt8dc8wv
	cUuuoz6SfmQ863yGScGlcarBBDTLToo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1702466607;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J8oULe9Q6a8Fv/1vVGgO0lyOnjaJjGxb7lQ/bcbh7QY=;
	b=9Wndxuy/Su5J42prvVkZYyTD/NIEbVKH9YkPlAePFnwuYlwT+l3AaWxbtRzRCzVHD2oMJ8
	DktArNCE62t3pjAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1702466607; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J8oULe9Q6a8Fv/1vVGgO0lyOnjaJjGxb7lQ/bcbh7QY=;
	b=ZrDF5ALRylVVW01ePKPFwARd1kwHO5sKN6APKFmYZORcbn50+y+wAUL0IqAR+8v69WdlfA
	TWxu0Sv7GtTYqUptE2DghyxfNlQ5CwaCTeNd3t16nL1bweYBMpJySlsC9BnKMFPt8dc8wv
	cUuuoz6SfmQ863yGScGlcarBBDTLToo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1702466607;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J8oULe9Q6a8Fv/1vVGgO0lyOnjaJjGxb7lQ/bcbh7QY=;
	b=9Wndxuy/Su5J42prvVkZYyTD/NIEbVKH9YkPlAePFnwuYlwT+l3AaWxbtRzRCzVHD2oMJ8
	DktArNCE62t3pjAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DBCEB1377F;
	Wed, 13 Dec 2023 11:23:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5wo8NS6UeWUSaAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 13 Dec 2023 11:23:26 +0000
Message-ID: <043c49e4-2665-318a-5acb-7081768bc1f3@suse.cz>
Date: Wed, 13 Dec 2023 12:23:26 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 4/4] mm/slub: correct the default value of
 slub_min_objects in doc
Content-Language: en-US
To: "Song, Xiongwei" <Xiongwei.Song@windriver.com>,
 "sxwjean@me.com" <sxwjean@me.com>, "42.hyeyoo@gmail.com"
 <42.hyeyoo@gmail.com>, "cl@linux.com" <cl@linux.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
Cc: "penberg@kernel.org" <penberg@kernel.org>,
 "rientjes@google.com" <rientjes@google.com>,
 "iamjoonsoo.kim@lge.com" <iamjoonsoo.kim@lge.com>,
 "roman.gushchin@linux.dev" <roman.gushchin@linux.dev>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "keescook@chromium.org" <keescook@chromium.org>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20231209135203.303508-1-sxwjean@me.com>
 <20231209135203.303508-5-sxwjean@me.com>
 <PH0PR11MB51928F0D78863B3E76457622EC89A@PH0PR11MB5192.namprd11.prod.outlook.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <PH0PR11MB51928F0D78863B3E76457622EC89A@PH0PR11MB5192.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Score: 6.33
X-Spamd-Bar: ++++
X-Rspamd-Queue-Id: 0A72D22338
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=ZrDF5ALR;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b="9Wndxuy/";
	dmarc=none;
	spf=softfail (smtp-out1.suse.de: 2a07:de40:b281:104:10:150:64:97 is neither permitted nor denied by domain of vbabka@suse.cz) smtp.mailfrom=vbabka@suse.cz
X-Spam-Score: 4.42
X-Spamd-Result: default: False [4.42 / 50.00];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_SPF_SOFTFAIL(4.60)[~all:c];
	 R_RATELIMIT(0.00)[to_ip_from(RL9sdddhhbu1oo5wyhn6sr3k5b)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.cz:+];
	 MX_GOOD(-0.01)[];
	 FREEMAIL_TO(0.00)[windriver.com,me.com,gmail.com,linux.com,kvack.org];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-2.57)[98.09%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com,me.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DMARC_NA(1.20)[suse.cz];
	 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[16];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1

On 12/9/23 14:59, Song, Xiongwei wrote:
> I didn't change description as you mentioned because slab_min_objects doesn't
> save the calculated value based on the number of processors, but the local
> variables min_objects doesn't.

Hm I think that's less helpful. The user/admin who will read the doc doesn't
care about implementation details such as value of a variable, but what's
the actual observable default behavior, and that is still the automatic
scaling, right?

> Regards,
> Xiongwei 

