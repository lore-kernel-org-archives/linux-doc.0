Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B52190470;
	Mon, 20 Jan 2025 09:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737365379; cv=none; b=GNuPg+MMY7477QrEgXH7jrrn2dt4+iVNL9Z6nfg4sfzaMd8PTcV/mHxO6vbvTlh1w3UiQGcw2+PWQ0IYH7Sv/hSRlCe+xAU+ICm20qWeIE3M/u4qcxDyPkBuAUuiOEFGnjNq20WTKN8Ncon34PAzmWHYrfnNqNud94siN2oIX00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737365379; c=relaxed/simple;
	bh=ZAsgWgfT7fX/FE9CHqn0nHIYEAUr+BzBwAUT5ke/FSg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=epcRi5FHC2RQmujyAZBvcd+Gzr7tSVQ8/qECT/CqXqciA3Mb62K7CayuEal5ICsR8UboDJ97a/ZI1G/bpx7OHRunAe3J85KA4/3nWw0BZ7zgq6KzziEFlJtDbanlR9rBII1IEcIUe8PJaRO2ETA8MhGIe1rsr8fVimsXyJQgkA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=C7wfYCS4; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="C7wfYCS4"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B393C0005;
	Mon, 20 Jan 2025 09:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737365369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3OxMG2T52upFVe9oq5I/FPRo7O1UcBjQEfWQ/Y+qQAs=;
	b=C7wfYCS4parWzMnuqFXjfObw53RLqF8/x5vbnFijuRnlCeZpx/n2k/bmFWsJWFeyO2Jyjx
	pfCYVygxi37jjh2DQvLhZRZ/+M7qWZ8VavhSKHfx8bjpb5s9trRL8oKKg55FpPoP8N6E79
	eenHoRafeJF80TQDOwUYqjlMAEzsII15B2/JWrV2BqLvhsILMKw9mghmGeH2RR59Yfs7IF
	nc9DWcHq1i3Y3I8Ulf3pSUv4VG5p1VCSAeLurlkMro184IpFSJ93rrqwjB+UVgYw92B1HU
	lXsyYfcKkGPdkEGX9+6FfDHu2Kjn67RS80eJqJL9pufzKiEoASdhJM6FvW8vDw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Petr Mladek <pmladek@suse.com>,  Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>,  Steven Rostedt
 <rostedt@goodmis.org>,  Rasmus Villemoes <linux@rasmusvillemoes.dk>,
  Sergey Senozhatsky <senozhatsky@chromium.org>,  Jonathan Corbet
 <corbet@lwn.net>,  John Ogness <john.ogness@linutronix.de>,  Andrew Morton
 <akpm@linux-foundation.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hexdump: Allow skipping identical lines
In-Reply-To: <20250117192522.0b2e7c65@pumpkin> (David Laight's message of
	"Fri, 17 Jan 2025 19:25:22 +0000")
References: <20250110-perso-hexdump-v2-0-7f9a6a799170@bootlin.com>
	<20250110-perso-hexdump-v2-2-7f9a6a799170@bootlin.com>
	<Z4UInSRCSXzNN5Ug@smile.fi.intel.com>
	<Z4qE7tsTOvggdUET@pathway.suse.cz> <20250117192522.0b2e7c65@pumpkin>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 20 Jan 2025 10:29:27 +0100
Message-ID: <87wmepvnns.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hello David & Petr,

On 17/01/2025 at 19:25:22 GMT, David Laight <david.laight.linux@gmail.com> =
wrote:

> On Fri, 17 Jan 2025 17:27:26 +0100
> Petr Mladek <pmladek@suse.com> wrote:
>
> ...
>> IMHO, it is perfectly fine to add support for skipping identical lines
>> only to print_hex_dump(). And I would go even further and replace
>>=20
>> void print_hex_dump(const char *level, const char *prefix_str, int prefi=
x_type,
>> 		    int rowsize, int groupsize,
>> 		    const void *buf, size_t len, bool ascii)
>>=20
>> with
>>=20
>> void print_hex_dump(const char *level, const char *prefix_str,
>> 		    enum hex_dump_type,
>> 		    int rowsize, int groupsize,
>> 		    const void *buf, size_t len)
>>=20
>> and combine all the flags into the one enum:
>>=20
>> enum hex_dump_type {
>> 	DUMP_HEX_ONLY =3D 0,
>> 	DUMP_HEX_AND_ASCII =3D BIT(1),
>> 	DUMP_PREFIX_ADDRESS =3D BIT(2),
>> 	DUMP_PREFIX_OFFSET =3D BIT(3),
>> 	DUMP_SKIP_IDENTICAL_LINES =3D BIT(4),
>> };

Would a single enum (in the prototype of the function) work? I like the
idea but we need some kind of OR combination to be supported, typically:

DUMP_HEX_AND_ASCII | DUMP_PREFIX_OFFSET | DUMP_SKIP_IDENTICAL_LINES

Maybe something like:

void print_hex(const char *level, const char *prefix_str,
	       int rowsize, int groupsize,
	       const void *buf, size_t len,
               unsigned int dump_flags) // flags instead of enum?

enum hex_dump_flags {
        // I'm not sure what to do with the default value?
	DUMP_ASCII =3D BIT(0), // renamed?
	DUMP_PREFIX_ADDRESS =3D BIT(1),
	DUMP_PREFIX_OFFSET =3D BIT(2),
	DUMP_SKIP_IDENTICAL_LINES =3D BIT(3),
};

>> How does that sound, please?
>
> Rename it as (say) print_hex() and add wrappers for the existing callers?

That would avoid the treewide changes, so yes I can try that, definitely.

Thanks,
Miqu=C3=A8l
