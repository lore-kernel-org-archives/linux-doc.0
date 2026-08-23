Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD6849364F
	for <linux-doc@vger.kernel.org>; Sun, 23 Aug 2026 21:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787519021; cv=none; b=SkcQ9Wvl3+AixVYAVi6XC+vMg+Y1sg5aWFGSZ6yVWkMSDm2VISR7Stz3oqRTwfuqKe0yBysKl7V7EQTCHE/SdMQyKcyDzLXcTOMz2PCZY7vrfMmpV7DXTxpnKvNNEn1BLPKlXwnxN80X7odnSok8IpYKiyV6TQ58GTLVb0LTEdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787519021; c=relaxed/simple;
	bh=l+VburK+odB1fDWkH6iEpBg9w1/FoznuDupdWAo3Jbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jTyyuJO0qtw78yXCue5YAnYmrbOXJfiWNK0+Zh8EKJkZ1uYoTFGbMgBB7soilZzN3V1Xcvg5sKMM3FjlomGxaBiloI3AAw70ZshHuAwr/dc9iqSDhPvpc/ZP/t42GBw2JzIrvMXL4YmGLj8tEQCj8Ww8zzGcYrDPP+QSHBK4AtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9QtHd0p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9QtHd0p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 893031F0155C
	for <linux-doc@vger.kernel.org>; Sun, 23 Aug 2026 21:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787519020;
	bh=l+VburK+odB1fDWkH6iEpBg9w1/FoznuDupdWAo3Jbw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=E9QtHd0p+fltr5arHLX5fTNkVwWPawEqcTKAs1KLMWUCRUwtChKXfZMA0iiAHUVpi
	 gn/qucP21Lkp6VpBerhy6YEL6n2HgRGceySEp4viZqaaqv6Rr7rAuJse2kipHanMd6
	 3wZaZG/sYdOds5tyxxx6lPEdXtFTLVYnpGe+yzKQOZCGJd/en06tmYGfiJgyHacn5d
	 MMV6DUxFyWLa7Pk8pwLldiWx8xz9DVxwMrX4rksVFU5l+6wNeDypBcdE06XOryjin+
	 YrpB87nr80p/g4/WkK3gJrhAqFy2X9AMHPFtFqdtLXTAzmQkLa/IYL1FcsmOjbWDhS
	 evqUJ6Jni6c6A==
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-92e5c9211d2so223735185a.1
        for <linux-doc@vger.kernel.org>; Sun, 23 Aug 2026 14:03:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqQF7PEDdttOTWQ7PQDsnx7yVQmvYfsxLfzWmqJPT6KKgiVk2mN25Q0BzMiEqtxarRRPX8RJaQknJo=@vger.kernel.org
X-Gm-Message-State: AFuF++kmYjgvC2e5nUcMjVmrkkU0IZ1ayUctPatD1v0gYHidM9uDeVGt
	HAhyjH6yI+wB+9UWoIw740XA0IaJrxo1Von0l4BLiUVcgmVbKqux0a2ubgYX+N/znVWqhYhTJkm
	x70shDyHPHymh4MJfwxpX14NxYxXYI3A=
X-Received: by 2002:a05:620a:2b9b:b0:926:e8e6:3c34 with SMTP id
 af79cd13be357-937468e5f9bmr1413488785a.21.1787519019891; Sun, 23 Aug 2026
 14:03:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823-uffd-vm-flags-v1-v1-0-3086981b33cf@kernel.org> <20260823-uffd-vm-flags-v1-v1-2-3086981b33cf@kernel.org>
In-Reply-To: <20260823-uffd-vm-flags-v1-v1-2-3086981b33cf@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Mon, 24 Aug 2026 05:03:28 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wTYD+SQfrhd83MdH9CmFwtMCVK_13Kbx2VP+P2+v2i6Q@mail.gmail.com>
X-Gm-Features: AcwNN1VeEGSCIXP72wWznE6JoVbvI0HglB0VO6c9ZJfUFoVn2XxY-KxYYtB6Q3Y
Message-ID: <CAGsJ_4wTYD+SQfrhd83MdH9CmFwtMCVK_13Kbx2VP+P2+v2i6Q@mail.gmail.com>
Subject: Re: [PATCH 2/6] userfaultfd: constify VMA parameter of
 userfaultfd_*() helpers
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Dev Jain <dev.jain@arm.com>, 
	Hugh Dickins <hughd@google.com>, Jann Horn <jannh@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Jonathan Corbet <corbet@lwn.net>, Lance Yang <lance.yang@linux.dev>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>, 
	Nico Pache <nico.pache@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Shuah Khan <skhan@linuxfoundation.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Suren Baghdasaryan <surenb@google.com>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 23, 2026 at 8:18=E2=80=AFPM Mike Rapoport (Microsoft)
<rppt@kernel.org> wrote:
>
> userfaultfd_{missing,wp,minor,rwp}() and userfaultfd_protected() only
> read the VMA.
>
> Make their vma parameter const.
>
> No functional change.
>
> Assisted-by: copilot:claude-opus-5
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---

LGTM, thanks!

Reviewed-by: Barry Song <baohua@kernel.org>
