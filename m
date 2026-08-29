Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52211643B
	for <linux-doc@vger.kernel.org>; Sat, 29 Aug 2026 01:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787968353; cv=none; b=jkKpAwMS5Tq8vljk6NoB5ThtXOWcqlQ9tIDSBHrmCwi1ca17RiwMvxC+F1hsLZ9+UqvQ+O60/Wp28Uk7WktsjG+0lXlcNtAve/+/3gbPXvd/MShqSLuwjCGMrp+oiOYH6qHCXXflvXCop+7T0UzFi+8RCJMaF8CAjtZRW8afq9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787968353; c=relaxed/simple;
	bh=Q1fxs9Cuh7MABhOUaj3Dq6spYafZwoVaMo6QE7grAIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YQZdxM1JZIw7Sv+y9QT2I4HjIiqeMppVfO2o03JwLsjcCgc3KN/YR04RgXYDGxh2qWW3G3QiM+e1Rez13uux9zlqwSBK/kXfD7cC0wp7JwwOMyc3o6fhT0I8QZdcnboLBqeRZ7kxEjdzTX47YlMXLXR5jmB0IfYfwFlDkBwWi4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQ4nFmH1; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQ4nFmH1"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2ce98cb8165so16867255ad.1
        for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 18:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787968352; x=1788573152; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q1fxs9Cuh7MABhOUaj3Dq6spYafZwoVaMo6QE7grAIU=;
        b=dQ4nFmH1sNXv+lRIDrFlX0HgFYX2rWlgI3u9vqP3WFN5lvMDjSlujDPoTTIvbAk7HL
         YnaqeiZDBVR1Z8X2WM829yk5Uch7jZ5pn0rYpgMwQQAsl94f/j4H+p1KajmXdsoPaglG
         mGxHRAiczMrC3v4O3/jweqqJIN8zKnOnb55MJWj1v1BQj2HMplMrn4UmVQiYZahKICG9
         qCgCiskPIrGcZ0F8Be8dAwqurn4M0DIuJXdoBbpxM9mA3spWNbpYSlV/cf+fiKOnYXN0
         Uks82Th8zaShVNOkMkXm7ymjrsgEossdICxvU1ulcjX53jIiAYeCb1LbySc2CbN03E7o
         Y04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787968352; x=1788573152;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q1fxs9Cuh7MABhOUaj3Dq6spYafZwoVaMo6QE7grAIU=;
        b=D3+Y1dZBECX/IYkVT/Gjnsj2/Oqmp60B9s/sFUpvoNxGTtNRw2C5fvMSQJ20eB/obF
         5HOla1sEbT4mRPMYr7lAe6r+aBe82G+johrg3yVh62SKaaEqEhQFamTCinNVxGktFX3E
         9QT182DTNsf6RPjRhwP3+sd/o+NhysD9juLE8bOk6jQYavlCe53uqtrZb4ptnxWy0Cit
         6oB6Rp7VkyULDXzfCX1ddDEBfzhwGY5zmmypMxyv73izPkRTYaD9yTb12Yi/b5d41Pqu
         6WolmN060Fw5EPwkwT/iyioGnjfoDKgWkN7kAYhUAp+nrIoKxtjqbtiI0pFVArHqeAVK
         vXyA==
X-Forwarded-Encrypted: i=1; AKwUvBx8hEY4JFHj+8MAanUDIX4yYcULO2lqZ4C7HZKtKeltig/4Jswp2lm0JThkDvQ/62Mnvc7LlW5cR7Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nY6XJllAGMBEQe+7DdC4ACIVZnSqOLKXybL6UJ304hgcRig64s
	P+wDN8vHlmgQBYTeLBsLgXMek4+3kEbKDL9dS2a0ZpusmaqyZx/Fc0OC
X-Gm-Gg: AYBFou1kc9bhQTj95d+qATxreyVX3r4V0ci8orhxe0XtLe/dJlfhCn1uQrC6Z9g1Yll
	FaLmNgkuYV7loAWBnmwW9HlS55X/s3vRK8lfczSS/MwCBz78AP92EDWmuCDQa8TQFqogz0bi8ID
	ATclPBK7+T8FaLLlsMlgVf9qXYnhRnbmbMdYvHLUshrLXwasnX7kS/ywwBhXietBcvdjV2CG6aT
	IzrBgt0yDE+mUkxeizzCdzNGqvRpPBM3qOmFxXibt9s6Qsn+EWeiNP9XCAyR6j2V8X8ttsxwN2Z
	HWD3gPCA+9zMbiqG8BD+MAedbhmOCYT8o4xM9+ctBfEwQc+YkjAWWCkpULs3cDb266wFcMdZZmC
	+u4sM20eQ7LT+C0BNuLfgwoiKimyAPe9M5HxBQ4bOFdIgRTuQ8t7UI00aPzhObXKOV3UM40SzT8
	0lKQMhvw5Yj8cV4rdvIrjCZO2wAaLyCiXCm0G6dmhssFjsAjAE6VQdeo2dSKZS+0xM5S0ArF0uU
	geBl2aU
X-Received: by 2002:a17:902:f68a:b0:2d3:c3b:c7cc with SMTP id d9443c01a7336-2d725df6dc7mr197429485ad.3.1787968351866;
        Fri, 28 Aug 2026 18:52:31 -0700 (PDT)
Received: from hppc-archlinux.localnet ([2408:8240:c13:2170:c21d:681:ea:d5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e2a95sm9335864eec.23.2026.08.28.18.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 18:52:31 -0700 (PDT)
From: Yukai Wu <xiaoyewuz.ruster@gmail.com>
X-Google-Original-From: Yukai Wu <xiaoyewuz.Ruster@gmail.com>
To: =?UTF-8?B?5oWV5Yas5Lqu?= <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Shuah Khan <skhan@linuxfoundation.org>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] docs/zh_CN: Update arch/riscv/patch-acceptance.rst translation
Date: Sat, 29 Aug 2026 09:51:25 +0800
Message-ID: <qEGu0mcxR2u_YYmRciJGuA@gmail.com>
In-Reply-To: <14a7a290.91f.1a048b9be40.Coremail.dzm91@hust.edu.cn>
References:
 <20260828061834.3645176-1-xiaoyewuz.Ruster@gmail.com>
 <14a7a290.91f.1a048b9be40.Coremail.dzm91@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Dongliang,

Thanks for your review! I agree that "=E4=BB=85=E6=8E=A5=E5=8F=97" should b=
e changed to "=E4=BB=85=E8=80=83=E8=99=91" to match=20
the original "consider". I'll include this fix in v2.

I've also addressed Weijie's suggestion to keep "Patchwork" untranslated.

v2 will be sent shortly.

Best,
Yukai


