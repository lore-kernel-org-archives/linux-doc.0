Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436365;
	b=QWluEkAoZYxMfrPHQG9DmJeCcXDPhDcPLF8a2dBlsHW3zUccXJWLi5k+koewbDFdHq/T
	 SuGW75Bks+VEEarAptV9KZJU+jHOfLX+SIRJhfJXxy/UroYzdiKiS+ADR4q55woSwZIdW
	 aqMCI/76Tlr5AkqNH4otippxenUrSisRS9qjNITwQYTvMN68VWlyqzFqAKOTkkIgtDXyf
	 73PG+8Ue49XjUAAetFyXch2FYQzKZy9qFbPEON7SJu6KBCOzHr9lNZJ+S0/B8XDYrLKo3
	 IT0ofDhqR89xOzyDub6yyEgBAJqMxCmiQB+nHrcVk35ne/OFM/k0+Gw8x9hjIt0suMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436365;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=arcQViGfeSECR0OhAG3djuwxROdLL3U7KRwsLLKnrew=;
	b=gVCIkwKUoH7rCVWnkg7rcUk+AljG6VdFNEmVNpPUrJI8LJHv3eFClKfWzKlu9f1yZ6+w
	 C5MFNub4IpAIROkpm/H2E2bcflkBPI6Fb+OADjGkZr3Um3rMQf76gqWnnWvSynpk+6ezD
	 A8Fqtp3XUP9BYT5AZn9EWjXagH6bhZyoHr5Zxm/r+tM+m9tz99/Htvv5w+0KPG2FhR1ii
	 lKMIDMMiGNE21PTXkHCaZgLCgTPZRcSZ4NjmJDB7jXpC0fnuAwvzP8uAP1Uj4XaD3B81s
	 0QMFCf/frwb2zKnnMyDMybwwQawcSaB/+5L42mIELwL+0sBH7slm2QBfuNrGSpQsPlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vaga.pv.it;
	spf=pass smtp.mailfrom=vaga.pv.it;
	dkim=pass header.d=vaga.pv.it header.i=@vaga.pv.it header.a=rsa-sha256 header.s=protonmail2 header.b=BIRRy2GH;
	arc=none smtp.remote-ip=79.135.106.116
Received: from mail-106116.protonmail.ch (mail-106116.protonmail.ch [79.135.106.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29EA606A31E
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 12:19:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A29EA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vaga.pv.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaga.pv.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vaga.pv.it header.i=@vaga.pv.it header.a=rsa-sha256 header.s=protonmail2 header.b=BIRRy2GH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaga.pv.it;
	s=protonmail2; t=1795436361; x=1795695561;
	bh=arcQViGfeSECR0OhAG3djuwxROdLL3U7KRwsLLKnrew=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=BIRRy2GHCbKZiR0S8v7+hR7G3WJ1VUDLw+/gYzRyE8a3rw6vcwaQrY2QteMxkjDSB
	 rfNwDrnDrGTiAY1TO8H77XYRo3p3+x9p9+JYz2jBgGFCG7XJXFHv943BT9oCvsYBGO
	 AdkVG5UJCcyP8XSDILQ9f/nQPYnyB7QeyZ6VKdeH5vnEac5v78Covvx8Fa35ZZgEvZ
	 5uryazw3EQrvHs5FU8jqtlGS8eZCLFHCquice6y3TyJ8HyeqGwzrQ+A3vFd/T7/pvP
	 371eRN09MEmULtWJyOe1QWfK03Sh+4TQEtTf2iJ0zOYtse1vPYyGm7ItWJVMeDFzQJ
	 vRphQxUi8IVIQ==
Date: Mon, 23 Nov 2026 12:19:10 +0000
To: Daniel Pereira <danielmaraboo@gmail.com>
From: Federico Vaga <federico.vaga@vaga.pv.it>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>, Akira Yokosawa <akiyks@gmail.com>, Carlos Bilbao <carlos.bilbao@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] docs: doc-guide: add a guide for translators
Message-ID: <w72e6t3uaxnhhmqyynfisaw6tvpc3ikg7t5hm2hcakguy2jexw@4oyhz7f3lzgn>
In-Reply-To: <20261119041009.63651-2-danielmaraboo@gmail.com>
References: <20261119041009.63651-1-danielmaraboo@gmail.com> <20261119041009.63651-2-danielmaraboo@gmail.com>
Feedback-ID: 124726690:user:proton
X-Pm-Message-ID: d98de995ad347ea4d31fcf0b786e3cf2b54d181d
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

it looks good to me. Thank you

Acked-by: Federico Vaga <federico.vaga@vaga.pv.it>

On Thu, Nov 19, 2026 at 01:10:08AM -0300, Daniel Pereira wrote:
>The documentation has seven translations, but nothing in the English
>documentation explains how to contribute to them. The only guide that
>exists, Documentation/translations/zh_CN/how-to.rst, is written in
>Chinese and covers the zh_CN translation only.
>
>As a result, the same problems come up over and over in the review of
>translation patches: labels and citations copied from the original,
>which are global in Sphinx and collide with the English ones; partial
>builds with SPHINXDIRS that hide those collisions; lines over 80
>columns; translations not added to any toctree; missing commit
>descriptions, tags separated by blank lines, HTML email rejected by the
>lists, and the documentation maintainer left out of the recipients.
>
>Add Documentation/doc-guide/translations.rst, a guide that covers the
>whole workflow of a translation: choosing what to translate, the layout
>of a translated document (path, header, labels, citations,
>cross-references, what must not be translated), translation quality and
>terminology, adding the document to the build, checking it, preparing
>and sending the patch, the review process, keeping translations up to
>date and starting a new translation. The commit message format it
>suggests is the one already recognized by tools/docs/checktransupdate.py.
>
>Link the guide from the doc-guide index and from the translations
>index.
>
>Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
>Acked-by: Carlos Bilbao <carlos.bilbao@kernel.org>



--=20
Federico Vaga

