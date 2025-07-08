Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8B228137E
	for <linux-doc@vger.kernel.org>; Tue,  8 Jul 2025 13:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751979787; cv=none; b=MzOK8WGM2KKvEY6hAyppA2PNzaYN1p0J7kyMkpNfY8mldxn7xp7lXizrK162LeovS8s2lC8CZHYhYH/Rpq52FeWtUjP77BJa4LIKDYexrqjrY5eYTaRhuD/fhMMVTTTy4oy3liq4s+MAizys3EBpTFhSvs21lfDqidNiMD9uEA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751979787; c=relaxed/simple;
	bh=Y3ssvtVdT6GjWAm8mQjmaHBVjpYwMBCiiVf9vi3pxuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D4gRPj3WK4gjVdNVqB7Fi7twwI0u/MicKZsAiMf7ZqJNWbeJDi2OV2x74UGhQsUBkRcqKLiqeJftgdDvOUWq5Am3MXL1LjhE9sU1f1QAe5crjj8Y6LixmLKE4f2uH7aQWL3cb1wij8+zFRcXiYVpgaoyI0rwhbzCBjRH9c2IWq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QXTJyVzd; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QXTJyVzd"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a5123c1533so2042461f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 08 Jul 2025 06:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751979784; x=1752584584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pBNKDiLRChysupmqvHKYT2mfcl/4n2UVzs+2m0NT2FQ=;
        b=QXTJyVzdueIRU0o9g/i9oqv+5txIZIlJkNbHBbgkqmzy/thsWqAT3kwYEnLTrHM1oi
         D7V4x4KjWXmC8YUTfzCUZOfpruFp0y3SKADlUrcD9ymfZ/xz6NqQmmp14+SON2LpaZ9Q
         S7NEmfS4u6wVRBgo+IhsPrYbN67Czj6gfJLhFpW9i3s1rb0KdCGdEoMO1eLjNbXCAHOo
         GbIiipQVjtdpv+ysL72zUvD5UtsR5Rvyp4phzAgc+VX7Bg8UfuI9NyVxEpBWf4wuojWz
         H4PP4EMfFhHxXNLvFUGaoIIWmAB2AlTpcl+SOx4fRfC2d39zO1fvTrBaFvrAiM/I48uo
         EhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751979784; x=1752584584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pBNKDiLRChysupmqvHKYT2mfcl/4n2UVzs+2m0NT2FQ=;
        b=NKiqptQWy2jZfCw/iUM5yKs4jBHMe4jyy7dMPM17WNT8iGMeAMJM3Xx0BhvDVNAROC
         c2Qa6bA0/kHWcrmxjaHeNqIgvfLdkoob1E/8JmuGAvREJA7hkggAYvAg04B5Sa+y62vi
         kWrvpqKKylYRU+USy7MCF1VAjURFynVdbWkvAZe/K8jWtDYNn71DSJFCdxaqLXyFz6Ap
         SlRMDTD/7Cp5PX858eof4EFzq7EfBTzNtZkd3LkiLHo7pQBhJEVOJFb14ZTvKwOa798h
         sh9VkQeb+vlBeyyD3tniM2GmMR1ZS2fayzdGbUpjvfK4qshOQo53AeDnqWz+temywUD7
         Gzhg==
X-Forwarded-Encrypted: i=1; AJvYcCVOjAnjsmJfg87wgnSS+liwkQhc4JF5ZOFykY0LayVXWvgedpOjfL9VQt0cOBdF50yugfxDOsHOQko=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPziGy3gJWJM141A5kb33Z4aUuJDT5NlluzC0hLlCBdKTZ7eI4
	lkx3ldQZ79zLgXc9KadmJaihOkWaJGF9WYvJxFMBs7GQtlPUO5r1dyFJ/dadyjlgfxQ=
X-Gm-Gg: ASbGncuYdjvtHtP3ibiALhw2H2HwYEhFF5wS5EnwqnwFB6tJqYVBzfYCkLiOyFDB/5u
	oYihMsdZHtUhvkz8kqsXesDAaMTFPO4KDqkvgR2jvy3gEbe5IhXjGbUwx1Gn8Z3yO7uk3TLhFr9
	7SxLyaj5IaJRl79pu4LXJITc1T/yCSZdNJaWU9NhMYsoJphrnBwHxPUyWYc6KQqezwvRWvB8ITp
	Olm0AEEDmh68uElyI/gxAH9/y6VLJhAdktAyVCSLYlaOfZXnpdterpGwihkt/LgiRZShXOR+XNV
	itlmimwiH39Ocg0toe+/pAi6UhYQfVAe2WSBfSNiUCXJzxXHzHM9I7aivNqj1CpEtQ==
X-Google-Smtp-Source: AGHT+IHMi4WXnVkZEVqB8NLtkDRu4v1G03GHPDZ2k6n5a8/P6IJD/eLFHdZsgcA96vMaGQOq9oe5XQ==
X-Received: by 2002:a05:6000:386:b0:3a4:f024:6717 with SMTP id ffacd0b85a97d-3b4964ebe27mr14567959f8f.53.1751979783397;
        Tue, 08 Jul 2025 06:03:03 -0700 (PDT)
Received: from [10.100.51.209] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0941sm12821553f8f.26.2025.07.08.06.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 06:03:03 -0700 (PDT)
Message-ID: <20c5feae-25c0-4c8a-a40a-b35cece6c166@suse.com>
Date: Tue, 8 Jul 2025 15:03:01 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] module: Restrict module namespace access to in-tree
 modules
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Matthias Maennich <maennich@google.com>, Jonathan Corbet
 <corbet@lwn.net>, Luis Chamberlain <mcgrof@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Christoph Hellwig <hch@infradead.org>, Peter Zijlstra
 <peterz@infradead.org>, David Hildenbrand <david@redhat.com>,
 Shivank Garg <shivankg@amd.com>, "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-fsdevel@vger.kernel.org
References: <20250708-export_modules-v1-0-fbf7a282d23f@suse.cz>
 <20250708-export_modules-v1-1-fbf7a282d23f@suse.cz>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250708-export_modules-v1-1-fbf7a282d23f@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/8/25 9:28 AM, Vlastimil Babka wrote:
> The module namespace support has been introduced to allow restricting
> exports to specific modules only, and intended for in-tree modules such
> as kvm. Make this intention explicit by disallowing out of tree modules
> both for the module loader and modpost.
> 
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> ---
> [...]
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index 413ac6ea37021bc8ae260f624ca2745ed85333fc..ec7d8daa0347e3b65713396d6b6d14c2cb0270d3 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -1157,7 +1157,8 @@ static int verify_namespace_is_imported(const struct load_info *info,
>  	namespace = kernel_symbol_namespace(sym);
>  	if (namespace && namespace[0]) {
>  
> -		if (verify_module_namespace(namespace, mod->name))
> +		if (get_modinfo(info, "intree") &&
> +		    verify_module_namespace(namespace, mod->name))
>  			return 0;
>  
>  		for_each_modinfo_entry(imported_namespace, info, "import_ns") {

I'd rather avoid another walk of the modinfo data in
verify_namespace_is_imported(). I suggest checking whether mod->taints
has TAINT_OOT_MODULE set instead, which should provide the same
information. The symbol resolution already relies on the taint flags, so
this is consistent with the rest of the code.

-- 
Thanks,
Petr
