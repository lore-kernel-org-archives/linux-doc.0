Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795350031;
	b=mPiRrNgO7h76GEOpzpMZ/M+xBZNYXN/Wd/jRf6PFxfS64FegJCSmKvIfNiIHxKhQIT+C
	 hjt+qHOqEl5uag5LVzFhShV3sbSD7VyU2hgBtNOkbE/RVr1tCq8TzMxM0pitrgGUcQnIC
	 XDxPRsLGThSsW6TA6dG9Gs4YT/WXSlQnBm6Xr8nbFwqHtnpOvKdOQqv2U+SHde6rn6May
	 5k1D0ePpwTVEXNx11BjuK2opy2l5vyXKOo4hQUS85J5k7XqQtFWipzqr8QBznjsdrm2gj
	 6Uc7jkkzYqEv+uhJ9ZI3rSiHUoJw1gVwOM20fPzCHziU6aeZRIMrmparijFqSulqfUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795350031;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=FOnlwEPRVDSIsjI1BQgdNU3ckkmgOp3nXPYLYgraTNg=;
	b=4UoRvikSCvDB9vwf5n4h/sQBgVbopF7y17hJNWcCfCNGlPCwjXIsX6SZW4CZIkoeKjap
	 iL6jlIxkCpXhYNw2uayNexcOFQ4AoOIZWumkXyQLw/BJ455gJ67IPmE9hl+XKB6P+5rB+
	 /AVu1kyvpxo3x4qT+hUQ2irDlg5j1RrkLxNWeKYcwKxMN000d6iKpAYXVblRWH5UySPX0
	 V8OEgVTXFyfAWx9YxApB7fOw0Iq5C+YQTuAkTEiNgHAcEieVwjxrYDcaEQLwPwA5hIPhA
	 gOBqgXkPOc3rp4315PDN4/FB4UTSGRUfGAXhCaFMYAtMbXdS+Kv6MVKL+XbDLaQPFlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=Xvfqeq7n;
	arc=none smtp.remote-ip=91.218.175.145
Received: from mta0.migadu.com (out-145.mta0.migadu.com [91.218.175.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1569D606A333
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 12:20:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1569D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=Xvfqeq7n
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yEmTU8Dvj9D/0s6N6A6U4VMXSzUJV5WSJIIUzIvHIoM=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795350028; v=1; x=1795954828;
 b=Xvfqeq7ndngszENiCq8rxg1staY4CXNRiwICyMM4polzoZYUTGJSBgxtIDDLokh3rdpFDLP8
 l954BrVvd983/fPleTVHkI1m4HW6DtdLKUVc7h6rY9JQFNXBlGf9VhYFMDMCiOfxzbBfxrp1AkS
 SBpeDi22KKJ1ZY6RKkMXvcP3RqlN8hsmmZhonoQpFM83T7siJ0Zmw2Sy0nxSlE6t3jqNswEE0AE
 coWXusSinGmHVZwwBAcf9kigOyJ/McPF7y00fu+khJH1KaBOn0q8MfQ6jX7Gk90LH0dcCGMgf5b
 Wm1zJXLti+LIQbvK0RRi4UN1LKgYyKlD+3LXqH9YdCBIA==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8d43b4d0ff3c3792;
	Sun, 22 Nov 2026 12:20:27 +0000
X-Mizu-Trace-ID: 8d43b4d0ff3c3792
X-Migadu-Flow: FLOW_OUT
Date: Sun, 22 Nov 2026 20:20:17 +0800
From: Weijie Yuan <kernel@wyuan.org>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: dreduardocruz@gmail.com, Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: pt_BR: submitting-patches: update LKML role as
 last resort
Message-ID: <awLeAd_x7yCNRafK@wyuan.org>
References: <20261119-pt-br-submitting-patches-lkml-v1-1-1c7170de926f@gmail.com>
 <CAMAsx6dNK3NjZvF-3wd9RH3dy3V7TiUoJJxnoLi0FPVn4eVJSQ@mail.gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMAsx6dNK3NjZvF-3wd9RH3dy3V7TiUoJJxnoLi0FPVn4eVJSQ@mail.gmail.com>

On Sat, Nov 21, 2026 at 11:06:49PM -0300, Daniel Pereira wrote:
> Em qui., 19 de nov. de 2026 às 09:22, Eduardo Pereira Cruz via B4
> Relay <devnull+dreduardocruz.gmail.com@kernel.org> escreveu:
> >
> > From: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
> >
> > Update the Brazilian Portuguese translation of submitting-patches.rst to reflect commit 3a198413bb71 ("docs: submitting-patches: make LKML a list of last resort again"), advising contributors to send patches to a subsystem-specific mailing list first and use linux-kernel@vger.kernel.org only as a list of last resort.
> >
> > Signed-off-by: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
> > Cc: Daniel Pereira <danielmaraboo@gmail.com>
> > Cc: Jonathan Corbet <corbet@lwn.net>
> > Cc: Shuah Khan <skhan@linuxfoundation.org>
> > Cc: Randy Dunlap <rdunlap@infradead.org>
> > Cc: linux-doc@vger.kernel.org

Hi all,

It seems that the commit message is not wrapped to ~72 columns..

Thanks.

> Hi Eduardo,
> 
> Thanks for the update! I'm currently working on a pt_BR glossary to
> standardize recurring terms like this across the documentation.
> 
> Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>
