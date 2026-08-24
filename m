Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B013E3DBC;
	Mon, 24 Aug 2026 06:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787552640; cv=none; b=HgvNV5Xl6BTbEZoaMXzZQIAsESbiISRMlHKhD9aDx/n897bW2RZkRp4iR+lqroN94f+fd65dc+3ej53Oo4aI/BTsN4L0EvyjePnzuh6tkZAaNwhIFA5nm+zSHnkXURCH+27E17Wr3maF1VxN4aefDrCVDpOTGdxK3Jfxwv4x0b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787552640; c=relaxed/simple;
	bh=A2SrJF8Q7dzXvl1pjDG9EVHFIDaTeWF5vX+e7XkweWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dO7JAnSBG/WZ8v7SjfyATeOBOKlYx5aHXcSG/XKUjs3Sb80uGmfzPnBNXebkErcMmfdWVNpuMfyaNs1W4mfThYHbYXkYdcpolV9F/oNRdJo0gMlDr4SyrYyvaxckrC+LM5dzeskygdkE71Akf1Vu34058vgCPuFkUsdH/uo5wDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PPZzeWXa; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Tpn1xv+5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PPZzeWXa";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Tpn1xv+5"
Date: Mon, 24 Aug 2026 08:23:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787552630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dyVqDEcEt7MSxDz+orlYmxG7AJDTNB8egbizzZjJii4=;
	b=PPZzeWXavw/ac5d+JNLjtdXq3PEzEfrptCmiAAd4L3xHBH4Vdk9LwiVJbc6ed2w2Wyj+PO
	pjALa2dvnG9CBAYDHJwD6nQ/7VTaHZjtYyB2aAtGTT8HrNPPjZd321NIiSESf2/Eid079H
	s94dBsOtW+nYAkFKzBw8Xo3Ht1hngBEiYMuxx/1ze7FJNNgfiSQYA3wrceDwGlvxtvbWnI
	ERM89Ky1YWhUYSkGadwrJKWjCC1r8s3wBTjb5K00rdQD9ZRrcFbB1TsioB1QHPXblwJoEQ
	ZDBzE1lvo1GF2gbJc5wmJcuaQuU20EQpZmCWdFW/6nMXyDbxyhdm+gVqgR0CGQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787552630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dyVqDEcEt7MSxDz+orlYmxG7AJDTNB8egbizzZjJii4=;
	b=Tpn1xv+52+4mpksAvoUNWyZvNlNLOkCRmE2SyPyNzGdvLc1sb4J+hlWZeZmsD5ZlzYw5QQ
	3AsrJhSZqw/cUTCw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: wang.yaxin@zte.com.cn
Cc: akpm@linux-foundation.org, fan.yu9@zte.com.cn, yang.yang29@zte.com.cn, 
	corbet@lwn.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	xu.xin16@zte.com.cn, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 2/3] tools/accounting: factor out shared
 format_timespec() implementation
Message-ID: <20260824081329-eb7ca513-7418-4895-9fdb-dfe53fb3a0e6@linutronix.de>
References: <20260804093703-ba9926fe-7b51-4e3f-8436-b6a83100dc45@linutronix.de>
 <20260822175122673CMjaqFZBAcm-DUczLtnOP@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260822175122673CMjaqFZBAcm-DUczLtnOP@zte.com.cn>

+Cc Arnd

On Sat, Aug 22, 2026 at 05:51:22PM +0800, wang.yaxin@zte.com.cn wrote:
> >> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> >> +#ifndef _TOOLS_UAPI_LINUX_TIME_TYPES_H
> >> +#define _TOOLS_UAPI_LINUX_TIME_TYPES_H
> >> +
> >> +#include <linux/types.h>
> >> +#include <asm/posix_types.h>
> >
> >So the tools/include/ header are supposed to be platform independent and standalone.
> >But this relies on an asm/ header which itself is not part of tools/include/.
> >The addition of this header did not remove the dependency on system UAPI headers.
> >
> >So why is this new header copy needed in its current form?
> 
> Thank you for identifying this issue. We agree that `#include <asm/posix_types.h>`
> creates an undesirable dependency on system headers.
> 
> The problem: System headers (`/usr/include/asm-generic/posix_types.h`) are outdated
> and lack `__kernel_old_time_t` (a y2038 fix added in the kernel). Simply removing
> the include would cause compilation failures.

Thanks for the explanation.

> Our fix (two steps):
> 
> 1. Change `time_types.h` to use `#include <asm-generic/posix_types.h>`
>    - This is architecture-independent: `asm-generic/posix_types.h` directly defines
>      all POSIX types (`__kernel_long_t`, `__kernel_time64_t`, `__kernel_old_time_t`)
>      without architecture-specific dispatching

While it defines all posix types, these are not necessarily correct for all architectures.
If they were, we wouldn't need the whole asm-generic machinery in the first place.

>    - This follows the same pattern as `types.h` which uses `<asm-generic/int-ll64.h>`

int-ll64.h is special. It can't be used as an example here.

> 2. Copy `include/uapi/asm-generic/posix_types.h` to `tools/include/uapi/asm-generic/`
>    - This restores the self-containment of tools/include/uapi/
>    - The copied file provides up-to-date type definitions (including y2038 fixes)
>    - No longer relies on outdated system headers
> 
> This addresses your concern by making `time_types.h` truly self-contained and
> architecture-independent within tools/include/.

Please see my new concerns above.

Given that __kernel_old_time_t was introduced in v5.5 I am not sure if we still
want to support that old UAPI headers.
If we do, I think the better solution would be to add "typedef __kernel_long_t
__kernel_old_time_t;" to the tools/ header which needs __kernel_old_time_t.


Thomas
