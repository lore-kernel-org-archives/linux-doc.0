Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD673A963B;
	Wed, 18 Mar 2026 09:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773827007; cv=none; b=nbWe5GxGo9q9C7D5RmfJSxnhdkC2FtpKtmMw9dizJ7D27g6AHvKIN+AsTEairZSso8jktqZJdYpeIYQ9aBD+2dbvxuprj46cu9a4BX/0+jCsoL8sZR2Wy0kgheXg8PMDzzlAi+VW5PoGZVs2U7QvY70QOflBo5aIeOayP1z7cVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773827007; c=relaxed/simple;
	bh=mBizHlG/2MG5U6mw8AdrFw9tn4YQGlPBlvciQ7A/RBE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vp+J2BSgPW8sZ4w8s0bX8V/ur5HSu7CC/gyIqgyXULaAGKaWLxtBjTivrUgKzGmy+I7OP/DbwMJvG4SHm9OG0V6NZu4GxVSRFvKB2JnAcTiqMNj33Iax2FCP3QxnmLn5P9+vlk2z45UJeR7Oks5dSAAlhQgF37yvs5LwkXmHwiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WZqTsl0S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WZqTsl0S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1A47C19421;
	Wed, 18 Mar 2026 09:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773827006;
	bh=mBizHlG/2MG5U6mw8AdrFw9tn4YQGlPBlvciQ7A/RBE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WZqTsl0Sxk1kMdhTce/TBbEULFailQUObJzA1YgLyi4PNXqH+OHUF0dFJPrMNORHb
	 WhnwZ8OoPiXDHwtjDpTzUJ+F0aqJUEBakQS+7P1/54Pq6zfmP8DrBflZh7In2DbsDD
	 PlZOWbDFNvzVvjPGD9OY/0fKiP9GZB4UkK3D3DAZDbbQHWkkEFDbpxXuq1Q6iLUdxU
	 Olune+il6yuQCguJ3i0N8GkwCBjnk/vEVeMYAIOCmurf6eaMVWrIqvygq/mF9aBeeZ
	 53in7jOiaTpfuh3rdXw+qnbRHuP9ZOYF4DB4KHxzss376ps1ZP/1CUAWcMhtUwtX7n
	 avdlicO71i+IA==
Date: Wed, 18 Mar 2026 10:43:21 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Aleksandr
 Loktionov <aleksandr.loktionov@intel.com>, Randy Dunlap
 <rdunlap@infradead.org>, Shuah Khan <skhan@linuxfoundation.org>, Sasha
 Levin <sashal@kernel.org>
Subject: Re: [PATCH 00/14] More kernel-doc patches
Message-ID: <20260318104321.53065c27@foz.lan>
In-Reply-To: <cover.1773823995.git.mchehab+huawei@kernel.org>
References: <cover.1773823995.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Mar 2026 10:11:00 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Hi Jon,
> 
> This series comes after:
>     https://lore.kernel.org/linux-doc/cover.1773770483.git.mchehab+huawei@kernel.org/
> 
> It basically contains patches I submitted before on a 40+ patch series,
> but were less relevant, plus a couple of other minor fixes:
> 
> - patch 1 improves one of the CTokenizer unit test, fixing some
>   potential issues on it;
> - patches 2 and 3 contain some improvement/fixes for Sphinx
>   Python autodoc extension. They basically document c_lex.py;
> 
> - The remaining patches:
>   - create a new class for kernel-doc config;
>   - fix some internal representations of KdocItem;
>   - add unit tests for KernelDoc() parser class;
>   - add support to output KdocItem in YAML, which is a
>     machine-readable output for all documented kAPI.

Btw, if one wants, for instance, to obtain all mm-related kAPI already
documented with kernel-doc markups in a machine-readable format, all 
it is needed is to run:

	$ ./scripts/kernel-doc -none -y mm.yaml mm/ include/linux/mm.h include/linux/mm_*.h

Its output follows the YAML schema defined at:

	tools/unittests/kdoc-test-schema.yaml

Regards,
Mauro
