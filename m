Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EA925A2DE
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 07:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762845593; cv=none; b=jLPcj8E7T1eS639zbZP/VCyimQ76jRH4W1FrHY7MAhxDygOIfVveX2wTf/+LS1kO4INipctL/X2XRPB8jCrs4c7JzN4FPcv/3AcZgVBWglel7waTxTtf5xZ1SfwRYb4nExycByCkVHhUogxOXHTRMg5Xk/M/dblD8p/o9DTRbMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762845593; c=relaxed/simple;
	bh=tmsSeEiwy7O2Flj+b3Ome3Ent2XkRKkKA5yFHv/r9jw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JzpYb9WyEPeEVUypDXDZ5tP3QYBWetjTrp+jofXJOabSlqE3+ELguuH+8lnMXA+M+fro6qbAxMhoQ5IzWSC2/ZNlD4Sji6KTiW91hCt1aLnoGWR0F87F1WozGn9eqFcY1k/cvGy/XpSeHQySJZ1agcIDKH4Q62wFjr5miG6/+Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=deyP5hUm; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="deyP5hUm"
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-64080ccf749so6039701a12.2
        for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 23:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762845590; x=1763450390; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmsSeEiwy7O2Flj+b3Ome3Ent2XkRKkKA5yFHv/r9jw=;
        b=deyP5hUmZpr4RPloQ2KJbXdAXAjYt4lnKjsN62BKZNV0o6CINd3pWGAqYsJX2NA1jz
         1hRDayyVfTpPVxrUkUIjWENR97UKPRAhwwL5ppQreKaBXfv7cGG50hHeh+RQhCETznwk
         ET7UOIBgbmuhFYfEBUcMUs1Q/0sS1X/7XWq3VT5NNJw+/0W0xgAq/Ok4Ful3XBpNf4YR
         UZue0SXxvqkFoA4QZ87i2d8oPm+ufOQWZFrA90JaMvzVolTUygYlCdaobdIXKTDZkEcp
         xPnJdeCPq3np0Bf8v5YQEsNeOArjD+WZ/bIQpuFlQ0UFrWG6kYVD7EP8Nby4R4CH+s+e
         bhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762845590; x=1763450390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tmsSeEiwy7O2Flj+b3Ome3Ent2XkRKkKA5yFHv/r9jw=;
        b=DF3ryKhRZs3swOtPtLNWUeDl5CmumYTwYAHbd6fC3yx/8GsUGJdqw45ms/XeO8tzN/
         C7pAmHf84655WeADRR5ML0a3HckCRPUyuDOxLF0iL0rhKX2e7VVck/stUjdCIYXswBBe
         rmyK5+6USxziVcOb2khsqa43/HjKXtyj4uTKFJFdqPfJWCpc1SUxjPuMT1d8D7mm+Jqr
         vnEO4E5Fon3fY4wjHUoYwosgk8FahBcPj7CWxWb5wBL1sc2ktThk4Q6gE0pleocw0QjD
         jXWaznfHvhdcgMb/ztDdrh7lKIq01OZ6rATC14dD041KjRj6dMHTBnGUUGglYxcSDbOg
         JmpQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6+m8j66G4koQ0OMK303v+9tcsOOMgvHj6Odp6VyAYMbmyzPyyHiU8NDzaw3QnTpvUhFI6ADXnYUg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3tsrjOFXRfE37XaonDg+KSwKrcU2KihzCnbA2mbWNIk8TLMSw
	EDCptytVxd9j4SctB/27x1faogJped/1JayTYwsaO4eLcCWa2p1imoBn9yDipP6/+3zeSiD0h/j
	RjBbBzzf1TfKxsCRnSqM/EK++zf6raow=
X-Gm-Gg: ASbGncviFpoFLkRzI0ERCSJjA8GTJhIsQrKLO20WeOQM2+nVleDejdX06dMMmdcNFdJ
	yZF3N77RkvQHCfOo3RQfpTVpIRVXKgLrZa8ounSYcfcxUK6/WqEphGnMquROszLLNS2Uq2v4jJ5
	kss7HeVIKChHP1uaKBH6PoMx+ZD57lztgdyc8dM6vZi0GEapuX9oydyFtTN9u/Z24UuuXgAgTar
	QgL1wKG8AnqkyJAX2WuUjYCHMGP2e68msFXYOY/RN+ILynOOvf5eqkfUXdsbVdj2CzTaKYh
X-Google-Smtp-Source: AGHT+IEILfbpkde/uS7fyrqgf/ox44as1jmga0EcJSzlE0mw8B229GPU854X9ywyq4BIeWOjfBvkzZBAwJTDsl/4QO0=
X-Received: by 2002:a17:906:794b:b0:b72:5734:9fd3 with SMTP id
 a640c23a62f3a-b72e05626b1mr1255885766b.32.1762845589581; Mon, 10 Nov 2025
 23:19:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAN2Y7hwttMyUn0qsEcSBbrQ1h+aSzNpHMhgAxEbqJZn4vf5hBw@mail.gmail.com>
 <aRKll6BXZdW2I_Wq@casper.infradead.org>
In-Reply-To: <aRKll6BXZdW2I_Wq@casper.infradead.org>
From: ying chen <yc1082463@gmail.com>
Date: Tue, 11 Nov 2025 15:19:37 +0800
X-Gm-Features: AWmQ_blPfOg1c3a-jvdBes0ocXd_5-Vkj3sUlAGVbick8skM2v8TvUeUgmDbWRg
Message-ID: <CAN2Y7hzT8aADtejR2TUji_8ct2LUb+Cpgd-2G-pAUj0figB68A@mail.gmail.com>
Subject: Re: [PATCH] workqueue: add workqueue.mayday_initial_timeout
To: Matthew Wilcox <willy@infradead.org>
Cc: corbet@lwn.net, tj@kernel.org, jiangshanlai@gmail.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, laoar.shao@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2025 at 10:55=E2=80=AFAM Matthew Wilcox <willy@infradead.or=
g> wrote:
>
> On Tue, Nov 11, 2025 at 10:52:44AM +0800, ying chen wrote:
> > If creating a new worker takes longer than MAYDAY_INITIAL_TIMEOUT,
> > the rescuer thread will be woken up to process works scheduled on
> > @pool, resulting in sequential execution of all works. This may lead
> > to a situation where one work blocks others. However, the initial
> > rescue timeout defaults to 10 milliseconds, which can easily be
> > triggered in heavy-load environments.
>
> Then we should tune it automatically, not blame the admin for not tuning
> this parameter.
Currently, dynamic tuning of the mayday timer's initial timeout is not
supported.
