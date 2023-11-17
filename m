Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="igJNBVYf"
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CC4F10D9;
	Fri, 17 Nov 2023 12:54:39 -0800 (PST)
Received: from localhost (unknown [98.53.138.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id DA8AB2F3;
	Fri, 17 Nov 2023 20:54:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DA8AB2F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1700254479; bh=UFOFab7bcdXv3kvUShDoiZLRoQEShkU0i5I1WrKuIrk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=igJNBVYfBsRcfEIzW7qwu97V8IDQYS/lm7jcCq3GaREVu7DuhsEbm2KaYHsQkk8TO
	 rvL2A0XFe0ptLrcOaew7lHsDr+CLBeQbt58SpjH5kK1J3s1aRZMNHdpWS8osZtbWjY
	 zsz/BuJ5GXBm/Urz3deoQ1WtPGekw7FjlogfvXoq5YXs24lRKT6QaKf3E65ZyuvOHI
	 HqBw+RyJis8xlxubrgefhO7qEPPlqPqdZUE4j66DIXq2TmfTTxgCG4TtuPYg/WYUbV
	 0jHpNeQFykFJohsr1VjdTEaHK73YdPdsp1JMzU5MFTjcs5UB4CuHcthIvkcMlGLYPP
	 WeJTXvsbyJv4A==
From: Jonathan Corbet <corbet@lwn.net>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: linux-doc@vger.kernel.org, Federico Vaga <federico.vaga@vaga.pv.it>,
 Akira Yokosawa <akiyks@gmail.com>, Carlos Bilbao <carlos.bilbao@amd.com>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>, Hu Haowen
 <src.res.211@gmail.com>, linux-kernel@vger.kernel.org, Vegard Nossum
 <vegard.nossum@oracle.com>
Subject: Re: [PATCH] docs: translations: add translations links when they exist
In-Reply-To: <20231028162931.261843-1-vegard.nossum@oracle.com>
References: <20231028162931.261843-1-vegard.nossum@oracle.com>
Date: Fri, 17 Nov 2023 13:54:29 -0700
Message-ID: <87cyw885iy.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Vegard Nossum <vegard.nossum@oracle.com> writes:

> Add a new Sphinx extension that knows about the translations of kernel
> documentation and can insert links to the translations at the top of
> the document.
>
> It basically works like this:
>
> 1. Register a new node type, LanguagesNode.
>
> 2. Register a new transform, TranslationsTransform, that inserts a new
>    LanguageNode at the top of every document. The LanguageNode contains
>    "pending references" to translations of the document. The key here
>    is that these are pending (i.e. unresolved) references that may or
>    may not actually exist.
>
> 3. Register a 'doctree-resolved' event that iterates over all the
>    LanguageNode nodes. Any unresolved references are filtered out; the
>    list of resolved references is passed to the 'translations.html'
>    template and rendered as an HTML node (if HTML output is selected).
>
> Testing: make htmldocs with v7.3.0.
>
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  Documentation/conf.py                         |  2 +-
>  Documentation/sphinx-static/custom.css        |  8 ++
>  .../sphinx/templates/translations.html        | 12 +++
>  Documentation/sphinx/translations.py          | 96 +++++++++++++++++++
>  4 files changed, 117 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/sphinx/templates/translations.html
>  create mode 100644 Documentation/sphinx/translations.py

OK, this does seem to work.

The naming of the translations definitely needs to change; if we put out
something with "Taiwanese" in it, experience tells me, there will be
objections - and that's not what the translation was called when it was
added.

I'm unsure about putting the languages in the top bar like that; it will
already become pretty wide with the relabeled translations, and may not
look great on a small-screen device.  Perhaps a pulldown would be
better?

The build problem reported by Akira definitely needs to be fixed as
well.

Thanks,

jon
