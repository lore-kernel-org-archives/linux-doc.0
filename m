Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930F22FF64B;
	Wed,  3 Dec 2025 14:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764772839; cv=none; b=uVaChBQDP1+l4FUzFmYbBnta5IjTw3Z2pL/J1BTzz8mYZLUaKsjyQaPLHBc8/xNalRTuj0nuY85itLEkUBmOQSRLUBhAIsOj6whCrCjBcJcyKOIqahBujdZgBFb+SfwCnFeKWROZPfwdJFZEKPtS6qrHo3AsKyScoywRD7akiy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764772839; c=relaxed/simple;
	bh=+finZcUtK0qR1D2ZsUbRi+xAmeDTQ8b7FwtVcNcAR1o=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=QqxCFz3DtSzHGiAwYuykecnZAp/L9Ed6O6TdFrDPFvaIy1rT1UOWEB8/Z4As02mL6ViGUZJLtwE2SMB7Lqu6EXrfxTqL32JJGKSRfH7NUWDt7N8mjvNBLHCLx1ltUfdUMytbfwShDVDostW40VLys11z5z6ECVR1x01E2X8WHhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gkl4RTzH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gkl4RTzH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B8BC4CEF5;
	Wed,  3 Dec 2025 14:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764772839;
	bh=+finZcUtK0qR1D2ZsUbRi+xAmeDTQ8b7FwtVcNcAR1o=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=gkl4RTzHp0p8QLMqkc5qscCYf8FfUgY9IkzXdPLhav/QYMw5PYbH6mxtAfMg0OFHf
	 WDRzJ99Nf7mXLqZX5icksIFs/FB7ml5O2AzpIlFmWOnioc979xpfqB3OfF1F/ic35d
	 rnzWbUS++DvBGuUlkUPxCGOxzAJycQeI7AMdVRHHR4LqTGvVNT1kt9kAcCSZ9Z+PGA
	 3zd28N1CTaR6KircctYnGA1VqdDCkQdKMixYQ2jxp7zG7gGnHpE8OlAqmAPKaHXLm/
	 K8ZFMGfwSKHRqS0slvz81f8tULR/gyja3z+embdvDnjxfhHi6deqybbAqrrL3fuEhy
	 xLL0XKsiazMHA==
Date: Wed, 03 Dec 2025 06:40:38 -0800
From: Kees Cook <kees@kernel.org>
To: Willy Tarreau <w@1wt.eu>, Jonathan Corbet <corbet@lwn.net>
CC: Security Officers <security@kernel.org>, gregkh@linuxfoundation.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_Documentation=3A_insist_on_the_p?=
 =?US-ASCII?Q?lain-text_requirement_for_security_reports?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20251129141741.19046-1-w@1wt.eu>
References: <20251129141741.19046-1-w@1wt.eu>
Message-ID: <AFC0A4BB-6DBB-4C66-A2DF-940F9B6725A5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On November 29, 2025 6:17:41 AM PST, Willy Tarreau <w@1wt=2Eeu> wrote:
>As the trend of AI-generated reports is growing, the trend of unreadable
>reports in gimmicky formats is following, and we cannot request that
>developers rely on online viewers to be able to read a security report
>full for formatting tags=2E Let's just insist on the plain text requireme=
nt
>a bit more=2E
>
>Signed-off-by: Willy Tarreau <w@1wt=2Eeu>
>---
> Documentation/process/security-bugs=2Erst | 6 +++++-
> 1 file changed, 5 insertions(+), 1 deletion(-)
>
>diff --git a/Documentation/process/security-bugs=2Erst b/Documentation/pr=
ocess/security-bugs=2Erst
>index 84657e7d2e5b=2E=2Ec0cf93e11565 100644
>--- a/Documentation/process/security-bugs=2Erst
>+++ b/Documentation/process/security-bugs=2Erst
>@@ -33,12 +33,16 @@ that can speed up the process considerably=2E  It is =
possible that the
> security team will bring in extra help from area maintainers to
> understand and fix the security vulnerability=2E
>=20
>-Please send plain text emails without attachments where possible=2E
>+Please send **plain text** emails without attachments where possible=2E
> It is much harder to have a context-quoted discussion about a complex
> issue if all the details are hidden away in attachments=2E  Think of it =
like a
> :doc:`regular patch submission <=2E=2E/process/submitting-patches>`
> (even if you don't have a patch yet): describe the problem and impact, l=
ist
> reproduction steps, and follow it with a proposed fix, all in plain text=
=2E
>+Markdown, HTML and RST formatted reports are particularly frowned upon s=
ince
>+they're quite hard to read for humans and encourage to use dedicated vie=
wers,
>+sometimes online, which by definition is not acceptable for a confidenti=
al
>+security report=2E

HTML sure=2E But why discourage =2Emd and =2Erst? Markdown is pretty well =
the defacto "human readable" markup format and our own kernel documentation=
 is =2Erst=2E Those are good for seeing code snippets, etc=2E

I would call out PDF and ZIP instead=2E We especially don't want _binary_ =
formats=2E

-Kees


--=20
Kees Cook
