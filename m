Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335144BAA0E
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 16:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788626719; cv=none; b=ky5RyseLrQHgP7GkZpqPG2AF7wx7MdK+K97+swuUytupgdpRuOKJx7kCE5X/kXfGERULTWlWGrO9JA09e9/9YbYwVLJwpdBCvcJoNz8YpCGRzSW3fCHwDOHWMlJlWv33FSRQ1wvcRxg+6CTsCtSVEMijHG6+JHjUBG3DgJyIZXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788626719; c=relaxed/simple;
	bh=HdBAdLzSTzujbllvsJF4/4Myx4fdLg2P7yqQlusvX+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tB2BRckBYIi48JwXRq5G1h/fV0L3jQFmp/BI8VAkr9gDHFBOWCEQlZppHaOsnD31DxPLH9S1/DqITVNwaXMtPL2Hiux4mblZIkCbRiUVDe6HvKo43vvBNrle8UYfcbqP1I/xVEhr0SqknT25nVEpntyFD2qzXh0rA3llaaVUzHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QoMJbhFu; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QoMJbhFu"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49cd9add88aso14980695e9.3
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 09:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788626711; x=1789231511; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UXpqHFV2712rxC5fNse5LJiD7+paksBxEi1NQ+E0D5U=;
        b=QoMJbhFuOuG8l6M9kcfrHVchJ1sA3K8VcXX9sHvf4KV64ui0dqZaQxiP13c4DzV+y3
         fdHxrGqh+HvShOHBkUze9iFVPZc2XZ0BKvKC3w0bpzibmln+KdCt+djAvjhwwQok7KAJ
         QVCTXS0NY4sc/v3wkWMIJzk4gEIQZyCOIJtwiQ0NZAee3iof4zmjyV6zsT3oenkz+aoi
         2BA2sFly81BjCJIDe85e7qMbYebz0rDi6vAV6KtZlZFNimptRUva7tLy7K2CZw5WMXVt
         KeItXUCqt+TkAcCYntxr7XUou0LJ+WeVB4M/xSiJAUhgmTr+D3KsPffqZi76r06NH+b9
         pEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788626711; x=1789231511;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UXpqHFV2712rxC5fNse5LJiD7+paksBxEi1NQ+E0D5U=;
        b=TolEj6YKSkNsJo71vtv7PYnYOzw9owCFDlusjhPGzEnGJs0TAg/KeTg7K4P9AWFV9k
         3Lli6oNuGd+aZvRjR1xeHvyONYkLiSNr0UA1qOFsdOPCWhB6TPigZF0OfYy8UyXLXUb5
         Fy9W8qlxZW9hbbfnwDiDW474tXVFmZ6MZz0ijF0DokhJ1qldB/xMKg1Qhf0CoXLauWsH
         hVmIceS8Dir/WHaOkqc7LVpWJEhHSjlyNjRcbXvLM4H2OCt/YJi74jBvYi00RZCq67kN
         3DWTKiikr5ZT5Acq6fNxSVu5ir6VAnaMLvd3LfPr4Ya6KqM3wqTcFoSUPHBVwFuw1qas
         a1uQ==
X-Forwarded-Encrypted: i=1; AKwUvByhclap4wdU2qFhHG0T1pZTqd68x43F2lxC3CaJnJseUHdBTxnLlQpdWSi7YD17kw/RIAJWlyQ2YmM=@vger.kernel.org
X-Gm-Message-State: AFuF++kZP9Z/bmtkXM9kj70w94+rsLbJaIaoflF2L9ZJr+lq6rLYGHKx
	17sRbCiQOySNtBt+8tL92boN5fx77CLEwyH1Rxr0maK/p0/y9kSFQ/Jo
