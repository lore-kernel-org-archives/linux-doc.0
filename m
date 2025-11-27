Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4819320CC0;
	Thu, 27 Nov 2025 08:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764233911; cv=none; b=CjhoSmf8XA+RlbBboLuZgx3wi5J+alFKDv4MYeNSDS/BltAG68GufaeKugzNGelqebFJGy+qPPEj0A91O+rRMQgt4cqpEBh37tRt7M7wuJvPO3mgjaIi4jp9sqwyjlziHXhRUqC2FMSfQ8iyqSHUa0Wly+Qf/x2+xyT5yY4xTrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764233911; c=relaxed/simple;
	bh=IrZKAErtlB7nNi/Aq1RPCDGxmJ5mY0erZ/5y8Cq6XyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jood9ou8Ba4kUhrafVzZ/AsA658fokzl05MQjPJrTE9D5oenpwOF2vcfVWVayDu8q3lnKQ+hyeiqcjfMnldZpVlZwaOuVewCsZ549zHvb7b37XzwZNipLF5bLWIguDlRVdva/ZMEqSfCz+p6zBw5jN4vMqUl8KLLxaSqZW7N+fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LmcEs26u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LmcEs26u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47DE5C4CEF8;
	Thu, 27 Nov 2025 08:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764233911;
	bh=IrZKAErtlB7nNi/Aq1RPCDGxmJ5mY0erZ/5y8Cq6XyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LmcEs26uMkm0pn86sMLjJ+f8mgvuW92HbtL77cccOTqcppidl4NHBSLzKkXlou1sg
	 x4F0U2JGOCMwnjbcQjcaq1mw800cAcMqh+bDlyFnucNo16HwY1SA4Ob+GYcGcEfl5s
	 acJQA9LKVasqaWHL1asg7GcQUBOegUNqvgJ9+ZpAG94MLQjtFuKJkeTee452spcaAm
	 +7lrL1ZRDNw9QY2P6vfSwbNxJnMND3uUOUnEJ+SwGwnwRryXgcT9nP2aDYXwj60Ihh
	 y3PNM0U9+BIrCNs1Vv03ht90RrzYYrsBE7mwNws7JyyVoK3ywEpAbjfV4LKp/4ad4u
	 ToXzYjrVtta0Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vOXpc-00000004fI3-2HwE;
	Thu, 27 Nov 2025 09:58:28 +0100
Date: Thu, 27 Nov 2025 09:58:28 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: MAINTAINERS: update Mauro's files/paths
Message-ID: <viqdsnsynk7cswlbdvu637ivihnjtyk6ptl7sslpvzuxthkjuh@4ydqe42pk5dc>
References: <20251127063125.150441-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127063125.150441-1-rdunlap@infradead.org>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On Wed, Nov 26, 2025 at 10:31:25PM -0800, Randy Dunlap wrote:
> Update Mauro's F: (files/paths) entry for docs scripts so that
> get_maintainer.pl will report these correctly.
> 
> This is copied from Jon's entries for these paths.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-doc@vger.kernel.org
> ---
>  MAINTAINERS |    2 ++
>  1 file changed, 2 insertions(+)
> 
> --- linux-next-20251127.orig/MAINTAINERS
> +++ linux-next-20251127/MAINTAINERS
> @@ -7559,6 +7559,8 @@ M:	Mauro Carvalho Chehab <mchehab@kernel
>  L:	linux-doc@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/sphinx/
> +F:	scripts/kernel-doc*
> +F:	tools/lib/python/*
>  F:	tools/docs/
>  
>  DOCUMENTATION/ITALIAN

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
Thanks,
Mauro
