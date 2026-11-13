Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559945;
	b=myn2W9CSp0XP7ooXouevgsX2WpPCqxjvSRWJ1JSv28ziANk5S4JJLvN86hlAUf1LTHot
	 oCbs7ZY7fSWxVurM48igymK0GE6QWxq5JiDtwjSjIPK6YU9a8zSHFp1sv+DAuOFULWUcx
	 2FSf06OjZn7PRFjZRlolNicBwIx4oagYH4IVMw6jrThd+RaP/EmCWQqdwII8XdfNKw0tt
	 MyDG7BJwGz5SgqAucARzEqc+rrf5J6bk6SX+wD1jwKVJetihlB5qpqiYU7CYKisr/Z83+
	 3Cm/eGPmkYEoNQjA/YECmZ6d9Np8WTplGZ+/c11bO0l93YGS07JnAVfHC4H1m+4wOHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=sQBXOWZ0Jeg9Kyjo2fd5tVPCdhkMAv0V+YCAjxLdw8k=;
	b=zEmWMSA05VBVskVgGcoYWvVu+Yhu+UJfEzOntyEgv4OsKt5x1JrkmqLdJIVqPXrzLM15
	 vRI3YCbrfGmHanQXz0t7IRx2jOIvfTooJPigsjn44fH2V9GeXGQmOqkKOJGRja2k7rnVU
	 b5d09oujzrYCYp1NUkrnEES1l+vE44sQDmzz2WBS6XpOKHPbvu9XIwTK/SuLa6+po6lAo
	 wsW4EydwZfZSYJUlydxZt34q8VEiSkktHzVPmgcqD6HKqJZwn1nMahvPBGyWi7s7r+Dy/
	 fS3P8VUnl7UX2DZ82OOMHqBL81yEP2T41rd/Lf7POcNiHEHj+Zfz3bFMQbNvbKDhANw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=O8X3S6sy;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF41606B343
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AF41606B343
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=O8X3S6sy
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e98798cbddso5729505ad.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 00:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559945; x=1795164745; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sQBXOWZ0Jeg9Kyjo2fd5tVPCdhkMAv0V+YCAjxLdw8k=;
        b=O8X3S6syhCVWEmK/y18DRmSh2jQdYWheWlQ71KHRscZ8aeplgfQxyAKE7u1N//3Ldl
         E2y1zEk0rsic2g9snxMDHaNdDwQ4rZvAsvfE/wjiUJJwY5ErnbFbOmq2HtfdLZTKhtCo
         vi25f5Lo+4mSsRe7z+QSfxIGK+A3M5hsA0ws8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559945; x=1795164745;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sQBXOWZ0Jeg9Kyjo2fd5tVPCdhkMAv0V+YCAjxLdw8k=;
        b=rSgv/O205BxNmoT+b90nqhMjdndIPKff4dOgVV5/uAStwgMPwPVoR8h4LJIuif70Mu
         W+Ff4p87w1cHZovPn0PDj0sG43FNJP7MD6ojU0mbmhcBzBtryKTx7gSppG+F3gKHfgoj
         2AwI/tPWMTkadXSDYipAvLJyZlNwZ+zWsfM7WyrzAYuGroWwhtJaJtRe8Lkaw2A7QXMt
         n3V9GArMpmXgoL31eHtVZ8QWyVQ34EvnFxPd43X2w4ncvWmG4EYhJ7W2pvGpqTnZYGTK
         LyrCrgx32tVdc0N8r6sBYV19Yy/JefdtBfXRvriMhAVTjZuE/xLQfIIa49Hyxs9X/pY0
         Hp5Q==
X-Forwarded-Encrypted: i=1; AL+hErEhPiMJQG1K1VgLRsfmYqj/CSfcNiBd4czAs/HeCCzBp81qy4+DaNwUDJPNJI4hPItHeOPncwTL+Rc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9srOwfZ/k8UecMSHb/fJdwBUB+JjjorFciokBc5fvsjtg2hd1p
	+/ZF1Owww6drjcxzp+C8aFQgU8trOD+UWoRAH1e9erUJCRQmMqyRXC+YxILSf4OPKRU=
