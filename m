Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B896251795
	for <linux-doc@vger.kernel.org>; Sat,  6 Jun 2026 09:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780737067; cv=none; b=qDR3ja5Hgc/BlN5BaGsbctSLG60EV+Ar5PlRWrzHfAsC8Eo3aFTqsXwkg/Vrb45rWTZE2JM9ke4s4BLeGcebWrG2eiYaiDtSY5RAeFgZwY/K9YJnxjhPUKZnjOawLEPf7H6rWHAqCZORd6UDyHqHcrj8ax/wWMF6rMoPp9//g2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780737067; c=relaxed/simple;
	bh=d4tTfWAmqu3t1sBqgAqB9Rt9sS9l+jnHD90/s2wp9zs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hbe8ORZsvXqDd2r07rbntuUm+qi4X/+7Pn7Ri5m5fOV3MGLepDZd4FwGhT8xEh5aOs/arOhn4FLA8dM8rHsxH9enueN0KspPh2xMCZX+7QxNfIblQ0tOve6RcJq4Q3N6qzmUlaiY2dCZNBy7bZuxrCdj4doQXdXdPmc0nK8IZEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nZTH3/95; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZTH3/95"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-36bb3551f6eso2356986a91.1
        for <linux-doc@vger.kernel.org>; Sat, 06 Jun 2026 02:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780737065; x=1781341865; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pcBDNaGxdj4j4v9CTzTOWStlGE2GOCBrlBMMyppszeI=;
        b=nZTH3/95jLhTjd6AGVm0CBrXvYHJQfsUOQHzumE7+i71Jm9fjnkZs7OBGYS36vi6yE
         7hr+1swPx3n10b0H06H2bd45SQA74EXAOWPp/sqltLcVQq7pzON/N5PIjZomo4A/4GdI
         l2dfLCHHo5XPoZilDCxZVTKvfDXkvbEWpSgn5rDGsp3WbyjZ3nUBjai4J0Ixh0XuwYc6
         6QWYPgNcbcosc4wcniGtM3zhK1o8r5aN2wYPKPfEExS2G1FSV2xeUHaZX7TE1P3Tx7Ug
         dHWc28QiplHUdtqYdgvHt68VfcGeQPTPWYMxWAAnlg1c5d1jbtUHBoks1nZT0FpuFxrI
         rVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780737065; x=1781341865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcBDNaGxdj4j4v9CTzTOWStlGE2GOCBrlBMMyppszeI=;
        b=SWeTE75bbyqiWFfOW70PPZCFRgkcdt4WzxKo8frNpHJ4/CRCtvPLv2FSuv/5Vb/n0E
         bEVfo91mgrwdArKeIfPtKFeTJNRyho0RuepUDJtjunpgNEDl00zALwf96SvrnJP1ecFJ
         m3iZavfnrtfqm5PXbuILQ7LeIHOK4+258LGrEUzk2lY7w1XGNk7+uiR48T7d8fA4aZr0
         oW1HvXgYRX8oSrdbThR8HT+Nu7r4UJ+Xk491y+d2zfnRUFOdrJy0+fvA86rl50NDC1Kb
         91xT6NOEPNyAI+hdFprz2tVAP5icS0LeRR1WunrFvQ2zkdIK+U2s4R1A3IZBHLjWdxxI
         fRCA==
X-Forwarded-Encrypted: i=1; AFNElJ+7eM17kCZSVz3SEH3DUbDi7lb/VzgN3RAgBiNciIiRl7FCAsr6XfbQn9FSg5kKE1+AWfVQ0l571iw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv1xVUL8ReT2qLaA5M7tUb5upzBaRqpJiG3KHPdUyrgb06m3SI
	lVjoGMt+EkiMy55+xmXQIdH+6a69gVdi3AyF/tzcCSX2oZyTYtDM2E6f
X-Gm-Gg: Acq92OFnP0xTH7jDl7xEuYc5dRyNITvDu2khomaKO2XvyYSmPFvdhRhGSKbSjG5IEQY
	PC4eRt6PKKZm3oiWCWroC6fqlmXaQa/zMmzQKHO5y3h0WrR9Zy/TNwX+nyrAZXlmRQ0NeQEBDUb
	ZrL4pwQ6n09jq++w0D1OjyAjFyh2qRx+oy4ejw7xnDONYTvB3sl20FgZJ4Co1S2SoEkPaqIYsAG
	hyHAzdRkSJ1HecdGxquUf8uF46nYV4TFi9dUYbUyGnNjXbEp0v5dvu7viLHM/D5D+7ztvWL57dP
	DFzyCAARTAPSMk7k3b4i3Uu3ylKKzMaIZD6O9p06BaeDcTbEgwY8YOkiMh2D/tkXrDkM4eaI1Cx
	tlUvibnvY+jqu9VFZtiE0FMP+PtMleoYnVi6YYnv/c9nO1ZraHwpMqCKMvgXAGaUCrSioZGMPQH
	omYaFnZn9rE59hdwhaRUZZQ1/V3T0rUSOH7irXbho+LbES2nvWgcBKytQcZiOBBDCb7Sz8dvuEM
	Gmv2XKmQQoPwcuZkw==
X-Received: by 2002:a17:90a:e185:b0:368:b724:6d53 with SMTP id 98e67ed59e1d1-370ee344e96mr7975124a91.4.1780737065499;
        Sat, 06 Jun 2026 02:11:05 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6dba82c6sm8995033a91.13.2026.06.06.02.11.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jun 2026 02:11:05 -0700 (PDT)
Message-ID: <5882e410-aa1a-4a89-b4c5-97b0c8a07fa6@gmail.com>
Date: Sat, 6 Jun 2026 18:11:03 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] docs/ja_JP: translate submitting-patches.rst
 (interleaved-replies)
To: Akiyoshi Kurita <weibu@redadmin.org>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, corbet@lwn.net
References: <20260606035954.27605-1-weibu@redadmin.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260606035954.27605-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On Sat,  6 Jun 2026 12:59:54 +0900, Akiyoshi Kurita wrote:
> Translate the "Use trimmed interleaved replies in email discussions"
> and "Don't get discouraged - or impatient" sections in
> Documentation/translations/ja_JP/process/submitting-patches.rst.
> 
> Keep the wording close to the English text and wrap lines to match
> the style used in the surrounding Japanese translation.
> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>

I see a couple of English terms left untranslated, but they can be
taken care of later.  So,

Acked-by: Akira Yokosawa <akiyks@gmail.com>

Thanks, Akira

> ---
>  .../ja_JP/process/submitting-patches.rst      | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
[...]

