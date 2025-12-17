Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630502264CD
	for <linux-doc@vger.kernel.org>; Wed, 17 Dec 2025 02:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765938473; cv=none; b=ciJU+v2CtXV0qC8vklmxpeW17kepevqfz8vubNqwtFppUP44hSXuTjrvhGYGCJQoUq3jyExn8IWxgn/mcFwciknbjl7yhJt/VT743b4EQohNnZe9Uyt/1nzFJJpsYz3auVE8G/HvsZSv/e63nKSDR0T+wx+TjJIQYpKB6rwLyhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765938473; c=relaxed/simple;
	bh=aT3YEEU97Bca6ddJJYsZgHuzzQOQrZGCUK09PTv3how=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dDhwYa9VwUNwPS0t1bgHxASDGVxs7ueKC5P0Tg0bb11V2Z+aLb0hjjW50IYzBn53G+1NOklgc5yXtUh2/t48PZGrtCHi29wg0GgVy9KhJ73MmU9f92uPOOYGwGyyLmtLF8ALHnOhTDi/9Uug4QKJyIwznaLgbiRvC9+tKnV9kd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=YEU9wA6q; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="YEU9wA6q"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34c565b888dso3798251a91.0
        for <linux-doc@vger.kernel.org>; Tue, 16 Dec 2025 18:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1765938471; x=1766543271; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJ8qqeFM12JCYkW9VCcf6IgSGSHtttRCm9XL5An2AGc=;
        b=YEU9wA6q3UHs061zxeDv/0PCeE8z1lv/U2rHGLDRySmvTwqrq5pvfcd84E1o9Lq7Px
         Dx/t1x3k85lgR3FSWBiR/nczfrh+boFW6jzkW3kMtXRyo7SXKla6zK9H/0rigMGn15Wi
         NoTC8r7cEjUIzTtunhwxNSZSqdAjufMjt+7byh7EDanH0KwisDmbUc9tq+Wc04/dZo6t
         /GaxASZALURg9K0MQhIC6ezOOfnT5HsFPLv8VC7wWxWRBV7vrHPDY+ObN0xcG85jU1zw
         HpVejI9LIeCsY399Rci03yOFKDxJijIPfB2thOM5qsal4zDkqvCjh7lJ87obgA9OMA+G
         InCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765938471; x=1766543271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OJ8qqeFM12JCYkW9VCcf6IgSGSHtttRCm9XL5An2AGc=;
        b=T/PSnHzWLkKFhEnII8hztga76vMFPcrSX7Nnm73io3OzZKM1ECAUyArkYb6E4/12/F
         bUdo7tcrzdqsE7dGR2z/X2MDacRiq+oMTckYQq3JZ/ivWEPi8FXNCenq4gZqlasmWjIH
         wHR/Hjge4WKVklJLu0us0TJrmyueFOH1RDWPcMbpeEFoVkh63yQNr4Y/jEIGqFEc/7QO
         9Fx4ixL94aSRL2Lmv0IFDWqlyL8+DTcgYmQL36XdY3dTLICqhk8IDNJj9ctahs8yL1v1
         Vo5TdvuCxWtV2HsUBY7jrUi+mesOLSE0T6LwXqfzspzPQ1xI2pDBb9INVvYMDcY2/QaY
         J4fw==
X-Forwarded-Encrypted: i=1; AJvYcCW4iWxHIDjnEfbOY++F6HsPCrF2LmHQcm/q1UI7hJcZUuqkl+WQb3ScabB0oRv26p3TYqc/uLBIbHM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy698zEyGbN13fnNcXxrzhUnZcNltuCgh7cm/Ej+Xa4lqi+UMoH
	oDQz0CZKI6O+nf4GrvvpZaCY9q3DFJRPRAVX4UM3H3gmbNuQ1oF2pOL3qIfMLsiIyAQASExBwt/
	JE5dYDk3WhrZ4wURE7GQCkpVXF8dHq+UmIYuOQ6Py
X-Gm-Gg: AY/fxX5yuFCrJ2XsMm8+yJSLXr55PToalMuI8XkhBrTBkd+y7F2ODf/W7f6ua1MvlLg
	tKeCfYMdMdGdJ+xsW1uMMZxphumMyWRi+L7j3Sg85WkaTCGQZYDMWA7fw2gKapHqyL4rNRqzgif
	WNuWfbB5p0t185O0gKafBiSZEG5caVjSnBttGNRihcm7J+ZBxgCaRWsGVaj2uq7czT//H+pXudp
	Aj4IDOjv04D7sDDq+iK/gDfl1XkDnLOGPaSlf5hIxrh0oXrn0XXUqnJ3QzjnYLU7WWjYmw=
X-Google-Smtp-Source: AGHT+IGa5bCdXy2eDFRMiIp85gX1ITVsGZfXkqJXB8XEHuy6HqNMrqN7lOYrjH4FnMPCpV8UuGH4zqOEanO4V2Ai+Y0=
X-Received: by 2002:a17:90b:3911:b0:339:d03e:2a11 with SMTP id
 98e67ed59e1d1-34abd6e022bmr15611483a91.14.1765938470689; Tue, 16 Dec 2025
 18:27:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHtS32-Zh3knxSdR=DUqQH4rX4QU8ewgu+KHGq6Af3qs9S0FAg@mail.gmail.com>
In-Reply-To: <CAHtS32-Zh3knxSdR=DUqQH4rX4QU8ewgu+KHGq6Af3qs9S0FAg@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 16 Dec 2025 21:27:39 -0500
X-Gm-Features: AQt7F2qprIYE6-HyVMTHleBbF-N1q77Ba2A-srAgPQlDo2gt1smd-xuGCyFzwz0
Message-ID: <CAHC9VhQ4=ALurNy_nBdqmdQ1dguupPnJ6KYAnU7B2UWhp9ydbA@mail.gmail.com>
Subject: Re: [RFC 00/11] Reintroduce Hornet LSM
To: ryan foster <foster.ryan.r@gmail.com>
Cc: bboscaccy@linux.microsoft.com, James.Bottomley@hansenpartnership.com, 
	akpm@linux-foundation.org, bpf@vger.kernel.org, corbet@lwn.net, 
	dhowells@redhat.com, gnoack@google.com, jmorris@namei.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux@treblig.org, mic@digikod.net, 
	serge@hallyn.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2025 at 12:26=E2=80=AFPM ryan foster <foster.ryan.r@gmail.c=
om> wrote:
>
> Hi all,
>
> I want to confirm I understand the current semantics, and specific issues=
 this series is addressing.

I don't want to speak for Blaise (or James for that matter), but my
understanding is that Hornet is focused on ensuring BPF program
integrity at load time; similar to KP's signature scheme which has
recently found its way into Linus tree.  Where KP's and Blaise's
scheme differ is in how they perform the integrity checks.

--=20
paul-moore.com
