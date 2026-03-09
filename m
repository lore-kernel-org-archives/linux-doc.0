Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA3F36896D
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 07:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773043061; cv=pass; b=RLziDMcNNF2eLOemJ+/zoal9KZM70VQiTeO2cGt/pbCWziKMMEcKPmcNtBJvYhpMzPy+rs85rylesKubWPrV79srEag4puXT0xN7k6DCHzEZGA+wCTfg+QaMFC9i6FM667VOh4ZfTNzfeHo4s6JzcQOr1/iKJvnqdZTqj0lV9/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773043061; c=relaxed/simple;
	bh=Bc5YCzZwaugc6qlY/fyP8r1uGR0PYI0Vhk0jy+TRtSM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=txayP9gFIU7oqMcFH9fTwyYP1/KNJh8pPao0qWvYcLmO9mjfn8m+FZ2jorUi8VYiJ/v6QdL/44WEr9QoDp802rW1A8gg7Fl/zC8qwPv85aXIsb9dk3lj3JI0VF/tpwPS74Zj5u/mYEjPMxliBLkLshEHxAXkCF1KtKDzZvTQFrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wQQ8sP7O; arc=pass smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wQQ8sP7O"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56af4aad3e5so1406813e0c.3
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 00:57:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773043059; cv=none;
        d=google.com; s=arc-20240605;
        b=Bxd0EnzQ22JGyfIJmYTjqRDDKIwfrPtnhjSzIqg381o2NNpe0jAVYP1zqItAPTYQGD
         aZrexWo0lMnyR7j0n/90bA5xnE25t4DetBqJN9CEeFzN40OJ+PgBIs3+7c8BldBLmzo/
         paivurAv5PJ+6CTqs/0upyXMZ0kKqCCxNVd7OmQktUGyfhv/9PPxYEe86xhtDBQih5jF
         pDmamau2EKDb6VTmAk691RU+cvfXjbgn3vRoBaap6YsUw1K8DZJ4hgxPysBVtFBRSw2Q
         Sca6vJdLNFc+6Kldim1fiaGL7rSdQbDD+7JOfDDRAPPYtYcXduJ2EUaD5R0Ub2fORNjy
         83zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=G9secbmrLeczpRPZ42gZHzPMJ4soIG7S5n6DXzNQl4Q=;
        fh=pIQTQd+nQaOo+SIba0ywPVcAqNxa/ZMV42nqF6157GQ=;
        b=h1xE57/rKjX9WHsQz/1/FrFQz7RZbHsXJLvkV80R9X6knXKMoZb4Sp9VfjQUdsdMbW
         h96AmWQ8kg2uROyKkGsw52gCQVJhhObE+jFEqMWB/LU82KNi8dpqL5/Ba+FmL3zwZEQN
         I/o1i+jnqWKvRXMnmxkz8JzOH6EeACH7MMEgnw/OXuvjV4NS1BGSoyRKoDLgE+VMRzK0
         PWl04lukuJQpNoCwS+Sh05xhZPbg2/dcAGbUmd/gTTH087i1Wd9skiLe21j6zuQY+DtH
         HMX3DuB67gbBHbvKrfvcy4P7fHqwSBSXS54XBFKRAClcEKh8QyhJFJYCcxr5ggdvpx4o
         GH5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773043059; x=1773647859; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=G9secbmrLeczpRPZ42gZHzPMJ4soIG7S5n6DXzNQl4Q=;
        b=wQQ8sP7OObRVcKgeGGv/EzwD3xLC5blExAfs9xMlsv9wXPz4gTY8BOntw4SjgTmNDN
         cRZQEL20ABBq7ZxLfp9oZTpp23v1pxAp5y732TxQdk8skhbNcTSzbNOB4VxkQOe+vEYT
         3QbGCZyRVGPxET4P2rhcv0Macc6trG4PottoMRTws7a2Us9OQGVoromoHQk5zZoeu5Fd
         1fiUjb4SDwZ+3wETlO2DfqSVB7fHEoT81J8viPUXHb4+2I6ZAcCuXh9+VtRsnrEhEaLR
         C2JzEkxC/jWSujXPW+/1iwtYKxKzbwiHRi8nf1xTmCbUR1n21O2CRV0XJqxff7GQpKT9
         HNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773043059; x=1773647859;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G9secbmrLeczpRPZ42gZHzPMJ4soIG7S5n6DXzNQl4Q=;
        b=bzjy7V38+yF9Tshx6WJYx3lUKnRAgkTxNGS1fkfBFOwmUA8yDPja7G8S9zb/69QClx
         Hvmnb1Eh4juaTEOKR4lwfE7Ap9MCow25f6l57MUuRqQ5srwaPdfYWs5oJl23V914P4Da
         j6BEsmCDsTUGbhhfcNLxorvbGNFc6NvLXjjPZDSTkXol4zPlKg3pteEaxeQncsorQMHJ
         U/C+dNTbdCP2GlxFDsuzL/Y4oYbVec6g6Rn1AtIyRADRLvOk0yqD6VEorA9JGXMMrwiN
         CpwJ0ox3LvR5HgTlBVU3vDeXmGMhz9WQwFiY4/0WqNLm8cUefsmo5Jkfzk1S6PREfeJ7
         7RuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkgLmBsk1N81L+HRnjzejGFNSPmR5aHQmqFFb6UAqy3sZhEPq2YCcF1cuaMI7W8Rciqwjz3w6iJR8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk59wJUL6Mrl6cp/SFqWd2mmPrvhnUiRpVo61+k2uuKkhvIMoM
	pQoJ7j5swo2IOEA930XlZ2uJ0hX3m+5vvs4JH9CoOfbim+nNUUrz2NrV5xnPdVlXBy2IyXHwIb/
	e8chtcRByudNG7RlyqwjJLU7oz/H1JYacMU94dfy1
