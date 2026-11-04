Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793831542;
	b=xEPPR4/2OtrKxobHQHMsVpGDJUKNphvgMUq3mujxFvoDDGa4yAptmohZOBr4QGme/U02
	 lkSzehSvpvA66TlGKtP+rrb3NKGe6A0OindoUgYjb5davo4RfKolej1j4f/FmzFxzvz5D
	 WkxjPNTpb1sziyKstdu10sk3CtkFK0c7RGu/2s9CBIifIXvJux/efZgA0JjmoJ4Zse4SK
	 MWNngnKCuxcmndbCEzOO9P/FulFffBJGLOXuhVyGjGfadBOBslzw28Xu1KQm3IBfjbM1k
	 RfZUrRZMUkb6T/KUDZGsMvGZ66LWHDEM6W2Zdzh1PZ8dCuOCrgNdotJ2s+EixjPD1Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793831542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=AqrMQTautnZWVcHeal8+VHryjxTdMHJnQLEYqFDhRfQ=;
	b=2zYoVP7mZ4adX1fNXOq6cZINN6ESsUrj6KTb/xjUmXBhPZVCE6GIzsEnAmyJUBXcazkD
	 qWjBr/rf6yCYX9x6xrSRundmfkn6YLiG2RtXldXsvQt83Hw2GMcz4wjsS728soFk0IMyN
	 Wsl0XvIFHt1rOlsGS5rz4s39fpG5jNs1xibx6Q0Q0uEf0W7AbZpNsuIowyoCsrCY0+7zR
	 ECU1nOIaArwGMj3nTPhQBIEHN3m+qY6JiVlxMCN+77kXcmZsqR6T7a+co66QkuEhuzQu4
	 YFyT7WSxYXroyXAjA5gjIIGUMzOOY+72I3xQDNvf0V8MUf3QvsAzqik8zK+MA3Il0Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z7LHOZQ0;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2902F606A849
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 22:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2902F606A849
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z7LHOZQ0
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e95bd1c14cso10352475ad.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 14:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793831541; x=1794436341; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AqrMQTautnZWVcHeal8+VHryjxTdMHJnQLEYqFDhRfQ=;
        b=Z7LHOZQ0+vcoKUS7yCEOrnmDL9Gq4YrSvwIsK5QMV9vH139XeuBqLTQbiHcG5nbodq
         QSX1ZySWx29FjN/EplLMWd24FBt+mCyTuKSInC8DFEzr0ky1W9Tq4E3HhzCZkPwqe8YJ
         PE92jDwE5ZT7DweBwdwmPnLE69d+fhrINoPAd4J/HxFH2PLl3esJAJbJDAZ25lTbiSHY
         M8z4PiYBS6k/3rqlAk1XbEvkp0km0XPgMugi4y8LbTQ5DucCb+VusJmKXS76B+JZ1z9E
         TAudHtwEEiDLzHGvErFDbIxa+pNY1DN8Je7gGT4t0smJlGP8fHhtAoBBDorN5UKEhFDs
         RqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793831541; x=1794436341;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AqrMQTautnZWVcHeal8+VHryjxTdMHJnQLEYqFDhRfQ=;
        b=CPIEMFWmW5xdP9e7JjsEJPoKml81ssV67AgxVt4Nf9cKNEJZawtjrHZKDWnFK87eih
         WpDGHrEb72a/TBfogKwgDbNB+dmwT2HHnkNCdE2t/evqsrY8lRu8cEqrluYPn7L7tnIU
         DUjtAbGbuLAAhrpvZevsiYbCF9e4/UlJqYqQnlWiJTDJMjeSQFhoM4+oHGUhgLoWMd1S
         Krh49nQgOu+Si7bvXNIuJ9mjHz9yNNUDCutVbGSAq5UtgMTGO+okFMvACnORnO5Dqr/z
         LdmxCeMrYS7rr3Oqp2pHvoc6ybzAcYKGJU2g4BSFYkkmvgv9gx/YBK5lAbgrmimVlLFp
         BPkw==
