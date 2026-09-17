Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AFD4E9C2D
	for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 20:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789675895; cv=none; b=JXdSJVkPl8pT7HEFAlJk+3Ct5FQ3pg7OII2pqvQqlmDKxw24JdbaN8XV3/od/72D4fBip0k/JP7F2PdK/ej6pfkqpVo2bEgSK65WQNQmc05JAOpAZR10NrFGjAIXMu6nBOsljyTM/KQF7VQFHLwgVnA5Th1yKc8tjxki4lZ1AoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789675895; c=relaxed/simple;
	bh=Pld+KJDf/y0brTSHAZfyNj7LwB26z/vcvvMjg82D16g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=H2tSvTqql7iQ0ZsTITCOmMJ5piOkdtdecioQSEjYXyGuJFqX7ZHuaxRl4NEn8J8YpJGB7yozxoVxbgf+iOmX0G+Zv+A1mfov3xwulAwwSuqzwerGbXmZVdfh1lRG7UI/g4eDxK9E5lCKZ2ebrnkDfPqz4yOXPlWHU6P+2Fy2Mmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEG1HNV1; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEG1HNV1"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4c08393dfso1063339a12.3
        for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 13:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789675884; x=1790280684; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Pld+KJDf/y0brTSHAZfyNj7LwB26z/vcvvMjg82D16g=;
        b=jEG1HNV1nB356xIIlFyTqdaGPUUh9EjM/3PMbUs+3AGI4ehoP6+sJVH1PhlKRJdi74
         49iLVhT9tC9NObKt7CYqbEQamlyNxL8drgZcjYZ9wTLMuI4t48nW91cDfveXf0Si7vCw
         54dSWTEmPbs9HqyhwNdcIeab67Tty0F+QyFDkFaySQpj76fSQNllBZtFFvlb1jacOCR2
         FmpL9hmFxdFK867OkjHeAXKI83GK8UB4CV1xuosFIQTGXxVsJUsjkAlXWhAILWlyh4HL
         lpFK8QRjRmw0sPKGRoO7Aa3cih6io/pYDi7ISzk1TEp/o6Wckao1szsQ3Um6dWzlqWkz
         9vEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789675884; x=1790280684;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pld+KJDf/y0brTSHAZfyNj7LwB26z/vcvvMjg82D16g=;
        b=NNNKD0BlnBFRxYPKL9237NTAaGWozsAEiM67qAxDp1K0My72EzvvQhypoE4YD4Cr56
         Q/3bdaxlULaczvlnhp6iLFgrO48blrRvQmpOL3LdA3UXU9C9wb1Rxh7gq1VyAO7sXb4h
         8KkISrjp32WRcIgjamYRktChaVPeu/Kmjxi0+7wFglh9z0vTe/2uPuvt/oouzYt8rcDQ
         +a1HjKU+54GV3HrcqaIWSGHDvCE1OyR8cjITJOs2U81HhKSsKYaiwar32BUeH/6ChFZ6
         BOtPcm0NPCguO/DTsjigvEMe1QdUFVUWv8C4j2iSp0ZA8WMM3S2UYiZVZ0ua1622nc76
         mybA==
X-Forwarded-Encrypted: i=1; AKwUvBzvcAlM0AoIpzc5AqWLUSY/UWszTIrj23l6hQR3P0ghYXhn5eXMdO1DDSMOAOHlYYCOOf638aB+cEc=@vger.kernel.org
X-Gm-Message-State: AFuF++kFaeuqmeJT/bw7rgKwQ+MP8a/m2o7YbOJm0vsIQn8WjMiloo4Q
	xvH8GkayHMj+/eB4Xv7UpDYpQ8e+s2lfpN1GJmbT4GfdKfhviAYZICzM
