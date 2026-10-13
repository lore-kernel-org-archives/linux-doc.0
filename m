Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4034C3F104F
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 17:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913401; cv=pass; b=nlsqzuFM13yzGZ9sCpK8pHN557RUIhw42bqpSfk9ZoEOCD8kGOs6HCIK9SfTlwvbVJlKYfXYAeLtZ4zUUaosO/gL5ZDTaEGl0m/YsppqmXKdQp4sYyFfG42bWtbWxHoKysUwf6H65Wk7o6L0/v5AbohMNJL7/FehCm1cLpkaZ4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913401; c=relaxed/simple;
	bh=GvWYLhggHi8e0o1m6oRDTN2nGgQSaFxfFzf3GYrbST0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KHd/rvSfmwBF2epSKDlS1hOkz6+QAp3Tc+wrsFa1wt4VP2ruhTIfGTgBfTokS20kMXSD0rbz3cmyYlLxYu185oVeLM969RhqCAqu56IKJHnbwrvfM8/QkPRN2dc69EXbuDiCv+7VVxH06Cksk8lEVqlbjbu7LOUao99gIkD4SmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pt2qO701; arc=pass smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pt2qO701"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-917a707f37eso43134066d6.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 10:43:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791913399; cv=none;
        d=google.com; s=arc-20260327;
        b=fkbGQhktsh005Mkx+BYbj9MhCcpU7p0LxYSz0N03hHP7DynXHWBi5nf546gtKEgVuR
         CYsYlOoZS19iemPF7zWAi5Z8+yAoaVoMYJQ0TTZL/ixVgswUUmXeQizE/4z2aHoGmdbv
         HDFPAcbLdIypGHRWMJRqeS+AwhmFRBz1mW6nHkzLKzi1YGZQbHRyzc1tA9bM+Vig8Vdx
         qSWezfGPOhLE3zaMoRRRExaUSf1iXoqUoEt5ksGsX9sB2gy8VhsV+P6ioYd4ieY5jw4y
         DdNzBWarxTnc6FhrvCtSPJck4oWhLVlmYqhAiyBDnW2WhrvtYDP7Nwc5NlSlu29DTsM6
         hvuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GvWYLhggHi8e0o1m6oRDTN2nGgQSaFxfFzf3GYrbST0=;
        fh=oYyqLm4zEJ8dTWfHdWD039crlCbvLewKEVdOamwV48U=;
        b=dBBwmWsdlBSpenlIdxr676oSomqU1wmHZkUHwa6AUS/s7daBo/81yy92yOKBBeyQ0L
         qVki/c3itkmrAeDrUec4SrOLILzjdygYG+K/YvDqKHx5Evj5KzM7uzHVlMF7ycoBqhdl
         CsP/Tw4ewl9h2R0DZh8Xfp0zY/az7+/3u9IYhhQA7glBGnMC7BsyT44uvM80hwLvynGH
         tmS/bGXleUcQ0ZDmRBG2QZvYaW+X3bQwRwEoQOoglVOnOi/BX9T+mFtqgA1e5Ss9S5DY
         gvTWaQ6Vng1h3QFAz0btK96hjwFrDqxYTtxwAu1XV6zSZSlBFuawMMKNDU/MWepVyakP
         VGMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791913399; x=1792518199; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GvWYLhggHi8e0o1m6oRDTN2nGgQSaFxfFzf3GYrbST0=;
        b=pt2qO701mKTqdATmqkckOEX1DQSSVRROGlxomXS0xQzXlfnrhNJRA6vDqZ8YxToXpY
         fRtk/E/WKyUSdDKzAZ6gWijHD5NgD+jJ8YfIoUL7VBTEmpq/cB6bUyC4cpZLHemUbG+8
         yth+Pd3tcy1IAgQi0ExrzWGNwVito9cHElFMzkDHVvAaYJKEjt10V9js56EwZzw89nhZ
         ebpSoOUzbDG5DTchNq/FYHQKcHtAypTWIfmu1QA2NUVsWnIEfYGlD3TGdhTuwPN9QQ4u
         lFAuEgNTH7JMtdjJQKXgI0VlqmGHERQv58vLlMb8bzYGnjYeinhqOBLwwt6CAMd7OB2P
         m0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791913399; x=1792518199;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GvWYLhggHi8e0o1m6oRDTN2nGgQSaFxfFzf3GYrbST0=;
        b=iwq0twHRrpcVG27Sha3ykcqhKTf5gIwY+bgktSDrYockFu7hAZ5wK8VHe0C0lRihF2
         UbhMVnH3zLvb2XcETudo48RVqEUzYYT4jiHyP5gKTUbLsngPpRGkIkFNhVID/iNi4ozA
         7wlBrg894Hq9IGEidF9iW1gkcEQcZ1Qh3BCMZGMa71VJfPSzuIOWQtkMj6BFjbucCn43
         GBxoD3AW0CtneDF3lAImnyPKqK6UJ1QbpFnZR1H/Cdqovfy27v5JgnmhjzsJEe+LV2hT
         f/b5I7A8ldSd8gemzg40nNkBsiTMIxldETUja0TfP9XNuiKPIMd9e8mAX55m1Ml4/Ea8
         rL4w==
