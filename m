Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792933849;
	b=jIO1/tOzVMzKT495uBGKlwTk0CuRpCdZSBMsCGWenEV8H5dL5w9BOkHw/xUXx+SKS+Nf
	 9EnAIGpTLP98iJhmN15OfnmvGm1EUstSyI8+hRm6mnoM3N+gRMM8lQ2UDYvZCGeQaA2qQ
	 KnmUFXtICtrdqbMmSpRCePSaSNAoMbv0xIGKGEtYqDYq5sytD7CbStNq5YKZvR146QE5a
	 /Iq/uPciglNNxLbx+ROGPK3AtLlZpNxHGY/UotJi6iNd9EiEfMO+2RbniixUciqX4GiRj
	 FCYcnFdxxRDkCWuNVqueuc2sYWlzjuJRnfmwueuEvKrxLBrvYtyRb0s+mxegMJaVLeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792933849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=vWsvI+WhZ/eBQ+bJmj0eGRitrJCJTUhFaPA/quTsmaQ=;
	b=KbdcxmkXldDMUh7z6AZYSaUl6BICbk6qoXaTvfe83pOpPSnqZsooWUVsweqoUSLCel9T
	 ShCLZfQgEF1KC5ymOMxGdUIB8TJek9n8lRGQjrTmlmgYLlAud48qVfFTE341UqgK2REqj
	 R2YKDJPpYoj/ltmpi8Ys3NvOd5E6vlE3SfYUaWLTp4iqjlMQDMs3IFDktCDvLcd0RLQlk
	 ZJW/XWLZ6vIy9UyQrMjtCJc3k71LfS4i41oImD/iF+6s8rSBClPWNrpCLW5cJWuAzQ5uJ
	 PAOH4tw9yWzdKD0xNuzixP4/icSRNE8aY4niVYklJHy7YHRHNxViadxJSGr+2BGA7Bg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aS0mT9lT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3618606A31B
	for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 13:10:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3618606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aS0mT9lT
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5363316fa0cso33844011cf.3
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 06:10:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792933848; cv=none;
        d=google.com; s=arc-20260327;
        b=KrAAtHOKuuh5Le5e2qMwPSKybV+idPYgP/Xg+rz8Z0f/chTuI61DpvZnA6Y4267xZw
         DPN9isxElUiaFK4uEQ/1//7TqyLVqVgY1EhKKIkNIviVbvKDahJLzk8Zc3E4mmC4lRE7
         s1oR+wqecQBM2Qq+8aYGHpMMQroWZyEqIM6CSeRGY3/QzSKzRgCmYY+Mpfun3w2je3jU
         +7zxdS1wYFWEE8qzcSw7sFHMKi+lKH6634321hcB+4By2oh2pYe31KJdwRdGAhk0/xa4
         GeRfOuAs1u2A6ieXJMC5LlKdzDoOWLSlaoPMKk8ChKC6XfOcj9kajVu03P8TzFl3GdkF
         8WYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vWsvI+WhZ/eBQ+bJmj0eGRitrJCJTUhFaPA/quTsmaQ=;
        fh=YvwRZKVWWJpD9Zc+exwaMMyq96ftN2kTXAWGMfD3eiM=;
        b=MAu0/w41tPxfHhkR49TYkKxiK4hg7KFkFTNyGC0ri4I8xTswMIGIEfZv4xypGLCNxM
         fBEz/Ovx3VrGeo5Fa2HRUszwjypyNJ6uJ5AVlJ5UuThOIS/qRW14Nmp68maX+EjEhQYQ
         vvDGGAU+7p2GCa8wzRFE8tKnf+ZfXQjos8jRTCpL1kOYbCkn5w6/aAyDz15aAcuAaFFd
         RehGPoFG2kxUKfCxWwHMjS0EWvOvaeADX7ZBG8yDt/wVuIk/eYLiuzfk8bkl8NrMTT+F
         YvTdld+bod2Glnmd0K1uBJ8Ol8zdn5Y9WOzKwHsIIpcZ6hcMofLhNRKCaHuMNsahHDYF
         EHFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792933848; x=1793538648; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vWsvI+WhZ/eBQ+bJmj0eGRitrJCJTUhFaPA/quTsmaQ=;
        b=aS0mT9lTrQZMpxtqfZBjxGMaks+hTpRYEU6OKbUfSyi8ZWIzKcYOOxBas2QBhmCYzR
         ++r0YSLdUM/ldxZP1Tgg/7g9RpSe6Bg2p5aLRy50nSs5ZfOlCoPfJ07Q2Cu+tCAutFWe
         SpIfEYmLYxoHLlu7LmHIs4vnV8bTEVuHLUzuRnTc9ynlDQoaj3L2l+3bGErskjlSZzuF
         45NzEwCZGKg6HYssHJ1K8A9G52HlVEFWUFL6JcQ2LmrvZS1vC+EJYxq0I4QVodGyBJDM
         cn3OCTU9n78L/cRaDJSlN/IK8XAb+BtIkzx6jAAGccR50ZrxHamJAasGhPW9IJ2wLTcj
         vHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792933848; x=1793538648;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vWsvI+WhZ/eBQ+bJmj0eGRitrJCJTUhFaPA/quTsmaQ=;
        b=vL9hn4hzbRDNiFAa30KdcNrn6DBGngKluFDug8b1BcCM+XU3gsQo535rhtEGGJFQ7j
         2T6lQh462HKqZD2Cs7i+dSx4Ifg6mXfR0+27MShEv7AA99G+O3/okQlw6A8C2HJYQxx+
         AcKukvGoZ6KYRX2xblzvkFTEq1qoF0sNHW0XeZWXSTZeJGA34pSgIjv1KeEVFBigdrAV
         mTnFjs/vzG6oCrMEaiVCLsdro3CoQc2W1Bug70xx2orBQvFJQelawCuPFVX1YwvEVOeD
         dUL1BMhdjfuPVam4T2KMak3kNr/DVBM4KCbMSV1w+UDKEmtZ3g7JqrI+ZqI3WAr1EHRj
         0epg==
