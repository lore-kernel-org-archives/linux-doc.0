Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F242857EA
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 18:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784052326; cv=pass; b=TtSEmV44szenBtOGBcXaBtamxt+hwN3YJl1gzJD7Fry+r1nEsQLRylpiMZwwotJRenonuvku+aYrDYh2X8VVp8KBxhFVFagNgrWpaSZ0aBz/nGQjcEsoV6nuK1ceCRFWKJoGMcOCdwb/BGWiGErJ5hX5804Pg1IfMcceGtCDdK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784052326; c=relaxed/simple;
	bh=cx+fxysmNpIgRvDNQTV/xrnk8HRIU1i3r18wZkxxdk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=so0+Od2hcK6M8Ii8oEIphESXEM6e1VBwau2zdVfQJY5XVR7G3ivyYeHQ7VbQny3zfCbGlT2ZrOWyEB4cjlc5+zgnoTuNzybKjq9GF2ufy8neydDLoIu98/YhcwZWwbxjNzDG72PuU++S7NWc8g/Hle+KoJDDGxCo4iXGk5Nrh4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROUWKxm2; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROUWKxm2"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51c72a9cd5dso6346071cf.2
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 11:05:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784052324; cv=none;
        d=google.com; s=arc-20260327;
        b=p0XMGnhO0sxp0iVDVmLVgXQFoh5p22I+XQyGhKjVEG6L6liQmzU0GiXWR93EUSPOG0
         Jo3TdGq2SuZgJ7IR2iCooPayjJQsUlYSAiEDOm32ppAb3vxVBxpw0NNA8Vj+yoSp6K8F
         JY4j/KLuQq+V+IkT+/RAUYPt1ZPHzdcDx/Dgu/gvLCUZWxud7UBditvxOGm2x9/ffCLF
         07wUcULaNxRXWoayB222jUxTLdnSeWzi8YGTX8sgHyZrnwHj1HyDchKgaT0BT13KltMn
         bdnKaj2S+ncnuacBerRfvWShlg6GwtAx1LskaeSwbIzMUcgKlaq3DodcUuChZbo65bRv
         /i8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cx+fxysmNpIgRvDNQTV/xrnk8HRIU1i3r18wZkxxdk8=;
        fh=Uf3OcKFJxnJ5YgBNaGDCVpLLO+7WstTMTBUXzBgGHa8=;
        b=Un37dlMnlKKAQOIVkVggERNuBR2t4chEJ/kLCwQT0jbDxRfEXDj+GGkSZHmNuAmWms
         u+9n+/nxLroJQTFBk26AE71vlnt6HbCJAuYI/YIHMJdgS58LUSdv59/GPLE/oAI5YliV
         niBGB/yau2uAZbFxhGZJuqelSC5+Jg7h4erHJmevs4iPcdfYDXC+MmYF1kx8W+YXmGQf
         MNxpMpJLinRpwzUxdjziLSUipZe0xE8XR7257cgFRDgBlmv1Mr536DM9KFtGpEiIOv3u
         vxK22qC6cCEKoGFVn4ObiwFqq5+vLD5IlAVquH+eoVrXWEEh5Fu0I8qROUtQon53XBs3
         Wenw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784052324; x=1784657124; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cx+fxysmNpIgRvDNQTV/xrnk8HRIU1i3r18wZkxxdk8=;
        b=ROUWKxm2vLYPiQlrRNE3Zj1E2mdsprHrurNujQvc5gYb6VcjGtkJcXvqinDURtweRi
         4uNB60VLZv+Le8n+2CGakta7J5dwzzIJUZvAcdoZgobCFJxlx83HmYLY41nfPj1M3aKi
         Ylv4+v0IGBpAcH4H2Rx7JKI8qOL9qIMt7w+/Hdaw7bBU2sJ0cEAKZSkmWeaB3bL9YYhi
         +uI50z3vnYQLNnyAQv1LAexOSaW9Nuk7RjAv2WsquaCvU9FHZRmjwEl2hQ/Cf3UJUuHa
         KEwHt5/Fii5El8Flp1KdSwTxmNy/xOZxtjRmAsUBFbaGqiAS3Mm2+paO9xOg6BAVphCI
         T9XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784052324; x=1784657124;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cx+fxysmNpIgRvDNQTV/xrnk8HRIU1i3r18wZkxxdk8=;
        b=i+e+Cz2ozK3wR6e0cWzOSuj5hI3GyBIiIDB00W2cP7oZyGwcVg/y7poOCFF3dToPkw
         d2yQSo41fgX/bVAreipSPGNUlSxEuf89Otk/G+3GHvW+fi2PotiX8gtI3IrcZC8oGvyA
         loZrDv91nKp6V3zj/XjBAkjeXxedBdNIZAzUhTsSvIbng/L3YBPff4mIQqPCYI2md8cR
         87hv21T2TnrFSJNTM2dIlN87V2yMllYkDVd0pL0nBeWkJ9iP8+++7UeZOfGKfhffZGEg
         1brtpr7GWhqYR2146eCa6vo7YLI8L+hOl1ZM0aRrvJri7tKas0ibB/BbalPNGstcGH9n
         HlWA==
