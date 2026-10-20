Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792508272;
	b=gLbpC4kGrNSAdCnB9i0rrb+Sbs4R/mMUjDqBLGGFDOzAIpDy1RBW9zmOaIzYOCeGm9iP
	 422bmc2vs73e5JBf2Izs43pn0GUtfm9tSgH1y+6LuFWQAqYJk7memnzxHra5YQqWQX/1q
	 ncHwQYydKnBhlPz5tzgihxijI2tPSIDGiqB42aQ04kkAiuXCrHA6W56TU+Ih597Sp29OT
	 PONNaoxWlgHNIhrSvrCACdvIlnynq5R0ucrdue6MoJ+0jmEC73BnaEJN6sG0XThqzBsZn
	 RuNf9LpdE/g204XwsjxBeh2DyRLBCc5zJMM6fOBO+zy284kj9AdPuxQIM4/o7Lxv2Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792508272;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=npNbn/zUqvs8APILcGcY/6iaNnpBHEF2ZDFPVoYA5ZM=;
	b=E/Q7t0Dn/zomiFfrS2KHWmFn4EgSS+qBezq21OJv4/I6kMksB3YkVenWGqCGvZEnKYME
	 qAuhggfKAJe0LCEusNM8eByLAcGRtV+IrBuwTgOYPGxYycgTPwLNfx7wXSXTHUrrRqRGU
	 X41WdqCHi/VPupsCERhbUsakit4YYYuujGERfRlW2MIZhEDF8iTZ39AqueyjeVHkAKTm1
	 jGUmdcai9o1bGjjn+R+UPJjrGIhu6jDtwyAW7gUVKhrcz2l6HDmKG0vJM+uv8mmbKhFTM
	 F252fjb0JQKs37BvgeWmCLzGBngRWO8FZfue4P/10MzvDp7VSf08IhZG2ZpobJBoaOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=xQPelZPj;
	arc=none smtp.remote-ip=91.218.175.32
Received: from mta0.migadu.com (out-32.mta0.migadu.com [91.218.175.32])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F065606A31A
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 14:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F065606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=xQPelZPj
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=De5buFFm/5fTyVWoC5qqnB2WSV4nsavYX00IngQ4YDE=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792508269; v=1; x=1793113069;
 b=xQPelZPjdQyyFAt5sD8iyxLj32qKV8ullFG+80D4HnYT8vtA7UDGnTyJtwl87u8vKOQ/bZC3
 w3QSgjkQZFPS3rWcHbXKfWAHhsemqKShZjIX9ZcW7JKtJSOY+YEQQbk+etcPV0sLitE2jCK44Ku
 +0bc63T7Th0XvKcM1GuWCkC3xp4WN5aIueedVZaeCVoVA5v0ZG4xhEFrtrHfbqvMU4/VurofwFP
 FQykFB0tFzFmH3TPTsdg1CBE8eiLNRStaPAPfmxpbAbjK5tReQWvT9+H6u8E4joIWAg850AZ88p
 T3zNuHaDCpc8EsquXltZYYYbzRtOzc1AgCd8/mROQoaXg==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 097e3e13253d0852;
	Tue, 20 Oct 2026 14:57:49 +0000
X-Mizu-Trace-ID: 097e3e13253d0852
X-Migadu-Flow: FLOW_OUT
Date: Tue, 20 Oct 2026 22:57:45 +0800
From: Weijie Yuan <kernel@wyuan.org>
To: "wpeterYY@outlook.com" <wpeterYY@outlook.com>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"alexs@kernel.org" <alexs@kernel.org>,
	"si.yanteng@linux.dev" <si.yanteng@linux.dev>,
	"dzm91@hust.edu.cn" <dzm91@hust.edu.cn>
Subject: Re: =?utf-8?B?5Zue5aSNOiDlm57lpI06IFtQQVRD?= =?utf-8?Q?H?= v2 0/5]
 docs/zh_CN: add fault-injection Chinese translations
Message-ID: <ateBaUY2VAlwzUjK@wyuan.org>
References: <SI2PPFCA6543649A0CB710CDA1CA17757DDDD992@SI2PPFCA6543649.apcprd04.prod.outlook.com>
 <SI2PPFCA6543649026B29FF8D47801DCE66DD992@SI2PPFCA6543649.apcprd04.prod.outlook.com>
 <atTNkdCp3TUJdG5t@wyuan.org>
 <SI2PPFCA654364914AAE6CC5F7595F16487DD672@SI2PPFCA6543649.apcprd04.prod.outlook.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SI2PPFCA654364914AAE6CC5F7595F16487DD672@SI2PPFCA6543649.apcprd04.prod.outlook.com>


Hi,

On Tue, Oct 20, 2026 at 11:40:54AM +0000, wpeterYY@outlook.com wrote:
> Hi,
> 
> Thanks a lot for testing the series with b4 - that was very helpful.
> 
> To clarify two points:
> 
> 1) The "missing [2/5]..[5/5]" warnings are because the patches were
>    sent as separate (unthreaded) emails, so b4 can only assemble the
>    full series when pointed at the cover-letter URL. I'll resend v3
>    properly threaded so a single `b4 shazam <cover-url>` grabs all 5.

Yes. I saw your explanation below.

> 
> 2) The [1/5] failure is a real base-drift issue: I generated the series
>    against an older index.rst, and docs-mw has since changed. The patch
>    content itself is intact (DKIM signed, and [2/5] applied cleanly on
>    your tree), so it's not an Outlook corruption problem.

Oh, I should have taken the time to take a look carefully first, because
I originally thought there were no conflicts in the modified content
between the two branches.

> I'll rebase onto docs-mw and resend as v3 shortly.

Ah, sorry for misleading. I used docs-mw is just because I happened to
be on that branch. But actually we want to make our work based on Alex's
docs-next branch.

Thanks for your reply!

