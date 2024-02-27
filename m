Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C20556440
	for <linux-doc@vger.kernel.org>; Tue, 27 Feb 2024 08:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709022264; cv=none; b=A7KPR+fesgrTNSR7BvCYuj8rxwFbRekp6l06iRMHoD5pVB8953DrGozrnP8N9tdMlMOFkelsFMZ3hfXkI4RoKcBS3B7G3+AgovdjQkcDbIHgX2Gv3GCjrhXxvsBAb+BK6x+6IkvLnLDLwpLSNQ5kRj+t6hr76iN9i1nxueFTqsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709022264; c=relaxed/simple;
	bh=Up5Td7o+pgdLisM/ELg+/hkF2Di2viopub7QweYTu64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iM0URMyf7k8o55yxjGIGp3B0ltXWawBkeNvO/HfEgGgPRWwTgKOSMcQwGtJeu1CtlmzKMrlQht7DA7igbSNQm4PHUAmOvWE8zrXI2ynuCI7lbdevFSweyez/VbGtd+ZwZzzGHFeYpiqtkMy8O7kHEAlyVTshRyOgBVcS/sIS73w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LrVe9xZd; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LrVe9xZd"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a3122b70439so479555766b.3
        for <linux-doc@vger.kernel.org>; Tue, 27 Feb 2024 00:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709022261; x=1709627061; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BgWlK0X29r9cMQpWxSf/jEya6nGwTnP4LZMYlaQlkfQ=;
        b=LrVe9xZdfhQv9Qh3Nogv+oLdXE1BUfTuoi55uYJjzKfmhYiWRCJr7+3TmFtvjj+GMs
         IZBB/znuvblW6RgjXeHZwwg6fpx5rLEP/axOv6u3BSncZwohHnxzu2ZWjaW0d0S+JcM6
         ivH4HDHegMr8nbR52+apa6gR/VHMu7uSt4nyyS3RUkDowsIH+/8QuRQwnAPD1HA43CsQ
         PT7J2FO7VNn8AUaRFWFu+w7W2/OVSkEULCNKET6DxMuJumsCGK0VGfrSR4eCPIVw1yfj
         PIpTLUbSAgkoJux/NUIwyBWEsGDI+AVMizb0VRPOW5kxtb3pNSUXeJdUfgeokqRPrc+z
         DgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709022261; x=1709627061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BgWlK0X29r9cMQpWxSf/jEya6nGwTnP4LZMYlaQlkfQ=;
        b=GbaZpHdoby9EJSjxlNPjxRRJ6uR/wvgZLzpjscOuy8N9dQn+6EFyu+x841ZS+mBdzz
         gnvQWZrVelzxmx35AIUwtGEAdgUqxwcBlCvIBel1nRoyXJ8CEVwQL/CPW4KywfDcrTIc
         4E3jjlWJCTwpauO75HiBIWPghmWjtC/ULAPJR7TrWS9FZfboeqWWcC6Akl8+xQOJu5wM
         /hcGngFJzwT4JzLcjrZlhVUaUSZioQ4s9Ng4ujYZZ1glweFHMFLqESAci9LMIaOwzfvW
         KSWm2qlduyGI9kzqc9tL3c5V10fpVnVozePp0wlbp51qHEqeycoQL+7fJWrbnefjKxNJ
         hwRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVokXinyMAehzNFB6DzjWe5OU+GVH3JGT8iWJEZkQgPCdjXi5Z3kHX9gN8pv3OjcK/od/oHB04iQNv2iyWUli9045cVqNTR0M2K
X-Gm-Message-State: AOJu0YxV9Kusntq2Wpqbh4gP8MSKrb23+hOfNX7PALHoUWUnUPHGfreu
	CG+MQ7eryhKnaVYyesKkcsaeCnrRmsrb58HKEq8HZ2GSM3povnEMcyn2EkYaaI83g2XNh24fy+/
	5OtPe0OraVDBzG8W5EVZFjkNKz78=
X-Google-Smtp-Source: AGHT+IGvLfmLAGP/0eGefpfGSy1GItijzCfPYQqCwzH37xYhgKFt8eibHuY+OmQcDoSo/qlu/xZT9VtxAEGu3Dlrvjw=
X-Received: by 2002:a17:907:bb8b:b0:a43:827d:53c5 with SMTP id
 xo11-20020a170907bb8b00b00a43827d53c5mr2249910ejc.32.1709022261592; Tue, 27
 Feb 2024 00:24:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240226093854.47830-1-lukas.bulwahn@gmail.com> <a6e683f5-3088-48ef-9930-93c95e85c5ce@gmail.com>
In-Reply-To: <a6e683f5-3088-48ef-9930-93c95e85c5ce@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 27 Feb 2024 09:24:10 +0100
Message-ID: <CAKXUXMz1HLYKo=D4UrtPDf3GO4VjxXmU1xtYm_aZ3tXo6PrekQ@mail.gmail.com>
Subject: Re: [PATCH] docs: freeze some package versions for sphinx virtualenv setup
To: Akira Yokosawa <akiyks@gmail.com>
Cc: corbet@lwn.net, vegard.nossum@oracle.com, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 7:57=E2=80=AFAM Akira Yokosawa <akiyks@gmail.com> w=
rote:
>
> [dropping most CCs]
>
> Hello Lukas,
>
> This is a friendly notice for filling in some contexts.
>
> On Mon, 26 Feb 2024 10:38:54 +0100, Lukas Bulwahn wrote:
> [...]
> > Akira-san Yokosawa reported this already in January 2023 and Jani Nikul=
a
> > was fast in providing a fix (see Link). This however remained as a thre=
ad
> > on the linux-doc mailing and was never turned into a patch for Jonathan=
 to
> > pick up.
>
> Have you read Jon's message in the thread archived at:
>
>     https://lore.kernel.org/linux-doc/874jf4m384.fsf@meer.lwn.net/
>
> I think you can see why there had been no submission of a proper patch
> in your patch's direction nor others.
>
> If you still want your patch applied soon, you need to convince Jon.
>
> A patch that helps us to go in the direction of 1) in Jon's message is
> most welcome!
>
> Be aware that if you simply remove =3D=3D2.4.4 from requirements.txt,
> sphinx-pre-install will prevent you from running "make htmldocs".
>
> You'll see this error:
>
>     Can't get default sphinx version from ./Documentation/sphinx/requirem=
ents.txt at ./scripts/sphinx-pre-install line 305.
>

Yes, I have seen Jonathan's message. I also read that updating to
recent versions---despite the slight performance issues---is the way
forward. I will try out if I can make a proper patch to get that setup
working.

However, I also read:
Jonathan is "happy to not break 2.4.4 for now, though I suspect that
day may come". Hence, as the current sphinx 2.4.4 setup is broken and
still the one and only way that is documented on how to set up the
kernel documentation build, I thought we will need to at least get
that back into the working state until the documentation for how to
use the new versions is in place.

Hence, I proposed this patch here. It works (for me). But I do not
care if it is picked or not---because I am just continuing the
whack-a-mole game. As of now, I do not know how much work the better
solution for "updating to recent versions" needs. I will spend half a
day and hopefully I can then present a good working patch. But let us
see.


Lukas