X-Forwarded-Encrypted: i=1; AKwUvBwP9UDkhy1mtSecAioZmPcubi6y9SQ0BGuMhsCrc9lUwB6fGA1Kzbjoj8u9qNjHxYW5CndQsMDIp+w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hYpj6zHRZ0q0zd+n6VLvPo/NC8nBhVABMsixuoFc6mj7/9yGx
	REccp0TM8ocgNwdLrGSpEJsUNSbo1Y0nMRmZH55ftDo3rmw7qwIZpG2GGNI4GRKsiA==
X-Gm-Gg: AYBFou1+vfvS5gsEQiELBP4JCwWtwUJdc5A9DApH6a+kbpYRP5Jjp2l2Ry7vSkqvgLA
	K3m1w/JjuFSP6qPmH44+zAqMKktrQyy6ieiDIdaI80CqCS+AAlMoWBLcs3hEwr2aXEMPdKumWdM
	ktNBzlaqPZoFryhMHPsZz2DFGOadI6rqhotcsr9TBcp2AUJ5t0X2XV7h+nxjSCBgi+U/UM71beu
	i2ZAmZ5hj8JjtbUtA0MiBfEs0gtVhQd7H/bwcv95vf6ShtdCU4aI8iWyWcJy+9DQfH05TX4mAfT
	DUqUBQF75pFAuUv7xn2eq3nJAJ91emuEmHGxeKKPdLs6Q5B5tM38CcEqWlNltKBW2TT7lNp0lwF
	Z1A8Lxo19HXgu5B5CJAPmOhLUKIXEtKav6JM4Y5wLpExmBfpyREQ2hwDjJ2DeyeZZjg93jN7N7r
	9HWl9fHvqYPrHkS71KaopCk9I8sIpvi8jT/z1usQdRAye2iu0nOqaIGd/AG+Hj5ZUOUusVE/1Jz
	0Esu/6XO6nu+yrEz5m/UvFgX7gNvXgY+iO8u7bhRjrlIhMbvTZiKZwjgMUIuPPVDkufg1fGA72i
	jo+03Oy8nn+uWQLT68I0ys7hy2tfhLnxAGge3oXuM/TbYo/llHjFzsFeHO6ljwsHYe1fzhxKao7
	RNnWNtL6zdQ==
X-Received: by 2002:a17:902:f603:b0:2ed:130f:869d with SMTP id d9443c01a7336-2ed130fba9bmr22390155ad.43.1793831541004;
        Wed, 04 Nov 2026 14:32:21 -0800 (PST)
Received: from google.com (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed090a1475sm11919255ad.41.2026.11.04.14.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:32:20 -0800 (PST)
Date: Wed, 4 Nov 2026 22:32:15 +0000
From: David Matlack <dmatlack@google.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org, Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Christian Brauner <brauner@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v3 08/10] mm/shmem_luo: Allow preserving tmpfs files that
 are still linked
Message-ID: <auuyb7FYBX7xdr5z@google.com>
References: <20261103010216.3447716-1-dmatlack@google.com>
 <20261103010216.3447716-9-dmatlack@google.com>
 <2vxza4nok0ji.fsf@kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2vxza4nok0ji.fsf@kernel.org>

On 2026-11-04 05:45 PM, Pratyush Yadav wrote:
[...]
> > + * Preserving a file requires it to be opened for reading, since the retrieved
> > + * file can be read. It also requires permission to write to the file, since
> > + * preserving it affects all of its users, as described below. But the file
> > + * doesn't need to be opened for writing. For example, a binary that is being
> > + * executed can be preserved through a read-only file descriptor. The owner of
> 
> Why are you talking about preserving binaries being executed? Seems
> oddly specific. I didn't know that was a use case we cared about.

It's the reason the check looks at permission on the inode instead of
requiring an fd opened for writing: a running binary can't be opened for
writing (-ETXTBSY), so requiring a writable fd would make it impossible
to preserve. Preserving binaries is a use case we care about, e.g. to
carry over the binaries of services across a Live Update. I'll keep the
comment shorter and more general in v4.
