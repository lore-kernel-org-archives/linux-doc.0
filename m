Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BCD192B78
	for <linux-doc@vger.kernel.org>; Fri, 14 Jun 2024 09:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718358194; cv=none; b=IenlR6OIUbyaUjLDa0u1sjPX5eL+r2ay7WS2omwX6p9w2yNBhLE1OEWytMNugFw1b/BBJafqjxTPmTYLOFrMAswNcG1hXSPZHPeO1Tw5cj3L0XLmNzWT8nzpinlLiH+nAtZguSSrVybhDQtvI8lSZwQCwkanMYWyvCMxlLeTjck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718358194; c=relaxed/simple;
	bh=tLQgAiSqIKd8Fr/cSViZ1UALzCWG3iDxmInXrEl5pr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ilJoUtqtwkL+a/BHFPK+Z9SueWjzMDwpP7fO/5WuCuK6pNt9Q/b8rGLKOwFAxK445nUjGFtiDwuE7aKavUUHxg5KBACH/5wATMyhG30stUEcSNhMaFiI4JWkuxUHtrwxE0fCK5BbZqPsbBXbTigT251NVJSxuYiZFGbVCPhGQl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mEYuxDYT; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mEYuxDYT"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57a16f4b8bfso12640a12.0
        for <linux-doc@vger.kernel.org>; Fri, 14 Jun 2024 02:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718358191; x=1718962991; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLQgAiSqIKd8Fr/cSViZ1UALzCWG3iDxmInXrEl5pr8=;
        b=mEYuxDYTGkcb+LpOwFZdoMmdKeAT0qXZBHdA7gW3HmyuQw1EW4yhXGppW+jtels5AK
         sUCMTpKZmYgc70c09qQmkMPbr9HtHfwxiMsSKHM2ha1Y6YnVC4lSadtgAL6U9e/k83Bh
         /nqRbDgxBns1FemuLtBm0ZeokLXTl4Rt8aBqjlNY0I+tOveot12vMaJySH0yPVYzJu1P
         EWI5nLqADRfWwNOXgAM8aLI23ymDpwzsoFj4EGhONJ9991YSPd4VR0WgUljDC/u1zCGF
         g8T6mtNo1PTP9b+ldD7DtE4CAjOV6vxqoQ6NSSgHkkxrXVrEgP6RShxSseXbXCoWC3CM
         n3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358191; x=1718962991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLQgAiSqIKd8Fr/cSViZ1UALzCWG3iDxmInXrEl5pr8=;
        b=EIyNjlxD93+6+TFzgp9Nd6EbZbB/G4lEoeMtJ88LxczcEmXQ2c5Fnfxp14ilXyyF6n
         Uxa4rc4zhpeX5olRenVPwBTQOndmWOmx5/R+2T1D0RpZ27Pqv0yJotfIF+xv+VmH2ce5
         voyArHBuODMYOEMbTuJq7xukD2WQuLe9GjaNWip2B7TKYnqM+W6FZOZquQg5HXqsJpWR
         QMRZPi7th2aZOcnt3EXJlDI0aVjNRg12MWUSAGqrbaaIa6nLu8ZUv72zRN6LAch0bsVH
         55FR/S2NmpmKn3FhatGLC62OXgtwaecz738QWkvmUl6BGaRp6C6aofGkXie+Yq3WlfdI
         lnDw==
X-Gm-Message-State: AOJu0Yx6xtaC+jzIqTNuAy5UKj3PPF+NAdOrRXhpCa0YE5SDYXdXsqyU
	BZ3J5jTYKB44YAqGhaTfU0rdAJU9sJgqIpoXp+ji5Oxay8JxE375ettfWIvfjckj49CntzDWaz1
	WQQ7VmW3CJwHmmEvqdglA3REpQtYD0WW4TU1T
X-Google-Smtp-Source: AGHT+IFvDUJj2XIdgBgpDYCy46upILTWlHhD1AvsiHaBR7J8BVYYLQKdVBGYSCjJmIzXS9M7jGMzR7holN3E0CkL1bE=
X-Received: by 2002:a05:6402:4301:b0:57c:ae72:ff00 with SMTP id
 4fb4d7f45d1cf-57cc0a85d52mr107336a12.5.1718358190869; Fri, 14 Jun 2024
 02:43:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240614092134.563082-1-thuth@redhat.com>
In-Reply-To: <20240614092134.563082-1-thuth@redhat.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 14 Jun 2024 11:42:59 +0200
Message-ID: <CANn89iJafAvVot3_AgGGj8pwc6FTRMkZ2X3ZqsOV5J_XDSWPQg@mail.gmail.com>
Subject: Re: [PATCH] Documentation: Remove the "rhash_entries=" from kernel-parameters.txt
To: Thomas Huth <thuth@redhat.com>
Cc: linux-doc@vger.kernel.org, netdev@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 11:21=E2=80=AFAM Thomas Huth <thuth@redhat.com> wro=
te:
>
> "rhash_entries" belonged to the routing cache that has been removed in
> commit 89aef8921bfb ("ipv4: Delete routing cache.").
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>
