Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B844268FED
	for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 10:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741862918; cv=none; b=kpFuXG6RD6iqVBqehSiMeTrdKD5xjYkLMJYiOVUd1SulJmH6xVPJ4BUb7MbWg5DcMtDb25k4iAqRXf5X0/WktiVL8S6oqYNELz/ZPnfK+pKqdmht7t6gOWL0uM5V2XOnrUVal+4LSau2WOb7SJ/2I7MAxz4IuXou7CrwGSgk0m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741862918; c=relaxed/simple;
	bh=zEa2/6ZbYMtLXc0GQf4ghQrBvlaLDMechFGbdAdGPCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MGN6UF6VVFSFxK+58ku2F12qn/dG5Yqhk2lrDf7e2exyalaDE8e4YI9/ZxZ9Aq3uCVVjl9MM3/hkS4B8A1M4Ib7QMIe2bgvc0O6XfgHTwx0brWx2ALgXnE8uhSo0/CD9lmJreOatCW9v6T7OQ81vzQGGf7QopHvd7TQxYS9t4Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=I3PiCtEL; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="I3PiCtEL"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39133f709f5so481235f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 03:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741862914; x=1742467714; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eB5vcLE8SQfGumBXnzHAeXBgedPPd3tI3SPBGaHjDZo=;
        b=I3PiCtELMMHEWBralE6681EyTHaZ7OCjpcN9fdKNBvH9mxrr1VulXMZRVlnkvdS6gU
         zDmjL/I+n9YEUngzbVhjVtKbC8Mnxxf5n1/saivCilZVNd3tSzDGOzdwRe7u4T8S5L2K
         78MNzFxJ2L+ih59EuHosZl22m/nhWSWQA0nPTF0tUFkDuHMbjYURNyddXPdV3N0u9EdI
         Pau5JoviWCVR8UeFa79Vf+U4aXvhMwKeF2rougzvWa9h2bMNA7j51Z2icouj9gVdPoWG
         SJyVitfpZnEC3FIdUTcKqnQWIUXtD6irrbJlaQQusIDGjS0Cl35Q33ukMePVwXAVHMeQ
         DpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741862914; x=1742467714;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eB5vcLE8SQfGumBXnzHAeXBgedPPd3tI3SPBGaHjDZo=;
        b=daVMDTQoKFR1LT8i+AXVsLZqG8Fskixb9ogn4L9xwY1tgFARbJ8W0FJaeaqkBTpLZ2
         mgHTxClNpoF2ihXgOktYwbj+WNtThc785FetNTPTzVQH8rCoM7HzUk0UZOK7qChc/d9N
         MznSVlptphB+ywRh5odzR2QHQgUrn/DH5fRbtUIkeZjZ4u2BQemZUMXVWe8dIG1H6Twy
         fzB390wLuVcrvQ1p0CoFnwaQV8ImsgH3hmgzfwignfkeacSGCTmQNK9wraC9zsWm/Os1
         4stQv3MyhnbjjF37Ly1bCtDgexFhq73SRisxZAFYjQitsOZG9/X7C6hfWuuz/s2RsW/L
         ULFg==
X-Forwarded-Encrypted: i=1; AJvYcCUdFIOKJQzgm8xZs4Q0xGnHBhNXiC4PCQhGYcwyxtBIYYcGNjOJ4PXvazYGix6gvLbjavqF+eL5AFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFjq/PhcKjdf9o60dodSJwmcR+7Kbn5QuA0b+6w0n7dCl75M7y
	sNRI9PT8Yiut9oKhffYjJgWqNBGm9Zb/EZV5sPW1c606OKlg9DbH0r+uITHfnpA=
