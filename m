Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480643557EF
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 09:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768468552; cv=none; b=Of2rXjLx2zNHufoZERkddrZfynOyf8IcYirrL6GM0ZafnzvtygbayMCC+aGR/vLyVoajzV4GEIsDMads9tkxWtlTlaiT53fhUrgpeBw7zqbRDJ+2R3fcgFxr64RFGELvaHkTcp7tdNwyPinpELZP8fFqQpiEuza9Vf+u4rmLLd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768468552; c=relaxed/simple;
	bh=eBA8tsm8Ni+Bzi7zcKnL4RYHAwSwHYdeZQ5yl9+veto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HQO4uJC8LH9sgcTQIEdmCFIrz1n9Es8w87v7oIdTgrobX3YnIjwj5CoQiMGwy14AjzMyf6kDUOwuuR7tWrWBzGUlT8MhlZQJq6Z2CXkStL+FkAPW77f0HvbWC4p/s6It7B8Pjz44sWKY28cZu0BMt+61IUSa0HnaYYGROtSFzg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=man7.org; spf=pass smtp.mailfrom=man7.org; dkim=pass (2048-bit key) header.d=man7.org header.i=@man7.org header.b=vw8YkUzL; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=man7.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=man7.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=man7.org header.i=@man7.org header.b="vw8YkUzL"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-430f57cd471so412812f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 01:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=man7.org; s=google; t=1768468547; x=1769073347; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BYtcx+RwYO0dJCrZBAUZVpy+SKZ7vWAN8Ja1SpojGhk=;
        b=vw8YkUzL9fa/YB+47m8jCTaVoW4/Yo3cE5L08uthw2Xdnwlhzl5godSFXr7U6Fb9Ka
         fhxNs4KS0C8UvY0wacGDJq7KYG9AsOWqHRGCZWuMyt1Cajh3Huf+sQpnfbPMV/l69cve
         ZvZkHgKSNvlLUVnRJev01GcBBCLLYaI8ORREGCUhzXEKeC0SKtHr97n1en4hVvOv06Ks
         5Vvark5zQ+9uGakCPolCEeKDxTyV7bLPFoqk8KmpWgvbRtPU8oKyfAQ7kPftfsdMUTGl
         IxbKl2t+OhQ5sKZjWW+1nH3eb1tLPGXfWfMvGyYK8rmgGg48uCeyTCYhz/da538Oxr95
         aUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768468547; x=1769073347;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYtcx+RwYO0dJCrZBAUZVpy+SKZ7vWAN8Ja1SpojGhk=;
        b=docrYFloiZtOgs9tV1ZhVvZd4Rmemp0XP/ixUG9VP/7yMsmG8ov+12fNaufMi/M8TT
         yv9A/ZeWx02Zf8OSWpt8jNHhalsZfApRoZ7zatrbhYxzA+YHMlzul/uAvr38mMXMOqWL
         mhJWs2Gkds0YV3z1AQ42p86E/6hX9MKzgIR2yiYSiEiTzQRi4HXblFrGcLmSEkroZdMA
         UozhQ3hf+wZMUNIGUTRQsONQUZREkmXm+PBikd8BYgIJUhDL7aWfFJuO4KscLM3RWkqQ
         Ml+1ByAkLKz9KmgFX7hwXSJmlqNGdv7Y0zG8lR6oFSZAIzty09x+650TolTupHNNxqtb
         IAYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaJDTAt/ZArhKrUpumCy82zUHwsCP2PmZMQEKdPIvW6VbNVnGUWIctKSICe++KfhsIF35qB73DUGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN5ejffczeq1hJ2fJk8SMxVZQBHLvopSKMurrZ1rcT7oxma/DY
	TspXdzA0XrMyOgoopIOaj8SvbSDg9nC59U/XkyiHBO3osO2lcBrMjgoi825bIFomv7xSf8QFMkm
	jSqjxQ5LXfWU/5NlZPEDc7iZcN9gWKgfgOClorIcqFg==
