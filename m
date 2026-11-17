Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910219;
	b=hAqTqVS49jwqykbe8XH1ZOSacFE5RR8ckZuX0F/WcRD3IU7Ftc90uCJC/3ZgYxRNtDnr
	 0v3l8gIiDq87da3kEWJoroTmbG/M1h8Xqjqr5aUPqVZfhoV6bv6ApXOnZotD+YPVGVkbi
	 lddPsAP3iUEV9t1myGz9Qghgsi8A54TkJP17hkXCUOfg8VNrebIRMr5kpGWWHGDshtB8z
	 qYBJWcfM9NM6Xq3Zm1rsSuc7egcUIvKzyHTQ1agJvF1K/GrxwMfhUxe4KIljXkkQ0drBS
	 vNGcDwZvGWir5su2uPnvM4VYAiHU6dnWV8+nKs+Fze6WJ/nkrCMyGr2BhMhGcZ++7Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=xfBMXtQzr2JQHUojf4ewtSOsAqE+X7FzRw+q2BHepVo=;
	b=c2NZliSS4dHGZ8qbLZRfrPBnyenVqJqA22A7lFbe315Kxxi5L1NQvYUsN4dEo/jCBzMX
	 GqmlsyWAuyhOECj2lLHmE6obn6ivg9oUu/7KEes3/yHlSsDr+bvzJS7Lww35OUjmx8bHl
	 4FTLrH9wg/aJ1k7zZ3oggjDf//YrU6/jPZtiUDLtY/JsFb3k0clWyv9Ie5stDIqWADcCv
	 znfk8yQNpm5LKi3DoYaCaxLhoP9JH/eyUbBS+gHCd9x8MoqvaDMKf2hRUEipm4Prk8DaE
	 yOE9HVa5SlWLCx24IIialUeJjz9FKvVDsroF6ctLjD+CXbqfOwa54c66VPV08jSs39A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=O2Ey1g0P;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62215606A323
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 10:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62215606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=O2Ey1g0P
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso3301469a12.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 02:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794910219; x=1795515019; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xfBMXtQzr2JQHUojf4ewtSOsAqE+X7FzRw+q2BHepVo=;
        b=O2Ey1g0PKEfr38weA+uVErvWnI7XwM86CVj+pPkNVdxZgM5wm7lhx4p4o7rZkDQeLY
         3rf0OgiMS59q/32Xlfjew23iJmrzGj5OXJiuDVTxXg4weJm8rX8j46tQs0lgR/C6Krir
         /MwDcW1DAcxSzrLbqe6/Si3sVy9Wyfy2YOEHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794910219; x=1795515019;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xfBMXtQzr2JQHUojf4ewtSOsAqE+X7FzRw+q2BHepVo=;
        b=KkJ4n2Tik5yRtAlBJyvfy2hYBcT4yC0/5vhmfPH6UHxfJxHZSxzzxYSgAsfPmP1TVl
         fz+r/EsovvY61YT8AGUIW3edhpPNU3JiGq/sqB90kT2NiGRKkGsqYtDtfAm7d9fek9ao
         gu3NuOVk07cYcM/iHmNKTWZBhc6b0PNmp3hcvusnSpY6WnhWStefyx3phOrEPWkdSKIE
         z//fjq8dQIozaF0Q0gpDJRTQRXOhzRsd2a8rNQNa6BxBsOSOcn0HLSN63RIWF6BEmMR1
         OQ7aMVV/dJwhkl0/mBT8PGAVEZmkhJ7nzdis3ZGtlR/1uP0ti0UBfOtPhtG2SPsojKa9
         7cxw==
X-Forwarded-Encrypted: i=1; AL+hErGxXOgP5qr6affcuB0PP09K9H8it1Ra9RPJOLJ+61XL02mb019pUbyLgd1HWRisFbRc1sh/T8kAETo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BcQNWxJYOWHK7FKm3kFuLgrryGe2S57N1sPC2LW5SZAkasEMd
	DUd8jEYWIjwCSnr3cuCqc/031PjfeAH/c4nhh6pcAbU+PVyF2Z1uFaSBTlriHSif55o=
