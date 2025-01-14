Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321821FAC29;
	Tue, 14 Jan 2025 19:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736882028; cv=none; b=GDOmsppgFh48m0BrbEjlwcDHTGesjcuhF9OdFae6urP8y8F5zE+VUw0gcLR+plpQ/Jp/vWDlHp0t85EANLJL1PcytIIW1wmkaIYPgvS9XVVnzww/KwRE7xMHdGeh8JmqXgIz9ydQLA+TnIIRbVNorSlkcx86BHRECqfWm7Jxnmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736882028; c=relaxed/simple;
	bh=EOm7BnpDBqcyqDhU+R0M8+xWmqgUwSH41INgkmUal9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FZ8qPdRBVnY6i8BtLk6cv5OGYyvqUcnuD0HYwjWrwEoj3J4z2Bb0vwqF7e98DAMblz6bPStbKrw01yIuYtNyLYuqzprzJsOioT8d9A7Bc6nRPLmSZNwmFWVKrnjRGen+eTK/l1miCOeztCfI8Nx6lP9MqviP2tV8C9QiJGsAUno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=W7s6zI1P; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="W7s6zI1P"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=jBEKp8tBlbCJx8+1AuV07Lp8LRbwQGkMdBxsN++O98k=; b=W7s6zI1PcmvKJr41P+IJuR/+ee
	BPf/+v2fFJ62ExRKS33MewlDd/u6N7BSGmLL1S+TWnUXe5plyXvizQf3Fjf5uYZ072S4l+Ct8KuYf
	dXPIL9AhbrLUJR+yk+BF7z1QT1O7+F5WdADB7vgM3clhGVCWwusrkqE1yZECkvlRuQbhLulKah3+f
	gN1HQz0nfkP3LQI0shw4bJ06cm0xL/P3R7weUPU8fyOvD57nqlFeF2MTA5ooQnopxCvxhoYmoemkw
	sGhoOtqcncrQ7NL25ks8I0VGxbWPRizBNScjnorrPCeQ+tcRvEqw3CfEOJXntsJrENk0umLhPTPfb
	MF4h29Eg==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmM8-00000002Pat-1MtH;
	Tue, 14 Jan 2025 19:13:40 +0000
Message-ID: <4d746408-7f74-45f6-9bfb-c9144c100243@infradead.org>
Date: Tue, 14 Jan 2025 11:13:34 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] docs/arch: remove deprecated function name
To: Jiayuan Chen <mrpre@163.com>, linux-doc@vger.kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, corbet@lwn.net,
 linux-kernel@vger.kernel.org
References: <20250114094832.350073-1-mrpre@163.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250114094832.350073-1-mrpre@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi--

On 1/14/25 1:48 AM, Jiayuan Chen wrote:
> The dumpstack.c file has undergone many modifications, and the
> print_context_stack() function was removed or rewritten a long time ago,
> so it's better to remove the incorrect guidance. Additionally, no new
> functions will be added to the documentation, as it may be modified again
> in the future. Using 'question mark' and 'dumpstack' is sufficient to
> index this document.
> 
> Signed-off-by: Jiayuan Chen <mrpre@163.com>
> ---
>  Documentation/arch/x86/kernel-stacks.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/arch/x86/kernel-stacks.rst b/Documentation/arch/x86/kernel-stacks.rst
> index 738671a4070b..2d355e78008e 100644
> --- a/Documentation/arch/x86/kernel-stacks.rst
> +++ b/Documentation/arch/x86/kernel-stacks.rst
> @@ -113,7 +113,7 @@ Printing backtraces on x86
>  
>  The question about the '?' preceding function names in an x86 stacktrace
>  keeps popping up, here's an indepth explanation. It helps if the reader
> -stares at print_context_stack() and the whole machinery in and around

  stares at printk_stack_address() and its callers
  and pay special attention to the 'reliable' parameter ('?' basically
  means that the address is unreliable)

Also see the comment from dumpstack.c:

		/*
		 * Scan the stack, printing any text addresses we find.  At the
		 * same time, follow proper stack frames with the unwinder.
		 *
		 * Addresses found during the scan which are not reported by
		 * the unwinder are considered to be additional clues which are
		 * sometimes useful for debugging and are prefixed with '?'.
		 * This also serves as a failsafe option in case the unwinder
		 * goes off in the weeds.
		 */

> +stares at 'question mark' and the whole machinery in and around
>  arch/x86/kernel/dumpstack.c.
>  
>  Adapted from Ingo's mail, Message-ID: <20150521101614.GA10889@gmail.com>:

-- 
~Randy

