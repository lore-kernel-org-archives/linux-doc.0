Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793831432;
	b=h0jYmZFZq0y1MMTYK9SImgH2f9RLA3ltA5S7wLEpqP2vNpBVXPP6lAPBHui2SNH/OKEP
	 JBfaRZuqPz1ajKb3vuM9jJzwGrhdNnlHDKSTzVUXQrM9aj0/sikPLzcHdPO5WIQFFbH6D
	 mbA54zRWAs46Z8zb2r5JcSifgEkmjDjbBPUjEo8CXfPKFbzm0Ij/7ZjQTqzxC7wY15tcF
	 8xka8s3zhKOYF3EjZvlC07L+zlvhYWQ04YpwimpFhYIVyEqhcv6WFWVlRyjN9QZ5XHQeb
	 x8uX3WBl0Sk6G7JheDG5purQf6cayHqa2rtEtaWtTazNKAzFwc5PlA+/20KJrbge8ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793831432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=45IHMvHuNfQHmQp3e/l7ZQyBPSv/bWU1s+/SnIhe5+k=;
	b=HQAHZu0Eias6QPKySjReJCckSmXpfE1CeIYOqhMGB+t6MyLK4ub8G4Yooab4JIFxETHd
	 WK2FF4NhnGrgQPYlN0yW+AqDyRobUIrqLjvuM4yJMZ1WUsC5+/J7AlhD8qnV1Y+xlF6Gr
	 6rNdejiNAIbw7BdIHlEU8KFMCIVc8hHXGCdcJXdVBX12zmb9U+HxJc+PjjhwGAI9mcFwK
	 8A6uXLbcws4w/hYBdacfMQPsdUNj5PGulrvaXhnJpFg3zpfQiV2/lWWG1aGdElsh9HXgk
	 +FWMNK/o5IJcbnntwzSwfAVHq2N6BQqvvWgOLwUmqTYPNqEKsiYWNCF9THcVQIZL8XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GSTNqouf;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1BB606B2D1
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 22:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D1BB606B2D1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GSTNqouf
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso516774a12.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 14:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793831431; x=1794436231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=45IHMvHuNfQHmQp3e/l7ZQyBPSv/bWU1s+/SnIhe5+k=;
        b=GSTNqoufmOCpxSxB6DIpnTk/eG5C/2yBvhJutiJie6deAzBZ820GjEL0CwYPGLbU12
         EGLHaicSIjyD5q59jnIYNF/yUOO0e7lkkX4gor5VSz4qsPiv1W68/jSR9STrKAh/pYtD
         rnge8JQSnBOwRVZw85l6zX2S2zaRLkfH0DzEs+F8IRPdZP+8NAT2VOD4XZNQuhBu9eUL
         MKWZ5opKy6BtnPv3UuxcBNcMz/E85flXa/LbKJD+lWdihEadWL1HmlWmyuxUseRN+ZP6
         0jBi7LZgNJcl5EC8H4nxpA4XIVD0kGDgTjMHs54S6JHs5tUFCaTzvLOmGRUZ6MrG2+gw
         PSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793831431; x=1794436231;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=45IHMvHuNfQHmQp3e/l7ZQyBPSv/bWU1s+/SnIhe5+k=;
        b=RTbyTIPkkRrkxJJpmG7nOajVc8HSYPWxCgv5DZjzupfKeYHkHE+pHnJ3zuIKO85fHE
         oz9XKZ17oU4q1xZMCxEnm8jD1E/1kuhn0OKENuXCmkEB0zVG+sPCayAiukTsBlWjntyu
         vHHlGx0DX0NgqB/ommc/hv1xq/e6lzpaEdoUVdQulwcnEwBEhmr49JUVZ67Eww1832XO
         YHC6zwr/+Bf8z8v4E4gyIFBRSX7W2sPu3jaBcvPHIN89hVu58YMlY4mPbSqcgZtwO5R/
         2AialRPkW57FrxIYwrsyOPgTA3TlLmRdErgeflD6ffsEAjJIo1wHIYGzbqqL6oz290X6
         KNZQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2G2bNRdKeJfjNv0yu7axJLs02vvA7R48uYORs2PKsiKJLc91sn3WE0vqnKxwVCkh017oCm1C/ec8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ErJ/aTGK2TXkfPOCTn+sUC+fwq0T4EYdvBkdK4Reylsx9X287
	mDc3uT9AV1zsp4aQVbHUBhz41LOo2HaWVGvSA9JY9sR9NLBFSx1h4MYVdM63ijcumw==
