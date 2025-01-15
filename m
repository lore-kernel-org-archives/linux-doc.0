Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A3A16A92E
	for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 16:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736959493; cv=none; b=TG77T8bMSqI7aB58EjLl3qXPBjQK64M1BBMGEumkZYUF1JsW2kN90wrUPqRgh8l1bWl+E8sayF0rptbobMi+pLxAfseblo8c1Z9x4a8pWcdaQiNEq/ijH5GgXNAGMfSLWjnfr6zAB0dT28Us/S968mFtr0nU7XxOTX5c42qT83s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736959493; c=relaxed/simple;
	bh=byrCqsR/sDHcgtdPmErvTP1MMNBghR1QTQfXm3qQM58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JYZmqPgmB0aJePVpr12ePdx4MJqBHzdJ8G3tYn8qU5S6lSbqgCYk6LxVLmM7mDlef3RhcU0NBSnxQkiCCqflTgD55G5H/I+r1xcD/+iiKvq0jJqnlNYw4NAuoAcBU/b52ahLLWEtXfZ7mzm7LccK/pUcCWGCVn5vEAyvSmx7I0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ehaWxV94; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ehaWxV94"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54263b52b5aso7158475e87.1
        for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 08:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736959489; x=1737564289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRqTDNR+wu88sckzjZy0egJFYIw3bWrH2oZ1rUrMA/8=;
        b=ehaWxV94LIaVST7apk9kvl5pVnfny+bWR5pBhGm1yzPN8ceQWGozolEn9plGozIx7t
         BF5s4jChM9/KQgtp0BiO/xn6Ni6hFKKv6a1PaRT5g4tOS0ta7L8UbCMcAdGX/UtaqJOs
         3T3dYyLTa7I62DJ0mk/dv50JjKjOnA+83p14U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736959489; x=1737564289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vRqTDNR+wu88sckzjZy0egJFYIw3bWrH2oZ1rUrMA/8=;
        b=pIn7/veX4D5mKhqihpvz/5FLbfUpnnBGEePBEyboQVRg+oNl0vGdBi+icb6a8U/0Cd
         wYnj0UQ1425NxWC1jx1TcNb4jsqRs60g8Iovnd2SWDvQQ8k8THsRp51Xr/SyyjNHwn9u
         gzEmnwQe78kRGxni5lDmxap+jQzHXr8/I3iE6E2bjp7x16fzn6fdgug7JQcGhjHY9/sq
         irOl2N/58jPVx1YsFccemgRgxcJgr1722EJdaxiD9SkcGh/WI4zAA4GYCZK8ozr69/Pp
         IzbQ8Ln509cOFYPbkuIQTHdK05y5CLIqH1cQYg4TvGfDM4U7L4+UC5FvGJXfNy0DWwSy
         IGNw==
X-Forwarded-Encrypted: i=1; AJvYcCUmEe0N8vnn/gWQr856cWikAdlUiBBafFC1QDdqqjGK78x3QBa7Tu62XCsSc23HjTlx/kC5Z8SDiUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlH+a+YUWqTHRqeceHBrEMUAqPsy9qBw+UGSTfZXOUW4CZcymP
	onZ2Gd/jyBHoRLGPjS4YgjDQLRSYIKEp0NHZBmyy+QxDjJ0p47EDKeW0hVJALm7F6yX2VgdgZwL
	RPxzPO9tmOjnmLnbzkj+nJtIDj8JwSu4lk8Zo
X-Gm-Gg: ASbGnctEDghTo6bRFHYATwyp2lvEadF+hdV/lhihY2dqiY8unFp2FxsYwL022o2em++
	/hXjba8UyJUDHhtz2LrlLJZ/jdjEFtSO63ywXNA==
X-Google-Smtp-Source: AGHT+IG1IJkSRLkdR3tBT1SoCLlLY9m1FFZQSHAVtlX95wOZ8jJcWLXIhX1ynx2PLeHZMN9gxuVMyxprb40o4TL7/xc=
X-Received: by 2002:a05:6512:b87:b0:540:357a:5d85 with SMTP id
 2adb3069b0e04-542847fe865mr9041453e87.38.1736959488724; Wed, 15 Jan 2025
 08:44:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115102950.563615-1-dualli@chromium.org> <20250115102950.563615-2-dualli@chromium.org>
 <20250115081324.77cf546f@kernel.org>
In-Reply-To: <20250115081324.77cf546f@kernel.org>
From: Li Li <dualli@chromium.org>
Date: Wed, 15 Jan 2025 08:44:37 -0800
X-Gm-Features: AbW1kvaJXF2icOCW9xQPir179J54U3AlhjVj275Vcsq_SMpV445BVjZSh0ym4ik
Message-ID: <CANBPYPiFY1YYXvo+uf3=0mmahFp3qTBbW=dxp11MsPf68j43Lg@mail.gmail.com>
Subject: Re: [PATCH v13 1/3] tools: ynl-gen: add trampolines for sock-priv
To: Jakub Kicinski <kuba@kernel.org>
Cc: dualli@google.com, corbet@lwn.net, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, donald.hunter@gmail.com, 
	gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com, 
	maco@android.com, joel@joelfernandes.org, brauner@kernel.org, 
	cmllamas@google.com, surenb@google.com, arnd@arndb.de, masahiroy@kernel.org, 
	bagasdotme@gmail.com, horms@kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, netdev@vger.kernel.org, hridya@google.com, 
	smoreland@google.com, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 8:13=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed, 15 Jan 2025 02:29:48 -0800 Li Li wrote:
> > From: Li Li <dualli@google.com>
> >
> > This fixes the CFI failure at genl-sk_priv_get().
> >
> > Suggested-by: Jakub Kicinski <kuba@kernel.org>
> > Signed-off-by: Li Li <dualli@google.com>
>
> No, no, this is a fix. We'll try to send it to Linus tomorrow.

Thank you for prioritizing the fix!

There's another trivial issue which I just realized after sending out the
patchset. When "sock-priv" is a pointer (like the example below), ynl-gen
generates ugly code and fails scripts/checkpatch.

Should I use typedef instead although it seems discouraged according to
https://www.kernel.org/doc/html/latest/process/coding-style.html?

YAML:
+  sock-priv: struct binder_context *

=3D=3D>

Generated code:
+void binder_nl_sock_priv_init(struct binder_context * *priv);
                                                     ^^^ extra space
+void binder_nl_sock_priv_destroy(struct binder_context * *priv);
                                                        ^^^ extra space