X-Gm-Gg: AY/fxX5w40j2cGSvlhlN/PTjKuE2xV6A9h9SyjYahSNfk2FLCo+EaqKmgiJqetM0vbK
	2PB3MrdYCZdrHfRQeitDZZ1ShnqWuwr4FK8KeMsRx7hp55dPAJ9G6UkbxNxANBkH0+M+Kovc6z3
	jKSwbri8g7CVsC1XQIuL0ltnlI1PtcyLg5VjjhG5ro+ClGKviYGKggA+YZojpGaMXcwzRiKX/M8
	doMaubRGrUgLzbQZ6dBy5J+WQphZgzTj8gxWolcB5yQ9j4RQzOPEo6dQxllNXwMRJWU5mKBbA7Z
	LT/smxeWOQH86MzC/BiQ0Xol1nYsMZeXg2lRuJ+qSr4ka4dpiU3h4tDja7Yszun2doNvVg==
X-Received: by 2002:a5d:5d81:0:b0:432:e00b:8669 with SMTP id
 ffacd0b85a97d-4342c4fc9bdmr5796999f8f.18.1768468546247; Thu, 15 Jan 2026
 01:15:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aWFnRcjl5SogBakq@devuan> <20260114195334.3958694-1-safinaskar@gmail.com>
 <aWf1cM9SsMuH-Rxi@devuan> <20260115064021.GA436616@pevik>
In-Reply-To: <20260115064021.GA436616@pevik>
From: "Michael Kerrisk (man7.org)" <mtk@man7.org>
Date: Thu, 15 Jan 2026 10:15:10 +0100
X-Gm-Features: AZwV_QhtBL38pZUjbzNv4YdSdtzT7mhIPkZDEScGNhVGJcIkwRfBS7qgxUKxazQ
Message-ID: <CAFs=pga-QdXJZZ+X9AbVLnpjWDK6Xpup7085ruALcUNuF1h65A@mail.gmail.com>
Subject: Re: [PATCH 1/1] Documentation: Link man pages to https://man7.org/
To: Petr Vorel <pvorel@suse.cz>
Cc: Alejandro Colomar <alx@kernel.org>, Askar Safin <safinaskar@gmail.com>, corbet@lwn.net, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Jan 2026 at 07:40, Petr Vorel <pvorel@suse.cz> wrote:
>
> > Hi Askar,
>
> > On Wed, Jan 14, 2026 at 10:53:34PM +0300, Askar Safin wrote:
> > > Alejandro Colomar <alx@kernel.org>:
> > > > FWIW, Michael has been following recent releases of the project quite
> > > > promptly (faster than distros), so it's reasonable to use it.
>
> > Hmmm, he didn't publish 6.16 yet, indeed.  I hadn't realized.
>
> Ah, pity. From my point was nice that man7.org is non-distro related.
>
> > > I don't think so. There is still no open_tree(2) on man7.org .
>
> > > I suggest using https://manpages.debian.org/unstable/ instead.
>
> > That would be okay, although Debian is sometimes also a bit laggy.
>
> > Arch might be more up-to-date when man7.org isn't.
> > <https://man.archlinux.org/man/open_tree.2.en>
>
>
> > IIRC, Arch has a good track of being the quickest distro to package new
> > releases of the Linux man-pages project.
>
> > In any case, I think either of man7/Debian unstable/Arch is a relatively
> > good choice.
>
> Also openSUSE Tumbleweed:
> https://manpages.opensuse.org/Tumbleweed/man-pages/open_tree.2.en.html
>
> @Jonathan any of these sites you would prefer? (if you like this change)

FWIW, I'll probably manage a refresh in the next few weeks.

Cheers,

Michael

-- 
Michael Kerrisk, man7.org Training and Consulting
mtk@man7.org, http://man7.org/training/
"The Linux Programming Interface" -- http://man7.org/tlpi/
