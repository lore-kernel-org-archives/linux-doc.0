Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3ED381D8
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 09:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BtdxdiAv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="81B32lN2"
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0D7FD55;
	Tue, 17 Oct 2023 02:29:12 -0700 (PDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1697534951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9sKaZ+DU3SskjI6E8phB+glqoGJwjS+nS0gFA9gAqr0=;
	b=BtdxdiAvKf4xp0/qbT65QMMI2KZEBljih08tmtJCeLHT2Ir+wD0e/aBib4HUQl3QVuPFBz
	f7NgYJLJc3uda4x+7dJ8Kal5raQGKcXb+DYZCsh3KRyU20hmDRrUSDML+Mx+nQkkzPgW/K
	lN41GGXks+DewycAi7aArKC9unL0pDJ+/8LO9/L6Sf2vhf86TEnSd7cpAcnOAuSjVrddA0
	RNXSbJoAf0NFF3rlqgC4Ay2npMek7YUHfN4CuqwUzSFnjjNZvJKaViInZDy3M7AizKGdMP
	910qkR3zawLCneLf2K4Ot4S1bTEouraumZA4ULiEgaF/WfTU2+LJR4jkLAXJjw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1697534951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9sKaZ+DU3SskjI6E8phB+glqoGJwjS+nS0gFA9gAqr0=;
	b=81B32lN2+7b3Kg0VOfHVncb3RVfhbE1McS81o2QK6HZUGE9xq4HSHV8BOPkvsAOSrtieGw
	gto1/hAGhDTiLICg==
To: lakshmi.sowjanya.d@intel.com, jstultz@google.com, giometti@enneenne.com,
 corbet@lwn.net, linux-kernel@vger.kernel.org
Cc: x86@kernel.org, linux-doc@vger.kernel.org,
 andriy.shevchenko@linux.intel.com, eddie.dong@intel.com,
 christopher.s.hall@intel.com, pandith.n@intel.com,
 mallikarjunappa.sangannavar@intel.com, thejesh.reddy.t.r@intel.com,
 lakshmi.sowjanya.d@intel.com
Subject: Re: [PATCH v1 2/6] x86/tsc: Convert Time Stamp Counter (TSC) value
 to Always Running Timer (ART)
In-Reply-To: <20231017052457.25287-3-lakshmi.sowjanya.d@intel.com>
References: <20231017052457.25287-1-lakshmi.sowjanya.d@intel.com>
 <20231017052457.25287-3-lakshmi.sowjanya.d@intel.com>
Date: Tue, 17 Oct 2023 11:29:10 +0200
Message-ID: <87wmvl61i1.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Oct 17 2023 at 10:54, lakshmi.sowjanya.d@intel.com wrote:
>  
> +/*
> + * Converts input TSC to the corresponding ART value using conversion
> + * factors discovered by detect_art().
> + *
> + * Return: 0 on success, -errno on failure.

bool indicating success / fail ?

> + */
> +int convert_tsc_to_art(const struct system_counterval_t *system_counter,
> +		       u64 *art)
> +{
> +	u64 tmp, res, rem;
> +	/* ART = TSC * tsc_to_art_denominator / tsc_to_art_numerator */
> +	struct u32_fract tsc_to_art = {
> +		.numerator = art_to_tsc_denominator,
> +		.denominator = art_to_tsc_numerator,
> +	};

The purpose of this struct is to obfuscate the code, right?

The struct would make sense if a pointer would be handed to some other
function.

> +	if (system_counter->cs != art_related_clocksource)
> +		return -EINVAL;
> +
> +	res = system_counter->cycles - art_to_tsc_offset;
> +	rem = do_div(res, tsc_to_art.denominator);
> +
> +	tmp = rem * tsc_to_art.numerator;
> +	do_div(tmp, tsc_to_art.denominator);
> +	*art = res * tsc_to_art.numerator + tmp;

Yet another copy of the math in convert_art_to_tsc() and in
convert_art_ns_to_tsc(). Seriously?

Can we please have _one_ helper function which takes value, nominator,
denominator as arguments and clean up the copy&pasta instead of adding
more?

Thanks,

        tglx