X-Gm-Message-State: AOJu0YyPDn3kIE8+yphCOXdG3ZUyyrUfeFQU6w0QVe/tg7hJqNZTJJFJ
	LeeLGoheDKbB2DBTyfZVWDz4tHg/7K0s93QtEY/zCqo0cRIuEHS0D4nl4zWdo69WGEXVcyHHHR4
	VEziICOw1n8wpOOWIm7tjYU8YHgwgaLt5mOlHUxhT2g==
X-Gm-Gg: AfdE7cmZgFHxZ/+mV2/LAWt2tVGx6bT0xF8st/GFzv5Jdoz9p7yMNwxJBdBf71pDL6D
	cZNzfl8BAA8A8MtdRAnzTS/hbf15DMhFmbRIJ3D55zHOwyvfeqgSfGazXwxfuAmMAJyZYw13LT+
	ASMfm1ghmGxMN7pimynrOPnTVulzYd2MkRQc4dWvld6bQMJRathTB3QlBV8mlPJcRu6JeUB9VtV
	nKmzQijj19I2RkMEFoOjyOo7X2Rl47dt2rW9/DtqD/X8taWIy+Y/IYPXv9bmYIZCIph2SK+B+t9
	unYw70EyerWs5/ZIYHrBBU3kehRmUJZTJdjlIi5PbZbzRnWcr8z+sgbu0rUi+NCT/HHZCDNk1q7
	iB1KCo0njvw==
X-Received: by 2002:a53:ac93:0:b0:666:2180:d061 with SMTP id
 956f58d0204a3-667d79859d3mr9547425d50.0.1784051824629; Tue, 14 Jul 2026
 10:57:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <alZK0i0HvxOvSKwj@wyuan.org> <alZP_6nAXNy_HfZi@wyuan.org>
 <CAN-j9UoUHQ2i4H+9G-XK_mOfKKyE9K9-mwUgPc+4yOVfiizgmA@mail.gmail.com> <alZ1AzLX8LrB-JFK@wyuan.org>
In-Reply-To: <alZ1AzLX8LrB-JFK@wyuan.org>
From: Doehyun Baek <doehyunbaek@gmail.com>
Date: Tue, 14 Jul 2026 19:56:28 +0200
X-Gm-Features: AUfX_mxJagSm1n-HYb-89z0ajfvxRd1MNPKSx4SnPLgv7pI70eAMO8Rmw3kSIq0
Message-ID: <CAN-j9Uo2f4dmWo8bMkdtXg7g6uayK_XZatkGs5iKv6-dNZ_Y-g@mail.gmail.com>
Subject: Re: What's cooking in zh_CN (Jul 2026, #02)
To: Weijie Yuan <wy@wyuan.org>
Cc: linux-doc@vger.kernel.org, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Ben Guo <ben.guo@openatom.club>, Gary Guo <gary@garyguo.net>, Yan Zhu <zhuyan2015@qq.com>, 
	Jiandong Qiu <qiujiandong1998@gmail.com>, chengyaqiang <chengyaqiang@tsinghua.edu.cn>, 
	Haoyang Liu <tttturtleruss@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Btw, for example, my patch (Weijie Yuan =C2=B7 docs/zh_CN: add docs-next
checkout workaround) is actually directly discarded after we reached
a consensus during our communication (with Dongliang). But it's
obvious that we didn't say it explicitly. So your website can't
recognize it automaticly right now. Perhaps we can think about how
to deal with this situation later.

Yeah, this is a downside of an automated approach: it can miss details
that are only implicit in the discussion. I see roughly three ways to
handle such cases:

1. Allow authors to mark a patch explicitly by replying with a
recognized phrase, such as `Patch-status: withdrawn`.
2. Use natural-language reasoning, perhaps with an LLM, to infer the
outcome from the discussion. I leaned against it due to cost and
complexity.
3. Leave the patch pending and let it move to =E2=80=9CCold=E2=80=9D automa=
tically
after 30 days.

I think either the first or the third option makes sense in this situation.

Thanks,
Doehyun
