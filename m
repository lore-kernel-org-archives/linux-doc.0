Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821525;
	b=qbzeXgfS1ALGRyQ7NUifnx6bg2v1tyQcnC87vI4GTbelN+KHcxp8Qkgp3LfZW79ZNEwk
	 R3z7AkFDtmpTPtZR7ReLjlXwJ4HdWAQ8jXtYNK/Sa7dGd0++8DyGfD7F2EljoiYJHL5xI
	 ZA7O9A7OswPMoqFOQ3UHNSP4kfB8wm0bLCB+ukwptgY5X5c/ry+vNgyqzaLmtLy4hAGHO
	 XWK/0WhKw6rfzYxF5Xt2bzI9ox+qHIPNHwBIGiYtFFJwdIOwEnZ6hMuz6jmmGw0ilWdmG
	 FwvgkF6X3pbP9mULpQtFdCS+GZe8DtgVyiujAD/t032mhKmIdNT6+6WVf3fjUB+I1aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=AhauLcYrkNfZ4d386lPMrnU0qCgiFUOVmgX6lCm/lmo=;
	b=VFdSitZdPcaHIN234R8MNmLm5arxsYTxyKv26r379DX7dYqfKKYsrPfljhDAKsHt/hx3
	 Njn1X3A8UTsQJZfDMUZyrzktVVl+FAeLVEvRxx9ny73IWhdghdkzRgyEhIxEX4mFGzoY8
	 WyXzp53j2YK5zgJEo16bpNXwwVrusyqQ8Kamnp0per7xgtXh+4TUU9gLXFP0qdoQfhIkv
	 XOiARfGvOlSMlsFVMHvoCiarl4sQGxqRz53FMSbm1x+5nJ9juHMtg+FumxYM3IrqBQPR/
	 5xia+aaoGK6u4csUmAuzZDTZH5sS7DNEi58F9OUctfgxYUDFemH4UgsS6ZU7Dz0u6Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=WC5ocPUo;
	arc=none smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79374608B6E7
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 19:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79374608B6E7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=WC5ocPUo
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5ebf39def3aso393227e0c.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 11:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793821524; x=1794426324; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AhauLcYrkNfZ4d386lPMrnU0qCgiFUOVmgX6lCm/lmo=;
        b=WC5ocPUo+tlRFkU95XGXMDbL6gRJ3pR33pHcTZQ3vEvWYmERsJIIiWabyoYjJkVHib
         mDPBAtqGztGVDEwx2Txbp9/W5N0yj7Tm9YQjy13e/5KVnFje3EitBqJiJGhfo5yo2r68
         0dw2J2R1tLuPWx0dNr/hkp4Fko/46f0EcQzLLqYW/VDsPDjPYysiohYaTScRueqQDXq3
         Z+aLzvLwt7Egd7UsVvUgENoXVcgqi6ljJNxX6GTEuEGhLFWXuzWMujlT7b9iuQ6slD7U
         wtDOUYuXcmHlCjxC2MpCiRjvOiJfbs5DWFxpPBVgbMcZMvEJXFdkKlPj6LjAzhPdwPSU
         TuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793821524; x=1794426324;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AhauLcYrkNfZ4d386lPMrnU0qCgiFUOVmgX6lCm/lmo=;
        b=NAYCAADCbBbtLldwSBeUHz0BbGUuVSPi6LWUMWbGBMY9XdQhRIQ98sp1p2YBGTScd0
         tCotK+BWB88rju3mlWq8dvHyUyva+N4/KjEAYO304DxKQaIKZvscXhzbVEIjizcQIvLb
         T3sDVXdgL/RFIzyau6Bg93Kvoo5ViUS9qdNWPn6o0vMTa16RS0lP2jsk5J2/FXrGIULo
         c6chGaOhrMyyePa50jGPBlc872WoK6ehzhw2Kg0bsF3jmSzlxcRpjyqaxuLSiB/F71xn
         1CesbqqMLnGuCaIaF6GFYdL7XTL4DYb6WnkCNWJLAGnXtzqL9TRh/wuMFJdX7gOy82/V
         zFag==
X-Forwarded-Encrypted: i=1; AKwUvBwNUO4PU2i7oWY663j4xBiyGlDBmp+IScbcQpUOjHthk5PQSav9ODWop7HC2T/uybKtaDGDw9C5iF0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NbogtwNwMANVER6QD6l7sLECWArUSYb7zWBzo3ieZZtl9drj0
	stPsr7LTewUdrRFSmciB13xtO0un8LZvUiT7h+OWIp6CBlNL+DAX9s0PGW/TZbH4QQg=
