Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559940;
	b=IadlZxkB48ePntCk3YtLXoPAWAp5mEdMqVyMB3yNjiFk3L/Tc2aTfdtBF20xOD/V7f3Q
	 KNMAMeka8zRMiiR4IGag7xDCVRauTWPKY81Qw7jkdwxsYBV9ro6M01EjJxnhZ3GJBzEeW
	 QWvADA92Uw1Fp/5b28tbuK504H9RZYhoQ96YLWirC7SEMokewoCA5RS4cRSq8VzOq44Ai
	 So4f9rAZkn431FNnD5bHQnztgdDW5zXFtcdppz+IlBKGKOdnIwwFAf4ME3RFWl5E+Ghe2
	 wpFGz/j39CvWJhz6xJOXrMnRH287gjwdzM75ApUbJ4r4EcDd6CoSUifvY7jHewYMMwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=e4bPcAILoFa159OMZMpYEpI9iPNGmEeupM4uWcOHC14=;
	b=OBiR1aGKPvkqDrtOMxFOen/LwxVYVBhpBAEqP+XB94gNrGxqFc6hSk8qGGdJDM7cWfuG
	 QtyUd2VORmU0pKXklDxG3VBr5pCAZjKse4OD83zjfxts9d2RILNcXsfWiM2OGY87Q0eE5
	 eHCpZYxn39HoGQffnyiqgJ+yS7nYhdqB1V0PXor21KS8Wi8MfpEYTFmEXuZDkQEaOZW98
	 7r+7WzyI53eP93FufCcnwR6iHP/sdni0q+MyGe9LTqt/6xf+o23PGdEQg5p37XDneTJVI
	 7/pmrRxUEpMLu/nZTjQIjkjFtJ7saUDbNDqZKU3n8yE3EfXnxTnn0xLi80oTXm2rzDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=sfmDehrG;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377EF60A6F50
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:52:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 377EF60A6F50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=sfmDehrG
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso837053a91.2
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 00:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559939; x=1795164739; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e4bPcAILoFa159OMZMpYEpI9iPNGmEeupM4uWcOHC14=;
        b=sfmDehrGMuC54s47QTefOIcfqgHZa+7vrS3luDVNdnTqceF4rooXYxrQi01jbYr2C1
         C3fd0Y8Nclxu64x0i0e1Bikk49Nm9JsIcmq72LvL6YluDn5JL3hXTo1Dof29YystGvwv
         IghGCSDCUaX65mGLt5jQD0af8fBVNV0t3+GDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559939; x=1795164739;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e4bPcAILoFa159OMZMpYEpI9iPNGmEeupM4uWcOHC14=;
        b=HSGtmxO6yidm9Bmv28Row6lpJU0wL8KeWO3fwu7ksVK+PueoWrF9IgGMBUKOofrQT8
         EXhCp6KWlawepw+ev4oJnrBl0UC8P9ZchyX/70hIu0UmNX+sMFDB7oVFk7OHUAw6IWth
         MtaIUi8OiX47R9Ue7ZajjOxpvU3jPdQbf23De0Z8KUVANnhwu7txnmI14bqTxxD6YIJJ
         kC+cyLl1BIqcJAC9K4KlcOuf3/a0gvO5o/nAZuLVXPnBrghIqgI9E82BEjYpAmxVgx2g
         NUeZ3Vz9Yz+VDeAFCKz40COCrXLamTvTYNbIicgFJHTM4/ra+uGIWdvxizuJZxz+U/xd
         0aaQ==
X-Forwarded-Encrypted: i=1; AL+hErFgnycix2njYsYXL1LMOgrnvj4Cw9BvVb5lWctu8hDLsNOMd0W1oX/DUZ6K6+3/I89bHn/GZd38Ofs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WcGrn3Hr4iDNm55Bfei//DkZr5JkVceKihvN/xtZoammi9Euy
	O+PyFWfyf2mp2FBsIAo1hyO4lywCHZMtMElNk8l7RxOTd750AKJcvKvzdHXnaQk0NrA=
