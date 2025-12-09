Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA20D2EA151
	for <linux-doc@vger.kernel.org>; Tue,  9 Dec 2025 22:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765319350; cv=none; b=UYpL2eNw/YbKokSNaX0VXc5z72s/dxFWOQVJQbYn8aU9Iir+RH76jtN78NzTvq5qXuCkvFD27mYrD2zx1sVVaRgOFblnjudN8IjVstb7N5wCHGCq6ZIIeCDpS80EH41anoYH4z4ARSLZ5fXVXp5fVV8Nc6FbTlphhWnHpTYGLio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765319350; c=relaxed/simple;
	bh=o91c+6a2q/yielwE2TK8La+n/rzQAcUKJ4GQTa1UROY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N+QUIA9HkQfeV1XMQAXdpCtXNF3Pw/8R1KMqVkQQKaj4l/MDfWE2FVNbzAVI0wuliXpj9taSgSdzR6YYKl1YoFxqdqMv8AmVc/BIldabYaZtkQSp/QT/b77w4ul+Jl3EvOnEpItw3jXEji/u86VNYx60pYIA42o2wbeskTXnfFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJRI0IHh; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJRI0IHh"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-37a875e3418so47380141fa.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Dec 2025 14:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765319347; x=1765924147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TyOMhD5Nr+LLEEj2u+rlI4XyERWdrAPIKpRVAUxLoC0=;
        b=GJRI0IHhP3v1rDmq/Y+SE9mCM6bpBPoOToIv9/eRDdFgOlxaNa74xVsDmht6X0NvA/
         C44RvSpQVBTQAGg+P1luNGQh1cyBtKIRprA87iCp4C9GsA20ZmYyCZkaKz1KTGY+28se
         mNH/+vrs3eXEfAfqUQi1MzfIzX7kkGHKE4aZH8a78dEZPdPqcvYQj/UhvC4ailBe9ePp
         vzy/iaLml9diLX8CDHcghBjMXUdZR5VIoIeOTzL71BZb1GYcGWnQMUz+idh8V25fc4U4
         VmJA552g9G57uCP5aZI7S6fib6gvEixoSj1ym+mmpczUrjTf8joGuEOJWbXXg66cfArk
         prag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765319347; x=1765924147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TyOMhD5Nr+LLEEj2u+rlI4XyERWdrAPIKpRVAUxLoC0=;
        b=W4c1D3/KIbhx1oWIt+bIle+ri+7eTuT3YRwWmAIm/0bqYBvXyhPsaNMd9m+naKcAyx
         wEQwkr3lgWLeYkmmSRA0taptKYKNwuU3q5qWzWuB2PB3us4E2PL2RP5JXHjqdEitZXLO
         Qa+L/TaK94E7Y+c8qD+UUiwNj7Ao97ORXbSWVp0Cez9xKw2TTji2bg2CtLmCc7ULs2ec
         JO2iLDlqcKcK+L8iAygWQPPidt6AOuJbxLAo2LIL3oYai2hk7NNWkMrDzsfLKSizjB18
         SWEh58SiC0vSEceoyVLsRqjKEh77qOntsNZppn8MNgPj6zGxk4KJXBF8eLCut8oa2heG
         ZkhA==
X-Forwarded-Encrypted: i=1; AJvYcCVZEUUdVyYnFc4F1J8XfTemDTSIHI93nhe1BojnM3LFt3hDocd7OcYGWS5ebmb5i4OpWcjJElqou7g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3g6ULE5h3ZwOZjGZXOoOFH8InbcJWiykVVnaPSD4n5QehmR09
	uH9QCP7Nf6kpEuDCYEdFks6r4EnS7GqQfyIfpMgFQvtTGjGoALzLEmTsL+CUew==
X-Gm-Gg: ASbGncvbpCPnIyx3ZLROKr/reDVHIvJVGAQ4JdITC4CNyVmZ2IPICK/o9Qe0eeB/Plr
	Rl3YHfvWb+LYYIeFzCAeg47Tt2z42x3axt/FNlzhKhQ387Pu5IxMyJ4PW/Q3BiF3a32zDE75g+e
	dGWLmgSSeovc10HYxha+B0qjqRQGq5QyQXTQfTR7czdKVf04xB/BRGaTtu+INSiuPD7TKOd9jxV
	FrSMRkFfjm2GC+ScgclAuY/xLSHEw9jh/n1b6SFoKX9d898QDG8WcKN3x3s4PTkX7ugk0Neh9UA
	w6pYg9JfIvgdP45JENlV1o2L0P7SurxnP9SbrbweT+y+rsK6OhZD8VOthvbO7Z879SwotWF4iqA
	UjWvUkuPPlA+pfTvjtvWsETa84r2GdUCFaEqeVs3frjgcZKZhS+9vARABZLJ8iPpnKf0FdRGWFX
	Q2ueLPDKrb
X-Google-Smtp-Source: AGHT+IEN00QefPL8NG5lBt7cd2OjXvYRO37SYqe46Fgp2ovK1ah9X3lROTHrSbzfsXh8SvY49U2k8Q==
X-Received: by 2002:a2e:be9a:0:b0:37a:45a4:e873 with SMTP id 38308e7fff4ca-37fb20fa962mr1047661fa.30.1765319346326;
        Tue, 09 Dec 2025 14:29:06 -0800 (PST)
Received: from localhost ([194.190.17.114])
        by smtp.gmail.com with UTF8SMTPSA id 38308e7fff4ca-37fa9bec20esm8264721fa.23.2025.12.09.14.29.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 14:29:05 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: cedric.blancher@gmail.com,
	Martin Steigerwald <martin@lichtvoll.de>
Cc: lwn@lwn.net,
	linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	news@phoronix.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: d_genocide()? What about d_holodomor(), d_massmurder(), d_execute_warcrimes()? Re: [PATCH 15/20] d_genocide(): move the extern into fs/internal.h
Date: Wed, 10 Dec 2025 01:29:00 +0300
Message-ID: <20251209222901.1693280-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CALXu0UcCGjyM6hFfdjG1eHJcmeR=9BVSaq7Vj9rtvKxb9szJdQ@mail.gmail.com>
References: <CALXu0UcCGjyM6hFfdjG1eHJcmeR=9BVSaq7Vj9rtvKxb9szJdQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cedric Blancher <cedric.blancher@gmail.com>:
> > +extern void d_genocide(struct dentry *);
> 
> Seriously, who came up with THAT name? "Genocide" is not a nice term,
> not even if you ignore political correctness.
> Or what will be next? d_holodomor()? d_massmurder()? d_execute_warcrimes()?

Good news! :) Term "genocide" finally gone from kernel some days ago!

In this patchset: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7cd122b55283d3ceef71a5b723ccaa03a72284b4
( https://lore.kernel.org/all/20251118051604.3868588-1-viro@zeniv.linux.org.uk/ ).

-- 
Askar Safin
