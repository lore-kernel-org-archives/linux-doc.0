Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51A164A8F
	for <linux-doc@vger.kernel.org>; Wed, 11 Sep 2024 07:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726040466; cv=none; b=QwpXm98SKKFdVeRkD5dcmddPWigzAjVGW10nMBK61UazSF1ugO8HCSIwkdEcWK6GJbgvVFVWyGJ/1bSheNLKMaaRYHWwMMGoYEsm/Of4B1FlbVXgf0NzH/o4JeNONUR+4zvW1YTiSdHxvcH5Twju31XerNy/RmVN+JUn4Wd1Dxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726040466; c=relaxed/simple;
	bh=uRFvJ5+hV7kipzY0KzGsnYB/ROapPXaG8FBdZsIx3Hg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AVhMrnIMXI50e82faXWw+xYIOHL/hkCYcNMiYrk3uKMpM6uK6SSd3XTRS8ubA8p2Q8WfBz4RuWqZPwjLXLqfp5UUfTrCFMVVtLSnedExl8dpK497V5wbmbfgXhZE8MoicjLcWzmI10aMGkbB+sSeA1rNMEcgcdaBzCF99xRpw3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tXCS2lwL; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tXCS2lwL"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5356aa9a0afso10922713e87.2
        for <linux-doc@vger.kernel.org>; Wed, 11 Sep 2024 00:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726040463; x=1726645263; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRFvJ5+hV7kipzY0KzGsnYB/ROapPXaG8FBdZsIx3Hg=;
        b=tXCS2lwLRtCgolf7w83k0KAFOeB6oUtzw+UvRuZYlsB7PfKRST4Fw43RA4D3rzdsJE
         ebwAoMsCJdJyGRyRoWD4lYc5pj3Qbjk4a+Ww5BR8U+VjVyktrNenimzOBprMBvwLzQgu
         WUQeLqn41QSfCfSfFhNVSRpqi4Cs9CT1xFylayRhkrZLdgXyRMa0LvCLbgZiMV3BL6D3
         lNTGOCuafkTi7cKqI7qClb4jZ0r5UqyqEfgQC/97ucFhtw+8Hj+3Sr3VD9knc9w50EmW
         biCmkPDCb87tJ5CA9Ql4/lBHsnM4Ei94ttFKunbZ2kM3kFnewcAWLOBoJsPUE8XdAi3e
         9wWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726040463; x=1726645263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRFvJ5+hV7kipzY0KzGsnYB/ROapPXaG8FBdZsIx3Hg=;
        b=hsSm13R4oIDXsECEj1ivRhn1R8nrpkvSbgtFR/OZSuGi7indsTlI27BHIN8inAuQd+
         krOm6/a9pvAV8Ot99Jrpu3rZVg5fMGOX+hDHX0M523s1hGGOEdXNRuNn0zXBhbl000WU
         PRnPfn2NqVGukfhRRu1goLOerWn3oZMZrcBrTZvPYpj6H5/rjyYcLOUnrmgc4RUezsJ4
         3eySXko0u6yF8MXNnFmS27QMsFyvdqlbcfvtJibpt+hVy1ph5cqQ/iG1KI+dxLqIGb/q
         CmS99E4N0Bj8Nr/wu+pu7K7n27K/qi+8G8MoxpREAoYG2gO7LY/8dijIAR8N+BRSc7Re
         322g==
X-Forwarded-Encrypted: i=1; AJvYcCWFuz49imPYcUxCSrFqW2FN3IVRFsJsrY6WASqnQzOHTzCcohbPoASR0tXkRecZ+H7nVIXs6Ik/LWU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/nORZgCnNhN+aYrdn2IANto9qR+y8okytAkDmCEqX7bdo2eLh
	uVk5ZywHN5FBtWR9W/vd5doou0IrTXjXGC+YBwiI9coloRjUfYEEgghOITKv4ukzUHsdPrsOo+9
	jAhzHPxqf0yEPcCL5JztGSRc+XBZSZk7blusB
X-Google-Smtp-Source: AGHT+IFRO94eFk8lyGieG6bzBf83rb2Yj1ldYiU+jYKRj3JF723mkSoRslv3qc8t/lvhC6jB+C0t4gg/v8XUz/zgTtI=
X-Received: by 2002:a05:6512:3ba4:b0:533:483f:9562 with SMTP id
 2adb3069b0e04-536587f87damr12970563e87.42.1726040462052; Wed, 11 Sep 2024
 00:41:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240909-net-next-mptcp-fallback-x-mpc-v1-0-da7ebb4cd2a3@kernel.org>
 <20240909-net-next-mptcp-fallback-x-mpc-v1-2-da7ebb4cd2a3@kernel.org>
In-Reply-To: <20240909-net-next-mptcp-fallback-x-mpc-v1-2-da7ebb4cd2a3@kernel.org>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 11 Sep 2024 09:40:49 +0200
Message-ID: <CANn89i+6yPqdEsf7gEWSys0ibYwq7CLm70ikC5F2Rahync4yOg@mail.gmail.com>
Subject: Re: [PATCH net-next 2/3] mptcp: fallback to TCP after SYN+MPC drops
To: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
Cc: mptcp@lists.linux.dev, Mat Martineau <martineau@kernel.org>, 
	Geliang Tang <geliang@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, David Ahern <dsahern@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 10:10=E2=80=AFPM Matthieu Baerts (NGI0)
<matttbe@kernel.org> wrote:
>
> Some middleboxes might be nasty with MPTCP, and decide to drop packets
> with MPTCP options, instead of just dropping the MPTCP options (or
> letting them pass...).
>
> In this case, it sounds better to fallback to "plain" TCP after 2
> retransmissions, and try again.
>
> Closes: https://github.com/multipath-tcp/mptcp_net-next/issues/477
> Signed-off-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>

Reviewed-by: Eric Dumazet <edumazet@google.com>
