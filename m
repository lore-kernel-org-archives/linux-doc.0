Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E860233932
	for <linux-doc@vger.kernel.org>; Sun, 31 May 2026 18:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780251421; cv=pass; b=c1Kc4+4bnFJeLIHnReFc8lfqa8d0cHKsYy8SNXZHyD0MzBD7C/SC8200b+174dCKtWVfjgPpQ2IGqB+t8BNMX4v5akX/6AtXMRe+jPtTlgdjNA7D6Uie/gKutQQK6l2WCKQOsNwu1UDvzQ1r+tz61bKmKsSHGE4Qn5BvNwc3Tuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780251421; c=relaxed/simple;
	bh=6L2ZAPPqdkHSVZ92awRWYDhL/kzXvlfdcb4jwpr8VeU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=YA2qo2ZMZ7Vn4Pj6Px4uz2k2T2CGMNzTj5Zp5NbWLlao6DboEqemx6UtaE/4MoVy9rTzZHruvAxIOhd4sfcr3IxI2FLdC+kUuvT5XDR6bejgR30PEPJmO7X02KLbFb6RN5+eefPsg2nOvENIaMqGZ+p+TaRfMf+E93vSMEtOX/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gGgpwFGm; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gGgpwFGm"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bec4639953dso89673766b.1
        for <linux-doc@vger.kernel.org>; Sun, 31 May 2026 11:16:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780251418; cv=none;
        d=google.com; s=arc-20240605;
        b=dUz9M5PzSe4OEl7wOdcGo6WjUa7WaWniNihsxvRqvQnBSG74n/SenOVYq2kLpFHLOv
         WIp53cJLtZnZ+joTWpNjpOoRzPUbP52Xwb/f4VyCT6x7jtuNaQ2n3gSIiwQgm6SEygEV
         5PREbJlIJ9Z5aqdCC22fmX+Cv9cKklOmtCfrQNy5aC2E2ge/Lfq02iYgH3c3SiEabKDi
         blCq3gHBtXKvrKFEV5B8AfjBtV3nS48ntHeIn1HltxsrjQ7HpozCWK/JfudoShvaxIHE
         8UIipezbZ4sE+bx1Af1FdBw3bMqsv99HpQ3d0G1KbuEYj+tgl7LPDJi7YywskRtn7lXQ
         b9PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=IV2g8eE+TD4M/ezJJ6LSt3OuVeALkDosInwYUovKKyQ=;
        fh=kcwOOqnJeVQ2WzQ1VcfQjFJUaEAgKMCMGy1sVynt/tw=;
        b=cKf7Q7F1uROZEi6CiskiimLF0SWYj8DCfHZM/Vsq3pfy3zc+yXM2Bx0vNBTWdFHCle
         kCgJZ2QciSBKXniKp5pxavr6NnEavBT3TQ0apEiy2tK2agsgXv23d8C2b7aPdE1DxwN3
         hC4C3oGl1cWilKqbrt1fGV/op4stwg6oFaD46pgm1h4EhoPkX88OWXk/vTmNt1CyHujs
         B95Ox0KlD5Ttxcde0Mnq5kxVUuXgNyMfNYbKzFI3Y9zgxS5Jbp1QPle6WJJZGZDFap9N
         I/yfU5XeN2lnQnA4lpGRwSsPiCOzPSaDz2riqEfa78xkd9/nROkrGG1J+CXqZ13fH5lG
         6A/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780251418; x=1780856218; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IV2g8eE+TD4M/ezJJ6LSt3OuVeALkDosInwYUovKKyQ=;
        b=gGgpwFGmvUqy81YjuPT0NpzR5sqvZR5MnRTLYWE5JC4cl1xOBoASUZXWPxDVH9SwrL
         Y0HT1mmLYD3tPafy9va8kYgHTmtmNAfsTWtnEju9nAaIcP5C2XvIxqAb69IYdAdAAWuy
         DKipQrkm40Vj1ZZRKsL0PozfvOL9S/x3lEiawoRtPJkojbEhqD4xaRF4OHACmfqE2bio
         WpN+vfXVLcION2ExwKcaCC8yD9i04bJGQ2DtvFND5KUVhCaYAiz0B3L8yovJ555WFYam
         Id2Ho+3BND2NoU4ZZHUi5aXKiFy8Nv5nITlVMKesmxPLGM5G2rxTIKn9v5vcwKWbWwCv
         crpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780251418; x=1780856218;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IV2g8eE+TD4M/ezJJ6LSt3OuVeALkDosInwYUovKKyQ=;
        b=RMREnmw9+EzueEZoUOU824tdAxo0OE0jNQ1tFjZK+Sr0vQbPC7SXdKDYd9El7ZUy6J
         0xoaVYtffvwbPk/nKzupN/LNMgXJhfdC/hgIj1r2ZW0ManlyVej9o5tByGwPEPJ0CF2D
         +PRsGNq7SLVOw7c1TMtgcgHT5MNG4/cZ4CuRDcpU7n1IiZ8oRWWSeWx/Wfc53vndHD6L
         qjnsvwub870/9KdashHpWRbx1BKxCjbvHGtJEyERx42QE6YrxQ/fK6EP28NHjvv4kvHd
         xPmKGRee33NL1nvkESpO+NPhshje//wpXxgcU+Ilr65lB68lLM1nXSHLOUfEdY3f/7J8
         0zqg==
