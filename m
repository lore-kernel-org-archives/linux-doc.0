Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A704221727
	for <linux-doc@vger.kernel.org>; Tue,  3 Jun 2025 19:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748979895; cv=none; b=ILKnAYdPIal9uD2npTg6aslEPwxXgHY45B49CRaI1rAs420ZPBR+xxdBsjVmziEhH3GjpR+XgfJs+9wnqTeVHtQ9n1baTLRLloLEUWh7cEwyxx87VZ5Kj7EsQ4Z8+V1KaNO8sZdJJZ1eBMu+DMq/fm06llEJ5v+/h4zLMx5H09o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748979895; c=relaxed/simple;
	bh=rhC8eT9Yx2RWXQEgfifGN7hW24nXWsrNXot423ga1gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YGuiAMZJKzYU/DAIevw4TgZ4QuYvX45vxyBsaUx+yEQXaxKsPzkoX2W3dSEUGG5sMqaXRCU4m6OR7kpLz7Jn9E5ARIIUn81xjetXmtp/EAUHSyj1Ab61UgdqFtSG89tXMMjDmmvOChFwH8qPRiUJTNz435q8Cabez1UF7NkteNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ADuXFxKg; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ADuXFxKg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748979886;
	bh=rhC8eT9Yx2RWXQEgfifGN7hW24nXWsrNXot423ga1gs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ADuXFxKgHZHdHLZm7bfYzvy1q5v2ulox1YdCs8KjYRm8GyupI2dQfbZEaFMWaB9Pe
	 5u1lccq/TGS0loWpkwkQrktHjg5/8U3n3AzZErDYmGtNoQDQmYdBy40UVIzW5pCSHa
	 XqgLukKVOL9Fhh6/fUYmbI4klYhkdcnwEGABtDohtHslSoX9whgrTPd43oE6zOG2tZ
	 Z1EEzoi1NMGQa31lsMi/huyybDxzEtseOXPNvn5Z7McG59ATYcQr8RaGbRuCSi7HsO
	 Nyg8rz9vQva5NCzN4RzlAZ4BbreIaTiOk4k3S/6raFmqKJfDEIVy9ZNG0tu2x2bdVc
	 bc7b0O41K9HUQ==
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:9400:99d:464c:62e0:2118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1CDB117E00A3;
	Tue,  3 Jun 2025 21:44:44 +0200 (CEST)
Date: Tue, 3 Jun 2025 15:44:42 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] docs: automarkup: Mark up undocumented entities too
Message-ID: <74558759-8fa4-417e-9879-6a34e8685ef9@notapiano>
References: <87cybklp2n.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cybklp2n.fsf@trenco.lwn.net>

On Tue, Jun 03, 2025 at 11:20:16AM -0600, Jonathan Corbet wrote:
> The automarkup code generates markup and a cross-reference links for
> functions, structs, etc. for which it finds kerneldoc documentation.
> Undocumented entities are left untouched; that creates an inconsistent
> reading experience and has caused some writers to go to extra measures to
> cause the markup to happen.
> 
> Mark up detected C entities regardless of whether they are documented.
> Change the CSS, though, to underline the entities that actually link to
> documentation, making our docs a bit more consistent with longstanding WWW
> practice and allowing readers to tell the difference.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  Documentation/sphinx-static/custom.css | 5 +++++
>  Documentation/sphinx/automarkup.py     | 9 +++++++--
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
> index f4285417c71a..771984f77307 100644
> --- a/Documentation/sphinx-static/custom.css
> +++ b/Documentation/sphinx-static/custom.css
> @@ -136,3 +136,8 @@ div.language-selection:hover ul {
>  div.language-selection ul li:hover {
>      background: #dddddd;
>  }
> +
> +/* Mark xrefs with an underline, but elide it for those that
> +   don't lead anywhere */
> +.xref { text-decoration: underline; }
> +.broken_xref { text-decoration: none !important; }

To me the results look much better without these CSS rules, as they cause a
double underline.

The current CSS already adds a dotted underline to reference links through the
following rule:

	a.reference {
	  border-bottom: 1px dotted #004B6B;
	}

So when you add this underline text-decoration to the .xref tags, the ones
inside <a> tags (valid xrefs) end up with two underlines.

I've checked the result for both struct and functions and they work the same.

So I suggest just dropping these CSS rules.

> diff --git a/Documentation/sphinx/automarkup.py b/Documentation/sphinx/automarkup.py
> index 347de81c1ab7..cede07e758a7 100644
> --- a/Documentation/sphinx/automarkup.py
> +++ b/Documentation/sphinx/automarkup.py
> @@ -241,8 +241,13 @@ def add_and_resolve_xref(app, docname, domain, reftype, target, contnode=None):
>  
>      if xref:
>          return xref
> -
> -    return None
> +    #
> +    # We didn't find the xref; if a container node was supplied,
> +    # mark it as a broken xref
> +    #
> +    if contnode:
> +        contnode.set_class("broken_xref")
> +    return contnode

And accordingly changing this to just:

+    #
+    # We didn't find the xref; return contnode so that if one was supplied the
+    # resulting node can have the same styling (eg literal formatting for
+    # struct/functions)
+    #
+    return contnode

With that,

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas
