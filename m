Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD8B355805;
	Tue, 18 Nov 2025 16:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763483228; cv=none; b=hJoeqLG2pWnkYM1ImDRpy9R2qwDN2mBB1IxSogh2iyh2roICqKM7ny7+atTUwsSd0kyTlLnov51Nv8P3vfRpJpbiUE2xhqCATIxiQzRM/S4CIUY25gf0/qeVMzzbDscWqozUx/BIfDnRerYzxxIjrS6jlKp44DY+07Wy4VE0vRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763483228; c=relaxed/simple;
	bh=Xmh16YkN4ElVBIxBrv143EM8sBxg3YBWow4gNKWdhbk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kscnyZbXA+z7faxjk8jQCYb3T6ea/9hv87qHJza8Q6+3b+fparaiuhVopky6MtbzZ9ZDqnKpa6H32E8Xj8h4mUFGa5paGczwrJwwvqYYV6J0gii9HlbQGU4r4L0YcnolXHfXigCL/ZicHoUoGu9KQ8m4/0KqwIokN9dzYgUzeAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=kTqJPV/w; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="kTqJPV/w"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 46CC740C42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1763483226; bh=nNBWADmGFOp7IDw3DHL/lOqD6Nsrv1wQ3vgBa0D9Z00=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kTqJPV/woZF2sKtxZjcGaHt3qQ/Xmi1X3P3iTlrqcC07rC4xsqPvoQ8Acb7P7Ev56
	 Hdj+nhkUattgfi2HiwkgI1vSxbjfWOfr38kaHPSRWYcn9563kmCi98E0pIqj3G4Hxm
	 ujUWaXN57UStkfByBIy4Jpjge03c2I//YXNYt+0FAMi8DvGCC+azNpH6KHmkwMp8Nj
	 b4CF3XmQIaB74OdK+y9xv46JQ7qMYrvqHeOPrBd4ksgCMLm3dN/rIRnYx2Iix8F/zy
	 wYm8ZjUWmR6D7iIVRj1WtQptl6fQdKYUNrUIluXR1dPCz9WvXUoIQK2/ohLEN+b6rA
	 iqTEqtjXwN2jQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 46CC740C42;
	Tue, 18 Nov 2025 16:27:06 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Akira Yokosawa <akiyks@gmail.com>, Jani
 Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 0/2] Move Python modules to tools/lib/python
In-Reply-To: <20251110220430.726665-1-corbet@lwn.net>
References: <20251110220430.726665-1-corbet@lwn.net>
Date: Tue, 18 Nov 2025 09:27:05 -0700
Message-ID: <875xb75msm.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jonathan Corbet <corbet@lwn.net> writes:

> scripts/lib was always a bit of an awkward place for Python libraries; give
> them a proper home under tools/lib/python.  Put the modules from
> tools/docs/lib there for good measure.
>
> The second patch ties them into a single package namespace.  It would be
> more aesthetically pleasing to add a kernel layer, so we could say:
>
>   from kernel.kdoc import kdoc_parser
>
> ...and have the kernel-specific stuff clearly marked, but that means adding
> an empty directory in the hierarchy, which isn't as pleasing.
>
> There are some other "Python library" directories hidden in the kernel
> tree; we may eventually want to encourage them to move as well.
>
> Jonathan Corbet (2):
>   docs: Move the python libraries to tools/lib/python
>   docs: bring some order to our Python module hierarchy

In the absence of complaints, I have applied these.

Thanks,

jon
