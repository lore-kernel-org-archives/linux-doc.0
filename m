Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615AD3358C3
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 13:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762954071; cv=none; b=ZVjLriccP+mhjMx5qk672kjrR2IWkPvI5jQbWqRsz0j+WhRXh4C9B+QHyis0KTbJ9FI9g2KdV9xD5h03dxFHzgHz2VsFpvjT5zGd01L26Qf1ydMO+pF4HIcNqMSSv0zF8JRGfdiRCummEhepJhjnFcLtd6rPXwIBH6dhS6iMJD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762954071; c=relaxed/simple;
	bh=ATqF0avl7DWNbsTtBIgnxmOxsprxvw+Rkf3NoQswfrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QVY3S3WdWFZKJ//MpM+/1vkRKx/J/mb/iAARqOVzofHzVAaVyFKBwFxQ/CjheHNOgHC+AhDkulFn2jCiaMPVsl7/M/TseIp2rEQYn9jqz5kG/IRKqk9xTQuck58kmMOOMBKw0DLzA4BNLNXGyVp0DwnRrb9F0TlIDXDyPUvM+ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VuIHMnwM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VuIHMnwM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB435C4CEF8;
	Wed, 12 Nov 2025 13:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762954070;
	bh=ATqF0avl7DWNbsTtBIgnxmOxsprxvw+Rkf3NoQswfrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VuIHMnwMzE3/eId4hWKzX0Bj1RGnAU3T/AZb3tofR9+ylx0/uE79Nc0g06FJdkmEp
	 lGBcQgzr2to58BqQoaBfq+8u4VNjPoAZzwm5JNmLxmIR+aZn6N3MTygGyqOvdu92nt
	 Hp+Ks3xWcIpkdkAB1DyZGO+aLVQYD5Xb8iRJosV8RiaJ3QIUBjQxtrNicvYBZsqA1h
	 RCcRHre3oYtJHgvQDTz51CRLQs/CyE6u/eFte2uOPh67eYFD5dxfvPhad5FwBWTNvA
	 G+KGfkJlS8yDE7zT7RhLBHrsWZLUtj4pi9mMEEsIpZZ1UF3LHb9aLhMKNqB4nqnDcS
	 EHiqejOdvE7zA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vJAt1-00000009SQO-438t;
	Wed, 12 Nov 2025 14:27:47 +0100
Date: Wed, 12 Nov 2025 14:27:47 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 1/4] Documentation: remove subproject index links deep in
 the structure
Message-ID: <34yz4lxzl3w5dftmsjoqfp5xmcyamiby7b3yf2lm2zjxyvq6jp@tkyygrkdmcwz>
References: <cover.1762948491.git.jani.nikula@intel.com>
 <c7f9fa7545d1048d7f173d819aa1c4f3c8f050c1.1762948491.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7f9fa7545d1048d7f173d819aa1c4f3c8f050c1.1762948491.git.jani.nikula@intel.com>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On Wed, Nov 12, 2025 at 01:56:51PM +0200, Jani Nikula wrote:
> The idea of having
> 
> .. only:: subproject and html
> 
>    Indices
>    =======
> 
>    * :ref:`genindex`
> 
> in index.rst pages is to add the index link to the main page of the
> subproject when doing SPHINXDIRS builds. There's no such need deeper in
> the documentation structure, and we can safely get rid of them. In all
> likelihood, it's just cargo culted and copy-pasted.
> 
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Patch series look OK on my eyes and works as expected, but there is
an issue on patch 4 (I'll comment about it there).

Also, they didn't apply on the top of docs/docs-next (or docs-mw),
so I suspect you need to rebase it.

Regards,
Mauro