X-Gm-Gg: ATEYQzwzQYCKALY2ySNg77PwwmqpsYSHDIWd9CtBt8gr0rcd/4cRCTVexEoyago94pL
	TXihRw2xI6G4I9m8ehNiRDFwdRIlYa/yDmRuaFkWzHlcSEGxrUsFbnHn+J07EU0fvHKhbOjoRHt
	c/gzO5AehoXV1V1+weyNGVZKCGpjrgaqcdWETI9s3UTlYHkbMKoGLWjxgYtSoOGN4JlhpdUD9CD
	fw9gMc9JTNjFAigvGxFaYmQ48pzKGvz39wGUkT3BY5bRIwbzhFbaixHqY062dWLAdrnY/Gf3BkE
	NZpUUvPrCqn3HpnafMAXuSMyYgCnFXviTNDA6yrHII6L/EMM8znRw915P1MH+40CqYHP5Q==
X-Received: by 2002:a05:6102:d8c:b0:5ff:d192:ff2c with SMTP id
 ada2fe7eead31-5ffe6213645mr3556252137.34.1773043058690; Mon, 09 Mar 2026
 00:57:38 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Mar 2026 00:57:38 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Mar 2026 00:57:38 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <2s33j7wg6ehizvdoz5fggc6kfa5byrs4yg2hk4fvwvfjp7nigo@se7fhyaknqqm>
References: <20260225-gmem-st-blocks-v2-0-87d7098119a9@google.com>
 <20260225-gmem-st-blocks-v2-3-87d7098119a9@google.com> <2s33j7wg6ehizvdoz5fggc6kfa5byrs4yg2hk4fvwvfjp7nigo@se7fhyaknqqm>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 9 Mar 2026 00:57:38 -0700
X-Gm-Features: AaiRm539ncfsVFw5AP9VoOkialmaGifm5bQJ7k_NAlY4DMAWUCQTSVmir1fUcmo
Message-ID: <CAEvNRgEH5X79zwFr8t4EayDccED8i5__-oFyBZ4nb_RkX8826A@mail.gmail.com>
Subject: Re: [PATCH RFC v2 3/6] fs: Add .unaccount_folio callback
To: Jan Kara <jack@suse.cz>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, seanjc@google.com, 
	rientjes@google.com, rick.p.edgecombe@intel.com, yan.y.zhao@intel.com, 
	fvdl@google.com, jthoughton@google.com, vannapurve@google.com, 
	shivankg@amd.com, michael.roth@amd.com, pratyush@kernel.org, 
	pasha.tatashin@soleen.com, kalyazin@amazon.com, tabba@google.com, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Jan Kara <jack@suse.cz> writes:

> On Wed 25-02-26 07:20:38, Ackerley Tng wrote:
>> Add .unaccount_folio callback to allow filesystems to do accounting-related
>> updates to the inode or struct address_space mapping, when the folio is
>> about to be removed from the filemap/page_cache.
>>
>> .free_folio cannot be used since .free_folio cannot assume that struct
>> address_space mapping still exists.
>
> I agree .free_folio isn't the right place.
>
>> From the name, .invalidate_folio and .release_folio seem suitable, but
>> those are meant only to handle freeing of a folio's private
>> data. .release_folio is also not called in the truncation path.
>
> But this I don't quite understand. .invalidate_folio is called when
> the file is truncated (or when the whole inode is being evicted from
> memory). Filesystem can do whatever it wishes there, not just free folio
> private data. Are you pointing at folio_needs_release() check? But you can
> mark your mappings with mapping_release_always() - it's there exactly for
> such usecases... Am I missing something?
>

Looking at it again, mapping_release_always() gates both
.release_folio() in filemap_release_folio() and .invalidate_folio() in
truncate_cleanup_folio() and truncate_inode_partial_folio().

Let me try that out in the next revision. Thanks for pointing this out!

> 								Honza
> --
> Jan Kara <jack@suse.com>
> SUSE Labs, CR
