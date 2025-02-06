Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00A12BB13
	for <linux-doc@vger.kernel.org>; Thu,  6 Feb 2025 01:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738803973; cv=none; b=hmmdgftqFnZilMcJXdfkyE7rdf5jxBgNp14W/BVuSxRAccumV7rr0dmmEFXg5uZ+Ggn+mVJdxn7lHmt+UVvx+LMQujE3riCz9eyMT0c3LySRf0BSfHy9FOdFDf3+GqNolEp9m2N1Ilk1crnPNZdOHCvmKp4v5sH3kKSGMyyU07A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738803973; c=relaxed/simple;
	bh=IXC13o6D8+SRcnZ4bUuI8mYmE2RIqCqJ9wgb+sl11jc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=uYY93XVYN+w0utVmgCvpKCMBbyYl9nQ3TINRenlpHQJvDnEcObCPeVSdbS8blCd+qljzUhmeorG0xYRkhAhoB8PIVtjoQ03a/cjzp+PC8N4GYZgsZdCtGVfP34yIkabwOaReQNefkItgj5IWPjCZxysPREXa/c0VLYZd58YNE2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com; spf=pass smtp.mailfrom=jrtc27.com; dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b=ioCHvCoI; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b="ioCHvCoI"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43634b570c1so2329435e9.0
        for <linux-doc@vger.kernel.org>; Wed, 05 Feb 2025 17:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1738803970; x=1739408770; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXC13o6D8+SRcnZ4bUuI8mYmE2RIqCqJ9wgb+sl11jc=;
        b=ioCHvCoIHjgIxCOm7Fu2bDZ3vrCuFmrV7l7XhRtTqLkdDXqFdoHCra5rd/ZEtNGTpf
         yJk2oNbTsPQjTYyusPKhNhHXNaEf490k4oYL8d1o0Mm3/FkhuANbwc9WVgkx8wTlPLeV
         8FLckQCuFPd3YT9tmTHy4wrn7JSWML8ZbmePzdfcVxoIzm38sZvppJPejGy4FAsYcRBd
         0qwHZU3xJpUABEdWIFGSAjk+3MXTTZ0DhZsWm1n7eN0SdCQd8QX6fSDFYUVxkiWv7X7Y
         YsQEIG51xhktfbJV45XtNj/naOxc6NUMdfJXi2yMjuUWluX/QcI2LC7tpZZNtQv+kFZH
         QQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738803970; x=1739408770;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXC13o6D8+SRcnZ4bUuI8mYmE2RIqCqJ9wgb+sl11jc=;
        b=g1EGwQgTdt3Od6z2pTJ4V6cI75kZlvn7wezKUlyRFnLHqS+2yBzXOdOIROvoXWg8zk
         hXUo2ovpq5YxAoGcTeDmfh22gdLkNSt05ULpdJ63+uivfVRUEkLz/J0Ms/JNPvdgfTkp
         /wUEtcBGWybBcxQl/S78HtvVHviuzkxeV7ZruMqigo6IkrCPTryoPer4kNIV+JnJlL1m
         P9D8SOpLzsvrezvBUQjqLQ6D6ijJNZGL92aNOzbXRCgG1/ptZurnAimfz/SMPgags6gO
         BRffHhXD0ANzYQ/T3tbCsxhzmTr9pcbhW/IXTc1pcinCq3F3is2Ckm6S6rf5E780HUD8
         5ixg==
X-Forwarded-Encrypted: i=1; AJvYcCXIdGbIyi/LbHegupCxz2Uk/vSGffXRPbfhHOosUsJeTNT1Ec7ElTrc/4JcHiPzC5t9OwfS/xfgLUI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGF2jVbrwEZebhJ8QDYUQTX3+wNRirQR2JsuZ+qiiV6n2m76QM
	wsp9e1zBMeW39YU0YUZBqqHnktqmLtAqBakZKRtNkLh3DuwQzTPCLicfDwFes74=
X-Gm-Gg: ASbGncsed1XN/qcmfNrLB8zcZ2OLFp97s3O9awCzVxea045TuF7LrNZ8kPTTlMcAZrB
	3JTl+/wdhnejLye68JLjkQL0LNZVlI9VzaeTIhdJcSqVNA+XWYjpXHEep3gjblGwfG5JZlxybJx
	oPbOnNUGWuozo1S9zbCWifLUbOJErivAfME6MIxRVc26TjtDCboxXbDfmAce2AP4DXUVbPm2YzJ
	otgLExh5t5W0EA/l7gerRMpTwsN2G2JIE8qcGJDwX0T2035PDWtIYZSnHcqejgaXpd80z1E3sXY
	rdFrGV4DVw3h+y4HpxSh98FFUxxV
