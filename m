Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119065;
	b=gqHRoSo/DU5r/olf9LlEhO/HA6euStpvASMYp5RKj2T1p14zC0YSgdu5S9GOc54K+itv
	 rWJQJulS5zZJ2qcW8hIe9ywqBeIjLEGEUIqqdIKCnsoZy/eG8v6GTY2O+Qebob2+4QbWx
	 E/VN1rAp4lfhwY1lFgrM22ZLhqIFGO/cZI7M8dItq9AXPzHkIRY757MjpMpaTSTK/fWAo
	 xJPsIMSiF+ITR/cy4pRiGdXSCPKnPmo9uYAPvyTi7j1bBli+rQjmQXHTHyRKN+30c0Ejl
	 pe9eIY1TMro+jkGIYX77XGaKubuiixU9ykVSQ0Y0n49yY9Xj9BInabBLqEIM0M6HTTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=DZ6MRBphpDaEsaEkwyVS8b0WlKh787/wwfa+ssjtUBM=;
	b=zORpOADWuIKDyCVgqB3fzylPMf9fYhGG3xTWWyK+b44YzaQlbHR9Gut2+svdhszeCRt4
	 fvxV6eaY5idTe1UN1frB3e6YFx2Bu+uQDkH+WJbWoMwvpX0CzUr3sn6DjbSDvIdRCAg/k
	 sRh2azgN/r8nQgGyTL8FvHOI7n6lkXb7fxEbbo7VZSa0Xaa7ZHZ0VvwTKDKMKZu92GCaq
	 4PoGUBfviGZt7t0Ta4wWWWRr4XtxpM9dzF7wZ6ayEq+NtNeirBGS/lOwVrc8yyvJsKyOP
	 3d30pUx421eqGtjOFWElaf3L+dgbzUBU8T8yqiM4dYtliRk8xxApCLnRyhpVBYwqXwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=jp0oF4Ys;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A87C606A31E
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 16:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A87C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=jp0oF4Ys
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ad787b79ffso73669a91.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 09:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793119065; x=1793723865; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DZ6MRBphpDaEsaEkwyVS8b0WlKh787/wwfa+ssjtUBM=;
        b=jp0oF4Ys897XRGpeW6RKR/fHWs0900z2eISbO0/7YoTTJ1fFarjXa0F+Tp0M1QIRaV
         1g8zSJLLa2lNBbVlsUVyLp3zNvrpzucfIl+D14Xq31PvhpEZ+hIqMTwTXDul/RmgikfL
         CjByDjQ1ylYmmxEchddCELFvL65xpS7fbntKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119065; x=1793723865;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DZ6MRBphpDaEsaEkwyVS8b0WlKh787/wwfa+ssjtUBM=;
        b=bLx7dWgaL4E3p/KQZodOqslSHdS09FXEULoNqOJ+3oUY9E3Dr7jG28jnZKxoqI9NDo
         bcPeFocrZ6v6TIHgTjqXu0UqqR0c1DQHp80168pp/mJwUxHBDCNz1wXuVcQ441oGHWCP
         ETav8qKXSxd/FlOgtkdgc6jvo9fyidp2Hah4SAH83n4IARAk1jYV8rf1WM+7fCpun2cZ
         A4z5E4XZ9Ac6apgs77JUg384bkNVL7Wz+ZjPQzSaPqCVhzXcsnCsNWzf7OFG81AUfDU+
         s2lMm0pFyBfRSNFYozWDSsOfbzOLVOGmJLQnkjIzYVBl1lvXptQEchTXS+hMFscgVigG
         glYw==
X-Forwarded-Encrypted: i=1; AKwUvBz4/DfNKwb3vqeLweUpnO2Os2FQQShyzFsp56dgG97Dng2odaR1X7pkZ9QqO9/s+zem+Sa++o9byu4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpjk4ia6Gsips54xS9rGic7T9+6Zjt352vUC2zTEpsjrOMGyzF
	T9cnBPsWd8yBdXmBkm5vAF/aBVUhQb2Q4E/cguFRXeOxYSW2jVcI8dAyxGajY8RjQnA=
X-Gm-Gg: AYBFou2FquFCNSbQ22cJRyleT7D+nChswCfpaLg9bpqQZXwkL5vauMpNUoIeHgQT04b
	6OlMPDYKqUgt2IC5+NTJl3cW6xCaKT9MuA0RdJAd5Cz3e5jWNjzp6vMtI02FFUufwUNlBFGBpHz
	deObjy8CWTN6gg+mUp09ni/Q2YAhHOOz0uwOTO/h+Pj0h+IQUIuWD1CMCQI8IrVIEL4hAepiB0d
	DYP5Nxrz79cI2ydFztWLv9mgoO8XkOQT23hLppdDeKoti8ycJ4sCRrlbJNHog4bOycCTL7hlf0/
	B+MzxUd9K3YtvTzfe+jJhSyrn95pReQRtkBQb8NP0Ouu28jDyArmPw/y86MnA6qRyGO5Fj8KExb
	M/uB2s9U2Y0mjDAxMwYndu0fb5OttsI8A4NRY87XWV2w8a8J29L7y4iRXJbhs3rV3btIjhKxse1
	uo7Wh6tgJGgdXOefJ1AK7JR3GRUI1T5fJxBuZgtaBZVs/orKcmQ7IUCF6lQuhWdb8N01s7kw9jg
	CjuIlQkao3SVkVOFDCnfMqsGMpArM1scg63QFA3yWoNIaFQ8ia1QOiokXsLcw2WqKokkFvnfzsO
	WZo7m7JvI54PHv0rt5P71fZizDdZQD4t7lQ//CzQLsUT6+ruANJgWSzdxjwMSCOXZyQ/Emg0Ctc
	1dEj7POaQASvUXcV7jzoy0uA=
X-Received: by 2002:a17:90b:4cc4:b0:3ac:b197:1a37 with SMTP id 98e67ed59e1d1-3ade9b2d399mr8594261a91.3.1793119064572;
        Tue, 27 Oct 2026 09:37:44 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae4041fafcsm5635829a91.0.2026.10.27.09.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:37:43 -0700 (PDT)
Date: Wed, 28 Oct 2026 00:37:41 +0800
From: Chris Down <chris@chrisdown.name>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	David Hildenbrand <david@kernel.org>, Kees Cook <kees@kernel.org>,
	Jeff Xu <jeffxu@chromium.org>, Andrey Vagin <avagin@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 2/3] mseal sysmap: Allow with CHECKPOINT_RESTORE, default
 off
Message-ID: <auDTVShTfZ2et9m4@chrisdown.name>
References: <cover.1793094611.git.chris@chrisdown.name>
 <7ff59c2ab6c234ca4d799f862eb7c3f22d671f99.1793094611.git.chris@chrisdown.name>
 <auC7SFhV_qj-agQp@gremlin>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <auC7SFhV_qj-agQp@gremlin>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Ok, sounds good. I'll drop MSEAL_SYSTEM_MAPPINGS_DEFAULT_ON, and fold dropping 
the !CHECKPOINT_RESTORE dependency into the boot parameter patch. Thanks!
