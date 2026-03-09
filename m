Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E1A3ED5A7;
	Mon,  9 Mar 2026 16:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773073739; cv=none; b=C9atK6q2Z/kJPV0eAMOgKy9z+bhv4Cf4adiCWkdhxh+Rwh52Xm3ylQZe3DTryBPhO53lFo1tTLSkjK0Abo7dbBTMI2P6AeXuRpSLgNVHTKeBuUPxjQju+rgZkM9m1Bs664MDmjfsgBafOhtcRQUa4lC3xaBOMs1gqePEjCFoYUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773073739; c=relaxed/simple;
	bh=Pn5X4Ny4OKqk2R0pS7tVfiWl7D3huVd/WFbOd1d2IW8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BkHQtLmaL/6SShM8dAi4PU41IWocFr6JFXqOFjzapArrfViTN5bcU2xWrf3xQsrZ/ep9QamAV6yi5U8ryOHQ0qL54weo4VnvQ54xRt2q5LHdiwjFpVE5ST5Mrcs/xdEfSYxDJ3Qu0ieSb3EF5ZeM4oAmQ2PaaFf+Eh+F05Gw4ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=SSV7GFBb; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="SSV7GFBb"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EC28340C9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773073736; bh=v0qDOsG3JjNHJH3g3fpgFiBY5vnzgOJjejQZIoTkzG0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SSV7GFBblh0IJ+9ttdSyLDR+eYuwsG2Ouk2FF7N+BRNY7gEN5MSGH8r0AH83F1eRU
	 Gabdk0qcoMKdQOKeXTeNqmDD/7BSc7fqu7fp9reqnX1n7NvAUyngUBYeqw5+0eHg4o
	 OOCjVSadIAtLAVZq67xepHMPbaJkPkluCjpTxkSkgMYQH1kmwJMie6X/tNALYnD3FA
	 yIoMWgzuEmHiyVWyr4Rr3R1t5r8fizmkoMIzCrMG+iee8IsLipVhmhJBUCGQ5h8QeJ
	 mRMhgG51hwoMICOCWy2nnNjou/qDe3R5+eG3gSEnnrH5WEx7FIsQCzNjMZKQx50QuT
	 1ldk9uwLQ5HZg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EC28340C9C;
	Mon,  9 Mar 2026 16:28:55 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 0/2] Better handle xform class
In-Reply-To: <cover.1772810574.git.mchehab+huawei@kernel.org>
References: <cover.1772810574.git.mchehab+huawei@kernel.org>
Date: Mon, 09 Mar 2026 10:28:55 -0600
Message-ID: <875x75vuew.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Jon,
>
> Those two patches are meant to help re-using kernel-doc outside
> Linux Kernel. Currently, QEMU uses it, but it requires a different
> transforms table. The first patch adds support to overriding it
> there; The second one documents its ABI.
>
> -
>
> I'm picking those two patches from the past series. Those were
> merged together with man fixes, but they're unrelated.
>
> So, let's place them in separate.
>
> Mauro Carvalho Chehab (2):
>   docs: kdoc_files: allows the caller to use a different xforms class
>   docs: kdoc_files: document KernelFiles() ABI
>
>  tools/lib/python/kdoc/kdoc_files.py | 53 +++++++++++++++++++++++++++--
>  1 file changed, 50 insertions(+), 3 deletions(-)

Applied, thanks.

jon
