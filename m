Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D378377566;
	Fri, 10 Jul 2026 19:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783712803; cv=none; b=iQmYGVttKlOSkMVsx/JkJHK7MYXMm960jQ/FPNGT0FerUJq+UZif3xfXnvVxXeqybrRb4Nk4LJZQBgXbcvh+/ANvYbqyOrOfDfjSwDnHjHxE4rkzzyvSyuikT1ZnUGCe6zXN7lAYnSGyUEUnQ+K338jU9Ce4l4G8BlybUDB5tms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783712803; c=relaxed/simple;
	bh=7o81Ht/KRJIJTc4ZvDdABlqS1lYKVfBgKm4HusuhU9Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LeB7OP6F75hOGbMa6Ahfmo6trGI6SvlPfyNpjaddyG5eMF9geq1YWVzGYZbQtG0vkj6Z4/0tNfUKhlIQYZtAVIOp1AaRk/ZsOJiCyw5VUlSH2B30AWQmddALzKoPbo17TJLJpKzHawh6di8d9q0CBlqTlcXCN+5EDldQZB4fk48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=CMdK2A4r; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="CMdK2A4r"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 793BC4108A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1783712801; bh=Wi2UBGe+CRCK59ZrTnlwfSjJtNElSyxHhTNTPAYZ8iY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CMdK2A4r2u2ndQd5NOtHtUeIMNMM0xYWmJ6XVHmOvNjStQLhv2VHjWBQTx0SQtxHr
	 TuRimd5pvZ4ytKH6yBoKTZFjEScMM9EBqyXWHsZJxFGkNGQdfZGs5dJa0XLc2dxoSj
	 O+xKI37Cy9J0qMZZaLU7MUd/sUa5TYtjLZRpHzzxTyuyC2c9e3TAhCT0WtpmMUPeY8
	 NmXWEC9Bimt4OXc4geKn8Ki5JhQpgTOO5BQoIfwkqPIERPfXl8MdZH6H3gYTjZY5LW
	 XHitm5X83mhhgtxfRLxljQ0nOPKQtDqT6JvKqFxc9KydiyC42MdZtVmWpLmvBjP2/9
	 +sWwUZOj7pd6w==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 793BC4108A;
	Fri, 10 Jul 2026 19:46:41 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akiyoshi Kurita
 <weibu@redadmin.org>, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH -next] docs: submitting-patches: Fix section structure
 around DCO
In-Reply-To: <5f320260-5cb0-42cc-949a-c92404124618@gmail.com>
References: <5f320260-5cb0-42cc-949a-c92404124618@gmail.com>
Date: Fri, 10 Jul 2026 13:46:40 -0600
Message-ID: <87mrvyk4pr.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akira Yokosawa <akiyks@gmail.com> writes:

> Commit 5903019b2a5e ("Documentation/SubmittingPatches: convert it to
> ReST markup") made "DCO 1.1" a subsection under the section "Sign your
> work - ...".  However, the DCO text is meant to be referenced in the
> section.
>
> Furthermore, in HTML and PDF docs, paragraphs following the DCO:
>
>     then you just add a line saying:
>
>         Signed-off-by: [...]
>
>     [...]
>     as it was propagated to the maintainers and ultimately to Linus, with
>     the first SoB entry signalling primary authorship of a single author.
>
> appear to belong to the DCO, rather than to "Sign your work - ..."
> where it should.
>
> In reST (and other documentation tools), once you start a subsection
> under a section, there is no way to go back to the section.
>
> Fix the section structure by making the DCO a literal block, with
> indent changes made in commit 5903019b2a5e reverted.
>
> While at it, fix the same issue at "Reviewer's statement of
> oversight".
>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  Documentation/process/submitting-patches.rst | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)

Applied, thanks.

jon
