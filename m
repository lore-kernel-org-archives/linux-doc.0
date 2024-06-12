Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4354B16F286
	for <linux-doc@vger.kernel.org>; Wed, 12 Jun 2024 12:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718193969; cv=none; b=LPr/D/1M3VxjSEkHXCt37+h4Izu+119foQlXkkQXK548b3H3n+ttQrEaOVrcTtbUE3e88qQL2Nv0FMG9u3MfqFD3kD2eHCpdmZXnJ6/23YgdxCSghjLzZ60cmR9bHUJekVU1BrQLLwN7lo8EaDLi6Hc/JC+BJMlwI93SUbmHMJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718193969; c=relaxed/simple;
	bh=654VBwTTZj6O5cwvd+Nmv/nVSh8Rktw+YZv2YfH5NqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f4llldoQbKj8A/Dlst1rQf3tdiegOJmKV8eLTjrx5xE/f+S5L3uczlslHwKBYUct5Pct8tF18yfugwW051rf62KUF4ZTQKRP3fYcVCZfBZ9ptwxKkrCGZO1oVOC3o2wSfDMkbQV52zXZqu7QQ+YPfJR8cmA3nqKUOCNzoDOAYIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=b+K+9yut; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="b+K+9yut"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-440655e64bdso20148141cf.0
        for <linux-doc@vger.kernel.org>; Wed, 12 Jun 2024 05:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718193967; x=1718798767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=654VBwTTZj6O5cwvd+Nmv/nVSh8Rktw+YZv2YfH5NqU=;
        b=b+K+9yutIZvL7EhYnDc9PCqyJQyg2rNZnBSM82DUh/mVjbpDQy0AjlTT1QxvPywdj1
         5x3Bd9/ca2iYboUwAHk3ommKdZwLtidiIZFwneX47/uHtGfpvI9RYqChNL0+zSjfMHo1
         eLjMobFz+Qu1oy3MVyvb4rEeOUKTLSjore47JD2UdH3oqgTIkXqhVcGm+UYAEnMiQ+T5
         RK5UP92BF1rCkwKJet0x6kGN6ceBNfxoJL/qrz8UJcsTrQpKGIJJ91JIlvqFFjM3nnYj
         7adAlrkKUSp2YwiQ+JcrIa0p91XG2fUzPI4njv/lY/djRSEZJX+zpmehJwwsBOi4fkfY
         pCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718193967; x=1718798767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=654VBwTTZj6O5cwvd+Nmv/nVSh8Rktw+YZv2YfH5NqU=;
        b=l0Pm+oaGzP+u7r7lVbvSzDyePu3QQ9QYQdKJ5xfmFELZRoXCAGjghYcJ/pLXtSdDxy
         0qwb+ZwziOTWWC2sonu4CU8003JqeCPWMSU/1AnnaJ4NdsI8rh19QsbsoDtVluugRGfx
         g3JFP6fsvn1sTshGhjHVm6ZMCZev0CZGsetOrPKY+H3X6Xs1SiErKGjiOFxWyHHxQ1as
         B/GFyI1k2ivKGdm89sdKWpdITxhSxFbR5KPAr3h9ZXRyjS6+C0AEAw9BxzjLib1tiLCI
         0mxeMy1ibLiRclcL5ngBkBijOribULFtp+8kYfoYZDCrOheHY8HZgxCc5rgfOGQ5DGyy
         HViQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmHp06Wz8YBYtOgy/7ght47N2RSJjwsvt+5d1tjmRAtW29rI9rp4HOW5MvoncPEpL9UXUBQe+hXuZPM01fWMc21s5D8lMGtXtD
X-Gm-Message-State: AOJu0YwsehDpW/AJHfpXmno8tqW9F35RN4fA7NF+UOss2bh2pqd/bmS2
	bNt4kerCW/Goy7Q5vNtuVDrmocSjGnVwbpX5P09cDYDnajpaT+BzAWpJdU78s/0=
X-Google-Smtp-Source: AGHT+IElu+dk9DZ7aij8c0y6F8TXy6i5LV0OSLpqQpTgGbv9PZ9NHP5JfFSWjv6MHZMgeDua9fHUGQ==
X-Received: by 2002:a05:622a:30f:b0:440:5de2:2a03 with SMTP id d75a77b69052e-4415abae5a3mr13859041cf.1.1718193967008;
        Wed, 12 Jun 2024 05:06:07 -0700 (PDT)
Received: from ziepe.ca ([128.77.69.89])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44152b1585bsm12849751cf.27.2024.06.12.05.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 05:06:06 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sHMjq-008UjB-Tl;
	Wed, 12 Jun 2024 09:06:02 -0300
Date: Wed, 12 Jun 2024 09:06:02 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mina Almasry <almasrymina@google.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	David Ahern <dsahern@kernel.org>, David Wei <dw@davidwei.uk>,
	Christoph Hellwig <hch@infradead.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Yunsheng Lin <linyunsheng@huawei.com>,
	Shailend Chand <shailend@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Jeroen de Borst <jeroendb@google.com>,
	Praveen Kaligineedi <pkaligineedi@google.com>
Subject: Re: [PATCH net-next v10 02/14] net: page_pool: create hooks for
 custom page providers
Message-ID: <20240612120602.GQ791043@ziepe.ca>
References: <eb237e6e-3626-4435-8af5-11ed3931b0ac@gmail.com>
 <be2d140f-db0f-4d15-967c-972ea6586b5c@kernel.org>
 <20240607145247.GG791043@ziepe.ca>
 <45803740-442c-4298-b47e-2d87ae5a6012@davidwei.uk>
 <54975459-7a5a-46ff-a9ae-dc16ceffbab4@gmail.com>
 <20240610121625.GI791043@ziepe.ca>
 <59443d14-1f1d-42bb-8be3-73e6e4a0b683@kernel.org>
 <00c67cf0-2bf3-4eaf-b200-ffe00d91593b@gmail.com>
 <20240610221500.GN791043@ziepe.ca>
 <CAHS8izNRd=f=jHgrYKKfzgcU3JzkZA1NkZnbQM+hfYd8-0NyBQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHS8izNRd=f=jHgrYKKfzgcU3JzkZA1NkZnbQM+hfYd8-0NyBQ@mail.gmail.com>

On Tue, Jun 11, 2024 at 11:09:15AM -0700, Mina Almasry wrote:

> Just curious: in Pavel's effort, io_uring - which is not a device - is
> trying to share memory with the page_pool, which is also not a device.
> And Pavel is being asked to wrap the memory in a dmabuf. Is dmabuf
> going to be the kernel's standard for any memory sharing between any 2
> components in the future, even when they're not devices?

dmabuf is how we are refcounting non-struct page memory, there is
nothing about it that says it has to be MMIO memory, or even that the
memory doesn't have struct pages.

All it says is that the memory is alive according to dmabuf
refcounting rules. And the importer obviously don't get to touch the
underlying folios, if any.

Jason