X-Forwarded-Encrypted: i=1; AKwUvBxzf2xHEbDXS+hTZvha8gcLBh4xl3KrUzTilqlZXXP04SDpxxHaxxtMYg6wW9TjjPOzmEXEPtCMn8k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKDW9iDVuNXCu+nQ+E98+MSOsNgGBFZjmRnj78Q0XIpF4G4jis
	lUn1q3/6sg6q7k05JmupguBIcaQBnESAqBLorsIXjPDjV9iv7Pq0qAKu2lhMl5oBG0eP2kKaZfB
	NWPotnKN9MkOOg57NnjHYASZ14aG4Za0=
X-Gm-Gg: AYBFou2pk5R/Fv2KEbYktQ84nUfSKS+iX1k6HNb1+F7E0PnNZNSYLvKXTGxuA6Ua0s8
	QsCfO3yy+S2oD4qPJHdMQ2VGJn2XtEPVSdWUUlGF6Y4MPAn1W4fGM3zl9A5QLDFEPl4iFLsVSV7
	OLRZWqyGgUMnQeei2H27+j9cgwt55Jq6uq+zzzG3lEDG8puASZ1KUeY+NYu1vGNoolB4wbbDH9t
	bekYGaS+WkrIWguG2sEaPSZgeK/iOnnBNSMRlpFSx3zImmWwGIVzc0nu3Ze2R/YUAF+WEDFBP9K
	Wjfpn10ng8dvFZ7Pd26uQvUuv3qRIG0K94xw3t/nGfkG+ZkMsI7z0Sez+Hqo8E7U5nUIoNNcEU3
	GF9OJbkdq5BRkbxJB3Qb9Yx5BJRew5/EYeG57lqcuiCk5V9jqphOXhQ4sV6Y4zVnlmR/8rF6bak
	l6VzjwcVqvkFVDo8gFjBL88fkKAZUBL5o5okaifdJCwPULDXz317CZLOQkBItWDFjGOcLMUnMD
