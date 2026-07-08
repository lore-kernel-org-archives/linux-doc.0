Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2D23CF054;
	Wed,  8 Jul 2026 21:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783545223; cv=none; b=mfeoBx+EwwT+n2Xh3BGqZwMajqC1rrz8RFUuaM+gS8BVrQDc0vgNYRfSPmFMrJTmQkPfUkf3ElM6GPCqp9g8mcSWoSeNFtkhQeylbLt27OtnZAF3HZcAYL64T9LUWF0vdEzVY73PFeEPQNMxjtithKifXMw4uQGiV+X2vOcT83c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783545223; c=relaxed/simple;
	bh=WOJwJhT8371/5kKa6lEa9msgYK6eV+1TXvgfWWGHBAI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=UmYkI0PxDE+EF+8pmgoIOg82uWNyfXsuhcxlOiE7vytdF6DB801zFdCXGYRJIiU/7o7uP6U9Qg6KOkI/YtpO9pRJC9yC4f4fBN8j1AfcKWIfgTn1RTVfszdUM1eAwodSDBqEZrlh8P8L20FXeb5lEn2gQEtPZcP+vIORW0TuwJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=YyDX2QRZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="YyDX2QRZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE2861F000E9;
	Wed,  8 Jul 2026 21:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783545222;
	bh=DRV8RZcUgp9koMPGwe0xKyk7ys1YKTWHC+0HjcxhXIc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=YyDX2QRZGyO4x2WFzpzwDfX3EZIIEl7M8KugZ11wKCSdJcUbehz6ToqI1PYLf+ac3
	 7m82cp+LKCckDKAKW09runSGNC4vN6ENxM42OMO250gdWfdTYbabl3zYw2c0+d46B0
	 IhS8yBDBWMuTQ0sa/cmcPj5SHnJbdhQFndpZmqqA=
Date: Wed, 8 Jul 2026 14:13:41 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Abhishek Bapat <abhishekbapat@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>, Kent Overstreet
 <kent.overstreet@linux.dev>, Hao Ge <hao.ge@linux.dev>, Shuah Khan
 <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>
Subject: Re: [PATCH v8 0/6] alloc_tag: introduce IOCTL-based filtering for
 MAP
Message-Id: <20260708141341.972033b394dfcc98439b36f9@linux-foundation.org>
In-Reply-To: <cover.1783532853.git.abhishekbapat@google.com>
References: <cover.1783532853.git.abhishekbapat@google.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  8 Jul 2026 18:01:22 +0000 Abhishek Bapat <abhishekbapat@google.com> wrote:

> Currently, memory allocation profiling data is primarily exposed through
> /proc/allocinfo. While useful for manual inspection, this text-based
> interface poses challenges for production monitoring and large-scale
> analysis:
> 
> 1. Userspace must parse large amounts of text to extract specific
> fields.
> 2. To find specific tags, userspace must read the entire dataset,
> requiring many context switches and high data copying.
> 3. The kernel currently aggregates per-CPU counters for every allocation
> size, even those the user intends to filter out immediately.
> 
> This series introduces a new IOCTL-based binary interface for allocinfo
> that supports kernel-side filtering.

Thanks.  The important bits are reviewed, let's get this in there for
some testing.

Sashiko had a lot to say:

	https://sashiko.dev/#/patchset/cover.1783532853.git.abhishekbapat@google.com

I think you've already been over this.  but please double-check - maybe
it found something new.

