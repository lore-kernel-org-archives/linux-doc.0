Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793831313;
	b=q5ASe7lQBd7jGai26Y7/rRKT/5wpIHw2Su07nHbmnAttmoNyRTeFO8yd2cmUua70xKtv
	 g61z8/9fTKx2DnIrK9jWDGRJQa4yIAa0I82zm5WA4WanDB5blyYTI6/LcPFbBpzw3cx0R
	 ajU7OlFUTQ76Bo4y1BLExhXX6Rgr6ao7kEiZQ9iKz10Se3T2ugqy6QO+K5CS7TgPxw37u
	 64xFR7KWudCmtyxvCneWNCsG6q6g03YxECEyH7yiyZjntOMbkYO6TwLvhFw/VDEAx59aP
	 iM4CnAXJs0aZNfe9K5uepUB6jcBuK1kW0isdIRRzEaWiWSykSVbEdFQObx/kfdIDLpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793831313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ngSI9f0kiDWl+YO8rRXsU2IRSVNvxIMeC8SrK3o9F8Q=;
	b=xrGiDWZi4/2eDfC6iG1wF/5R82vjLOM/iGa4WQF6Z2e9mzRvIAiSeD7F+dNsx61/OZqx
	 od4k4MLWHDAgGoxMT8MYO/MksXPNazr2ITVic8coeiS9HDutKU6pBEFHygobPd18Jkz9H
	 sUxBroWCp4MUD20AAcDcFAVBekknNiKvVl0mOyPCI0z4O7dZq+/tVEttHC7ELoLIQXjv1
	 Fmlzu2vLz+JDsS6RlMYM/TTJwcgFymo0J5pITJL2y417hUSkHC7UAXJQb9phY8H0BXVSt
	 uG/m3eTvVaGvKx0TeCb5MRGVU98ItjQm97cwn0rHKJ/dwQiRWf9UmTLqQxSJ/aUU49g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q4r8YYWn;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598A2606B3A5
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 22:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 598A2606B3A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Q4r8YYWn
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso876432a91.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 14:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793831313; x=1794436113; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ngSI9f0kiDWl+YO8rRXsU2IRSVNvxIMeC8SrK3o9F8Q=;
        b=Q4r8YYWnN8sCaY/ODs1yIT8lq7b5mwAQjudMxrtoqP6vQcq4r+8STrumanbHpf3ain
         o6PYhcUcEJyR5K9TdjhA0RThU3nkwkKvSPhI1I3sb6m6/bn99QLYDdHOBBgYhIzt/G7S
         6PEogm7tkiRTcGX6whDNCNlWIqQ4g3wtpZphRlTdhJX0CmT03/EwQAjRVEgRM5xivqIG
         WPBCZ4DNx4AnZh8vOqJJzXqtusiL9soWcNfDPSbZvbAwqQZiMkXKBmENLW4xUr7syquV
         2ViGz3ZyZhv+D/9/+6ir2dfvTYhKdqq0CkpekiE/gW0Sj8Lf+WfBG1fxNZHI43AK0A5G
         EDVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793831313; x=1794436113;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ngSI9f0kiDWl+YO8rRXsU2IRSVNvxIMeC8SrK3o9F8Q=;
        b=jp6/wJMQ783GmqIu5RBRH/K2cm+kwVG7eWvlhG3GwkoUUYfizKvU+mGKRE8EuoMpKK
         KwdSOT5As5XyhGcNmdjYEFkkhFmx/X/tENVjmekzdYH6/4RmpYEIvr8l9eJEirqWdceD
         jtPg10chTCjS6UBuCwJwj7JyH1RRraP6PWlFbNeXaZtyJI7sBqwXrbsCiOmvHIbcJH4+
         WShA61cJD9QIJsXv/AGrTWZ9KPEYj2cNBUicFM2hw27Qt070KTcVGMSOQYwO4lyrhqc4
         sCYLOPxbDAtcfDNkfCIoFZb9LpAQiNkoqnA/JqoRQalIjGXJ0O1jB/U2Vcd07wilbvnv
         C/hQ==
X-Forwarded-Encrypted: i=1; AKwUvByeNQjLyNjX3xIkL5NEoYIkjQw/ZHnaWhJoOAfK1eXdo7WpwPPjBF8cxbc9jq4LVAZ5aPrvJt+CddE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q2IpQ22Li4cMApIu3fyinIQPh1DGPLtPOMXqOVg1JKWNBmEKQ
	IGULyduk9VochzCfv3Bpm76WNqDfoBrLLRcWryOkvfkA3cjBk5cYzPXY1x97KJJRlg==
