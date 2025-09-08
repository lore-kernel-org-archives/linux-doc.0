Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34F32D3745
	for <linux-doc@vger.kernel.org>; Mon,  8 Sep 2025 19:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757360895; cv=none; b=Lhfej/elJV4OBWe3rTffDi6WzxCsAizyzbcKsNXDEHBDXF/sCJtHN36ftJ/V80kwGhAacAy3UYhB7RuuyXiiAZdzZ7lKK9MFuDKg6wKe7eioW9weQo0Hkc03iv99P328Md/TNP9WwduFE+yOAIMwYQ1slwulylEzr/J6N+RS/5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757360895; c=relaxed/simple;
	bh=jmcLddsM1rSmyuBEhmQTe6QzWT65ZsqYoD7U2JXM3bY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=skLxEPExi8AJD1hgMMigeBipYGQ4rUZu6qved/ojmYuWhXQN1z3etj3Y6xg+NsUixub7VoicR+gHe7YS9dsTGQbN4BNuzCvmU5upylMHpl5pDa1KKnIarv6Hrkh6EtpiLDMz/QFVLGZgsf92wzZVPtdM5uPsob6jST2Xd7SHM0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rykNTnHO; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rykNTnHO"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-336badc713dso32379641fa.2
        for <linux-doc@vger.kernel.org>; Mon, 08 Sep 2025 12:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757360892; x=1757965692; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3INsSU1uTYQupmizf/+V0CpP7n8ujecpPRfiWEL0UCE=;
        b=rykNTnHOg+5Hh1ScgAlTgO4g+Dl9cziV0mJ3XCQUpwgPSFoY9K+ATM3kq2d1eByOzD
         2TKAgpEPdsC1PkmBSSuu8yGE9XKCXNjRiXgIwKGeBVyRtBzeispJuWCzRzBHHNISatqQ
         cMNlSVb0p/guBHOHzmBbmd8wyaZaBmcnfYcexxkPWJJ7VSyexoP4Sqx2LjVq+NHHklQ9
         Xm4TZ6pz8r1NyAOvaA2ICRinTVqSqLlKLVH8lE6ZF8y7ImBRd5O62vSTQwa9BoDKTIXu
         aGnphQLsyWPjCmy363qTFOdKLozb4MF2dR0pHeAk27GeD/VRDHSvOnNzaxlyFQ0W9p4A
         p7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757360892; x=1757965692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3INsSU1uTYQupmizf/+V0CpP7n8ujecpPRfiWEL0UCE=;
        b=Y0M2HK8rhRP8NcQuvLWwaK/gfTEkC4A79BP+FvhjlwAB7nvskqJY+fIh7EZBWEmay4
         mGoyxcJ5UySjIa/ZImGxQX63OZw/yLwAcUnjAwiO1VzsK5CkvenRpFZ6XezEt+kqd1fl
         43/DKlTBRqp7HyFfyY6tXTiaMm0ad70i/zntT46xNz9BjtSO8sueGP7pOgpU3d3s2vEC
         Rt3VJHsI5DqTbATkGJv2rNbV1kuc8HBpjflF80PXzkFsWwlmT69kXhTjJY5YvwpNhQfy
         TlLSt4nLV8BXpp6HHCsMn6DOjMwKhpugwXasgVWnf5eoyf92pY2r08rHcAq2s/C64TBo
         01fA==
X-Gm-Message-State: AOJu0YwQ2KSrdBaVKqiuP7wm2wzVe2/shJHBV0cFglmSxxOABXjR26Qj
	4oTCDPKe0xwsNiQbarfR5z5gYiMAwTfA7d4nFx5fl1wrKMiLhuGhRMwuL+YUrhLO46xUyK56UIp
	s8VAYoEelnH79WLSRs+ENyWsh717Bp8tQbfBPTbaMwQ==
X-Gm-Gg: ASbGncs1CDm3UPQESraD7uUM3R11zUiGeFr8GCtXNe8q2kG3PnNyf5d59D87ijoWq57
	+XupBvLyzy/uiCoZ0QgGgX/Ta32ORyQcq1NNM1WGyHBqRG4mdhCvhiQ/mRtHtzSuEdPYVGMVEc+
	zg8Mch/+ahMR0dnRUzs070/xXbMKMSdKCXy8h7jkOT0IGIY/kqaFmthNtgFp8InV+AUYWxTWKcO
	fhmXY3mTjysbAcZgQ==
X-Google-Smtp-Source: AGHT+IECsnVMplJOvU1wSeDf+UtwgKH+GUnENKyyNmAGanLxQEiq6JDDQKehxdXdClMMDAwVmWV+qsEKFt9fd6U9X9w=
X-Received: by 2002:a2e:bc09:0:b0:336:e32f:7a07 with SMTP id
 38308e7fff4ca-33b526a8613mr21819761fa.24.1757360892038; Mon, 08 Sep 2025
 12:48:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87segwyc3p.fsf@trenco.lwn.net>
In-Reply-To: <87segwyc3p.fsf@trenco.lwn.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 8 Sep 2025 21:48:01 +0200
X-Gm-Features: Ac12FXwlhaA_zh5PcQMw0KQlzwm74NsSx5Pd--nbogRPFrwMhW7PG6XBm2TCOmk
Message-ID: <CACRpkdbbzV=ximWZkkfNiGpdCRCkB=--x818ikf0APdQo=5J3w@mail.gmail.com>
Subject: Re: [PATCH] docs: update the guidance for Link: tags
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 9:32=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> wro=
te:

> As stated definitively by Linus, the use of Link: tags should be limited =
to
> situations where there is additional useful information to be found at th=
e
> far end of the link.  Update our documentation to reflect that policy, an=
d
> to remove the suggestion for a Git hook to add those tags automatically.
>
> Link: https://lore.kernel.org/all/CAHk-=3Dwh5AyuvEhNY9a57v-vwyr7EkPVRUKMP=
wj92yF_K0dJHVg@mail.gmail.com/
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

Fair enough,
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
