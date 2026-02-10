Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057B9340260
	for <linux-doc@vger.kernel.org>; Tue, 10 Feb 2026 09:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770715083; cv=pass; b=aXvZn9dcgBkAGZwTVGgBBmuaFpPWQfCEkVCjsiZWvDzh+pU/BJ2uRc85sFipiHtTRaHIB2wdyhDcLDAgxJxb1nmmFNV6gElpdC4t9wQ9RvDEWXSvcNkwv323a4//qh2kGZ1bfsax8YZZLc1BnLsr+6pR7yrhAoIDQ5DCUt4TGyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770715083; c=relaxed/simple;
	bh=Bjmbq5mCbC4T5DcDtYejLhUrsUYcDi/tzNdDS8UWm6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cJBOv3upYYX6v2b7vrPo6bYrXvEp58skEWNy0a59CtTS3dBapVvMM7sei2H16fsqbfe6uNOdMOFcwtKw9nMzsf46mnAvgvkwbuFAo0FX+THumCoeNZnTFjCnUd3OX6zIlnFpRf5FrDe1l5vX6f/ic/0aaXqcofomhfsDc+F9Cvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+ONlH3G; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+ONlH3G"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-124a2dc92dbso328352c88.2
        for <linux-doc@vger.kernel.org>; Tue, 10 Feb 2026 01:18:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770715081; cv=none;
        d=google.com; s=arc-20240605;
        b=JC8csbxHt0Hi4LeWVwj1vTarnzKLYo6sQJ1MWlTVZsWuIQsSVZpmsUJlBIvhhAwewg
         AbokFuSO9KGTnpjgHRXG4zTDwp5eqzzrDz63Nb2b+iVlgdEHSOwT4v9mmS61YeLoUPw+
         qnVdz62p45Vu6qOjv1iC/YvxVZDAFu233qKNQMpMTr3LtDJkJPoaZLR/vRXIn8zLESPg
         kLQ78PEIac1B0NcRjMuYl6kWBVF6WxXGTsTmyX+glrZQwP/NWnctfXxj44ZxluTtsu30
         UEyQQbw3M6t6r4BO1bvCkECZPbOH1CS7o1aeBv3TBhgPavfAHfy25PbrDw8sFW9WtoyT
         epGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bjmbq5mCbC4T5DcDtYejLhUrsUYcDi/tzNdDS8UWm6I=;
        fh=AQDjx+2xaXKEr62P7aZWDrsDgLQ52Yj4WX3rYO/vgHM=;
        b=QPTCAJ63PGfLqyHAoh3A/zOzAnIfi88sJLZljnRTDUIQW4W5f6Fn8Slo0s8k2gbIrb
         7VRba4UXTve0R2lOORe5gpwsfusnWiEOJN6wDpwY8n1+/mc89dABWcUKLZVeQjXSwAGG
         OujOZmnsOggJZhYtinDK4v/VbCgRM1u5JLwp99dbOkWt8O2kMqVMBEoH28uDwSEeG64k
         xB5KOMUr40YB8d0MMtEmhIHj1mm0F5+092LRFO2fZwNCJERCG5SlVXaAohkxmRSwaVuI
         ndPWg6LdcvRdY3/e2tkN6wSUBihw1oMxMQ0tWvnhbvLlKfq2i6SeArNMuym+ETmP6huV
         ptwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770715081; x=1771319881; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bjmbq5mCbC4T5DcDtYejLhUrsUYcDi/tzNdDS8UWm6I=;
        b=O+ONlH3G/qSP6XaOijperd/UrIM/5cMwRB1H/z69Lri5ONMVUrFWpKlddvXhdH17kt
         VfB0CogmNKbxLA8EzMfOP8SHe9sN02brFnr7LRbIir8vc5/euKeDBjC5NqVedXsLBmcE
         uEa08dt97OYQXab/P74DBYQg1FifJR+zTaYuEK+lIAu7G056N+v6D49EXWQwf/x4yfuK
         kxjLldtD54Bnq6A6Kn0UjdyJ3e90D+KotoaaFl6DcvRGiJBFBqPR6VpenM1AgGfKcuYi
         YMfiy6QOVSDj7+R0HRo1cCp3Vt6qZa+DO5sZtcXozB05IgNuiLZIMMjen/auligG+fpJ
         kp8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770715081; x=1771319881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bjmbq5mCbC4T5DcDtYejLhUrsUYcDi/tzNdDS8UWm6I=;
        b=agdqVtJtZOUKNVnce+3VvzjOnMRPqvnRhYR5Zoflhzv83exkeYNNMLbk1yuPaX1b0c
         qHh6BHdfojuh1/QkAB95pRF2xdTBTF4CilD1rnkS/pdqGOZe17I8tmlihMIYsbD2Crh3
         3hcoEPQo/XgY8oGfqgEqHiKKAwb+kzr1c76jMYCtB98tK2dwMgdOaknr1iEt23OCVjMy
         J94gwTOq8rArbx2m7emydhnJijibSsrS8wFqBk0WXzNHRQZMIJiPXUVCWxuteHry7bbD
         uTVv3aNWCyNrhDklvFf3HUuMZ0ni0k0fFUejqVByync/tM0xQAlSzXCzSGTGffRy5V5Y
         TPcQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9bw0xl+xXXhJKCX3lyreBBs0NlUh0C3X733thuSSp9u5r7bfk5GjPKcj1fVXEszWgk1HMgQ0uUjA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJYHCQ55VvYpzIyQBdP3GZaaGw/xVq5Cb5jycCCvAW6Khk3Yk+
	DXmeqaFHcmjN/I63rj/4vNp3a5lEK8NQ4mATSHpeu3zDfTIP4NgyNdQyA7gKH4F2UXaLFpHp9O9
	ffCdf+F2rXO5VkzNMYuKfa9pCQty0M0E=
