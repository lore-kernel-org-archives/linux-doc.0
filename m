Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794960409;
	b=m8IUsRz/GeolKyetTysb/EW53BtMV9prHQenF8/CQ+do2S31HOeNfotmczQzy4XPwGGl
	 03zzW6FKNu7eQhi2kN4u8vcgd3AiCT6f9ft15Wc2nLpGLuYkVJJaSHmBn/4emWUpXMuaV
	 po/wOIRb7KSqm0lXqCDiE8WGeEsYI5+j1Xgi4ak/MfIEZeoFE92LOaUWyUSIx4PvbmMyj
	 IXRbgieJr03qfohzK4QIhxur7brTZF7/O/CUGIkyMr5kJzaZuPCHaJEGkYmg0jk1H7ZLR
	 hOUXlxODWHJq368wVKd3hXb83Wac+6v1ppTN+dbrniZFn+fbXxaLhImom5yy0Tmkr8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=EFsKUadGG4JNXWjlD0c48hYv79rszfYTM4l79IQ0eAg=;
	b=n7n2gr2gXAuxmtCzvFPI915XrU1jHOeXfWLBM/gbLhLO8NznaxDn+GjH7PhqyhVKmQtU
	 LBA2jhf7LP7dzLik/KWxXALr6iVNza13CYfv3utMvTwtIeHzGMlnBCJ1/0f3Ac9CY8yrv
	 GySdDcyJg+UtfEORk0aayuODnSt8QWbXkJDgWL/fE1/CUZfHrWHvGXNGzdu1M9pMWOJ4T
	 iXwM96tY1/RIEdqDWuhtAYLYNQ2wjGO9tXOlNZfmautHAuUgqAPQfwehakIcWHRMhGWUf
	 o5iqBwKB/imyJEO+rxoovdYS0CYSgE+cWyDyNF4vIgJiGt72hav4WCk2GMFylq9/+nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=eAsU4TNW;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7561606A32A
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 00:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7561606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=eAsU4TNW
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-380b40319bdso773162eec.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 16:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794960408; x=1795565208; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EFsKUadGG4JNXWjlD0c48hYv79rszfYTM4l79IQ0eAg=;
        b=eAsU4TNWIHz8OfqBu5aEzcROnzrPvipyADCOhrzGhwgQQw1Txs+jHpwGPT6Z7o9OTM
         ZZOEXiyOOAvysqBsgy7PNXNTNA4foSUU9eMcGDlyAv9ct1onJOWjMfC8UpgrPehe1CqD
         eIjOkZP+h7S+cErV/MUnJXyU9irDYiA8/yr7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794960408; x=1795565208;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EFsKUadGG4JNXWjlD0c48hYv79rszfYTM4l79IQ0eAg=;
        b=y1szNQYjpt/HCv5tGK32jAHLM11RuJzjs2KSI1+4sW3b4Za+Upy+mSpjpGCE+9Kduy
         TLHN7DGiDMmXo5x0OjctkVoFnYnitAtbQD75wT+7YersgBLpxUU+VwrCLx/BkJaIWF0m
         Rywka15lk9A1ahhzILU14R2b+z97rd9y4eUvMj7AJRyGP4HpnY1y45TSQDoZ4EG3gFZd
         iCgu4F0182G3AUbdc6MJ3KCXVaOQXhOAC0pBlvkECKEQHis+Q+VY7uRA0OCveLwB1vVB
         mYuhjEQTjOSIRt+99/7EcTgh1w4B8Z32/Etq+QPSgASduBmaHCcvbwt0/f+EIT0rb1Rs
         U5jA==
X-Forwarded-Encrypted: i=1; AL+hErGRJLuw4J7vwFlcrlqH0MA9+1h+uKF6IOaRTdGjiqTP8bUTEIWiAbwz8ArpsmO2KH376RNB9bvQmkw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UeOtdJQyVh4K6kypW1tfsOE5SAK9xxi9lX+GTwIdWFdBuZeWW
	4cmuEfrOSfbnCWEJKXth52TJrgV28w3rTokL7Uvej+6ycaLaF57veIQw3MGsGZf1jK8=
X-Gm-Gg: AZFdTZf7CFmd9QfFh4/uza26hUdd/ySrJaga97Xs6Kwkvg91uvZKp3g9v39Mn3KXVbS
	z291g2Z1zC/InWX8oWuuWgeNhFQgbzxoGadBnq66B3ky80e+mrNza0r/FYjNKexk83kheS1IDPb
	PY7paYpGmM5ogK2SF7zHWwcNC35xw99lEJg82z2y6bsVgly/diHRxtomvHxHDS4BhJNRwYjkVGg
	his0sRqyVb1fwOCYU0WdkzA0ou2v2aCJeX+/P0hCi519VCuYCTeqcZg6uEINVxPqJsOMNldjLvU
	GlqCsfjbLPnxuS/veSNB3MeJZazsgrLsR3sQ0XjBWtERdXxiZz4D7ZR4F6GuDgUjYuQ2kJphjbU
	W+qIQJcdjYbJQ5iVZyeffmkbwCD5FRa4vyzuenFX3+ZAuljPkDYlCeVRQwLeRCUrYS+P/3UWR4J
	1JxCXCvnOC0SpkiC8y1gaIZRj4KqWTQDBRe+wFLgNmETGqNZxbH87qBJG2KjtvPtfXM7OzckCeI
	NIbJOwgYfq7tDjyerntqVbGfS7O9fyib1OeYrmEesBq5OJOLXwkSfIGE/0dxfG0KqjfTQ0YFwzW
	G7ljZTReZka9yno2/BUS1qjHXRmmgFB3EBRwI2qD4TPcEoJQ+PRQyEO39HcZffnTQXepOTOXt5q
	PaIT9V9+0Hn2sFxz5BR+D6jwuEyDzQica3FlMGSHxxEFoo5eMuGoCokZQIqLDRG5BpjWBZFfD9j
	ti8UspRhS3uUCeAzz+e8JWiYzmidY/L8OZT7v5p65z52YBxhSOoY7eUI+Nrt+jCtgg
X-Received: by 2002:a05:7301:618b:20b0:380:f32e:d257 with SMTP id 5a478bee46e88-3827f98bff7mr824254eec.13.1794960407817;
        Tue, 17 Nov 2026 16:06:47 -0800 (PST)
Received: from [172.20.0.3] ([172.56.235.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6800338sm1714896eec.11.2026.11.17.16.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:06:47 -0800 (PST)
Date: Tue, 17 Nov 2026 16:06:43 -0800
From: Chris Down <chris@chrisdown.name>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>, Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>,
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>,
	Muchun Song <muchun.song@linux.dev>, Joerg Roedel <joerg.roedel@amd.com>,
	Lu Baolu <baolu.lu@linux.intel.com>, Pranjal Shrivastava <praan@google.com>,
	Ketan <ketan.kishore@oss.qualcomm.com>, Mostafa Saleh <smostafa@google.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
	Sashiko <sashiko-bot@kernel.org>, kasan-dev@googlegroups.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 0/7] KMSAN: Move per-page metadata out of struct page
In-Reply-To: <20261117120627.50601-1-songmuchun@bytedance.com>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <avzsE5wGnXji5u6-@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Muchun,

Thanks! The changes look great, thanks for working on this.

I think patch 5 still has some issues and have replied there, but for patches
1-4, 6, and 7, feel free to add:

Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>

Thanks!

Chris
