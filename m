Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mAIZQvWt"
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18D451716;
	Fri,  8 Dec 2023 18:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IKyGq69v+yiB031iXboSAtxXfDEhOobYWT8CgqL/zNo=; b=mAIZQvWt9+Nij3tuivm2mwww0L
	fs6OvGoLNkpmyRUy71AaK5WwDM769zltb9cMUjhU6nhXmDWVWKo+57xBGqz+S58apMhTA0aZbo4Vj
	8zuMzyetpNFh7g4JdRO7cJ7nHunLHRSvVAtRKkxrqUBz1ClgJfHlNOk45luj1RDLEqRPiBKFa17id
	FKVEnzEGAoUUdUiieQv/efDUrgXac0HKkjBoyY9iAdW6EcuoS2qGWQBGJSiR7jWcos1qhFvZ284zd
	uJzoHZ3mCXYJ+nY0GEMiFXZiJDDzsr16eMgmV3yVT8lg8Hjf0pVDRwNjb31RG5whL19EKF5gykpQw
	i8x+BaSg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1rBnOK-006upi-3a; Sat, 09 Dec 2023 02:48:32 +0000
Date: Sat, 9 Dec 2023 02:48:32 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] Rework the top-level process page
Message-ID: <ZXPVgB/432RCo/Ux@casper.infradead.org>
References: <87msuk2pu8.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87msuk2pu8.fsf@meer.lwn.net>

On Fri, Dec 08, 2023 at 05:15:43PM -0700, Jonathan Corbet wrote:
> +An introduction to how kernel development works
> +-----------------------------------------------
> +
> +Read these documents first: an understanding of the material here will ease
> +your entry into the kernel community.
>  
>  .. toctree::
>     :maxdepth: 1
>  
> -   license-rules
>     howto
> -   code-of-conduct
> -   code-of-conduct-interpretation
>     development-process
>     submitting-patches
> -   handling-regressions
> +   submit-checklist

I feel the policy section should come first.  Yes, howto is important,
but putting the policy first means it's more important.

> +Policy guides and developer statements
> +--------------------------------------
> +
> +These are the rules that we try to live by in the kernel community (and
> +beyond).
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   license-rules
> +   code-of-conduct
> +   code-of-conduct-interpretation
> +   contribution-maturity-model
>     kernel-enforcement-statement
>     kernel-driver-statement
> +   stable-api-nonsense
> +   stable-kernel-rules
> +   management-style
> +   researcher-guidelines
