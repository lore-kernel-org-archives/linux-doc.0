Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F6F495AF4
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 10:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790592503; cv=pass; b=YqvnlKpFG2fLmRaol9waL1K9H9z+YtAYQ4iP2LRt4TSCKGzKGAGNrwNEa6QRdOjhT85s1aFEk5NblHQF8qraWNdD49WygO8L4E8zrZ1UenVFOllwR4rDIYqu3HIJbDDftO6QVxSxTFfRShfZpdjs5eKARnhD6FrwmJ2FbohjUio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790592503; c=relaxed/simple;
	bh=sUo91pSuaQ2x0OPtDMUB+dNEhNgWYHB2Csjpd3LjUMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cloKEa1syT+m0b3U5gt/9KDHGQjKzfdeaubAS0nHPArECruOhmnWnpquPXo82tfPYoRHZj1sAiaxC9GYdyh66AWRchWmcWTv28cEeAECJofrLJcc8nBgtPQgLhm3j4JhT1GNe7H5s7O3XoBgdOWnI6jDE/Q0QOBsna+0uDdlirU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aWX8p4t8; arc=pass smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aWX8p4t8"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-142dd025d06so1977973c88.1
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 03:48:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790592500; cv=none;
        d=google.com; s=arc-20260327;
        b=f/ekfpiPa7xjy8Q6Imf9jwK2Nnm3Ww+hb2SjVcZUdML0R15wGG/HILzXtlvox7EBbP
         CBHLlD41Xzskkky87njTyYW51zVdCcPnFncHD/MYudKqEsP2gqGjWU1Fugr1JiE8jC+r
         /aqTYtYuYKS59lR+t4hO3sntnIl3P5CWtoOpotl1wypNQeDjjqdW4LdLbO/cz5IDoxmn
         hEXkbBCq00mty/1RfeMeo5z2ECrXOwRQbDe6uw9GkAxyIA9CeH5zhIf/ESpRKWIsC+Em
         a2DB7cZjOgdDavdIYMkF7W+Fk6Pnj+5GnDGAXhq/kW7HYqGyNnz0QrkPgncRT7HQgjFD
         2YUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Knqn5twxYaRHsXIbqCPfgf4Fy1uK557FouFumzF16VM=;
        fh=3jRtP/dwE/VWp1Eo77vTBn9Ag6bofSLE+v6ednugCNk=;
        b=DC31/SsFopqzOZGlJKXR9Z6W79cml15YdRDXUqrDMpQTSeJYhkU6wc4TQzhiAUDH2i
         wMv6eZZCY3UsPlDd/gMd3ZgIwHSED5Ix90dXuACQJD7bdx5hSFDtpVwEe4q7IqUBUtzr
         EJIwVHwjsrDOVldL0nipAYaHJkXC80XhE/1xS0dAMdsm7/59UsjE7dcvm/wBjizbN95+
         k6eHlPQKlCmvN7v0oLXDgAlMWjG+MTj7OtcDMV2oNw6OrziK74y34k9hUoEwjooBdc32
         qP0EE6B5TpmSmY10S2nX/GSiiwn+PLlEANpZ5HpifAh7ZrU1OO4T61tnsVhOty4MBbak
         lp5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790592500; x=1791197300; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Knqn5twxYaRHsXIbqCPfgf4Fy1uK557FouFumzF16VM=;
        b=aWX8p4t8YVhRFDigRPaOTA1JKisfP4dL8Av48oUeW0Ndwp+AHxyhEfZHzgTxXAuffb
         F6QcKhg91+5On1S2uFxi2dNEy/jUOuV0AmxHEVdoGnkhrcGDpcY10JXAPv3XIxNwbIv4
         t9jFSN/qZps9E8QzZnzwgwpT8mIvxFGzq/78OYa/maTnqc4Zx/NuO1oeu1XuOoOY08h8
         uxk1TWH0Shno3IK48PdjBRIVdH+UYBO3QdaPMf2q8LY1VhL7PhSM14OtZUwLpzArU7yC
         LOFuf59K+2wLaxXa4oAgIiKNezRd1kvlF0FSDGdeLqkfS51K63WaeTkQzmc9XMBh8xYV
         XB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790592500; x=1791197300;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Knqn5twxYaRHsXIbqCPfgf4Fy1uK557FouFumzF16VM=;
        b=aP6Ds3rbagx/Xmnp0F2PQVTBZGaOmhbIBXq4I+hHjukHAuXdzKtBn06QMM+/lKJkeh
         lFh+xt88UUNvm9WHlpXGQEcPWDJ1FuZbOHJ54SJ+MWqG5Ps8nGYaKLrd1EUedlPlwosP
         31XGjdYUdLg7mNStPIi/nEQKN007mukHajDpFBvt5tabIz6/BV5K/+qKynN4gcnyRAz3
         eMMSJ5N+4EY2qVgqqaAGbxldkY8GR85hvJ5+XQk7ceXDNwVfy84BsEpw6rIb82rvsu+Q
         hvVdGu85OWBTb02uzRcCRdRBpUmEOR3R0sJQCgCNsyrCGZ/IhQFsdi24SrzpL9qOg4tX
         8CMw==
