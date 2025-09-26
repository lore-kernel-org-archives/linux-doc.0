Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB5F23184A
	for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 16:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758902445; cv=none; b=SHtt4rszjDxTLZd37xuaS8ZuwEti8qnwpxxFlF7aDDJGxUgLtwlNKiaIzfjpS0M6VNaXg5TebjuWCg2F0dLYrurzQqVXV5r3+BOwMtjAb3Cx4U66yL7KUrrxadnzR0Ps0D5aodhFcZi4zj0QMomubjV7WaBmyLXuOWWycOZlKi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758902445; c=relaxed/simple;
	bh=/iINhmrWLyEA7nDq0IyLTRLwcxT+Z6kmOFmUoQysEO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PNH33fGlXlU+XY5EhcwAFMv1AlEIy99hSfXsSBQcV7WAgHDVE7NG9QGlbF1ybCChlvDFRpOqElUPBO/mf6bdx+IfgyDOYSKwmzzyHF3iX8OgvRvV3M74V3LGotGliqfy2r9wQf15F/ZcMH74Rr/zwLB5g3l9eSy/39GhL7S10/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KRukib6P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KRukib6P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84530C4CEF4;
	Fri, 26 Sep 2025 16:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758902444;
	bh=/iINhmrWLyEA7nDq0IyLTRLwcxT+Z6kmOFmUoQysEO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KRukib6P6i2ppnnHymDpTvGeDxQzZNB7vz9BFB1jJek6LpZJQqU1CB6D3IZSttDrN
	 xwsFIxTumMg7AtCFKZNOD3blwYE6BnLdmy8MSvSoPUiuSeKJiSTgtTUVeFiJNaG4J1
	 9Frgj2ZBhXIE/uIRfu30z8wynaYcVcRy0ZUC+4e6i+DjeEM0gvEln/6ud1k3p7ldP4
	 K0fsR+tFUhLCJjTuEU9US5bA2hc+9RzHvfdQI6R31Va5ECiZXOESIJ/o5q80dek3Hu
	 ee176k3ght/skOvZ73t5W8TJcEWwRstspZydlww7n2c5wgwTFF6/DzqgJi5TOXaZVd
	 G4AIArvi+I/SA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1v2AsE-00000005vSf-3359;
	Fri, 26 Sep 2025 18:00:42 +0200
Date: Fri, 26 Sep 2025 18:00:42 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: make mandocs questions
Message-ID: <jd5uf3ud2khep2oqyos3uhfkuptvcm4zgboelfxjut43bxpr6o@ye24ej7g3p7n>
References: <6ac6a844-8394-41fb-9cfc-c44e83268422@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ac6a844-8394-41fb-9cfc-c44e83268422@infradead.org>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> Can we get more meaningful output info for warnings like these?
> 
> Warning: 385
> Warning: 389
> 
> I see 9 warnings like these.

This is actually a kernel-doc issue at its parser:

    $ scripts/kernel-doc  ./arch/mips/include/asm/mach-au1x00/gpio-au1000.h -none
    Warning: 385
    Warning: 389

The problem is due to the duplicated NOTE sections here:

/**
 * alchemy_gpio2_enable_int - Enable a GPIO2 pins' shared irq contribution.
 * @gpio2:      The GPIO2 pin to activate (200...215).
 *
 * GPIO208-215 have one shared interrupt line to the INTC.  They are
 * and'ed with a per-pin enable bit and finally or'ed together to form
 * a single irq request (useful for active-high sources).
 * With this function, a pins' individual contribution to the int request
 * can be enabled.  As with all other GPIO-based interrupts, the INTC
 * must be programmed to accept the GPIO208_215 interrupt as well.
 *
 * NOTE: Calling this macro is only necessary for GPIO208-215; all other
 * GPIO2-based interrupts have their own request to the INTC.  Please
 * consult your Alchemy databook for more information!
 *
 * NOTE: On the Au1550, GPIOs 201-205 also have a shared interrupt request
 * line to the INTC, GPIO201_205.  This function can be used for those
 * as well.
 *
 * NOTE: 'gpio2' parameter must be in range of the GPIO2 numberspace
 * (200-215 by default). No sanity checks are made,
 */


which is generated when this is called:

            if name in self.sections and self.sections[name] != "":
                # Only warn on user-specified duplicate section names
                if name != SECTION_DEFAULT:
                    self.emit_msg(self.new_start_line,
                                  f"duplicate section name '{name}'\n")

The problem is that this emit_msg() call is using the wrong parameters.

Just sent a fix.

-- 
Thanks,
Mauro
