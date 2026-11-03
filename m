Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.222.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793673580;
	b=T+FTo/63hAfvF3jfHMJQH0xUI59Fv7whb7e9CbYzA/hqVit38xhweIeglq5FIVGNArW7
	 eW7HRp4E2hs+rrQXzRL+HhyGZZx4QDfHbTfJL2U/vLGrIYlde9OgwzIee/+PKq3BWFle3
	 ELt1KzTAj4R74dc22dGBTxk94PPf3+LNWxoWGZQV+DycmAfbEQrCRmM9ykbMGAYcLZ6Ty
	 FIIT10KdmSJuugJSIUs/u+wSEVjLzEC9Xn138a/lHy5dZ3qKZECLkgR1NCA8vcMgvozUO
	 qzhL1fN/NKWnn+V9hUy7sKAXEysR9FjAQWL4qo07Gb3Abhrt2DiPEGayRf5p735gm1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793673580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=JPmRQEzRAbrnbM6+BcnhKNmUts6BwBXXlxEibCWSAHw=;
	b=kqegWcOjXGO1K+x6yZsanMHpkTbQMDwai+2lwprjQENKjO9WAFkPacbe04QBpluiTvt4
	 OOGey3A/84+v1T92KAiQEYPxIZbrd9vlPUDFC5QX0K2UFxplbXzhSF1WdyX15W0qwQl81
	 VjnYjJUALIN0wTkkA1W1u2hT8feI5pZitKnzFgZ70o2iADQxM7OeyJvoHMYEx/cGt5jpZ
	 EYYUfs+txWhSjPoiG36REkNkTdBTFhcAk4VT0Hyw3odxZtyJzlBmLTYNzrUhtXNbkJT2e
	 gzE0NkOfF8mD8Ej3s2J7mOu8GHoxEqnzOZEKmAZQP0KYDJ/jvdNgkxQ8ywzgIzkw+gA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="uSaQ4/sX";
	arc=fail smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502C0606A326
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 02:39:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 502C0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uSaQ4/sX
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93a40a9a01aso31129385a.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 18:39:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793673579; cv=none;
        d=google.com; s=arc-20260327;
        b=JtTlQirmd06mt8Luwg4XroAlEAHI1Zkictd0NGaZEieGfZYLxYR5TXHFDAhUveUdQ4
         DO3MF+5402C9LRC6Imyu/fv4dAIGaH7arzKaGsdVNfa+DgIli2fkKlxcypu16xKX0P64
         7s8MMGaZ8CnqDSRWBvNFFD8w74jwlfMJqkVDQsAyU7fy9n4j5nwxlU6A0xY4RZgDg9co
         6nQXIDf1THm6zEl0ro3cBTm+bse5051fw/7R2oWOXYFNXZAj8x0Wctm9F0hchUHTmNrs
         UKoflnTMt92UcXjBdEC+kZRSPUbVSLxZq3KQPIRjfkgGCiG3ewVThwH2nebmbOTNf78+
         vgnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JPmRQEzRAbrnbM6+BcnhKNmUts6BwBXXlxEibCWSAHw=;
        fh=IEpaIBMb5VagRLbNwriSBUGllAcDjZ7CoiHHZf9Ggvs=;
        b=K0z8Bk5StbvOBos9nC5M1w4dyWY41pytQahZhOt5pky3IVLSVIiPi/CYu9aAvDXSLY
         2xNzfLGiuwaI7cNmSrG+4IvaTkRoArU3qZvWY5ZvB1zlnRxQspxOxf8pcuM4hVZ8xiRw
         huIJytunsd7yd3CYjnAa8YQb3xMP05APjXdqxOYevHxAriGoPBPLHpuWih/eUKvfZPnG
         bamAF8qWzRiNCp8bK9cSiKTOQth0Smt8Tow+WvjsU3KiQGUaPFkicKNTyg5hGUifh+Z2
         f+VDW0e5vb4ztT0tAgLa3SIo0ldJmR49xm8Kc+Fv6ZmrfIZ1HSWhPtW5E6EUSDb2pJB1
         Nzlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793673579; x=1794278379; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JPmRQEzRAbrnbM6+BcnhKNmUts6BwBXXlxEibCWSAHw=;
        b=uSaQ4/sXbn+eSWHPoNWOtoU3apYu14w71Bk1TNrxutVrmfIhd2P4m688uUt0AD6H3x
         lGEwtpmzl1bIKQsq0KwANdF36Z0mDBSLZc2XrblkfOPugo17d5ilrmSJah2RkSkx5c1D
         jvY3OsRMaQ3onUhivINMDwJZ+YDFk6zvAPN6xhfAiNg5gv6KiMJqvEKUeXffl0WU6/d9
         droHCOYlYiWjvdF3thYbpl/sodn7Ki+TcvrOhBEeu2QXsSLfgqICS/fuRZJiQIDCtSD6
         PDUXlZFt0I5CSDToEfsqwaHrm6aJ4UU1WzVs/mke7qaDsTlNKNMngwcjyxcIuBHj7NZY
         aaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793673579; x=1794278379;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JPmRQEzRAbrnbM6+BcnhKNmUts6BwBXXlxEibCWSAHw=;
        b=OATqHNikQcLkKa7wwfj7VmClKKQNROk1lAMD/WsmK/zaZcYlMwuPgwg1M48HY6nj2m
         p82uEPNluWKaRfFEq/w/hr+OiNmlvt4wC457My4D8Wmzl5TPL77F76ZTj95a1q/N/lWC
         +JhGTgORCYPfskJ1P9GWON1HVBX7F6kw7HbbRTWMbzlfDKbPSx/OvzesYbD3rLQf1mTt
         fY6dNMT2xXMsYHrbAxQF/mRW82o5Xh3H62JKUbHk4Hl53Ke+VlysahULHM1K7iuxBGvM
         mI8cPdt8eV1zji7RLGd93LLtg4tw4xPlFXEgYYM7NP7HjGL2Ztm2jOHD+tLhiI5NnI0X
         921Q==
