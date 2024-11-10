Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE863EA83
	for <linux-doc@vger.kernel.org>; Sun, 10 Nov 2024 02:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731205172; cv=none; b=Mpsb2cpDG54KKePLKUrlbVRjE30PG+orNvQtGsL6OU26o6wT1EobZ2Ap+uAwqccd5Rvf7sSKd1bKTO5R7wU+Cq6EUzERfP+NdDHrXjzlF6+DbIM4mVJ2XhPfPUzGvytQpdefId/EiRU/XhyIHqeIhnAGPS/fgPKgz60Op0YVKi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731205172; c=relaxed/simple;
	bh=+pD7XKkk7a2kvnad7+CqzCvmXc+hzqXdXdhSGLuRglg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RWOb+eFrkf0Gv51geWP8BDEax5Xem/qA09SmhjKAFRPMxELnfWrTtSUyYfbMLeD4HjqIPvLC1bHoHdjs04rG4xLSRC1cG0OWXSmGPvOxxSRvVm1wOKgKTIBFs5yLlcpBccDPnN1EFlRCgek/jMqdzQSlq2PzWzth4wS+vEpW1HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PGDvkbDT; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PGDvkbDT"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3a3b28ac9a1so158785ab.1
        for <linux-doc@vger.kernel.org>; Sat, 09 Nov 2024 18:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731205170; x=1731809970; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wtYxf79bGu9AQ23SIiIULXTG3CqHwpSP3g6NHEutdz0=;
        b=PGDvkbDTUZlrFV0XwDHfKC/xqpV7eA2G5OVVtsbdZSHm/t3LzHM/x47NcuJfvVeFIw
         UO3o+QlH1OLiyFP85fCnohJTGdGJju3UA7vZZsu9NpJn+AKJLmXPUsz9oT2rp3xr/f+m
         HkhQBVS63X+LvPLcZzJxdP0dCGohfC71COwGYs5lIWTbg0TORDekM8/Ua2FkhXh3a+JV
         DvB6f2SgDwJ54fEuiZ3I1jaUIGp6EEPrTAx22pNWbhY3QxM2xfT4Dx45fk/Zl4jfvyS5
         rr+425fqBgZM2AMe1MYPYaFiGRftZT6FuzzQ9aX3PtTkUoQshkWtkVLoXdkCjCsaINc2
         Qf4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731205170; x=1731809970;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wtYxf79bGu9AQ23SIiIULXTG3CqHwpSP3g6NHEutdz0=;
        b=tKwpPlNFzoDYxKAKh9FK52Lb0iDJX3JkP0flqEZizbgbHx3eA2dfvGNG/L4bVFF4S2
         mzhhG+Mk2yluvFCSmp4j7c3IOBgt1q/0x70BgliMTm3y3XdMTbJ8Wl6ivXqVGvwBdJmy
         a781on9zESlVgUfdkgIpHKtNyfCtkKAA5yOVycvCtKDTSYDX3r5Dc0kt5CWV+Ow5cYKe
         psuVuX5F2+vV1gpqmTjJlS28a1/ZPEvq38AxNuezTQmN1Z01ISN+K/0IV5UNgWLJSY3+
         H4ZSYJWfJtu7VHBBqLb6ljh3zFKQ5kbgtxNwDHHLYkIEy+Zxa5n7o9vslOUYnkHea/vX
         ed0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQAvFAQXXJkiLfEhy63lGhT3w8a6V2hdqCQfSgIAyJRbzcd6/ricE/jqbUg0j136bVznj4r1skrQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0sF51n9kYUYrTwllA3ZLZWu+JU3HlkKIR69JQDaUeFTlhpEVo
	dNEfBGg47pRK0gJDE/yRIgZ1UdNpzhvOdrEyb6DqFwhuJ5smDVMZv8/YFJfmzA==
X-Gm-Gg: ASbGnctOOtniCsT/mnho7TmvttwZReZ9ishUOT0B1MqHrOp2CAEPgQnSVBObmsEn2R3
	slcuUqORwvN7JNK95T7iKKywNy7NO7go6wHDXZyMOYcE0byPgIDzuuoyvm+wxXU3LCIfofJJMa9
	73c0F9Jr1Xt1E7z4/J62zfVg15XOLnCIKu8/SxOE7x6ZxyZwYGxszgrjNewC+OcufruPCrpnb/W
	8jY6KMuOAG51XPEqQRFj98mnyW0eVI+Q4hPSuEYs8r4RKMLJdq7b+MkhPrS76uRJCoHFkgK/O11
	21uk
X-Google-Smtp-Source: AGHT+IGOlRHUbzZ277/dq/Etm+M1ZnIxeb6x0lBP5+1k9gAuZMD69+G3KnUOpKIiYz3VJ0FVMcaicg==
X-Received: by 2002:a05:6e02:1946:b0:3a0:a224:eb2c with SMTP id e9e14a558f8ab-3a6f9564132mr2137955ab.25.1731205170261;
        Sat, 09 Nov 2024 18:19:30 -0800 (PST)
Received: from [2620:0:1008:15:c964:b0b2:aab1:6944] ([2620:0:1008:15:c964:b0b2:aab1:6944])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f5f048esm5013642a12.50.2024.11.09.18.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 18:19:29 -0800 (PST)
Date: Sat, 9 Nov 2024 18:19:28 -0800 (PST)
From: David Rientjes <rientjes@google.com>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
cc: akpm@linux-foundation.org, hannes@cmpxchg.org, nphamcs@gmail.com, 
    shakeel.butt@linux.dev, roman.gushchin@linux.dev, muchun.song@linux.dev, 
    chris@chrisdown.name, tj@kernel.org, lizefan.x@bytedance.com, 
    mkoutny@suse.com, corbet@lwn.net, lnyng@meta.com, cgroups@vger.kernel.org, 
    linux-mm@kvack.org, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v4 1/1] memcg/hugetlb: Add hugeTLB counters to memcg
In-Reply-To: <20241101204402.1885383-1-joshua.hahnjy@gmail.com>
Message-ID: <72688d81-24db-70ba-e260-bd5c74066d27@google.com>
References: <20241101204402.1885383-1-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 1 Nov 2024, Joshua Hahn wrote:

> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> index 69af2173555f..bd7e81c2aa2b 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -1646,6 +1646,11 @@ The following nested keys are defined.
>  	  pgdemote_khugepaged
>  		Number of pages demoted by khugepaged.
>  
> +	  hugetlb
> +		Amount of memory used by hugetlb pages. This metric only shows
> +		up if hugetlb usage is accounted for in memory.current (i.e.
> +		cgroup is mounted with the memory_hugetlb_accounting option).
> +
>    memory.numa_stat
>  	A read-only nested-keyed file which exists on non-root cgroups.
>  

Definitely makes sense to include this.

Any reason to not account different hugetlb page sizes separately in this 
stat, however?  IOW, should there be separate hugetlb_2048kB and 
hugetlb_1048576kB stats on x86?