X-Gm-Gg: AYBFou1iti6M/wV21UCUbmM6UgePXOwwcAACkovfM9byWTB8l7UjMEwM7h477gB/bLu
	+fzgMnnTmg2cTpEbtVor0HC69mEQvmDBewGRZqYy9cxbdMtcoSM6B/KdIzWkGUDymeRhw6FT2SX
	dWTRi9b//nEgsMBUuYOgzuP9Gud1hRenps2uO8QbUso4/cD9ckyRoBiWzMVc395I2HUaIvGgMhl
	7W5lE4Xc6w9E9cOqGFrdB+aA/yB49nz4HRke9YbpoXWT5d7v6vhZr9fQ6N85iAk6b2IxKRWZ9KO
	tsHX/LSAG2inD+bS5bd7xQAO5F18i597L2Y1wKxetMtvWX9Awun7vBFksoL95tNK5WLhdV4ALyD
	jqIV1eTf5xnOD3OE/23lauSS3Jltf09x7mjfYwhV+lQgU3Ly6jWpyj+Wwj0XhaOZRGHI1b48Xxq
	bDPGRakrvgAK5uxSrj3sVB83ye9b3A91SPUjD6o+Nr3jL4eWQj6PH96oTxf6eAVI9vBSBFaXr+o
	J3sUPQQ4aymej8yuk+QkKZQaOnP+hhFbvEB5I87oL+xdjhlsD+4GOJi9yHJ8+0KM7YcHTxBrBGE
	7MYTO9rRS1WOSL8KUxXGLDtQUrHuO7eZzgdLB32MLmrRISvPLnjQvAwgvRoAeqUYTDPflOIKpXt
	Vl/ruIQzpv8tRyc+f52dKtuXTJoNg4+u3nq+6So7cmg2loULKCJvLR2HblEFz55B1bXwqySPoBi
	Apm9YLVFC6nFL60uoxVx2WPH1IAF0jo3CSev8/hDyWgJcEW8ljXPFnwv7k+r4=
X-Received: by 2002:a17:903:8cd:b0:2e9:5714:608b with SMTP id d9443c01a7336-2ee0df40edemr17713825ad.34.1794559944843;
        Fri, 13 Nov 2026 00:52:24 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75b472sm6940845ad.19.2026.11.13.00.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:52:24 -0800 (PST)
Date: Fri, 13 Nov 2026 00:52:19 -0800
From: Chris Down <chris@chrisdown.name>
To: Harry Yoo <harry@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, Marco Elver <elver@google.com>, GONG Ruiqi <gongruiqi@huaweicloud.com>, Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org, linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2 3/6] mm/slab: Support disabling SLAB_BUCKETS at boot
In-Reply-To: <aud4gPOUzvHtLYnJ@thinkstation>
References: <cover.1793253633.git.chris@chrisdown.name> <9a68a4d95830352ad3821437c2e22c30a673055b.1793253633.git.chris@chrisdown.name> <202610302115.8C7AD110@keescook> <aud4gPOUzvHtLYnJ@thinkstation>
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
Message-ID: <20261113005219.f954ab03e886b1c3@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Harry,

Harry Yoo writes:
>A gentle ping to Kees to hear his thoughts on having a bit more
>coarse grained boot parameter e.g.) `slab_hardening=` to specify
>how much performance/memory is worth sacrificing for enhanced security.

For what it's worth, I'd still prefer to keep slab_buckets= and
kmalloc_partition= as they are. Each one maps onto one config option and
one cost that you can reason about on its own (about 1 MiB vs 18 MiB in
your numbers). If we want slab_hardening= as well, it seems easy enough
to add later on top, as a way to set the defaults for the individual
parameters. So I don't think it needs to block this.

I'd like to hear what Kees and Marco think too, though.

Thanks!

Chris
