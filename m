Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B133BBFB4;
	Sat, 22 Aug 2026 09:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787392300; cv=none; b=a6z9V7ZyZQrqVT/lSNnT4tcnnz13R17C4lmczP+Ug9xClzSDyvtGtXSmmaJjDhwsxILqUcy+8N+gMyqkJ0Stg6pR3GQtDhstWK7MeDCPgTdQ3gmVM8d8llzDifCsK051nNOBzMzpW1diUt7T0LrknOvgZgsn+Lwjx4mm7R9Sf8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787392300; c=relaxed/simple;
	bh=zW5gVktdMz9JAjtMXj6C1HID1TSMro1NJ8yKW79SqLA=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=RmMrVXJCq2/4QEHce0Y8l3MZxoC+FIHhz+dULihhp/Q43F1L1Xbo+P+yP2LgAMh5pEOLOI2a7GXK6J74LwSGB8FctJNiqgyc8oz22hepavShWsKj4k+XTLEEuWFg/UhzCLOlVrxEa3y5VzUMYkVw8+0t1i5//rK0jBh+UF3S05I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hRsrc5Sstz8Xrnw;
	Sat, 22 Aug 2026 17:51:28 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 67M9pKOK063053;
	Sat, 22 Aug 2026 17:51:20 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 22 Aug 2026 17:51:22 +0800 (CST)
X-Zmail-TransId: 2af96a89711ab04-a9e84
X-Mailer: Zmail v1.0
Message-ID: <20260822175122673CMjaqFZBAcm-DUczLtnOP@zte.com.cn>
In-Reply-To: <20260804093703-ba9926fe-7b51-4e3f-8436-b6a83100dc45@linutronix.de>
References: 2026072415043227725SuvoyQ3SGDOmHLp8tdn@zte.com.cn,20260724150700955ST0xNghN8r7XiXr9PfwXH@zte.com.cn,20260804093703-ba9926fe-7b51-4e3f-8436-b6a83100dc45@linutronix.de
Date: Sat, 22 Aug 2026 17:51:22 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <wang.yaxin@zte.com.cn>
To: <thomas.weissschuh@linutronix.de>
Cc: <akpm@linux-foundation.org>, <fan.yu9@zte.com.cn>,
        <yang.yang29@zte.com.cn>, <corbet@lwn.net>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <xu.xin16@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2NCAyLzNdIHRvb2xzL2FjY291bnRpbmc6IGZhY3RvciBvdXQgc2hhcmVkIGZvcm1hdF90aW1lc3BlYygpIGltcGxlbWVudGF0aW9u?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 67M9pKOK063053
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Sat, 22 Aug 2026 17:51:28 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A897120.000/4hRsrc5Sstz8Xrnw

>> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>> +#ifndef _TOOLS_UAPI_LINUX_TIME_TYPES_H
>> +#define _TOOLS_UAPI_LINUX_TIME_TYPES_H
>> +
>> +#include <linux/types.h>
>> +#include <asm/posix_types.h>
>
>So the tools/include/ header are supposed to be platform independent and standalone.
>But this relies on an asm/ header which itself is not part of tools/include/.
>The addition of this header did not remove the dependency on system UAPI headers.
>
>So why is this new header copy needed in its current form?

Thank you for identifying this issue. We agree that `#include <asm/posix_types.h>`
creates an undesirable dependency on system headers.

The problem: System headers (`/usr/include/asm-generic/posix_types.h`) are outdated
and lack `__kernel_old_time_t` (a y2038 fix added in the kernel). Simply removing
the include would cause compilation failures.

Our fix (two steps):

1. Change `time_types.h` to use `#include <asm-generic/posix_types.h>`
   - This is architecture-independent: `asm-generic/posix_types.h` directly defines
     all POSIX types (`__kernel_long_t`, `__kernel_time64_t`, `__kernel_old_time_t`)
     without architecture-specific dispatching
   - This follows the same pattern as `types.h` which uses `<asm-generic/int-ll64.h>`

2. Copy `include/uapi/asm-generic/posix_types.h` to `tools/include/uapi/asm-generic/`
   - This restores the self-containment of tools/include/uapi/
   - The copied file provides up-to-date type definitions (including y2038 fixes)
   - No longer relies on outdated system headers

This addresses your concern by making `time_types.h` truly self-contained and
architecture-independent within tools/include/.

Thanks
Yaxin
