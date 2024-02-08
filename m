Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CEE38DF2
	for <linux-doc@vger.kernel.org>; Thu,  8 Feb 2024 20:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707423317; cv=none; b=pA6aC3YbA9Qsu2wNbzXcpn0AXb4/DuW5k9qPuCkKfhkrmHift0Gqd4dWdcZQ2Y9RAMvsMeaWAoH2VLavU1qytMbPYzo+7RKSqjqWnBd6ZzcZKumQha2zUtHm1bpKBrjRS1GJ55nH5JeKD3MHD00AjuqiRulNpXsbETBBMatKQG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707423317; c=relaxed/simple;
	bh=w95z9LtvdNkUpKjwrkQVtuE+C6gu5L1A3XgFY1DPBwQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=e795cyP7l+p/rmCP1k2CmETmzuISFN0jj41R0Pa/bPLuK6dub4A9H6PinDmnqOSNYOsb+fYKMiJGfls6HAVDyrLFsoaASJbVJxQ8xAxVRNuEQEOC68SpxfVrBSf+8aziTDo4y5J9EbTka8DCoAhESkn9UiJXubk/1ZvnztbF0C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=MRbtKWwk; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="MRbtKWwk"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a38291dbe65so23298566b.3
        for <linux-doc@vger.kernel.org>; Thu, 08 Feb 2024 12:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1707423314; x=1708028114; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ov/TBvm47kxw1jS/iQPYWi8WL4vb2WCyBo35udeJE6w=;
        b=MRbtKWwkRWsMKPi3841ZliDeW18Tem4/NCIEFIUnoXsexbmGroufL+Bbq5ZKzdtdt9
         jVQQEVnbW/lWnjTdFqlg/DA52iyZOKx/HT6FPuE094AWXeingIFoaApfl2FRqkfnwaLi
         E8fORyPcyNVBt9ebxYBxgwaF16+02xzgiVHosB0KtoMa17C5ofKk5a1VBWf4QH4tlt+X
         vdlwidwMpEseZgCBhFUtpmp+7X7N9HVuAn4xnbU4NtulWKiSs5EWLrVWd3GjZuBbrpbu
         hV+0UfqWygftBC2MGkK+LYhGOJEXDI4/LnqU+gFuUgEmsFEWQYJ5cftvWcE962nqLlN1
         gCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707423314; x=1708028114;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ov/TBvm47kxw1jS/iQPYWi8WL4vb2WCyBo35udeJE6w=;
        b=KpI2TB/Co16C22p1rRhoKQArmxTkchKuGD7Wh3EdtZrYmUjVJyzKDzptEBhMZlt+/z
         d754O6ynLXQ4sMylgvlBOopXNH9UkhZRdRvW8tKTySEWTCYG5doZTl1RDxvw7pPFMW2W
         fHUQW1c6A/KGeV5SpNooukuTlh+zk6ae3arBbDwQSSmrrZZ80ch0GOgtO1luObAgfA6L
         uC9AoJ71EoSD6lerw0KaoDzaM3C1czpHJfAIbiYqeMyLixcTrvUwL0Zij9ytMrhUr3Ti
         Go6uoUaiRTJID87ScHSkafaaBv7rNlcZEhTHbQcFFJkQdv5EI+oi4K5t2VGVnqChHloi
         ufaA==
X-Forwarded-Encrypted: i=1; AJvYcCU4d0E9DxmYgS1UzRd7Zla6Fkzs1Z74EsKpZ/g2o9lRYTFAJ1XsTfw2mWSdUfj/l40wGBXKL3zBsfzS7U2hkpdgJfdsIOV8wIxY
X-Gm-Message-State: AOJu0Ywj6C1V0g+IziGv3yJdgncRiH1dcHp+uSOsNGMStKQ7nsF/Iy3p
	lyGXWpUOEeuRNv+fcjmkOLfP5YYPo07q4U2yhdL1J0PgoTNXLKnoFp4cmhGNFGU=
X-Google-Smtp-Source: AGHT+IEAdr88Gx/+vICgsj6ceeYZa3r+T0nuN2k07Ys1Uwbj6Q/O10AooapmOoQ1CFOIybiV97uVbA==
X-Received: by 2002:a17:906:b51:b0:a37:ee9c:273e with SMTP id v17-20020a1709060b5100b00a37ee9c273emr253338ejg.53.1707423313736;
        Thu, 08 Feb 2024 12:15:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUg4HE8l91/ZXCuypMsN86/4IlT7/vecXHWD7KIlb0DK0wt/C1cneb9b0Ejy3CraINpVMRizIFiwLLrplw/qtzbFrAUn9qppoSxLonsM/bYFj0hfqc3Mck0COTvrevbA1kofGCa1NgLXaIGe6tPNrJEEMoK3kzJJwqB66o=
Received: from smtpclient.apple ([2001:a61:1048:a501:d86e:8719:82c4:70b9])
        by smtp.gmail.com with ESMTPSA id q9-20020a17090622c900b00a3848ed2ef6sm22679eja.201.2024.02.08.12.15.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2024 12:15:13 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH v2] docs: scripts: sphinx-pre-install: Fix building docs
 with pyyaml package
From: Thorsten Blum <thorsten.blum@toblux.com>
In-Reply-To: <4c297f67-72e1-44d7-acb0-462ac261640d@oracle.com>
Date: Thu, 8 Feb 2024 21:15:01 +0100
Cc: corbet@lwn.net,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 mchehab@kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <ED5D37EF-B353-4EA3-8AC9-7368BDD2CFD9@toblux.com>
References: <c6555e01-1945-410e-9950-53c40052626a@oracle.com>
 <20240208131305.52577-1-thorsten.blum@toblux.com>
 <4c297f67-72e1-44d7-acb0-462ac261640d@oracle.com>
To: Vegard Nossum <vegard.nossum@oracle.com>
X-Mailer: Apple Mail (2.3774.400.31)


> On Feb 8, 2024, at 17:37, Vegard Nossum <vegard.nossum@oracle.com> wrote:
> 
> On 08/02/2024 14:13, Thorsten Blum wrote:
>> The Python module pyyaml is required to build the docs, but it is only
>> listed in Documentation/sphinx/requirements.txt and is therefore missing
>> when Sphinx is installed as a package and not via pip/pypi.
>> Add pyyaml as an optional package for Debian- and Red Hat-based distros to
> s/optional/required/ ? Given...

The commit message should be correct. The system package is optional, but the
Python module itself is required.

> Can/should we add it to give_opensuse_hints() as well, given that it
> also apparently allows you to install Sphinx via the distro package
> manager? (Not sure about mageia/arch/gentoo.)

Yes, I'll submit a v3 shortly.

Thanks,
Thorsten
