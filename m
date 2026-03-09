Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C23B36212B
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 08:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773043325; cv=pass; b=QxSH5qf5ht+frCJw68Sh2JuqydDZLWkzi2gXTerRxY83B9B9MmpTxgR+qtAKV3twiRtnrEBIlOLyE+Jwqe4+/0/ztcVxHNRJ7kwQkJnJZZroiLeXFhCop1+D0gauAoVJxCGJsbF4U1pcjL6LLVTQOj1BrbW2mtP2Z89oNkTiQRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773043325; c=relaxed/simple;
	bh=YZGVdYoM57Ljoy9ZvHaawIawTucwlY62ulstM6rXlh4=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XLhLCIF4kYkTiWRla6RcaMj7y4EmCdKVLIA/bhchrNSccLnaLZf1IgrFv7PuaOpFewWTbeADLFqnqSgNinfiSfEaNwZ0dckukygcJ5ID84Ps6XNEvNYvD/z1+jj9N0y4BzbpHOiNLW6UJUDzZKkFDufcGloWvdwQZd0rxdBNo0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CrUxksLl; arc=pass smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CrUxksLl"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-94dea0e029fso3288934241.2
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 01:02:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773043323; cv=none;
        d=google.com; s=arc-20240605;
        b=BMlv3/CgZVPETz+16EkTNAW+SyfQ/n+lehiCaYmmqxwehewiQTvP3+f+0UZoLlPfQR
         CrVkYUTHfEwDh8iaqjdP9aucLLI2Pn44XwqKS8sMUewP32WCTZL4vJqXHlcwPUh5Qde/
         y98N2chd4ClH2AjIZe1V2wmQTyyfFtqGesQIi/BYHaerbsguCZp6sC5OZTVyyDcaKHZA
         lHc1VWMf5kL3TGTQHcJDha84d2qaVca/m+h4A0lsxXu9L+pbl8rW7zWTuTgHfkSyzqs/
         uUAbVwirOOl2x+CWJ6qh7pEvp4yE2kRkEs7hn0OdxwneA+yf/kuRoPbFwrUUwWODBKb0
         Rplw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=5iKTwpN//vgpsNCCXbcsIw/eIDxxyup8fH8lZJsZvpA=;
        fh=4US1sKUAY61+K5pZZo2xO37MZ0IUpxiOqZkGWNLEUfY=;
        b=j6c7FNlMUttII/cxH0VPkojUlK/YwcTYhg96qn1nyUFYqLOxMH9U2Rw7sICvtefhv1
         mFngeywS/tOePOLpQ/EajaTmNPOM8S2y8/dJIolS1SCT5wUT8ijL4k4uAtLg7NIvvgi7
         d8z1BOud72haz5mvLt9w8xOouzlrzd2pi1B6LQ1/+2IFeFapk2nVudtd7I/isc5Qel83
         0GffKLgr8EhBNYMZsxBJUXtmweo0Fjfdh0ap48rA70LdEGu0N/368Wi7HUB7NLpbQy9U
         I8rOAYUrQ5I4YFKl0Vj6ycWeT9ZsyK6GEZHVffw8ZlNrZ5Z7Hd8hQHXoHiF68jHkNGuq
         WgRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773043323; x=1773648123; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5iKTwpN//vgpsNCCXbcsIw/eIDxxyup8fH8lZJsZvpA=;
        b=CrUxksLl5ZhEZYNX4dpMjta5jQtWUxaGY397oFvuTSjQP75JG2G1HWvyS6ZqkmPcLz
         XvcQiDeqw5wCuH6rdcu9qevxZJ4edrBqvyLN+jZCBZI7i0QjntVHe94mUXQR9RAv7Nwk
         ksMwRgzT/mrbQvpijMpv6nDY5M9sdyPrX/gKAvNW0TAwXzlaVPNg+nN74qwzVSEyJa8S
         xiQwjlrZcVqPUquT9tTUQ1SgvoYKq7IDxllJoWCewzOM+GDBxkc8iNh3rnjhhhPq6Cn5
         wirgUBRicT7dgfzd8N6KQnfVuHKtoRamt4sJI6b9occkPgO7COKShMIAgo3vpP0oPYpP
         YNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773043323; x=1773648123;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5iKTwpN//vgpsNCCXbcsIw/eIDxxyup8fH8lZJsZvpA=;
        b=FS7puc38MGCTpBG6lcafqxRmikM4MdK8MdHKM2bx1Fvo486oUdAD1Zu8kVZIbQa0Ud
         FRvv/UQErxgyHUj8j45K8hEgGRNSUhehj3s91wcwjp1cDTcs3JKgzMW6juWu/ChTnkXH
         FXLWRM72LtDtWX1O1N6MmiTFJZbv/Xey6hAdBX+xQr//Ay6In3xEGnwqvzVxAWzCEpDH
         /jN6jCJA36KyFhIExZIA6HTIDISkVy1Xn1iqGUk6sUqWTc44B874BfGJQout4ZnDi2WP
         BgNmord0bR312JjBE3KWOJohZLxjTzZrTeUrenfrOAXJ46aNA0iId7xsU4WmWMBjsngl
         SmvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUexwLWoRqV3VhVg2Hmjuc9AYQSxE4ePlvJTpL+jfjDzLv2+I6MTC3xwVaX5kW7jeG80KATDu+c6mg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQOCmsV76mlVQvzIDu/AVn4Ek4pamNWWLUjXx2Pe2XOpFlog2k
	eSScSlAFAvE9QgBkIEuNBa4G55W8jjEFYdPJP5DRQKAodQDL9LHdjaQ/XjzexgD9PJGHRN/JhcM
	ZBDueD/z0sIzQIcQeCwryMDo08JRjxtCYgnOtUFMR
