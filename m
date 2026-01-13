Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACCF2C236B;
	Tue, 13 Jan 2026 16:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768320675; cv=none; b=YHgqAjpN+OFpYa2ml5Hq0C4ddJarGej7fy9+cu4Fq0yEn067b/yMoJvdkDbS7IWGaj7EdJmkvhEd3YITD2U+zwQWDOBnKJd9HZcNEN/MGb5a8qvQh06wIrA3nA7G5sa4rMw1S3lDAAaL5N9Nv82f9ghX0XkJ4qijILU6cw/+Avg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768320675; c=relaxed/simple;
	bh=3WCmnmF9kWNfqsWhsoDfNg8qyj9qzP7SnFC6UiFAAoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9vUWQcydY1tZIYf1pm8u1u5JoDbjonp4JoYpcnNLhf35R1hhdvg3XSkBnz4nul8moMFP3A3nNBehHbI1WBkOfTSAEa38AL6qkulVlB9+lrRPIiKL6K9pep6e957xdwNciqlRx/QFtFcErTbL9EIVGQJoxKCrcxa4Sz7UHy/9zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=LE51GYz2; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="LE51GYz2"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id EA9DE40E0252;
	Tue, 13 Jan 2026 16:11:10 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id AbHLtSQcmX6m; Tue, 13 Jan 2026 16:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1768320667; bh=5I3NLHg1N9Vs+cPMd8JSUsoS7ZWc7H5v0Q1JxudllUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LE51GYz2J63/fCbecbhBrahwlb81dFvqJo+oSmOn8mSbptMaxioZMZIMFT3co5wDx
	 ayxOF2VQ5sJ8HuWl+MqO2a1G3MdRP9FYCt3TV2ZOiJikw2OGdsejm6dmn3PqNA8pkH
	 aXkZnqct8tfltUfuRnsjqFgvr5HCBPohZgLKMcMM8gDEwDF7T4QrPZhd/p2+jEGknb
	 rV05XBA6YFolWKK1Fnudl4+NoxmzqsHSoRxRfZHQkgwh9i0X6YZpyCWAyMMimwIQoh
	 SgRXAOsiHjACMqzYErUTQFqhp90ypliDEAHRhHK/faYw/MgB8THXmorqisH/SNojbB
	 iI+dZrIfLIc5dpr+G5IvMFP9DhuI+QxIJ/F54JMbh5kCu+1HujRJiIMQZ9fr8EeTob
	 pcFi1XPBYBH7zk/AZrXpCZHEj3yuysYIurRb9HRVvJdVLy2ZuYSIrxBEnsB7o2x/kw
	 bIgkd6zkH995aYdTGJi6YNypkZo6VJ+EIt5tgq6D94x1SiIB6WAonz1Hpybi9oGnX5
	 hmGnhzPyFpQqJiOrEo/cOwg0N+ZlEvc+pkn+854pfOd5oKCDHgab3/Rw0Z2uM5ygwZ
	 EnTjXqRdj48U+PcG3RX7OqXL4RlIJCOwX+Zp4qB4l8YJVve5WSjith03XQXTONB2Pu
	 1YVS/peFA8MjXiFge1mITYNE=
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 592E140E0028;
	Tue, 13 Jan 2026 16:10:48 +0000 (UTC)
Date: Tue, 13 Jan 2026 17:10:47 +0100
From: Borislav Petkov <bp@alien8.de>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kasan-dev@googlegroups.com
Subject: Re: [PATCH v8 14/14] x86/kasan: Make software tag-based kasan
 available
Message-ID: <20260113161047.GNaWZuh21aoxqtTNXS@fat_crate.local>
References: <cover.1768233085.git.m.wieczorretman@pm.me>
 <5b46822936bf9bf7e5cf5d1b57f936345c45a140.1768233085.git.m.wieczorretman@pm.me>
 <20260113114539.GIaWYwY9q4QuC-J66e@fat_crate.local>
 <aWZlpjwMXgdtZGMQ@wieczorr-mobl1.localdomain>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aWZlpjwMXgdtZGMQ@wieczorr-mobl1.localdomain>

On Tue, Jan 13, 2026 at 04:00:47PM +0000, Maciej Wieczor-Retman wrote:
> The two added lines are two alternative ranges based on which mode is chosen
> during compile time. Is there some neater way to note this down here?

Explain it with words. Perhaps put a footnote or so. Say that those are
alternative ranges so that it is perfectly clear to readers.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
