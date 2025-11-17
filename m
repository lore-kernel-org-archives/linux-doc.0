Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0061B313274
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 18:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763405165; cv=none; b=hfu0LBx14AIakAcZOM56g0R6pIQqdljVmXRPMYN4XN3R3jbtE+dvYSvXPSo5zgd1IQPBUj9lZY45+p0QQ1SkZ6PfUoQk5hk0i/H6kXfYnFUkRKi5/6sg6sVXOIyYIeT8HweU17w10P13zwg8HT6sEjjanVy9xNX/VMUkSR5cAm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763405165; c=relaxed/simple;
	bh=9L0PWDNFpIwYA9Tdoy4gSq9mMo+JaoLTYqKodPhceek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CkTNpTOYYJuSLAOv7Aa/xyjIqWwt0rjxHkz5SkZo3VBDKQheHvp2vvUnep6u/6FL9U+PUO8LY6jEvAgL1pIwUKLof1HjwVf3guUurhghGjLZJRDoV2VcmgYiB3I6mGtg49fUggmu9Y3cxo8HXYdQ9lcLXp+3ci+fkpU3afAQI3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=UEYm5eQH; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="UEYm5eQH"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6419e6dab7fso6976444a12.2
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 10:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763405162; x=1764009962; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9L0PWDNFpIwYA9Tdoy4gSq9mMo+JaoLTYqKodPhceek=;
        b=UEYm5eQH/ZaHFTniJ/bWeAQjEfOaBtxfEXk1TCtKFVN9k23U2kyh+2CZwX8yhe0Qb3
         rFFtXAJw2fNQt37zw/8uOu74ndcqA5jmCtAY3gquwM6NVFjweAQ2fokorELyBSt3RwXo
         Ytoqf6RjHhAJzZmnSVW9rQL2AsDCo0qfJ2h/WHd443/i/I849h+SJZdF+f0S11tw1le3
         uQeNNR+R9MK6J5lEYRiEXYVT/hhSXe855am6ZUvsN+1RL4tOtn3a4X4oDb/NSshwHIb7
         6VwlEyN6+mGDu5CW/HA6Zy4NEhgpHbYrhHZJC0a5EhHGz78svG58AN8PgLwJXyagetgL
         qwbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763405162; x=1764009962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9L0PWDNFpIwYA9Tdoy4gSq9mMo+JaoLTYqKodPhceek=;
        b=rzKm3CiVGpIl62hvGyvo5hi13MfP707bjk4dyCUAYYzlTbleAHYwUCv5dmyBVy1QDi
         EovOyCK5twrVTay3s5LJ+hUMod9nEGjP5U304MGEMjz4gJkgassJoS6hJzpJjRhHmrMi
         K7LzoYdxkmt45B+rYw4zk4lY9Hh18w+xE9dH8C/s/cju+9Etc6vA0ZhqGQa0UxgxGJvC
         xgMhMEPwYwhuhHmXBVpdJ2vG4S6vq1XDp4U+G5yviXUE7yzAFrCBEy6V4e3CO2eC60LB
         /opI4zrYWLtqLNMAN9slGbo1ysmAXefCvzOv0+tpi/S/uD+VQuh7Y9/8dKDItYh1JSsP
         GNog==
X-Forwarded-Encrypted: i=1; AJvYcCX9ZfmyW69TMZamLwp0Aq66K22XkMMyFnsKvr8l65BX23LTxZ53xj4hddNPUQXoR384o2wKGFxUCig=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyia6UKqMGPT73cLRvUF6d0c1J2h9VsA1wRR0hfW/93XCO92p5L
	fpINsqVvW4MbgS8+UuwwOZnq2kNkCMssZ02/ssDfcqigMN73DHi/JUAeJSVM3D+bApF747eJMal
	kr9K0gZ3uPmAba0vRam3GkwLbUdYayOueigYE9u6Zgg==
X-Gm-Gg: ASbGncvVXLBMeAqRX3HbpWLZWUxLo//tkjiQsUWWZo3MKqfmAYUage7x4pHUNfUrB8A
	fm2kJsLFOKmBi41GcKUP/tBnaNc8qZ20IaJkN4fa3tliF8w7+edD32hNkhcbGM1cgEP5IOlB8hp
	sS/OsMP872C08d0lroYzu0Gfc5HE9TJDrfmqheiW4Uh8/k19qE1ED7/kBVck7cMpx/G1rRnHmVz
	9ivF9eEafWKK3636HL5ykzE7Qn2y7mzTmS1GKxZ1qzCTDrEgHNcSaXfdE8NfZqK+AQ70gvF3keI
	VUQ=
X-Google-Smtp-Source: AGHT+IHTS9jPR539K9D88biPeBpW9OArAzo2mtlZDaqK9aFcfZt0G8LfWzYGUIJ/Wa0xrvoSHRJmq2qQHBOC/QtRtDw=
X-Received: by 2002:a05:6402:50cf:b0:640:c9ff:c06a with SMTP id
 4fb4d7f45d1cf-64350e1e3c6mr13108669a12.15.1763405162259; Mon, 17 Nov 2025
 10:46:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115233409.768044-1-pasha.tatashin@soleen.com>
 <20251115233409.768044-15-pasha.tatashin@soleen.com> <aRr13Q1xk9eunilo@kernel.org>
In-Reply-To: <aRr13Q1xk9eunilo@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 17 Nov 2025 13:45:24 -0500
X-Gm-Features: AWmQ_bmw4ppe8XlI-hroPbUkA515iug7-539nPCKhJSWJUeaHTdUDKi6DO6pH6k
Message-ID: <CA+CK2bC2_r4Nbjh0CuJwcMeGxpctSZMTodG8Cf=zoue6zj-gyw@mail.gmail.com>
Subject: Re: [PATCH v6 14/20] liveupdate: luo_file: add private argument to
 store runtime state
To: Mike Rapoport <rppt@kernel.org>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
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

> > Signed-off-by: Pratyush Yadav <pratyush@kernel.org>
> > Co-developed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Thank you!

Pasha
