Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33F11F470E
	for <linux-doc@vger.kernel.org>; Mon, 21 Oct 2024 19:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729538644; cv=none; b=daHSYItbsuTZe7MbJulGNbS6R/ArnBREW1qn12Z5rnST5xtuaA5CyJQEKtzSb3L/z0J8iIjguY3SOw4Ppl/2U8Uf3ZZN5tpHO7j79yAJHrSMIbzcscFfmA73Xjt9K0rrz9wso06LC/27xPJniOy3EG/b1XV9wBlbUBSKmNjMw5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729538644; c=relaxed/simple;
	bh=f3FOaSwIPruhb+SlwowJzP27StIei3zqpQRh82uyKs4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rubNc031syTg8GSu2r7iGSbijE/ytsVRrNVfJShakZEtbSy18dOgMg2MMYZ1Nv6vPaF0rWW8OjJuRMZBH/aIMkOKF0AQ0hPCvS4cMOV4ow39yxjHrhXIuzf+lPD4/X3IA8B2rMZchwOjg5DjmHWzRaHm7LpP9iiDYmtmbT31jxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K3Mc4KPa; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K3Mc4KPa"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539e63c8678so5869563e87.0
        for <linux-doc@vger.kernel.org>; Mon, 21 Oct 2024 12:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729538641; x=1730143441; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3FOaSwIPruhb+SlwowJzP27StIei3zqpQRh82uyKs4=;
        b=K3Mc4KPagRVjySxT9sxPigJ4cQydp03rp+p1GomJCN89urbXQ8Nz4/gjw7VD1Ll2Oy
         L9arl5+yolZPcOGEUFecxgYawVGYHg2dRBLyCcP/dY6VPEu1Vsx8B6/o8CNUI4JQTG+i
         wZI3WhLF6+3YP674IcT1cuv00wbrAwf42sdJ15hoHBCiIidoUqekTngel01atxac1Inq
         6rYvyNkvHcC4p6+s3UZplnyWkYblPN3UbkYvofLeiYAdjPnmJqw4jT2aProx0C5fWjCJ
         WHIVO8MEMLcON+4I+SSGJIASaV8Y8+0Js93gseiLYlB0i8inp9yl8x0H/PUYtruISyA1
         lKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729538641; x=1730143441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3FOaSwIPruhb+SlwowJzP27StIei3zqpQRh82uyKs4=;
        b=Yjh8a/YLzdPiydFsHj1i+iLpgkfkmRX9Sd9xw91hhLnPcxRh6LTJEneNS2PH27V2tv
         jcfosUUdJEBaKMcYuSZkc0ToHysstY/bZiNJRBrASQBQgJhYi6HOh6USX8v1b2iaMm6l
         U+86Qgzisj6nkT2HZTkbsZw6XBEqyPZe/F8nxNKdWC3G5xYZcTY1qGs4wcAgEC77cpZB
         9yyhN3ydUNzAfR0cFOl73vzcNPued5hD2ocIuicHb0ze9T1udeyo8o3cq+uM8rdQGAaE
         hXTVySDGnqTbpMZ29Yi03Zab+f95Ay0WQSWYwoKE035BydR6RlIc7RfhiKzViq6NqHum
         YrAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXN6HXHl+5QqmW1Z8C0S1A6/uJXVmnJPEILX5oqmEmgDx7kfc6foe5GjMvMmmu7I7vZb13Pbmtc38U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD+fnC20ejab5sGg3KkqGHwKPQlEAqRjvEHd9JYniLJgGhbsrL
	MY/BpBfSxjceC8nFebEh2lNTvM/iKRP0F6x1Aka6WZI4cxkibhc8/4CE9CGNoKFejXeiI7dhFRK
	A/mYEe1Peb4b8LNJpYZm+sp3sVTb5MFTg6S4G
X-Google-Smtp-Source: AGHT+IFRh1XbNg+j/0ewusaGewVZkzNsIsMX6w9/LexlTO/szwAeGbvnPYVeCPp13s4+dp9CMTE3gxCPLcyFJ7YCXQY=
X-Received: by 2002:a05:6512:2803:b0:536:54fd:275b with SMTP id
 2adb3069b0e04-53a155088cfmr5843319e87.54.1729538640575; Mon, 21 Oct 2024
 12:24:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241021182821.1259487-1-dualli@chromium.org> <20241021182821.1259487-2-dualli@chromium.org>
 <CA+xfxX5ygyuaSwP7y-jEWqMLAYR6vP_Wg0CBJb+TcL1nsDJQ-Q@mail.gmail.com> <2024102102-much-doormat-cba1@gregkh>
In-Reply-To: <2024102102-much-doormat-cba1@gregkh>
From: Li Li <dualli@google.com>
Date: Mon, 21 Oct 2024 12:23:48 -0700
Message-ID: <CA+xfxX5UiQuTLnNqXuJvz8geB-K31_6QfSffn5LeXmSiQeM4gw@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] binder: report txn errors via generic netlink
To: Greg KH <gregkh@linuxfoundation.org>
Cc: corbet@lwn.net, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, donald.hunter@gmail.com, arve@android.com, 
	tkjos@android.com, maco@android.com, joel@joelfernandes.org, 
	brauner@kernel.org, cmllamas@google.com, surenb@google.com, arnd@arndb.de, 
	masahiroy@kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	netdev@vger.kernel.org, hridya@google.com, smoreland@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2024 at 11:56=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Mon, Oct 21, 2024 at 11:35:57AM -0700, Li Li wrote:
> > Sorry, please ignore this outdated and duplicated patch [1/1]. The
> > correct one is
> >
> > https://lore.kernel.org/lkml/20241021182821.1259487-1-dualli@chromium.o=
rg/T/#m5f8d7ed4333ab4dc7f08932c01bb413e540e007a
>
> Please send a v4 in a day or so when it's fixed up, as our tools can't
> figure this out (and neither can I manually...)
>

Fixed and sent v4 (link below). Thank you very much!

https://lore.kernel.org/lkml/20241021191233.1334897-1-dualli@chromium.org/