X-Google-Smtp-Source: AGHT+IEwac37+EXHhjn9+QPVtQMUBZtDhAuPXBew4a2Q2YL1bLmJ4OaTvYU/Tl6sFbBaC4yuKH/eUg==
X-Received: by 2002:a05:6000:1f87:b0:386:3e48:f732 with SMTP id ffacd0b85a97d-38db4873819mr4226170f8f.16.1738803969824;
        Wed, 05 Feb 2025 17:06:09 -0800 (PST)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde1dcc7sm246954f8f.88.2025.02.05.17.06.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Feb 2025 17:06:08 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH 00/15] kasan: x86: arm64: risc-v: KASAN tag-based mode for
 x86
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <72837fcd-97a8-c213-0098-c8f308c3415d@gentwo.org>
Date: Thu, 6 Feb 2025 01:05:56 +0000
Cc: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
 luto@kernel.org,
 xin@zytor.com,
 kirill.shutemov@linux.intel.com,
 palmer@dabbelt.com,
 tj@kernel.org,
 andreyknvl@gmail.com,
 brgerst@gmail.com,
 ardb@kernel.org,
 dave.hansen@linux.intel.com,
 jgross@suse.com,
 will@kernel.org,
 akpm@linux-foundation.org,
 arnd@arndb.de,
 corbet@lwn.net,
 dvyukov@google.com,
 richard.weiyang@gmail.com,
 ytcoode@gmail.com,
 tglx@linutronix.de,
 hpa@zytor.com,
 seanjc@google.com,
 paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu,
 justinstitt@google.com,
 jason.andryuk@amd.com,
 glider@google.com,
 ubizjak@gmail.com,
 jannh@google.com,
 bhe@redhat.com,
 vincenzo.frascino@arm.com,
 rafael.j.wysocki@intel.com,
 ndesaulniers@google.com,
 mingo@redhat.com,
 catalin.marinas@arm.com,
 junichi.nomura@nec.com,
 nathan@kernel.org,
 ryabinin.a.a@gmail.com,
 dennis@kernel.org,
 bp@alien8.de,
 kevinloughlin@google.com,
 morbo@google.com,
 dan.j.williams@intel.com,
 julian.stecklina@cyberus-technology.de,
 peterz@infradead.org,
 kees@kernel.org,
 kasan-dev@googlegroups.com,
 x86@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 llvm@lists.linux.dev,
 linux-doc@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <29A74A26-E922-4A4F-9B4A-8DB0336B99DF@jrtc27.com>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
 <8bd9c793-aac6-a330-ea8f-3bde0230a20b@gentwo.org>
 <F974BA79-80D8-4414-9DFD-1EEF9395143C@jrtc27.com>
 <72837fcd-97a8-c213-0098-c8f308c3415d@gentwo.org>
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
X-Mailer: Apple Mail (2.3826.300.87.4.3)

On 5 Feb 2025, at 18:51, Christoph Lameter (Ampere) <cl@gentwo.org> =
wrote:
>=20
> On Tue, 4 Feb 2025, Jessica Clarke wrote:
>=20
>> It=E2=80=99s not =E2=80=9Cno performance penalty=E2=80=9D, there is a =
cost to tracking the MTE
>> tags for checking. In asynchronous (or asymmetric) mode that=E2=80=99s =
not too
>=20
>=20
> On Ampere Processor hardware there is no penalty since the logic is =
build
> into the usual read/write paths. This is by design. There may be on =
other
> platforms that cannot do this.

You helpfully cut out all the explanation of where the performance
penalty comes from. But if it=E2=80=99s as you say I can only assume =
your
design chooses to stall all stores until they have actually written, in
which case you have a performance cost compared with hardware that
omitted MTE or optimises for non-synchronous MTE. The literature on MTE
agrees that it is not no penalty (but can be low penalty). I don=E2=80=99t=

really want to have some big debate here about the ins and outs of MTE,
it=E2=80=99s not the place for it, but I will stand up and point out =
that
claiming MTE to be =E2=80=9Cno performance penalty=E2=80=9D is =
misrepresentative of the
truth

Jess