X-Forwarded-Encrypted: i=1; AKwUvBzNcku9uzjFoBljjuQlgD7zbk855gdC+9hHvBK1JbV9LjHhaiOMBL0AqnrC3PyyifBoAQFQ2CDSCGY=@vger.kernel.org
X-Gm-Message-State: AFuF++kcHlsSSH8FyKoU3HwZ8/vMK1TA0Kbqk2PARA6A38sobD6PdVfo
	0hxVLDXFDm5fiS+w4iW1qzoAnK73af7aXrsNt43xMl4H9lZBBrGxa4monwtEeSWE5qzIb7NWEDs
	4Et8qq87rvhpKtKxVgPngsz22xRsv5taCpjtucQTW
X-Gm-Gg: AYBFou0XGmSEEEum6woDc50lBpvNBdb11MB96wsPGYpOXivf05GvtCBaytxqQgAYpj7
	vDSwzNAqQLlspx52PuK2qEu07MGRwb3HEcgufOAAVpVEraDoy5OKGOJJyGvWAmGPwPFDgpjty6A
	L8c59SdWiiMMnIglbOyTn21vzrbBPjkpePsmu/9julQjzWCrn3DKiOXGHjTCWN/9/3E6U03IHTv
	WbdX8EfEtzOEtMwiwahexKoYmufFD3ngVOl2TaOm4xpcwecnRdIWW7gMSPDDxhNf/IzH4/FEH6l
	6aZwqrra1rBKbN+u7jrQSUcSAkMzeuh3iUyzJAitOw5TB4lI7puZDxzOAIoAi7ntqGhB67w4p7T
	JO6Ns2YeG9xE=
X-Received: by 2002:a05:7022:ea8b:b0:13f:c02f:60b1 with SMTP id
 a92af1059eb24-146ce67f53amr9443650c88.15.1790592499770; Mon, 28 Sep 2026
 03:48:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5315b896-e496-4020-9e46-77ffb942ea37@acm.org> <20260926095405.56438-1-emmaonana18@gmail.com>
 <87o6dk3uwy.fsf@trenco.lwn.net> <c13f6823-a304-42e9-8876-5b8e8e3569f4@infradead.org>
In-Reply-To: <c13f6823-a304-42e9-8876-5b8e8e3569f4@infradead.org>
From: Marco Elver <elver@google.com>
Date: Mon, 28 Sep 2026 12:47:42 +0200
X-Gm-Features: AclHuK-uVZla7B_L_aK897Glrjo5LeY8TZ8za-E08uwUhBk0Dyp5Zhwe5M8VU3I
Message-ID: <CANpmjNPE698Quk_+thwRf9kK_xnCQ5_CzaYHJW+dBM0iqXAwow@mail.gmail.com>
Subject: Re: [PATCH] docs: kdoc: parse context_lock_struct() as struct declaration
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>, bvanassche@acm.org, 
	peterz@infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, mchehab@kernel.org, aleksandr.loktionov@intel.com, 
	kees@kernel.org, tudor.ambarus@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 26 Sept 2026 at 20:41, Randy Dunlap <rdunlap@infradead.org> wrote:
>
>
>
> On 9/26/26 8:16 AM, Jonathan Corbet wrote:
> > Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com> writes:
> >
> >>> +context_lock_struct(debugfs_cancellation);
> >>> ...
> >>> -context_lock_struct(debugfs_cancellation) {
> >>> +struct debugfs_cancellation {
> >>
> >> I still think the tool-side fix is the better route: `debugfs_cancellation`
> >> is the only one with a kernel-doc comment today, but the next comment
> >> added above any of the others would hit the same error, and we'd be
> >> fixing the same warning again.
> >>
> >> The part that really sold me on changing the tool was a general ordering
> >> issue in `dump_struct()`: unlike `dump_var()` and `dump_function()`, it
> >> applied the transforms only to the members after `split_struct_proto()`,
> >> so they could never repair the declaration line itself. Moving the
> >> transform earlier fixes that, and a full-tree A/B test removes the
> >> existing warning without adding any new ones.
> >>
> >> Would you and Marco prefer the tool-side fix, or should I respin with the
> >> `debugfs.h` change?
> >
> > I think that making the docs tools more robust, and avoiding the forcing
> > of code changes to make the tools happy, are good things, so I am
> > inclined to accept this change.
> >
> > Omokefe, I have to ask: did you write this patch yourself, or was there
> > LLM assistance as well?  In the latter case, it needs an Assisted-by
> > tag.
>
> While Bart's patch could work as a short-term/stopgap/workaround solution,
> I also prefer the longer term solution of fixing the tools.

Having more robust tools would be my preference, too. I'd like both
styles to be properly supported.

Acked-by: Marco Elver <elver@google.com>
