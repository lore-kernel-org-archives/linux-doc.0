Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4DC388E7A
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 12:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784292234; cv=none; b=tzQA75s59gE2ViQWiodn26XNf4CPwy7v7kZtKFaiUV7Ek3ztGeduB8j5aLGDCiBn5V7XxPudGDvf1luXUbjwj612q/Edm8Bp1Rkgu0GDflO4P9a7JunPSNYq5RhpHTYLXmKlMo/sCP6cpkgduGfM+B1y1zmK1l3nJfysvKusVXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784292234; c=relaxed/simple;
	bh=VRzGrBNUQ/GmV6KfYEOQkZAk0XqPQbyryIz1FCEcIuQ=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=Va3oUWw8M36VKd5DTb4WVnyz7e4hRRhkroFu15b/Ssen2uyhfR1C7KVCv98Sq30gy0HvaWqV10xw9KDj6rrW+3fddCdqdT27oBgwjQ96BKrVRxP0M058Jnhd7WAba1TVv4R8urUViVZYflyC8VOm6qKCZm82V+1ztu4kX4HlJGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zp3zV+OO; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zp3zV+OO"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38deea72eebso5545589a91.1
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 05:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784292233; x=1784897033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:cc:to
         :content-language:from:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V7NYPQNo11NzLk2Hb4ahE/Xkp2/B+70Gn4JhbG33Us0=;
        b=Zp3zV+OOXMVopWWX11INhEM1tVTRJWGmLwFW8omNaMs3ycvYZXjziBUwYjEnYq06wB
         p7o67N8OIHni7l9rJU9w8qI9qWfQeapMZMIXo3z0DDaNdYwnlJBasO1RhbDbO2MdXNiw
         Ei+ZUqfsgHT68aFXHlt3j9P0/hSIqPP5YJI5wb3w949JF4Dsq0xVUrX2It08YNbakzIO
         hFWb0zt8zQxKn/6oRXJyMG1ZLYIipfn4rHFEc0xbclvpTJ9juY9Wxf2OfFuF1Vegmrfs
         lo8XKaRn1mq5cbMHvwziBb6b4AWIbXXSit/KqpiThH1lmYOeal6ox7hKNip1R2X8YdLb
         GsUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784292233; x=1784897033;
        h=content-transfer-encoding:content-type:subject:cc:to
         :content-language:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=V7NYPQNo11NzLk2Hb4ahE/Xkp2/B+70Gn4JhbG33Us0=;
        b=JtZxOloHexHP/D/XJJypI8T+Y+xqSGbJS6eGdqgJnxdcfVCpB2NNccx1wne91/a4C8
         AZ6EJ/Vg06vAyE54omM3pydXEze9oMYGphVH8F0XNZabjTZGmz6SXf0JPWsjRpoqFZT1
         8c0lA0x1PZ7e8ADULm7BFzc7924sJCDKgA+WxZ/inlvLBmeovno6vpMXAwZSKLyeXG4G
         VexyocDevp4y/UVRrcb50YpxQxKvEC+sEjZn40OYLEb1Htq2WsCedeAmT6BVkT6x1hVM
         h7Y0uirwTynm0jcQraXaxTrwwDwy41Xbn0hLbS2AfOx+YLBQ9Cpy0hEzpZFTEYnVjx+V
         ugDQ==
X-Gm-Message-State: AOJu0Ywd4mviRgD3pDDnpdU1PN4dWj4ZjVhIPtEtRFw00LFY6xApL1aq
	J1zZ0V7wYHvVrreso8xMZCiGqcQLo3Q9wNpACDRv082na7aqQvcQKapfDsBc9Z2cxgA=
X-Gm-Gg: AfdE7cnm9oB5d7qPs9PANGggpOZJs6JzEo1noCwOcxmrrjRwnMZ02m4ypj4h9v04+sU
	HLLXpIC/m28uv1Whpbvg9WvxeLBw0qrYDGoMvypm6FkLzzij6Vr1rI9qnMEuQ6AdyxRr6qEBuen
	HcriS7fBFqSZpiu7o6zPxpUad/0EdA+v4MA/qnKwnKtzPToVEn7Tk0BmK2W9C9Jl/vbZFc3Ez35
	FRBXXY4HF5LIwFA+79jkBw3JidXg4elzv2VObQtbszpvhXKqQwDrMNG5HMgpwoX69z3cAGRpmA6
	gTZ/Q1vchSE8aQDJOMqG1/mYxJyTX7zYSimfUKw/gDA/eAKcHZQqHvJEYVJNeRA1UZ5PMfwqSys
	v/oZAy08YNYmE+W3Y/ICROE/qCUoIKJURrByEzQcAxpLzleVVcctV4u28ydCZQrvqxyRgvqpMOc
	R0wMNiRthD0kOELnzSHcfQrNAbHaLHPzXYWdnT/v5bRow=
