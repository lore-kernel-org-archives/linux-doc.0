Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BDD262BB
	for <linux-doc@vger.kernel.org>; Thu, 12 Oct 2023 16:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vrzvn0UO"
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30180C6;
	Thu, 12 Oct 2023 09:53:49 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-d81d09d883dso1323841276.0;
        Thu, 12 Oct 2023 09:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697129628; x=1697734428; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YEO2sX1644pceOCmBcjKjNP7tzfloEulvFa61W15NE=;
        b=Vrzvn0UOqTDkhs932FErDcZ84wEhSS/5wFfaQnd0Vl1pthX1RmXVDjUqLURoJtgILj
         lKnz1oCHgkJt7SXNadwAiLctNEu+6YJD/akcNC6KK5tlniOlKMiFMD/jMJoESCDvP0It
         vX/AKzCV6ADUXNJv+e4pUk1fAHWBQs3rkZAubfehyLxJJb4dDFMPh5KQ9T4YjouflH5c
         uzP8SO5AfAmBNJXQi4eO9s/uaW70L0N0yMUHPWTmorhPXKFORl4gWY20CZg5FxwNRrlQ
         pgTUSh+pXs6otssvywKdBCn3VYxFC6acl73AVRjNcGwm5WzjPNaYVZu0WcqnzBiu/IQ0
         1N/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697129628; x=1697734428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4YEO2sX1644pceOCmBcjKjNP7tzfloEulvFa61W15NE=;
        b=Cefu9QLU6DVROdfLP+HngvXVSnt+KcxY/Cp0TzbXe9cZE3ed4c9mgeISYJxPlzWpu9
         z5asejn7B7D1vpmxfuAg2MD+BBDPDVrfeCoUREntcWmKimGCfEUpvb5lNpGmfTqC/y5j
         H4q35IcLuAhQHQIacf3VeWMT03EsJKspd8BSo0zaZRtpxnSB8yv9Drg1NvHS6g9nPTrb
         Son7tf+SkDH6Ra/7NLYcKFjJ1Wgw1Pu8wJ/9EOZn/w9yughznf75r/eLKcaUT76wANoh
         53auAG8ab0Pa2TXJsULo/Ekss8s9vHvjoZAt8vaSOFGmMQRxFZfr8fYiefmPXZ/0aNOv
         HZGw==
X-Gm-Message-State: AOJu0YyErqysz+V+FRM56g4STHa9D0FqVwwtrVFMDyVSnYSdZEoG3nus
	ET0P73dJ2aYR1jFyk1F2UJ2GSVBgf/mRrpEWzBQrhATQqoPggyoB
X-Google-Smtp-Source: AGHT+IGslQv6Y0IoJqXSCrmVs66RJC9r/My3WLXN2jblL1vhxvdvCgYI08ytpQwY9A2IPEFzHgyP1C1wkz8RDc1LCCo=
X-Received: by 2002:a5b:ccc:0:b0:d92:13fc:c940 with SMTP id
 e12-20020a5b0ccc000000b00d9213fcc940mr18893672ybr.9.1697129628287; Thu, 12
 Oct 2023 09:53:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <65271731e25f4_7258329472@dwillia2-xfh.jf.intel.com.notmuch>
 <20231012115039.1680561-1-ojeda@kernel.org> <e212997cf8b05608718fb6ac1766c390255664ac.camel@perches.com>
In-Reply-To: <e212997cf8b05608718fb6ac1766c390255664ac.camel@perches.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Oct 2023 18:53:37 +0200
Message-ID: <CANiq72nr88=r-rackE7+DBAxg8VYy8LYO9D2h0vnxbAoSXFFSQ@mail.gmail.com>
Subject: Re: [PATCH v3] Documentation/process/coding-style.rst: space around const
To: Joe Perches <joe@perches.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, dan.j.williams@intel.com, corbet@lwn.net, 
	gregkh@linuxfoundation.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@roeck-us.net, max.kellermann@ionos.com, 
	workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, Oct 12, 2023 at 4:48=E2=80=AFPM Joe Perches <joe@perches.com> wrote=
:
>
> Do older versions of clang-format ignore entries
> they don't understand?

Sadly, no, that is the reason we keep it at the minimum.

However, I just took a look again at it, and I see that such support
was added to LLVM 12, the `--Wno-error=3Dunknown` flag in commit
f64903fd8176 ("Add -Wno-error=3Dunknown flag to clang-format.").

So this means that the minimum is bumped to 12, we could in principle
use newer options.

I think the downsides are that users will need to pass the flag
(potentially in e.g. their IDE or similar) and that formatting could
be potentially chaotic depending on the options ignored. I guess
particular subsystems could agree on which version to use.

Cheers,
Miguel