X-Gm-Gg: ASbGncueMmELrANGw4HOR1mIwmoKTgXvSLGCNYTPGo0wEa+03QX0uhFDIl0ruVHbDog
	mZlFekNvzYD7Ba2OXMQUMHqEn81VCPc9ifGnvwzrKllwpmB+0diIxRsaC550kNEW+jRn+wjQ2Y7
	pl8v8qXa82CDEmmNiBFnoYg1yfMM50tNqRpsROAblKn5m0AZGHy554JCm/55m8+5ZSZMfBDjhLH
	miBOeMTqvkybiXql1Tc9XP1l3YBqwi1srlQexdrwB97Nyb1Y/Kfv34nMi03GtKkQcXd7nY0fg8n
	EX87nZuiWkZ+vhk30P3/6djlFqG/R/hmxAvY1vFtQWMNB14=
X-Google-Smtp-Source: AGHT+IFm7Kuzlt4RWV1h9LdE/z3iVTyMjzOwOXxoRSiATKcU+lu5J0yjCPWicWOanc5m4AYOR6rZGw==
X-Received: by 2002:a5d:64c3:0:b0:391:31c8:ba58 with SMTP id ffacd0b85a97d-39132d16dd6mr21931727f8f.10.1741862914526;
        Thu, 13 Mar 2025 03:48:34 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b7656sm1673700f8f.40.2025.03.13.03.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 03:48:34 -0700 (PDT)
Date: Thu, 13 Mar 2025 11:48:32 +0100
From: Petr Mladek <pmladek@suse.com>
To: Aditya Garg <gargaditya08@live.com>, Kees Cook <kees@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Aun-Ali Zaidi <admin@kodeit.net>,
	Maxime Ripard <mripard@kernel.org>,
	"airlied@redhat.com" <airlied@redhat.com>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"apw@canonical.com" <apw@canonical.com>,
	"joe@perches.com" <joe@perches.com>,
	"dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
	"lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	Hector Martin <marcan@marcan.st>,
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>
Subject: Re: [PATCH 1/2] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
Message-ID: <Z9K36SRz7Ja_AyQb@pathway.suse.cz>
References: <9092a9ed-aecf-40bd-9d15-b53d60d035b5@suse.de>
 <PN3PR01MB959715C19BCEA54426D24934B8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <ff3a9c58-5c7a-4c48-8a9e-cc828a43baed@app.fastmail.com>
 <PN3PR01MB9597E5C609290DB1A967263CB8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z9HgVn-XELC065w0@smile.fi.intel.com>
 <47AE7FCD-0F30-4379-ADE9-090A15ACD58F@live.com>
 <Z9Kb8zMJgmSP-rgD@smile.fi.intel.com>
 <PN3PR01MB959780176C0B16C36FBD59C3B8D32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z9KdzZUxs3vlwp0Z@smile.fi.intel.com>
 <PN3PR01MB9597A8F02423B9E4C585F5EBB8D32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3PR01MB9597A8F02423B9E4C585F5EBB8D32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>

Adding Kees into Cc to resolve how to get this patch into the mainline.

