Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30865477983;
	Wed, 15 Jul 2026 12:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119371; cv=none; b=f3vhv04O0rWz2/xGrSaktwa186r6nG5WzkJJx1oUsj98PhrGFr1XdxCc/foKQFUefq3PM6kgq98ktci/JrIIkRzMbt/3rU7cVLemz2Z7i12iM8vVUWuHKbZWZSs09STl6GU3W4gcknyHTeKj278WcWrhwqqv2n86bknjmH7yX2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119371; c=relaxed/simple;
	bh=qJhL1q5jnBY0JJ7OF4KHAFeu0Z4Xa5QDB6YUVpWbpb8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J0WoNTNh9lNMono4IPApIaXyjTkPIrrcoE7z9zkT230CkrIEk/hd2w/3jKFwjTF+s9AKcZ6Feuccpg1AsW0Hd+I1t2zU8zEmPeXOQSIvfaISPUMsfusjWMqjmTQdS1I4gWoSq6XQBU1jR3Y8ILqxR/j15KX4kO8MJINCeNdL8H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nfaemjg6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nfaemjg6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F07AB1F000E9;
	Wed, 15 Jul 2026 12:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784119367;
	bh=cu6L77LE5KKihHgixtsouBZm1/r4ptLw2MR+eA4KN6w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=nfaemjg6sZ+w2lUl33YsBotOLUOmSM7V4p2/LB+Z+0pCkwXb0bjHUWCDT7Ij5OZzo
	 o1ag9r9c1fAGG1/rCxXPFPSDWvM3IuZveu9T8trRmM7DXOmx/j1G4j1aSFgPVxWAI8
	 rGa8eIr+81jAe+YkBk6NR+e1IE3Sq5IAo+/RA29l6LyuRzMjMRXNnydESDH2+hhUNB
	 tQ91ECmEFZnU9Mdp3ZA45eORanLh0E941P9UtT44yrx/cCjwyIw9CQ9snnz9DlrKPe
	 WeY+bUPd4+qds2h8R43kXWnsdowh5ccg26X6WsWvE0iC4rJOyOc61OTF0kEfG4VVv3
	 Dz404dnK248Mg==
Received: from localhost ([::1])
	by mail.kernel.org with esmtp (Exim 4.99.4)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wjywm-00000005xHe-3LUQ;
	Wed, 15 Jul 2026 14:42:44 +0200
Date: Wed, 15 Jul 2026 14:42:43 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Ryszard Knop <ryszard.knop@intel.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 Shuicheng Lin <shuicheng.lin@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2] scripts/kernel-doc: Suggest possible names for
 excess descriptions
Message-ID: <20260715144243.60686000@localhost>
In-Reply-To: <20260715111726.394565-1-ryszard.knop@intel.com>
References: <20260714111208.323108-1-ryszard.knop@intel.com>
	<20260715111726.394565-1-ryszard.knop@intel.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 15 Jul 2026 13:17:26 +0200
Ryszard Knop <ryszard.knop@intel.com> wrote:

> Since check_sections() now warns if a documentation tag member name is
> the same as defined in the struct, we can suggest names the checker
> knows, so that it's more obvious how to deal with the warning.
> 
> v2 (rdunlap):
> - Strip whitespace from warnings, nicer when the hint is empty
> 
> Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
> ---
>  tools/lib/python/kdoc/kdoc_parser.py | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
> index 2dedda215c22..a22c3e3182f0 100644
> --- a/tools/lib/python/kdoc/kdoc_parser.py
> +++ b/tools/lib/python/kdoc/kdoc_parser.py
> @@ -558,6 +558,13 @@ class KernelDoc:
>                          self.push_parameter(ln, decl_type, param, dtype,
>                                              arg, declaration_name)
>  
> +    def get_suggestions_hint(self, decl_name, possible_names):
> +        suggestions = set(name for name in possible_names if decl_name in name)
> +        if not suggestions:
> +            return ""
> +
> +        return f"(did you mean one of: '{"', '".join(suggestions)}')"
> +

There is a better way to propose suggestions. See:
	Documentation/sphinx/kernel_include.py

E.g. use something like:

	from difflib import get_close_matches

	matches = get_close_matches(decl_name, possible_names)

See: https://docs.python.org/3/library/difflib.html#difflib.get_close_matches

If the problem is due to a typo, this will likely return the
right name.

Regards,
Mauro
