Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A11D3806C1
	for <linux-doc@vger.kernel.org>; Sun,  5 Jul 2026 15:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783264837; cv=none; b=TGEPmyOZgoxXdnIgyQ7X2L6D5psvdGEAtg5IT0IM7fuWjd/A8UcaxPQV0VR/2gk8FACPAIoKvpNH0M1wjCd14sciwMT4E14ISo0GPbXFyjTFI+tIzZY2rkJdqxZ/9T5WvbUYsAaaFNgkblOfzwOtGO/HpZona9z6EFpkQVXiT7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783264837; c=relaxed/simple;
	bh=oymWQKimephLAZpLw5SG/jhsPwFz5w2t9N0FgL6L4sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yu1WTkGzJ4DHmEMsX1YIvk90KhEQWlVgB+uxM2JMYUPjQzzM1kIJGsVrJNuleM2cbqy9aMimHGwesc5LCLBiLfyyJRHhpTsZG+ki40A3rqjYiyRukaSE3SvSP8M7MYbUEVSYUit/4rkNyfJDft3l1jyo/yuBqo8mCgb+W+zKBU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVRzYpc7; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVRzYpc7"
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-ca1328b8584so1396030a12.1
        for <linux-doc@vger.kernel.org>; Sun, 05 Jul 2026 08:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783264835; x=1783869635; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LyRHUEdDzHEn5VoIw+uE0PQuPndQy8QL1VRSCVaZgpI=;
        b=BVRzYpc7B/6qm8jcew45TuctjyZiZY7yY8+7S6LcVAKk9z7Q1tP2lQ5rEwrisuON5P
         GYycdLIOfTRboJXCez8CgYBWGEeJqFaCXLXKK14TrMiAGSWbBqooHVJ0ZXpW+77WVm5q
         TDFofyWuocRaoZMWjogisaqCKejT4KF6J3CdNeZ1SR8vtbU9aYjm8x3hKhc9etxe07Cu
         E+vncFuwMQZrxZwrlagtjlI3FTYt6uy+XE34yyh3Tk5DHdGPLpG0sJ/h4YSH8ouN9epO
         KgCEVNB+Ih9/LLAiTR0ShNjq90ahmpSyjc9sGQKmrFzMyfcGSz5ofVfaPD5b7o6ugjEb
         6GPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783264835; x=1783869635;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LyRHUEdDzHEn5VoIw+uE0PQuPndQy8QL1VRSCVaZgpI=;
        b=Qb+MCf7J94W8X9zJn270DW1AVjdpux35qKo8lCo/CqrWT1GGoM6BZaEyZbmxdEizGV
         XzxO3VcMETEJzg1FYzvnOHg1OzfN94f1/ZNxzclhXfluE+LCKisLyMIqUu4CBAJcgKJD
         ZBpz3y1SBlg0hrIbgipiQKlyr9bUAjOY6x0PHyffnOGbT2c6CA961XS0GJvVVRAOfWqq
         x3sU2NurNbprem/0eIiWWYrHjDFsTTUcEFWb8IP7A8thXVz1iHA2Y/TZ0p4weOjOlb0z
         YD1qZavF4VzVFApC2QMcoJyOLq0DqV99AG9od8AwyEx070LmDe0TBd69mPWZJEO/cmMX
         5uaQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr0WyvuA5xVs06M2l+jqJjdZCXNzy/jDsmLqPMP8Gc3aywPvizEBCGmEoPIZJ9SIZzpcUFX3znuoCI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXjl4dXare9upjvC3rgMvWoJg94b1ce37u5m53Ogwpj2qTrZHP
	88NjQcm2ZFPBeINuH2vIqfhLKHjvqux17Ls1FuW8IdztnSJm/pCViEd5
