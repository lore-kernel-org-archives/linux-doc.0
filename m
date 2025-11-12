Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2753620DD48
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 00:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762908670; cv=none; b=bALnHqvBeGJC+cvAFISCMpJjuD7EaGl1O/yLDaOQWgxB515MOCKWUcEKVm/Mc+AfI577rcjJ5OMJVnK3/4MPMl5u5VExuIaLJCctl7Y+Thv6y498+Je9m2F/iZxy0OrUIadcvbV3aDcPAsiMTSaLZeW/akUy7Plef4CSWREzBkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762908670; c=relaxed/simple;
	bh=2OdtSOueaZaNgax+sB7JoUsjE/Nm6EW3iaLsDMs/rBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=auHmZb2gSR4b0SpdGlqsnCNbv4vg68viG4xKXQkDZmQl9qxSsY0Bqpi1V6NmOkMkiwt5hZymel3nkcSoYOrUchkLleFb7zs+rl1JxNb+n1EMPIQT20Mj2fhKFcyGUoTVehvcWc5ITPe0NOz5UT5Dk/bYjn6LSW+VzHcRylFUgnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=RhZEpTFF; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="RhZEpTFF"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b550eff972eso163606a12.3
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 16:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1762908668; x=1763513468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OdtSOueaZaNgax+sB7JoUsjE/Nm6EW3iaLsDMs/rBw=;
        b=RhZEpTFFtdtR3Viwa/iojH8QZc0uv6rCAJCHnQXm3p4iQKnnRzJvZCRyMCGF+EZDKU
         c7RiUo/dpGG2jTaZR+4lOfTYvlNDbiy5KjkXmm6n5qKhMCOr1DYXyaQoXO5voeLoohU9
         lfbcxEVS/W/EWlJ26o7kVXzcdzlG6Fo9ypKoGkZk6yIBo3EJIrMCmPJMT+Dr4G7Nt3xz
         bVNyQQv81q3SFjcag/unIsycm4FGKEkA8CsxzEkgi9tQ6lIKydYRXA0SXnjp1crxjuXG
         /fZ06eOisNsGWVW0Btbwq/y5+aUN9PMhJuUSyMBpqKWuDYFFBn5X7kWlT2UncLHezyaS
         tG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762908668; x=1763513468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2OdtSOueaZaNgax+sB7JoUsjE/Nm6EW3iaLsDMs/rBw=;
        b=Pmm3gERjLclJ/4coaEOuD5UKe39pDDICBo8H+mXPiZPcC9ESvDnZlxGl6iWTeP4eLh
         VCq+9Mp7L6WZ5kAnRTAcyqhXytONS9ul1XJeXHSV3kEvjiikiPEneJmfsrQtQv0PMDTx
         RDR4/Q/aVLgngZ0G8oYjCugz/J1IOGFXBgA6WIVwZHgI3ustKxmwytoa+t/9gFb13iam
         XNERjQDOmnDEO9SfTlZLtEgvaLJeWZljhpeaUiFf6cPQaG2iYN3cTpi0pVHiju3E7vVj
         WU2YRflVjDJvX7ViwsRdgT51US81PEXgporVKe5+apxVOUm2KDPRCIpeQ/kuqIqmOUoy
         tRcg==
X-Forwarded-Encrypted: i=1; AJvYcCWwjpqvQImGJrYmT0Ak6sc27zCqfsmpHdQhNOdqPl3kgRR/jEeSZqHJK1U/x1RxNpmU/EbG69VudDs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh2QLrHt+ALmlOdHVqYbcXcHryULwxwkCit4fvKY3WvxON0FLn
	gQU07wQHD7+e4gUWer6QHA1N+I+xaCfS7oSADzOr4HGi6eNETnm5VWsc80AXVjC0wThNCUUrpDK
	MjEkjcM2rU1pUUDmANEFwEDZ9O9zabFKv9shKwHHM
X-Gm-Gg: ASbGncvYsuQZlDHGn8YSpqF7UoY1bPAprrWpEDvY7ddfZOma/wSdbAlMcEXEm8q8o1R
	DDjsuzf33Mks6LIEHln9F1GZ0BseWikjyAvIr1gORFTz+9gAhNPQo+VxVE3iOkfXF0nJF56uvBJ
	+JFgtdKViA4r61rwNviQsKTrTyu85aptwik1TREqn49hGqzlAdHY117GASvg2h08tfwJ4744w8n
	1BcIWJxPfwMufun1DsXo1VKM+APYJtUTjomCVETzoL37P7YCevfmWfQlLvo
X-Google-Smtp-Source: AGHT+IHkU9Wi+f6GWyr7DCrdh0j5tDoAb9Pyt1Zcj+wtUB8thJZutmMijomHYviD35MHQ2X7Do+YYwDJ78RL0a8/fpE=
X-Received: by 2002:a05:6a20:3c8e:b0:351:db7:2328 with SMTP id
 adf61e73a8af0-3590988ba6fmr1386791637.16.1762908668426; Tue, 11 Nov 2025
 16:51:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103113922.61232-2-bagasdotme@gmail.com> <aRKgyvrTxldlTv9t@archie.me>
In-Reply-To: <aRKgyvrTxldlTv9t@archie.me>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 11 Nov 2025 19:50:56 -0500
X-Gm-Features: AWmQ_bnXawPFNQPn16cCqSB2CtDY0qEbTQIVjy089Pp9K6h9E_gK01U2_7eHOts
Message-ID: <CAHC9VhQeghqosexgOQO3==poNwsf_6mNiOqkUTUOdYnzRYzKmQ@mail.gmail.com>
Subject: Re: [PATCH] security: sctp: Format type and permission checks tables
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Documentation <linux-doc@vger.kernel.org>, 
	Linux Security Module <linux-security-module@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Kees Cook <kees@kernel.org>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Stuart Yoder <stuart.yoder@arm.com>, Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 9:35=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> On Mon, Nov 03, 2025 at 06:39:23PM +0700, Bagas Sanjaya wrote:
> > Use reST grid tables for both type and permission checks tables.
>
> review ping

You don't need to 'ping' for a review, your patch is in my review
queue, but code changes take priority at this point in the dev cycle
as I'm okay with merging documentation changes fairly late.

--=20
paul-moore.com