X-Gm-Gg: ATEYQzz2Ksvpgd4jDPmF6NIJPIeON6aLKfBIh3mwHiSByKJF0aiBILEQmVh+ZlUKh5S
	tXLOPFRLydKpZuujqIBsJHkeEsgGNMNGPmxnX95N3Qdqn/dtMMvIpof/oo+y4mC6qXDC6JbNADR
	ixuEDHWKa5tpQI0ccMFfSdEZTq4ngUHK7oDAXqKM9NOMA9oGB3lakPW1rNiE+jd9R918Xjdkph7
	8J/sYLpCspPVnJ4C9jKLAR2ZTPKcZY7epRNKf+tCtf4r8BN5TPHdTN36gfjRrBbJORjEz/8Vrbd
	JPX1ybPHpSzMEcFlLnA2Za/C2t0TAYzmgiF+jgYIm+S3ren1NW2QFPzoVIhLdnz6SnKTTA==
X-Received: by 2002:a05:6102:4194:b0:5ff:cee8:660c with SMTP id
 ada2fe7eead31-5ffe61bf0d2mr3868411137.31.1773043322886; Mon, 09 Mar 2026
 01:02:02 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Mar 2026 01:02:02 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Mar 2026 01:02:02 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aahNprLw0_Cdhzxp@google.com>
References: <20260225-gmem-st-blocks-v2-0-87d7098119a9@google.com>
 <20260225-gmem-st-blocks-v2-2-87d7098119a9@google.com> <5097ff66-b727-4eac-b845-3bd08d1a0ead@suse.com>
 <aahNprLw0_Cdhzxp@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 9 Mar 2026 01:02:02 -0700
X-Gm-Features: AaiRm52tdsuammFV80Tf5JuKg-WPQwxrDNCct9c5X_bV6T_IkMHGIVZ0r4R166A
Message-ID: <CAEvNRgFwyqY0q-PTvMGjK82rxvbCfPxK8-RUPML3w_8mzAk8xA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 2/6] KVM: guest_memfd: Directly allocate folios
 with filemap_alloc_folio()
To: Sean Christopherson <seanjc@google.com>, Vlastimil Babka <vbabka@suse.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	rientjes@google.com, rick.p.edgecombe@intel.com, yan.y.zhao@intel.com, 
	fvdl@google.com, jthoughton@google.com, vannapurve@google.com, 
	shivankg@amd.com, michael.roth@amd.com, pratyush@kernel.org, 
	pasha.tatashin@soleen.com, kalyazin@amazon.com, tabba@google.com, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Mon, Mar 02, 2026, Vlastimil Babka wrote:
>> On 2/25/26 08:20, Ackerley Tng wrote:
>> > __filemap_get_folio_mpol() is parametrized by a bunch of GFP flags, which
>>
>>                                                            FGP?
>>
>> > adds complexity for the reader. Since guest_memfd doesn't meaningfully use
>> > any of the other FGP flags, undo that complexity by directly calling
>> > filemap_alloc_folio().
>> >
>> > Directly calling filemap_alloc_folio() also allows the order of 0 to be
>> > explicitly specified, which is the only order guest_memfd supports. This is
>> > easier to understand,
>
> That's debatable.  IMO, one isn't clearly better than the other, especially since
> filemap_lock_folio() is itself a wrapper for __filemap_get_folio_mpol().  And there
> is a cost to open-coding, as it means we risk missing something if there's a change
> in __filemap_get_folio_mpol() that's beneficial to guest_memfd.
>
> As Vlastimil said, if this greatly simplifies accounting, then I'm ok with it.
> But the changelog needs to focus on that aspect, because I don't see this as a
> clear win versus using __filemap_get_folio_mpol().
>

FGF_GET_ORDER() indeed caps the order at 0. I was overly focused on the
earlier line where it did mapping_min_folio_order(), where I thought
other code could possibly influence the eventual order.

I'll revert to __filemap_get_folio_mpol() in the next version and see
how that goes. Thanks!

> And if we go through with this, we should probably revert 16a542e22339 ("mm/filemap:
> Extend __filemap_get_folio() to support NUMA memory policies"), because guest_memfd
> is/was the only user.
>
>> > +static struct folio *__kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
>> > +{
>> > +	/* TODO: Support huge pages. */
>> > +	struct mempolicy *policy;
>> > +	struct folio *folio;
>> > +	gfp_t gfp;
>> > +	int ret;
>> > +
>> > +	/*
>> > +	 * Fast-path: See if folio is already present in mapping to avoid
>> > +	 * policy_lookup.
>> > +	 */
>> > +	folio = filemap_lock_folio(inode->i_mapping, index);
>> > +	if (!IS_ERR(folio))
>> > +		return folio;
>> > +
>> > +	gfp = mapping_gfp_mask(inode->i_mapping);
>> > +
>> > +	policy = mpol_shared_policy_lookup(&GMEM_I(inode)->policy, index);
>
> This is a potential performance regression.  Previously, KVM would do a policy
> lookup once per retry loop.  Now KVM will do the lookup
>
> I doubt it will matter in practice, because on EEXIST filemap_lock_folio() should
> be all but guaranteed to find the existing folio.  But it's also something that
> should be easy enough to avoid, and it's also another argument for using
> __filemap_get_folio_mpol() instead of open coding our own version.
