Received: from mta1.migadu.com (out-201.mta1.migadu.com [95.215.58.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CC212AAF1
	for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2026 13:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331172; cv=none; b=aryqdAezcDxqFY3Drom7N4BOoxBRSkNkdckn6gHLs7TjrdjPZanx0DuBQC6xZQ1nLT1D51NdJo7kHyHWvtiujvSlz40HKF0D+KdI+6SWMk5OwFzuhtdQCc8raSivoqdP6jlQKkirj2IzgPi84HYUlyA4KjwUcjTYwZIgm8wOGS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331172; c=relaxed/simple;
	bh=JzIcJHzHMVjfXxwn7Jz6JzobbGD+KEgGPZQVmSvW38s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jAWaD+CmXgOHXxTxG2bcY1Ql+Vi90KG9kX4vy0B92LOCcX6e5hZBli+WxXaDVzEhCWeYtTP9zwNIiwA5e+JSfF2KOJcoqJSD6/34njBJJMb3HEPnhTYvEsMVpg88XIjWjsDvj76YpVKHqUsn0bdOseHqURvvgOqVIF73IA08QOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=MTItRupQ; arc=none smtp.client-ip=95.215.58.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="MTItRupQ"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JzIcJHzHMVjfXxwn7Jz6JzobbGD+KEgGPZQVmSvW38s=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792331166; v=1; x=1792935966;
 b=MTItRupQz22Tm48o2dHY1pd7lr4F0AmSAMrnpikXWIQXdfinjyUdP65JwRm05ZIv2mQuCOkR
 QSTqfyLIwb5tn3Pv64EiRY6WcVOKw2GhP/snULr7nquacXSx+Mz/DlCgMPxXIk0o76zC7pZQokH
 oyq+n/n4iA3y2LGjRUtd6DvQoloDFSjT46U8S4NMBXfHdjYXeUKjbd+DRX8R/tFNlCRtmI5sqI4
 jMjnfrZ5Urec4yjFZzF+LeQMRVHj7VJMfkxpr7KIu4pXNlbOV63ddaRYTzTj3ZU9OhXVL5KL/tB
 lsqhhkY5SW4QzyPhIp5NUYN7s6ZU+tUr7lSA1e7lA2Xpg==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 661a52f8541ff91e;
	Sun, 18 Oct 2026 13:46:03 +0000
X-Mizu-Trace-ID: 661a52f8541ff91e
X-Migadu-Flow: FLOW_OUT
Date: Sun, 18 Oct 2026 21:45:53 +0800
From: Weijie Yuan <kernel@wyuan.org>
To: "wpeterYY@outlook.com" <wpeterYY@outlook.com>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"alexs@kernel.org" <alexs@kernel.org>,
	"si.yanteng@linux.dev" <si.yanteng@linux.dev>,
	"dzm91@hust.edu.cn" <dzm91@hust.edu.cn>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQw==?= =?utf-8?Q?H?= v2 0/5]
 docs/zh_CN: add fault-injection Chinese translations
Message-ID: <atTNkdCp3TUJdG5t@wyuan.org>
References: <SI2PPFCA6543649A0CB710CDA1CA17757DDDD992@SI2PPFCA6543649.apcprd04.prod.outlook.com>
 <SI2PPFCA6543649026B29FF8D47801DCE66DD992@SI2PPFCA6543649.apcprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SI2PPFCA6543649026B29FF8D47801DCE66DD992@SI2PPFCA6543649.apcprd04.prod.outlook.com>

On Sun, Oct 18, 2026 at 02:10:52AM +0000, wpeterYY@outlook.com wrote:
> Hi Alex and all,
> 
> A quick note on the submission format: my email provider (outlook.com)
> has SMTP/IMAP client authentication disabled, so I can only send mail
> through the webmail interface, and changing the subject line of a
> reply detaches it from the original thread. As a result, the patches
> in this series appear as separate emails instead of a single thread.

Aha, I remember that back to 2016 in Kernel Recipes 2016 - Patches
carved into stone tablets… by Greg KH, he said that Exchange and Outlook
are known to corrupt patches. I don't know if we can do it or how to do
it now, a decade later. ;-) Because I do remember recently I saw a patch
is sent with outlook.com and seems to be able to be applied cleanly.

Here comes the interesting part:

# on Jon's docs-mw branch
$ b4 shazam 'https://lore.kernel.org/linux-doc/SI2PPFCA6543649A0CB710CDA1CA17757DDDD992@SI2PPFCA6543649.apcprd04.prod.outlook.com/'
Looking up SI2PPFCA6543649A0CB710CDA1CA17757DDDD992@SI2PPFCA6543649.apcprd04.prod.outlook.com
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 3 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Analyzing 0 code-review messages
Checking attestation on all messages, may take a moment...
---
  ✓ [PATCH v2 1/5] docs/zh_CN: add fault-injection index Chinese translation
    ✓ Signed: DKIM/outlook.com
  ERROR: missing [2/5]!
  ERROR: missing [3/5]!
  ERROR: missing [4/5]!
  ERROR: missing [5/5]!
---
Total patches: 1
---
WARNING: Thread incomplete!
Applying: docs/zh_CN: add fault-injection index Chinese translation
Patch failed at 0001 docs/zh_CN: add fault-injection index Chinese translation
error: patch failed: Documentation/translations/zh_CN/index.rst:74
error: Documentation/translations/zh_CN/index.rst: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am --abort".
hint: Disable this message with "git config set advice.mergeConflict false"

# i.e. [1/5] can not be applied successfully.

$ git am --abort

$ b4 shazam 'https://lore.kernel.org/linux-doc/SI2PPFCA6543649423BA7595B9B6BF31774DD992@SI2PPFCA6543649.apcprd04.prod.outlook.com/'
Looking up SI2PPFCA6543649423BA7595B9B6BF31774DD992@SI2PPFCA6543649.apcprd04.prod.outlook.com
Analyzing 1 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Analyzing 8 code-review messages
Checking attestation on all messages, may take a moment...
---
  ERROR: missing [1/5]!
  ✓ [PATCH v2 2/5] docs/zh_CN: add fault-injection Chinese translation
    ✓ Signed: DKIM/outlook.com
  ERROR: missing [3/5]!
  ERROR: missing [4/5]!
  ERROR: missing [5/5]!
---
Total patches: 1
---
WARNING: Thread incomplete!
Applying: docs/zh_CN: add fault-injection Chinese translation

# i.e. [2/5] can be applied successfully on top of Jon's docs-mw branch.

Perhaps I need to see if there's anything I did wrong.

Thanks.