X-Gm-Gg: AfdE7cnN/tG2XueGqaUpVAeV+gQSMOmrLzzAfKsEAoUHxeL7GUGuhop6ymrSGocx6mP
	102JK/N5oDUXzMwVZs6F3MVqfJxiqutDcchoUF+nmgMwkvfAxry48/5vzna6ILfJdzfpxKfaGXy
	ocU1SEsqQbkM6+Dj02lgkcDKdcfyZpO6iwbnOWx7DygDLZpZD445ckXSVmJDg1XFluN4KId8RgD
	jtDc/lcVNigA3W1roYshzwTBh+V5YrTP3AZXDYoLSHwYHfRU4Z4UHCyvZZRhVuwkY8YhG0AUtxl
	bg+GjdQn/wwTtFksdIVh0/ldiFOdkywY0ES8qyetA/gHTjIs+FIEl+smsliXYddTqcULf4rzNp9
	GX/uJMb3Zy43mEyqviDI6AC+H94bXEDNcALs/IRwmewYIV5oVD+cmP81mNKC8dg0ASQf7pmtl7x
	Mf1gJ7IOPX25glNjkPZX6Bb/9yfWPaphk=
X-Received: by 2002:a17:903:2b0d:b0:2c9:e6d7:fbb4 with SMTP id d9443c01a7336-2cbb9ebb87bmr67973575ad.31.1783264834986;
        Sun, 05 Jul 2026 08:20:34 -0700 (PDT)
Received: from localhost ([2409:8a4c:cc0:9ab1:cd4b:250d:9228:2c4d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7144e1asm35542645ad.31.2026.07.05.08.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 08:20:34 -0700 (PDT)
Date: Sun, 5 Jul 2026 23:20:30 +0800
From: Jiandong Qiu <qiujiandong1998@gmail.com>
To: Weijie Yuan <wy@wyuan.org>, alexs@kernel.org, si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn, corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] docs/zh_CN: update translations for
 process/changes.rst and sphinx.rst
Message-ID: <akpxuLXKrbN7qB9o@archlinux>
References: <20260621131215.1303439-1-qiujiandong1998@gmail.com>
 <akn4oYmihmNHFOY7@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <akn4oYmihmNHFOY7@wyuan.org>

On Sun, Jul 05, 2026 at 02:24:33PM +0800, Weijie Yuan wrote:
> One minor readability concern I noticed in both patches is that some
> simple tables mix CJK text with ASCII table markup. (correct me if I'm
> wrong) Which are, patch 1/2 adds the "当前最低需求" table in
> process/changes.rst, and patch 2/2 adds the tables under
> "数学渲染器的选择" and "设置 SPHINX_IMGMATH 的效果" in
> doc-guide/sphinx.rst.
> 
> These tables may look aligned with an East-Asian-width-aware
> font/editor, but the column boundaries can look misaligned in some other
> fonts, mail readers, or editors when reading the plain .rst source. For
> example, the lore archive itself.
> ...
> But I'm not familiar with rst and have never delved into fonts, it may
> be better to ask maintainers to reach an agreement.

Thanks for the Weijie's careful review and the readability suggestion.

```rst
====================== ===============  ====================
        程序               最低版本         版本检查命令
====================== ===============  ====================
bc                     1.06.95          bc --version
bindgen（可选）        0.65.1           bindgen --version
binutils               2.30             ld -v
```

Like the code above, the line with "可选" is misaligned in lore archive.
I agree that in plain .rst source, mixing CJK text with ASCII table markup
can look misaligned without a proper 2:1 width monospace font. However,
a few clarifications:

1. The rendered HTML documentation displays these as standard bordered
tables, so there's no issue there.

2. The real problem is the lore archive's rendering, which apparently
doesn't use a CJK-aware monospace font for source display.

3. In my local environment, I use Maple Mono NF CN (a font with perfect
2:1 CJK/ASCII width ratio), so everything aligns correctly.

IMO, this is a minor issue that doesn't affect actual patch review,
as reviewers can pull the patch locally and view it with a proper font.
A fundamental fix, if needed, would be improving lore archive's rendering
rather than adjusting individual tables.

I'd like to hear the maintainers' opinion on this.

Thanks,
Jiandong
