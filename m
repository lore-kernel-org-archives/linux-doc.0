Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADC81917F9
	for <linux-doc@vger.kernel.org>; Tue, 29 Oct 2024 15:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730217194; cv=none; b=Dhiqchf0ScJgIwhHmAlMk3jYUoHZaMJJ4Top/lQkkbjH+1PCOuZ590FXbCYCFdGErVFaDMYVuJbN3LB1y33Xrh/RFBrY3/JaS8S9BKCgXz21YX6v3aMl4/nJTEgblCy7zQCAd0+m4SxPLkcrIYkTNg884i++O5BcBiSRgywZRds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730217194; c=relaxed/simple;
	bh=Q82MjAAJzY011abIoj9mr3/lCIvynpDz1KuaP8yYE3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kx7gsIhv/Gz8w50YPBNn5YQXLpzlxF+bQ09kM5xJFZwBKupBFFGWJn8A4ItRxZXiMXL9g1vuYFUTFXw7KIGTPVOkWBJ1vLBjgV9rkHkmq6PrCLr5h6+ixZi46Rwxe9I325wJb+sneXDa2sf+LLGExhhQQpdd0lC8id3eC/SY3IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dhTJN25g; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dhTJN25g"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539f58c68c5so9318774e87.3
        for <linux-doc@vger.kernel.org>; Tue, 29 Oct 2024 08:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730217191; x=1730821991; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ll51C0PllLi1/aohJqQbI6RPBpDmFIRC+GA4ELQxeFw=;
        b=dhTJN25gmGQnWVvbZHc8HZzVc5aEPMmtMNvZJLvBmiFgavwUXcHdgbezBKjI/4x9DT
         1cBxNiLlrLyiJg8N2xdN4TU0WddqxEUkXcw/IHQQCdmuBiL9OzAR2f8lz7kSpN+G9HV6
         FalKknhrBFfMv2+BNq2IuzeXoQPmZ+HjPFu6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730217191; x=1730821991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ll51C0PllLi1/aohJqQbI6RPBpDmFIRC+GA4ELQxeFw=;
        b=SOg/6ProeEmCqU8Y9uoneNaKOi+ohr8fk8RPMRx9Ev6b/JghoLnJisnwdYpz9nQSBq
         0v2+rwkCprfmwlvJssu/W8/wl1CiLtz1KwVU4+/hG2JVpiWEJEOubIrhIfxbuBPHQj1R
         VjJhPv1/rbaV23LhQOxvo2OPYkli+lcj4q/RleSBNFsOy6GGKpdtkYfkucY4qzJ6R0ET
         f8fXR44b2AHU28lvPLgGKdSBvMtY9fsIFNo3JWAz0V+sTmvH9sxRIloJIhz0krnklkT+
         o11P/QU+GqTxLHYVSAtF4Fj02FoxGe/wXWe3onA5WTznLN8naRJrGDOCx8D2mgre+1OH
         C33A==
X-Forwarded-Encrypted: i=1; AJvYcCV8aC4xhZZmLD5CQnK2fDyVRNpaHHrUj0okqlVYxh76ajthAGhvzYNPrDQvaS0tO7vK2KD9w9mhFV8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbfuoklfc6RVv+v5Jlcbp1ZUH20OwtRbk0PDireZ6Y/H9TEzej
	0k0zPKZJ5lUhMrXzGNIYkzKZlrWMSUJyw3KCUAh/PGE7d9kEIwpkSkl17jqaDZ6bns/qNvXiTrx
	xSoi1NJ8o6qkkMDrlGl04a4jN54gI/U5MJDk4
X-Google-Smtp-Source: AGHT+IFq8kVq37MNUAjH9Q6myVE42MB00LVqimrYgoawu+grZEG8upkwKXnNYybcruxqIxH3d1HozSkgBqx+9rgCuS8=
X-Received: by 2002:a05:6512:1256:b0:535:6a34:b8c3 with SMTP id
 2adb3069b0e04-53b348b9fecmr8822368e87.5.1730217190707; Tue, 29 Oct 2024
 08:53:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241028101952.775731-1-dualli@chromium.org> <20241028101952.775731-2-dualli@chromium.org>
 <20241029071437.2381adea@kernel.org>
In-Reply-To: <20241029071437.2381adea@kernel.org>
From: Li Li <dualli@chromium.org>
Date: Tue, 29 Oct 2024 08:52:59 -0700
Message-ID: <CANBPYPiYAVDMeBUNRm8_wJojropMSL00UkGGV1ar+E3Y1STYfA@mail.gmail.com>
Subject: Re: [PATCH net-next v6 1/1] binder: report txn errors via generic netlink
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

On Tue, Oct 29, 2024 at 7:14=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon, 28 Oct 2024 03:19:51 -0700 Li Li wrote:
> > +                     report.err =3D BR_ONEWAY_SPAM_SUSPECT;
> > +                     report.from_pid =3D proc->pid;
> > +                     report.from_tid =3D thread->pid;
> > +                     report.to_pid =3D target_proc ? target_proc->pid =
: 0;
> > +                     report.to_tid =3D target_thread ? target_thread->=
pid : 0;
> > +                     report.reply =3D reply;
> > +                     report.flags =3D tr->flags;
> > +                     report.code =3D tr->code;
> > +                     report.data_size =3D tr->data_size;
> > +                     binder_genl_send_report(context, &report, sizeof(=
report));
>
> Could you break this struct apart into individual attributes?
> Carrying binary structs in netlink has been done historically
> but we moved away from it. It undermines the ability to extend
> the output and do automatic error checking.

Sure!

>
> BTW if you would like to keep using the uapi/linux/android directory
> feel free to add this as the first patch of the series:
> https://github.com/kuba-moo/linux/commit/73fde49060cd89714029ccee5d37dcc3=
7b8291f6

Awesome. Thank you for the patch!
