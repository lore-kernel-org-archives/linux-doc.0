Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA21313535
	for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 12:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760444620; cv=none; b=p5+ze3iWyTGPF490KrzxmDvzfe0/SMCya0jFuWpFQxZbf5icHH6edxeriRmeeSh5MzoJGXJ9K44vQTf3E/j7MI4bzrpiJ65p3AaY4eQEpwMj38SEKyXpDYKqy+P2E07Xzqcw3aYzJ+4v/cLmFmgP6f9c4NsBOK3uFy9foz2mXHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760444620; c=relaxed/simple;
	bh=trw3erKcBrmCOtT2DE5wAFGrqWHQObe9Vw1+YmbQxYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8kHkIFwABlj02vUiVPaCpkarbXUzOj9x8uxdzQ513+Wx5XdARbhNpLPM8dDzOm/KAnyVViz1uz6Rq/T6PV4vbG43vSdJI5buPZ6aBjFWZfUf2rkU1SCotlVoFzcG6ixgcmzsCp3t31HdnX7fJmTO04RgVqXr7n0BgibQbLwX9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jc8MMyJ/; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jc8MMyJ/"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b50645ecfbbso1030394866b.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 05:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760444617; x=1761049417; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4zpYT42/pWjG2wOiPoPN8UFfIlZHUseBg40P2GM6ks=;
        b=Jc8MMyJ/UeRfPsHTc2O/vVOKfChumvUkphUUc0Yt29Oc4uNhLrkKroREHOW007AgsF
         LQs8rB55fCRWUTPBk8goujK5NS4RW+tmYd8M9TjHH6J3iSPfVW3WFQuXGjSBfnYdxB97
         SrivieCmlJgJ9YPSDxhUxGqZn+YFRE809SXXk4Azw2i7L9FDnCnFtdOuMLnLMCX9uqV4
         oH/byr3DHo4EAjrCdVmzWFTvART0VChXazqVj3bjWtQzRb3V19NPhY42NcAmOU5MhtTb
         s/Ko0LDMTkhQWPW6lke8YNwYIRCHou14iZ7uq9BPw8OQ+Fc9eriOLY6D4gGnfDRePPSp
         HhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760444617; x=1761049417;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G4zpYT42/pWjG2wOiPoPN8UFfIlZHUseBg40P2GM6ks=;
        b=HKnZKKH4gUXljq/MGD8VQiUAF2mErkA6U/9dtnW0U5Bdbe1Oxa2a2uYEhkbqP7B78V
         g4CxItG5IQHbA4tNAkXi3Lkv4mflngf73abTCjmNAckM7JkZ09OPNUe/1/4wNSUwAdvM
         82n7jX6eFM3sWy9KAaTtn5lsH9Hu7LKCntwfNqDss56rRlke/2MsKGlEaW5W5NMxlTJk
         6p7oKctX+tEYLPKhLlrAk1nExEIFOS44cyfnJ1lgaWTsMir1GKtUaTdr6nDv/i20agJN
         swU8xAa4wRb9qLDviqgdTe7EZTzUgbJOnw0LzgXm5mG94NCv5t6gK2xV4j+2SCnGJ24a
         dARA==
X-Forwarded-Encrypted: i=1; AJvYcCVYeeDzve1r/Z7rphHSV+Wnh6K60GA9bWP1s9Ma5ffOQgQej4hAVOTs8CRU8J88nFAfOdbDxb4tBk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YySOU4puRmUfLV6OhvFFKyxhZnCrlN9ualt47qujRurcA0jbxr5
	OOXonz3xGDtKKLpuOOscwTwC2AhaBdox39sGQNmYILEAo1F19lUwFMNI
X-Gm-Gg: ASbGncuaxKwvb2EZpygK9wEE2Rpfb7dTiC95uz5R4w20UdOZyUWCfC3+YpAmGYCMByB
	cukVgREXLBmA9a9b2Lau2f/z0HFIDbqi5+finmVh5jfw0b6+LY3kmhBLhH5zYAqXZLUJ40e/C25
	jyhPcoEQa933lKjLWvp0QVI9JOi5D9y8heNbb0LwRdi4/34IIlRZ6FI2ihJK/I/dA1dIIZDjbUv
	oz1yueeftl4JAaEkLgQMS54n9WgvkA/VwY/ug36oPH94xdDLs0ZDCXjlMOUqZopFPXfCwBERnJs
	2VmpMgq3u3ucgbAtRpN0w3ckv3EKpSIsAmpEyI8/ceJd1e59qVR6EqpZSW9MsF8i5CAR8EXO41u
	xjm1Q3ZqRecYrN9trM0B0h0XufwvIFt7U9cx4JQZ6BQuJBKqtmxk=
X-Google-Smtp-Source: AGHT+IHDOAfe4JNqhFSA9gUX7LcGwhfmUpTtqm0hZRNoZ9LOkkInOSpqZhVqzK5eUfW8u4Wf52cxuA==
X-Received: by 2002:a17:906:730a:b0:b0b:20e5:89f6 with SMTP id a640c23a62f3a-b50ac5d07b5mr2495753366b.60.1760444616765;
        Tue, 14 Oct 2025 05:23:36 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b715ffsm11262090a12.22.2025.10.14.05.23.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Oct 2025 05:23:36 -0700 (PDT)
Date: Tue, 14 Oct 2025 12:23:35 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	cgroups@vger.kernel.org, linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>, Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Muchun Song <muchun.song@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>
Subject: Re: [PATCH v3 20/20] mm: stop maintaining the per-page mapcount of
 large folios (CONFIG_NO_PAGE_MAPCOUNT)
Message-ID: <20251014122335.dpyk5advbkioojnm@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250303163014.1128035-1-david@redhat.com>
 <20250303163014.1128035-21-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303163014.1128035-21-david@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Mon, Mar 03, 2025 at 05:30:13PM +0100, David Hildenbrand wrote:
[...]
>@@ -1678,6 +1726,22 @@ static __always_inline void __folio_remove_rmap(struct folio *folio,
> 		break;
> 	case RMAP_LEVEL_PMD:
> 	case RMAP_LEVEL_PUD:
>+		if (IS_ENABLED(CONFIG_NO_PAGE_MAPCOUNT)) {
>+			last = atomic_add_negative(-1, &folio->_entire_mapcount);
>+			if (level == RMAP_LEVEL_PMD && last)
>+				nr_pmdmapped = folio_large_nr_pages(folio);
>+			nr = folio_dec_return_large_mapcount(folio, vma);
>+			if (!nr) {
>+				/* Now completely unmapped. */
>+				nr = folio_large_nr_pages(folio);
>+			} else {
>+				partially_mapped = last &&
>+						   nr < folio_large_nr_pages(folio);

Hi, David

Do you think this is better to be?

	partially_mapped = last && nr < nr_pmdmapped;

As commit 349994cf61e6 mentioned, we don't support partially mapped PUD-sized
folio yet.

Not sure what I missed here.

>+				nr = 0;
>+			}
>+			break;
>+		}
>+
> 		folio_dec_large_mapcount(folio, vma);
> 		last = atomic_add_negative(-1, &folio->_entire_mapcount);
> 		if (last) {
>-- 
>2.48.1
>

-- 
Wei Yang
Help you, Help me
