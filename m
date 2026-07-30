Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9293876BD
	for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 07:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785397941; cv=none; b=In5nFuOAeArcl+RkxFny7eXpxZyCZzRJddHweur1KXsOHZTAtf9SzWA//U1fyMslSPPBdsyGiqy83XRWyccS9Uegy3DBN+hATfQfWHR5dlmCiHIiOtphRhoUnKqnj8KIeyxXwyG1u1gzgC8yD15CHgwZyKV11WFrEWehuFZx/7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785397941; c=relaxed/simple;
	bh=YEt3+RumlJcobW38FE/5XJUtuaZwrQppaUouSV2Cq2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iyvWYWnjhzz5x2uif2XcvN98jUd+0LgC13zSIox+HFu6zEqbO/v4zvrOgNY0MFr8lEpTzyQgsX86lMdm9ikueLmHOXTpfbCy176MCN+NkSwCg21F9OZhoZa5cu4BpMMlZxbv6wTudnXSrl4uorgR9RGvGaZm1le0YfwnyqqjcAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hTUsRzZU; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hTUsRzZU"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4954d29264cso8185125e9.2
        for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 00:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785397938; x=1786002738; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7BVZHSM3RopaR6W0/bDqMe3XMROxNpJV6YavlmGViAY=;
        b=hTUsRzZUUCvHg47bON1ch1DKxK8XppRcPWcKvNAM5kA2u9jdJJubmR5PDLwY+NsrA9
         dIgs2ZvWieS7qKvfxf92QSOrQ0l4IeTRuUdLgTDIerRV2PZwMZCVi3yGlrYEvYAdt21W
         tjUIxzvH/tRfavwyKzbnlebHI/ytBebd3859xt8IhCIjncYyCphyvS2ReqCX+PfwBnau
         cjqPfrDsdadplICa+d7M5ObfNUbqSz7gwpXr0Wz2B3ap7uBhGgmJvSgrtVaZ0/oDIIGF
         wh8UPxcyg6Ek8paymYEz4Pp7eC09ExPmBUuRWVq1KXS1B3U64/GZxU71ml7ZWZ/5F+hu
         xa4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785397938; x=1786002738;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7BVZHSM3RopaR6W0/bDqMe3XMROxNpJV6YavlmGViAY=;
        b=Z492fLqzecTcZzXRnOb2HqzzA+pSvAriv6v9vvS7lcKDoxRUcaqgqKHNQ8WV8MGbHX
         6FESV99N+ybRgGrdi2nsXbFvH9Qe8Iz+ni+TB9Fn9iV8SsBlb3380o2ZLv+/lj8d4+Fk
         5RGIO0iwQBwdFpjVQfpn0a+d4hjK4lwSDoKQmgJfUeOoo8+K6ms9Xa4UvK/jETJeL52Z
         J7qWf6Gs6Qwge27IEb8T3uhSoV1Qntau7gwXmo/oXGfql3y2HDk/xOkZjA723EdFhoX5
         1xou3z/5Dtzu/zxPGLqVqgZ1FVxwx7DqwjCMhpcN/8HYXNrADqCOdp+5hEm03U5CrHIi
         /+Pw==
X-Forwarded-Encrypted: i=1; AHgh+RpEGQYGDglBKOyY4b8J/fY9/M9zSsJWBNGiFOGJWovH2aNVoycHPgQWB1MVL5J11HFKWPYxWjvb+U0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEZfz93RsXCKqFMQpVSiM/oBLSwEzlmL0IqAA/Gi6wk9PTuWMm
	WyB6o9MvTg/cOhzrNRQ6XHpEIqhFmRw/yzwNUdZa6RxbQQbPm9TWCU9o
X-Gm-Gg: AR+sD13bTZT/a283Geu+X5R8o4FozTShK98pnWD7fyTlfrJSwbJ0Q+AU2Qx5KLU9lZi
	mzebBbEXPQqxOaFgZy8i34yzPl/bUwJZPK9Jsyaqht3foTLfz75g//xbogPZvpmkC6BhsIrL3XP
	+AI/oCT8WQhQoBw7oK6Gt0Z3KLna6k7MC2PeC36o+Gu/lBpd6oizTIDvwFAzQdIBbh9wFbL5Bdb
	ugFstRh9f7YPy/LcDr3Dr2ZEM9IzGf1iduTRT3XPbylUxDvzSSL+9FPeUySPcWFkhomaDMkUry8
	YUalmH6sZmeg2vD9EBTJfgMz7Wyv6HW3Cr/LylVzUXuZIYaGHwVGTlZHl+Zo6xbn4l6QO9sPc4B
	oggnFnOUD+48l+WguXfo7/OpQm6Pk8NGUwkFbjgiCTQgKu4K+9jHFKSqc3GDV/Syubws3uQAlBt
	DT+xIOHFtpeWj8yAB/3Vh1I1tKXctkPDspZDLkDrpXGg4dAbOORA4ya32dxb0=
X-Received: by 2002:a05:600c:a182:b0:495:6478:2dbc with SMTP id 5b1f17b1804b1-49800e70248mr12017065e9.6.1785397938314;
        Thu, 30 Jul 2026 00:52:18 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49800f19bb3sm37302585e9.4.2026.07.30.00.52.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jul 2026 00:52:17 -0700 (PDT)
Date: Thu, 30 Jul 2026 07:52:17 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Nico Pache <npache@redhat.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Usama Arif <usama.arif@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2 2/7] mm/khugepaged: extract young page check into
 collapse_is_referenced() helper
Message-ID: <20260730075217.qulyrc5s7olumqzp@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20260715025941.1571316-1-npache@redhat.com>
 <20260715025941.1571316-3-npache@redhat.com>
 <ffb091ee-affe-41b2-939c-6437dd9cc13e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffb091ee-affe-41b2-939c-6437dd9cc13e@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)

On Wed, Jul 29, 2026 at 11:47:00AM +0200, David Hildenbrand (Arm) wrote:
>On 7/15/26 04:59, Nico Pache wrote:
>> This change deduplicates the "is this PTE/folio referenced enough to be
>> considered for a collapse" condition that was repeated in both
>> __collapse_huge_page_isolate() and collapse_scan_pmd(), extracting it into
>> a single inline helper function.
>> 
>> Also move the comment and use it as the function header. While we are at
>> it, updated the comment to clarify that a young pte is a recently accessed
>> one.
>> 
>> Acked-by: Usama Arif <usama.arif@linux.dev>
>> Signed-off-by: Nico Pache <npache@redhat.com>
>> ---
>
>Also, do we really need this (badly named :) ) helper given that there will only
>be a single invocation after #5?
>

Hi, David

I see collapse_is_referenced() is invoked by collapse_scan_pmd() and
__collapse_huge_page_isolate() after applying the whole series.

I didn't see #5 refactor this out. Or I missed something?

>-- 
>Cheers,
>
>David

-- 
Wei Yang
Help you, Help me
