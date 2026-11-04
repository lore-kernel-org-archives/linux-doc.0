Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793831727;
	b=KlEO1vCEWC7d/ItLdrir0CgkjLZXryLOLIfZRamozirP+4g4tHj1ikrhZgV7rM7qCw7D
	 13vvLjgbinVQH1qQJ/RrlaLd3GFc+psy6T4UyxRtoHWFxpAvooyf3hrDOeXf4n4zC7OCf
	 iD/sW3TZ1fa05R9eTjRueCf23xsDJHs+KrpzwhPeiSqqz1H7nYrc7EUVZ8JWD1JE60j9Y
	 tNtRZ4i+A6ienf9Xs7tZ/3/bDo+9SrahiGUmSTaJa41+t/cs23L9JX6JuoYTXaB9mCX5F
	 grhsS3itoGNzLYkjV5//w1ADm4ywpVWjg+eoAChBEzZTejMvMWtfPg9/sCsB9l3irUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793831727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Osoc1/zc3WCPxn/uivsVACevUkiPfuARX2+mZ1FpT3s=;
	b=dnsdxz7Zx4vw8BSHitAQeThCCAg0w3CnXKY3DKPxdpbK0P24PjnndmwtY/AJtmasQkfj
	 W4qsvofiVzGQWBuzE+Oj/R1ivhPXZwayOq+SDrX++HhiTf74dVUClDn9/954CcY6k+moM
	 5jmyuZLObTPw56SkRGZvH1xGSwV9MEB17fId/Dx/wMR1TuPzhqaxc9Ybzry8uCT5QhXMq
	 11ba+aM8cyGZpTkr/hh13hPh3yg/HX+fF/ja3wlLKKL0oFTWH30XChcH2d6hmqg2Mly+5
	 A6upMnv/QdeLhXJgup4ebeFTcLHBYFD/Sjg0S6+u1/kiuLjyORrTBxRz7fLahUjoNZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bkv6DNeA;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E441606AB10
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 22:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E441606AB10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bkv6DNeA
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a064fac8cbso967776b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 14:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793831726; x=1794436526; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Osoc1/zc3WCPxn/uivsVACevUkiPfuARX2+mZ1FpT3s=;
        b=bkv6DNeAcOgKuFWjKi3KzwgdFOsKa9d64GSG02M3Ag6tvdIenCkXOWzxg6ofMEnede
         Z38zuEIQfaSRP+2xT1ils/BDnvMCsitxF6Rz48MQFC45RrOzSTGu5gvsA+MDhfwzvPKT
         ql3vClM4ioWl/gjSOhpRa1Vmx1b56MjuY9qCfUzAsX2dCyIDrTrxD55ZHgF55xwkM3sO
         WSRxUy7osOc5G6Pwmyu+dnP1ZkRJZ7gZ+Slgfa/1UGi2rwkEfmpq3d2jAGTu+xIJnc8u
         OvndJzC51+kpYGsRgwWM+ujTTaNtsa0FYpRVfqHHzeXB27xAFq5FMJxoXz7EOOCNhn93
         PEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793831726; x=1794436526;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Osoc1/zc3WCPxn/uivsVACevUkiPfuARX2+mZ1FpT3s=;
        b=SMqpJABLRd2obN76gLI8pdKuNKOAi0lTNCN/arsq59FK3bpi+PR+8inauTk9/IK/uD
         HJZWOLW4S2ASxK4EqbHoI7DgKNn5Fnllg9O+L+/IQekstvPkK/Cx3JYMo+pmGLmuKn9W
         vVT+S+fZi15mTTWddTwaqYRhYIwgqevPLGSceTDXdB+/SNMWluAnGVcrdpsO0g8ZJy8P
         dKll3jCZoPzxygE5xHG4W+ipxsAhAdUD8LcjeLF4W+7KZ5IcOFzzhWeYV86Z+QcSuLia
         SmGkF0cquXc+F11sIMkUZGA5xBmZVvFuQQ0JJg9QhxZXVMgrdJUMBtlRl84E6QcUzZ46
         ADCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBC9VtAeDHvt7AQCaVL1KPrHTiDJVE2nXS+qbU0u6gIDBmyzuJto7mkDdHLN/zXKevX173xkLJyRk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xDfVu8c0N/DKsHTNa/42CzDg8tICNbYHevtNhrYSp4z3Je+3q
	/xsf0dEYjbrkc6UXGjYL0E9bv/XLhUNYnqRAEU79bxxgr5Wm5+xwH6LzansTBxXKlQ==