X-Gm-Gg: AZuq6aJ57irYJHbK0hxMKX8RdCwsQMVAhJXUrBuC9Jp37OZorW47rBGCkvMhoyJoOXc
	ot6YBEsmv+p4VzGZdJ6tmwhcQeRjTdGqiDDMsgJk/CYYO9UlGm1jFYcv2XD0tjjKClEWraeEEL7
	LYaLXOfLIlU9usjDCfB8Ea1mKwKzGOI4vDj1+7I2MY4iGP8HTr7aFv2jE6+kGjG5spKKOa9OVqo
	A/CmHVz+fifnI449qvauZDnFndzf90mv/R6MDuGa3tzKs/sjekX2S6s31tTfe+5tqouzUtz1apZ
	XphzZTmhEENibj/EfsF367oamTnaKtoMY1H2Es3as+XY46Dj8S3Ru3xRMSDpf8kgUm1B911MfEe
	oINgo13EgYmVVdIs7/zz1FmAb
X-Received: by 2002:a05:7022:a92:b0:11e:3e9:3e98 with SMTP id
 a92af1059eb24-1272494f67dmr219752c88.7.1770715080987; Tue, 10 Feb 2026
 01:18:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209105456.1551677-1-mkchauras@gmail.com> <20260209105456.1551677-3-mkchauras@gmail.com>
 <CANiq72nqH=H4a_Yo17KPmku5pPRMVRBADgj8j+=TcR=3r0vOdQ@mail.gmail.com>
 <b07f1bc6-c63e-4b97-95d6-c639186a89dd@kernel.org> <CANiq72nkVmE_91yz82e1cRuJK8F9SPP5GpD1mT=NYLBbRTL8OQ@mail.gmail.com>
 <aYrBU52OBCgR-chY@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
In-Reply-To: <aYrBU52OBCgR-chY@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Feb 2026 10:17:48 +0100
X-Gm-Features: AZwV_QjkDsbIYoiftCtGkfNW-taiiY4Gt3cD7LsM0k76oSccc34AX2xXNP97awU
Message-ID: <CANiq72now=ymUnmqV6ckaynKgSW7xB_3QpWpFmiG8Hvm_yV--Q@mail.gmail.com>
Subject: Re: [PATCH V4 2/3] rust: Add PowerPC support
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, linkmauve@linkmauve.fr, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 6:27=E2=80=AFAM Mukesh Kumar Chaurasiya
<mkchauras@gmail.com> wrote:
>
> Sure, i'll try to join the call and bring this up.

Thanks! Added you to the call.

Any of the weeks we do it should be fine, but if the time zone is bad,
please let me know.

Cheers,
Miguel
