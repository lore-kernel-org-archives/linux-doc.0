Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB193BFE4C
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 22:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784326092; cv=none; b=NCIwdwoATFiQtcfalM33sOjOOCehhayXdPQfT1hFZ5+OlIGKwadWR3yw+i88OS/hXaxQ3/aVSl04hEsACw/NrGoYB2VVl1P+XfF/h9xgAb0xNTFTPZB85uVgxMLuljUpZt476LxPPe5EF3eZ3zwRoIw3JEXsGMlzYteu+YBo1V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784326092; c=relaxed/simple;
	bh=JvD6d52JVF0dw9KaC8NTS7eMJsBpt7DQsADyzRVcQlc=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=l5A6I/gMExRCA7syTGvc28RaMic11VQ/9++CGFpPwOA7PvqajUJ/heQUJRldFUbTT9gkaxotodHX1jor5mZeU9f23FbEXfAUJ/r3y0uxopbyYB89pJkvZtIcsiutKBVZvENdpLwFoh81bddSBe8n8T2SiNEM4p4oXCU08w4AjGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=D7exEhhy; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="D7exEhhy"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92e5c92c389so494295485a.3
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 15:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1784326090; x=1784930890; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fK1sV5PaPmcS6UhZ86Rm4HrquxZKQdzLRmcBNyv2BwA=;
        b=D7exEhhy4gPsN2+FvvWgQ+I8DsUUwXTlce02oSoRmBxasw3iJ1SIPJsprH6WCL+449
         QUKYY+Jc0CKv3oxYNnvKn9kMd+KBeq5RgpzV/ZIc8aVyEPGOly4nWcRX3AjrcPcBhrG9
         M+MKFICZJ0+yDJuSLS/DZSlGcj45pGH0qvGhvfREtAPZtRuSs/bQ+/4Fq7350uinjwiZ
         C3hQsUluynmewk7nW/kzA06oz3XISk2aid6/RVhgfkP9GA59ux2hi9d1indVRs/kqugs
         ZxCp5vvC4I5OGKrK+hKpvyp14AmEBXWEgWdaqjki/kYZxd8RFojBPhUT0+oyDGJ0mQgA
         lgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784326090; x=1784930890;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fK1sV5PaPmcS6UhZ86Rm4HrquxZKQdzLRmcBNyv2BwA=;
        b=j/NgtPoCDeTYFvn7zaExNMuMHqpE7uInfB2uC1c8KwXwRMI//Bv93EYnBNq5nW6wxM
         JTG/RN/WF4OWHvVKVW2n0dPprSXK0ezM47YCFTJnu4SV8chBremT0jGDU5YKQlD9z3yr
         1dk26z6AoFwamq3Uk/flwi2ZxKvMQiX4IWsvVwCeSlb9pE7R4nCbbxI+0VZAfQU/YAT+
         faV/T6EakG3OjqhmjjPTtMc4lOhnv2xBq1dywAk3nBBfKAlLO/UABsfsQfsi2yQYPQhQ
         2KdYfYLYPOXnX98GEBb7X7HZN1Tog/yaKGs4T+uatianQkIfRKVm7DGa2/uMQXFgQsR7
         fmTA==
X-Forwarded-Encrypted: i=1; AHgh+RpevaVugjajDdBCW4Yd5AMxGRnSN1XdWjqNVv8sD0H8rOXYAXpxdDQbkAZc1cX4zpl06DR6ZPtLKIc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoCDfjRGAuLxlDRjtQgB1YPVIRruWLDT+3DlKSg42S8xuYfMaq
	OQfM9DchOOrfTb6IT+FfP5NMjjA7jxX/zqHuX1pGbtAxUvnlJB1/LTwSxHQf5OsGOwc=
X-Gm-Gg: AfdE7cnMK7lYLfQzkony6QcFQ3gp1yI6J8IJ8deP5/htwaYJZGrjm78ESWhf8DrLYow
	MEnwSyI5xmdAaU3LRr7HyOCdoTmg2l/plel+gUOg0StLapNDsembSBHjnvx/AsvRQmGHGzVq4Vg
	75/iR3muN7OFv2+cz2I3TwgLjiYOWKUVPz7TOyFDtshH/JkG0sxyAoRKk0wN3UKP719bkEHNNHE
	E1Jw0j4zP8T0DwTbOAXsU/bpLCOJyVN60gulbjI5NXlVlSIlRdMnYtLY1X9+SOarFNtZEPGtMWT
	foxqyP7Aq/vAnugodMHBEFL3QHWp33gTSfzYfGEbIzYM2wiU9RzKqogZbi6kZmUYPG9wmtx3lny
	TvZtxZxEUVH7WL5Rn+0vlLbPou1yx/C1gB5ywj7u1HRlY45+hhT6mrMapiFhyOsqZzDkfuyqr8z
	raXVFydPIqWaIRDlrponzdJmoQdURCIRvqh/EIaXU=
