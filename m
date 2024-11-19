Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72671CF7BE
	for <linux-doc@vger.kernel.org>; Tue, 19 Nov 2024 15:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732028956; cv=none; b=fuu3X5K2O4dPMspX1amxdgKho26QuX/rJHEAair4Y1/+BEGYEU8YnqX83AvW58ZKS69fAyfXWHjDBu6oQWLSopWq3osAQHcUGNNipsadsTDsCkLofjT/EYpBtjU5DDZ8TJGDFfQxmiu3dB/3aUhlzK1bNN3sWyQ9iPRcNj3wV78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732028956; c=relaxed/simple;
	bh=term3+YtnkBCGLWYkrPNKsOYQOVa1JK6phDy6+5uneQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cnj11a307uD1diqPZsQgsXfjxXlBAS/bDuuQTcTKCUWnxyVNC2PSmGhiDzUkk+oO99j4ipb/7SSNo9VOREICa32UZJrEURlmBtoq6fbyLXstvxGem3d2oW75HDSVqAOobOT9SnM9kvA5WJBZCcJwiq66qBre2HhCr5s1IGS7sp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=i0bFmwNS; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="i0bFmwNS"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-46375ac25fbso24417821cf.0
        for <linux-doc@vger.kernel.org>; Tue, 19 Nov 2024 07:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1732028954; x=1732633754; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihpfPch2+vS1oLDpcfa8u6AKTSTYRMwvV9Is7Fw0VNM=;
        b=i0bFmwNSYKDu56w+1KfoI9Wv/z7Q56Y3/FuWrIs4et2f725i3dexI5l4TgIuzEinev
         wcmXM0FIuAANPqkGDtDBKNOCtQgXcInxDAbAExbksuY3PHsg/XhlwlOF0jrmmPtxgNGB
         3ozG5M2Hh+5JZ4PRRxkzdhh9FBLO8fB6vuXD0EV5/gDmqsiLney6iD06PKghiruCZ2sT
         beqNIkYtAmdgmNHe6NcyUlPGa6IWlOBZCjwkQ0570tvTHBe63gecz24InBzRz6jYbk6y
         48IRg23n1UfQvNuvYBLDbq/cQt74DqFNBOeFO/LIUOdgbMUlQwrlNqLchCHK3kKt6aI+
         wrLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732028954; x=1732633754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihpfPch2+vS1oLDpcfa8u6AKTSTYRMwvV9Is7Fw0VNM=;
        b=O4TrXq0nn2hl0yb0yc1/LMCEBVs0z39+HJEccvmrPuV5sTQldJOHGxrsO0sVfMGzuB
         Ba4fT1rF2W18OZagLDCs5xLNO3yXHWsrssfZZHude8WrZzpsmKRkJOaNQI80QhLncI6D
         ev5feS247Sx6BheYIDxxj3wjrb+5yk4ndDV9xJD6AH+AaW3GfBU0FeRCUD0mf8bhVxo4
         Pn+4lVGnncYsucNeu6end80VY0u0hzstu1k/IoJrGJy7QTnM2DP3H3g1I+JN/XpT7Mu1
         gBQNnoLB9lNS08+zimab7PBavJOzlIB1m+ZWK69CL7/Jz+IvrAD3W66pdMbk8oqRt9vD
         DEtw==
X-Forwarded-Encrypted: i=1; AJvYcCXe4AHQ01fNorGBA3kyKW5KqwaF0NMpf8qUaHb+iJY8vvEergBKYfLDQfzozc12GHcbN7tX6l5zTrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaR04nXEcKdtVGiMRPiTCkaPkXAzbsroNq7HzA7xJBWSDI5vOd
	4rL83Huz7d4vcRZE1qXqq6Kxy/KxMkEZ5UN3Gz/fN1Qo/DsPaELXHUc/34qJheA+UEvu3nOlxeY
	47LgXeaVU5u/ep9uRPzKRp2of6owj8KiOj6Uo8Q==
X-Google-Smtp-Source: AGHT+IHRGpOUonbjsJFvyqtYHjjDkldWUt457Akk0CmInRHYKiSo8TSkt2aWu9nazV3c0hbsQ8hzQfAATih5DjFXh3E=
X-Received: by 2002:ac8:7d4c:0:b0:463:990:4250 with SMTP id
 d75a77b69052e-46363e93fbcmr224538141cf.38.1732028953763; Tue, 19 Nov 2024
 07:09:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241116175922.3265872-1-pasha.tatashin@soleen.com>
 <ZzuRSZc8HX9Zu0dE@google.com> <CA+CK2bAAigxUv=HGpxoV-PruN_AhisKW675SxuG_yVi+vNmfSQ@mail.gmail.com>
 <2024111938-anointer-kooky-d4f9@gregkh>
In-Reply-To: <2024111938-anointer-kooky-d4f9@gregkh>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 19 Nov 2024 10:08:36 -0500
Message-ID: <CA+CK2bD88y4wmmvzMCC5Zkp4DX5ZrxL+XEOX2v4UhBxet6nwSA@mail.gmail.com>
Subject: Re: [RFCv1 0/6] Page Detective
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	akpm@linux-foundation.org, corbet@lwn.net, derek.kiernan@amd.com, 
	dragan.cvetic@amd.com, arnd@arndb.de, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, jack@suse.cz, tj@kernel.org, hannes@cmpxchg.org, 
	mhocko@kernel.org, shakeel.butt@linux.dev, muchun.song@linux.dev, 
	Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz, 
	jannh@google.com, shuah@kernel.org, vegard.nossum@oracle.com, 
	vattunuru@marvell.com, schalla@marvell.com, david@redhat.com, 
	willy@infradead.org, osalvador@suse.de, usama.anjum@collabora.com, 
	andrii@kernel.org, ryan.roberts@arm.com, peterx@redhat.com, oleg@redhat.com, 
	tandersen@netflix.com, rientjes@google.com, gthelen@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2024 at 8:09=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Mon, Nov 18, 2024 at 05:08:42PM -0500, Pasha Tatashin wrote:
> > Additionally, using crash/drgn is not feasible for us at this time, it
> > requires keeping external tools on our hosts, also it requires
> > approval and a security review for each script before deployment in
> > our fleet.
>
> So it's ok to add a totally insecure kernel feature to your fleet
> instead?  You might want to reconsider that policy decision :)

Hi Greg,

While some risk is inherent, we believe the potential for abuse here
is limited, especially given the existing  CAP_SYS_ADMIN requirement.
But, even with root access compromised, this tool presents a smaller
attack surface than alternatives like crash/drgn. It exposes less
sensitive information, unlike crash/drgn, which could potentially
allow reading all of kernel memory.

Pasha
