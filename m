Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AEF363C73;
	Wed, 27 May 2026 20:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779912419; cv=none; b=MPQ2xJB9qtoNUdS34YaBS9FYhJETLdQA32O6FayyT16tEo4nbkASNOsK8GHLu/Ie7wfaLQK/gH9wTX1CL75MYWhlf91QgBbvmyohHizDpgrOCWeEToF0j47bD99uJRZgsgxyik+NrCnOeLbAUA8j1TgP4SqPAflR9HIMl/uSnZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779912419; c=relaxed/simple;
	bh=ctgHzBlfz2XKNFD6qE4yuvhkQXa6+bh4EQsU5ntRZac=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=oTJfsb45VWmYpxLFCRc8NEv3CZbQ3365BSTe0nOJYquamEt37TOy2UBB/P+x0of/kY5K34sMaClkVVOpuvexAd8dy2+7AOnIrzh217kvyr9P5kFkgwHQVbp5XPegSicrC4IFbcDbq6HE9W5p1VWuUrWpx+pYlWPs9hnWA5EMoNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=10EY5CEp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="10EY5CEp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E30A1F00A3D;
	Wed, 27 May 2026 20:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1779912417;
	bh=t24yiIj3iGfqZREtbmVnrduVKwQ03r/frcUxbwRtR14=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=10EY5CEpYpPR+7kkjM5ExyfirkKrxnM9VigApFLCRHTylpQaXI94HACcmcmNfRbdh
	 NbOL8v1sFIii6M8jzCoJOXh+uJWxB45ycXct4pqee3O3+CmSsC4AuYJ1aV5u63vW5a
	 98ianTyuplHWq18kMmur+rH4qtaY340JL/dvRQCE=
Date: Wed, 27 May 2026 13:06:56 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: lirongqing <lirongqing@baidu.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Vlastimil Babka <vbabka@kernel.org>, Harry Yoo
 <harry@kernel.org>, Hao Li <hao.li@linux.dev>, Christoph Lameter
 <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Roman Gushchin
 <roman.gushchin@linux.dev>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
Subject: Re: [PATCH] mm/mempool: use static key for boot-time debug
 enablement
Message-Id: <20260527130656.a448e84a30dc44617b51b45a@linux-foundation.org>
In-Reply-To: <20260527104634.2434-1-lirongqing@baidu.com>
References: <20260527104634.2434-1-lirongqing@baidu.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 27 May 2026 06:46:34 -0400 lirongqing <lirongqing@baidu.com> wrote:

> Replace the #ifdef CONFIG_SLUB_DEBUG_ON conditional compilation with a
> static key (mempool_debug_enabled). This allows enabling mempool debugging
> at boot time via:
> 
>     mempool_debug
> 
> Instead of requiring CONFIG_SLUB_DEBUG_ON at compile time. Benefits:

Sashiko is suggesting that we use mempool_debug=<...> here.  Which permits
mempool_debug=n if for some reason the kernel is defaulting to "on".  Which
we might choose to do in the future.   I think that's a little better - do others agree?

Same goes for the new dmapool_debug.

Sashiko asked a second question:
	https://sashiko.dev/#/patchset/20260527104634.2434-1-lirongqing@baidu.com
