Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438DC364E85
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 15:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783697068; cv=pass; b=dlAaQk/CrC2hTIsbbE93P1M/6LI4C7odRTtxaSgAh7zeoxlTm+m2/vtyL6YH1XtmjxUpKW7FXPz2oTghgk8fbb45W3FhEOFk+6oMeAfhWeINcj8JXIHEHtvYjR++SJNPBJRSl2vNTwnhQBF5HZPKeObsYvfeN8uwkttoJi434EU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783697068; c=relaxed/simple;
	bh=EqyqUxpIYNWHP1s0GX+47xMaDhlkc859gdGdTZYGzl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sgs7DF/4fontJRYkR3aqMK2aNi6EY9Wz7PoYy97ovMAdhGjaItli/d5Lc6tQKgERnUXZsRR0TBT00kr2CC4xKvnBTYjkENEkUvdicyl4WaXoUHxEHUKKKg+4L/53Rf6yPpGCXgTpcUc1SmIhshINPBVMBcGKBP/mpv6/In+Ohkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKFjtHwc; arc=pass smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKFjtHwc"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-ca97d139d8dso640243a12.2
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 08:24:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783697067; cv=none;
        d=google.com; s=arc-20260327;
        b=ovwCeEAob7Jlqr9Q3yDjcg2UV+5ryx17tBa7TE7tLYXQ/y9k15iACHWmbTbmy1F3VL
         HQtQZQLRjUMXfF1A/Yg91fe9RQAELue4yZWU5GRr5vMSQ5iMlC6h7lvf2kPkH7+uMdQt
         /Ek8wcEkSHaJwVMP2n55qrX3FFlDetmDlHfUa/X/W56ugPjsrHaCvAmOrAYvnseTyTYR
         d9GpVgr0M/GxLmGr09gFxDZidTXlzzwg3gsGX3r6w/TGeG3Q/28ei7HzRGJfIzK8kE72
         bvovGGciuiWPPTm42gztWF9uSwdrPwiJBYn3nvnnpxkfTKHhCwXuKqODa7IexsUT0o8e
         0ZaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EqyqUxpIYNWHP1s0GX+47xMaDhlkc859gdGdTZYGzl8=;
        fh=PNSH+ugcC78sisMflyhQc/sThX733gWHwPskch4UYWU=;
        b=JpABnQVFMEoqezUPVelXxm+ju8xuWQUQF+VMbeZmMZKlU/6D32ODUDJ35dJ6kIjFCS
         MitXyADN3sbJS6Z7iHmFS3GBsprhR6P9aIX3whSjfM/y0KhY5t59xV7lwcGJ61VJF6AK
         6bEkwUqcZHkslc9mERb8VjgRTBCpVKrr17wXnRYoINPQBPM/fMv0bqa52nBPLsjcpRfy
         X2TdXHBFqmIbYnNojLyBxgjzU8DQnzCzpE6B9/RI/JZ5tSD3U1bSbyWfgZ5WLIGbSE3h
         DuYg1PpSoClJycF7ocK+ncJRPc2R51dtZGfK9FLuOy+L4R2O8OstF+bMXaEnI0o+pMmR
         xtMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783697067; x=1784301867; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EqyqUxpIYNWHP1s0GX+47xMaDhlkc859gdGdTZYGzl8=;
        b=TKFjtHwc0C/UCtAWzmS5fCt4F1AaLrSWXByvKBvD/ctrsW7DXdTWlqCSqeEH1kCoYJ
         z3qt2vJuIJ/fM1HFweqyoRGyMWVobPTBa/CqSlWEiWKrZJOufkYGdPV7U3ImZNglXGwK
         80Sl+DSBRgEwrl7bNU7d5d9+KFXYUtW+K6juNlbcLroVM3InCWgYgQV3FtaOpkJWx/eS
         1uvHzTOsB+JMQ5o/E3oQ0BDTTU35wyzzoZL4/5zgQ3r+NvklqYBu8BDt2YF8uSnh0Y0o
         d0SEj1HOxtwQrUW1WuAcJ98MI97Zqh4apzWcmRorHMAprFwufwAEhUhDU1WKzCbQiRlr
         Inqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783697067; x=1784301867;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EqyqUxpIYNWHP1s0GX+47xMaDhlkc859gdGdTZYGzl8=;
        b=o7gzouMg+Jrl2rnCkEE42wq9en7tUPg5QQVNwKfF/m1Pzawk+VY020K3XaUrTIUcWm
         dIq1RDxBaoHDDzFPFGJDcebNJLTqk/KFsALRPuvKMX0ifAmDbmz446nIjitsmiEujDo7
         B6q0r+0k6xbuSzpWIP/Hs0PGKSZDgI2/oe3uYfFkiWYPjX1X/UiCQx/8IR1VkqW/8zrn
         5RzjVIyGpwrjydcsWnyly/BqIcNJHIML8PXNyqPKlP7gW+0GkYLhG/5Q/IIyjfCE5nA9
         QAMa98eOepV63fjH5hBojOxgp0F8dYgLR3NWTFBNKhdBpZrW0JsRtLgUFHr4rQv2YbH/
         jqtQ==