X-Gm-Gg: AYBFou0XIzugtZga8u7e/Tjav4dG1AyQK7QL6BQAOgudi2w09ubhrB/P83CatU7ZGdX
	dsy+yg4mnCooYTfZAbfbKkFepiYcXXDbjxHm3rr8//it42wa+tA5mjg8+k6xQa5BK4P1w7cfTxb
	CfJwmIIHXTAuUvss2D6+jOL51BXbce44UY90hClGCwJaaB7C1fJteCtBw+uUUVtuq8H4eL2oBo5
	+Dtg3U2WzQauYnq/4GyLblEVhMRas2aS+YFvCmDUsBq6XCbNmPeMZWkc5UxSnkgs+PMncqpeAUd
	al1Ac8cCqm4iv8EHoZ46TKEcsDX0l8bOsk8KeXGvCrWPBCxt7sXkm7k6a+YtkkaLkHAS6ei++lC
	NWzZlMZZlOMnjBVXKYzcNeBvXZI6LHHEk3X489dVzzE5L0tHdbz2TO1jmwmYJ/ral7sVVhXFEyf
	LRcGTswpC7ZScLYwu/jdMNZ0Je0cv7mLmBCGoJ6gG3jHfIWeJ36a/1M1qxiBhGQCKQcsVN+hSjP
	XvO08L0T7+siENRF4f8KtHyym4=
X-Received: by 2002:a05:6a20:cfa2:b0:3dd:5831:ef58 with SMTP id adf61e73a8af0-3dd8c456190mr204908637.15.1789675883461;
        Thu, 17 Sep 2026 13:11:23 -0700 (PDT)
Received: from localhost ([13.93.150.60])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d13ee7sm16211287c88.8.2026.09.17.13.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 13:11:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 20:11:18 +0000
Message-Id: <DLHV5GF21AY4.3GAK241ZI2UR8@gmail.com>
Cc: "David Ahern" <dsahern@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Simon
 Horman" <horms@kernel.org>, "Randy Dunlap" <rdunlap@infradead.org>,
 <netdev@vger.kernel.org>, "Arun Ajith S" <aajith@arista.com>, "Roopa
 Prabhu" <roopa@nvidia.com>, "Jaehee Park" <jhpark1013@gmail.com>, "Jonathan
 Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Shuah
 Khan" <shuah@kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 "Alexander Aring" <alex.aring@gmail.com>, <linux-wpan@vger.kernel.org>,
 <linux-bluetooth@vger.kernel.org>
Subject: Re: [PATCH net-next v2 1/2] ipv6: update NUD_FAILED neighbors from
 NA messages
From: "Lawrence Lee" <lfqlee314@gmail.com>
To: "Ido Schimmel" <idosch@nvidia.com>
X-Mailer: aerc 0.17.0
References: <cover.1789448374.git.lfqlee314@gmail.com>
 <6596966f734f3d416bfa83722f7a595149bcc3f8.1789448374.git.lfqlee314@gmail.com> <20260916120202.GA935660@shredder> <DLGXDIB879EO.IDZNAIRY0VFJ@gmail.com> <20260917143750.GA1332286@shredder>
In-Reply-To: <20260917143750.GA1332286@shredder>

On Thu Sep 17, 2026 at 2:37 PM UTC, Ido Schimmel wrote:
> On Wed, Sep 16, 2026 at 05:43:11PM +0000, Lawrence Lee wrote:
> > I added the lowpan changes after my local Sashiko review run=20
> > identified an issue where a FAILED neighbor can retain an outdated=20
> > private short address if it's moved to STALE by a non-override NA.=20
> > Happy to drop all lowpan-related changes or update comments/commit=20
> > message to reflect the changes, please let me know your preference.
>
> And if the entry is INCOMPLETE and we get a non-override NA?
> lowpan_ndisc_update() will ignore it. It's a pre-existing issue and
> there is a TODO comment about this:
>
> "/* react on overrides only. TODO check if this is really right. */"
>
> You can mention that it's a pre-existing issue under the '---'. That
> way, hopefully, Sashiko will not flag it and it won't clutter the git
> log.
>
> > This was added in response to another Sashiko local review finding. =20
> > Let's say we have some FAILED neighbor T with NTF_ROUTER set. If we=20
> > get an NA from source address S with target address T and with the=20
> > Router bit clear, existing kernel code will cleanup routes with=20
> > gateway S, but IMO we should clean routes with gateway T instead=20
> > since that is the neighbor which was updated by the NA. I can either=20
> > update comments/commit message to reflect this or remove the change=20
> > entirely, please let me know your preference.
>
> And if the neighbour was in a different state than FAILED? It seems like
> another pre-existing issue. I guess that in practice, most of the time,
> the source address of the NA is also the target address in the payload.
> You can mention this under the '---'.

I will remove both of these changes, add comments below the '---' as=20
suggested, and resubmit.
