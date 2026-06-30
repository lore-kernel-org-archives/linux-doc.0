Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61161305E3B
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 19:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782849412; cv=none; b=ilc6PwYP3q891axN8NcJEd9P1O7j0L6ofhlj1nT5u+2o/VNMOW9KaWH+44OtStL0+IYIx74u+eEfIbLlUp5ripku8F8ybGrYacAfWQt7cN8zUswCfp+NNsujwMdX93MT+rYHnqMClq/UXnMKt4G9NXPjtmNuA+GTX7Cd1XavXIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782849412; c=relaxed/simple;
	bh=lebLNvhW1pxWKSPZOZrqgxFcwkIea7hwqvhJU9608+c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sJ1SPlI7CmORUOMZDGLwMPcmAv1DrzE9TudP7+G5DIu0GfHeW6sUKH19tPnaNi82xaxJz8W8PDmxegWZxEQCZQFdCPN66q0Q+H6TZV2uOFQ6TM6C6+t81L4Dp4e9vRS1Y40t8bCWGdrE36ngHj9n9NFKqWTTxvDnz5a4c0aO6Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ESWEvfAh; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ESWEvfAh"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9A1D140E27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1782849410; bh=Y3r48aUv/QfLYpZPeEDqp5oypp167mGZmthXOtamkSg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ESWEvfAhLbCIbgd8r/ilwxhGNCP0XzLGTTBwGnjbX+nLrvm9UeSXY9i5P91qTAZpk
	 +KcMVzhgFp/Pddi0KJNvvrzdiWAHL5HUbM88OKwBesuykHSK9ULAkyEN09t774rxbL
	 rlwwKs4KzV0QzPAiczQdX9n9HBy8dQhazGhm496d+t9uQPIPHliDxlrtuEH5/dj7gA
	 ZyWPxM03dJgaMcrNug4WQ/3vAbfPXX+WBOrpSvJHrk5YcxqBnWJyXDCN6d9ahoYJzx
	 ntj1GZw6vxgm214SwFEj8mC/BegKdHnP9k1XYrRyZzkWOyXnTPojB4O9qtznJHyVL6
	 7JKmusA6/vlKA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9A1D140E27;
	Tue, 30 Jun 2026 19:56:50 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Daniel Pereira <danielmaraboo@gmail.com>
Subject: Re: [PATCH 0/2] docs: pt_BR: Translate coding and posting guidelines
In-Reply-To: <20260614235044.42810-1-danielmaraboo@gmail.com>
References: <20260614235044.42810-1-danielmaraboo@gmail.com>
Date: Tue, 30 Jun 2026 13:56:49 -0600
Message-ID: <87fr23reda.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Pereira <danielmaraboo@gmail.com> writes:

> This patch series translates chapters 4 and 5 of the kernel development
> process documentation ("4.Coding.rst" and "5.Posting.rst") into 
> Brazilian Portuguese (pt_BR).
>
> The goal is to expand the available documentation for Portuguese-speaking
> developers, making it easier to understand core coding standards and
> patch submission guidelines.
>
> Daniel Pereira (2):
>   docs: pt_BR: Translate 4.coding.rst into Portuguese
>   docs: pt_BR: Translate patch posting documentation
>
>  .../translations/pt_BR/process/4.Coding.rst   | 440 ++++++++++++++++++
>  .../translations/pt_BR/process/5.Posting.rst  | 376 +++++++++++++++
>  .../pt_BR/process/development-process.rst     |   2 +
>  3 files changed, 818 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/4.Coding.rst
>  create mode 100644 Documentation/translations/pt_BR/process/5.Posting.rst

Applied, thanks.

jon
