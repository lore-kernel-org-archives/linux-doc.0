Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473F721147C
	for <linux-doc@vger.kernel.org>; Thu, 23 Jan 2025 14:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737644165; cv=none; b=H/tRsHrFb6F+JiN5RnqiH0JN5E9ZYYRelcPZdL/aYD9DOyNZR+F2krieVEAg3dvzvIHckGATkO4aSGJ0FtdX0T2pTvY+m8JU4F2DssBHq25y7bnKSyEbECHPldMISVtpMxMGTwojTPWIx2fl5iZb/VEQCXKWFgKb87dqajKihgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737644165; c=relaxed/simple;
	bh=tY/NItMpCIVVFwzucHwPVn5kv6999ZcDYD9Pf1coTGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VzjNFY+8UHfsusTCvO3aiSdgrEcoYjpnrKhJrQqZIk7um8k8epB3+/Q3Va8rBZWAZouC9rLwmJBPr1TSNau/HdVn+qpiX1m8j8YWzkf2V6FNugimGs3bQFrlS2zOhIQtgJw2pdxGOjhkwAfenDWH54ThLJ1VhN3o+s93CvLXjMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=H8R46FcA; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="H8R46FcA"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6d8f75b31bfso10956766d6.3
        for <linux-doc@vger.kernel.org>; Thu, 23 Jan 2025 06:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1737644162; x=1738248962; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pIwVMJKPo71eSxVfX67ulub1Z6p//x0W7IgkyVzME2g=;
        b=H8R46FcAMEC/YLajrDnYXSmgfUpXnXOfUwME3U9wptbD641V+/B7VMNyzU9qYWWXLJ
         IFUHZA8Xk0kborr25IAHoSrdE0/WG6GNzKSzT5mrjefCwkA7iZSdFEp5x2UH9qLYT0Q8
         WHL1TEX/y74bPAXq9+wqs7ZL2PmuQ59aOCCpAa60is7YzLOZKCxY//acJMvt1oLfwtxw
         A23/s2/XqZ2pBmppkXKQProo1R1i4T2OIdgA1zwv2jkk1Ar9bk5/Acsvux4JoQj36KyZ
         bVR3hdjT6u/zeWPDwM/TW2994oXvchL0UuSfxodrPt0HOTeni/FSaJwjJzneB7/IM0ix
         hiPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737644162; x=1738248962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIwVMJKPo71eSxVfX67ulub1Z6p//x0W7IgkyVzME2g=;
        b=QRqe1ykD8OFlqmTRlahgZzEXwgDNU1BldVnGeYnAdBRtZaab97yMvat83nr7d5HP54
         31sVnBvY/z55SGzfiarq/TLnDRfW/2tOom1p002hYGXIUwNd06nYgV+mA6JuJKgxe/gJ
         iv9KN3VEymUyOO1RaJHWNXs4Pjo9ornr85zXMmcGzGX4CVb2yVS5rRh8fXfYwP5FjRJN
         Ka6T/CGUG6IHLANo1/5Vla1nvB0cm+zgBfR0jBoijXWhJKfLDkfwQ7sJrncs6PE7Bpt+
         BVzbESu/jLnZQ7UuYQolMpVbqQaUfSN6eQ3te84JydVBXGp/rmwSwUYc67RXdxZAwh/g
         NkrA==
X-Forwarded-Encrypted: i=1; AJvYcCX0YSQTJzIxDgcygNf+HzKLIBfCv3iryvpAILp5t18Vg38gZ3yN1YpF+VQ8KC/IcAgQpZi5G4P2maA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRoZNLSsbcPVbctSGVHxjEgrOFaD2y07qxrU4zID862ep7fYhG
	PIjQRIj82NjoyYBZhj8dy+j8d7dPhNRL6uyFdZ2bOgL4gX/4GDFogW4hDo+sGnM=
X-Gm-Gg: ASbGnctjtzy55u5xUeBHwaZ+J3R0LOVnNaVemX12thPkJl2LIRP8G90uWgdOB4FI921
	+uZcVEIMCt/aT2eQ/6NpONjLivvTXtkUljbgEP5YlbuEWStprffQs6l0CPBN0MUbaoJZ6wYkOpM
	K4JwvmkeFZmYqy6t0nxylk02uOxJrshAKuStyjLJnuVk8DHsfq6FjEUaGf+NQLyw+Q5NgLFIP7t
	Qnnh3Crx2cnPkro4LCEdkDqPwUmarcUD99oHOmyywaogBV+mUHAQ5EsX+fyYMG0ZLKBGJfQ5rJQ
	+cpEAQmdm+SMs0/P3URHEfAuP/cHX6I1IJRO8nX79bVsJTmwWf/ipQ+xIQq4fV8=
X-Google-Smtp-Source: AGHT+IGurXFrWCspoHbEh5zBy16e7yYpuj/I1/46A8TasxdptOCyhfgUgagF6nJKPP9wQs/0DqSBiA==
X-Received: by 2002:a05:6214:240b:b0:6df:97a3:5e76 with SMTP id 6a1803df08f44-6e1b21d13e5mr423495526d6.27.1737644162006;
        Thu, 23 Jan 2025 06:56:02 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1ccacdbafsm48001476d6.24.2025.01.23.06.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 06:56:01 -0800 (PST)
Date: Thu, 23 Jan 2025 09:55:58 -0500
From: Gregory Price <gourry@gourry.net>
To: "Huang, Ying" <ying.huang@linux.alibaba.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	nehagholkar@meta.com, abhishekd@meta.com, david@redhat.com,
	nphamcs@gmail.com, akpm@linux-foundation.org, hannes@cmpxchg.org,
	kbusch@meta.com, feng.tang@intel.com, donettom@linux.ibm.com
Subject: Re: [RFC v3 PATCH 0/5] Promotion of Unmapped Page Cache Folios.
Message-ID: <Z5JYfvMwkM9ATpSp@gourry-fedora-PF4VCD3F>
References: <20250107000346.1338481-1-gourry@gourry.net>
 <87v7u7gkuk.fsf@DESKTOP-5N7EMDA>
 <Z5EhcQERseKShtGY@gourry-fedora-PF4VCD3F>
 <87y0z2jiom.fsf@DESKTOP-5N7EMDA>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y0z2jiom.fsf@DESKTOP-5N7EMDA>

On Thu, Jan 23, 2025 at 11:46:49AM +0800, Huang, Ying wrote:
> Gregory Price <gourry@gourry.net> writes:
> > Test 2 shows overhead of TPP on + pagecache promo off
> > Test 3 shows overhead of TPP+Promo on, but all the memory is on top tier
> >
> > This shows the check as to whether the folio is in the top tier is
> > actually somewhat expensive (~5% compared to baseline, ~2.7% compared to
> > TPP-on Promo-off).
> 
> This is unexpected.  Can we try to optimize it?  For example, via using
> a nodemask?  node_is_toptier() is used in the mapped pages promotion
> too (1 vs. 2 above).  I guess that the optimization can reduce the
> overhead there with measurable difference too.
>

Agreed it surprised me a bit as well. But more surprising is the fact
that test 2 was also 2-3% slower given that it's a simple boolean check
against whether tiering is turned on.

I suppose that since the test is blowing up the cache/tlb by design,
multiple additional cache/tlb misses could cause a non-trivial slowdown,
but it is certainly a small puzzle I haven't dug into yet.

~Gregory
