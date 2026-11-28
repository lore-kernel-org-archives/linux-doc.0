Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795828227;
	b=uNY0YJlulozwttiKiXASEO8FxLVdMM75LYyu901tny+KUPs837sPAzyyjhfRNWL8vxbY
	 jN7nIv3EaMGb5dcuMSp/bqPQX0arqcYFUOcEJqvSparafpgb4xX5ms1NYfJmHWq8hMPj7
	 QvaSq+UIeQ+VsICCIFJ7+WoblUYbg8T28V+7gRGZ3HoIRMaYZ3EabsYFx9/ingGC9HCab
	 3WIDL8ERcCoiGjrMkssBK3tZMtNbbFRvkKbsHjCiTZxLIUJHTKqtXX6o9F2m/oCFtKn4n
	 shY4n0AWBK07gsOtnJFpF/+8Od5X5luxMEsOVBOYd/nHHQLXa91/ZG5VtrB28Zu5LTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795828227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LCoNBWE3kmGZQJ1kgw8zMrA5EDN0aulmwFxsRmULwsM=;
	b=jNXKSbO5GdDCkWYigindtKwQ8j5fha+MfVvWtBcDydMp23PCBoSOkZZYo/XlKUuRKgM3
	 S0LpV68gdAJI/pruXl6RBKSj43yRwkMxqNYa8i4O0XvOV73PILAjCiq9dJ9tE/5SkMs4b
	 J6ajD57HYix2LO43nrPwX7RoO/LCd0afzgK/Ko9PwR9yUECKfGC2GAo3PiBBOSt4dqz4t
	 NusGNF0xCl7JqVfK3YMS7ylpjqtquSnGn3wk8HuSi6dJrWeKGmT6TREhgW4BirxzZ2V2T
	 pxPm3oMEbhvNk8bowg5dtpF8RL/3Sq8SY2gYucLlYuU58P+rnsROPJX0zwqcGD8D2wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.cmu.edu;
	spf=pass smtp.mailfrom=andrew.cmu.edu;
	dkim=pass header.d=cs.cmu.edu header.i=@cs.cmu.edu header.a=rsa-sha256 header.s=google-2021 header.b=CWjYKGT0;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11119606A327
	for <linux-doc@vger.kernel.org>; Sat, 28 Nov 2026 01:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11119606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.cmu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrew.cmu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.cmu.edu header.i=@cs.cmu.edu header.a=rsa-sha256 header.s=google-2021 header.b=CWjYKGT0
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-536717a4d83so71228301cf.2
        for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 17:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.cmu.edu; s=google-2021; t=1795828223; x=1796433023; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LCoNBWE3kmGZQJ1kgw8zMrA5EDN0aulmwFxsRmULwsM=;
        b=CWjYKGT0Rxh7o04L3TC/JfK+uf4hcTv5G/OYgTRB1iBdL4eDH3e/LFFIDSlMTSh10O
         nTeD3sJ2hsdOj+qUENGI6sv3VZx0OdZm7gaYArds/UnZMFzu0txNbil2P2V49E3BSbKf
         fBFWYtcAxrxOXqE8cE3CSJ7ayej+C8/WOWoK8p4TehPSmjK4cVdj6nW4QQnR0rVwFURz
         FQHMbeQFo/sRs/DRuW4xea47NphJ6VklMieXOE0gjy6FzMga+PUhUn4yGX9iJcyWCFRN
         dHlM28+px1j6+Lb66EZ6+U6goVgQsWG0+7hHxkb8jYPOwUJKOuA9bMOR7OUMQNy1D4tO
         ehCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795828223; x=1796433023;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LCoNBWE3kmGZQJ1kgw8zMrA5EDN0aulmwFxsRmULwsM=;
        b=EVhBWUc/BNRGAvI7AQSyAY/9WGWfGpQnFTGjrfMjFyA44mDDGRSzm1khnUslUBYn2Q
         a7uLGwSy9PzecSNpbWfGHSEgfjMF48KCVrf7to3KfAKK74o26HR4uhCyFinuWDU0bjv4
         +Pu0ppjR1HAovwB4SFwLjOWZIdM/uZ4RwGE1wZQa8RKdPvx/pGfAs0CNAeR/t3Nt6Qig
         7jlXfQbdWADBpC/np/Mj+SZVmM9KC17ZDqfIiBX36tarn34VFV7iZVcwSlcCXNz/pEtc
         NW+7RnLmeDlYiQLCHO+h2E3QkQPpwABK9mp8kKsZBohwQ3TFpW5ZvA9h7RA55YQjpfXg
         BUww==
X-Forwarded-Encrypted: i=1; AL+hErFWM56Z0VLUQTGDvWWSVnwaaVz9vTJiz9Bt0DQcJbgnTmOrpNNk6LyPzXqQCwZZ64CI3mD1V0eTzIY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9i8rN5HdlFAyPQS8B7FGNAmDZpbfPDbfYriH9mb183OO+uZtuF
	4qsVdIYfOsGyaQqx3BLTVxVekDJJ01VITHDL7uY/9WSR6tQWEXvfgjcY58ALReESkQ==
