Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793832163;
	b=bXc+vR92hspCQY4rprfw1lDmbpPAinZHkrM4Q3moCFB/7UbonU/3puU8EoNuZO5PcYki
	 WTNun9BwuuZ6W8VTpCujSwaZ0ngqG6YEYEynwiH/RXVZ6Y7I68Cs2SQYWsJF4ioLLDXqD
	 HVD5yheBuwIf9SWkN9zaB3DPrZZaILXwAvFJu9+ZKZJoF/V2Ukoe4R/dvi2h3gh+hQPow
	 8qNsH8FCalBDOb8YSIY0Ey7lgIgaPaYRmby1UjrdYUC5ZRBKHGx6uqSH5CeruLQscBCpK
	 Jj0/4Qqfd5TgWggr5Bpym3mCo8T8KEayZ/kD2tnwKbXHiGhQJS2nAzHLEoaOSMl+usw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793832163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=76+aUQcUn4RSh9/vkGb8GrJJ6hK0vTzaCEd5JGs9ODc=;
	b=CPn8v4tZNCQ1+cfpX1UQ+ke1N5BHG9hJbzSpGRjzojkPpu7wE+ERfpKyQBGm3E+q+uu/
	 pvLlzceQtW8ndJ2y1K4s1Zk+bUqFt3xXxknRSoABs8vVXKcOWZn98vfEp8VQFnPHMRhu0
	 WQLb3P6s+jJFkYeZxYmfIY/uUcuo+DMfv5tJVFXca4mqwVAfCrNi8eqlyGxcGhsTlY9gb
	 WPowi4soPex2K9xiT9rUGyahPTwfWzpsSUWfO88H7Fxwn4GKHS+kVTqXhGCDdpTymoNr8
	 nNHKXDEMx/qr989vi+FqxrkhjV6AVz3QiOtU6MSrsFNgvfQeRCWEWuHEFw/XWzY7FSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bc5gIK1r;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4466606A32C
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 22:42:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4466606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bc5gIK1r
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so951505b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 14:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793832162; x=1794436962; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=76+aUQcUn4RSh9/vkGb8GrJJ6hK0vTzaCEd5JGs9ODc=;
        b=bc5gIK1rOiKNTqR/V1GB9jM18i60T1SwBhl4NZlMaTtld9M5yRZjVbNgJ/8+MuJ1Rb
         R+UGittyyjUWptyfq3fLhJGu9SrfDQnETn96wqGM94k8RieKsyWvw01K/CN4L4D+OQG3
         uTS1hAKLQrYdIf0uyXwqRxGXKTSwQFd154CH81ZeZj81l2trnkwT21X3EHognDxg4A/4
         ZsAjip1IRND8yVoiiAUXMGNxi2weotMDj7SpnTjV1OF5BGf+zG3NQYqHSp2rzaKjMwCS
         4qMmfVgchGfSMdZxR3/T+LknVr1db/rhVccT1Xz0P95cQr0wwhUoWgo8WXHpESeoVajc
         lSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793832162; x=1794436962;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=76+aUQcUn4RSh9/vkGb8GrJJ6hK0vTzaCEd5JGs9ODc=;
        b=wnIC6bFDUgSNORCQuurgZubeDwFCmwOkm5/AcN91NJm7wUBkMsoXJKzvsc25A1Fx29
         jpss8wp9KsaNCXX+YdmmziDRua9dRhH6u7VemQvlIzxAw6gZ+OF1YfPM5AkI8dody18r
         ZmeVJzJK+Miq6psbrOFVNN1GKhHvacaYlzcfV/Naz62dqPMybV5DoVzje93+zOebS++E
         n/i93n7XRtwngD0h6pKtz/MmGGqd9/vf/rZMz73tqviQy+W5T9ZED6dfwFH+L9A1aVH2
         nT3rz9auFfcCiiDB8Wb8+qByjYIoGzHlC8jV9qG18DWv/2cQxUtMGHeoDbJfAu+r3cYh
         mZJA==
X-Forwarded-Encrypted: i=1; AKwUvBzTZe9ySAabwjBAo67kmMneOv8x9F2eHGuVgxbq71SVq5i6SBZNBWUZYOUWC5P+ioQtaPn+ZBgGWIs=@vger.kernel.org
X-Gm-Message-State: APuU4Z823GDLyFQRpwzHWR0nqwneEN+dMpUGZRquN19eoOH6f2eD3ZpV
	GgrKTu5CDbGRNM07tjjI1s/17SYPKwfgdJVlIylj/zBHLB883f/7F2MufQgHsnB4KQ==
