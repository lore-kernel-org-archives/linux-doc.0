Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792979226;
	b=VGTmSP+wzc73uP2tnAKniPgAe0M/z9RxRVFP08+SCRsEtmpjGf2RQTCworey4Cy0PyBz
	 n2vI/B83z5GO0DZbEvT5ZHYBhrVfdBLXzsxkC+RZIzDVmY7NaU3cmqvaUCdrKtc+gMKPk
	 GUv1EU33mrkm/MFhuIfZMQ4Rk2rThxW0VcLxwP7tiqxkWJwhNMbavoGFmC9w0akqr2lzv
	 ZTOZJXY07xgJAybZXffU53qkfJ8coYkCccRYQsZugQ8+lUZ7KOhzMImjHhsNCXmrr/c2L
	 NkEYgujbfEt5tAO4ef9RYppnQmXAXyA7NU03qIfKLs5HsSaMzlkwN/MIeMayAltL5uQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792979226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=rnwoUK5XDDy7Zhx5M1Bzg5ZJeDG0xIbp8ITla+PiXAA=;
	b=qgIdf9l+mi9KiN3WYOEVb2tDZEvIi2QnVdm9DrRFBNPm5HNAlcQK5TU/GA1ejoYj8lce
	 NcAI3mEpp8krHbUU5CdWBE15MLE8UyemGH5aklcRDIhiGnVnc5AZdq7oCe0GngYn97jMv
	 V4DhuSTS2K1fBNJC77axaeZ5Z4d9wGzh/YwJ1UBuwe7XP9oW2dAaOK1QMlAL3XAqSlrOr
	 dd5EjFzTx9C/xge43ChogT1YBt0Ns0190CR/9U+EOSL23Q4an0bm/EW0dLqClSP3jr+xC
	 NMa1Opd9Ulg8Sp13uICzVVXVXz53JUgcfQJJjyjFYlM0/hxnQQu6mnf61lmTC7uHRHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k1mpcIkw;
	arc=fail smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401CC606A31D
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 01:47:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 401CC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k1mpcIkw
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5366ae57896so27059531cf.3
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 18:47:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792979225; cv=none;
        d=google.com; s=arc-20260327;
        b=QNDa5bAxz0buYFmK6CUdX+h3KzCd0Fl5UnZnpLi6CBEn0IaG1UrphbHlab2oMpA6Hz
         yc5uiVfpOucWOv+8+Eylbnij10QU64VtMsNa8osR17s+PpzbtXVyEjqK7zMFkMiSjwnS
         tlVaUHZzCZ/4YR0X06nMQ4y8NGDjhFiqOeFLjzC3Mg+FLZINTxK4KQKngDVlmdRNUFxZ
         hbcj7TtHxcrsJUHP8R6ck60MSSpUMQZU8PunmFdtEFzfuUyTlYsR54uOIcCowNyBq2e4
         2ZzdO7duaFSYI73xhRwD29CYZTcwCmgg5mh7dBt1GxXRDOOvtvF9yZEQh50t7Ebxyg1m
         JMrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rnwoUK5XDDy7Zhx5M1Bzg5ZJeDG0xIbp8ITla+PiXAA=;
        fh=bFZelTtHkXFL51KWT/YMMP8nQAc3GKiup1sWZ8ZCWuE=;
        b=AvxBt0/Un7miFUhlfS68ZD/jUNp/H7nlNMzy5J3z13zWz3i+mmrI3Zit0ySz39TfwQ
         0GMfCTqYgewohINAf2Ez3UypS4KXqqRoWNYPVsxgumwvmCylQjMiwoB12K1G7F12h388
         Iu58SCaf7umN0dVeRqSLY9TyQ/Ye/E1/u6YdxcNPD37p3Llgyn+vpg62c8A/ItJKRAeb
         kgr7u59fN3ZOEBp5IhAEOICQg36JNwiE/+Huxmgw2La0jCDqYXPTAYDld+NhkItlrcKC
         ZnbWLdGS7SOCw64aybTfulc4JDiVih6q3bFQAGj8dPCD7Tymm0uGHwOz+4vWmek4aLCz
         Nldg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792979225; x=1793584025; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rnwoUK5XDDy7Zhx5M1Bzg5ZJeDG0xIbp8ITla+PiXAA=;
        b=k1mpcIkwc1AXi9hb/mRiT22ro6h4FquWA+zMu8daRo1fzf4vKr5xnlakJSPrkylW+W
         BPZQZxoIuCc5J1ChOieBApdEw58hxaJegMTS+iftUo0MadwCUXP2cJ0B0whCpwZ+01Z1
         6IFaEE0VrSDv+WIDEJhZYV3SGEAowbSvdCmVw2p7/G1g4A78LmsmBHbkZqb0mvuv4dFC
         snhoe1grlRyEbSyotA1Q1Juwg3f2IhHshZugchVTm4VdHPkeEDh8eoNcsGy+04ZLaZg4
         bAOcnKmJU4DoOw6K23d2WUiJhP80dgi1VFqxTXSid1Z8+QvzOJfNJ36nkwBbaaX5ci4b
         ea6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792979225; x=1793584025;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rnwoUK5XDDy7Zhx5M1Bzg5ZJeDG0xIbp8ITla+PiXAA=;
        b=lB/NcTcNNsyeGHzG4NVJnWQhjZdNIPSJ2CE5bNpKL3zP/tdVU6cSxtmjI90XGxI2y8
         K4SMbHsTMmmY+L1YA8Zbwy0cit0EF7zrnd2FOh2MfRA9q15zSqIg08h6LIHrpM6wF9q+
         DEMLiGlGLIcTKi7PmR5xNBG9txMHMMa02qg0CuKsbcJGxCFGgMgOyA6xAqo4cmBKmxJ6
         ORFGuY/3pkZwVSKyM2SG4lqlT9aytIQevxnPZpNlyOmQeNqeFDgJDJWo1tDtDSzd4pjE
         CgqONzRkS06oOjMId4G4wSNhmwWJ4ynLNLqbvZCXSMjg10DrXd74ZEdYwWrJi/3NdUiV
         pwJg==
