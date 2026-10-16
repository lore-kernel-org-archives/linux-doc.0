Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AC047F2DE
	for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 12:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792153007; cv=none; b=ADGkm9wPNxhdGxgcAeL5uaomWT0TwDxsnasMg3cbvhxbf58uA6E3FAlEhz5M/qVFTkf3/t02EunW7zla1QnYbWCoUCgQD0yb11QgBZwOj1gYfchwX5EQIOBXHEhh5nuhDYSUxYH87HXO0FIvaLJjoQA729cwX1hwdhPLewnuE2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792153007; c=relaxed/simple;
	bh=G/fuQkFUEJE9xmz/wmhoad2EDBIutXpsINbMT306D0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=keFX5gRNKYmAuLFocJfOOJAi3NV7uU0BgtvUbMaRwW4y7F6PU/gp5vdq5znWYf//t8WYkh5MbyWej8oMbpCH8/DNk/0PVp2+gNUwk8ltHMvAg7M56TvWyVv4gv0MXq+NRPxQplB+Jso8b9Vd/NS5rupeM4wQcJSgs0kgiBlWgjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQ10XZ7I; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQ10XZ7I"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c45111bebso4085524f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 05:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792153004; x=1792757804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXwcfo+faB/d8Y5clwXPismEZjCAQ2x4NezFd8SmQ80=;
        b=FQ10XZ7IFg/28nhtcRfp7Wjd07EOAxIu5iJxw2Of5wj5gNyR2cV15GnHvTtCdTgTkt
         mv/NWNeZTWoNzLBaH3uMPEOtYuXq1ukWvXuhzv2VfUn+qKVQD3GVomVvmg81spspmdMt
         srMZzfwNHaNaSyjZJdqy5MGUTAXb50+t5WjCspVA51IA3OKDsJuBk56OYYjZ+5wgcS9s
         3fM0R/xa96bGcq0PyzhEIw6qJKQBMKOVGFz3JYxiDt4h/UV4ehLXvHevoqJWZfgw2ICd
         HZy8TnOyCRSUo6C68mYB6TqWYAh7PjcTq2Y763g6Qrpi9xdxSYSLaZUK5eipRIHakMRp
         Umgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792153004; x=1792757804;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXwcfo+faB/d8Y5clwXPismEZjCAQ2x4NezFd8SmQ80=;
        b=V6z2Gk7RINyReKpxvyWFl+tIsvqTMCWuoW0emCfHYeAPK+LSBREE5vmHkck9OMml3N
         lHlzWFvCGZrwYtjymszCEZivZ6Ws+YZk6/EBLTpgDBaRw1anlqgp2SvyW5Gw4z55k+Lx
         nyjrTcHUT3zM7pPKqcX8BkkgKM0vA/Q4Mfq3ZZUU9Mb/0kSpwiKod+J1j6ITdR4E7Xmg
         Iuh3cL6WFaEonNbV5p8YiL0wlNxpK04MXnMPu/yza4eCn1kQ6DeMnGb3yrshbkICA5yQ
         fESHzBxh4CwBKs6guj73mTTWh1YHSnnILV26LDQVlEBKRlqZdyITcn4ABHBgcgPAWzyV
         HZ8A==
X-Forwarded-Encrypted: i=1; AKwUvBwJ55fj7TjBfNsxI9VwCrf29PsB8CSk2CgpadGZqhS0J906B6Yt/G9N1g0fuILIrdJOBfNREldjLPU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7EUb4BlJ4RdM+tqZe7KIIA37+a3fw9+ehdjabvUkbw0CQ6XbS
	eqp7C7+deTBmW8lId9aXIXuSkCFt77HFA8LpuxRuUp97MTNZ59U1fJN1
X-Gm-Gg: AYBFou2IFljOAegEe5MGRvAc32NdzJozrHIxSEg7d2/Zu3Ljrgn5K1eCdMXT+Qru8Wk
	jHPLKS3DirDqbg8WjxD1iO3omeGL8Xd5b+NbloPVnipsH5i/baCoihs79EaEJzR34lPKvtW/TVv
	u7y0lJiHnUs2ipGL91AUO6sOd8GzSvL89U+dsRkU20LyXgfE7Q3H/qhB470qz9Qn8hEcr0mkC4u
	WVynISPnbhJyjUGJxNsvWnavAygb3imdjejpCCMZ8QLr5qkfWnM15VJb4Mj80piGgRkJJTEB7tN
	EquYQ1vLIdNZ+BIp0lDgV1glhH2abIMNbeRuFsTGAy3M7vVON/8lYxjNXlH6pcfzzuVzHKkIwf9
	mPhtf+y1vSgw1nl3n9JVd+d6aZ1Ruky8Y5QGFMz1wm57HX2XLy8g82G4LSRIMYq9vykO3TDiLbH
	M8wHpT8dnRZKwQ5KeHpJsLL2j636dD8+3HtMtVM7CGbiZoqkM0hMeBt+vjqYNVo5qj3g==
X-Received: by 2002:a05:6000:4303:b0:48d:de0f:b79 with SMTP id ffacd0b85a97d-48dde0f0ba0mr29342329f8f.0.1792153004392;
        Fri, 16 Oct 2026 05:16:44 -0700 (PDT)
Received: from [192.168.1.18] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f5b2dsm5076765f8f.31.2026.10.16.05.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 05:16:43 -0700 (PDT)
Message-ID: <6e0c5a1a-1e82-4847-ae23-1b2574042ca1@gmail.com>
Date: Fri, 16 Oct 2026 14:16:42 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm/vma: avoid spurious write locks when
 mm->mm_lock_seq overflows
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daehyeon Ko <4ncienth@gmail.com>
References: <20261016-fix-vma-lock-overflow-v2-1-9eb778b79b58@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261016-fix-vma-lock-overflow-v2-1-9eb778b79b58@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/16/26 1:34 PM, Lorenzo Stoakes (ARM) wrote:
> So far the assumption has been that mm->mm_lock_seq overflow is benign,
> resulting only in readers spuriously falling back to the mmap lock, however
> it turns out that this was an unsafe assumption.

[snip]

LGTM :) and also tested on qemu so:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
Tested-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