X-Received: by 2002:a05:620a:27c8:b0:92e:fe10:333b with SMTP id af79cd13be357-930b41f9901mr535269585a.65.1784326089627;
        Fri, 17 Jul 2026 15:08:09 -0700 (PDT)
Received: from [127.0.1.1] ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b52e0f87sm257411385a.7.2026.07.17.15.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 15:08:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 08/12] PCI: liveupdate: Inherit ACS flags in
 incoming preserved devices
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
 Adithya Jayachandran <ajayachandra@nvidia.com>, 
 Alexander Graf <graf@amazon.com>, Alex Williamson <alex@shazbot.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
 David Rientjes <rientjes@google.com>, 
 Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
 Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
 Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, 
 Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pranjal Shrivastava <praan@google.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, 
 Samiullah Khawaja <skhawaja@google.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
 William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <20260710212616.1351130-9-dmatlack@google.com>
References: <20260710212616.1351130-1-dmatlack@google.com>
 <20260710212616.1351130-9-dmatlack@google.com>
Date: Fri, 17 Jul 2026 22:08:05 +0000
Message-Id: <178432608536.189683.17937493816735356455.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=669;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=JvD6d52JVF0dw9KaC8NTS7eMJsBpt7DQsADyzRVcQlc=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBqWqfHpXPLQRJGmFv5A4z6Gn3ZGKfCiLrGZFJYE
 58dLVR/0DiJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCalqnxwAKCRC7dyhM23N6
 3nFoEACAMT3npwEDLawBzNMz5alv6oFvn/SKvY0p3N9N7lfY9rerg7LRUYRvEVf+TYGrtjTjgKC
 XpMxGn6W9G3uCTaWP5/B5bUX9iOkHNBgeZ6CphGCWTNjgxntOYpHpXDUfUe5vPEuaB21BCKb00H
 /boplL+neL6/tFYPnWk3feYN28FvkiXpJa1w4bpLVUJaV81/l8du0RTTTendMCT/iM8CsQZFdKg
 XXIz6uulPu+EUEn6yHi0dt37WyEhuB2i4QzJS7uIqv0vtEHW9bjIe+yE1X5rEFCk6hEkUnkdHur
 woH+mrGI2xscTu2d4ymvl8mB7IRj8Tvl5mo8nEk7zAitJ0JSk6lRaDJGAY+C/PTartb0wpNvWUS
 Gm2Q/v//Ntjm1RUidQSBijxhimUnnhQ9SBzGFES2gijkXQBcf5d1679whVMjGNvppPHjwZsUXIk
 3RrGudA10XpLugTQr9B1GBQ5s2vwBRInivaoons7l4QpXJIUGxpApVRvlWVOEVrWZQbvPeMdtie
 +m7b7s30saS2X/yoNfNTf047Kms/LVNpUJrlS9iMDqANRGlM6iW4RW9XBPfzzcGXbKG9WkwuKQi
 BE/iu4Slr8z89z2CsULzwaGdgTjJivJg7eBPhDcDQQRw22q+lpeFRl5CGf/7I69oEYVuQ6o4QG5
 jAh5AuDVak+U7JQ==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Fri, 10 Jul 2026 21:26:11 +0000, David Matlack <dmatlack@google.com> wrote:
> Inherit Access Control Services (ACS) flags on all incoming preserved
> devices (endpoints and upstream bridges) during a Live Update.
> 
> Inheriting ACS flags avoids changing routing rules while memory
> transactions are in flight from preserved devices. This is also strictly
> necessary to ensure that IOMMU group assignments do not change across
> a Live Update for preserved devices, as changing ACS configurations can
> split or merge IOMMU groups.
> 
> [...]

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha Tatashin <pasha.tatashin@soleen.com>