X-Forwarded-Encrypted: i=1; AKwUvBwgnFV5V6iocSQJucwYNpBN3sQj4p4NVwirh/AXZpqYccVgVfxqdG+6PPqOsZSX8i0cW7sa07WVyZc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuTRx2Sidmq0sipLWwlAVmI22wS0otz3firNL9mzi89yKqryFv
	taWecSYfBIfovP0pzp0Lcpn+icpte+I45K1FanaSI3Hb6R4OF8o6ZyniajC6fNoB5hJEWM4tf/6
	iMwx+QWPAz5Yf4C+RR8nCenHwbhyuDLg=
X-Gm-Gg: AYBFou1srSHzvyi1xgyXqL5Y4g/k45J/cvO5lXOU2dje39r2EJOOSDL5K9COEA2QjgJ
	9qT5eipVCp2BD/xI73pSmRK9THTRdlW0l3v4n2NCXrldre0J603kmKViyHv1WrU1F+ZH/hYB9Wh
	PfG3eKbf07N8ia6m3MvrVA4j7iAfyzEFxMiAMoPKhzbeil8jocg6ug/3xYyZJt38b1whGeWzIwz
	uEKDfuTsHACD8qpQGXavVP1JPmn55fuJco29QCuw8slJIgchvT8mTNHPCSPL204s6/x1iKIu5Qk
	WgYaWb3ZHvfFN2cA1rbEnR9/+BsClsJ1059tBAkvNSQLC8gtbpHM2A5UipUAJWXfE/5zcB+tyJ0
	TPWFoLvELEIUpKeuIyCvdALHXaGq+DWOEhO5vhU8u3YQ75ZX/LQpfAJPj2fEl9KmcikwK9v7WDS
	0Ggi03rRkRrzZaezCm6RComoMC2XckXwniD11BIr8/aizkC0hoUeE=
X-Received: by 2002:a05:622a:410e:b0:536:8ab3:cb01 with SMTP id
 d75a77b69052e-5383b5ebdc7mr72082141cf.26.1792979225119; Sun, 25 Oct 2026
 18:47:05 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179250646543.2190262.8632957027583518623@gmail.com>
 <CAMAsx6cniehFSgKz0+FRbGV=A=TGvogwx87xcqhiZNQGfeFFYQ@mail.gmail.com> <179297820302.2598507.5712076951623488183@gmail.com>
In-Reply-To: <179297820302.2598507.5712076951623488183@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 25 Oct 2026 22:46:53 -0300
X-Gm-Features: AclHuK9JgkkXlRw89V59iiWDYLD2QDEw_R-Zfh6fzK_yYgw4tVW-PfwZ2k_irrQ
Message-ID: <CAMAsx6dhGibUuwBzj6k+A3C4ZGAxPSdLyDbjNfawpKR0Ufj7nQ@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: kunit: document --summary and --failed options
To: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
Cc: brendan.higgins@linux.dev, david@davidgow.net, corbet@lwn.net, 
	raemoar63@gmail.com, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 26, 2026, Eugenio Zuccarelli wrote:
> An LLM-based coding assistant helped draft these entries; I checked them
> against kunit.py and kunit_parser.py.

Hi Eugenio,

Resending to the list, as my previous reply went only to you.

Thanks for the v2. Moving the tool disclosure to the changelog looks
good to me and matches Documentation/process/generated-content.rst.
The two entries match kunit.py and kunit_parser.py: --summary only
prints the summary line, --failed prints only the failed or crashed
tests plus the summary, and both are ignored with --raw_output.

About the indentation: sorry for the noise in my review of v1. I
checked the raw v2 (the mbox from patchwork) instead of the copy in my
mail client, and the continuation lines of the new items do have two
spaces, aligned with the --json and --junit items. The one-space
indentation I saw was introduced on my side, not by your patch. Applied
to docs-next, "make SPHINXDIRS=dev-tools htmldocs" builds
run_wrapper.rst with no warnings, so please disregard my first point.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel
