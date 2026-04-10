Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABB934845C
	for <linux-doc@vger.kernel.org>; Fri, 10 Apr 2026 13:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775827775; cv=none; b=VCGqmN297RQZs+7kW9PN5nNGyR8tEP11iaySEPPdhZ8yAYWc5aVU51alhlV9p/H1pXof/+m0Pt9V40Uc2LaYPJhKTvhq8Hdp9SPwtY0NTkNEN0JCUPeC3BwslCfKGFmYW8MS30nuJg8P8WKQqhdHTKHcppVbDXuDfchrX0Q2Ir0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775827775; c=relaxed/simple;
	bh=m7fDs80yCRrRs3HT3VVus1AlNUhNCSvtL5Y/ma4aJzE=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=FaIzP9YBMQF17kdJay0umE4joOr9OV/DAzE4T9JHelO9FPZJlNcjRYD3gLaxM/j0hRymcRbi4AxHk2QWUifkn3pUlR2dPiXuy5/4nFQsomqbVEkEAGaVQOIcEc256j5uQVVYKzybHbMNquFPy3+uZilZJW4EZYD72tFi78PeKvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CYXq5nhm; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CYXq5nhm"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82cdb4ab547so1086468b3a.2
        for <linux-doc@vger.kernel.org>; Fri, 10 Apr 2026 06:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775827774; x=1776432574; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cgUudgMTomR/welbzk2J5ig+oF9Pr/5NewdXIfnTKYg=;
        b=CYXq5nhmCD5RV1FdPhlLtVdgV9kud4NL/esbB7RHkx/uJI9aNOx6zohvWPpfOoq7SE
         wlH4OPOaRgxKIBp4ZQrGxMu9lTp6uknUvsblc0zYVoljim4bVY5OeReydmEs2i87olXl
         DHpBswbcTZ33tvX4puus1AmYITHXrEb07GSEWPFfhoaYnbCLe+d8SWIebCVwmmHYfzqN
         667dzdberhQUUNT2JKGwmR2iNJGi/fqEF4yzDv6wEby+9bT1AFtlQ51uV7yMrkyFSkYi
         H70OyP/5BV+qMMh9ztkODpvanrJ/l0NeRWbfzB5QXXaa2mXxbBIOChkgOoJEsyOwxaav
         Dhrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775827774; x=1776432574;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cgUudgMTomR/welbzk2J5ig+oF9Pr/5NewdXIfnTKYg=;
        b=ZfRwOlDjHqu4qp58BnK+uxDM76vyLA1dWKdzjnSHUL38j3i4wNX5O1GLCAospvXh3E
         fhlz7Em6ip/pyfkahQe7ufQBDEI4fKtJtPZO1q+yUVkDtuJELOhRUpXHeQrcsHf87d3Z
         35Cc9xw5dmLPIhMjow+qnO0y3LPxjuAl68u7yq4wzuT1H3pUTLX7sBucZ81J3B3I0uXc
         CfhtXRLBlYVHp1s8CU8liAaEbMwJce30Ec/Z/ZveEKkCPetZjMzjLj00ksYM6Y1dhZTZ
         rBtB1QbgLbqOawEzYwnFjY1Lzs+npkKqIlhUkGPkxW057wdkTdPZHTxmGHZfKHGe7Uuo
         j6+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWV/BdESSjuTHnGW4b7o62FfoTHwdQiK6FEauM2PSP0RAY0VybdXMyzGC2AIskoWX29XxQD6HDUleg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVo+jlHRWjhVhGgKk+q9K856OupFSCzjjHLosXCf9wl3eGbiTZ
	Zr3IB5GulfbzaVzdm95dTsdEfDGJQHtbq26ao+d8VJbvKEJucv+3US7ARAPETZ6Uq9w=