X-Received: by 2002:ac8:5fc5:0:b0:535:2447:3d03 with SMTP id
 d75a77b69052e-5383b5a1483mr65514591cf.35.1792933847628; Sun, 25 Oct 2026
 06:10:47 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015125644.12908-1-danielmaraboo@gmail.com>
 <20261015125644.12908-2-danielmaraboo@gmail.com> <atQ_mXYNqs4tnDpW@wyuan.org>
 <79dd90f0.11f3f.1a15272eff3.Coremail.dzm91@hust.edu.cn> <CAMAsx6eb3X7GLheOaVoumORnvKftFYkU0VHynZYyx9m74+CTTw@mail.gmail.com>
 <40aeaf0a-6e04-461c-a507-52f791b45541@hust.edu.cn> <CAMAsx6fk=k1aXT3gvyZ4k8hG9KN+YCmvEc42LGdmm3Y+p2J1_g@mail.gmail.com>
 <8ff98b43-248e-4568-a5fc-6f84f9cdbe33@hust.edu.cn>
In-Reply-To: <8ff98b43-248e-4568-a5fc-6f84f9cdbe33@hust.edu.cn>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 25 Oct 2026 10:10:36 -0300
X-Gm-Features: AclHuK8bHcc4Z-qSdqWJEwmIBsb6YWn-kuRE8Y87S9rU-feLwPs47WKKAFHvhfc
Message-ID: <CAMAsx6fha-ZKkiph+nG14hbNduGs=G3qRjHNUNxLSktTTQY+gA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] docs: doc-guide: add a guide for translators
To: dzm91@hust.edu.cn
Cc: wy@wyuan.org, jani.nikula@linux.intel.com, alexs@kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	si.yanteng@linux.dev, chenyou910331@gmail.com, federico.vaga@vaga.pv.it, 
	akiyks@gmail.com, carlos.bilbao@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

(Resending to the list: my previous reply went only to Dongliang.)

On Sun, Oct 25, 2026 at 11:22 +0800, Dongliang Mu wrote:
> Good job. I will quickly verify them and send a patch to move them.

Thanks. To avoid overlap, could you confirm which languages your patch
covers? I understand zh_CN, and that zh_TW is already handled by
Chen-Yu's series. That leaves:

- sp_SP: process/magic-number.rst and wrappers/memory-barriers.rst;
- the .txt files in ja_JP and ko_KR (stable_api_nonsense.txt and
stable_kernel_rules.txt), which I think are for their maintainers
to convert or drop.

> It seems the original English documentation moves fast. I would
> write a script or skill to check this relationship maybe daily or
> weekly.

A periodic check like that would be useful, especially once the guide
states the path mirroring as a rule.

For v3 of the guide, this is what I plan, based on the discussion so
far:

- state the path mirroring as a rule for translations of English
documents, and exempt documents that exist only in a translation,
such as a glossary or a language-specific how-to (Chen-Yu);
- describe ":Original:" as optional, and not needed when the path
mirrors the original, instead of showing it in the header example
(Jani, Weijie, Dongliang);
- drop the generic parts of the sections on writing documentation
and sending patches, and link to doc-guide/sphinx.rst and
process/submitting-patches.rst instead, keeping only the points
specific to translations (Federico).

Federico, I did not see an answer to my last message about this last
point. Is keeping those short translation-specific notes fine with you?

Since v3 only states the rule and does not depend on the moves, I
intend to send it without waiting for them to land. Dongliang, you
suggested removing ":Original:" only after all translations follow
the style; v3 only says it is optional, so I believe this is
compatible. Please tell me if you would rather I wait.

If anyone has other comments on v2 that I have not covered, please
let me know. I will send v3 in a few days.

Thanks,
Daniel
