Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F881A0732
	for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2024 15:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724944994; cv=none; b=jYVM/a16mVmIimraPZJ4GpUpXwDOrzLIDWDGq3OlinWraPvwvihtmOeDWOgtz0kbj348Cty1BuhSrwiU+HdWfmsMMK2OqxUZBGVkkDMRAtcw4izbSICfzsySZsvoGug8+vlzR1FQhbs/NbHoUwlzlzeJ8VapqgfD8Z31y19i6UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724944994; c=relaxed/simple;
	bh=3eiFbN5nzjKu4yzFtXfz2GIM1Xl+U/uh2MOzzyJsOaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=liD18J69Amj9cFxyGcbLslcXX/uZaL0ga8aN8lU30bBi/IFfkxr9cuWAV3ErlUHN9Ij68lxx+8DEReNvX8Ot5iiSvlc03Qe597m1vSSMhgwhU1npRpyvLEn6tN2QX/Ua2n4VSphfK70JbSpKb87iClCzusu2jO7dFfprle15yH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=meiDYu5T; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="meiDYu5T"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a868b8bb0feso102420966b.0
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2024 08:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724944991; x=1725549791; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3eiFbN5nzjKu4yzFtXfz2GIM1Xl+U/uh2MOzzyJsOaY=;
        b=meiDYu5TEe+P8y2IQC7Lo8O1HQaR5IUunO2qiurUO/sYEFN5eW1ZsPZ47ptL/SCHI2
         tDqofUOTJNMUWxRcgzKO7jGidIfnvD/gN8zcB15G7qZ4ZL+7Lg/hLHaKcGdnDIy/vIIJ
         DK66eB4q5g2hrAnfOcU1qvQFbtfadBCGsltia1xmZgiiLYQopcu+s+MhnhXQSASd6VH7
         m8EQHfVfP6HRtedjqvHwAsK2lTwZ7wruc/hJHJLL7bt34MeiuUCStsrGA+62shChHI6y
         yKKUMADIf5eBcuzo1W/vJ0X1q33Pg2Ln198MaqxeuT79sIaMyrIImm83PPTZ1S0AgiB4
         JbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724944991; x=1725549791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3eiFbN5nzjKu4yzFtXfz2GIM1Xl+U/uh2MOzzyJsOaY=;
        b=m4rUjxXihcd8f5LCcTDfuYCzmBsLyrr8riA2RRiVEJ4JG1jRnzsMUzDjYpxs3GWABw
         IanrbuqlOsGNjx6qWUmnX6N342nghM6fvGpjBSGugnFBMb6iU+s8L0cjRn4ncFJFANJZ
         VtWB/MGgcspbf1No4HY0iGYXL3jJ6qGC3hFGy/X878W/Bkuf4wMxF1F+MF6cvcpn04Ij
         lCJsuGapOVd14DO1SQJs5Q7dvHsUTNYL/Cjd0HvB0GKSZ//8YnjqPGfBmamR6tSD1Kt/
         YFu+UmjjQ24JLkM2NCzrfUS8QjMXRVDZ4/mGqrU+GDzj184vpcjaOO49OadmXCjd48vG
         cseA==
X-Forwarded-Encrypted: i=1; AJvYcCVelvgsq2itiXH6Plt9Y1OWGuuWL+GaohBbMkf5canwmVUbMkQM1Uel9QIGO7qQYPF/wYR5uUG0cvY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn3FVk7nr/g9icGEvtzA8ucYiGDX6li2LYv0hHS8A17+vIcNr3
	mfAXmPicZkHNs4BWhaPNqKaUl+qzxLQpTYGbRcongfbrCA5iPZJNN6iyD4idUlbke++qUd/cTkX
	1jcOvi0swM+sQtRYkOYpJZy33pKlFvXDYK0e0
X-Google-Smtp-Source: AGHT+IGSbtS6/CWk7vGWKdV4Q6cqHzpkgdgaZWeC2y6HTP25EM/sj5jOpfnYqyUkdqMAjsAWDx2GtnP63g3oDmXNJog=
X-Received: by 2002:a17:906:6a18:b0:a7a:9144:e24c with SMTP id
 a640c23a62f3a-a897f79aec6mr245337266b.9.1724944990245; Thu, 29 Aug 2024
 08:23:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829152025.3203577-1-kuba@kernel.org>
In-Reply-To: <20240829152025.3203577-1-kuba@kernel.org>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 29 Aug 2024 17:22:59 +0200
Message-ID: <CANn89iLEh15ZfiCZtjtayTUdYYgne340_nNQ_znyua5ngjjEDA@mail.gmail.com>
Subject: Re: [PATCH net] docs: netdev: document guidance on cleanup.h
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, pabeni@redhat.com, 
	andrew@lunn.ch, corbet@lwn.net, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 5:20=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> Document what was discussed multiple times on list and various
> virtual / in-person conversations. guard() being okay in functions
> <=3D 20 LoC is my own invention. If the function is trivial it should
> be fine, but feel free to disagree :)
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

+2

Reviewed-by: Eric Dumazet <edumazet@google.com>