X-Gm-Gg: AYBFou1Ax8Y1yadM4V6KiMgNolW+1Zwkgrl2n+QeVPzGbBxGe6rcLZQ8bLxXIuvgbnj
	+dd92uqNEmYlH2h1QMg0NKngKkacQ7u1APnfmk5AAEREApUt8eiLEce7Ls3UtaTVs0e8DlBk20u
	vmFzYv6hoxVdr87Ppz4jGP24/PJ215JhyXbXYscvxdq8dMpoFiADpjd6/O9EjzLz2JZjEMYSkds
	zS6xj76aSYydu0Qrnq2GP/kvG8KJ95Y8TaxpaJU/DZzLkSlXhaJlOicbbBOyd8lxbYft3Tw/7Zb
	+A/SRNfowyEtdmZL+Q781kjzHjITt95viT+gSC0Qis99AYK+Sl4fBrnf4LldcHowxRrpnul1FIe
	66S6eg+wlcXmH9jTeawpv07MaiQrdisY6A3niQdEJwbtdzkMVoE//5+fPd8zc6n60C679xRWcvc
	TYuA5NTEGiaZJo224KZcZ1kZPSRozvjeZdwrwP0ZxXaQBjbVKQrP7RSl1XPFyJabSaKBT9eGpQb
	o9+6zmA9K1qd3IXaxVpgUbVE2skLh7h3LbmCEnvD3BHNl3S1s3Kn0sggTn2QoH8P+4q75iJQB+I
	DdUpkob94e+IfsCbd55Qwq923w1oW6uli/d3FFlwygIGPmnuaV9yZOI1ky/rmg1nnfem/ccDMAT
	+3Ezkz8tZ5UNpY4RM0OaTjqpP4CWD
X-Received: by 2002:a05:6122:54e:b0:5e5:29f7:489 with SMTP id 71dfb90a1353d-5ec6899f507mr7074700e0c.22.1793821524335;
        Wed, 04 Nov 2026 11:45:24 -0800 (PST)
Received: from google.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca889381asm2496927e0c.0.2026.11.04.11.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:45:23 -0800 (PST)
Date: Wed, 4 Nov 2026 14:45:23 -0500
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: David Matlack <dmatlack@google.com>, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, Alexander Graf <graf@amazon.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Christian Brauner <brauner@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Suren Baghdasaryan <surenb@google.com>, 
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v3 09/10] mm/shmem_luo: Allow retrieving tmpfs files with
 O_RDONLY
Message-ID: <auuJ4msatqzoOrjN@google.com>
References: <20261103010216.3447716-1-dmatlack@google.com>
 <20261103010216.3447716-10-dmatlack@google.com>
 <2vxz5wyck08d.fsf@kernel.org>
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
In-Reply-To: <2vxz5wyck08d.fsf@kernel.org>

On 11-04 17:52, Pratyush Yadav wrote:
> On Tue, Nov 03 2026, David Matlack wrote:
> 
> > Allow userspace to pass O_RDONLY in struct liveupdate_shmem_retrieve_arg
> > to retrieve a tmpfs file read-only.
> >
> > open() requires write access for O_TMPFILE, so create the file writable
> > like before, then reopen it read-only with dentry_open() using the flags
> > of the writable file, which file_open_root() normalized, and drop the
> > writable file. Like open(), which grants the requested access to a new
> > file regardless of its mode, don't check permission for the read-only
> > open.
> >
> > Retrieving a file read-only allows a restored binary to be executed
> > before the session is finished. LUO keeps the retrieved file open until
> > then, and executing a binary that is open for writing fails with
> > -ETXTBSY. Being able to execute restored binaries right away matters
> > when they are needed to finish restoring the system, e.g. to bring up
> > the services that retrieve and finish the remaining sessions.
> 
> Can't you put all your binaries in a separate session, retrieve it as
> the very first thing, and then finish the session? Then you can execute
> those and retrieve all the other sessions.

This is a good workaround. I am not opposed to this patch for 
completeness of functionality, but if we decide to keep it, perhaps it 
should simply be squashed into an earlier patch. The current diffstat
looks bad, as it mostly deletes code that was introduced earlier in this 
series.

In any case, given Pratyush's suggestion, we could also drop it.

> 
> Why do we need to support this in the kernel?
> 
> Also, please put the motivation as on the top-ish of the commit message,
> and the mechanics later. For example, your second paragraph should
> likely come below this one.
> 
> [...]
> 
> -- 
> Regards,
> Pratyush Yadav

-- 
Pasha
