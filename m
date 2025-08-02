Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDCF17736
	for <linux-doc@vger.kernel.org>; Sat,  2 Aug 2025 23:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754177628; cv=none; b=qYYgv+ALh39juT996WaUkidM5iCPBlLJJs9O/neInoqfyQoUiF7OVPV/ZTPG/v0zpAloeyX8Mdg9y2RfHfpRx4VP6uXgOY/q+zzLwpNPbgeToqYBx+R/ydD09+q+A5+BULswZMBcNGYJ0Qdv0d5BbXZ7Wh+NJ+UucD7R88dfwBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754177628; c=relaxed/simple;
	bh=kJsgdU92CHKcumA558FjE09dL3p6PDIATBJc8UDK+q4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AV0vkuRvxK9RpG4vAxrfP3kqycprXC/g9HtcKsaZykRjhGcYNglaT+uIVS6xo9yhHQyITEpTt3HeVsHAayqC2tc72zJjnqgftNvgnPwSaHUym2eN/aYi5B599yDuu3/88wAjRyyUSULTq+iwysTXZx21n8tfeiifesOr32rPnRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=IzAEYSMQ; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="IzAEYSMQ"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4ab71ac933eso17452881cf.2
        for <linux-doc@vger.kernel.org>; Sat, 02 Aug 2025 16:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1754177624; x=1754782424; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kJsgdU92CHKcumA558FjE09dL3p6PDIATBJc8UDK+q4=;
        b=IzAEYSMQQxBOsikic/wv4S2Ak1IkZWDRqiFN9WKskOPCYCKnFySUQlasVHApND+PMR
         OCjjIv3KDQDhiLV7iCbKECJEl0TiLe3LVTmuy6gNIAPlrHpPMvaWeAUew+pYDqxDAdq4
         cRYIk3Pk40uuINjMm25FNjXxHw1561DmTbJKWM4u2DSj995QfnrH1KmOwQGD9nFg6Tzy
         eSGc8sOAfVf6chgTuWPeRCwVLIPcObgRenylCwTmVbeWGXJ7/Ql9GaIrxyl7KD0kBpwd
         JYCDYQADCKMCdpfH8waqilxH0gttD+Wvvd/08ZapWIo6fXD3VG1lnW9cGur68EAGto5p
         gp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754177624; x=1754782424;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJsgdU92CHKcumA558FjE09dL3p6PDIATBJc8UDK+q4=;
        b=HCHinzVOT3Fp869dvmHacxe5nRnmLq28hlBqBuFzvShPaw//WXOoY3mMRH1/KUHVaE
         sTTy/S2b3bVsTK6hKrQFDwxVjt8wXYE/3kq05rDiwNYBwgRDfLXrMwPruZ35WrMbOiUe
         0HkT+dCalpVMAZZ6+QNL0uBzRs5rlQydHmHrzU2J2vLBgTkdwR0A6Kn94fYHmOBVhGFg
         180SAkH1Eqb9UNu2sDQ0KRIAH5UQ18iaWVVd7pVOOZzITiJS03LOn/QiauVuZD856i+2
         EpEj3zN9Gbnn7rHHtWyLvB0ds3XgkxJ96cgpjSSphTVSDXx+dCEce8u/5uqV/zqg16u1
         tIqg==
X-Forwarded-Encrypted: i=1; AJvYcCUzRo32vs4lbrQ/GXk3f0/czYDNkGQXl9vVBB61w28oU6D29bB+u4xYhi4Ciq71oAw7rKuLlPt8QC0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLBBAlwrff0hcpfv5cCb6n6u8pIAMEhfjoJ11R+kV7r13iWWCy
	gBNGIx4l7667zCdMrJSGA9+rhofDH+ISznWS4T/ZGRMyF/W5lSqoGs8wSMdIo+0Yl4bGKVmwauc
	xyAFnggbCXllC7ejlsG9ozZU047mVbZSXimAckHUSjQ==
X-Gm-Gg: ASbGncvrVhEakqCqgFaYuqtLomnUNlUaglvwczEcmzEjaet0M+oajThttxyBuqNHPQc
	5Qll9cJqaTqQVBj95Zvz0f1/MT9fJHcS7AFUspGw2Yt7xpfTNmPuIEq/Z+OzLfbN/yA3yheYD/o
	e6hX88PIusFpG4k8ad4D5DhQqOyDdJGQMhF6YxQwgPi0ycwu972ld4giwtci+tmXTK99Mr0XMGK
	9vgUj12ii6O7qw=
X-Google-Smtp-Source: AGHT+IHK7fLZil0+YTWDez+wvKBQ8V6Jt/OxjDZMFuEzIGCH7fVFxrWmUeAnr0aeRkYb+cC5kQOxq3dgtd4ni01q4II=
X-Received: by 2002:a05:622a:8cd:b0:4ab:3ffe:409d with SMTP id
 d75a77b69052e-4af107905acmr85155491cf.0.1754177624500; Sat, 02 Aug 2025
 16:33:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250723144649.1696299-1-pasha.tatashin@soleen.com>
 <20250723144649.1696299-2-pasha.tatashin@soleen.com> <aIdNTN1qd0dTvsQm@kernel.org>
In-Reply-To: <aIdNTN1qd0dTvsQm@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 2 Aug 2025 19:33:08 -0400
X-Gm-Features: Ac12FXzhu6LQ65rG6yLekEcwlc9H74rWaGowwnkVgbEc9_PttPli4Tw81uem1BM
Message-ID: <CA+CK2bD2pyWmnzDyRA54nXQwB1ABPKqWP2yH6bVnnE09ogCHXg@mail.gmail.com>
Subject: Re: [PATCH v2 01/32] kho: init new_physxa->phys_bits to fix lockdep
To: Mike Rapoport <rppt@kernel.org>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, dmatlack@google.com, rientjes@google.com, 
	corbet@lwn.net, rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, 
	kanie@linux.alibaba.com, ojeda@kernel.org, aliceryhl@google.com, 
	masahiroy@kernel.org, akpm@linux-foundation.org, tj@kernel.org, 
	yoann.congal@smile.fr, mmaurer@google.com, roman.gushchin@linux.dev, 
	chenridong@huawei.com, axboe@kernel.dk, mark.rutland@arm.com, 
	jannh@google.com, vincent.guittot@linaro.org, hannes@cmpxchg.org, 
	dan.j.williams@intel.com, david@redhat.com, joel.granados@kernel.org, 
	rostedt@goodmis.org, anna.schumaker@oracle.com, song@kernel.org, 
	zhangguopeng@kylinos.cn, linux@weissschuh.net, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, gregkh@linuxfoundation.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, rafael@kernel.org, 
	dakr@kernel.org, bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net, 
	brauner@kernel.org, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	saeedm@nvidia.com, ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com
Content-Type: text/plain; charset="UTF-8"

> Just int err should be fine here, otherwise

Done

> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Thanks.

Pasha