X-Gm-Gg: AYBFou1+PkQI5lAGjx1qbKpsJGeiQPjXtZVrZGRBJ0DYqWF0yBX0dFg7RiMT6CYTImk
	9DWm+DgjM9llqgFJpY8GAEJj6uQ9vUcgij2MiaZwo2GjSD0ElD5YtjJvkmyde4N23W/l5y32Ftf
	9+kS7kJWAOOTJYVWN+akTzCWaLcEI4X4c7UrDVLHszDTi2W0o9RIDcPpk7wjBbEtQKtK6e8Ckrs
	tmUgG4QWHfUW1Ebjdb5At6I196B8vus3WVG1flDX/jmol/1SsvLFN8WcxgUTx2et47VltdKOZH7
	vrPeFNcnltjXrtbd8G2s0xpxjQ2rEzJEvoDWWL9GFzP7KW6kPvjmceJ1SDA/a/L1GhkmNl56ozU
	XRXE+p1HUvKiH5nbenaoAwbg8eiDtkh561F16QBBM/1IE4yIUBfL4tFReQSSlKBdGQo3yJQjQ39
	9aMq8OSNSnToCOCoBtIBNvQPpIn7Fnxz/uKgUQEajjXBnzyC4CG0cL/5oOb2x/F5EUIY5AXjkQ2
	uvOFLJ0D7JkyASvdSzXtUcNrLx8bP83t89C4oq5PUmVSqtFNjUmo14Jht0YJ9zp2q4UjcpUIvq0
	rbZsS7J1WHwzM2FQg//XvO/4JZ6LE9oytquyenKgKlaHRquSA3aT6xeYEElWXZT4
X-Received: by 2002:a17:90b:4c04:b0:3ad:8a14:bc73 with SMTP id 98e67ed59e1d1-3ae897b519bmr13057533a91.50.1793831312185;
        Wed, 04 Nov 2026 14:28:32 -0800 (PST)
Received: from google.com (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31cf4b6sm710454a91.14.2026.11.04.14.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:28:31 -0800 (PST)
Date: Wed, 4 Nov 2026 22:28:27 +0000
From: David Matlack <dmatlack@google.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org, Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Christian Brauner <brauner@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v3 06/10] mm/shmem_luo: Don't make early retrieve
 failures permanent
Message-ID: <auuxi10mmCQrq-y2@google.com>
References: <20261103010216.3447716-1-dmatlack@google.com>
 <20261103010216.3447716-7-dmatlack@google.com>
 <2vxzik2ck5dp.fsf@kernel.org>
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
In-Reply-To: <2vxzik2ck5dp.fsf@kernel.org>

On 2026-11-04 04:01 PM, Pratyush Yadav wrote:
> On Tue, Nov 03 2026, David Matlack wrote:
> 
> > Mark failures in shmem_luo_retrieve() before it starts restoring the
> > folios as retryable, and return the error without freeing the serialized
> > state. If no retrieve succeeds, finish() frees the preserved folios,
> > like it does for a file that was never retrieved.
> >
> > Nothing has consumed the preserved state before the folios are
> > restored, so the retrieve can be tried again.
> >
> > This also fixes leaking the preserved folios when one of these early
> > steps fails, e.g. because the file has seals that this kernel doesn't
> > support. The retrieve freed the serialized state but not the folios, and
> > finish() then skipped the file because its retrieve had failed. There is
> > no Fixes tag, since the fix relies on args->retryable, which was only
> > added earlier in this series.
> 
> If the seals don't match, the retrieve is not retryable. It will always
> fail.
> 
> I think the only retriable part is memfd_alloc_file(), although even
> that is quite unlikely to fail. But I think that also fits pretty well
> with the most important type of error you want to retry on, which is bad
> arguments. In later patches, you check the argument on
> shmem_luo_create_tmpfs_file() or shmem_luo_create_memfd(), so perhaps
> set retriable in those functions?

When retryable is set, LUO leaves the file unretrieved and finish()
frees the preserved folios. If the seal failure did not set retryable,
finish() would skip the file and the folios would leak.

In v4 I can move the seal checks into shmem_luo_create_memfd() and
shmem_luo_create_tmpfs_file(), since the valid seals differ between the
two, and reword the commit message so it doesn't suggest that a bad seal
can be fixed by retrying.