X-Gm-Gg: AYBFou2eWnmYCegI77kNDPZQE74Pp7G4zo/O8i5WLqoNlX0ii01ej3kAQ9zpDewid3R
	+FRyYhYadomQJJ/r32CCZh2LFnv74kNhuBMm0KkdoXdfKDLNKZOiwDukNCU+ICZx4ENcPkX1KIg
	vFAMMrNMZih4zkHHK3mztgrQ78QY5EVPwb+ZGMW5AKlNkUqPj8yK1a6sxqK+UIwSQo/kduo27pi
	FH6+tmKLuTikfADqSSlS6W8ZXBTpUzRe0M+TrtUTy9IMn/gUZhhaQWVS2MNKmzJI0/Ex1a8HE57
	zMAlOo2o/JbG+IMra5VWeGceoVvNvZlcZTFq7CY51A12GH0OvO+Tj24IQhIWAbtHHMLMyrD8aUl
	LWWZ1WPsAkFsdFa8puYQL14b0fk71uKrcgu++3P0ZCCXMvu+8+kowMCbKpNz2hsNV7TExo8OcA+
	KZCXCcm7j79/RT5yIrDxOdSna9rH1oNdgu1rxjuPCe2hE6q4n3276YMC6UXtX1n1zqDgd0RNoat
	R8ReFDSZuNrp6qE6G5oVS0EZvitADvd9eX3rEziyzAInxPsa/alOB8YsCXqp4F/7EDyVZMlKreN
	owlpu9pAILYN+HTfwDNFBeKrgsN0k4Pw0sVx0EBFTB4WTvFje3YytqEdtfeFdv9JQ/hY8Yr6R24
	82YY/1DYL1g==
X-Received: by 2002:a05:6a00:1f0b:b0:899:67fe:3c52 with SMTP id d2e1a72fcca58-8a9be1a4461mr15308534b3a.15.1793831725909;
        Wed, 04 Nov 2026 14:35:25 -0800 (PST)
Received: from google.com (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09b569495sm1376244b3a.37.2026.11.04.14.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:35:25 -0800 (PST)
Date: Wed, 4 Nov 2026 22:35:20 +0000
From: David Matlack <dmatlack@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, kexec@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Christian Brauner <brauner@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v3 09/10] mm/shmem_luo: Allow retrieving tmpfs files with
 O_RDONLY
Message-ID: <auuzKNZsPD10XM4q@google.com>
References: <20261103010216.3447716-1-dmatlack@google.com>
 <20261103010216.3447716-10-dmatlack@google.com>
 <2vxz5wyck08d.fsf@kernel.org>
 <auuJ4msatqzoOrjN@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auuJ4msatqzoOrjN@google.com>

On 2026-11-04 02:45 PM, Pasha Tatashin wrote:
> On 11-04 17:52, Pratyush Yadav wrote:
> > On Tue, Nov 03 2026, David Matlack wrote:
> > [...]
> > 
> > Can't you put all your binaries in a separate session, retrieve it as
> > the very first thing, and then finish the session? Then you can execute
> > those and retrieve all the other sessions.
> 
> This is a good workaround. I am not opposed to this patch for 
> completeness of functionality, but if we decide to keep it, perhaps it 
> should simply be squashed into an earlier patch. The current diffstat
> looks bad, as it mostly deletes code that was introduced earlier in this 
> series.
> 
> In any case, given Pratyush's suggestion, we could also drop it.
> 
> > 
> > Why do we need to support this in the kernel?

That would work for binaries, and I agree that use case alone doesn't
justify this. But I see O_RDONLY as part of the retrieve interface, not
a feature for one use case. The retrieve argument is modeled on
openat(), and openat() lets you open an existing file read-only.

open(O_TMPFILE) only requires write access because it creates an empty
file, and an empty read-only file is useless. A retrieved file isn't
empty, it has the preserved contents, so O_RDONLY makes as much sense as
it does for any other existing file. Without it, every retrieved file is
writable, even when userspace only needs to read it.

Preserve already works the same way: a file can be preserved through a
read-only fd, as long as the caller has permission to write to it.

If we keep it, I'll squash it into patch 7 in v4, so retrieve supports
O_RDONLY from the start. The commit message will lead with the openat()
reasoning and keep binaries as just an example.