X-Gm-Gg: AYBFou1p+nhjF9lyKWgxFvVNJDG83soLImxR4deo0BqqSOb3KpbBBnn2Bo6UY1PKun7
	3b2UbHNmJQNrTC7rVNiiAqrwSvRPl/pvd9b1FVEDwvDeMMutJyquqEVWnvBIaKH7dmCHDQ/51X1
	zOexXHAYumFgA8LVLOhsQyCscCwGPrJdPSIwx9baKaZ2G/UMz2nfjgIV8gpGzL0yG0arm8jH9WP
	S1sjY/U4OfagpRVfeneRb8OP7eYD5zJYZ92nEOF6udWHbEDiA2jQGKoTZnzP1XukmsFuVqyWjQ5
	I+zgNKh5Va/HF6o2srIG5+thsufsOsipd7ofAb3XgVzyBH8XkeMTPQxL2oRuGNMCal7dKMekdDE
	aQpLkVAAx2KF9QqrPTP9ANNYXLou9Nw4MwbEHNOR0kO7Rwe4hs2KDE8UsV0d9tEIjgz+Jqsuo6z
	klaUkSulCzKavM766UWSdBkwnMnd33EBkvkDh8EOmWzzlG94rOzPhyktfKD4zI/QD7QNyK5Xwp5
	QlPH2vrNhl8lm4XxWNZujYvxu7as2Z848f7eGjeKuq14FEE5PqRN3cVJlokALoSSlKYmPbB1mDb
	YBIj2rfXVtO0EC0ZXP+JVG3mxz9jmVFt7xTBz9fyJ577ODZxs5SzjNeVG6fDyAuP
X-Received: by 2002:a05:6a00:32c5:b0:878:34d7:697c with SMTP id d2e1a72fcca58-8a9bf811624mr14694461b3a.42.1793832161677;
        Wed, 04 Nov 2026 14:42:41 -0800 (PST)
Received: from google.com (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b1209b473dsm1079338b3a.36.2026.11.04.14.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:42:39 -0800 (PST)
Date: Wed, 4 Nov 2026 22:42:35 +0000
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
Subject: Re: [PATCH v3 10/10] selftests/liveupdate: Add a test for preserving
 tmpfs files
Message-ID: <auu02-iDbVaEL-4v@google.com>
References: <20261103010216.3447716-1-dmatlack@google.com>
 <20261103010216.3447716-11-dmatlack@google.com>
 <2vxz1p90jzx4.fsf@kernel.org>
 <auuJM8c-bE43NP54@google.com>
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
In-Reply-To: <auuJM8c-bE43NP54@google.com>

On 2026-11-04 02:37 PM, Pasha Tatashin wrote:
> On 11-04 17:59, Pratyush Yadav wrote:
> > On Tue, Nov 03 2026, David Matlack wrote:
> > [...]
> > 
> > Umm, no way I am reading all this...
> > 
> > LLMs are great at generating tests, and I'm not saying there is no value
> > in this. It is just that this massive code dump is unreviewable by
> > humans. It is also unfair to the human reviewer because it took many
> > orders of magnitude less effort to _write_ them with an LLM.
> > 
> > What do you all reckon we should do about this? Trust the LLM to get the
> > testing right? Do we give up human maintenance of tests entirely? Do we
> > do fault injection to test the tests themselves?
> > 
> > Or do we make the tests smaller and more human reviewable?
> 
> We need good test coverage, but I believe we can break this patch down 
> into smaller changes where tested features are incrementally added.

Agreed that it needs to be easier to review, but I'd like to keep the
coverage. Here's what I have in mind for v4:

 - Move the preserve-side checks that don't need a kexec into
   liveupdate.c, like Pasha suggested in his earlier reply: which files
   can be preserved (permissions, read-only and append-only files), the
   frozen size while preserved, and unpreserve. Those then run with the
   regular kselftests instead of only in vmtest.sh.

 - Split the rest of luo_tmpfs into several smaller commits that add the
   tested features incrementally, e.g. one for the test infrastructure
   and basic retrieve, one for the open() flags and creation checks, and
   one for block accounting. That makes the series longer, but each
   commit is a few hundred lines and can be reviewed on its own.

It will still be long, but I think having the test coverage is worth it.

Does that sound reasonable?
