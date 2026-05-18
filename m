Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B56545349C
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 12:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779109175; cv=none; b=lHCDK63L9dRZ2Ia7b5szfTgjCDJILbMH96D3Iz4K+NCl/nOd9Daw8fx+jM5N43OrWp6EIBZWL9puFjx1uXpGcgPilazF1uYc6VQnYBrnBltd1LmEeKkewLm9zEfzoo8KXUcMHpkll3E+6abySb2u5CrJvkLp12BqoVe46W4sseo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779109175; c=relaxed/simple;
	bh=bXuunO1+TKZxIn/PbBTEBTzoGcc4NaXizcZznUNsj8k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gAu83NNsRcI8BDby6wXGWDowmGxsNLjNIYXpQrxl2980LZbaKg5q1tEk+a9RvcDcbZR3y1seB+HW/fq2h454hoYR9PuAjLFcLXOaHWezOXzECIMsmWoyMU9aXhKUTQZqqXNZ4/+exao4eCaW0t1H0e4BqVFTl2dwxqFxef0psEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mHQrpHek; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mHQrpHek"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-44c350a5b87so1279976f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 05:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779109169; x=1779713969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMHpOkWcOjtFb4OspGjWFo8LVP9NfvBDBGISty1lLiA=;
        b=mHQrpHek+RHTlsjnYSsjjKy0BTDY+qCVchnHTIMkCPEODmlfqWJOALFetXC3ARBv3I
         3fHsLSVI1WUuZYfJtbGo+wNe8pzZCIYqFCiovtp9qW6a9fTpGYZqNhmDxoEB5/VJhkm4
         TAagYG6yF+in4bQz22Q40wN7tq0NweE0doc/G7+T1yQ0rVYQvuaXvXsLCLDxvlOcSBBC
         Y+7a0ef+NovD60Ve7AcrQSwn+U1lNZVDxmHZih0hOsFeWCEpEVXAxSUlLVtjVHk3zCyd
         WyqU9+9JpGhYFX2vU/HagwGycFqBZYaOUooC4A0He/BBymvf7kcxd150mI4FA6jT3A0Z
         tnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779109169; x=1779713969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TMHpOkWcOjtFb4OspGjWFo8LVP9NfvBDBGISty1lLiA=;
        b=a4HoaQcurVFlZSFq3sFK+NQZZeXGmNDgcmzFLPHHU5xtGf4VZ3bn+I2kOilytx6QfT
         xO7yoJYgzjY1yRWMZhirNDda0T/bVsRRWpGDh7ZbyXQmu3dPA8p8Pe6oFA5vm3djO2KP
         cDj/xEE8b8z64IFpq5rR575wwTGiOvstxa2WTBbh8T1ovgVpaITG45tYoPLr1juUN3s7
         JG+Ym1XoicZ8zd83slf9WhOshi0+86fuCiu6nj2PND/JfQgdVJzfMmiFlC+6PEsyzB4F
         w9fq0dzvtn4MsvqRQU3V7Ox/duuhGV8tKbr5y/wh7OkMVlbbDTQoveEYouDtB+bsmk8H
         jiLA==
X-Forwarded-Encrypted: i=1; AFNElJ+/KVBAIPDaIs0R+UkCJUgQHEBdFJoCJRmkxSwZvXu5aXTSiEJGyK+l60PJlUYgljcSTjZKKHLm9SE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqstbX1urJ3c2kCe601OP1qlnPFRYq1pCRoMRIIfonm4xb6FFN
	ORjTao45gaY8jDkVC1FU5qsuKqoF3eC1L21uhJUgFoNaVQOAm/ge8c+G
X-Gm-Gg: Acq92OEQzfC2onjyakTwY51j6HE+5tyOw7R5hUsjkGPz1VFSnWQSG93IrHE9k2pbdm1
	L7mYc08QkP0nyWlbhR+0Yk2sz4VMyw+yYND2vLxdxZlG5vOn5WGXxJTUpreR985kuULRBhypOzO
	nyWMzuLI7it6Heycw7esm6aLX/drMEk6isinqcumgVeAgp0oDUDBR6HSSFmGkbYJINM/uV7dJnk
	oTsq12V5K2heiSk+KExUVOjVSufHRq7C4dhlCkV8H8VUnvDH6DPa4SEqBVEypkruHg/j9N8Oeth
	Bi1Ve9KGRr2LolaSIJqHSVwAZi251CTokyZd/JzMu5SVqRURBYmoCc+DHJdo2UQWIjsppAPPbHS
	95j9bPQgMmHyZhD2ZoA5YYNt8T7EVZMWuqOCGq9KvA4378BP0oQvnAjMMoQFCcGf1lCkFfwqEJI
	PHvO6BCTXpZYY8M/DTx7B+rhVS5UiyxX3BwnKtKjWh4PKFOK4QuaDS+YFvjV1V/yEX
X-Received: by 2002:a5d:5f42:0:b0:44a:fa76:5193 with SMTP id ffacd0b85a97d-45e5c5af4f8mr25341873f8f.12.1779109168494;
        Mon, 18 May 2026 05:59:28 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a666fsm35811638f8f.36.2026.05.18.05.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 05:59:28 -0700 (PDT)
Date: Mon, 18 May 2026 13:59:26 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Heiko Carstens <hca@linux.ibm.com>, Kees Cook <kees@kernel.org>, Manuel
 Ebner <manuelebner@mailbox.org>, Andy Shevchenko
 <andy.shevchenko@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Andy Whitcroft <apw@canonical.com>, Joe
 Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas
 Bulwahn <lukas.bulwahn@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 Jani Nikula <jani.nikula@intel.com>, "open list:DOCUMENTATION PROCESS"
 <workflows@vger.kernel.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] Doc: deprecated.rst: add strlcat()
Message-ID: <20260518135926.0a916782@pumpkin>
In-Reply-To: <CAMuHMdXEezxGi1d=BCiQ57cbnG4D2PPXvt_FAHcyT5mgR7md3g@mail.gmail.com>
References: <20260514160719.105084-3-manuelebner@mailbox.org>
	<20260514162652.107714-2-manuelebner@mailbox.org>
	<202605140931.913048A68B@keescook>
	<20260516152819.14597A76-hca@linux.ibm.com>
	<20260516173524.498984d0@pumpkin>
	<CAMuHMdXEezxGi1d=BCiQ57cbnG4D2PPXvt_FAHcyT5mgR7md3g@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 18 May 2026 09:11:04 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi David,
...
> > I don't really see why strlcat() should be deprecated.
> > Clearly there are many cases where there are better ways to do things.  
> 
> https://elixir.bootlin.com/linux/v7.0.8/source/include/linux/fortify-string.h#L346
> already says "Do not use this function. [...] Prefer building the
>  * string with formatting, via scnprintf(), seq_buf, or similar.".

Trouble is that all requires a lot more rework.

I might try changing the type of the 'buffer' to sysfs_emit()
from 'char *' to 'sysfs_buf *'.
Initially the types will have to be the same, but propagating it through
will show where it can be used.
But last I looked I failed to even find the associated kmalloc().
Eventually it could be changed to a different type.

> > The only problem with strlcat() is that it returns the 'required length'.
> > So there are some broken uses.
> > - fs/nfs/flexfilelayout/flexfilelayout.c
> > - lib/kunit/string-stream.c (although the preceding vsnprintf() looks like the actual bug).
> > There is also some very strange code in security/selinus/ima.c - but it may be ok.
> >
> > In reality the return value of strlcat() isn't really much worse that that
> > of snprintf().  
> 
> So we need strscat()? ;-)

Indeed...

-- David

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

