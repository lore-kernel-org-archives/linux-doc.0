Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C94371B34
	for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 20:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706645598; cv=none; b=MbAA6cqns8b8gfAqTjlxa+N6PThBSm+PyZadJ4tI6/5pd6TA+kkZNHWIHvmc3wr1oaXyWKi41gCv9+jOLPCChuH2EF8zcJWdTFvYPxwEE/kyMxdWJVrl+xCpqXWlM7K5DVTr5KU7zVIv72+6xQvqGzEwRY8NnZVZwXbLQo0NvaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706645598; c=relaxed/simple;
	bh=aRgPRx4IGKRbvaTeGzxZz7v8q70ABtr7vDoLh68xyEs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MbcGNF9yTQ10XSl3gmvvYfVMfZXLqD66iBaZgKBRafVJVMt+F2i9iuSeNDV+inI1EEPHyI9TJqI8gUDloIm/XGFKDYeo3vfPJmrN34+63XXiLfYmfgVR2fhXmk+fhgNARJCKsbWvCAxK+e0eoFczkGIx6QLd7iNGnpn8lPaEYJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=aup2R0ql; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="aup2R0ql"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4648141A47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1706645596; bh=qc+FUESSC4CgMeoT5lKa+9TenrTCMiJSvkxdiwl2RKY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aup2R0qlc2N2Sb4Cujbc3RoKo/v7y4RIb89hNg5W9j93QgraOOCbq/wj67VxOHGjG
	 /KTBqozjTxoPjkR7mzEgxYKjHY4Ed43BQ7Es7552wVzvk7SWp4MMqrv3NuopbDCRoF
	 IxRC02TWivmpCr8cTYIy7fZi68btN+u6nSp68cVA4wH7AtRpSMBOb/MgVpQ2UOxIZ0
	 81rN0R5hwuKJ4F4gm9yxBlkBKmIOrLfjBZTqrZwQUDMlXUz7N1vkbMXjLHhw7wdjMI
	 3l1BhUTzsDgJjYEzW95YexlQKOsEGiTSY0kSSe//BorBrb7QIsQKpx4TlKIgdC6zkf
	 by0+R7C2Xs3Zw==
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4648141A47;
	Tue, 30 Jan 2024 20:13:16 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>, linux-doc@vger.kernel.org
Cc: Matthew Wilcox <willy@infradead.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: Re: [PATCH 0/2] kernel-doc: Do not pre-process comments
In-Reply-To: <20240122093152.22536-1-anna-maria@linutronix.de>
References: <20240122093152.22536-1-anna-maria@linutronix.de>
Date: Tue, 30 Jan 2024 13:13:15 -0700
Message-ID: <87v87abmw4.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Anna-Maria Behnsen <anna-maria@linutronix.de> writes:

> Hi,
>
> this is a repost of the RFC queue
> https://lkml.kernel.org/r/20240116151456.48238-1-anna-maria@linutronix.de
>
> Jonathan Corbet is fine with this change and mentioned in an answer the
> following:
>
>   "The kernel-doc change should really go together with the DRM change.
>   I'm happy to carry both with an ack from DRMland or have the kernel-doc
>   patch go through the DRM tree, whichever is easiest."
>
> But back to the patchset: Commit 654784284430 ("kernel-doc: bugfix -
> multi-line macros") introduces pre-processing of backslashes at the end of
> a line to not break multi-line macros. This pre-processing is done
> independently if it is inside code or inside a comment.
>
> This illustation of a hierarchy as a code block inside a kernel-doc comment
> has a backslash at the end of the line:
>
> ---8<---
> /**
>  * DOC: hierarchy
>  *
>  *                    Top Level
>  *                /               \
>  *         Child A                 Child B
>  */
> ---8<---
>
> It will be displayed as:
>
> ---8<---
> 	     Top Level
> 	 /                *        Child A                 Child B
> ---8<---
>
>
> As I asked for a solution on the linux-doc mailing list, I got some
> suggestions with workarounds and also got the suggestion by Matthew Wilcox
> to adapt the backslash preprocessing in kernel-doc script. I tested it and
> fixed then the newly produced warnings which are covered in the first
> patch. The processing of the documentation seems to work - but please don't
> rely on my tests as I'm not a perl neither a kernel-doc expert.
>
> Thanks,
>
> 	Anna-Maria
>
>
>
> Anna-Maria Behnsen (2):
>   drm/vram-helper: Fix 'multi-line' kernel-doc comments
>   scripts/kernel-doc: Do not process backslash lines in comments
>
>  drivers/gpu/drm/drm_gem_vram_helper.c | 44 ++++++++++++---------------
>  include/drm/drm_gem_vram_helper.h     | 16 +++++-----
>  scripts/kernel-doc                    |  2 +-
>  3 files changed, 29 insertions(+), 33 deletions(-)

Series applied, thanks.

jon