X-Forwarded-Encrypted: i=1; AKwUvBwIX4xbBPfCZBnP/iFxiHeG7Vbtd8xVGQXDWpDh8dt3+sxajJwKeN+/CThKa+6dgzbZfR3UsoYcNGU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAa4ZsKozSkgcf3xr834BmaxsDE8NS9NGXs6/kwMC4tVIrhiJ0
	n05TOSMPIVBt4H0u+mfbkVF8kJJs3HaaW8q12YrvcFg7f5hKyrfgaNMmgOtnyL8ju7E6MpruI4s
	i48lMBK56XcT6doWV6lM7hcECB6FDCQM=
X-Gm-Gg: AYBFou0BW9/jjs4QDbviGHn8uH7eMb6O+Ww4We/IsackT4aiNf3MyM5tzKQ0KdONCnl
	EFXqphM+yusP3XZ3FUEgCMfy9FrieBLxVeJ2WjdBLkSJdqcazYXabK6KxRQhRZ0wzZAVOPG7Dyn
	LSxvHOHhrdBPAKPr6O8ejRvBXZToUqCj7ViX3nZVCbgZjBN/R7gvT3Is7igmgypDOkx9COmJtSQ
	2Li4aukTwqdjekNlCdXpf/OcWL0HOQuby0al0Yv/4I1T1h8cvVUUGb0n3qK8VO786L/5e5pNV5S
	q6qELWu6/PMSeKoYsbOe+eRf169UD8cY4G7JpQv9oi4dlkaPxkMN1wfT6U8NxiJYJ5WBZxWEHjW
	ZSnNsNNzVeaC2u8+3J0c6txH6GzBeNoDFe3ojyaepXH/Hw39SXWoKDCVavYKUC4+7fr9Q
X-Received: by 2002:a05:6214:5d08:b0:917:a256:c151 with SMTP id
 6a1803df08f44-91b557c63f4mr258062506d6.45.1791913398957; Tue, 13 Oct 2026
 10:43:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013121501.3738437-1-sashal@kernel.org> <0bd14255-173c-4052-993c-328a399f6c3d@sirena.org.uk>
In-Reply-To: <0bd14255-173c-4052-993c-328a399f6c3d@sirena.org.uk>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 13 Oct 2026 14:43:07 -0300
X-Gm-Features: AclHuK_GimhKIeFhMz-ydK4dBZDHmOtJjiFY_N4CAyxiONG6isgiNYLG7tOfvME
Message-ID: <CAMAsx6e8GhBbnvLUFkFJAm_fiORLZhOcbMnOsHS+RNPJKONx8w@mail.gmail.com>
Subject: Re: [PATCH v2] docs: remove Assisted-by references
To: Mark Brown <broonie@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Federico Vaga <federico.vaga@vaga.pv.it>, Chen-Yu Yeh <chenyou910331@gmail.com>, 
	Weijie Yuan <wy@wyuan.org>, Dongliang Mu <dzm91@hust.edu.cn>, Andy Whitcroft <apw@canonical.com>, 
	Joe Perches <joe@perches.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Lorenzo Stoakes <ljs@kernel.org>, Kees Cook <kees@kernel.org>, 
	Jori Koolstra <jkoolstra@xs4all.nl>, Jeff Layton <jlayton@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Christoph Hellwig <hch@infradead.org>, Jens Axboe <axboe@kernel.dk>, Brian Foster <bfoster@redhat.com>, 
	Carlos Maiolino <cem@kernel.org>, David Disseldorp <ddiss@suse.de>, Jani Nikula <jani.nikula@intel.com>, 
	Justin Stitt <justinstitt@google.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

 On Tue, Oct 13, 2026 at 08:15:01AM -0400, Sasha Levin wrote:

> > Commit 78d979db6cef ("docs: add AI Coding Assistants documentation") asked
> > contributors to add an Assisted-by tag to patches developed with help from an
> > LLM, and commit 816d9992d9ed ("coding-assistants: simplify attribution") later
> > reduced the tag to "Assisted-by: LLM".
>

 Acked-by: Daniel Pereira <danielmaraboo@gmail.com>
