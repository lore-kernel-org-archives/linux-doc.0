Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEB71F3B8A;
	Mon,  3 Aug 2026 17:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785777666; cv=none; b=t1HCAenGXddTMdqMs3CP7aOt+oBFMo0C5cVZDc5HbyRK+oAWkA/DVqObo3FyIlkLGgq0xdGA/oyu+ZoKq6vExA4fbiBwG1yt1ugZJBZeI5061ZNnHYhyzDChQTxGbBtGIiaP0anrgTBy739PEQZAdrzwLW6V6538mU4Embrcx9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785777666; c=relaxed/simple;
	bh=7RmFye71I9IMjDXqX6AOi+mqlicGEG4NqoQTk3M4pd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pMG5ON3RI/ksGEqVGGN+iMdcc+aqlceacFXKDqo/cIze0uhixRGZJO7G/6Tiug5+caaafnPNFl7hKBukwXXO9XEwkNS1obf8Dt+OvfFtNQuDLPaQRi2ZjQ1TFknXfQlnQ9juwDpum+cyQdkMlR4CtV9X9PXqfKvdUKVTx1oGRA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XtbGjz1B; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XtbGjz1B"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=qWo52Aj2tnQvSqWfFzYKCQa7jEs6W4DtDHh9fvVn3xk=; b=XtbGjz1B3x7oJ7YV0Al2xaOSXd
	Bs9C2fJjNBivBWDEhGtceQhAPBdYMxXX7ZAZRM3sTN2h5G3CBJOkhqJ8jfU//9/9SHK8bgUN/Pch0
	BXBJzz2vTIE0dmaqS13oJaUc1q06Xng5RBVfShzJ/3HdatEVLIyqwFS4jNOXJqNs1dVUKqlU8vjS5
	VPW9B8ktnCzc69ICGhN++4tJcp7BXGBoTHXnGFgqPiH1rmTPTA7V687RhNwvWgwy8MMTvxBCwclBM
	Mg0JB65/XDYQREG+EEi/tt0WyRyJ8wCfavWhGa9iwb5aOcWCNTob9/dI1C0J6nAqwYqvbkLfkhlc3
	PlQZ6q6g==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqwLN-00000000D1N-0jQQ;
	Mon, 03 Aug 2026 17:20:53 +0000
Message-ID: <247339d0-3e1f-4e7c-8c2f-032a61b8d56a@infradead.org>
Date: Mon, 3 Aug 2026 10:20:52 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Documentation: html: make sidebar section titles bold
To: Antonin Godard <antonin.godard@bootlin.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260803-show-sections-in-sidebar-v1-0-b4fdc847525d@bootlin.com>
 <20260803-show-sections-in-sidebar-v1-2-b4fdc847525d@bootlin.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260803-show-sections-in-sidebar-v1-2-b4fdc847525d@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/3/26 7:35 AM, Antonin Godard wrote:
> Now that section titles are displayed in the sidebar, make them bold to
> have them stand out compared to the subsection titles.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

LGTM. Thanks.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  Documentation/sphinx-static/custom.css | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
> index 0576d4fcb2a3..3938daf410c3 100644
> --- a/Documentation/sphinx-static/custom.css
> +++ b/Documentation/sphinx-static/custom.css
> @@ -81,6 +81,11 @@ div.kerneltoc li.current ul { background-color: white; }
>   */
>  section#the-linux-kernel-documentation p.caption { display: none; }
>  
> +/*
> + * Make section titles bold in the sidebar.
> + */
> +div.sphinxsidebar p.caption { font-weight: bold; }
> +
>  /*
>   * The CSS magic to toggle the contents on small screens.
>   */
> 

-- 
~Randy