X-Gm-Gg: AYBFou12+r5TaORAD4fYgJNX/2iW6+/ckDBhEdzthh4RHjHN3mTUwbho9LPGL3MCwyx
	P6RXs9JW+8GcGxkwMapgUJdsaLdcZDwy7EUXjygcHdOolzohfH1Y3DOY2mZawqRClFhf39+FAKL
	rpBprVCTd8dIn0qO4u/jb5/qXhhvHOXrtwoXlX+hyu2J1WWW8Nqp3dr68HFzM9oVWBRahu5YooT
	w6BkFNDUnOKKNDv6PpFMxgeIIeGCd/fleftSk6MHAKWTCX1jvzAoxlVClCrYtZi67RlBBJbRHEN
	RZ+sf2H2SD38NEPZoE0A6nj7Oysvc7VI8daGwSQMBdrgwifvPQhffk02YuA+fT4yV4N9cFG/71S
	wLdGxUEe4cyVcCMb4HjQJ3guqGJoo2XZe3bdrn2e1GrNBLUSEcVs+sYWA6EMiB1suFjJrzfhoiE
	Acn9IWvwjmrjjXsTRCICs/Ekk1QNLiROt3ZemKxWNAiobMw2kOK7+avdMNSJTiCZT1kLh8J52Ng
	xeZ9oSgwYKdpmSU3y1NRzwOnYrCpr66PJWsK3zrQV8YM8UWGQb9OLNGpQNEzz0Ir3+EXOfihuKT
	vOQW4dfL2t3IjmHyGyFU8Z6dmMLxtUO3i2IiASN+/po+1qVMFN/DSwtuwiLTqpfJwG5NLwvBfvm
	KuCL2V8c8/mU0ykpEfCOHzvU6KIT+FBmmk5oIFS5o9he9d+J1Yv0DhiLW8e7JRsNZQPD5RmT5fr
	qiUDNJ9FLqOkhH+7/L9SIhnl1K0z2XCHQ4wu8pwYrMekp6KafEMIxlh2WmepQ=
X-Received: by 2002:a17:90b:58f0:b0:3b1:4eb6:b3a with SMTP id 98e67ed59e1d1-3b1b081887amr1718429a91.8.1794559939633;
        Fri, 13 Nov 2026 00:52:19 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f4ad534sm7140735ad.9.2026.11.13.00.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:52:18 -0800 (PST)
Date: Fri, 13 Nov 2026 00:52:12 -0800
From: Chris Down <chris@chrisdown.name>
To: Kees Cook <kees@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, Marco Elver <elver@google.com>, GONG Ruiqi <gongruiqi@huaweicloud.com>, Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org, linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2 5/6] mm/slab: Support disabling KMALLOC_PARTITION_CACHES at boot
In-Reply-To: <202610302123.687A961@keescook>
References: <cover.1793253633.git.chris@chrisdown.name> <617bbfdce4fb2689c2510f0cd7f9adbb3ab8edfa.1793253633.git.chris@chrisdown.name> <202610302123.687A961@keescook>
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
Message-ID: <20261113005212.556c6f234712bdfe@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Kees,

Kees Cook writes:
>Swap the ifdef for a CONFIG-controlled static branch that defaults off
>without CONFIG_KMALLOC_PARTITION_CACHES.

I've dropped the #ifdef in v3. kmalloc_partition_enabled now defaults to
IS_ENABLED(CONFIG_KMALLOC_PARTITION_CACHES), and kmalloc_partition= is
ignored without that option, so new_kmalloc_cache() doesn't need any
#ifdef.

I've kept it as a bool rather than a static key, for the same reason as
on 3/6: the only reader is new_kmalloc_cache(), at boot. When
partitioning is off, kmalloc_type() still picks a partition index, but
every one of them resolves to the normal cache. So the flag is never
read on the allocation path.

The one place a static key would actually help is kmalloc_type(), where
it could skip picking a partition and go straight to KMALLOC_NORMAL.
Since kmalloc_type() is inline, that means exporting the key to modules.
That seemed like more than this series needs, but if you think it's
worth it I'm happy to add it.

Thanks!

Chris
