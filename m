Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB6228EA4B
	for <linux-doc@vger.kernel.org>; Wed, 28 May 2025 18:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748456745; cv=none; b=OCPohyfMdlBBrrU+G5xTTqJ/Owam/HksjlriuffR0a23kt3welUWc1n/B/YBKe/jvnqRs3ykPSH8zIH22lIxuLtTl1MMrtGYsswnGqOxipAMkLqjknQUOFLGO+vR+r/NF6Y7SdgNTixGEAiW+k29iXq1mZjP54E4Z7dQkwa3vtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748456745; c=relaxed/simple;
	bh=AcwcyGpDrfErPsyWm8xAfFlcYZSyGNfZutLD4QklKxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hAoJy8i5rlAoM4JCLbYam0Oi8N2l5ZlAXa8L6OWdksqA9u9ggIHdbb4hjndnww4puVvIEkyS65/kv0UK2pl4Y8qK8Ud2ZqfetVIHi+OnsHVi3Hgtwe3Ea2kYw+X9IxcvUSgwWobfsvq+FbXB5P1EDX9jiEAZp9vy5UYPNCQgLdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=bcdf9GzU; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="bcdf9GzU"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-234c26f8a25so294575ad.1
        for <linux-doc@vger.kernel.org>; Wed, 28 May 2025 11:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1748456743; x=1749061543; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcwcyGpDrfErPsyWm8xAfFlcYZSyGNfZutLD4QklKxk=;
        b=bcdf9GzUH/qkvrQSKiVwX3UGs1vEkrTQECdy0fa2oyHOgsyjRl9EharQdf1hrOxT5S
         aOgqVAhiFy38epz8gLWuFNKnZVI87uDMvm2Czhz4ACUQFWufFrAm7cNj4iMzmIstrJdR
         6SPaI1NtnmZ5amQbOuuBLlGr90UEvwq/Ox33pfIIwfce/Fa/0xkO7KIziJEhtVGxloz8
         sZDwmrFOgsPCuqm2GwgExxbVBxsf/lhbSYNJXoaAdlIhhETa4mvvzVv2CZCp95SE3KoU
         JrNM1aTQQpngAB/1d1KJdpyUyAeq7PyX/U8XqoPUhJwHvShnK5vz4AEn0LIcbBA8gBB2
         +9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748456743; x=1749061543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AcwcyGpDrfErPsyWm8xAfFlcYZSyGNfZutLD4QklKxk=;
        b=kCr176xQKwKRO+aCFfFRgyaLDOboRb5gBIU9JEkfv14VDI8hEugrK5nJB1aiJkjhAc
         NioLVzn/Yxnu4e0eRgToOels37VcEGVj30UOQ87uyjOtONTZTVidqoFt/ZUleNQfXW1o
         mWOuoMqhAKme5OTKUN70HOGKIy6Vrnyv8tTylc8HFzbprv0COh189bhP62jdCRyGXsSC
         Qh2nfApxZtSoRuGl5tpG50+PIjz58IEir5KFYXPccJa7QIGVxvKXcnA8cfq+kXqSLRE+
         8R9DFD0936eG0C+yL9vaC1gzrEn281qkTKFz2kmHAVmWxXW4O1uXGtrcmJbr82UUbScE
         d1kg==
X-Forwarded-Encrypted: i=1; AJvYcCUuMcptlCORI60JNcUBm617lKjValYCPPgko8tlgooAMgrLGUR8Cx52K1OTSKG09isVLx+ztPvpif4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5HDIGfU5iippPKW2aKj4DqlQWQGGsUnsmau3LLigVzO2U0xgJ
	ffUm5K8UMAfyWOEGu7hKccWZevzWAsBkupia6x+W4QEbBFC1Ex8CRTAJ6e3Y87yDvgTKim7Bt1v
	u69+15jNPioj7T0sY1hC/XKlTEjX0VEpII2M3yHmvng==
X-Gm-Gg: ASbGncvKPmZnB4Hc1Q5nfG8afKepsuFy2gq4kzvqfZ4XwxDqs5zzDw8pUHOX94Ptf+N
	K6V3FDHxr8nDxnVqmWOJNQRI6dHgcEX/H8el4HixsSQNZxk4gb9UsU2LCOvrYyWCZnpd7qmbwl4
	uvZVIxGzmuh9z2fLpzElnFmTzv669Xc2vh
X-Google-Smtp-Source: AGHT+IEqPgJEvwuKzLiSxyyIQ81so3lXBN15LCeb6qSM07Ix99PnGXOOlMeJsGGG1A/YckjG2+wZSDm+qfUtj+1ifm4=
X-Received: by 2002:a17:903:1b6d:b0:21b:b115:1dd9 with SMTP id
 d9443c01a7336-23414f53285mr102307925ad.5.1748456742958; Wed, 28 May 2025
 11:25:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527-ublk_task_per_io-v7-0-cbdbaf283baa@purestorage.com> <20250527-ublk_task_per_io-v7-8-cbdbaf283baa@purestorage.com>
In-Reply-To: <20250527-ublk_task_per_io-v7-8-cbdbaf283baa@purestorage.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Wed, 28 May 2025 11:25:31 -0700
X-Gm-Features: AX0GCFtwLbawvnl7mK2nPLXhDZ3ch13VYeZVtizo1aZXU9QSxG4dusWwjli_jhE
Message-ID: <CADUfDZpjFv9Vo1H2rzeCyYo2nsnP_k1prkTCQqTtpk1YjL==zg@mail.gmail.com>
Subject: Re: [PATCH v7 8/8] Documentation: ublk: document UBLK_F_PER_IO_DAEMON
To: Uday Shankar <ushankar@purestorage.com>
Cc: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 4:01=E2=80=AFPM Uday Shankar <ushankar@purestorage.=
com> wrote:
>
> Explain the restrictions imposed on ublk servers in two cases:
> 1. When UBLK_F_PER_IO_DAEMON is set (current ublk_drv)
> 2. When UBLK_F_PER_IO_DAEMON is not set (legacy)
>
> Remove most references to per-queue daemons, as the new
> UBLK_F_PER_IO_DAEMON feature renders that concept obsolete.
>
> Signed-off-by: Uday Shankar <ushankar@purestorage.com>

Reviewed-by: Caleb Sander Mateos <csander@purestorage.com>
