Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="VSB/pBen";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="0e6iPQ0O";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="LsYDTbTy";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="W9wio/Vb"
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71032DB;
	Wed, 13 Dec 2023 03:10:04 -0800 (PST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DB8D122338;
	Wed, 13 Dec 2023 11:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1702465803; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GqMNj7NL92GZv31m2vvolJIawNqiNIRw7YBZL/+AVUQ=;
	b=VSB/pBenRGO5wNXCiTEwN7bRJCCLdK503RnGh6MsPsSX413eQjivqsL4QTm1DCAQRjnTUb
	tOTo4nxzzy7OTQ3KslGfuniqY6ZYCVceAb0/7adBSf6s77S3NapDx+N2DjX0vngHqdrg+g
	gAgwwQxSVdFctMHNVhNT7cXvXmCrRwA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1702465803;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GqMNj7NL92GZv31m2vvolJIawNqiNIRw7YBZL/+AVUQ=;
	b=0e6iPQ0ODxEOGKSD1cuh0pgTO0oSdtC+BFK1WCvLBS1Pk9nZRNZLAmp2RZreIyZtG1rUIl
	bdRaEzITD6Zl5YDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1702465802; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GqMNj7NL92GZv31m2vvolJIawNqiNIRw7YBZL/+AVUQ=;
	b=LsYDTbTyC1Zw53Mw6ih9EuDrjtULfyGmMd1Cw0rG1FCsEekYQ4gkWsvMyGRU0neK4lfZ6r
	6j1A/azOe0eq1CESVAyYtPQ7Ncz0kp+XmIVU6fYviYCSjW7RakLApZSDLhLD/nU7sHATio
	exY3LcPZ0Dru3C6hAs6eIXu3QVTraa0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1702465802;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GqMNj7NL92GZv31m2vvolJIawNqiNIRw7YBZL/+AVUQ=;
	b=W9wio/VbkuEoqaEGV64rwM3baZsgcc1NHrvETuT8uDWSrVc8uqMV6VZ+uuGA/DVkfUbnPy
	y4BgWYq3WxMDkrAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B8B2C1377F;
	Wed, 13 Dec 2023 11:10:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DPqyLAqReWXwYwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 13 Dec 2023 11:10:02 +0000
Message-ID: <73359971-25bc-8ce9-3dd1-b3124c18628b@suse.cz>
Date: Wed, 13 Dec 2023 12:10:02 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC PATCH v2 2/3] mm/slub: unify all sl[au]b parameters with
 "slab_$param"
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
References: <20231203001501.126339-1-sxwjean@me.com>
 <20231203001501.126339-3-sxwjean@me.com>
 <75a71276-dff8-ad3a-d238-fcfa3ab39413@suse.cz>
 <PH0PR11MB51928A8212F2EE25916524A3EC89A@PH0PR11MB5192.namprd11.prod.outlook.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <PH0PR11MB51928A8212F2EE25916524A3EC89A@PH0PR11MB5192.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Score: -0.60
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.80
X-Spamd-Result: default: False [-0.80 / 50.00];
	 ARC_NA(0.00)[];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com,me.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 SUBJECT_HAS_CURRENCY(1.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 R_RATELIMIT(0.00)[to_ip_from(RL8m16cxuawb3bjqy6gedmikd6)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 BAYES_HAM(-3.00)[100.00%];
	 RCPT_COUNT_TWELVE(0.00)[16];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,suse.cz:email];
	 FREEMAIL_TO(0.00)[windriver.com,me.com,gmail.com,linux.com,kvack.org];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Spam-Flag: NO

On 12/9/23 02:02, Song, Xiongwei wrote:
> 
> 
>> -----Original Message-----
>> From: Vlastimil Babka <vbabka@suse.cz>
>> Sent: Thursday, December 7, 2023 12:15 AM
>> To: sxwjean@me.com; 42.hyeyoo@gmail.com; cl@linux.com; linux-mm@kvack.org
>> Cc: penberg@kernel.org; rientjes@google.com; iamjoonsoo.kim@lge.com;
>> roman.gushchin@linux.dev; corbet@lwn.net; keescook@chromium.org; arnd@arndb.de;
>> akpm@linux-foundation.org; gregkh@linuxfoundation.org; linux-doc@vger.kernel.org; linux-
>> kernel@vger.kernel.org; Song, Xiongwei <Xiongwei.Song@windriver.com>
>> Subject: Re: [RFC PATCH v2 2/3] mm/slub: unify all sl[au]b parameters with "slab_$param"
>> 
>> 
>> On 12/3/23 01:15, sxwjean@me.com wrote:
>> > From: Xiongwei Song <xiongwei.song@windriver.com>
>> >
>> > Since the SLAB allocator has been removed, so we need to clean up the
>> 
>> "we can clean up", as we don't really "need"
>> 
>> > sl[au]b_$params. However, the "slab/SLAB" terms should be keep for
>> > long-term rather than "slub/SLUB". Hence, we should use "slab_$param"
>> 
>> I'd phrase it: With only one slab allocator left, it's better to use the
>> generic "slab" term instead of "slub" which is an implementation detail.
>> Hence ...
>> 
>> > as the primary prefix, which is pointed out by Vlastimil Babka. For more
>> > information please see [1].
>> >
>> > This patch is changing the following slab parameters
>> > - slub_max_order
>> > - slub_min_order
>> > - slub_min_objects
>> > - slub_debug
>> > to
>> > - slab_max_order
>> > - slab_min_order
>> > - slab_min_objects
>> > - slab_debug
>> > as the primary slab parameters in
>> > Documentation/admin-guide/kernel-parameters.txt and source, and rename all
>> > setup functions of them too. Meanwhile, "slub_$params" can also be passed
>> 
>> Not sure about renaming the code at this point, I would just rename the
>> user-visible parameters and their documentation and any comment that refers
>> to the parameters. Functions and variables can come later as part of wider
>> slub/slab change if we decide to do so?
> 
> I think we can rename these global variables: 
>     slub_max_order,
>     slub_min_order,
>     slub_min_objects,
>     slub_debug 
> , which are used to save values that are from parameters. Because some comments
> are referring to parameters, the others are referring to these global variables, which
> looks inconsistent, e.g. slub_debug/slab_debug.  Is it acceptable to make them
> consistent?

Yeah, as an additional patch.
Thanks.

