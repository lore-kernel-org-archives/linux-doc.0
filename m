Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F19577F12
	for <linux-doc@vger.kernel.org>; Wed,  7 Feb 2024 14:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707315227; cv=none; b=Tw8h64yO7+a+Q4GMLst7oFCQNmCJ987OqUMpTUcECtKqhGj5+J3MNL2KvuYRBufJHHBfwWKSac8HTaXZqxGYWa12neJrybdiJZBFS0XcipgipyN29rqkttvDHIzRPItp8E6AsYNgD1HjlxeX8G1V4YqCJ6KtWAXWFq59vTdHW44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707315227; c=relaxed/simple;
	bh=uDMXyMG6j9ONbezTC0mpLsB4ibSrcJDdL0htrYl1dP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U5EG5TvReagfpKbZ2nIT8RBz7Gyq4SkC8HY89cTipjGcTFL0I4Clg9Hwf2YfZVlh56M0/jhEopxOViMZYAt6dVGY82zCifPWZ1RTQrzgxNe7C/s9NaYPIKRR3v6hMDZ7ypwZ0UdNmsMapmYz+a+4I8hUtELu12Wn15w7EplCi9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org; spf=pass smtp.mailfrom=joelfernandes.org; dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b=AEM1TaGG; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="AEM1TaGG"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d09cf00214so8627951fa.0
        for <linux-doc@vger.kernel.org>; Wed, 07 Feb 2024 06:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1707315223; x=1707920023; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDMXyMG6j9ONbezTC0mpLsB4ibSrcJDdL0htrYl1dP8=;
        b=AEM1TaGGJL4wfEqm+2q9peXuocQIkjrQDjqZWUgmrqbKh2c6echwGBVUOkHYGtL1Jp
         02AhZevn+De6PN7zGsB819FgrNnk/pvSqHSCA7PPW//BH4iRu3GtCxMeDnF34BH9WieF
         R1hLL0ZneyOMPuS0eERh9ZDVSUIzkN/ZJ2rKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707315223; x=1707920023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uDMXyMG6j9ONbezTC0mpLsB4ibSrcJDdL0htrYl1dP8=;
        b=hCPeVx/3jiEWHhxYoWfkgFQ0aSJwolsq5LrmmD1+ZJv3ZGt5Egn1RQKFoHZtZ/MFOF
         IrLg7wY2XsMwmKmyHhQ/53uzctThvWhPnBMAGsRTCT1sgKx5B0+iFVX4rizQ1vpZ4cfj
         RXjD91nKQjgSx45qiZyYw6o0HaesQIuo0LlVsbQcB87UnITUHcR282doL+FuDTeF3lBs
         o/HxBogNU3KcozSXeBVXrwTIN4CGy4pjJiwH0bTSAg0uRytB8y2l3Z2H8xAOXyqlj3Yz
         clWgTZrSbmlGY/PSXcPZcKo2y0btT7WcMxnm+QfojbR4mlonOTa0RD7nZmcs7olVo5OW
         CqRA==
X-Gm-Message-State: AOJu0YyiAVrGUN7uyzm/9AsvhuGBPPh3XWXtunb6EPXN1N+SULQ81HiV
	yq6FLmedUS4Gd9z8fKZmyDQOs5FDCag4nLl0pIaN9ZS2czGRrGJIGsiIDb0Z7PRo3aakEw9B/c/
	FzHjL7keRhTD6adkbef+pBSZ2mZ/S7V+eVoYXSA==
X-Google-Smtp-Source: AGHT+IED9YAP6IjuLO7QGzwihwwoadtsQqIErozgRiEhzKfXYz5J89hbN3mS6Tn00zxP0ae3LMxLBAw1f4m1Z4XB0YY=
X-Received: by 2002:a2e:2206:0:b0:2d0:5f90:2b29 with SMTP id
 i6-20020a2e2206000000b002d05f902b29mr4579555lji.12.1707315222978; Wed, 07 Feb
 2024 06:13:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206094650.1696566-1-quic_hyiwei@quicinc.com>
 <50cdbe95-c14c-49db-86aa-458e87ae9513@joelfernandes.org> <20240207061429.3e29afc8@rorschach.local.home>
In-Reply-To: <20240207061429.3e29afc8@rorschach.local.home>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Wed, 7 Feb 2024 09:13:30 -0500
Message-ID: <CAEXW_YSUD-CW_=BHbfrfPZAfRUtk_hys5r06uJP2TJJeYJb-1g@mail.gmail.com>
Subject: Re: [PATCH v4] tracing: Support to dump instance traces by ftrace_dump_on_oops
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Huang Yiwei <quic_hyiwei@quicinc.com>, mhiramat@kernel.org, mark.rutland@arm.com, 
	mcgrof@kernel.org, keescook@chromium.org, j.granados@samsung.com, 
	mathieu.desnoyers@efficios.com, corbet@lwn.net, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, quic_bjorande@quicinc.com, quic_tsoni@quicinc.com, 
	quic_satyap@quicinc.com, quic_aiquny@quicinc.com, kernel@quicinc.com, 
	Ross Zwisler <zwisler@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 7, 2024 at 6:14=E2=80=AFAM Steven Rostedt <rostedt@goodmis.org>=
 wrote:
>
> On Wed, 7 Feb 2024 05:24:58 -0500
> Joel Fernandes <joel@joelfernandes.org> wrote:
>
> > Btw, hopefully the "trace off on warning" and related boot parameters a=
lso apply
> > to instances, I haven't personally checked but I often couple those wit=
h the
> > dump-on-oops ones.
>
> Currently they do not. It would require an updated interface to do so,
> as sometimes instances can be used to continue tracing after a warning,
> so I don't want to make it for all instances.

Thanks for clarifying.

> Perhaps we need an option for these too, and have all options be
> updated via the command line. That way we don't need to make special
> boot line parameters for this. If we move these to options (keeping the
> proc interface for backward compatibility) it would make most features
> available to all with one change.

Agreed, that would be nice!!

 - Joel
