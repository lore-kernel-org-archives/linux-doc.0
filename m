Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653C61CC154
	for <linux-doc@vger.kernel.org>; Wed, 23 Oct 2024 18:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729708175; cv=none; b=hBBi68XZ0/xFVPzfZR0W9qKRwsyhjd8r/nctkZF4JnAm2lg1PKhH6aGnCJcPd97DwITBBvm+skNnar1ITixHxGtvILTShBsrvmt3xpOjIu+J3dwqy4TPPIcOzozC0J4DuW+emCc8/CfPQVW8YoTDyLuBfWAjif5gxkURMdP0Pfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729708175; c=relaxed/simple;
	bh=YhPnAykY09uvgHUZD+9d/UbZg3530EutzeGDcUlZqBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sG1AOrUnAfS5KA7OQAyS1EAbnQlSKKJFzEw7x7CW6snzJR/7DamW60NCZm+ZVchjrzIDUHFItPCnyvKloUl9b2zYaXAcj/ET6llDhvfqLfNk+Baao3+UD1PsVipsPjzTLLD/EjQVTui1tvfGUML54240SpX8FeG5cvOFo4SURxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=l41O1iFV; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="l41O1iFV"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7b155cca097so9815985a.1
        for <linux-doc@vger.kernel.org>; Wed, 23 Oct 2024 11:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1729708172; x=1730312972; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YhPnAykY09uvgHUZD+9d/UbZg3530EutzeGDcUlZqBw=;
        b=l41O1iFVAutM2hz7AGWo/j6xOhU2PFxEx3MEZgiIdS1XCq8chZmIyY+pa137USSA72
         wBm4IkA64jiTRSMqaXveII1QTDyGbG361pd8P8q+P3Q9/12va0P/2LxDr6rxDoy4EjJj
         S953rHYLlQp6cDidA7++Ho7HkFeyDwoeXh2UYzwhikaMMfJtK/tCSr1EqdenurZjynxy
         L9o/xzIc52UvRHV6MAtS88SejRaNR+dFjKRrDq+u1D94aNnkYb1FHngQrY8u+TzKbEw0
         5LgxCA2TWPGcqqvixL4/vSbYrMqlMoQoFj3roXHKF6uhjjh7xJZ6GUQY8VUSCYnqhcBR
         2tWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729708172; x=1730312972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YhPnAykY09uvgHUZD+9d/UbZg3530EutzeGDcUlZqBw=;
        b=nXTVnRwNqExAbbEczrml7lk9qFZz3IzGtZGMnPHVT/6t5XCaqtoxA7UpQyU88mqYTf
         haG7Yh0nZXoiLMl6VdVp/tAPed3w9S9GAVDuMSAEYuYIoj1hs7KEkTOnOdYNN9l2m7fY
         ZY4ZzkXgXmsV5wwYBOZAF88RWojo/zVp8cxrPTa0S6HN1D+rXCe0w05Ztrvyh8M6ZWcI
         sVcoul8bgWEYW52fXts+e73tMUM9AzpBGwJALiRv8jtaXupNcjxn9uyAL/NYr0O3ICS5
         Qhqlm8ASB2jQplz7T4LucCffewuUOnILzAyAYSEAA/kWT39UIUwvYNW0VVnDqv+rAj4n
         yFgA==
X-Forwarded-Encrypted: i=1; AJvYcCXBy3WrXtJjiimOOXWc7nGtM/LXUVgOxcCedcToiVEe5RgOONto8H6ASA+YVSxGSw4CmVGSUPAyDJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyqJBQmoJdte89THUVeJO/DnAazLG2nJ76oNs06IfnVEFxjH3c
	Jv20NUvJgVAuYiCvY31izildllAbKPoOVIClh8u0f93fUG+kBnkio2z1/DPqjXzZTgRDjzED7FF
	mDs7l6QXhs+XZuJycShGj+mPOZnJzu4oP0eup4g==
X-Google-Smtp-Source: AGHT+IHN7Nn8TYgf6aogO4v+tavfp3Kp07Bk8F4db26KNztW0AXCpL0TnRtSVX9bTG1k+0/2LMpyl/hzTzQRoJaHQbk=
X-Received: by 2002:a05:620a:1994:b0:7ac:b95b:7107 with SMTP id
 af79cd13be357-7b175583433mr1343572285a.12.1729708172364; Wed, 23 Oct 2024
 11:29:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023170759.999909-1-surenb@google.com> <20241023170759.999909-5-surenb@google.com>
In-Reply-To: <20241023170759.999909-5-surenb@google.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 23 Oct 2024 14:28:54 -0400
Message-ID: <CA+CK2bD9UQsh8224QqTTAQ_Ybz23BE-DFeubLkf41psXBsMA=A@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] alloc_tag: populate memory for module tags as needed
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, corbet@lwn.net, 
	arnd@arndb.de, mcgrof@kernel.org, rppt@kernel.org, paulmck@kernel.org, 
	thuth@redhat.com, tglx@linutronix.de, bp@alien8.de, 
	xiongwei.song@windriver.com, ardb@kernel.org, david@redhat.com, 
	vbabka@suse.cz, mhocko@suse.com, hannes@cmpxchg.org, roman.gushchin@linux.dev, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	souravpanda@google.com, keescook@chromium.org, dennis@kernel.org, 
	jhubbard@nvidia.com, urezki@gmail.com, hch@infradead.org, petr.pavlu@suse.com, 
	samitolvanen@google.com, da.gomez@samsung.com, yuzhao@google.com, 
	vvvvvv@google.com, rostedt@goodmis.org, iamjoonsoo.kim@lge.com, 
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	maple-tree@lists.infradead.org, linux-modules@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 1:08=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> The memory reserved for module tags does not need to be backed by
> physical pages until there are tags to store there. Change the way
> we reserve this memory to allocate only virtual area for the tags
> and populate it with physical pages as needed when we load a module.
>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
