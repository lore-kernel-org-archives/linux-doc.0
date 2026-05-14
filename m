Received: from relay1-l.mailbaby.net (relay1-l.mailbaby.net [206.72.200.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702E73793BF
	for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 09:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=206.72.200.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778749348; cv=pass; b=h6ESQC3MhCFNG/UybwMNeNiKtBoYcXHO0a8VLhD0heww8EJk2vXX+6mJi5grofCF2vXDzAV7bC12TGPU00bs9uTczcymV64QlOVKK3gcjcL19LZUkxKR0ZuP1Gqj1OWsj8rbynCm3E6N8w66FkzP7QbIkn41VhfXcMXy0vlfvTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778749348; c=relaxed/simple;
	bh=OM331luqtzgzD0Pa/1i7KFTOJiaVKtWAYKURZzb4dds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FcwqL08MgcUP8iblukRRUVfE58Lpctjcg++yaTMUUPliTgbo6AWNXXTk1TJzsKEaw+Cmgv3Yg9nijfRs7foe4ZWMFqmwCwKvvgHhLgAXJ1xLVTKwblT4ZAHq1rGVOT7JAz4/PriweUGZ/DO1qHF2jv9OyyUQp3YX/pxtk1gZTfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=mailbaby.net header.i=@mailbaby.net header.b=e5Duhywj; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=OzyV6/GH; arc=pass smtp.client-ip=206.72.200.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailbaby.net header.i=@mailbaby.net header.b="e5Duhywj";
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="OzyV6/GH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbaby.net;
 q=dns/txt; s=bambino; bh=InLGDIT8AG1PYX/0ChWYqK4BET1HU2I+aXVqffTU8pA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=e5Duhywjy3a1GDinyg3Va1YqJdD+8ZGpsJGV7gqSi7jgkS1fF1tSILC5QlNtJVl3azaLndC9E
 uef9iP/WdYZGDRRXBMkux+E4KMzybhOm7SNa5zuImh0K/V2rTRc+mt487+URGQQtPb48+fRf5pM
 JW40C5QIEaNqNUZ3qe/auM8=
Received: from mb-nj-kvm1.internal (mb-nj-kvm1.internal [10.10.2.10])
 (Authenticated sender: mb86144)
 by relay1-l.mailbaby.net (MailBabyMTA) with ESMTPSA id 19e25b4070a000e4a6.001
 for <linux-doc@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 14 May 2026 08:56:55 +0000
X-Zone-Loop: fa1844efbf7f81ef2c8dc4dcb1708f0253c800150d68
ARC-Authentication-Results: i=1;	rspamd6.mailbaby.net;	auth=pass
 smtp.auth=mb86144 smtp.mailfrom=wangyuli@aosc.io
ARC-Seal: i=1; a=rsa-sha256; d=mailbaby.net; s=detka; cv=none;
 t=1778749016;
	b=K6hJpeIzwTNl9HOotvuNW05qsTsA9uoF3LRu9/xcywVhcVkJWJiMQ0cJw958lojdi8W3JU
	fDImRIUIqWlvCYC8KAkbOuCXnDA6PkmDJH2r/ywpGwmN2hdsGEi4D08r6wAvLktrEZol6J
	tvM7ZUeX19ZoK+ZTZnnh03zLSXvtVlR061wDdK/BXrlOnJpC51ydUqUjXh6e5XSHDiKwkr
	gtGlTQRFnDd4DhxsGL7Cph9Iw+waKs9v0glL4U3e1fLISJYQnvAV2gLSlMKc73I1TIJuS5
	AKgn17NRadFzy8ZkVm/AYnvjsucXHAHRq921v0BQbKTz/h0MiGKGgEAeoVDjGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailbaby.net;	s=detka; t=1778749016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=InLGDIT8AG1PYX/0ChWYqK4BET1HU2I+aXVqffTU8pA=;
	b=l8DU+yiwf2EkFC2Qi2rfEP86qXGRawACJg7zVSkgxdtYz89n8li0xxpbvJPzuTWI8ipiz9
	wK2VBliPximvDRvHVi9A/dcVfbZydNdLEJkrUY9E1aQXU6DCmrhhoBxrqxeIVhwzWxQeZ9
	3jPZFDaL2vSDaUl/o9QN+jCy3njp9pXQcXLL4GduWRvntFONgPzrV03+cB9Db3LSOx/n/k
	OJ9tcpg2GRjX8hU7WESv7sXy2ewGGsC0h3gMwmSY/maCOAmTChGOVhmUvUyJq6iuENZwUv
	2JC5Eu/Vm+Jiy2ZBaDvHsPmM6GQFhhu3da+J56rdjwnT5LvOVEC4ruLzHSPwqg==
X-MB-ID: mb86144
X-SPF: pass
Feedback-ID: mb86144:19e25b:587f4d465843594778405947455d:mbaby
X-MAILBABY-ORIGIN: PASS
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [217.182.113.132])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id 0BF90207A2;
	Thu, 14 May 2026 08:56:46 +0000 (UTC)
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
	by relay2.mymailcheap.com (Postfix) with ESMTPS id 901183EB97;
	Thu, 14 May 2026 08:56:37 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf1.mymailcheap.com (Postfix) with ESMTPSA id 51632400D5;
	Thu, 14 May 2026 08:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1778748997; bh=OM331luqtzgzD0Pa/1i7KFTOJiaVKtWAYKURZzb4dds=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OzyV6/GH4HZdjIxOtXKvg6XyP3ftPRpjtoCEPUhHPRt3R1r8OkxtQTyTTLrqeKTn/
	 16vodbbgb9uLE3Q1bO+/Gql77TTl0lehKCnguI5/aEDCAKoICvXu02tr0lewfsckKK
	 MhdLVlJ3WN37nIGtkunY+pdC1v0lqgL6Swr3RKkc=
Received: from [10.148.84.248] (unknown [223.160.130.158])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 03226410A6;
	Thu, 14 May 2026 08:56:33 +0000 (UTC)
Message-ID: <e2cced37-58ea-4678-a586-97f9a6db7e9d@aosc.io>
Date: Thu, 14 May 2026 16:56:30 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] docs: reporting-issues: replace "these advices" with
 "all of this advice"