X-Gm-Gg: AZFdTZeWWLD9KcGGI7dywVnOGJusGxdSVFizc2uc3ogs66ymk8sE7XTiEh5IVObxfhQ
	zjlk2AvxAjyw792GyYBmR2T4cbRHY9EMqxY3u8RbJfM1tvBGss3U9A+KIRmBSiOOEeVn0DDLeLk
	X/I965+tgcL7OM7VftHOxz7OpwKtFefe6qDY6N2/DN55BgyksacMM5ZQCDbmbO915atZurulRhq
	7zkvMyi9ub/rT3YdAp7Lp3bQwQ3047Fj/UGHko2WJGwC4h0MFaixY1tT0e7ycSzbE5wQPUkmil8
	whb/cJT0YK8/OXzYs7DIShCU8lOBACUGws0pufAgjBTuJLoypjePJBxIPpiwvr8yDDs9qbn9tOY
	OFo7Ce/vDqdtesolrjwZCyqV67QYSsZoAQ+8zARmBpQb2V/kE0RV9SPZADYZ4EDr9vIQe/whWjB
	UXH0NLmzrBlrpSJVWUHVXlfsZRKdqb9OaJv6Blj7mCXKyiwmb2GVxpKP2UM863ipApYLAhMYUHX
	b8xolgdxsSwa3VXDq1Sfquzhhzn9dKtJecLSP/0WRHZQysmCQfQIwVHhjYWdoR99auI4RDf7u3a
	1GSJoxN2d93CtQkwHrLeqdu1P2xT1VxE43noZx4egMkBdlo+vCznQtk6L3QaxCBddzqA/Ll4DzI
	14EtuXJs812hovYfyEfKyXOiVh5XBED2J9HSGl5/mXTaJ4mSrxpkRBH7K7LAdpjwJ28iiNr5RjD
	A8m5E3Myhpr0EflcMFSQwM9iWVFspSys72WEwSx86yMvRnSUEEVqVObvGp44QgOJuX
X-Received: by 2002:a17:90a:e7c6:b0:3ac:d79f:8229 with SMTP id 98e67ed59e1d1-3b1b0d55ce6mr13140816a91.61.1794910218659;
        Tue, 17 Nov 2026 02:10:18 -0800 (PST)
Received: from [172.20.0.2] ([172.56.235.113])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abbad970sm3433447a91.4.2026.11.17.02.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:10:17 -0800 (PST)
Date: Tue, 17 Nov 2026 02:10:14 -0800
From: Chris Down <chris@chrisdown.name>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, Alexander Graf <graf@amazon.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>, Tarun Sahu <tarunsahu@google.com>,
	David Matlack <dmatlack@google.com>, Samiullah Khawaja <skhawaja@google.com>,
	kexec@lists.infradead.org, linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH 0/5] KHO map
In-Reply-To: <20261116134013.1636689-1-pratyush@kernel.org>
References: <20261116134013.1636689-1-pratyush@kernel.org>
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
Message-ID: <avwoBj5ceKYjcS9G@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Pratyush,

Pratyush Yadav writes:
>The main user of the map is memfd. Currently memfd uses a vmalloc buffer
>that has a pair of {index,pfn} to track the folios in the file. That
>uses 16 bytes per page. The KHO map uses only 8 bytes per page with some
>overhead. So for a 1 GiB memfd, it uses roughly half the memory.

That only holds for order-0 folios though. A leaf covers 512 indices, so
a populated memfd needs one leaf page for every 2M of file whatever the
folio size, while the array needs 16 bytes per folio. Per 2M of file,
that works out as:

     folio size   array    map     map/array
     4K (o0)      8K       4K      0.5x
     8K (o1)      4K       4K      1x
     16K (o2)     2K       4K      2x
     64K (o4)     512      4K      8x
     2M (o9)      16       4K      256x

>- Multi-index entry support: currently, while the map is very efficient
>  with 4k folios, it is horribly inefficient with 2M folios. Each folio
>  in the memfd takes up a full page to track. Multi-index entry support
>  can fix this by tracking entries that cover a whole page in the
>  previous level, similar to page tables.

Since patch 5 makes things worse for memfds with large folios, I agree
with Pasha that this needs fixing before memfd switches over. Storing
PMD-sized entries at L1 fixes the 2M case, but mTHP sizes between 4K and
2M would still take a full leaf for every 2M of file. Do you expect
mTHP-backed memfds to be preserved? If so, it's probably worth handling
them in the format before it becomes ABI.

Thanks!

Chris
