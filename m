Received: from mta0.migadu.com (out-231.mta0.migadu.com [91.218.175.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507C035F18B
	for <linux-doc@vger.kernel.org>; Sat,  3 Oct 2026 14:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791037484; cv=none; b=LBPvn+8QRV6Ffk69jjGzYKxpFCOeU9EjXytq4eDNuRN2RyGBXYvSthB6wfZamcSrLFnJGz8FnA/EwmaRImiCs5Fxuf3YP8l1sQPEGCm+inkEU/eGfmKXVx1QUmQTjkCJHxouw6UsnXN3KaRJXe18+DBmyw3HosDr/ONyvrfXhhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791037484; c=relaxed/simple;
	bh=1pQTwGTEOYrVLPSMg1T+ZlkoNQLfO8VBMQicrt8OIYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JxcsfBa78XuABA7uoENaFQFzY5rAE5tnKymlPRnM+C50bflLhXV0L6M6WTMYqFPWNj9RqN0bNJ8wdI8O/chC7AB3Y6fXdKMhMvXNuj/GZQ8MG1CcuircgN/gTKmhLXbfTCi3N0/zDdDpZlPgjHHs7pwK8yq3nHVxzC7SiKXB5kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=P73C0ela; arc=none smtp.client-ip=91.218.175.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="P73C0ela"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1pQTwGTEOYrVLPSMg1T+ZlkoNQLfO8VBMQicrt8OIYM=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791037477; v=1; x=1791642277;
 b=P73C0elavRHobrTzPc7b9k0l+Ie4TdzByybgepdZB5999t40vE2JxO4J2BXFc+VgsVgw4JKt
 rB1SNO8b3CCmG+NhgkhRiI4ESHLsWl4fnTIdSgsA0EK7ED6W2U7E6qXwDPTaZ9gfb6sS/OP5hzP
 XuGYuXY3K+7NptWtZPUbh14CFE4t7UUbknuJUBTS9sYBn01yE9uHlenmKDUNpEQkmhqInVcgLlj
 MOIvw6XkfiGk8kAs+pu4yEuUJfhOQ5VwQgcn2iwguKIwvTc5wW1KMauIK0YRoVodo9OlitOTHXQ
 /6rv2ejn7mm6NC3y5mwh/XP017l5AiJ7gUUg2YIZe25VQ==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 58b5df2f8a1b9a13;
	Sat, 03 Oct 2026 14:24:27 +0000
X-Mizu-Trace-ID: 58b5df2f8a1b9a13
X-Migadu-Flow: FLOW_OUT
Date: Sat, 3 Oct 2026 22:24:20 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Jiaming Ouyang <jiamingouyang13@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	alexs@kernel.org, corbet@lwn.net, Dongliang Mu <dzm91@hust.edu.cn>,
	si.yanteng@linux.dev, skhan@linuxfoundation.org,
	gregkh@linuxfoundation.org, rdunlap@infradead.org
Subject: Re: [PATCH v3] docs/zh_CN: add Chinese translation for usb/ohci.rst
Message-ID: <asEQFPeGY46qogz1@wyuan.org>
References: <CAMnqnYy5Jt-DWtYrjdekr=M=NBvdW+tu340BLf=GXQv-qi2gQw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMnqnYy5Jt-DWtYrjdekr=M=NBvdW+tu340BLf=GXQv-qi2gQw@mail.gmail.com>

On 2026-10-03 15:59:30 +0200, Jiaming Ouyang <jiamingouyang13@gmail.com> wrote:

> Translate Documentation/usb/ohci.rst into Chinese Simplified.
> 
> The translation covers OHCI driver overview, hardware protocol
> differences (OHCI vs UHCI), improvements since 2.4 kernel,
> queueable interrupt transfers, and non-PCI support.
> 
> Signed-off-by: Jiaming Ouyang <jiamingouyang13@gmail.com>
> ---
> 
> Changes in v3:
> - Correct the docs list in index.rst
> ---

If you merely want to resend the patch to achieve the effect of a ping,
then please change the title to [PATCH RESEND v3] or similar. And this
is documented in our docs. But generally speaking, this is too early.

And I cannot apply this on the tip of Alex's docs-next now as well:

$ b4 shazam https://lore.kernel.org/linux-doc/CAMnqnYy5Jt-DWtYrjdekr=M=NBvdW+tu340BLf=GXQv-qi2gQw@mail.gmail.com/
Looking up CAMnqnYy5Jt-DWtYrjdekr=M=NBvdW+tu340BLf=GXQv-qi2gQw@mail.gmail.com
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 1 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Analyzing 23 code-review messages
Checking attestation on all messages, may take a moment...
---
  ✓ [PATCH v3] docs/zh_CN: add Chinese translation for usb/ohci.rst
  ---
  ✓ Signed: DKIM/gmail.com
---
Total patches: 1
---
Applying: docs/zh_CN: add Chinese translation for usb/ohci.rst
Patch failed at 0001 docs/zh_CN: add Chinese translation for usb/ohci.rst
error: git diff header lacks filename information when removing 1 leading pathname component at /Volumes/Linux/linux/.git/rebase-apply/patch:11
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am --abort".
hint: Disable this message with "git config set advice.mergeConflict false"

If it's not on me, you might try git-send-email(1) or b4.

Thanks.