X-Gm-Gg: AZFdTZcGSopijayecDaUqNFNUWrKoHiKxXBoxWyhccH55og50d6QJ2Et9FAzeTa0Y1g
	X6zE5VAi9MUAYdMFRZt3kS5ekeY0gxTAA2QlyJdq+II2B9lpqigAKNnZEo5XnU6fXf0FJKifzc9
	fXGIm2+ww8miWFi12Y+lG4CGzP/Q9/i9GXcgzPxl+rcMoo6eb+5lmAYtY75uIgDcIMHMc22vvaK
	L/eUzfDIniCEm8+2XeMfxk2WvTBDEpxG+/+c2fjAhhJAT4xqjXBXvYTBWNMAdDCNzVOmy01HSEa
	jZ13izY0dbt2pOcMZfwztO/lQtUsTzQZ0QuWCEWdcS4o+490IuP12VAekxsGUQCeIaL2Q+ULZGj
	1KH3Sym20hw/BuxQ126eIe04XkurU/d/PB+H4wCInSycp0UaLQiC+puIVvTUR1Hy4Qcj50b7wxv
	jyS/WYDx745xRpdIjLZlNBpSNtcDjNQBSxGl26h3a2SQV4o3bzu2VN0WLnu7GZFvJcwrzE59nh8
	lZe27h7WHs1mjisAbLNmoybDNKq+c+Ybj2OdOF3duasa64zkDPdRgm2WGboQXc+qWpIbIkdeug3
	LC/DOVlGhyt62wmO8fToVmggfYhWushYnZAgE4fX4jwkwdSC8A==
X-Received: by 2002:a05:622a:428a:b0:535:f92d:5c00 with SMTP id d75a77b69052e-55d76af8921mr488959251cf.76.1795828223013;
        Fri, 27 Nov 2026 17:10:23 -0800 (PST)
Received: from cs.cmu.edu (tempest.elijah.cs.cmu.edu. [128.2.210.10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b3a0csm229263356d6.14.2026.11.27.17.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 17:10:22 -0800 (PST)
Date: Fri, 27 Nov 2026 20:10:13 -0500
From: Jan Harkes <jaharkes@cs.cmu.edu>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	David Rheinsberg <david@readahead.eu>,
	Hugh Dickins <hughd@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	David Hildenbrand <david@kernel.org>, Jann Horn <jannh@google.com>,
	Alex Shi <alexs@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Pedro Falcato <pfalcato@suse.de>,
	David Rientjes <rientjes@google.com>,
	Rik van Riel <riel@redhat.com>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
	Arnd Bergmann <arnd@arndb.de>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Muhammad Usama Anjum <usama.anjum@arm.com>, linux-mm@kvack.org,
	Andrei Vagin <avagin@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Chris Mason <mason@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH 1/4] coda: never point a file's f_mapping at a
 container's mapping
Message-ID: <20261128010821.irhzl7qcqahz6onx@cs.cmu.edu>
Mail-Followup-To: Andrew Morton <akpm@linux-foundation.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	David Rheinsberg <david@readahead.eu>,
	Hugh Dickins <hughd@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	David Hildenbrand <david@kernel.org>, Jann Horn <jannh@google.com>,
	Alex Shi <alexs@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Pedro Falcato <pfalcato@suse.de>,
	David Rientjes <rientjes@google.com>,
	Rik van Riel <riel@redhat.com>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
	Arnd Bergmann <arnd@arndb.de>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Muhammad Usama Anjum <usama.anjum@arm.com>, linux-mm@kvack.org,
	Andrei Vagin <avagin@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Chris Mason <mason@kernel.org>, stable@vger.kernel.org
References: <20261127-mlock-madvise-mprotect-ai-fixes-v1-0-e46b2b1eb435@kernel.org>
 <20261127-mlock-madvise-mprotect-ai-fixes-v1-1-e46b2b1eb435@kernel.org>
 <20261127124428.f1f66c6244d3e5c2811f56de@linux-foundation.org>
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
In-Reply-To: <20261127124428.f1f66c6244d3e5c2811f56de@linux-foundation.org>

On Fri, Nov 27, 2026 at 12:44:28PM -0800, Andrew Morton wrote:
> On Fri, 27 Nov 2026 19:45:40 +0000 "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:
> 
> > Coda file systems stack differently from other stacked file systems.
> > 
> > On mmap(), coda_file_mmap() switches both the Coda inode's i_mapping and
> > the Coda file's f_mapping for the mapping of the container file. This
> > causes two problems.
> > 
> > Firstly, the container file may not remain pinned, at which point this may
> > result in a dangling reference in coda_file->f_mapping, and so a
> > use-after-free in mmap() or lseek().
> > 
> > This can happen when you open the same inode across two files, mmap()'ing
> > in one, which assigns the i_mapping, and open()'ing another, which assigns
> > that i_mapping to the file's f_mapping, if the cache manager gave the two
> > files different containers. Each file pins only its own container.

Coda uses open-close consistency, so between the first open and the last
close the cache manager does not make any changes to the cached copy, so
every open is guaranteed to get the exact same container file.

Now that happens to be the Coda cache manager, I guess changes that
would enforce this at the kernel module level can be useful, but
dropping f_mapping, I think will break mmap for us.

> Yeah, I hit this while getting
> tools/testing/selftests/mm/memory-failure.c to work on all Linux
> filesystems.

Did you test this without the actual Coda userspace? What was the
cache consistency model your userspace was using?

Jan
