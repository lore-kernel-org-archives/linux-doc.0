Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64090289E05
	for <linux-doc@vger.kernel.org>; Mon,  7 Jul 2025 12:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751892514; cv=none; b=MSkHsnOORacYS+3alITlu0vPiguKuFZEwlgF/mvO40lWedmXoORnGp/6u3D32xzEGvRWyihl7lmbm/N01U98aOzp0tQ+VPvX9PgVkIDWwHwPdzP2pYBrEx8KtA7h6jhWC2+qSSMngoghxOM4cswCbuCVU0BE/pGL7hC6YPMHOvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751892514; c=relaxed/simple;
	bh=NXpBj1xWmYSm2okDyKpLvpJZzkmkIQDkt0bkS1rc0rg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GAnljHCedDWV0gSnuu8u5qLOFMfvgpqbErcAI6zxftBf80Pq14cckemR4LyTSVvQkilQeD7TytrmlPA8SxzU7gGXOUoK3cmG+XIGaf8iJ1ymRtnHvNM7pLEZ4iR/mtMfWaSC5REU+zR4Ajo3Bch5y8I2EWZ2DHX/LZ4fcc/ruyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EW5dwWOR; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EW5dwWOR"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a8244e897fso42632621cf.1
        for <linux-doc@vger.kernel.org>; Mon, 07 Jul 2025 05:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751892512; x=1752497312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXpBj1xWmYSm2okDyKpLvpJZzkmkIQDkt0bkS1rc0rg=;
        b=EW5dwWORw1YPgr7fuixxgWCPXokw9thYRtVZiMWvRFBTDeuVAFni012yQRzx6Wk2DG
         ziSiqdvXegPif9nKIK1IY3gFIA+kG8sB1nhWhTccXvFcA1viTYoI8n9GxjKQde5rvl/1
         7WXlR/wp6dyAqvTv+hJF7xFojy/BDDSGnEjQkoLHdmFq7yk9QPcSugRfUnyoS2RhRqOh
         5sj7pa2LBjII7AOB0/Nu4+gL2D0N730byb+tY3sf2f5rqMODIkYCqt0MIffHoKKTghzd
         pvVj1JAVIu2yT43ViNxvljeYo3nZQqFsgcHjZzWRJoQBxt5R673OWVhBxJkGyM2e+Pfs
         zkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751892512; x=1752497312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NXpBj1xWmYSm2okDyKpLvpJZzkmkIQDkt0bkS1rc0rg=;
        b=lg3j1Zo+yOM2whGzdSMrxKdicLxB6NAHooPwp0UFEo1UDt11Bumjm402ZlrgJ1iTYs
         lII5AyTf1wjhJxgJV+ORUXMKL+6ZDhTsJwfabmAYccDVeS+uEo7esZgx/ZeQNXVrYUZy
         RdjgX8tv5Qlb6r7O7YCAb/rGOUasEVTCdemnps1Y0E6oslnUle89+muxa6WY7pqVCnOh
         WUDJh1Kx2WsFvZ/+rrqbntHbuGgFJ5m8sMDqASbe4acxvDRNJvG5s3okmgemEbLvQhnx
         D1ubl0uu+a/OBVgDEATMMin83RmN0eNvsFkjCplMNCsQHtOe6SZd1dOPMKZaHcTcwqgu
         9OIw==
X-Forwarded-Encrypted: i=1; AJvYcCWjVtIqIadvgknd2Fw1Vi/6i89bPRZNsql9iaqrkKF5uZdXL4DfWIRWzb1kR2LzktXcdSnXVS5CEh4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDHkv7KG6yDXt/ROUYlGExbWLmdKMkPBNGW8Ah6cK6rfTszMO/
	i03O9E5efI0wRCIrnEQ3Y0noTQqoXHLF+XzegtiP6NOPB8vc0DwZpLjbrupGZA/u9zBHCJtdPn0
	C6NcVDowJ+0EVcUQY0OYYVb7oe8pdfbTu3i3d1dF6
X-Gm-Gg: ASbGncuAdcogLz9lXwzXcRfWrQUIwZAGOE5nd0T+bNpT6h+z5Rd/vwFR11hvSeBlKgo
	gnXa3ssHJufxkQd/tjvXuy9rm3tfWyBC/9o6Ywof+SnsfFbObiO6ZEPT14QAZyWW75lX1uNCvUo
	xEqOls/u+56AmGVd8etVop09m4qKl2ACq9gnTY0zV1XeI=
X-Google-Smtp-Source: AGHT+IGE1/XRTdSQDLc9V189phd4jHM7XVm3uMpcn0vgf/Ns7dLtQveHK+v9fsiJrfRa4TWVDv16yAZUooYaDzGa39w=
X-Received: by 2002:a05:622a:400f:b0:476:7b0b:30fb with SMTP id
 d75a77b69052e-4a9a6dc6185mr151173411cf.22.1751892511959; Mon, 07 Jul 2025
 05:48:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707105205.222558-1-daniel.sedlak@cdn77.com>
In-Reply-To: <20250707105205.222558-1-daniel.sedlak@cdn77.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 7 Jul 2025 05:48:19 -0700
X-Gm-Features: Ac12FXzOaT691PWcNP8FePx9AQibU4CArjSNEVwylpr2hqUBjQG3P5r3EGY0ZLc
Message-ID: <CANn89i+=haaDGHcG=5etnNcftKM4+YKwdiP6aJfMqrWpDgyhvg@mail.gmail.com>
Subject: Re: [PATCH net-next] tcp: account for memory pressure signaled by cgroup
To: Daniel Sedlak <daniel.sedlak@cdn77.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	David Ahern <dsahern@kernel.org>, Jiayuan Chen <jiayuan.chen@linux.dev>, 
	Christian Hopps <chopps@labn.net>, Sabrina Dubroca <sd@queasysnail.net>, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, Matyas Hurtik <matyas.hurtik@cdn77.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 7, 2025 at 3:55=E2=80=AFAM Daniel Sedlak <daniel.sedlak@cdn77.c=
om> wrote:
>
> Currently, we have two memory pressure counters for TCP sockets [1],
> which we manipulate only when the memory pressure is signalled through
> the proto struct [2].
>
> However, the memory pressure can also be signaled through the cgroup
> memory subsystem, which we do not reflect in the netstat counters.
>
> This patch adds a new counter to account for memory pressure signaled by
> the memory cgroup.

OK, but please amend the changelog to describe how to look at the
per-cgroup information.

Imagine that in the future, someone finds this new counter being
incremented and look at your changelog,
I am sure that having some details on how to find the faulty cgroup
would also help.