X-Forwarded-Encrypted: i=1; AKwUvBxLIJcrXEamG1IpoethcxvxBtnu62dr7eSgYrvsUBBLYKWKoW79XW/nAwXO3Gh8VyVbJOidFGfD/eg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwuVPlOcdrgJT4TFuhgmqCNgs7ofbcnqkQPk4E/1tjr+tzX91q
	j9U3GfCQIyTpaPU02LQ63fiDyeq7wkdyf7mEm/ZA/Mih7uSK37STTSNPZ8fsY/l5BFAOCLCjwom
	NIrWbOExymjZBq9dD7xoKpP2+s6cEcBU=
X-Gm-Gg: AYBFou0OZIdW9zSEi0UmJSpRWJiQUoQMmUOG880PDc4amzJba68I9XvbusravWMLCvn
	83nz8jSRj4p7zbb3L8Jtksyu80T+ZETV4B8xpZN0SlDg43AYwbDh+6bO5r6VLH9+33rYcrv5aYg
	ThMMTfjA+6QSYNPJJ08+UWoCCcIvLGHiYi9vzT/AYKoKsv7wp77YImelSKIrOLqy29nZPOH7Q0q
	OoF3YUiHdbI4LB2GtZFfUVhxK3Z3E0QhkTba+5gqSfLslEBkaDGe59aZedsl7tzW9v841IMh5YM
	IKs2Si9E8IGjecQU+1kUeivWKHfv1H0L4f0U3CIeekQCoJUfHcG4D6I+Ki/dBgSqElP5f3eIcD5
	m8+rhgI9uVQsQGwx5JGZ0Ih2k8AwitHw6pwYund+50L9dZRsnKS1pNy1W1/u/ltDDMMl5cYTpap
	X+PNnzLeL2j5VbcDT4K+cQ1wZ4zWMVjYbKn7mVCMFlIc2FYbBfwk61l49I1Tg61N51Jmo+DhiSi
	4JSldJpv2QHs5rtXj5+hs6h3w==
X-Received: by 2002:a05:620a:711b:b0:93f:2e81:2217 with SMTP id
 af79cd13be357-944133d6c9bmr2309888085a.36.1793673579229; Mon, 02 Nov 2026
 18:39:39 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028033127.82193-1-kmehltretter@gmail.com> <20261028033127.82193-13-kmehltretter@gmail.com>
In-Reply-To: <20261028033127.82193-13-kmehltretter@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 2 Nov 2026 23:39:28 -0300
X-Gm-Features: AclHuK_mYIzz4cZ8_ehKRxiRZ03pBcXNepnhJXq3gkymb86kIprbsq-E3-Zh6FE
Message-ID: <CAMAsx6e0fF5mwfruaK7e=uHehVfjMP=Cy7jB_Z_e9aXTk-yZPQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 12/13] Documentation: entry: Describe the
 pre-counted hardirq lifecycle
To: kmehltretter@gmail.com
Cc: rostedt@goodmis.org, peterz@infradead.org, tglx@kernel.org, 
	bigeasy@linutronix.de, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 28, 2026 12:32 AM, Karl Mehltretter <kmehltretter@gmail.com> wrote:
>
Hi Karl,

> Assisted-by: LLM
> ---

Signed-off-by is missing. Is this an oversight? See
Documentation/process/submitting-patches.rst.

Also, "Assisted-by: LLM" was removed from the docs by 1e035297ffda.
Maybe describe the tool use in the changelog instead, see
Documentation/process/generated-content.rst?

Thanks,
Daniel
