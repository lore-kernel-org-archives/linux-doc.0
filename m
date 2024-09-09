Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7C618E744
	for <linux-doc@vger.kernel.org>; Mon,  9 Sep 2024 23:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725926102; cv=none; b=dab0iwxZlYelVyzF+QY+xHGn3+Ez/wQCMHo9F2uqKLukL/1g+oWIAbURdYm73xt0Kz3xHlUyxj/cgbpbnf6mnzdO1EdTUYgTTpGfmv4pAp4VNaAuzvdLi/6l9DRKGLyeq2dKvpOQYD3avGDYoNFlfJxzhlV+zKwWU8GMVCCQTwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725926102; c=relaxed/simple;
	bh=M1KoFSpNUOLVXT1kP5VICXcC5Vs8wFtp9teskKlY70s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 Cc:Content-Type; b=jHdrLfatHS2EnrVSW1aOxh7Vi/JFR5Y1b1bg7UvYxAc+iWnfDG+U7vNLk0bwUH6RSgt3+Bdfo4N97PtYrnrMRppv+JhD9RtJrs6v3uoKS9gWzTCzdpjWnqUAp3xbWI0ABIKiLalfPDHWPQygld1DXyHa0SGan8ey90A2TLorouw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E6cTQc7U; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E6cTQc7U"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-502b405aa6dso1176928e0c.2
        for <linux-doc@vger.kernel.org>; Mon, 09 Sep 2024 16:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725926100; x=1726530900; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AxX5C1PVQFhcpEMOTxZjcoasZZvFqrJMsr5iTanZpSY=;
        b=E6cTQc7UZMiO4XetpoUFY5tCaa6W0UIdCJNmHgz3oasEO/R0ieuU7cplZNReNP/xuq
         wtIWq9g8AZXXxCQMP9LcY1A9VLZ0ibmZyU69T12/GEe3DcyFjrNAJPY7WQN7y+OQtayl
         d79qgWELFs1vXuAZJJ8phN3lvugX9A/GWkfqEvYo3ZiT7wS8fwiJBElyLUyg+6ynJWkX
         i+r7ma7gNRLJr9Ck0Qi6YSPofbwpYRhpMPn5QBrS8Tkwn7vD5RXUPEArVWl3BgAseIVT
         jHkTdt2zdqT5vigvdmTeHCfu11ohfeQNSLkW2WkADq3txHGJT9wUfiXDt9St9HvdfpEi
         DvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725926100; x=1726530900;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AxX5C1PVQFhcpEMOTxZjcoasZZvFqrJMsr5iTanZpSY=;
        b=Fz47qnmDyrOdGSmcl8pSAbfhH+tx17geqTlts1gW6hijpgTKVocp2PbrCmubNv6tUc
         mS7gjzOH2jYkIcIOF4iTFd2O7fjh4K1b+6VRI0ZAdHW2NfgpkoGpx/d7YxS48tXF5LuF
         zwrVpL+De6O0IYC8qOWbCNqesBo6ArbnHZKZwfRxOg4AX8naVlVlGO89R1lDMQuOsV9C
         wPD5HEgyxzaOaObCsbLIvug8WZNmM77IHHyMu6u5uTSSdHwzFmnmewCxzYJ+7iAryH0Z
         1GD2a6VDQcAMTqdXp+AuuzifzMjuQBMvGeBcrBJfAJ9lrctw0eSuUumtd2JKDW9y7i3k
         B/sg==
X-Forwarded-Encrypted: i=1; AJvYcCXRYL2IVxtQzyyoW5QtUeZQniGqia9Kp2JKPlzSJQTQcsg2Vsv0p0ZadihM5K5uteZcc0e/Tcy0XSM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4k3GAsujYgvSJN9tkjBlX3UiLTIn8ZVcepeeAOnv+Rv3QwmrK
	PSM2Ajh7UQGziKkWJIQzD3n47P2ZXS3CLvykHG84ibh3lrvwoQYQjfdtHChxV8J2wgh19a3SPzG
	B0yesIiYIdr1VO0wQ7fTLXodiqWQ=
X-Received: by 2002:a05:6122:2a54:b0:501:1895:203a with SMTP id
 71dfb90a1353d-502142032f9mt15753353e0c.7.1725926100090; Mon, 09 Sep 2024
 16:55:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240908192307.20733-3-dennis.lamerice@gmail.com> <346199.1725873065@warthog.procyon.org.uk>
In-Reply-To: <346199.1725873065@warthog.procyon.org.uk>
From: Dennis Lam <dennis.lamerice@gmail.com>
Date: Mon, 9 Sep 2024 19:54:49 -0400
Message-ID: <CAGZfcdkGw55MKTYxuOkCgu8kJU86jkERfLRJAP+J8Z6=0z1F+g@mail.gmail.com>
Subject: Re: [PATCH] docs:filesystems: fix spelling and grammar mistakes on
 netfs library page
Cc: netfs@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback. I'll be sure to revert the "fulfil" change
and correct the pluralization in a new patch.

Dennis

On Mon, Sep 9, 2024 at 5:11=E2=80=AFAM David Howells <dhowells@redhat.com> =
wrote:
>
> Dennis Lam <dennis.lamerice@gmail.com> wrote:
>
> > - * Allow the netfs to partially fulfil a read, which will then be resu=
bmitted.
> > + * Allow the netfs to partially fulfill a read, which will then be res=
ubmitted.
>
> "fulfil" is also correct:
>
>         https://en.wiktionary.org/wiki/fulfil
>
> > - * Handle clearing of bufferage that aren't on the server.
> > + * Handle clearing of bufferages that aren't on the server.
>
> "bufferage" wouldn't be countable and can't be pluralised, so the fix sho=
uld
> be "aren't" -> "isn't" instead.
>
> David
>
