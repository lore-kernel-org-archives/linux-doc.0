Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFAD2F3C10
	for <linux-doc@vger.kernel.org>; Tue,  3 Feb 2026 20:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770152114; cv=none; b=azwXxLFc3nm/7wEV8RdV/KBMLzB8fDyzuiM05EbWkgG51HQJm7tiyPryHCyZZpXXe2cLl75utEVh3zCvVilgD5Ig8gAejpRiyAbk9oZCKJrAqhM3e6VHUl5OiqQI4GABmbPV8AJL6DN4E4Y37hPScPePeVfYtDzPXsT+ym8aFUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770152114; c=relaxed/simple;
	bh=3TnQAFDhm7FienmxzZk7R9Ukmy9Fe6IVR9MEL8z0xS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T/c6opJGkwbJJdBvyRQD7HfxFFP1ZKtorufjCnMU1ejk4ru+T7Og1k8KqLkaXpaGMv/etdiOSr1IEl00c1Ig7gxq7UoKUDV8OkQc6hCRiElh9QM+u0VniolSL9HghG0sZGattV66gwwgrB+R4mMmBl/sFP59Ow55m32cPwvvIxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Yk5NZv3n; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Yk5NZv3n"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=hsad4j96gPrHuBSohj3rNBDjsFmivqkpHD/drSe6fak=; b=Yk5NZv3nx6FRpjytsrIGh6wNOj
	RXOq71CtjnAAludAl1bcXeFfwsqJEI2sRsF2jTGSRVFQPWgjKhBiB+n++2549XzxKY3CUsbR6Otp8
	b0CtwjGvmlboRuWjnd+zZ0kQVQLgzzPa9J6Gw60OMRATE2IVzfEg7akgYPirRf9mcKptBxW7IaIap
	Lj6KpnQCgjHgM1vefWDPNm21ZS+qCHQpz4wH9fyy7qvmgDjXCtVuJZmvdAu5oIdPMNXQvg91rBp1T
	PAX/zRUZJBYhLr/BctIyGuOrvJdhT9Mwly+VK5Nuwyf51jhTJn6OM4c1wzy5VeFfS9m6ZfWldreSB
	fbmgwmdA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnNQU-00000007LyZ-0m4e;
	Tue, 03 Feb 2026 20:55:10 +0000
Message-ID: <0852503c-1d94-4cea-9364-d390ef076ea6@infradead.org>
Date: Tue, 3 Feb 2026 12:55:09 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] docs: pt_BR: add initial Portuguese translation
To: Daniel <danielmaraboo@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
References: <20260203184826.81594-1-danielmaraboo@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260203184826.81594-1-danielmaraboo@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,
One more nit, sorry.

On 2/3/26 10:48 AM, Daniel wrote:
> From: Daniel Pereira <danielmaraboo@gmail.com>
> 
> This patch introduces the initial Portuguese (Brazilian) translation
> for the Linux kernel documentation. It includes the mandatory
> disclaimer, the translation of the HOWTO document, and establishes
> the directory structure for the pt_BR locale.
> 
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> 
> ---

Documentation/process/submitting-patches.rst says:

Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
to do frotz", as if you are giving orders to the codebase to change
its behaviour.

so something like

Introduce the initial ...

would be good.

-- 
~Randy