On Thu 2025-03-13 09:13:23, Aditya Garg wrote:
> 
> 
> > On 13 Mar 2025, at 2:27 PM, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > 
> > ﻿On Thu, Mar 13, 2025 at 08:53:28AM +0000, Aditya Garg wrote:
> >>>> On 13 Mar 2025, at 2:19 PM, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >>> On Thu, Mar 13, 2025 at 07:26:05AM +0000, Aditya Garg wrote:
> >>>>>> On 13 Mar 2025, at 12:58 AM, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >>>>> On Wed, Mar 12, 2025 at 07:14:36PM +0000, Aditya Garg wrote:
> >>>>>>> On 12 Mar 2025, at 9:05 PM, Sven Peter <sven@svenpeter.dev> wrote:
> >>>>>>> On Wed, Mar 12, 2025, at 13:03, Aditya Garg wrote:
> > 
> > ...
> > 
> >>>>>>> I don't have a strong opinion either way: for SMC I just need to print
> >>>>>>> FourCC keys for debugging / information in a few places.
> >>>>>>> 
> >>>>>>> I'm preparing the SMC driver for upstreaming again (after a two year delay :-()
> >>>>>>> and was just going to use macros to print the SMC FourCC keys similar to
> >>>>>>> DRM_MODE_FMT/DRM_MODE_ARG for now to keep the series smaller and revisit
> >>>>>>> the topic later.
> >>>>>>> 
> >>>>>>> Right now I have these in my local tree (only compile tested so far):
> >>>>>>> 
> >>>>>>> #define SMC_KEY_FMT "%c%c%c%c (0x%08x)"
> >>>>>>> #define SMC_KEY_ARG(k) (k)>>24, (k)>>16, (k)>>8, (k), (k)
> >>>>>> 
> >>>>>> That seems to be a nice alternative, which I guess Thomas was also suggesting.
> >>>>> 
> >>>>> I don't think it's "nice". Each of the approaches has pros and cons.
> >>>>> You can start from bloat-o-meter here and compare it with your %p extension.
> >>>>> 
> >>>>> Also, can you show the bloat-o-meter output for the vsprintf.c?
> >>>> 
> >>>> Here are your outputs:
> >>> 
> >>> Thank you!
> >>> 
> >>>> ---------------------------------------------------------------------
> >>>> For appletbdrm:
> >>>> 
> >>>> aditya@MacBook:~/linux$ ./scripts/bloat-o-meter $P4 $MACRO
> >>>> add/remove: 0/0 grow/shrink: 1/1 up/down: 64/-19 (45)
> >>>> Function                                     old     new   delta
> >>>> appletbdrm_read_response                     395     459     +64
> >>>> appletbdrm_probe                            1786    1767     -19
> >>>> Total: Before=13418, After=13463, chg +0.34%
> >>> 
> >>> This is enough, no need to repeat this for every parameter.
> >>> 
> >>>> ---------------------------------------------------------------------
> >>>> For vsprintf:
> >>>> 
> >>>> aditya@MacBook:~/linux$ ./scripts/bloat-o-meter $OLD $NEW
> >>>> add/remove: 0/0 grow/shrink: 1/0 up/down: 220/0 (220)
> >>>> Function                                     old     new   delta
> >>>> fourcc_string                                479     699    +220
> >>>> Total: Before=26454, After=26674, chg +0.83%
> >>> 
> >>> So, we get +220 bytes vs +43 bytes. It means if we found 5+ users, it worth
> >>> doing.
> >> 
> >> Will it also depend upon the number of times it's being used? In appletbdrm,
> >> it is being used 3 times. Probably more in Asahi SMC.
> > 
> > Right, it depends on the usage count. Also on different architectures it may
> > give different results. On 32-bit it probably gives better statistics.
> 
> Best to go ahead with vsprintf then. Petr, are you still there?

I am here but there were many other things in the queue ;-)

I do not have strong opinion. I am not familiar with the FourCC
format and it looks like a magic to me. But it seems that it makes
sense for the users.

I personally find the %pcX modifiers a bit less hacky than
the two macros SMC_KEY_FMT/SMC_KEY_ARG.

So I am fine with this patch:

Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>


Now, the question is how to get this patch into the mainline.

Normally, it would make perfect sense to queue it via the DRM tree
because drivers/gpu/drm/tiny/appletbdrm.c is a new driver...

But this time there is a conflicting patchset which is reworking
the entire lib/test_printf.c file, see
20250307-printf-kunit-convert-v6-0-4d85c361c241@gmail.com
And it will likely be ready for the next merge window as well.
I am going to review it right away.

It is even more complicated because the patchset converting
the printf test module to KUNIT depends on another changes
in Kees' tree (moving kunit test modules to lib/tests/).
So it might be easier when it goes via Kees' tree.

And it might be easier when even this patch goes via Kees' tree.

My proposal:

I suggest to separate the fourcc_pointer() test update
to a separate patch and add it later after the merge window
when things settle down.

I mean to send the vsprintf.c, checkpatch.pl, and doc update
via DRM tree together with the new appletbdrm.c driver.

And update the selftest later when both DRM tree and KUNIT
update reaches mainline.

How does that sound, please?

Best Regards,
Petr
