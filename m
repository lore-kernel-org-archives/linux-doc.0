Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557363BE165;
	Sat,  4 Jul 2026 15:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783178561; cv=none; b=g5hl9lWwnx+uqmdbWde7Z5KfbkOVwVQn7jyynev89vW35wOB7zrVoyUqp0SckyZVPzo3rmaTzXrPHnG9q1dWyOZDchZRa/UiYvJGSpvDeJVT8SalQam7aQzVdmp7pJhPNl5nd3gexp6EUADoqP8gEVBvcyugodCoDIwC6PQb/yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783178561; c=relaxed/simple;
	bh=QwCmdO6E5azStg51AC3NudnyfHzPC1nm99e48+x9EcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=at5opAcYCDKmAN93XqJKc8pH5sQPe3OJ/LlRLYS+ZJQl/U/qVIePG+ZKFTIewPnnUn8khOOp09UTv8yDaxZSoH7iUqmn6014N9Z8VxzKOSjnFgmqV5u5WAiTHoBhLHTnr4PyaaNDxO4NH4RKwt4My8If/lhSYNr4iXBisUH8ESg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NSxfTgz5; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NSxfTgz5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Qcla6IH6/IEV19XiTYQqUJaFkJTRhWFhu35QeOgffrs=; b=NSxfTgz54eNwS83Px9BQETaHt5
	Cx0HuPK5FbKIEybVKRplQ0qfI0vQtumRG8ZQOOKgBj0nojyxa2/0GDDbN2HYtVG54vaUcLn5jIX6l
	jfr/EB1TwbyxzDFjcr1os9yHIbfX/xlMkZ2B57pXVXiGpHLbX4fVF2Wh1VQnHqAWeAn/hjS4MlAMH
	mZwoS2RNWElashHQoOgvCdSZxbMNtOSXGRz65Pveax/1DBvsAyTbIQhNu5Q9SwlDSRtNQf0H0TOzD
	EIsGJBc/55eXTN8ojJqVnV9G8IVFDz/m+nESVxx3MJx+4ZwFSmZhZ/WvAacu7paz14R4ocMmHsnDS
	0XOq9f/A==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg2CC-0000000C7ES-3NIq;
	Sat, 04 Jul 2026 15:22:20 +0000
Date: Sat, 4 Jul 2026 16:22:20 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Gregory Price <gourry@gourry.net>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, tglx@kernel.org, peterz@infradead.org,
	luto@kernel.org, akpm@linux-foundation.org,
	feng.tang@linux.alibaba.com, pmladek@suse.com, lance.yang@linux.dev,
	marc.herbert@linux.intel.com, kees@kernel.org, leitao@debian.org,
	joel.granados@kernel.org, lirongqing@baidu.com, nathan@kernel.org,
	xur@google.com, lukas.bulwahn@redhat.com, ryan.roberts@arm.com
Subject: Re: [PATCH v2 1/2] syscall_user_dispatch: Make it configurable in
 Kconfig
Message-ID: <akklLLPZ1fbcZRML@casper.infradead.org>
References: <20260704015859.536580-1-gourry@gourry.net>
 <20260704015859.536580-2-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704015859.536580-2-gourry@gourry.net>

On Fri, Jul 03, 2026 at 09:58:58PM -0400, Gregory Price wrote:
> +config SYSCALL_USER_DISPATCH
> +	bool "Syscall User Dispatch"
> +	depends on GENERIC_ENTRY
> +	default y
> +	help
> +	  Syscall User Dispatch lets a thread have its own system calls outside
> +          an allowed IP address range to be intercepted and redirected to a
> +          userspace signal handler.

I was very confused when I read this.  IP expands to Internet Protocol
long before it gets to Instruction Pointer in my brain.