X-Gm-Gg: AYBFou3RnxIgI/RkY6w8ecaKOjgkLIQxzSvdMWWuSL9Mec4AxYjldhSkNa78xmk0F9r
	zhC/wuYui+GnPAbtyrs2WzMa+nhY+ijMrfaynrAx5L4mKP5QWNw0D+bmCraFLEXFXQtfElHqLN2
	n0T7rm8401Yn1oW8tMbvHtkuG8XR9VmWS9b8tgYZKL39dppXF9fc9VMqx0+NFIj5dLmUdXoPiE8
	nLM/uBThxIICdnK5uoN2vunMiO2melIKN2hMb4RIT86g0A6WXt2IdDk9Y4Xveh3zuD9hAD3Ffyo
	+Rmptl85qe3qyYpeyB63gAufPyC3oosIldtU8O/RKhu8voy7rmMffCuVRFikvPCXCBdowLX+9Id
	QGITNTNDam9vepgsQ3FAAQTlheH+oAyvto2PECM+KwHl601fkk2SsaYvHBCVKgaCHG23jw9Ahvs
	Y+3kfEfOuqcO8lcDGH80IrMvlpN99AW6eWLXfRCq90IQ2Qg9KhIGaCfFhhqAUBurgLwFWneHZyU
	pGe5hKkSeCMqeU5+Zy+BcRgNJSjwLZhmHPnUBEDcy9rywrqU57MrNuw/M5r1A+3UEnK3ZLdzPwX
	mKkSwTxdnYKDnhIo/ffSlJR/ekUnNQGfG5vpGR7TgvTqR3vEjJtsKpSP3DBu0xIX
X-Received: by 2002:a17:90b:3d8e:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3ae8979a140mr13152373a91.40.1793831430846;
        Wed, 04 Nov 2026 14:30:30 -0800 (PST)
Received: from google.com (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31638fdsm743618a91.8.2026.11.04.14.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:30:29 -0800 (PST)
Date: Wed, 4 Nov 2026 22:30:26 +0000
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
Subject: Re: [PATCH v3 07/10] mm/shmem_luo: Retrieve tmpfs files onto a tmpfs
 mount chosen by userspace
Message-ID: <auuyAseOISaOWwbO@google.com>
References: <20261103010216.3447716-1-dmatlack@google.com>
 <20261103010216.3447716-8-dmatlack@google.com>
 <2vxzecd0k1dg.fsf@kernel.org>
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
In-Reply-To: <2vxzecd0k1dg.fsf@kernel.org>

On 2026-11-04 05:27 PM, Pratyush Yadav wrote:

> > + * If @flags contains unknown flags or O_PATH, if @mode contains unknown mode
> > + * bits, or if @dirfd is not on a tmpfs mount, the retrieve fails with -EINVAL.
> > + * If the file can't be created, the retrieve fails with the same errors as
> > + * open(). A retrieve that fails before the preserved contents are restored can
> > + * be retried.
> 
> How is userspace supposed to tell if preserved contents were restored?

Through the error code, like Pasha said on patch 3. I'll reword this in
v4 in terms of errors instead of kernel internals: errors from checking
the argument and creating the file, e.g. -EINVAL, -EBADF and the errors
that open() returns, can be retried after fixing the argument. Errors
while restoring the contents, e.g. -ENOMEM, or -ENOSPC when the contents
don't fit on the mount, are permanent, and retrieving the token again
returns the same error.

Thanks for the review. I'll address the rest in v4.
