Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B843C1989
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 09:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767865009; cv=none; b=IRydmX2pjhgOxpOAbWCLyEN8L32b6UM50egeLXDFA3UIpdkswl7LAKtSssj/oQksns416XZfe8onYvjDYSNXESgPmTHu5ZI877MDmOmyByLJPAWiMMX5+oAVl7Fdb2A+xz5hvRkHUd08AfXrQIBGgwloN4Qj8VBWTceUYzXt6Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767865009; c=relaxed/simple;
	bh=hfVPLMrLi28OA7B1DWFOfPV5uR4Nz2JZ6lQVyJb0Hyo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q2L4CAWw8ys24DIFQQ83YYplWOGtNSHr9Bv26rgjfuVL9Y7VuxD8EMyIkisP52Vlts9x1T0MX9+iOpdFosjf0G0tOpYHlrWfhmtlLUUBrWk273By7htD2lqpYLqTKHjBobx1ZNWf1ekVQ4l2C55sEIyiTc2/Nx/OzHqyB0JBQwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=P20hilnW; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="P20hilnW"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47a8195e515so21266335e9.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 01:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767864996; x=1768469796; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:date:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5eBrvF8Go/xUS7FM/zhpwrhYosALC7VRUVUOs8jPVU=;
        b=P20hilnW+sV1kN97yT3AFdTBz8w1oqVeJp3Uqao1SFlZXrhCgio89e68cHOqEU3VUS
         Q1jn3pUMbZof7CG0ruMd6nQM/JavXsTzj9mibUqqy54N9OKr+PpvPN7rINcJTyrWoF4H
         5L+Ea+kTjDKz6uMEgYjIimCB5w9OjRk9FzQbclmE+UJMZAsCqJgeu5spdp5J6sJDf9y7
         zgZbW03eipd38u/mFe4dQYbhCjS0wuZwfU7H7re1qF2O2RZxsCCZc+kp3WhccCogvRxS
         RLCx2SdaVNeFHbcIM0kHXIFNtjUsuEWq2iPc+d/d/5XbUQo4EyvQkQZPX4MZBEJyOZZY
         jlbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767864996; x=1768469796;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a5eBrvF8Go/xUS7FM/zhpwrhYosALC7VRUVUOs8jPVU=;
        b=Kbm0F8GsREv4N+C+uIyQ1wR/Ys4tAhFPUa2VOUy+8XlZpusenmAXlk4Wx2mrxnt02z
         i6K5jpdxz+mg5sGvyjiK/3mq3JtwMzpQaMMZ3sbWpo7UzRT3P/XCkCxHsq2Axf5T/KGd
         UwnQEZQxZwrlnPHrUGZdxFiHZvuRfPZvCCWvLjhykVgP7TFxIdu04IveW7a/DzLQ8Fqq
         TbEWuPsJnq21EVjuevPLxR2l4xBwBUIS8KTlFCaCDnTkN6Fp/6CREAt3+1rzK+obWPRB
         BWx+BG36m7N9nwawVBpDkaVzsm8l1A1x91Qg9t/0ZMjFIxO7BYhNK2fNaJ+TsM0sLbEn
         YDFw==
X-Forwarded-Encrypted: i=1; AJvYcCUyWh2AmdsniKw4tdvyDsgOPJwtoWU36PK8xHvikI2oYm48m888gr58Bn6u3HByT+6af11SbWireBg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw27d6RSERxc3XS/NnjroN6cUfkFkfs4m7cbGas7O+GfzlSAAW
	fxkKWsK4Ia7UvymOIboeEtG87QQb2MwZ7zbxnq16Zr4fJMMB9k/R7+Fjma+HkAzu7p0=
X-Gm-Gg: AY/fxX7gSvByW0YoH/OvjIjdLiNyH7Zqy7hdsgtxzYLOucUwhA2H1yc8ZRsfV/0BhWd
	jt4FwRFqQXq9cv2hg0gpB1vPKfsNhCb5S7CVdKtellMNHK+8UHTTFONnCZsuRtWswJuoM1lzdEx
	6jZ46bw8a6g62UYVENeyulFZyOE6ae9e/B0dTQYCa49gLT3o7i88ClZV9n6WOwt7eplRojvLjOq
	YGReQtCaF5FdDT6nYHnD9Vk0lp7itr8BqHxaaC9wqjTsnH4bhmmIb+RO5Pu4i7Kr+Jo8RqPItaA
	qMF5zBuqeDsO22bcPnlUMtVXMTEAUytsWLqgDBs5vi/uArvJDblm3QZBq4yjUsJ3yAw9Cbb6SGn
	gLLu5gwvMRdfVehY/kuhio2YUso1kKVi/cgOGVnOx82KNKgh484dbZ8F8gtekaZMX2brdB2zEbd
	TqnNpDp0U1zpSSUJkX5F5lOYWnaoRxMv0qPR3It0PCSWUVtj6TKzMnL9ZYqt3CU9MNvjSZnsV4y
	im0aA4Jrnx7BYQg5w==
X-Google-Smtp-Source: AGHT+IECoue4wxlQ5a6yi035COQT2W4Sc/xuMH3TeKve5qebuXBME8i76ZzgIJIwsSb09kCb4/tGRA==
X-Received: by 2002:a05:600c:a10e:b0:47d:885d:d2ff with SMTP id 5b1f17b1804b1-47d885dd365mr38039725e9.29.1767864995753;
        Thu, 08 Jan 2026 01:36:35 -0800 (PST)
Received: from r1chard.home (2001-b011-7007-95ef-189a-1ee2-bf3b-705c.dynamic-ip6.hinet.net. [2001:b011:7007:95ef:189a:1ee2:bf3b:705c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59e983fsm7174864b3a.55.2026.01.08.01.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 01:36:35 -0800 (PST)
From: Richard Lyu <richard.lyu@suse.com>
X-Google-Original-From: Richard Lyu <r1chard@r1chard.home>
Date: Thu, 8 Jan 2026 17:36:29 +0800
To: Borislav Petkov <bp@alien8.de>
Cc: Richard Lyu <richard.lyu@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/x86: Update AMD IOMMU specification locationi
Message-ID: <aV96nfAx66ef_8tc@r1chard.home>
References: <20260105150548.73422-1-richard.lyu@suse.com>
 <20260105151959.GAaVvWnyEonFSjilB_@fat_crate.local>
 <CANC36oUVpEF1r3JK8Po6a4RwxRQ4qGMLvmWzxn-Zf=W2tF9-eQ@mail.gmail.com>
 <20260107145301.GDaV5zTU0a6btE25Q_@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107145301.GDaV5zTU0a6btE25Q_@fat_crate.local>
User-Agent: Mutt/2.2.13 (2024-03-09)

On 2026/01/07 15:53, Borislav Petkov wrote:
> 
> Btw, I see you're new to this. Please read
> 
> https://people.kernel.org/tglx/notes-about-netiquette
> 
> about how to do public mailing lists and also:
> 
> https://kernel.org/doc/html/latest/process/submitting-patches.html

Hi Borislav,

Thanks for the pointers. I've realized where I went wrong. I will study 
the documentation carefully and ensure my future contributions follow the 
guidelines, and I'll send an updated version.

Best Regards
Richard Lyu