X-Received: by 2002:a17:90b:4c48:b0:38e:3314:8aab with SMTP id 98e67ed59e1d1-38e4b58615fmr2382460a91.38.1784292232850;
        Fri, 17 Jul 2026 05:43:52 -0700 (PDT)
Received: from ?IPV6:240e:38b:e68:3a00:545b:e814:5318:3125? ([240e:38b:e68:3a00:545b:e814:5318:3125])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39deab2dsm2882983a91.1.2026.07.17.05.43.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 05:43:52 -0700 (PDT)
Message-ID: <84cd6621-50b1-4b96-8e70-9685ba8c7af6@gmail.com>
Date: Fri, 17 Jul 2026 20:43:46 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>
Subject: [GIT PULL] Chinese-docs changes for v7.3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

The following changes since commit be828e6819ed139b699bf7feb00a546cb7806266:

   docs: pt_BR: Translate deprecated interfaces guide to Portuguese 
(2026-07-16 16:48:43 -0600)

are available in the Git repository at:

   git@gitolite.kernel.org:pub/scm/linux/kernel/git/alexs/linux.git 
tags/Chinese-docs-7.3

for you to fetch changes up to 8492d4e6bb7b9b1e78f2d17c4dda5272f25ec118:

   docs/zh_CN: Update rust/testing.rst translation (2026-07-17 20:24:09 
+0800)

----------------------------------------------------------------
Chinese translation docs for 7.3

This is the Chinese translation subtree for 7.3. It includes
the following changes:
         - Add the some rust, module-signing docs translation
         - Fix/update couples Chinese translation

Above patches are tested by 'make htmldocs'

Signed-off-by: Alex Shi <alexs@kernel.org>

----------------------------------------------------------------
Ben Guo (5):
       docs/zh_CN: add --no-merges to git log example in how-to.rst
       docs/zh_CN: Update rust/quick-start.rst translation
       docs/zh_CN: Update rust/general-information.rst translation
       docs/zh_CN: Update rust/arch-support.rst translation
       docs/zh_CN: Update rust/testing.rst translation

Dongliang Mu (2):
       docs/zh_CN: polish how-to.rst
       docs/zh_CN: restructure how-to.rst patch submission workflow

Ethan Nelson-Moore (2):
       docs/zh_CN: fix CONFIG_CGROUP typo for CONFIG_CGROUPS
       docs/zh_CN: fix CONFIG_CONPAT typo for CONFIG_COMPAT

Yan Zhu (2):
       docs/zh_CN: add module-signing Chinese translation
       docs/zh_CN: update admin-guide/index.rst translation

chengyaqiang (1):
       docs/zh_CN: fix KASAN SW_TAGS mode description

panzhipop (1):
       docs/zh_TW: replace 接口 with 介面 in stable-api-nonsense.rst

  Documentation/translations/zh_CN/accounting/psi.rst              |   2 +-
  Documentation/translations/zh_CN/admin-guide/index.rst           | 202 
++++++++++++++++++++-------
  Documentation/translations/zh_CN/admin-guide/module-signing.rst  | 250 
++++++++++++++++++++++++++++++++++
  Documentation/translations/zh_CN/dev-tools/kasan.rst             |   2 +-
  Documentation/translations/zh_CN/how-to.rst                      | 149 
+++++++++++++-------
  Documentation/translations/zh_CN/rust/arch-support.rst           |   1 +
  Documentation/translations/zh_CN/rust/general-information.rst    |  82 
++++++++++-
  Documentation/translations/zh_CN/rust/quick-start.rst            |  48 
+++----
  Documentation/translations/zh_CN/rust/testing.rst                |   4 +
  Documentation/translations/zh_CN/security/self-protection.rst    |   2 +-
  Documentation/translations/zh_TW/process/stable-api-nonsense.rst |  62 
++++-----
  11 files changed, 639 insertions(+), 165 deletions(-)
  create mode 100644 
Documentation/translations/zh_CN/admin-guide/module-signing.rst
