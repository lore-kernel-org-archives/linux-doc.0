Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792522381;
	b=X1oNVH+1kHlHG2tp8OwyriPA/UV1MJuUqffoWFfLUTJqvXmJHcN60iYQt0BFV17WdX1O
	 qwLpU36kenSIVEyozMfdoNFiNusJQRCziB6wQnspEkYtwIA/XaZlNq+4nqN8nbqdh9qbj
	 ZbSuyz3w0acNGJfyCNJGaoYALf2cw5+nSFi8xsnt7ukP9rt7ldLcpfPvpibcjKKWXCdZA
	 1F63bBR5GqdyjcPOCisC/vZcUP7SzhrfViryF6+nKJai3ZsJplZBGbMrYuiRcqtaNGtMl
	 wuzkON62MWfrI4sPhksM2+iPqTCSQ+tilsxL23QBeYecccIuJHsfZkT5Gco49sjNMww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792522381;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=UqcJbHQA0qSmJT2YyqO1y6Et2C0y7UxlUcTAd1a/UjM=;
	b=PwSYk8IbAEuHhUdG7hL6igDi2jKhc9FYtCKMSX+j+4SHg/ghU/qioidsCIX8gPH0ffle
	 8gFphGYli6vpLmKnZ65fAdjgaCCa4vMgN+GBflrX4hR3Ci2r/fH3dZ3gxFWs92nEalzvT
	 F9i0gJ3zAN/i3AZcLkIvRRcZrqtXnG/F6vzkVezM52XrCgg0qwjPrCIjUVIa6PJlKeViY
	 R4L/T4YI2VOrMAfsV1DhKQaAo8ROkGmfg/e53rgsjFvpz9ConBX+xj8sregcYKr90wFd+
	 IxigtWL7fj9DZkhoRGpiZIWiNV3woklFaZgCX6j2SspfvlrzSQeGSkvG2tbos85oh8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=TlMpbqgi;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A746A606A31A
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 18:53:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A746A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=TlMpbqgi
Received: from macsyma.thunk.org (pool-173-48-113-115.bstnma.fios.verizon.net [173.48.113.115])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 69KIqFFS026857
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Oct 2026 14:52:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1792522341; bh=UqcJbHQA0qSmJT2YyqO1y6Et2C0y7UxlUcTAd1a/UjM=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=TlMpbqgimb37WMdCuTZkv0eJZqZ93rom0jwcxk3r1Oz5y1H2YpIc8NNOsTvAX69P7
	 MNZ3CwlN6g/BnWwZ9M2omLRR2OKnU/SmQC3YM1iK6e8i+CfIwLD0hsM09b/PTdT0Ac
	 1Ty/ZmybQwpkYSJItQ3tQcbxUmimUE6IL3XaYFfjruzoUwLetPQf7DL649RABNx7Al
	 GghlzMZSxZ2qPffjMZY2iHQf2yTpCBvfZVh6+x9FMYkbTbj+A/QHoej97jPbiyVWA1
	 PPgmSmrGTN5pspp9Dso4RytZKK0VUiSB0r4JldysDzFxlyMExxnYGB99limJO1sXy6
	 VkafRAbrYdLWQ==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 3BF7221C47DC; Tue, 20 Oct 2026 14:51:15 -0400 (EDT)
Date: Tue, 20 Oct 2026 14:51:15 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Joe Perches <joe@perches.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        users@kernel.org, Federico Vaga <federico.vaga@vaga.pv.it>,
        Akira Yokosawa <akiyks@gmail.com>,
        Carlos Bilbao <carlos.bilbao@kernel.org>,
        Avadhut Naik <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
        Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        Petr Pavlu <petr.pavlu@suse.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: stop sending every patch to LKML
Message-ID: <ate3lqnWlk9zLZC5@mit.edu>
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
 <0605a3c99b55124d1be71c9939f636e2@perches.com>
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
In-Reply-To: <0605a3c99b55124d1be71c9939f636e2@perches.com>

On Tue, Oct 20, 2026 at 08:53:04AM -0500, Joe Perches wrote:
> > This issue came up during the 2026 Maintainer Summit and the consensus
> > was that "always include linux-kernel for every patch" was never the
> > intent.
> 
> That's not actually true.
> 
> Lkml was the default mailing list and other lists were specific to their
> interests.

Historical practice for decades before the change was made that plenty
of patches only went to the subsystem list (e.g., linux-ext4,
linux-scsi) and it was *never* intentional that LKML was supposed to
be cc'ed for all patches.  That didn't match historical behavior, and
as far as I know no one was asking for that change.  If someone
managed to slip that into submitting-patches, that was either a
mistake by the submitters or the people reviewing the change.

						- Ted