X-Gm-Gg: AeBDievAp2pcY0Q5feR6mhGD2QWO7LJehMsGGR0bkDpVoY8QPjrr068UXRCv2MZ5NF2
	P75bdfwnKC0bLagHpW9wwlC1P2rO79rCdHl3iJo4yo860XfJe/rVRkcrbfteSvqxShmWlmZ6Oa5
	y42m43kqr1lMLCUtZM0LqL7B5Z0yRp8pQghJcG/yfRcEMHjot5SMLVugWmP5Od/vhEvIJME1j9v
	ZvWmpTRpRRMvz6Fwk8GGVzxUnGi6d+lSY7sZAHiKLHeKZL7VMppC5RkITw7pl46AGc8cWOuhHab
	BTwGXJAcw3iP+Bm2w66WUwOKYiJRpypBNUU1+WcscQYSXnhkGk73P3I5GZhtKwpU9VBJ/EY8ToB
	sEQwcf74m4PNzI/DCxTSPZnqXpDibZoJWuXymrz6rKwe9m84wTQvvydhgjerRXNOb84qBcnQkG3
	u63/ITORiC2ETjW60b/eMWg5aaIXhtxGh9cCVNCCecXJqbcA37hOk4rqyN6juF+g==
X-Received: by 2002:a05:6a00:ace:b0:82c:e775:d43a with SMTP id d2e1a72fcca58-82f0c3562camr4020744b3a.35.1775827773494;
        Fri, 10 Apr 2026 06:29:33 -0700 (PDT)
Received: from ?IPV6:240e:38b:d99:bc01:ecae:8cfc:4adc:6bc? ([240e:38b:d99:bc01:ecae:8cfc:4adc:6bc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c30e3f8sm2961897b3a.8.2026.04.10.06.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 06:29:32 -0700 (PDT)
Message-ID: <b71a3647-b1b2-4c66-b357-38f10058123d@gmail.com>
Date: Fri, 10 Apr 2026 21:29:26 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Dongliang Mu <dzm91@hust.edu.cn>
From: Alex Shi <seakeel@gmail.com>
Subject: [GIT PULL] Chinese-docs changes for v7.1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

The following changes since commit 1eab6493f525910aa7bc383a2a27b68916e3c616:

   tracing: Documentation: Update histogram-design.rst for fn() handling 
(2026-04-09 08:46:39 -0600)

are available in the Git repository at:

   git@gitolite.kernel.org:pub/scm/linux/kernel/git/alexs/linux.git 
tags/Chinese-docs-7.1

for you to fetch changes up to 78405e7f42fa9127325c65aec9289187f67ac5ce:

   docs/zh_CN: update rust/index.rst translation (2026-04-10 20:09:45 +0800)

----------------------------------------------------------------
Chinese translation docs for 7.1

This is the Chinese translation subtree for 7.1. It includes
the following changes:
         - Add the rust docs translation
         - Fix an inconsistent statement in dev-tools/testing-overview
         - sync process/2.Process.rst with English version

Above patches are tested by 'make htmldocs'

Signed-off-by: Alex Shi <alexs@kernel.org>

----------------------------------------------------------------
Ben Guo (4):
       docs/zh_CN: update rust/arch-support.rst translation
       docs/zh_CN: update rust/coding-guidelines.rst translation
       docs/zh_CN: update rust/quick-start.rst translation
       docs/zh_CN: update rust/index.rst translation

LIU Haoyang (1):
       docs/zh_CN: fix an inconsistent statement in 
dev-tools/testing-overview

Song Hongyi (1):
       docs/zh_CN: sync process/2.Process.rst with English version

  Documentation/translations/zh_CN/dev-tools/testing-overview.rst |   2 +-
  Documentation/translations/zh_CN/process/2.Process.rst          |  56 
++++---
  Documentation/translations/zh_CN/rust/arch-support.rst          |   9 +-
  Documentation/translations/zh_CN/rust/coding-guidelines.rst     | 262 
+++++++++++++++++++++++++++++++--
  Documentation/translations/zh_CN/rust/index.rst                 |  17 ---
  Documentation/translations/zh_CN/rust/quick-start.rst           | 190 
++++++++++++++++++------
  6 files changed, 427 insertions(+), 109 deletions(-)