To: Chen-Shi-Hong <eric039eric@gmail.com>, linux@leemhuis.info
Cc: corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260514082808.655-1-eric039eric@gmail.com>
Content-Language: en-US
From: WangYuli <wangyuli@aosc.io>
In-Reply-To: <20260514082808.655-1-eric039eric@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.30 / 10.00];
	R_SPF_ALLOW(-0.10)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	R_DKIM_ALLOW(-0.10)[aosc.io:s=default];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[aosc.io,quarantine];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,leemhuis.info];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	LOCAL_OUTBOUND(0.00)[];
	DKIM_TRACE(0.00)[aosc.io:+]
X-Rspamd-Queue-Id: 51632400D5
X-Rspamd-Server: nf1.mymailcheap.com
X-Rspamd-Action: no action

Hi Chen-Shi-Hong,

On 2026/5/14 16:27, Chen-Shi-Hong wrote:
> "Advice" is an uncountable noun, so "these advices" is grammatically
> incorrect.
>
> Replace it with "all of this advice" instead, which keeps the sentence
> grammatical while also making it clear that it refers to the full set of
> recommendations in the paragraph.
>
> Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>
> ---
> v4:
> - move version changelog below the "---"
> - send as a separate thread
>
> v3:
> - resend against the original base as requested
> - replace "these advices" directly with "all of this advice"
>
> v2:
> - use "all of this advice" based on review feedback
>   Documentation/admin-guide/reporting-issues.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/admin-guide/reporting-issues.rst b/Documentation/admin-guide/reporting-issues.rst
> index 16a66a1f1975..87dd874fffcf 100644
> --- a/Documentation/admin-guide/reporting-issues.rst
> +++ b/Documentation/admin-guide/reporting-issues.rst
> @@ -129,7 +129,7 @@ After these preparations you'll now enter the main part:
>      situations; during the merge window that actually might be even the best
>      approach, but in that development phase it can be an even better idea to
>      suspend your efforts for a few days anyway. Whatever version you choose,
> -   ideally use a 'vanilla' build. Ignoring these advices will dramatically
> +   ideally use a 'vanilla' build. Ignoring all of this advice will dramatically
>      increase the risk your report will be rejected or ignored.
>   
>    * Ensure the kernel you just installed does not 'taint' itself when
> @@ -795,7 +795,7 @@ Install a fresh kernel for testing
>       situations; during the merge window that actually might be even the best
>       approach, but in that development phase it can be an even better idea to
>       suspend your efforts for a few days anyway. Whatever version you choose,
> -    ideally use a 'vanilla' built. Ignoring these advices will dramatically
> +    ideally use a 'vanilla' built. Ignoring all of this advice will dramatically
>       increase the risk your report will be rejected or ignored.*
>   
>   As mentioned in the detailed explanation for the first step already: Like most

Reviewed-by: WangYuli <wangyl5933@chinaunicom.cn>

I searched the kernel tree for the misspelling "advices" (the word
"advice" is uncountable) and found the following occurrences:

"

   >rg-i "advices"

tools/perf/trace/beauty/mmap.c
   68:       static DEFINE_STRARRAY(madvise_advices, "MADV_");
   70:       if (behavior < strarray__madvise_advices.nr_entries && 
strarray__madvise_advices.entries[behavior] != NULL)
   71:               return scnprintf(bf, size, "MADV_%s", 
strarray__madvise_advices.entries[behavior]);

tools/perf/trace/beauty/madvise_behavior.sh
   6:printf "static const char *madvise_advices[] = {\n"

tools/perf/trace/beauty/fadvise.sh
   6:printf "static const char *fadvise_advices[] = {\n"

tools/include/uapi/README
   26:  static const char *fadvise_advices[] = {

tools/testing/selftests/mm/process_madv.c
   125: * on a remote process, other advicesare difficult to verify 
reliably.

tools/testing/selftests/mm/pfnmap.c
   175:int advices[] = {
   187:/* All these advicesmust be rejected. */
   188:for (i = 0; i < ARRAY_SIZE(advices); i++) {
   189:EXPECT_LT(madvise(self->addr1, self->pagesize, advices[i]), 0);

drivers/ata/pata_sis.c
   13: * Daniela Engert: for initial ATA100 advicesand numerous others.

drivers/md/dm-vdo/message-stats.c
   234:write_u64("dedupeAdviceStale : ", stats->dedupe_advice_stale, ", 
", buf, maxlen);

Documentation/admin-guide/reporting-issues.rst
   132:   ideally use a 'vanilla' build. Ignoring these adviceswill 
dramatically
   798:    ideally use a 'vanilla' built. Ignoring these adviceswill 
dramatically

Documentation/usb/CREDITS
   118:  evaluation boards, specs and valuable advicesduring

Documentation/scsi/ChangeLog.sym53c8xx
   415:  my questions and for his interesting advicesand comments about
"

If you intend to fix this misspelling, please consider sending a
single patchset that corrects all of these instances across the tree
and adds "advices" to scripts/spelling.txt.

That waycheckpatch.pl <https://checkpatch.pl/> can catch it in the future.

Thanks,

---

WangYuli




