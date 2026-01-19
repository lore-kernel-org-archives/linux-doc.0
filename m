Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7D8369988;
	Mon, 19 Jan 2026 13:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768829178; cv=none; b=b6zxaijDLMivxXFUcjfndemCPUZZjBNaX7pDhWnaE2HiIcsMz2U13f3WQh2C/ThZH3oqG2OQmRNRtR5W64YYuL2p8E27e/6m2wuxUKwkxLY6OJ+YjV8glHFhQSJqyEqRMEFlLIk1C0htIrAQ6WYsTkyQZmiQQYy1bHqLiqCkH4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768829178; c=relaxed/simple;
	bh=7wxKRnRov6rRr5k9pbQkiLIuW67DB6FJ9bnmrV4eGzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kjRFAN2JqsVVg6xU3jYs0OtM5OobIrbW7vztPN54EhtR69nhrI2Qd2rcAoAKnqQ9eSQUPhWAQFtctAYto+n8k/rWXzf34vtijNLw1Ycts/7ROAdvxWhZo4cPe0v5jmR7Ovg+kxdrrONaNuQ7oL/FLCe83VjaKBLlQohUc3hT7AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=JBGVvVwM; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="JBGVvVwM"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id F334240E01A9;
	Mon, 19 Jan 2026 13:26:08 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 2yovy3YDcIry; Mon, 19 Jan 2026 13:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1768829162; bh=GH0orYiXKHRqf1gR91cC3HPL00358IkadtImZq1Nj9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JBGVvVwMy00SxUZChghS13vHL4vAZRXORlt51NA72pGi+lK52B5GNUpLiu/8sFobw
	 R6v2vxpjSQ+iSFbIkF4b8O0ju4O76CQuuZvU0Mcksq/eLajhDyv48C/xG+yN3yteCw
	 ueuTEMI1qvu8iRb//6aeji5M0a6LOAiw/j2SDDR6TguObfx8c5ZaehmX+EmV/K6DT1
	 /CFMS1yDXE9qIw7cs2iQUyQ9FXuZH7Ow9IvfGDJEFy6DsolyYWa1lem7EK8ttBh5TH
	 YNDmXonjw5lQ6fuVesjugXdCbwt8KVHnpuZXFxetmPzqFjyzimBGCWF3G1wOzwUd13
	 ujHx42s1DeL5TQzrgGcW65UzztvDRGILQWMWyBfy6TpjAbABFN5yFi3MOVF5P84glT
	 JyQYgd9Y+rUJJWqQaRjXXxXjOtYn8cmUZDGGqBznKm7ikzi9rK18/WJqtTeBddypoZ
	 pn1AqYUw+lsyqaObt4xdhWuxiSeVFgYJd+MLSZkACnAgohZJZAOReOiyKQOBe0JgoO
	 DgxcAbnPhbv8jgJZNZleZUJahz4X5jnCpuEn5kEiJhf5bU+DeAg1BeSe4ngCIBAFZ1
	 9/woXW7sCt7Poi6351dAO/S4MMPSs01DsHZvq1SjiwhNYMunvAXzZUB3czjd/bdU2P
	 S9/SnPTxak/z653Mxe80SKp0=
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 4065E40E019B;
	Mon, 19 Jan 2026 13:25:32 +0000 (UTC)
Date: Mon, 19 Jan 2026 14:25:25 +0100
From: Borislav Petkov <bp@alien8.de>
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: corbet@lwn.net, anna-maria@linutronix.de, frederic@kernel.org,
	tglx@kernel.org, mingo@redhat.com, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
	pawan.kumar.gupta@linux.intel.com, feng.tang@linux.alibaba.com,
	kees@kernel.org, elver@google.com, arnd@arndb.de, fvdl@google.com,
	lirongqing@baidu.com, bhelgaas@google.com, peterz@infradead.org,
	brgerst@gmail.com, kai.huang@intel.com, benjamin.berg@intel.com,
	andrew.cooper3@citrix.com, oleg@redhat.com, neelx@suse.com,
	sean@ashe.io, mproche@gmail.com, chjohnst@gmail.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/idle: Mark "idle=poll" as deprecated
Message-ID: <20260119132525.GCaW4wxSTvuW1ttufF@fat_crate.local>
References: <20260118231009.3194039-1-atomlin@atomlin.com>
 <20260119102116.GAaW4FnNBECNPFzAW3@fat_crate.local>
 <lv4j25eogwjct5bzy76doh2thucpnqcqlpblbw3etmdrlc5rfq@3svjujqwisii>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <lv4j25eogwjct5bzy76doh2thucpnqcqlpblbw3etmdrlc5rfq@3svjujqwisii>

On Mon, Jan 19, 2026 at 07:41:20AM -0500, Aaron Tomlin wrote:
> I will investigate the possibility of implementing a boot-time parameter
> for the PM QoS subsystem to bridge this gap. This would provide the same
> immediate enforcement as "idle=poll" while retaining the runtime
> flexibility of the QoS framework.

No, if what you claim is a valid and actual use case, then all it needs is
documentation. Everything else is unnecessary.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
