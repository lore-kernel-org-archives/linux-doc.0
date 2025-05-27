Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BBB189B80
	for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 18:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748371054; cv=none; b=onTSt12yJC9LJVxvTCr28c5HbNC0Ur8awc2esp1cP5Z36D0tDwvUCNybzo6PxCOBpjQRTtPym+AW4D5hbCquoQZxe3umSWf8Ai11yLQdjcogkLK0NuWt3v+ugGORc4Yml0KQH4iBL6fWi+MJm8qFAJKg+0CsXQqMpdT5pp4U3y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748371054; c=relaxed/simple;
	bh=TuQk566s+Q0ln3wP7QoM1+7HbVXdvrykoGXS+3NTsHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YllIVUofxhGAfCuCyL3SzSUcN2TWUqFvDrZgycqP1fAXNj7cHDh1dpDV7ejZXxysrRC1X0qlGKJ/vOP/cs55nj734MskVeNrb3bCboeTm1kK3nrqJRnUreSb4PvF+qi/wCcMqAr8gVksbbfWwdtF6Zc6T3OyqzGj9OirEXEKy0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=G/lLt5+P; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="G/lLt5+P"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6046ecc3e43so4342907a12.3
        for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 11:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748371050; x=1748975850; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hj2+lcjOXOZv7KiFPOZxmuP+mffssHA7pqR7imIqepY=;
        b=G/lLt5+Pl+fuwo/hbvETbnCPz6ws3/LhSJtKRAHzXXxMluJ5PV+7WnSHfdEC6nB2rf
         +TYhTxe5Sy1F5v9LFFl7hBj3zgosTrxelQSA9bvsgt+P7LPr7vejVpTNbqs6yHtWZPi1
         2Oc6jWlylmETEIRjt/obJfFIHHIcCxNMW8DJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748371050; x=1748975850;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hj2+lcjOXOZv7KiFPOZxmuP+mffssHA7pqR7imIqepY=;
        b=d3/va3xOqD8U5QEQCgUdVdxjbOt1lfVzDcoMuUIs8nNrJBHKD6IGNxHc6vwiFw4NKb
         Qsw9Ejwpse3kluDi3mScN0TVGChgYgJiVaU6+/sNsNT8woYf6XnN8mvuvYDcWcABL+4j
         vAiVDBx10S7l3kV1a7odtWNPnTe2euILYIVtFq9g4p+8X6uAjG3fPT39JTVv26JCHTGA
         9q1U5epr6AtyXqLKLgJ2T/7m5MZdQxYuvfMb8P4rUmCF5vh2/fMpkDPpqZbyDCDiYfnx
         VQUgglprQsj0UHmL6Bi7YeVAfZMQn3kWrTxjJsViR2CkrwfxvpmmyIAyHBT95X2JYszX
         b6XA==
X-Forwarded-Encrypted: i=1; AJvYcCUh938ex7Xu70wchi290Ae4lkirjvo5RO1Vb+k1QGnwV6E4MA3wqs15TFi8VmvKezgh5VutRPnvtyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz77EcUfXMhFoAJIe9qIJo6dxGlv6hjLCPoA0uFRSVr62F4MQPg
	WEY/n/vZztK8e9dW9HxVvxVlw4l0cF1NLwjHyKqrjZVRWsa8onUHRNQC8uGeleBS8bp1lEr6jtl
	m2dJB+AE=
X-Gm-Gg: ASbGncvDFsmlQiFIAzDOVak4mp4N/5Me+2M1PQHGPpqVqlU5BrUY1azm7WzCfukyKui
	AIw+mQ6qXG46orG3zVKjvy9vcfy+Q35Wgx22lAx9QUaxxBnn0XHfVBtxKo9BbF9z0S8PKcg+R+l
	smRW1YNJTyj0FjnNhI8byHO0cCow97ugD0H3soxqcCO81g3Zpzu74Sn2xdCchbXhKadzmmmhEqE
	BRHKAi+KeCgcwVhPMm+wyqYGX3mgxFhKyLREOX+vwHvqQTO3kRylBVzUsP6mHGGZc4XbJ62Acxi
	7XXib94HgwhdBNJVOgT484ioxAp7da5po9IfsNfBmOL73NzrmTr3JBU/iuxOq7E2LKT7JruMTvL
	WIMv1knMEsK79z5kTut527ozp
X-Google-Smtp-Source: AGHT+IGGhIootA73gfy4Bg83mQPSE5V8Z0c9zacSRn5qG+4FVBX+KSCK1pxJ02WMRqF0V5oelYMLOQ==
X-Received: by 2002:a05:6402:34d6:b0:601:94ab:790c with SMTP id 4fb4d7f45d1cf-602da2fb5a0mr12847877a12.18.1748371049902;
        Tue, 27 May 2025 11:37:29 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6051727d828sm3208a12.65.2025.05.27.11.37.29
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 11:37:29 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso659425566b.0
        for <linux-doc@vger.kernel.org>; Tue, 27 May 2025 11:37:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUwPsT6D3uSIEgSemEwX0zzOFi/cC4jvdb1g6bzjH+nV+MTzksaVW7YHbuX8AzGoD6BI8lc961ypTc=@vger.kernel.org
X-Received: by 2002:a17:906:c144:b0:ad5:c312:513a with SMTP id
 a640c23a62f3a-ad85b2c17a2mr1022204066b.56.1748371048991; Tue, 27 May 2025
 11:37:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87bjrekpp6.fsf@trenco.lwn.net>
In-Reply-To: <87bjrekpp6.fsf@trenco.lwn.net>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Tue, 27 May 2025 11:37:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi6U90ddnUvh5A0AxBecSPczswRj4hsd2rvKeMv4pUNgQ@mail.gmail.com>
X-Gm-Features: AX0GCFsyyQo8w_POWyPRKioQ18WfcIChszVMUzK-DjTlXF1qv-KGOOC-nNCgKe4
Message-ID: <CAHk-=wi6U90ddnUvh5A0AxBecSPczswRj4hsd2rvKeMv4pUNgQ@mail.gmail.com>
Subject: Re: [GIT PULL] Documentation for 6.16
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 May 2025 at 09:01, Jonathan Corbet <corbet@lwn.net> wrote:
>
>  scripts/kernel-doc                                 | 2440 +-------------------
>  scripts/kernel-doc.pl                              | 2439 +++++++++++++++++++
>  [...]
>  54 files changed, 7336 insertions(+), 2815 deletions(-)
>  [...]
> mode change 100755 => 120000 scripts/kernel-doc
> create mode 100755 scripts/kernel-doc.pl
> create mode 100755 scripts/kernel-doc.py

Bah, I was unhappy about git creating this horribly diffstat, but it
turns out that it's because the pull-request scripts by default don't
use the fancier 'git diff' options.

In particular, with the '-B' option, git will give much better results:

 scripts/kernel-doc                                 | 2440 +-------------------
 scripts/{kernel-doc => kernel-doc.pl}              |    2 +-
 [...]
 54 files changed, 4903 insertions(+), 2821 deletions(-)
 [...]
 rewrite scripts/kernel-doc (100%)
 mode change 100755 => 120000
 copy scripts/{kernel-doc => kernel-doc.pl} (99%)

but I think we never enabled the 'break rewrites' option by default
because it generates diffs that I am not convinced non-git sources
understand.

Oh well. I just wanted to point out that git *can* do better than what
the default settings make it do.

          Linus
