Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19D4277007
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 18:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763403869; cv=none; b=UHGZhE4BdpMraFRWU5RH4VEleSolehXCTBfUcMmvTLjK+0i02KpCHWFAhvXI5vNHF5oKOMtfcJh6pA8XGEUOQta42Kv707pL2xw1Cuw3cuaQplkbBFYJ1FS6YjtTeZdIRNo0eVYSzM7bgdsq2KGPwWWXgEz52lFeKf7U0N5zkvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763403869; c=relaxed/simple;
	bh=DSVaYS00Ppz/lXA0EJ/lwtUlZcIIPkWYwoyJByW18bU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LiBkcZ3cB0df+vfaU19MvclCo5IeLYePcX7Nnn9m6huD7k+N6yH/gQBJ2OOFwp8cOGrhjuNXWIgZlNk2YL6BvOlVAccRaEs2iL8JqVzZ+9JR4zKsNE0xN0cxHzt7LF/O4ja6hnU8cmHgJKJnohGRoo/FMQ+SaO7CxtlNdFtpyXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=S5uKRssT; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="S5uKRssT"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-64074f01a6eso7808082a12.2
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 10:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763403866; x=1764008666; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DSVaYS00Ppz/lXA0EJ/lwtUlZcIIPkWYwoyJByW18bU=;
        b=S5uKRssTjIvfjfTMkVJXvTmWkmBSbpslh9JXGqpBo16LqUCrWfQi2LrOCaDmpZt+F3
         xiFyMPECkusxkEfJWMDqwwcy2gq7Z/UpbMbJIT1nCESE8RV2Mpy9DFugrSmxi36GetDE
         9KxFbApN5ER1PvMLaCxKEeLoOL+sER9gW99arb/ujgI/bPL1xcDMuEikfssfim6MIGS7
         o9VkifnnMbeFiwkVPMa+YjQ6LParO/uVXgGmxTtSQC9sbhhjCfhboPuZ/p3ZafvcXdNn
         My4ZY6zl8rvcq//PL0JLyB3T/pcsCNFcL9+hWlibU8Eiwb8sp4vVNj9NouR0ujak2guu
         lNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403866; x=1764008666;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSVaYS00Ppz/lXA0EJ/lwtUlZcIIPkWYwoyJByW18bU=;
        b=a5v4FZGmi4MFH+crY9dolvx/LHuYJpJCrueN5/2cFXRHxRA13zdLFRhjs025PlQM8f
         ndUalkthoZ4cteK9dA/D+gXVK0echdO1ulimGmJtk4FowYeE7jypkaTyyNc8OzViEhxg
         VU/9z+E4QYqzhiWUwf/YgExesed6VAuseXs4ZZs5YSG1jF6JsboXsvw+BWZo5kf6nlJC
         gS7+SafizwN6tokqPGSH+JuoOdoneBDNq35q20KSVQunJO2RNYn1xMlWl6D1zlE4o3Bx
         5Rub/nMxh+tYNVDY+KoLkzC86Q73zP98jQndTbB/Y2yUkBLwfaW4XhpArsgy3tdOEYt3
         pYng==
X-Forwarded-Encrypted: i=1; AJvYcCXj2fbFyrt0JRluMbupIYBy+fU6Kg4lKS1DHQXsmIeCJfbvLLHhhQ2D+wf6FJaSRi2ssNk5L4g0Rb8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVZcAzU8Lep40rRFNsJqggkUZUMCMok/iZdzmLRJzzAadpwkkW
	N3DAj36sZXPhILVInTkZYr0qCUyV0s7lZaw2Q14OWyAztNJnhnyGCOSm62Cg5oy8jag+nU+laO8
	WS8Ex92vRX3zYq3052c444qApjjRMaHv2zlv/qArYBA==
X-Gm-Gg: ASbGncviW1/5RMCnE8aU9XMiQb6cetQoI07Cod2p485oaDqPpwGi/sRU63ZSeOrn+I4
	/qKs0EAtPFeVB7zN72yFJj7vpjcXLrLe9qzrh0vOUOlONoCahjC1/E1fj0OSl5MOoJlcg20C9Lb
	vwmPdJO1XKrHIbG1BWsvDSRRk2zbJ/sl3D2q1GhMqry5ok08iuGzBGq1p7tT1Q3oalz6InvCwvy
	M/unVKeVtLr536G4SQcNvwKsuI9DCPiu+OmtTMZYGB8/yl+lEMb0otsxX6qujfhXNl2Y+N7ehia
	ScM=
X-Google-Smtp-Source: AGHT+IEEWqHLyN23GdmGqxp16gOz0H99ycEtpAQL2MFddiKttxJOs0DiTjbKI+yQFgL9TB9EokEIYjSn2RJfB01X0+U=
X-Received: by 2002:a05:6402:2806:b0:643:60b6:3eed with SMTP id
 4fb4d7f45d1cf-64360b63f56mr10022358a12.31.1763403866324; Mon, 17 Nov 2025
 10:24:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115233409.768044-1-pasha.tatashin@soleen.com>
 <20251115233409.768044-19-pasha.tatashin@soleen.com> <c8b46600-d40f-41b4-a5a3-99300ef1a2eb@linux.dev>
In-Reply-To: <c8b46600-d40f-41b4-a5a3-99300ef1a2eb@linux.dev>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 17 Nov 2025 13:23:49 -0500
X-Gm-Features: AWmQ_bmhggvke7xISGqUn7uC4niyXxh61OdHqC9kU_cJS8AOY1qqJ3NjJ9HlQrw
Message-ID: <CA+CK2bCUG4BVqPJYL5nxC-Uvomx2JT=sE4DrhqFjrBf+zN_m3A@mail.gmail.com>
Subject: Re: [PATCH v6 18/20] selftests/liveupdate: Add kexec-based selftest
 for session lifecycle
To: Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, rppt@kernel.org, 
	dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, linux@weissschuh.net, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	rafael@kernel.org, dakr@kernel.org, bartosz.golaszewski@linaro.org, 
	cw00.choi@samsung.com, myungjoo.ham@samsung.com, yesanishhere@gmail.com, 
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com, 
	aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net, 
	brauner@kernel.org, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	saeedm@nvidia.com, ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com, hughd@google.com, skhawaja@google.com, 
	chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"

> Thanks a lot. Just with kernel image, it is not enough to boot the host.
> Adding initramfs will avoid the crash when the host boots.
> I have made tests to verify this.
>
> Reviewed-by: Zhu Yanjun <yanjun.zhu@linux.dev>

Thank you!
