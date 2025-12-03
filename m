Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE0D43ABC;
	Wed,  3 Dec 2025 14:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764773931; cv=none; b=SnfJ2B8YXDwfZiPHcA3cC/uj8mMvc2Y0S9iK01AdwjK+AuD/YL36igzZPGvlVM9Gf0omKqT4DtclMHlihqBXfYgXxnAAsVtmdJcWnX1nkAnhTr5X54qUJR/aI9t2k9PeHOzXltPzKuRykFmFJ7qZ49qcRqpNnH0VQA8KK2i8k6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764773931; c=relaxed/simple;
	bh=0RurLIkjhWyQEag9ht96iul3hXKOoe9VC37eIo3vm3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b97GoblWLR+kS3UcLiy1AQ6QjW6ADXG0Sm1KWK7WmIxPymQuO3XWjkvJNQ4TtEgrr4/rFbEtCH7Rn67bu9FJQMQaOvhzDK4erUNRyOHrgQqSuFCoJSjzJEpbNUBZJEBg7gHhbzfbRXmvSXw/t1JdKOqTyRD6sHWy8DZ1fqNB6cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=uTcN8+mc; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="uTcN8+mc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1764773926; bh=TxZZ8FbuedqDFsqIX7jjaonHCF8htWJqKVU8kbqxUAo=;
	h=From:Message-ID:From;
	b=uTcN8+mcex7NOnrpoTV5V9m0C9isePpPkney+J6QNeE4pTDmcueEOAaqFMRqD/DSX
	 03UE4KuMANogDbLbWj/ZVeNp0W77dK1SW0XYfO+fwUnSTSn/fqaj+cSdfwS23zsuXT
	 AztbzI+dV0s+eY3096qCh/zMbH4fLiV1pLtUnFyw=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id E9823C0708;
	Wed, 03 Dec 2025 15:58:45 +0100 (CET)
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 5B3EwjmE012558;
	Wed, 3 Dec 2025 15:58:45 +0100
Date: Wed, 3 Dec 2025 15:58:45 +0100
From: Willy Tarreau <w@1wt.eu>
To: Kees Cook <kees@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Security Officers <security@kernel.org>,
        gregkh@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: insist on the plain-text requirement for
 security reports
Message-ID: <20251203145845.GB11908@1wt.eu>
References: <20251129141741.19046-1-w@1wt.eu>
 <AFC0A4BB-6DBB-4C66-A2DF-940F9B6725A5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AFC0A4BB-6DBB-4C66-A2DF-940F9B6725A5@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Dec 03, 2025 at 06:40:38AM -0800, Kees Cook wrote:
> >+Markdown, HTML and RST formatted reports are particularly frowned upon since
> >+they're quite hard to read for humans and encourage to use dedicated viewers,
> >+sometimes online, which by definition is not acceptable for a confidential
> >+security report.
> 
> HTML sure. But why discourage .md and .rst? Markdown is pretty well the
> defacto "human readable" markup format and our own kernel documentation is
> .rst. Those are good for seeing code snippets, etc.

Quite frankly, have you tried to read the latest reports ? They're full
of "**" everywhere with no spacing nor indent at all, it's particularly
hard to find the relevant information in them. It's super tempting to
copy-paste them to the plenty of online viewers to render them correctly,
except we'd rather not do that for obvious reasons. And when you start
to discuss it gets even worse with ``` formating tags isolated between
quoted paragraphs and no longer being relevant.

And let's be honest, these ones are close to 100% of the time generated
by AI tools which are almost unable to produce anything else anymore by
default because that's what they're using to interact with the chatbot's
UI. If at least that forces those seeking a CVE number to actually *read*
what their favorite AI bot produced, it will be a huge gain for everyone.
Right now I'm really ashamed to forward AI-generated garbage to subsystem
maintainers just in case there would be anything valid despite the format
already strongly hinting otherwise.

> I would call out PDF and ZIP instead. We especially don't want _binary_
> formats.

IMHO we don't want useless nor hard-to-exploit reports in the first
place, and to date I don't remember seeing a really valid and
immediately actionable one using such decorations, since they were
not written by the reporters.

Willy
