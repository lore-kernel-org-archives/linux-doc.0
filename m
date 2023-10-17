Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27C5BE69
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 11:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PYeEor2E";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Z/41AlbS"
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4151102;
	Tue, 17 Oct 2023 04:16:09 -0700 (PDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1697541367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OvDI0iFoUBbqDTj3zP5h6st/X6TtuFe4Pyv0h1oYoHU=;
	b=PYeEor2E+XWTyT1TxFzhgJ2jNvC2qix4RP05Dneh9+fPcSaD10R5XAxcCfsYp6aLyJ3GSV
	qswgYHHAKyRH1gwwZ1Fnb2plGbau2Z3mkZNSgp9omNyeRrjeJP6+40ebUoC4jhEJBfv4bL
	yG9Ac79wuKIJhR4tH12XRLzBZghm/4y1G0r5UF3gZW0fKHf+YUMl1tvMfl787nTLCjBk5C
	tVtUA8V5ZXAfMPTJVtzoWuvDU29I2FAFYggOjrcj+H9DHX6W34LezK/Yg78KMa/8sVZSlh
	SSKtzgmabIr3xMUU39mNy3f4zd9z9tpr14l8cqiHl46qmndT7AGdxUcMWUSUvw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1697541367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OvDI0iFoUBbqDTj3zP5h6st/X6TtuFe4Pyv0h1oYoHU=;
	b=Z/41AlbSFb6O3VyLf3kMd7P9PjKycXEWev/A8i8X5GPG6/SXgXSeuKeuEEDhs7bEbC/CfQ
	/eL17aOGMMoOa5CA==
To: lakshmi.sowjanya.d@intel.com, jstultz@google.com, giometti@enneenne.com,
 corbet@lwn.net, linux-kernel@vger.kernel.org
Cc: x86@kernel.org, linux-doc@vger.kernel.org,
 andriy.shevchenko@linux.intel.com, eddie.dong@intel.com,
 christopher.s.hall@intel.com, pandith.n@intel.com,
 mallikarjunappa.sangannavar@intel.com, thejesh.reddy.t.r@intel.com,
 lakshmi.sowjanya.d@intel.com
Subject: Re: [PATCH v1 3/6] x86/tsc: Check if the current clock source is
 related to ART(Always Running Timer)
In-Reply-To: <20231017052457.25287-4-lakshmi.sowjanya.d@intel.com>
References: <20231017052457.25287-1-lakshmi.sowjanya.d@intel.com>
 <20231017052457.25287-4-lakshmi.sowjanya.d@intel.com>
Date: Tue, 17 Oct 2023 13:16:07 +0200
Message-ID: <87ttqp5wjs.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Oct 17 2023 at 10:54, lakshmi.sowjanya.d@intel.com wrote:
> From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
>
> Add interface 'is_current_clocksource_art_related()' in tsc.c to check
> if the current clock source is ART related.
> Add helper function 'is_current_clocksource(clock)' in timekeeping.c to
> check if the provided clock matches the current clock source.

Again. That's the WHAT not the WHY.

Also the Subject suggests that a check is added at some random place,
but that's not what the patch does.

> +/*
> + * Checks if the current clocksource is ART related clocksource
> + *
> + * Return: 1 on success, 0 on failure.
> + */
> +bool is_current_clocksource_art_related(void)
> +{
> +	return is_current_clocksource(art_related_clocksource);
> +}
> +EXPORT_SYMBOL_GPL(is_current_clocksource_art_related);

> +bool is_current_clocksource(struct clocksource *clock)
> +{
> +	struct tk_read_base *tkr = &tk_core.timekeeper.tkr_mono;
> +	return clock == READ_ONCE(tkr->clock);
> +}
> +EXPORT_SYMBOL_GPL(is_current_clocksource);

Aside of the horrible function names (new global functions want
$NAMESPACE_* convention) this really starts to become hilarious.

Two exported helpers which are completely unexplained. That smells badly
of broken data representations.

But let me see what this is used for.

Thanks,

        tglx