X-Gm-Gg: AYBFou0KsOiZA71a6mVtqrWkVfgiEmcijeI7TYbG8GFLcPiV9Kr+5v/TQT7MJd5aDcC
	O4sw9sRLLdebvvcsc93nZFXAiz7uOuknYeody9Qxz0t2PzwWSZE2GJzIPIaFlVAQ/02XoSHR7Hd
	fkWsm6J3RAwsPXIFgWfrXinh1X0PhLSM52EbDx6OW3jxDd4vFN7ANgvmzRbgRL4jst86uv+KYK2
	lCFm/QJZiDqYlsV3UvGZVvFnAyNE1dudtBJc1LdVGu9hQCpXTDKzWGkWrpUTMS/vSQGAnMltyTH
	6up7Ojso/8jlrtChmH/5IOEVOvn1kK4BFKGJFri1jLR4zx5tqVBwZW8DuwWcuaRWKVy0CbO7y5c
	oQlemO0ImwtOwSWzrE/lzQXaAkHeULnehyFa1IF0qlhBAUAlBSgVkWR5UAlfwLl7ZuWbbhuj9ej
	ZNcGpJ9rlfPinWa6FdBvGuI57zKW2AHjv5xiFr92S8TbcO4xJSlaY1YtLY1S/z177yBW91ZQ6oH
	Tffh5TX5I41osJkGWrYwyVDAb/eQOwcpxL9/C3rvS6zCVB3ey7qYhYuOIjRgNTV9lSugYBm1dZi
	Kvuqb8u5GjIWcV7KcaLAuEsuBajTsAHiIHd4BolJnbQ0/Q9ljYIhyMlO9SFw72XB
X-Received: by 2002:a05:600c:4e46:b0:49c:fc6e:8cb4 with SMTP id 5b1f17b1804b1-49cfc6e8e51mr106151725e9.24.1788626711320;
        Sat, 05 Sep 2026 09:45:11 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75ce49esm276714495e9.1.2026.09.05.09.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 09:45:10 -0700 (PDT)
Date: Sat, 5 Sep 2026 18:45:07 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Steve Wahl <steve.wahl@hpe.com>, 
	Dimitri Sivanich <dimitri.sivanich@hpe.com>, Mike Travis <mike.travis@hpe.com>, 
	Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Tony Lindgren <tony@atomide.com>, 
	Kevin Hilman <khilman@baylibre.com>, linux-omap@vger.kernel.org, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org, 
	Ethan Nelson-Moore <enelsonmoore@gmail.com>, Michael Schmitz <schmitzmic@gmail.com>, 
	Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v2 3/9] docs: kernel-parameters: Drop the edac_report=
 entry
Message-ID: <apxDtqM8UMN5KNjs@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
 <20260905094649.41996-4-kmehltretter@gmail.com>
 <20260905151345.GAapwxqT93wPWHF7u4@fat_crate.local>
 <apwzmSr6b0WEkW86@gmail.com>
 <20260905153336.GBapw2UFa7Sdc0ve_A@fat_crate.local>
 <871pb7zn36.fsf@trenco.lwn.net>
 <20260905162742.GCapxC_ra7hJd27LDR@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905162742.GCapxC_ra7hJd27LDR@fat_crate.local>

On Sat, Sep 05, 2026 at 09:27:42AM +0100, Borislav Petkov wrote:
> On Sat, Sep 05, 2026 at 10:20:45AM -0600, Jonathan Corbet wrote:
> > I would like to emphasize this - slow down a bit and maybe you won't
> > overwhelm the system entirely.

Got it.

> 
> I find myself telling more and more new submitters to slow down. Sounds like
> they don't read our documentation before submitting patches. Especially if the
> file is even called submitting-patches:
> 
> From: Documentation/process/submitting-patches.rst
> 
> Don't get discouraged - or impatient
> ------------------------------------
> 
> After you have submitted your change, be patient and wait.  Reviewers are
> busy people and may not get to your patch right away.
> 
> Once upon a time, patches used to disappear into the void without comment,
> but the development process works more smoothly than that now.  You should
> receive comments within a week or so; if that does not happen, make sure
> that you have sent your patches to the right place.  Wait for a minimum of
> 						     ^^^^^^^^^^^^^^^^^^^^^
> 
> one week before resubmitting or pinging reviewers - possibly longer during
> ^^^^^^^^

That's for "not getting any answers" which is not the case here.

Sending a vX update sometimes feels more urgent because you don't want other 
people to read your buggy old version. But yes, some patience is also good
there. 

Thanks,
Karl