X-Forwarded-Encrypted: i=1; AFNElJ+bEGnbg7XFBi2WLfMyjavSPSwnkPmFKzSnve+313hauPWSC0IY5LY6cOb2R6Q8e76ezlrwrbT2Ng8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOID6WgMjUuuyZ3t4BEIvJ8M3AAb8z8E9t/hhQBdIwpm3p3ENk
	aekom91BKH7vg2VxsGHt2wpa/IHSu3wS4ls/XlKQ6TLPaB28ASC6P81a1jKc+5jkZQcNzWixK3O
	uz7gT2qo7MkMXn4FAWLvp62Whgi27jFo=
X-Gm-Gg: Acq92OFwJQG2sYh8FmhClQCsBmM1WK+EgcLDUiK64UkioLqtBkN+Qyaiif9daln6b+h
	GiL5KfMpEgmODxcCDcPhQD+NdjAP8bOFvVxvTG0UHwfoiNDhN+qOz7nMbFFSqEa4ou8nfQAtBNA
	cBZ77BzP1HOJohyAqIM3n2+FacVrzse+PKsXBEMq2PrC+OT7028DTbtCQKJOffWDU1v5uJdPYOA
	3EpoAFyJslOMAW6BwIWluchBjtcqqfZ0tYqK2Wwp4DLXvjRpPou14lsLpKnDaKrKMNhha7YihOE
	o1k877pthln9CzcDKDWK2atTbWrQ47EHwLsYn6zB74LWB0nm3dD+vN3RPlRAbJtLNeaRT2KGdQ1
	EMN39z4+Ua+R4e7lH
X-Received: by 2002:a17:907:e109:b0:beb:4674:6a1d with SMTP id
 a640c23a62f3a-beb46746b52mr174614466b.11.1780251418144; Sun, 31 May 2026
 11:16:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Declan Wale <decwale37@gmail.com>
Date: Sun, 31 May 2026 19:16:45 +0100
X-Gm-Features: AVHnY4IUEgRZi2jmKYJHLOwcv7cWoBr4EGVa1h91reXLtsbrxF14Co-DAboTGAo
Message-ID: <CADz3o9mbM60-p1PV8t=nOm7099KnFeYQOyo5J+bC2iiP9PtBJQ@mail.gmail.com>
Subject: [PATCH] docs: tools: Fix typo in unittest.rst
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org, mchehab+huawei@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000063e9260653211565"

--00000000000063e9260653211565
Content-Type: text/plain; charset="UTF-8"

Hi Jonathan,

Attached is a small patch to fix a typo ("ackward" -> "awkward") found
in Documentation/tools/unittest.rst

Thanks,

Declan Wale

--00000000000063e9260653211565
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-docs-tools-Fix-typo-ackward-to-awkward-in-unittest.r.patch"
Content-Disposition: attachment; 
	filename="0001-docs-tools-Fix-typo-ackward-to-awkward-in-unittest.r.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mpu3n25v0>
X-Attachment-Id: f_mpu3n25v0

RnJvbSAzNTVlMGM4MGE5YmEzMzdkMGNhYzEwNmM4Y2I2Njg1OTkyN2E1MDFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBEZWNsYW4gV2FsZSA8ZGVjd2FsZTM3QGdtYWlsLmNvbT4KRGF0
ZTogU3VuLCAzMSBNYXkgMjAyNiAxOTowMzowNiArMDEwMApTdWJqZWN0OiBbUEFUQ0hdIGRvY3M6
IHRvb2xzOiBGaXggdHlwbyAnYWNrd2FyZCcgdG8gJ2F3a3dhcmQnIGluIHVuaXR0ZXN0LnJzdAoK
U2lnbmVkLW9mZi1ieTogRGVjbGFuIFdhbGUgPGRlY3dhbGUzN0BnbWFpbC5jb20+Ci0tLQogRG9j
dW1lbnRhdGlvbi90b29scy91bml0dGVzdC5yc3QgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3Rv
b2xzL3VuaXR0ZXN0LnJzdCBiL0RvY3VtZW50YXRpb24vdG9vbHMvdW5pdHRlc3QucnN0CmluZGV4
IDE0YTJiMmE2NTIzNi4uMGZhODcxNjc0MWRmIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL3Rv
b2xzL3VuaXR0ZXN0LnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL3Rvb2xzL3VuaXR0ZXN0LnJzdApA
QCAtMTEsNyArMTEsNyBAQCBXaGlsZSB0aGUgYWN0dWFsIHRlc3QgaW1wbGVtZW50YXRpb24gaXMg
dXNlY2FzZSBkZXBlbmRlbnQsIFB5dGhvbiBhbHJlYWR5CiBwcm92aWRlcyBhIHN0YW5kYXJkIHdh
eSB0byBhZGQgdW5pdCB0ZXN0cyBieSB1c2luZyBgYGltcG9ydCB1bml0dGVzdGBgLgogCiBVc2lu
ZyBzdWNoIGNsYXNzLCByZXF1aXJlcyBzZXR0aW5nIHVwIGEgdGVzdCBzdWl0ZS4gQWxzbywgdGhl
IGRlZmF1bHQgZm9ybWF0Ci1pcyBhIGxpdHRsZSBiaXQgYWNrd2FyZC4gVG8gaW1wcm92ZSBpdCBh
bmQgcHJvdmlkZSBhIG1vcmUgdW5pZm9ybSB3YXkgdG8KK2lzIGEgbGl0dGxlIGJpdCBhd2t3YXJk
LiBUbyBpbXByb3ZlIGl0IGFuZCBwcm92aWRlIGEgbW9yZSB1bmlmb3JtIHdheSB0bwogcmVwb3J0
IGVycm9ycywgc29tZSB1bml0dGVzdCBjbGFzc2VzIGFuZCBmdW5jdGlvbnMgYXJlIGRlZmluZWQu
CiAKIAotLSAKMi40My4wCgo=
--00000000000063e9260653211565--