X-Forwarded-Encrypted: i=1; AHgh+RrnLRQ7ymDbUuJITdiyjakZKCDdu64hRfx+17oLh1ysBkW/7iaY1u/xsyo42JA7p48SbJzuHs/E/04=@vger.kernel.org
X-Gm-Message-State: AOJu0YwO2rh1BRVyomnL8w/92JZ2vbqfFtwqstw+Lb0/KH7FBB8nPuiL
	hg+hzF2k9pFVaAv9Q1gsKjIZS5LHCX6g0LNkXeFALsqUYvnXenHXGB5KUhuqIYL0YnWFHvLsgbb
	4LNicGPX1ogyYBOZfiiObgCkE6/9W+NUw2uu81tE=
X-Gm-Gg: AfdE7cnBWolxecWi1nOe2yfXbKi4/C8XmOBieqHzjczh+LM0hzMhiNs+KiadHBr0O2E
	8imDXz0QFKmMpEXGPeu+BLyr7b8g+NOPGCJG0eXaGeW2cpnZ+sYlJh/kDWCuS5HWhInVPaMa1i3
	3ZEtjq4Ix/mpxQftBP+0oikihmJ0AdgJlXP+2cXgHwesRU1xPNaUYSVFiIejP3NbCK3oFIj/VFf
	LVj0RGmY6xnRURRQlpl6/5eQ9NMBCHN6mdsmE6H1eIg7qXyFcvNs2ytjfYoGonL3EiNmzQlHlXP
	74+03KN2v10iOP0Th4euGR8dd1oAt2W5ZJBcb2Py1ZigPPgHUwsB/iQwsone
X-Received: by 2002:a05:6a20:258d:b0:3c0:b55a:80ff with SMTP id
 adf61e73a8af0-3c0bcfc669cmr15058954637.24.1783697066297; Fri, 10 Jul 2026
 08:24:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707014525.1015-1-kimjinseob88@gmail.com> <20260707014525.1015-5-kimjinseob88@gmail.com>
 <ak0cVeEUhNP1wTkQ@ashevche-desk.local>
In-Reply-To: <ak0cVeEUhNP1wTkQ@ashevche-desk.local>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Sat, 11 Jul 2026 00:24:12 +0900
X-Gm-Features: AUfX_mxU46GPfSBn7INGwH9DSFKpdE3Tct9lB7NY0v2qLaRw04FyfJBrzDmLygk
Message-ID: <CALMSewLACs7+QEq=3Pp=Wo6dvmEu0hFjmuOx8oe0AGoZHPmADw@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] iio: osf: add authenticated stream parser
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno Sa <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Why so complicated? le32_to_cpup() + just integer comparison should work, no?
> Alternatively get_unaligned_le32() if the buffer is unaligned.

I have reworked this in my local next revision. Complete four-byte
candidates are now compared using get_unaligned_le32() and
OSF_FRAME_MAGIC.

A small separate check remains only for preserving a trailing one-,
two-, or three-byte "OSF0" prefix when the magic is split across
receive callbacks. I added a comment explaining that case.

> Seems like reinvention of min() from minmax.h.

Agreed. The open-coded minimum calculations are now replaced with min().

> I believe I have commented on this already. Please, go and double check all comments.

> My comment was to use the same pattern as in _init() above.

osf_stream_reset() now uses the same early-return pattern as
osf_stream_init(). I also re-audited the earlier comments, including the
common magic definition, loop-local variables, redundant casts, GENMASK(),
Kconfig wording, and partial-frame statistics.

> Why all this dances? first_err is 0, we all know this.

The zero-length path now directly returns osf_stream_process(stream).

> This error checking and handling is unusual. It requires a good comment
> explaining what's going on.

The parser continues processing the current received chunk after a
recoverable framing error so that later valid frames in the same chunk are
not delayed until another callback. Only the first error is retained for
diagnostic logging, while the serdev callback still reports the complete
byte count as consumed.

I added a source comment documenting this behavior and verified that
CRC-valid frames ignored by the core are consumed in full without
resynchronizing into their payload.

thanks,

jinseob
