Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4B0223DEF;
	Mon,  1 Dec 2025 20:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764622026; cv=none; b=OFmHjBIfG+iMCDeqcs/Q0ThHZwkeos54MAF/LwV78lynIELXdsjC6IvXBvfDpqltXBSBwZSU/7CtWe3GetS9ymN4emAAzSvgFgx48Da4l9bxQFQbw6U3dPdMixXXcEBh0Bfknx+3oDlpqOnosPCx9IToezh3d1BXQtfnAx2Hmdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764622026; c=relaxed/simple;
	bh=bLzU90ffnLkplI0gQszURVHL2uPhCQXbR2IBotWK1Gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hcdMurDnzn/v5/DUkNmGAFnDp6Ve4STXSG7iDF0LKq+ev9+Lxp4/Tnx/pk3z4GFiq/DoiSuPg/z9VlPtcu7A/SqllAOQ+vAA/NwQDkQWmrRfYeB/CWFZEywzTFT2CIB/WiXX4aLpSAoas66a2UtjShwThqcKN9edaJgULGi9Jf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RzbB0QAO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RzbB0QAO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D0A1C4CEF1;
	Mon,  1 Dec 2025 20:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764622026;
	bh=bLzU90ffnLkplI0gQszURVHL2uPhCQXbR2IBotWK1Gs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RzbB0QAO0/4dx0cdPhr1ytcEjQX/QNFnOqA1MGnIX7sYunwXqjoZUd3NnIahc9ajj
	 OfOuPwKkwI525Bh+mXeYdUoiUH99fRUpajTjSLETJxekj+t0a/RlTwd6ZdyB0wqERC
	 XAnH6mpnse266zkD7CvWCTURCvpOjW2BGx7Qf264J1jdndquJ+6bBD7WD33TvTDQP3
	 EVy//JdwhyG+xnLiEpjo1KvnjNpHoqZ3X50z6Ym04OHdkBIA6HWu1XibBF+DHiaSJD
	 fd00/x7J1Men5meo2cjUvUIFNfkhX9lnjkoLABYEklOae3+fnolZ/MnlB/1K0IP7VZ
	 zrfbwOZqCVf2Q==
Date: Mon, 1 Dec 2025 21:47:01 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Willy Tarreau <w@1wt.eu>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Security Officers <security@kernel.org>, gregkh@linuxfoundation.org,
	kees@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: insist on the plain-text requirement for
 security reports
Message-ID: <aS3-xTM5NvYLNEM9@gmail.com>
References: <20251129141741.19046-1-w@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251129141741.19046-1-w@1wt.eu>


* Willy Tarreau <w@1wt.eu> wrote:

> As the trend of AI-generated reports is growing, the trend of unreadable
> reports in gimmicky formats is following, and we cannot request that
> developers rely on online viewers to be able to read a security report
> full for formatting tags. Let's just insist on the plain text requirement
> a bit more.
> 
> Signed-off-by: Willy Tarreau <w@1wt.eu>
> ---
>  Documentation/process/security-bugs.rst | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
> index 84657e7d2e5b..c0cf93e11565 100644
> --- a/Documentation/process/security-bugs.rst
> +++ b/Documentation/process/security-bugs.rst
> @@ -33,12 +33,16 @@ that can speed up the process considerably.  It is possible that the
>  security team will bring in extra help from area maintainers to
>  understand and fix the security vulnerability.
>  
> -Please send plain text emails without attachments where possible.
> +Please send **plain text** emails without attachments where possible.

So maybe part of the confusion is that this sentence 
can be read permissively, depending how the 'where 
possible' qualifier is interpreted:

    Please send plain text emails without attachments, 
    where possible.

Note how "it's not possible because my report is in 
PDF" seems to allow for that in the permissive reading.

What that sentence should really say is something like:

   Please send plain text emails only. Please do not 
   include any attachments, where possible.

This makes it clear that only plain text emails are 
acceptable.

Ie. something like the patch below?

Thanks,

	Ingo

============================================>
Signed-off-by: Ingo Molnar <mingo@kernel.org>

 Documentation/process/security-bugs.rst | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
index 84657e7d2e5b..4a76928a700e 100644
--- a/Documentation/process/security-bugs.rst
+++ b/Documentation/process/security-bugs.rst
@@ -33,12 +33,16 @@ that can speed up the process considerably.  It is possible that the
 security team will bring in extra help from area maintainers to
 understand and fix the security vulnerability.
 
-Please send plain text emails without attachments where possible.
-It is much harder to have a context-quoted discussion about a complex
-issue if all the details are hidden away in attachments.  Think of it like a
-:doc:`regular patch submission <../process/submitting-patches>`
+Please send **plain text** emails only. Please do not include any
+attachments, where possible.  It is much harder to have a context-quoted
+discussion about a complex issue if all the details are hidden away
+in attachments.  Think of it like a :doc:`regular patch submission <../process/submitting-patches>`
 (even if you don't have a patch yet): describe the problem and impact, list
 reproduction steps, and follow it with a proposed fix, all in plain text.
+Markdown, HTML and RST formatted reports are particularly frowned upon since
+they're quite hard to read for humans and encourage to use dedicated viewers,
+sometimes online, which by definition is not acceptable for a confidential
+security report.
 
 Disclosure and embargoed information
 ------------------------------------
